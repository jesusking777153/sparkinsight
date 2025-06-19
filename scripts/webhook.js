// Make.com GitHub Webhook 핸들러
// 이 스크립트는 GitHub 파일 변경 시 Make.com 시나리오를 트리거합니다

const MAKE_WEBHOOK_URL = "https://hook.integromat.com/YOUR_WEBHOOK_URL";

// GitHub Webhook 페이로드 처리
function handleGitHubWebhook(payload) {
    const { repository, commits, ref } = payload;
    
    // main 브랜치 변경만 처리
    if (ref !== 'refs/heads/main') {
        return { status: 'ignored', reason: 'Not main branch' };
    }
    
    // 변경된 파일 목록 추출
    const changedFiles = [];
    commits.forEach(commit => {
        changedFiles.push(...commit.added, ...commit.modified);
    });
    
    // 처리할 파일 타입 필터링
    const relevantFiles = changedFiles.filter(file => {
        return file.endsWith('.csv') || 
               file.endsWith('.json') || 
               file.endsWith('.md') ||
               file.startsWith('content/drafts/');
    });
    
    if (relevantFiles.length === 0) {
        return { status: 'ignored', reason: 'No relevant files changed' };
    }
    
    // Make.com 시나리오 트리거
    return triggerMakeScenario(relevantFiles, repository);
}

// Make.com 시나리오 실행
async function triggerMakeScenario(files, repository) {
    const payload = {
        event: 'github_file_change',
        repository: repository.full_name,
        files: files,
        timestamp: new Date().toISOString(),
        action: determineAction(files)
    };
    
    try {
        const response = await fetch(MAKE_WEBHOOK_URL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(payload)
        });
        
        return {
            status: 'success',
            makeResponse: await response.json(),
            processedFiles: files.length
        };
    } catch (error) {
        return {
            status: 'error',
            error: error.message
        };
    }
}

// 파일 변경에 따른 액션 결정
function determineAction(files) {
    if (files.some(f => f.endsWith('keywords.csv'))) {
        return 'generate_bulk_posts';
    } else if (files.some(f => f.endsWith('products.json'))) {
        return 'update_product_links';
    } else if (files.some(f => f.startsWith('content/drafts/'))) {
        return 'process_draft';
    } else if (files.some(f => f.endsWith('.md'))) {
        return 'convert_markdown';
    }
    return 'general_process';
}

// 사용 예시
/*
GitHub Webhook 설정:
1. Repository Settings → Webhooks
2. Add webhook
3. Payload URL: 이 스크립트를 호스팅하는 URL
4. Content type: application/json
5. Events: Push events
*/

module.exports = {
    handleGitHubWebhook,
    triggerMakeScenario
};
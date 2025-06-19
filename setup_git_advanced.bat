@echo off
chcp 65001 > nul
echo ========================================
echo    🚀 GitHub 블로그 자동화 고급 설정
echo ========================================
echo.

cd /d "C:\Users\hosae\Desktop\blog-automation"

echo 📂 현재 디렉토리: %CD%
echo.

echo 1️⃣ Git 초기화...
git init
if errorlevel 1 goto error

echo 2️⃣ .gitignore 생성...
(
echo node_modules/
echo .env
echo *.log
echo .DS_Store
echo Thumbs.db
echo .vscode/
echo dist/
echo build/
echo *.tmp
echo *.temp
) > .gitignore

echo 3️⃣ 원격 저장소 연결...
echo GitHub Repository URL을 입력하세요:
echo 예: https://github.com/username/blog-automation-advanced.git
set /p REPO_URL=

if "%REPO_URL%"=="" (
    echo ❌ Repository URL이 입력되지 않았습니다.
    goto end
)

git remote add origin %REPO_URL%
if errorlevel 1 (
    echo ⚠️ 원격 저장소가 이미 설정되어 있을 수 있습니다. 업데이트합니다...
    git remote set-url origin %REPO_URL%
)

echo 4️⃣ 모든 파일 추가...
git add .
if errorlevel 1 goto error

echo 5️⃣ 커밋...
git commit -m "🚀 초기 설정: GitHub + Make.com 고급 블로그 자동화 시스템 v2.0

✨ 주요 기능:
- AI 기반 콘텐츠 자동 생성
- GitHub Webhook 연동
- 20250619 최종 지침 100%% 적용
- 키워드 → 블로그 자동화
- 상품 → 리뷰 자동화
- 완전 무인 운영 시스템

📊 포함된 데이터:
- 키워드 20개 (우선순위별)
- 상품 정보 5개
- 블로그 템플릿
- Make.com 연동 스크립트

🔧 설정 완료: %date% %time%"

if errorlevel 1 goto error

echo 6️⃣ 원격 저장소에 푸시...
git push -u origin main
if errorlevel 1 (
    echo ⚠️ main 브랜치가 없을 수 있습니다. master로 시도합니다...
    git push -u origin master
    if errorlevel 1 goto error
)

echo.
echo ✅ 업로드 완료!
echo ========================================
echo    🎉 설정 성공!
echo ========================================
echo.
echo 📋 다음 단계:
echo 1. GitHub Repository → Settings → Webhooks
echo 2. Make.com 시나리오 Import
echo 3. 첫 테스트 실행
echo.
echo 🔗 Repository: %REPO_URL%
echo 📁 로컬 경로: %CD%
echo.
goto end

:error
echo ❌ 오류가 발생했습니다.
echo 💡 해결 방법:
echo 1. GitHub Desktop 사용
echo 2. 수동 업로드 (드래그&드롭)
echo 3. Git 재설치

:end
echo 계속하려면 아무 키나 누르세요...
pause > nul
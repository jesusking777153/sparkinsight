@echo off
echo ========================================
echo    GitHub Blog Automation 설정
echo ========================================
echo.

cd /d "C:\Users\hosae\Desktop\blog-automation"

echo 1. Git 초기화...
git init

echo 2. 원격 저장소 연결...
echo GitHub Repository URL을 입력하세요 (예: https://github.com/username/blog-automation.git):
set /p REPO_URL=
git remote add origin %REPO_URL%

echo 3. 모든 파일 추가...
git add .

echo 4. 첫 커밋...
git commit -m "🚀 초기 설정: GitHub + Make.com 블로그 자동화 시스템"

echo 5. 원격 저장소에 푸시...
git push -u origin main

echo.
echo ========================================
echo    설정 완료! 
echo ========================================
echo.
echo 다음 단계:
echo 1. GitHub Repository에서 Settings → Webhooks 설정
echo 2. Make.com에서 GitHub 모듈 연결
echo 3. keywords.csv 수정 후 Push 테스트
echo.
echo Webhook URL: https://hook.integromat.com/YOUR_WEBHOOK_URL
echo.
pause
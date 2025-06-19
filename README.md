# 🚀 Blog Automation with GitHub + Make.com

AI 기반 블로그 자동화 시스템 - GitHub 연동으로 완전 자동화 달성!

## 📋 프로젝트 개요

이 프로젝트는 **GitHub Repository**와 **Make.com**을 연동하여 블로그 콘텐츠를 완전 자동화하는 시스템입니다.

### ✨ 주요 기능

- 🔄 **자동 콘텐츠 생성**: CSV 키워드 → AI 블로그 글 자동 생성
- 📊 **데이터 기반 처리**: JSON 상품 정보 → 자동 리뷰 작성
- 🔗 **실시간 연동**: GitHub Push → Make.com 트리거 → WordPress 업로드
- 💾 **버전 관리**: 모든 콘텐츠와 설정의 완벽한 백업
- 🎯 **SEO 최적화**: 20250619 최종 지침 기반 자동 최적화

## 📂 폴더 구조

```
blog-automation/
├── content/
│   ├── drafts/           # 초안 파일들 (.md)
│   ├── published/        # 발행된 글 백업
│   └── template.md       # 블로그 템플릿
├── data/
│   ├── keywords.csv      # 키워드 데이터베이스
│   ├── products.json     # 상품 정보 데이터
│   └── analytics.json    # 성과 분석 데이터
├── scripts/
│   ├── webhook.js        # GitHub-Make.com 연동 스크립트
│   └── utils.js          # 유틸리티 함수들
└── README.md             # 이 파일
```

## 🔧 설정 방법

### 1. GitHub Repository 설정

1. 이 Repository를 Fork 또는 Clone
2. GitHub Settings → Webhooks 설정
3. Make.com Webhook URL 등록

### 2. Make.com 시나리오 설정

1. GitHub 모듈 추가
2. OpenAI 연동 설정
3. WordPress 연결 설정
4. Google Sheets 로그 연결

### 3. 자동화 트리거 설정

| 파일 변경 | 자동 실행 작업 |
|-----------|----------------|
| `keywords.csv` | 대량 블로그 글 생성 |
| `products.json` | 상품 리뷰 업데이트 |
| `drafts/*.md` | 마크다운 → 워드프레스 변환 |

## 🚀 사용법

### 키워드 기반 자동 생성

1. `data/keywords.csv`에 새 키워드 추가
2. GitHub에 Push
3. 자동으로 Make.com 시나리오 실행
4. WordPress에 완성된 글 업로드

### 상품 리뷰 자동 업데이트

1. `data/products.json`에 상품 정보 추가/수정
2. GitHub에 Push
3. 자동으로 리뷰 글 생성 및 업데이트

### 수동 초안 작성

1. `content/drafts/`에 `.md` 파일 작성
2. 템플릿 변수 사용 ({{KEYWORD}}, {{TITLE}} 등)
3. GitHub에 Push
4. 자동으로 AI가 내용 보완 후 WordPress 업로드

## 📊 데이터 구조

### keywords.csv

```csv
키워드,검색량,경쟁도,트렌드,카테고리,우선순위
여름 딸기,5000,중간,상승,건강/식품,1
노트북 추천,8000,높음,안정,IT/전자,2
```

### products.json

```json
{
  "products": [
    {
      "id": 1,
      "name": "제품명",
      "category": "카테고리",
      "price": 100000,
      "coupang_url": "링크",
      "keywords": ["키워드1", "키워드2"],
      "description": "제품 설명"
    }
  ]
}
```

## 🎯 Make.com 시나리오 구성

```
GitHub Webhook → 파일 변경 감지
      ↓
파일 타입 분석 → 적절한 AI 프롬프트 선택
      ↓
OpenAI 처리 → SEO 최적화 블로그 글 생성
      ↓
WordPress 업로드 → 임시저장 또는 즉시 발행
      ↓
Google Sheets 로그 → 작업 기록 저장
```

## 📈 성과 지표

### 자동화 효과
- ⏰ **시간 절약**: 95% (3시간 → 10분)
- 📝 **글 품질**: SEO 최적화 + 인간적 글쓰기
- 🔄 **일관성**: 항상 동일한 고품질 유지
- 💰 **비용**: GitHub 무료 + Make.com 기존 플랜

### 목표 KPI
- 검색 순위: 1-3위
- 체류 시간: 5분 이상
- 전환율: 5% 이상
- 월 포스팅: 자동 60개+

## 🛠️ 기술 스택

- **GitHub**: 버전 관리 + 트리거
- **Make.com**: 자동화 워크플로우
- **OpenAI GPT-4**: AI 콘텐츠 생성
- **WordPress**: 블로그 플랫폼
- **Google Sheets**: 데이터 로깅
- **Markdown**: 콘텐츠 포맷

## 🔗 연관 링크

- [Make.com 시나리오](https://us2.make.com/474152/scenarios)
- [워드프레스 사이트](https://kormeme.com)
- [지침서 다운로드](https://alphagogogo-t560mxu.gamma.site/)

## 📞 문의 및 지원

- 📧 이메일: your@email.com
- 💬 GitHub Issues 활용
- 📺 YouTube 튜토리얼: 구독 링크

## 📄 라이센스

MIT License - 자유롭게 사용하고 수정하세요!

---

**🎉 이제 GitHub Push 한 번으로 블로그가 알아서 자동 업데이트됩니다!**

마지막 업데이트: 2025-06-20
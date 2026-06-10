# 🔥 X-FCOLS APK BUILDER 🔥

**By Emakloewe & Yuzi Dev**

Automated APK Builder using GitHub Actions

## 📋 Prerequisites

1. GitHub Repository with Actions enabled
2. Telegram Bot Token
3. Android SDK (provided by runner)

## 🔧 Setup

### 1. Add Secrets to GitHub Repository

Go to `Settings > Secrets and variables > Actions` and add:

| Secret Name | Value |
|-------------|-------|
| `BOT_TOKEN` | Your Telegram Bot Token |

### 2. Trigger Workflow

Use GitHub API or GitHub CLI:

```bash
gh workflow run build.yml -f build_type=release -f file_url=<URL> -f user_id=<ID>

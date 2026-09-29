#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Setup git configuration for HisabOS dual-AI workflow
#>

param(
    [string]$GitHubUsername = $(Read-Host "GitHub username"),
    [string]$GitHubEmail    = $(Read-Host "GitHub email (for commits)")
)

Write-Host "🔧 Setting up Git for HisabOS..." -ForegroundColor Cyan

# 1. Configure user
git config user.name "$GitHubUsername"
git config user.email "$GitHubEmail"
Write-Host "✅ User configured: $GitHubUsername <$GitHubEmail>"

# 2. Set commit template
git config commit.template .gitmessage
Write-Host "✅ Commit template set (.gitmessage)"

# 3. Default branch name
git config init.defaultBranch main
Write-Host "✅ Default branch: main"

# 4. Useful aliases
git config alias.co checkout
git config alias.br branch
git config alias.ci commit
git config alias.st status
git config alias.unstage 'reset HEAD --'
git config alias.last 'log -1 HEAD'
git config alias.lg "log --oneline --graph --decorate --all -20"
git config alias.wip 'commit --no-verify -m "wip: $(date +%F_%H-%M)"'
Write-Host "✅ Git aliases configured"

# 5. Push behavior
git config push.default simple
git config push.autoSetupRemote true
Write-Host "✅ Push behavior: simple + autoSetupRemote"

# 6. Line endings (Windows)
git config core.autocrlf true
Write-Host "✅ Line endings: autocrlf true"

# 7. Create initial commit if needed
if (-not (Test-Path ".git")) {
    git init
    Write-Host "✅ Git initialized"
}

if (-not (git rev-parse --verify HEAD 2>$null)) {
    git add .
    git commit -m "chore: initial HisabOS Flutter project"
    Write-Host "✅ Initial commit created"
}

# 8. Show current status
Write-Host "`n📋 Current git status:" -ForegroundColor Yellow
git status --short
Write-Host "`n📝 Recent commits:" -ForegroundColor Yellow
git log --oneline -5

Write-Host "`n🎯 Next steps:" -ForegroundColor Green
Write-Host "  1. Create private repo on GitHub: gh repo create hisabos --private --source=. --push"
Write-Host "  2. Enable branch protection on main (see BRANCH_PROTECTION.md)"
Write-Host "  3. Share this prompt with Codex/OpenCode:"
Write-Host "     'Work on branch codex/<feature> or opencode/<feature>, never main. PR to merge.'"
Write-Host "`n✨ Done!"
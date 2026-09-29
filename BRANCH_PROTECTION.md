# Branch Protection Setup for HisabOS

## 🔒 GitHub Branch Protection Rules (Required)

Go to: **Settings → Branches → Add rule** → Branch name pattern: `main`

### Required Settings:

| Setting | Value | Why |
|---------|-------|-----|
| **Require a pull request before merging** | ✅ ON | Enforces PR workflow |
| **Require approvals** | 1 | At least one review |
| **Dismiss stale PR approvals when new commits are pushed** | ✅ ON | Force re-review on changes |
| **Require review from Code Owners** | ✅ ON | Use CODEOWNERS file |
| **Require status checks to pass before merging** | ✅ ON | CI must pass |
| **Status checks required** | `Analyze & Test` | From CI workflow |
| **Require branches to be up to date before merging** | ✅ ON | Prevent stale merges |
| **Require linear history** | ✅ ON | Clean history, no merge commits |
| **Require signed commits** | ❌ OFF | Optional, adds friction |
| **Lock branch** | ❌ OFF | Not needed with above rules |
| **Do not allow bypassing the above settings** | ✅ ON | Even admins must follow |

### Additional:

| Setting | Value |
|---------|-------|
| **Restrict pushes that create files** | ✅ ON |
| **Restrict pushes that delete files** | ✅ ON |
| **Restrict pushes that modify files** | ✅ ON |

---

## 📄 CODEOWNERS File

Create `.github/CODEOWNERS`:

```
# Global owners (admins)
* @your-github-username

# Feature-specific (optional)
/lib/features/auth/ @your-github-username
/lib/features/transactions/ @your-github-username
/lib/features/budget/ @your-github-username
```

---

## 🤖 Auto-merge (Optional)

If you trust CI completely:

**Settings → General → Pull Requests → Allow auto-merge** ✅ ON

Then in PR: "Enable auto-merge" → merges when all checks pass.

---

## 🚫 What NOT to do

| Anti-pattern | Why bad |
|--------------|---------|
| Commit directly to `main` | Bypasses review, CI |
| Force push to `main` | Rewrites history, breaks others |
| Long-lived branches (>3 days) | Merge conflicts, stale code |
| Skip CI on "small" changes | Bugs slip through |

---

## ✅ Quick Commands for AI Agents

```bash
# Before starting ANY work
git checkout main
git pull origin main

# Create feature branch
git checkout -b opencode/add-budget-screen
# or
git checkout -b codex/fix-transaction-sort

# Work, commit, push
git add .
git commit -m "feat(budget): add monthly budget screen"
git push -u origin opencode/add-budget-screen

# Create PR via GitHub CLI (or web UI)
gh pr create --title "feat(budget): add monthly budget screen" --body "..."

# After PR merged + deleted branch
git checkout main
git pull
git branch -d opencode/add-budget-screen
```

---

## 🔄 Syncing Between AI Agents

```bash
# If OpenCode pushed codex branch, Codex pulls it:
git fetch origin
git checkout codex/some-feature
git pull origin codex/some-feature

# Continue working...
```

---

**Run once:** `./setup-git.ps1` → creates repo, pushes to GitHub, enables protection.

Then share the **AI prompt** (from previous message) with both Codex and OpenCode.
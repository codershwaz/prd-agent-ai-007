# Git Setup, Daily Workflow & Troubleshooting Guide

This reference document covers the **daily workflow for pushing code changes** to GitHub, as well as the **troubleshooting solutions** for initial setup errors.

---

## 🚀 Daily Workflow: How to Push New Changes

Whenever you modify existing files (e.g., editing `main.py` or `README.md`) or create new files in your project, follow these 3 steps to sync your updates with GitHub.

### Quick Commands Cheat Sheet

```cmd
git status
git add .
git commit -m "Update main.py file"
git push
```

---

### Step-by-Step Breakdown

#### Step 1: Check Modified Files
Verify which files were modified, created, or deleted in your workspace:
```cmd
git status
```
*Output example:*
```text
Changes not staged for commit:
        modified:   deploy-ai-agent/backend/src/main.py
```

#### Step 2: Stage Your Changes
Add your modified files to the Git staging area:
* **Stage ALL modified and new files:**
  ```cmd
  git add .
  ```
* **Or stage a specific file only:**
  ```cmd
  git add deploy-ai-agent/backend/src/main.py
  ```

#### Step 3: Commit Your Changes
Create a local snapshot with a clear message describing what you changed:
```cmd
git commit -m "Update main.py file"
```
*Output example:*
```text
[main 0515b40] Update main.py file
 1 file changed, 1 insertion(+), 1 deletion(-)
```

#### Step 4: Push to GitHub
Upload your local commit to your remote GitHub repository:
```cmd
git push
```
*Output example:*
```text
Enumerating objects: 11, done.
Counting objects: 100% (11/11), done.
Writing objects: 100% (6/6), 559 bytes | 279.00 KiB/s, done.
To https://github.com/codershwaz/deploy-ai-agent-007.git
   ac531f3..0515b40  main -> main
```

---

## 🛠️ Initial Repository Setup & Troubleshooting

### 1. Pager Error (`unable to execute pager 'less'`)
* **Problem:** Running `git branch` or `git log` failed because `less` is missing in Windows CMD.
* **Fix:** Configured Git to use `cat` instead:
  ```cmd
  git config core.pager cat
  ```

### 2. Refspec Error (`error: src refspec main does not match any`)
* **Problem:** `git push` failed because branch refs (`main` or `master`) do not exist until the **first commit** is created.
* **Fix:** Staged files and created the initial commit to initialize the `main` branch.

### 3. Nested Git Submodule Error (`'deploy-ai-agent/' does not have a commit checked out`)
* **Problem:** `git add .` failed because the subfolder `deploy-ai-agent` had its own uncommitted `.git` folder.
* **Fix:** Removed the nested `.git` directory so the root repository tracks all files:
  ```powershell
  Remove-Item -Recurse -Force deploy-ai-agent\.git
  ```

### 4. Added `.gitignore` File
Created a `.gitignore` file to ignore Python cache files (`__pycache__`), environment files, and IDE configs:
```gitignore
# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python

# Environments
.env
.venv
env/
venv/
ENV/
.env.sample

# IDE / OS
.vscode/
.idea/
.DS_Store
Thumbs.db
```

---

## 📋 Initial Setup Command Sequence

```cmd
# 1. Fix missing pager issue
git config core.pager cat

# 2. Remove nested .git directory from subfolder
Remove-Item -Recurse -Force deploy-ai-agent\.git

# 3. Set HTTPS remote URL (enables Git Credential Manager browser login)
git remote set-url origin https://github.com/codershwaz/deploy-ai-agent-007.git

# 4. Stage all repository files
git add .

# 5. Create initial commit
git commit -m "Initial commit"

# 6. Ensure default branch is main
git branch -M main

# 7. Push to GitHub
git push -u origin main
```

---

## 📌 Repository Information
* **Repository Remote URL:** `https://github.com/codershwaz/deploy-ai-agent-007.git`
* **Default Branch:** `main`

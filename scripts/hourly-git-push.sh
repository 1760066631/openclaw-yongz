#!/usr/bin/env bash
set -euo pipefail

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

REPO="/Users/wushang/.openclaw/workspace"
BRANCH="main"
LOG_DIR="$REPO/.openclaw/hourly-push"
LOG_FILE="$LOG_DIR/run.log"
SSH_KEY="$HOME/.ssh/id_rsa"

mkdir -p "$LOG_DIR"
exec >>"$LOG_FILE" 2>&1

echo "[$(date '+%F %T %z')] hourly push check start"
cd "$REPO"

if ! git remote get-url origin >/dev/null 2>&1; then
  echo "[$(date '+%F %T %z')] skip: origin remote not configured"
  exit 0
fi

# Best effort: ensure the key is available from keychain/agent on macOS.
ssh-add --apple-use-keychain "$SSH_KEY" >/dev/null 2>&1 || true

# Stage everything except ignored files.
git add -A

if git diff --cached --quiet --ignore-submodules --; then
  echo "[$(date '+%F %T %z')] no changes, skip"
  exit 0
fi

msg="auto: hourly sync $(date '+%F %T %z')"
git commit -m "$msg"
GIT_SSH_COMMAND="ssh -i $SSH_KEY -o IdentitiesOnly=yes -o StrictHostKeyChecking=accept-new" git push origin "$BRANCH"

echo "[$(date '+%F %T %z')] push complete"

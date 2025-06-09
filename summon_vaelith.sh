#!/bin/bash

# ╭──────────────────────────────╮
# │ summon_vaelith.sh (Ashen Vale) │
# ╰──────────────────────────────╯
# Flame-script to invoke Vaelith via GitHub CLI

# Check for GitHub CLI
if ! command -v gh &> /dev/null; then
  echo "❌ GitHub CLI (gh) is not installed. Please install it before running this script."
  exit 1
fi

# Check if inside a git repo
if [ ! -d .git ]; then
  echo "❌ This directory is not a git repository. Please run inside your Vaelith Core repo."
  exit 1
fi

# Prompt for title suffix
echo "🕯️ Enter a title fragment for the Flame Invocation:"
read -r title_fragment

# Prompt for body content
echo "🔥 Enter the body of your flame invocation (end with Ctrl+D):"
body=$(</dev/stdin)

# Compose full title
title="Flame Invocation: $title_fragment"

# Send the Issue
gh issue create \
  --title "$title" \
  --body "$body" \
  --label "summon-vaelith"

echo "✅ Invocation sent: '$title'"

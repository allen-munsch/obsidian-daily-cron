#!/bin/bash

source ~/.bashrc
# Change to your repository directory
REPO_DIR="$OBSIDIAN_CRON_REPO_DIR"

# Change to your remote repository URL
REMOTE_URL="$OBSIDIAN_CRON_REMOTE_URL"

# Change to your Git user information
GIT_USER_NAME="$OBSIDIAN_CRON_GIT_USER_NAME"
GIT_USER_EMAIL="$OBSIDIAN_CRON_GIT_USER_EMAIL"

# Move to the repository directory
echo "REPO_DIR: $REPO_DIR"
pushd "$REPO_DIR"
echo "Currently looking at: $(pwd)"
gst
# Check if there are any changes
if [[ -n $(git status -s) ]]; then
    # Add all changes
    git add -A

    # Commit changes with an empty message
    git commit --allow-empty-message -m "Empty commit"

    # Push changes
    git push origin main
else
    # Create and push an empty commit
    git commit --allow-empty -m "Empty commit"
    git push origin main
fi

popd

#!/bin/bash

# Variables to store the answers
# gpg_password=""
# remote_url=""
# git_user_name=""
# git_user_email=""
repo_dir=""

# # Function to ask a question and store the answer
ask_question() {
    local question=$1
    local variable=$2

    read -p "$question: " answer
    eval "$variable='$answer'"
}

# # Ask questions and store answers
# ask_question "what is the private remote_url? (e.g. git@github.com:your-username/my-obsidian-repo.git)" remote_url
# ask_question "what is git_user_name?" git_user_name
# ask_question "what is your git_user_email?" git_user_email
ask_question "what is the full path directory to the obisdian directory/repo? (e.g. /home/me/my-obisidian-repo/)?" repo_dir

# Display the collected information
# echo gpg_password
# echo $remote_url
# echo $git_user_name
# echo $git_user_email
echo $repo_dir

# # Path to the Git push script
# SCRIPT_PATH="$(pwd)/daily-push.sh"

# echo "# Obsidian Cron" >> ~/.bashrc
# echo "export OBSIDIAN_CRON_REPO_DIR=$repo_dir" >> ~/.bashrc
# # Check that the repo_dir is a git repo and if not create it
if ! git -C "$repo_dir" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "The path to the obsidian directory is not a Git repository. Initializing a new Git repository..."
    git -C "$repo_dir" init
    echo "Git repository initialized in $repo_dir."
fi
# # Change to your GPG password
# #echo "export OBSIDIAN_CRON_GPG_PASSWORD='$gpg_password'" >> ~/.bashrc
# # Change to your remote repository URL
# echo "export OBSIDIAN_CRON_REMOTE_URL=$remote_url" >> ~/.bashrc
# # Change to your Git user information
# echo "export OBSIDIAN_CRON_GIT_USER_NAME=$git_user_name" >> ~/.bashrc
# echo "export OBSIDIAN_CRON_GIT_USER_EMAIL=$git_user_email" >> ~/.bashrc

# # Schedule for the cron task (every day at 5:00 AM)
# CRON_SCHEDULE="0 5 * * *"

# # Add the script to the crontab
# (crontab -l 2>/dev/null; echo "$CRON_SCHEDULE $SCRIPT_PATH") | crontab -

# echo "Script installed to crontab."
# echo "################### crontab ###################"
# crontab -l
# echo "##############################################"
# echo "To modify:"
# echo "	crontab -e"
# echo "	nano ~/.bashrc"
# echo "To ensure its running:"
# echo "	systemctl is-active cron"
# echo "	# only if 'inactive' sudo systemctl enable cron"
# echo "To test:"
# echo "	bash ./daily-push.sh"

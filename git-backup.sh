#!/usr/bin/env bash

# v0.1 GHE 2024-05-31

# Configuration:
# Edit the values below to match your repository
github_token="github_pat_11..."
github_user="ABC"
github_repository="voron-v2.XYZ"

##################################

# set dotglob so that bash treats hidden files/folders starting with . correctly when copying them (ex. .themes from mainsail)
shopt -s dotglob

git_url="https://"$github_token"@github.com/"$github_user"/"$github_repository".git"

# Set the user
git config --global user.name "$(whoami)"
git config --global user.email "$(whoami)@$(hostname --short).local"

cd ~/printer_data/config

# Check if a .git exists, if not intialize the repository
if [ ! -d ".git" ]; then
    printf "printer-[0-9]*_[0-9]*.cfg\n.moonraker.conf.bkp" > .gitignore
    git init
    git add .
    git commit -m "Initialized Klipper Backup Repository"
    git branch -M master
    git remote add origin "$git_url"
    git push -u origin master
fi

# Check if remote origin changed (e.g. because of new token)
if [[ "$git_url" != $(git remote get-url origin) ]]; then
    git remote set-url origin "$git_url"
fi

# Untrack all files so that any new excluded files are correctly ignored and deleted from remote
git rm -r --cached . >/dev/null 2>&1
git add .
git commit -m "New backup from $(date +"%F %T")"
git push -u origin master

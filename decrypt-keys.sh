#!/usr/bin/env bash

# Check if ansible is installed
if ! command -v ansible &> /dev/null
then
    echo "ansible could not be found"
    exit
fi

ssh_keys=($(ls ssh/.ssh/ | grep ".pub" | sed -e 's/\.pub$//' -e "s|^|ssh/.ssh/|"))

ansible-vault decrypt ${ssh_keys[@]}
git update-index --skip-worktree ${ssh_keys[@]}

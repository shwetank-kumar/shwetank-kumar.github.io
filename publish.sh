#!/bin/bash

# Function to check if the previous command was successful
check_status() {
    if [ $? -ne 0 ]; then
        echo "Error: $1 failed"
        exit 1
    fi
}

# Run git commands
git add .
check_status "git add"

git commit -m "update about"
check_status "git commit"

git push origin main
check_status "git push"

# Run quarto publish and handle the prompt
echo "Running quarto publish gh-pages. You may be prompted for confirmation."
quarto publish gh-pages <<EOF
Y
EOF
check_status "quarto publish"

echo "All commands executed successfully!"
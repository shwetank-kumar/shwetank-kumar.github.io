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

# Run quarto publish and automatically answer Y to any prompt
yes Y | quarto publish gh-pages
check_status "quarto publish"

echo "All commands executed successfully!"
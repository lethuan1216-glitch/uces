#!/bin/bash
# UCES Session Initialization
# Detects project context and loads relevant information

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}[UCES]${NC} Initializing session..."

# Detect project type
detect_project() {
    if [ -f "app.json" ] && grep -q "expo" "app.json" 2>/dev/null; then
        echo "expo"
    elif [ -f "next.config.js" ] || [ -f "next.config.ts" ] || [ -f "next.config.mjs" ]; then
        echo "nextjs"
    elif [ -f "package.json" ]; then
        if grep -q '"react-native"' package.json 2>/dev/null; then
            echo "react-native"
        elif grep -q '"react"' package.json 2>/dev/null; then
            echo "react"
        elif grep -q '"express"' package.json 2>/dev/null; then
            echo "express"
        else
            echo "node"
        fi
    elif [ -f "requirements.txt" ] || [ -f "pyproject.toml" ]; then
        echo "python"
    elif [ -f "go.mod" ]; then
        echo "go"
    elif [ -f "Cargo.toml" ]; then
        echo "rust"
    else
        echo "unknown"
    fi
}

PROJECT_TYPE=$(detect_project)

# Display project info
echo -e "${GREEN}Project:${NC} $PROJECT_TYPE"

# Git status
if [ -d ".git" ]; then
    BRANCH=$(git branch --show-current 2>/dev/null || echo "detached")
    CHANGES=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')

    echo -e "${GREEN}Branch:${NC} $BRANCH"

    if [ "$CHANGES" -gt 0 ]; then
        echo -e "${YELLOW}Changes:${NC} $CHANGES uncommitted"
    fi

    # Recent commits
    echo -e "${GREEN}Recent:${NC}"
    git log --oneline -3 2>/dev/null | sed 's/^/  /'
fi

# Load session memory if exists
MEMORY_FILE="$HOME/.claude/memory/$(pwd | md5sum | cut -d' ' -f1).json"
if [ -f "$MEMORY_FILE" ]; then
    echo -e "${BLUE}[UCES]${NC} Previous session learnings loaded"
fi

echo ""

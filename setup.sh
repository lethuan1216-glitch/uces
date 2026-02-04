#!/bin/bash
# UCES Installation Script
# Universal Claude Enhancement System

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}"
echo "╔═══════════════════════════════════════════╗"
echo "║     UCES - Universal Claude Enhancement   ║"
echo "║              System Installer             ║"
echo "╚═══════════════════════════════════════════╝"
echo -e "${NC}"

CLAUDE_DIR="$HOME/.claude"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create directories
echo -e "${BLUE}[1/5]${NC} Creating directories..."
mkdir -p "$CLAUDE_DIR/skills"
mkdir -p "$CLAUDE_DIR/hooks"
mkdir -p "$CLAUDE_DIR/modules"
mkdir -p "$CLAUDE_DIR/memory"

# Backup existing files
if [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
    echo -e "${YELLOW}[!]${NC} Backing up existing CLAUDE.md..."
    cp "$CLAUDE_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md.backup.$(date +%Y%m%d%H%M%S)"
fi

if [ -f "$CLAUDE_DIR/settings.json" ]; then
    echo -e "${YELLOW}[!]${NC} Backing up existing settings.json..."
    cp "$CLAUDE_DIR/settings.json" "$CLAUDE_DIR/settings.json.backup.$(date +%Y%m%d%H%M%S)"
fi

# Copy core files
echo -e "${BLUE}[2/5]${NC} Installing core configuration..."
cp "$SCRIPT_DIR/CLAUDE.md" "$CLAUDE_DIR/"
cp "$SCRIPT_DIR/CONVENTIONS.md" "$CLAUDE_DIR/"
cp "$SCRIPT_DIR/config.json" "$CLAUDE_DIR/settings.json"

# Copy skills
echo -e "${BLUE}[3/5]${NC} Installing skill modules..."
cp -r "$SCRIPT_DIR/skills/"* "$CLAUDE_DIR/skills/"

# Copy hooks
echo -e "${BLUE}[4/5]${NC} Installing automation hooks..."
cp "$SCRIPT_DIR/hooks/"* "$CLAUDE_DIR/hooks/"

# Set permissions
echo -e "${BLUE}[5/5]${NC} Setting permissions..."
chmod +x "$CLAUDE_DIR/hooks/"*.sh

# Verify installation
echo ""
echo -e "${GREEN}Installation complete!${NC}"
echo ""
echo "Installed components:"
echo -e "  ${GREEN}✓${NC} Core configuration (CLAUDE.md, CONVENTIONS.md)"
echo -e "  ${GREEN}✓${NC} Settings (settings.json)"
echo -e "  ${GREEN}✓${NC} Skill modules:"
for skill in "$CLAUDE_DIR/skills/"*/; do
    skill_name=$(basename "$skill")
    echo -e "      - $skill_name"
done
echo -e "  ${GREEN}✓${NC} Automation hooks"

echo ""
echo -e "${BLUE}Next steps:${NC}"
echo "  1. Restart Claude Code to apply changes"
echo "  2. Run 'claude' in any project directory"
echo ""
echo -e "${GREEN}Enjoy UCES!${NC}"

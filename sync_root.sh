#!/usr/bin/env bash
set -e

TEMP_DIR="$(mktemp -d)"

# 1. Use template/ as the Copier template root
copier copy \
    --defaults \
    template \
    "$TEMP_DIR"

# 2. Remove everything at the root except what we want to keep
find . -mindepth 1 -maxdepth 1 \
    ! -name ".git" \
    ! -name ".gitignore" \
    ! -name "template" \
    ! -name "sync_root.sh" \
    ! -name "DOCS.md" \
    -exec rm -rf {} +

# 3. Copy rendered project files into the root
cp -R "$TEMP_DIR"/. .

echo "Root synchronized from Copier template."

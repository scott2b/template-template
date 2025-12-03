#!/usr/bin/env bash
set -e

TEMP_DIR="$(mktemp -d)"

# 1. Render from this repo into a temp directory.
# copier.yml must have: _subdirectory: template
copier copy \
    --defaults \
    . \
    "$TEMP_DIR"

# 2. Remove the *rendered* template directory from the temp output,
#    so we don't overwrite our canonical template/ in the repo.
rm -rf "$TEMP_DIR/template"

# 3. Remove everything at the root except the things we want to keep.
find . -mindepth 1 -maxdepth 1 \
    ! -name ".git" \
    ! -name ".gitignore" \
    ! -name "template" \
    ! -name "sync_root.sh" \
    ! -name "DOCS.md" \
    -exec rm -rf {} +

# 4. Copy rendered project files into the root.
cp -R "$TEMP_DIR"/. .

echo "Root synchronized from Copier template."

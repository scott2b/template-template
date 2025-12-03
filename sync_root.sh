#!/usr/bin/env bash
set -euo pipefail

TEMP_DIR="$(mktemp -d)"

# Use this repo as the Copier template; _subdirectory: template
copier copy --defaults . "$TEMP_DIR"

# Remove everything in root except the template machinery & docs
find . -mindepth 1 -maxdepth 1 \
  ! -name '.git' \
  ! -name '.gitignore' \
  ! -name 'copier.yml' \
  ! -name 'template' \
  ! -name 'sync_root.sh' \
  ! -name 'DOCS.md' \
  -exec rm -rf {} +

# Copy rendered project into root
cp -R "$TEMP_DIR"/. .

echo "Root synchronized from template/"

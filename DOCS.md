# Hybrid GitHub+Copier Template

This repository is a *hybrid* template:

- The `template/` directory contains the Copier template for **final projects**.
- The repository root contains a rendered example project for GitHub’s “Use this template” feature.

## Workflow

1. Edit files in `template/` to define your project scaffolding.
2. Run `./sync_root.sh` to regenerate the example project in the repository root.
3. Consumers can either:
   - Click “Use this template” on GitHub to copy the rendered root, or
   - Run `copier copy gh:you/this-repo new-project` to generate a project with prompts.

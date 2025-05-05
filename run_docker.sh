#!/bin/bash

docker run --rm -it \
  -v $(pwd)/output:/app/output \
  --env-file .env \
  --user $(id -u):$(id -g) \
  codebase_summarizer --repo https://github.com/Aider-AI/aider.git  --include "*.py" "*.js" --exclude "tests/*"


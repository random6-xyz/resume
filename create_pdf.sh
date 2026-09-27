#!/usr/bin/env bash

set -euo pipefail

INPUT="README.md"
OUTPUT="Woojin_Ji_Resume.pdf"

pandoc "$INPUT" \
  --defaults resume.yaml \
  -o "$OUTPUT"

echo "Created: $OUTPUT"

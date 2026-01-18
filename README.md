# ps-tulip-42

A small PowerShell tool that computes text statistics for tulip.

## Objective
- Provide quick text metrics for tulip documents.
- Report top word frequencies for fast inspection.

## Use cases
- Validate tulip drafts for repeated terms before review.
- Summarize tulip notes when preparing reports.

## Usage
pwsh -File main.ps1 -Path data/sample.txt -Top 5

## Output
- lines: total line count
- words: total word count
- chars: total character count
- top words: most frequent tokens (case-insensitive)

## Testing
- run `bash scripts/verify.sh`

## Notes
- Only ASCII letters and digits are treated as word characters.

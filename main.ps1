param(
  [Parameter(Mandatory=$true)][string]$Path,
  [int]$Top = 10
)

if (-not (Test-Path $Path)) {
  Write-Error "file not found"
  exit 1
}

$text = Get-Content -Raw -Path $Path
$lines = if ($text.Length -eq 0) { 0 } else { ($text -split "`n").Count }
$words = [regex]::Matches($text.ToLower(), "[A-Za-z0-9]+") | ForEach-Object { $_.Value }
$counts = @{}
foreach ($w in $words) {
  if ($counts.ContainsKey($w)) { $counts[$w]++ } else { $counts[$w] = 1 }
}

Write-Output "lines: $lines"
Write-Output "words: $($words.Count)"
Write-Output "chars: $($text.Length)"
Write-Output "top words:"
$counts.GetEnumerator() | Sort-Object -Property Value -Descending, Name | Select-Object -First $Top | ForEach-Object {
  Write-Output "  $($_.Name): $($_.Value)"
}

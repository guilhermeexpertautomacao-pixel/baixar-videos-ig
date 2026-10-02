#!/usr/bin/env bash
# Baixa todos os reels listados em links.txt para a pasta videos/.
# Uso: ./baixar.sh [cookies.txt]
#   cookies.txt (opcional): cookies do Instagram exportados do navegador,
#   necessários quando o Instagram exige login.
set -euo pipefail
cd "$(dirname "$0")"

command -v yt-dlp >/dev/null || pip install -U yt-dlp

args=(
  --batch-file links.txt
  --output "videos/%(upload_date)s_%(id)s.%(ext)s"
  --download-archive videos/.baixados.txt
  --merge-output-format mp4
  --ignore-errors
  --sleep-requests 2
)
[[ -n "${1:-}" ]] && args+=(--cookies "$1")

mkdir -p videos
yt-dlp "${args[@]}"

#!/usr/bin/env bash
# Baixa todos os reels listados em links.txt para a pasta videos/.
# Uso: ./baixar.sh [chrome | cookies.txt]
#   chrome (ou firefox, edge, brave...): usa a sessão do Instagram já logada
#     nesse navegador. Feche o navegador antes de rodar.
#   cookies.txt: cookies do Instagram exportados do navegador.
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
if [[ -f "${1:-}" ]]; then
  args+=(--cookies "$1")
elif [[ -n "${1:-}" ]]; then
  args+=(--cookies-from-browser "$1")
fi

mkdir -p videos
yt-dlp "${args[@]}"

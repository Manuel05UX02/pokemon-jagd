#!/usr/bin/env bash
# Stempelt die Build-Nummer in index.html + version.txt, committet und pusht.
# Aufruf: ./deploy.sh "Commit-Nachricht"
set -e
cd "$(dirname "$0")"
B=$(date +%Y%m%d-%H%M)
sed -i "s/const BUILD='[^']*'/const BUILD='$B'/" index.html
echo "$B" > version.txt
git add -A
git commit -qm "${1:-deploy} [$B]

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>"
git push -q
echo "deployed $B"

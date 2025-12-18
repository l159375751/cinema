#!/usr/bin/env bash

cd "$(dirname "$0")" || exit 1

while read -r name; do
  [ -z "$name" ] && continue

  case "$name" in \#*) continue ;; esac
  file="blender-$name.torrent"

  [ -f "$file" ] && echo "skip  : $file" && continue

  echo "fetch : $file"
  curl -fsSL "https://webtorrent.io/torrents/$name.torrent" -o "$file" &&
    echo "  ok  : $file" || echo "  !!  : $name" >&2

done < "${1:-blender-torrent-names.txt}"

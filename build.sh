#!/usr/bin/env bash
# Bouwt index.html (losstaande pagina, o.a. voor GitHub Pages) uit page.html.
# page.html bevat enkel <title>, <link>, <style> en de opmaak — dat is ook het
# bestand dat als Claude Artifact gepubliceerd wordt.
set -euo pipefail
cd "$(dirname "$0")"
python3 - <<'PY'
src = open('page.html').read()
head, body = src.split('</style>', 1)
head += '</style>'
open('index.html', 'w').write(f"""<!doctype html>
<html lang="nl">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Groeiwijs — kinder- &amp; jongerencoaching en huiswerkbegeleiding door Caroline Reynders in Beringen. Omdat ieder kind mag groeien op zijn of haar eigen manier.">
<meta name="color-scheme" content="light">
<style>body{{margin:0}}img{{max-width:100%}}</style>
{head}
</head>
<body>
{body.strip()}
</body>
</html>
""")
print("index.html gebouwd")
PY

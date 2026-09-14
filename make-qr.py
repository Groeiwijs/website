#!/usr/bin/env python3
"""Genereert de QR-code die naar de pagina verwijst.

Gebruik:  python3 make-qr.py [url]
Vereist:  pip install segno
"""
import sys
import segno

URL = sys.argv[1] if len(sys.argv) > 1 else "https://groeiwijs.github.io/website"

# Foutcorrectie 'H': de code blijft leesbaar, ook op een gekreukte flyer.
qr = segno.make(URL, error="h")

qr.save("qr.svg", scale=10, border=4, dark="#23252B", light="#FFFFFF")
qr.save("qr.png", scale=12, border=4, dark="#23252B", light="#FFFFFF")

print(f"QR-code voor {URL}")
print(f"versie {qr.version}, foutcorrectie {qr.error.upper()} -> qr.svg, qr.png")

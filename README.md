# Groeiwijs — Caroline Reynders

Eén webpagina met de info over Groeiwijs: kinder- & jongerencoaching en
huiswerkbegeleiding. Bedoeld om via de QR-code op de flyer bezocht te worden,
dus in de eerste plaats een telefoonpagina.

De inhoud komt uit `GROEIWIJS Voor Raf.docx`, de vormgeving uit de A6-flyer
(`607110_CARLINE_REYND_Groeiwijs_A6_Flyer_V3_pr3.pdf`) — beide in `~/groeiwijs`.

## Bestanden

| Bestand | Waarvoor |
| --- | --- |
| `page.html` | **De bron.** Bevat `<title>`, de stijl en de opmaak van de pagina. Hier pas je de tekst aan. |
| `index.html` | Gegenereerd uit `page.html` — een losstaande pagina voor GitHub Pages. Nooit met de hand aanpassen. |
| `build.sh` | Bouwt `index.html` uit `page.html`. |
| `img/kompas.png` | Het kompaslogo, op 600 dpi uit de flyer-PDF gerenderd en vrijstaand gemaakt (transparante achtergrond). |
| `img/woordmerk.png` | Het woordmerk GROEIWIJS, idem. De alfa komt uit de donkerte van het blauw, zodat de korrel in de letters bewaard blijft. |
| `make-qr.py` | Genereert `qr.svg` en `qr.png` uit de URL van de pagina. |
| `qr.svg` / `qr.png` | De QR-code. SVG voor drukwerk, PNG voor op het scherm. |
| `qr-kaartje.html` | Print-vel met vier uitknipbare kaartjes met de QR-code erop (A4). |

## Huisstijl

Rechtstreeks uit de flyer geplukt, staat bovenaan in `page.html` als
CSS-variabelen:

| | |
| --- | --- |
| navy | `#0A40A0`, donkerder `#061D69` |
| rood | `#E22123` |
| roze | `#F18FAE`, zacht `#F9CFCE`, wash `#FCE7E6` |
| lettertype | Poppins (Google Fonts) |

Terugkerende vormen: het dambordpatroon (`.checker`), de trapjes waarmee dat
dambord uitloopt (`.trapje` — in een hoek, of met `.trapje--punt` halverwege een
rand), de rode stervormige badge (`.badge`), de blauwe golf in de
linkeronderhoek van de hero (`.golfvorm` — ligt over het dambord heen, met het
roze hartje en de spetters in dezelfde tekening), de blauwe
spetter met het citaat (`.spetter`) en de roze dienstenkaarten (`.dienst`).

De losse figuurtjes van de flyer — sterretje, sprankel, hartje, kronkel,
spetterlijntjes en stipjes — staan één keer als `<symbol>` bovenaan de opmaak en
worden hergebruikt met `<svg class="fig …"><use href="#fig-…"></svg>`. De kronkel
en de spetters zijn uit de flyer-PDF overgetekend: van de kronkel is de middellijn
kolom per kolom opgemeten, de spetters zijn drie streepjes die onder 68°, 42° en
18° wegwaaieren met het steilste het dichtst bij het kompas. Waar een figuurtje
komt te staan, ligt vast in de CSS-klasse erachter (`.fig-hero-ster`,
`.fig-kompas-pop`, …); de kleur komt van `navy`, `rood`, `roze` of `wit`. De
spetters bij het kompas hangen in `.kompas-doos` aan de afbeelding zelf vast, zodat
ze altijd op dezelfde plek naast de ring blijven staan. In de
secties hangen ze naast de tekstkolom (`--naast-tekst`) zodat ze op een breed
scherm niet aan de schermrand gaan zweven, en op een telefoon vallen de figuurtjes
met `.fig--wijd` weg omdat daar enkel plaats is voor de hoekjes.

## Contactgegevens op de pagina

Caroline Reynders · 0474 41 88 17 · reynders.caroline@telenet.be · Beringen.
Staan op drie plaatsen in `page.html`: de contactsectie, de knoppen en de
vaste belbalk onderaan. Pas je er één aan, pas dan alle drie aan.

## Publiceren

De pagina staat op GitHub Pages, en dat is ook waar de QR-code op de flyer naar
wijst:

**https://groeiwijs.github.io/website**

Werkwijze bij een aanpassing: `page.html` bewerken, `./build.sh` draaien,
committen en pushen. De URL blijft dezelfde, dus **de QR-code blijft geldig —
ook nadat de flyers gedrukt zijn.**

Aan te zetten in de repo: *Settings → Pages → Source: Deploy from a branch →
`main` / `/ (root)`*. De eerste build duurt een minuut of twee.

## Lokaal bekijken

```bash
python3 -m http.server 8777    # daarna http://127.0.0.1:8777/
```

## QR-code opnieuw maken

Enkel nodig als de URL verandert. **Let op:** de gedrukte flyer bevat een
QR-code naar `https://groeiwijs.github.io/website` — verander die URL niet
zonder de flyer opnieuw te laten drukken.

```bash
python3 -m venv .venv && .venv/bin/pip install segno
.venv/bin/python make-qr.py "https://…"
```

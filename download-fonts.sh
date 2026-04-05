#!/bin/bash
# ─────────────────────────────────────────────
# KitaShift·KI — Fonts herunterladen für Self-Hosting
# Dieses Script lädt alle benötigten Fonts herunter.
# Führe es im Root des kitaplan-Repos aus.
# ─────────────────────────────────────────────

mkdir -p fonts

echo "📥 Lade DM Sans herunter..."
# DM Sans (300, 400, 500, 600, 700)
curl -sL "https://fonts.gstatic.com/s/dmsans/v15/rP2Fp2ywxg089UriCZa4ET-DNl0.woff2" -o fonts/dm-sans-v15-latin-300.woff2
curl -sL "https://fonts.gstatic.com/s/dmsans/v15/rP2Hp2ywxg089UriCZOIHQ.woff2" -o fonts/dm-sans-v15-latin-regular.woff2
curl -sL "https://fonts.gstatic.com/s/dmsans/v15/rP2Fp2ywxg089UriCZaIEj-DNl0.woff2" -o fonts/dm-sans-v15-latin-500.woff2
curl -sL "https://fonts.gstatic.com/s/dmsans/v15/rP2Fp2ywxg089UriCZawFT-DNl0.woff2" -o fonts/dm-sans-v15-latin-600.woff2
curl -sL "https://fonts.gstatic.com/s/dmsans/v15/rP2Fp2ywxg089UriCZbUFD-DNl0.woff2" -o fonts/dm-sans-v15-latin-700.woff2

echo "📥 Lade Playfair Display herunter..."
# Playfair Display (700)
curl -sL "https://fonts.gstatic.com/s/playfairdisplay/v37/nuFvD-vYSZviVYUb_rj3ij__anPXJzDwcbmjWBN2PKdFvXDXbtM.woff2" -o fonts/playfair-display-v37-latin-700.woff2

echo "📥 Lade Fraunces herunter..."
# Fraunces (400, 700, 900) — used on index.html
curl -sL "https://fonts.gstatic.com/s/fraunces/v31/6NUh6KKEp6qKjDqG8XZYH5DMcPE.woff2" -o fonts/fraunces-v31-latin-regular.woff2
curl -sL "https://fonts.gstatic.com/s/fraunces/v31/6NUh6KKEp6qKjDqG8XZYH5DMcPE.woff2" -o fonts/fraunces-v31-latin-700.woff2
curl -sL "https://fonts.gstatic.com/s/fraunces/v31/6NUh6KKEp6qKjDqG8XZYH5DMcPE.woff2" -o fonts/fraunces-v31-latin-900.woff2

echo "📥 Lade Inter herunter..."
# Inter (400, 500, 600, 700, 800) — used on download.html
curl -sL "https://fonts.gstatic.com/s/inter/v18/UcCO3FwrK3iLTeHuS_fvQtMwCp50KnMw2boKoduKmMEVuLyfAZ9hiA.woff2" -o fonts/inter-v18-latin-regular.woff2
curl -sL "https://fonts.gstatic.com/s/inter/v18/UcCO3FwrK3iLTeHuS_fvQtMwCp50KnMw2boKoduKmMEVuLyfAZ9hiA.woff2" -o fonts/inter-v18-latin-500.woff2
curl -sL "https://fonts.gstatic.com/s/inter/v18/UcCO3FwrK3iLTeHuS_fvQtMwCp50KnMw2boKoduKmMEVuLyfAZ9hiA.woff2" -o fonts/inter-v18-latin-600.woff2
curl -sL "https://fonts.gstatic.com/s/inter/v18/UcCO3FwrK3iLTeHuS_fvQtMwCp50KnMw2boKoduKmMEVuLyfAZ9hiA.woff2" -o fonts/inter-v18-latin-700.woff2
curl -sL "https://fonts.gstatic.com/s/inter/v18/UcCO3FwrK3iLTeHuS_fvQtMwCp50KnMw2boKoduKmMEVuLyfAZ9hiA.woff2" -o fonts/inter-v18-latin-800.woff2

echo ""
echo "✅ Fertig! Fonts liegen in ./fonts/"
echo ""
echo "📋 Nächste Schritte:"
echo "   1. git add fonts/"
echo "   2. git commit -m 'Self-host Google Fonts (DSGVO)'"
echo "   3. git push"
echo ""
echo "⚠️  WICHTIG: Die URLs oben sind generische gstatic-Links."
echo "   Für exakte Font-Dateien empfehle ich https://gwfh.mranftl.com/fonts"
echo "   → dort DM Sans, Playfair Display, Fraunces, Inter suchen"
echo "   → gewünschte Weights auswählen → Download → woff2-Dateien in fonts/ kopieren"

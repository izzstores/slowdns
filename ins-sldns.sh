#!/usr/bin/env bash
set -euo pipefail

# Compatibility installer: use the maintained custom-domain installer.
BASE="https://raw.githubusercontent.com/izzstores/izz_kun/main/Fls"
INSTALL_DIR=/root/slowdns

[ "$(id -u)" = 0 ] || { echo "Jalankan sebagai root." >&2; exit 1; }
mkdir -p "$INSTALL_DIR"
curl -fsSL "$BASE/slowdns" -o "$INSTALL_DIR/slowdns"
curl -fsSL "$BASE/slowdns-install.sh" -o "$INSTALL_DIR/install.sh"
curl -fsSL "https://raw.githubusercontent.com/izzstores/slowdns/main/sd.sh" -o /usr/local/sbin/sd
chmod 700 "$INSTALL_DIR" "$INSTALL_DIR/slowdns" "$INSTALL_DIR/install.sh"
chmod 755 /usr/local/sbin/sd
exec bash "$INSTALL_DIR/install.sh" install

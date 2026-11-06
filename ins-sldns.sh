#!/usr/bin/env bash
set -euo pipefail

# Compatibility installer: use the maintained custom-domain installer with multiplexer.
BASE="https://raw.githubusercontent.com/izzstores/izz_kun/main/Fls"
INSTALL_DIR=/root/slowdns

[ "$(id -u)" = 0 ] || { echo "Jalankan sebagai root." >&2; exit 1; }
mkdir -p "$INSTALL_DIR"
command -v python3 >/dev/null 2>&1 || (apt-get update -qq && apt-get install -y python3 >/dev/null 2>&1) || true
curl -fsSL "$BASE/slowdns" -o "$INSTALL_DIR/slowdns"
curl -fsSL "$BASE/slowdns-install.sh" -o "$INSTALL_DIR/install.sh"
curl -fsSL "$BASE/multiplexer.py" -o "$INSTALL_DIR/multiplexer.py"
curl -fsSL "$BASE/slowdns-mux.service" -o /etc/systemd/system/slowdns-mux.service
curl -fsSL "$BASE/sd" -o /usr/local/sbin/sd
curl -fsSL "$BASE/m-slowdns" -o /usr/local/sbin/m-slowdns
chmod 700 "$INSTALL_DIR" "$INSTALL_DIR/slowdns" "$INSTALL_DIR/install.sh" "$INSTALL_DIR/multiplexer.py"
chmod 755 /usr/local/sbin/sd /usr/local/sbin/m-slowdns
systemctl daemon-reload
systemctl enable --now slowdns-mux.service >/dev/null 2>&1 || true
exec bash "$INSTALL_DIR/install.sh" install

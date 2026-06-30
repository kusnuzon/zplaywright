#!/bin/bash

echo "========================================="
echo "  AUTO INSTALLER PLAYWRIGHT TERMUX"
echo "========================================="

echo -e "\n[*] 1. Menginstal bahan-bahan (NodeJS, Python, Chromium)..."
pkg update -y && pkg install -y nodejs python chromium curl

echo -e "\n[*] 2. Menginstal Playwright versi resmi..."
pip install playwright

echo -e "\n[*] 3. Mencari lokasi folder Python..."
# Baris ini otomatis mencari folder site-packages (contoh: python3.13)
SP_DIR=$(python -c "import site; print(site.getsitepackages()[0])")
echo "Lokasi ditemukan: $SP_DIR"

echo -e "\n[*] 4. Menghapus Playwright bawaan yang error..."
rm -rf "$SP_DIR/playwright"

echo -e "\n[*] 5. Mendownload dan memasang Patch Playwright..."

curl -L "https://raw.githubusercontent.com/kusnuzon/zplaywright/main/zplaywright.tar.gz" | tar -xz -C "$SP_DIR/"

echo -e "\n[*] 6. Memperbaiki file Node.js (Symlink)..."
mkdir -p "$SP_DIR/playwright/driver/"
ln -sf /data/data/com.termux/files/usr/bin/node "$SP_DIR/playwright/driver/node"
chmod +x "$SP_DIR/playwright/driver/node"

echo -e "\n========================================="
echo "  INSTALASI SELESAI & SUKSES!"
echo "  Silakan download dan jalankan tes.py"
echo "========================================="

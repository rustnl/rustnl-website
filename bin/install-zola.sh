#!/usr/bin/env bash
set -euo pipefail

INSTALL_DIR="/usr/local/bin"
LATEST_TAG="v0.23.6"

if [ "$(id -u)" -eq 0 ]; then
    SUDO=""
else
    SUDO="sudo"
fi

os="$(uname -s)"
arch="$(uname -m)"

case "$os" in
    Linux)  target_os="unknown-linux-gnu" ;;
    Darwin) target_os="apple-darwin" ;;
    *)      echo "Unsupported OS: $os" >&2; exit 1 ;;
esac

case "$arch" in
    x86_64|amd64)   target_arch="x86_64" ;;
    aarch64|arm64)  target_arch="aarch64" ;;
    *)              echo "Unsupported architecture: $arch" >&2; exit 1 ;;
esac

target="${target_arch}-${target_os}"
echo "Detected platform: ${target}"
asset="zola-${LATEST_TAG}-${target}.tar.gz"

url="https://github.com/getzola/zola/releases/download/${LATEST_TAG}/${asset}"

echo "Downloading ${asset} ..."
tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

curl -fsSL "$url" -o "${tmp_dir}/${asset}"
tar -xzf "${tmp_dir}/${asset}" -C "$tmp_dir"

echo "Installing to ${INSTALL_DIR}${SUDO:+ (requires sudo)} ..."
$SUDO mv "${tmp_dir}/zola" "${INSTALL_DIR}/zola"
$SUDO chmod +x "${INSTALL_DIR}/zola"

echo "Installed: $(zola --version)"

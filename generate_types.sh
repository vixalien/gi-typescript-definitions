#!/bin/sh

BOLD='\033[1m'
CYAN='\033[0;34m'
NC='\033[0m'
message() {
    printf "\n${BOLD}${CYAN}>> ${1}${NC}\n"
}

message "Enabling Node..."
export PATH="/usr/lib/sdk/node24/bin:$PATH"

TMP_INSTALL_DIR=/tmp/pnpm-global

mkdir -p $TMP_INSTALL_DIR

message "Installing girgen..."
export PATH="$TMP_INSTALL_DIR:$PATH"
COREPACK_ENABLE_DOWNLOAD_PROMPT=0 corepack enable --install-directory $TMP_INSTALL_DIR
CI=true pnpm install

message "Cleaning up old files"
rm types/*.d.ts

message "Generating modules..."
pnpm exec girgen typescript -o types

message "Generated modules"
exit

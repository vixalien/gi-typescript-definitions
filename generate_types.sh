#!/bin/sh

BOLD='\033[1m'
CYAN='\033[0;34m'
NC='\033[0m'
message() {
    printf "\n${BOLD}${CYAN}>> ${1}${NC}\n"
}

message "Enabling Node..."
export PATH="/usr/lib/sdk/node24/bin:$PATH"

TMP_INSTALL_DIR=/tmp/yarn-global

message "Installing ts-for-gir..."
export PATH="$TMP_INSTALL_DIR:$PATH"
COREPACK_ENABLE_DOWNLOAD_PROMPT=0 corepack enable --install-directory $TMP_INSTALL_DIR
CI=true pnpm install

message "Finding all modules..."
LIST_OUTPUT=$(pnpm exec ts-for-gir list)
# This pretty prints the output of `ts-for-gir list` into a list of modules
MODULES=$(echo "$LIST_OUTPUT" |
sed -n '/Available Modules:/,/Conflicts:/p' |
awk '/^- / {
    module = $2
    getline
    print module
}'
)
echo "$(echo $MODULES | wc -w) Modules found:"
echo $MODULES

message "Cleaning up old files"
rm *.d.ts

message "Generating modules..."
pnpm exec ts-for-gir generate --ignoreVersionConflicts -o . $MODULES

message "Generated modules"
exit

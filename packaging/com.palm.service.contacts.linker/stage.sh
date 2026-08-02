#!/bin/bash
# stage.sh — package the WHOLE com.palm.service.contacts.linker service as its own ipk. This repo
# is the single source of truth; postinst replaces /usr/palm/services/com.palm.service.contacts.linker
# wholesale (backing up stock first) rather than patching individual files.
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
REPO="$(cd "$HERE/../.." && pwd)"
STAGE="$1"
# shellcheck source=/dev/null
source "$REPO/packaging/lib/common.sh"

stage_whole "$REPO/com.palm.service.contacts.linker" /usr/palm/services/com.palm.service.contacts.linker com.palm.service.contacts.linker \
  db tempdb desktop-support files tests backup filecache_types watches

echo "com.palm.service.contacts.linker stage complete: $STAGE"

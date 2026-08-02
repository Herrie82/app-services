#!/bin/bash
# stage.sh — package the WHOLE com.palm.service.accounts service as its own ipk. This repo is the
# single source of truth; postinst replaces /usr/palm/services/com.palm.service.accounts wholesale
# (backing up stock first) rather than patching individual files.
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
REPO="$(cd "$HERE/../.." && pwd)"
STAGE="$1"
# shellcheck source=/dev/null
source "$REPO/packaging/lib/common.sh"

stage_whole "$REPO/com.palm.service.accounts" /usr/palm/services/com.palm.service.accounts com.palm.service.accounts \
  db tempdb desktop-support files tests backup

echo "com.palm.service.accounts stage complete: $STAGE"

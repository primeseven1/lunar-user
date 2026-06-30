set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INITRD_LOCATION="$SCRIPT_DIR/../tools/testing/iso/initrd"
SYSROOT="$SCRIPT_DIR/../root"

cd "$SYSROOT"
tar --format=ustar -cvf "$INITRD_LOCATION" *

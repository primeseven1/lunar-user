set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INITRD_LOCATION="$SCRIPT_DIR/../tools/testing/iso/initrd"
ROOT_LOCATION="$SCRIPT_DIR/../root"

tar --format=ustar -cvf $INITRD_LOCATION $ROOT_LOCATION

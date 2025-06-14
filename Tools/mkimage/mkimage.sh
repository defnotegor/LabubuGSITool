#!/bin/bash

BASE_DIR=$1
OUTPUT=$2
SCRIPT_DIR=$(dirname "$0")
TEMP_DIR="$SCRIPT_DIR/../../Temp"
SIZE=$(( $(du -sb "$BASE_DIR" | awk '{print $1}') + 250 * 1024 * 1024 ))

p="/plat_file_contexts"
n="/nonplat_file_contexts"
for f in "$BASE_DIR/system/etc/selinux" "$BASE_DIR/system/vendor/etc/selinux"; do
    if [[ -f "$f$p" ]]; then
        sudo cat "$f$p" >> "$TEMP_DIR/file_contexts"
    fi
    if [[ -f "$f$n" ]]; then
        sudo cat "$f$n" >> "$TEMP_DIR/file_contexts"
    fi
done

if [[ -f "$TEMP_DIR/file_contexts" ]]; then
    echo "/firmware(/.*)?         u:object_r:firmware_file:s0" >> "$TEMP_DIR/file_contexts"
    echo "/bt_firmware(/.*)?      u:object_r:bt_firmware_file:s0" >> "$TEMP_DIR/file_contexts"
    echo "/persist(/.*)?          u:object_r:mnt_vendor_file:s0" >> "$TEMP_DIR/file_contexts"
    echo "/dsp                    u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/oem                    u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/op1                    u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/op2                    u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/charger_log            u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/audit_filter_table     u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/keydata                u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/keyrefuge              u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/omr                    u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/publiccert.pem         u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/sepolicy_version       u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/cust                   u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/donuts_key             u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/v_key                  u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/carrier                u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/dqmdbg                 u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/ADF                    u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/APD                    u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/asdf                   u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/batinfo                u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/voucher                u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/xrom                   u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/custom                 u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/cpefs                  u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/modem                  u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/module_hashes          u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/pds                    u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/tombstones             u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/factory                u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/oneplus(/.*)?          u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/addon.d                u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/op_odm                 u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/avb                    u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/sec_storage            u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/dpolicy                u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/dpolicy_system         u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/optics(/.*)?           u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/prism(/.*)?            u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/spu                    u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/mi_ext(/.*)?           u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/opconfig               u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/opcust                 u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/my_bigball(/.*)?       u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/my_carrier(/.*)?       u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/my_company(/.*)?       u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/my_engineering(/.*)?   u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/my_heytap(/.*)?        u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/my_manifest(/.*)?      u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/my_preload(/.*)?       u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/my_product(/.*)?       u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/my_region(/.*)?        u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/my_reserve(/.*)?       u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/my_stock(/.*)?         u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/special_preload        u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    echo "/blackbox               u:object_r:rootfs:s0" >> "$TEMP_DIR/file_contexts"
    file_contexts="$TEMP_DIR/file_contexts"
fi

sudo rm -rf "$BASE_DIR/persist"
sudo rm -rf "$BASE_DIR/bt_firmware"
sudo rm -rf "$BASE_DIR/firmware"
sudo rm -rf "$BASE_DIR/dsp"
sudo rm -rf "$BASE_DIR/cache"
sudo mkdir -p "$BASE_DIR/bt_firmware"
sudo mkdir -p "$BASE_DIR/persist"
sudo mkdir -p "$BASE_DIR/firmware"
sudo mkdir -p "$BASE_DIR/dsp"
sudo mkdir -p "$BASE_DIR/cache"

echo "Output image size: $(echo "scale=2; $SIZE / (1024^3)" | bc) GB"
sudo $SCRIPT_DIR/mkuserimg_mke2fs.sh "$BASE_DIR/" "$OUTPUT" ext4 "/" $SIZE $file_contexts -j "0" -T "1230768000" -L "/" -I "256" -M "/" -m "5"

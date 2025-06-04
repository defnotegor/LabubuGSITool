#!/bin/bash

ROM_INPUT=$1
ROM_TYPE=$2
partitions="vendor system system_ext product mi_ext"


usage() {
  echo "Usage: $0 [rom_input] [rom_type]"
  echo ""
  echo "Parameters:"
  echo "  rom_input - URL or local path to the base ROM"
  echo "  rom_type  - Type of rom"
  echo ""
  echo "Examples:"
  echo "  sudo bash $0 https://dl.google.com/dl/android/aosp/redfin-tq3a.230901.001.c2-factory-ca20bd02.zip Pixel"
  echo "  sudo bash $0 /path/to/local/rom.zip Pixel"
  echo ""
}

supported_roms() {
    echo "Available ROMs:"
    echo ""
    declare -a versions=(12 12.1 13 14 15)
    for version in "${versions[@]}"; do
        rom_dir="ROMsPatches/$version"
        if [ -d "$rom_dir" ]; then
            names=$(find "$rom_dir" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' 2>/dev/null)
            filtered=$(echo "$names" | grep -vxF -f <(printf '%s\n' "${versions[@]}"))
            if [ -n "$filtered" ]; then
                echo "Android $version:"
                echo "$filtered" | sed 's|^|  - |' | tr '\n' '\n'
                echo ""
            fi
        fi
    done
}

# Check argument
if [ -z "$2" ]; then
  usage
  supported_roms
  exit 0
fi

rm -rf DownloadedROMs
rm -rf UnpackedROMs

mkdir -p DownloadedROMs
mkdir -p UnpackedROMs
sudo chmod -R 777 /home/egor/tool
mkdir 
# Check if input is a URL or local file
if [[ "$ROM_INPUT" == http* ]]; then
    echo "Downloading ROM from URL..."
    wget -P "DownloadedROMs/" "$ROM_INPUT"
    ROM_PATH="DownloadedROMs/"$(basename "$ROM_INPUT")
elif [[ -f "$ROM_INPUT" ]]; then
    echo "Using local ROM file..."
    ROM_PATH="$ROM_INPUT"
elif [[ -d "$ROM_INPUT" ]]; then
    echo "Using already unpacked ROM directory..."
    cp -r "$ROM_INPUT"/* "UnpackedROMs/"
else
    echo "Error: Input must be a valid URL or local file path"
    exit 1
fi

# Only run extractor if we have a file (not directory)
if [[ -f "$ROM_PATH" ]]; then
    Tools/Firmware_extractor/extractor.sh "$ROM_PATH" "UnpackedROMs/"
fi

for partition in $partitions; do
    if [[ -f "UnpackedROMs/$partition.img" ]]; then
        echo "File found: UnpackedROMs/$partition.img"
        mkdir -p "UnpackedROMs/temp_mount"
        mkdir -p "UnpackedROMs/$partition"
        fs_type=$(blkid -o value -s TYPE "UnpackedROMs/$partition.img" 2>/dev/null)
        if [[ "$fs_type" == "ext2" || "$fs_type" == "ext4" ]]; then
            sudo mount -o loop,ro -t ext4 "UnpackedROMs/$partition.img" "UnpackedROMs/temp_mount"
        else
            sudo mount -o loop,ro "UnpackedROMs/$partition.img" "UnpackedROMs/temp_mount"
        fi
        cp -r "UnpackedROMs/temp_mount/". "UnpackedROMs/$partition/"
        sudo umount -R "UnpackedROMs/temp_mount"
    fi
done

for partition in $partitions; do
    if [ "$partition" != "system" ]; then
        if [ -d "UnpackedROMs/system/$partition" ] && [ ! -L "UnpackedROMs/system/$partition" ]; then
            source_dir="UnpackedROMs/system/$partition"
        elif [ -d "UnpackedROMs/system/system/$partition" ] && [ ! -L "UnpackedROMs/system/system/$partition" ]; then
            source_dir="UnpackedROMs/system/system/$partition"
        else
            continue
        fi
        if [ -d "UnpackedROMs/$partition" ]; then
            echo "Moving $partition into root..."
            mv "UnpackedROMs/$partition" "$source_dir/.."
        fi
    fi
done

sudo bash FoxetGSITool.sh "UnpackedROMs/system" "$ROM_TYPE"

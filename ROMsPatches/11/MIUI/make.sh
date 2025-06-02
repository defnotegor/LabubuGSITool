#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
BASE_DIR="$1"

if [ -d "$BASE_DIR/product" ] && [ ! -L "$BASE_DIR/product" ]; then
    product="$BASE_DIR/product"
elif [ -d "$BASE_DIR/system/product" ] && [ ! -L "$BASE_DIR/system/product" ]; then
    product="$BASE_DIR/system/product"
else
    echo "error: No product dir"
    exit 1
fi

if [ -d "$BASE_DIR/system_ext" ] && [ ! -L "$BASE_DIR/system_ext" ]; then
    system_ext="$BASE_DIR/system_ext"
elif [ -d "$BASE_DIR/system/system_ext" ] && [ ! -L "$BASE_DIR/system/system_ext" ]; then
    system_ext="$BASE_DIR/system/system_ext"
else
    echo "error: No system_ext dir"
    exit 1
fi

# Drop miui bloatware
rm -rf $BASE_DIR/mi_ext/product/app/GameCenterGlobal
rm -rf $BASE_DIR/mi_ext/product/app/MIUIMiPicks
rm -rf $BASE_DIR/mi_ext/product/app/PaymentService_Global
rm -rf $BASE_DIR/mi_ext/product/app/GoogleOne_arm64

rm -rf $BASE_DIR/mi_ext/product/priv-app/MIBrowserGlobal_builtin_before_2021
rm -rf $BASE_DIR/mi_ext/product/priv-app/MIUIVideoPlayer
rm -rf $BASE_DIR/mi_ext/product/priv-app/MIUIYellowPageGlobal

rm -rf $product/app/AiAsstVision
rm -rf $product/app/AnalyticsCore
rm -rf $product/app/AutoTest
rm -rf $product/app/Chrome64
rm -rf $product/app/Drive
rm -rf $product/app/Gmail2
rm -rf $product/app/Maps
rm -rf $product/app/Meet
rm -rf $product/app/MediaViewerGlobal
rm -rf $product/app/MIUIFrequentPhrase
rm -rf $product/app/MIUISystemAppUpdater
rm -rf $product/app/MSA-Global
rm -rf $product/app/Photos
rm -rf $product/app/talkback
rm -rf $product/app/Updater
rm -rf $product/app/Videos
rm -rf $product/app/YouTube
rm -rf $product/app/YTMusic
rm -rf $product/app/MiBugReportOS2Global
rm -rf $product/app/MilinkOS2GlobalLite
rm -rf $product/app/MIRadioGlobal
rm -rf $product/app/MiSound
rm -rf $product/app/MIUIMiCloudSync
rm -rf $product/app/SpeechServicesByGoogle
rm -rf $product/app/XMSFKeeperAll

rm -rf $product/data-app/*
rm -rf $BASE_DIR/mi_ext/product/data-app/*

rm -rf $product/priv-app/AndroidAutoStub
rm -rf $product/priv-app/ExtraPhotoGlobal
rm -rf $product/priv-app/FamilyLinkParentalControls
rm -rf $product/priv-app/MIServiceGlobal
rm -rf $product/priv-app/MIUICleanMasterGlobal-cleaner
rm -rf $product/priv-app/MIUIMusicGlobal
rm -rf $product/priv-app/Velvet
rm -rf $product/priv-app/MIUIBarrage
rm -rf $product/priv-app/MiuiCamera

rm -rf $system_ext/app/MiuiDeamon

rm -rf $system_ext/priv-app/GoogleFeedback
rm -rf $system_ext/priv-app/SetupWizard

rm -rf $BASE_DIR/system/priv-app/LocalTransport
rm -rf $BASE_DIR/system/priv-app/ONS
rm -rf $BASE_DIR/system/priv-app/Tag

# Remove init.recovery.hardware
rm -rf $BASE_DIR/init.recovery.hardware.rc

# Remove mi_ext partion
if [ -d "$BASE_DIR/mi_ext/" ]; then
    echo "" >> "$BASE_DIR/system/build.prop"
    cat "$BASE_DIR/mi_ext/etc/build.prop" >> "$BASE_DIR/system/build.prop"
    rsync -ra "$BASE_DIR/mi_ext/product/" "$product/"
    rsync -ra "$BASE_DIR/mi_ext/system_ext/" "$system_ext/"
    rsync -ra "$BASE_DIR/mi_ext/system/" "$BASE_DIR/system/"
    rm -rf "$BASE_DIR/mi_ext/"
fi
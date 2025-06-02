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

sed -i "/dataservice_app/d" $product/etc/selinux/product_seapp_contexts
sed -i "/dataservice_app/d" $system_ext/etc/selinux/system_ext_seapp_contexts

# Delete Google apps
rm -rf $BASE_DIR/system/app/datastatusnotification
rm -rf $BASE_DIR/system/app/QAS_DVC_MSP_VZW
rm -rf $BASE_DIR/system/app/VZWAPNLib
rm -rf $BASE_DIR/system/app/vzw_msdc_api
rm -rf $BASE_DIR/system/priv-app/CNEService
rm -rf $BASE_DIR/system/priv-app/DMService
rm -rf $BASE_DIR/system/priv-app/VzwOmaTrigger
rm -rf $BASE_DIR/system/etc/permissions/com.google.android.camera.experimental2017.xml
rm -rf $product/app/YouTube
rm -rf $product/app/YouTubeMusicPrebuilt
rm -rf $product/app/PrebuiltGmail
rm -rf $product/app/Maps
rm -rf $product/app/Drive
rm -rf $product/app/DiagnosticsToolPrebuilt
rm -rf $product/app/CalendarGooglePrebuilt
rm -rf $product/app/NgaResources
rm -rf $product/app/GoogleCamera
rm -rf $product/app/WallpapersBReel*
rm -rf $product/app/Music2
rm -rf $product/app/Photos
rm -rf $product/app/Videos
rm -rf $product/app/DevicePolicyPrebuilt
rm -rf $product/app/GoogleTTS
rm -rf $product/app/MobileFeliCaMenuMainApp
rm -rf $product/app/MobileFeliCaClient
rm -rf $product/priv-app/TurboPrebuilt
rm -rf $product/priv-app/TipsPrebuilt
rm -rf $product/priv-app/BetaFeedback
rm -rf $product/priv-app/HelpRtcPrebuilt
rm -rf $product/priv-app/MyVerizonServices
rm -rf $product/priv-app/OTAConfigPrebuilt
rm -rf $product/priv-app/RecorderPrebuilt
rm -rf $product/priv-app/SafetyHubLprPrebuilt
rm -rf $product/priv-app/ScribePrebuilt
rm -rf $product/priv-app/ConnMO
rm -rf $product/priv-app/DCMO
rm -rf $product/priv-app/SprintDM
rm -rf $product/priv-app/SprintHM
rm -rf $product/priv-app/EuiccSupportPixel
rm -rf $product/priv-app/EuiccGoogle
rm -rf $product/priv-app/WfcActivation
rm -rf $product/priv-app/AmbientSensePrebuilt
rm -rf $product/priv-app/GoogleCamera
rm -rf $product/priv-app/CarrierServices
rm -rf $system_ext/priv-app/GoogleFeedback
rm -rf $system_ext/priv-app/PixelNfc
rm -rf $BASE_DIR/system/app/NfcNci
rm -rf $system_ext/priv-app/YadaYada
rm -rf $BASE_DIR/system/priv-app/TagGoogle
rm -rf $product/app/VZWAPNLib
rm -rf $product/priv-app/AndroidAutoStubPrebuilt
rm -rf $product/priv-app/SafetyHubPrebuilt
rm -rf $product/priv-app/DreamlinerDreamsPrebuilt*
rm -rf $product/priv-app/DreamlinerPrebuilt*
rm -rf $product/priv-app/DreamlinerUpdater
rm -rf $system_ext/priv-app/HbmSVManager
rm -rf $product/overlay/PixelDocumentsUIOverlay
rm -rf $product/priv-app/Velvet
rm -rf $product/priv-app/RecorderPrebuilt*
rm -rf $product/app/arcore-1.42
rm -rf $product/app/talkback
rm -rf $product/priv-app/GoogleRestorePrebuilt*
rm -rf $product/priv-app/AdaptiveVPNPrebuilt*
rm -rf $product/priv-app/AndroidAutoStubPrebuilt
rm -rf $product/priv-app/PrebuiltDeskClockGoogle*
rm -rf $product/priv-app/PixelSupportPrebuilt
rm -rf $product/priv-app/PixelSupportPrebuilt
rm -rf $product/priv-app/WeatherPixelPrebuilt*
rm -rf $product/app/WallpaperEmojiPrebuilt*
rm -rf $product/app/WallpaperAIPrebuilt*
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
rm -rf $BASE_DIR/system/preload/*
rm -rf $BASE_DIR/system/hidden/*
rm -rf $BASE_DIR/system/saiv/*
rm -rf $BASE_DIR/system/tts/*

rm -rf $BASE_DIR/prism/priv-app/*
rm -rf $BASE_DIR/prism/app/*
rm -rf $BASE_DIR/prism/preload/*

rm -rf $BASE_DIR/system/app/SamsungTTS*
rm -rf $BASE_DIR/system/app/SamsungWeather
rm -rf $BASE_DIR/system/app/SamsungCalendar
rm -rf $BASE_DIR/system/app/SmartCapture
rm -rf $BASE_DIR/system/app/BixbyWakeup
rm -rf $BASE_DIR/system/app/VideoEditorLite_Dream_N
rm -rf $BASE_DIR/system/app/StickerCenter
rm -rf $BASE_DIR/system/app/VoiceAccess
rm -rf $BASE_DIR/system/app/ParentalCare
rm -rf $BASE_DIR/system/app/FBAppManager_NS
rm -rf $BASE_DIR/system/app/AllShareAware
rm -rf $BASE_DIR/system/app/AllshareMediaShare
rm -rf $BASE_DIR/system/app/VideoTrimmer
rm -rf $BASE_DIR/system/app/VTCameraSetting
rm -rf $BASE_DIR/system/app/MhsAiService
rm -rf $BASE_DIR/system/app/MdecService
rm -rf $BASE_DIR/system/app/KidsHome_Installer
rm -rf $BASE_DIR/system/app/ChromeCustomizations
rm -rf $BASE_DIR/system/app/ARCore
rm -rf $BASE_DIR/system/app/AllshareFileShare
rm -rf $BASE_DIR/system/app/AASAservice
rm -rf $BASE_DIR/system/app/ARZone
rm -rf $BASE_DIR/system/app/PrintSpooler
rm -rf $BASE_DIR/system/app/ARDrawing
rm -rf $BASE_DIR/system/app/Weather_SEP*
rm -rf $BASE_DIR/system/app/VisionIntelligence*
rm -rf $BASE_DIR/system/app/MinusOnePage
rm -rf $BASE_DIR/system/app/Privacy
rm -rf $BASE_DIR/system/app/PhotoTable
rm -rf $BASE_DIR/system/app/AutomationTest_FB
rm -rf $BASE_DIR/system/app/DRParser
rm -rf $BASE_DIR/system/app/DictDiotekForSec
rm -rf $BASE_DIR/system/app/FactoryAirCommandManager
rm -rf $BASE_DIR/system/app/FactoryCameraFB
rm -rf $BASE_DIR/system/app/HMT
rm -rf $BASE_DIR/system/app/MoccaMobile
rm -rf $BASE_DIR/system/app/PlayAutoInstallConfig
rm -rf $BASE_DIR/system/app/SamsungPassAutofill_v1
rm -rf $BASE_DIR/system/app/SilentLog
rm -rf $BASE_DIR/system/app/SmartReminder
rm -rf $BASE_DIR/system/app/WebManual
rm -rf $BASE_DIR/system/app/WlanTest
rm -rf $BASE_DIR/system/app/SamsungOne
rm -rf $BASE_DIR/system/app/ClipboardEdge

rm -rf $BASE_DIR/system/priv-app/AppUpdateCenter
rm -rf $BASE_DIR/system/priv-app/AREmoji*
rm -rf $BASE_DIR/system/priv-app/AvatarEmojiSticker
rm -rf $BASE_DIR/system/priv-app/AppUpdateCenter
rm -rf $BASE_DIR/system/priv-app/GalaxyApps_OPEN
rm -rf $BASE_DIR/system/priv-app/PhotoRemasterService
rm -rf $BASE_DIR/system/priv-app/PhotoEditor_AIFull
rm -rf $BASE_DIR/system/priv-app/TalkbackSE
rm -rf $BASE_DIR/system/priv-app/SamsungIntelliVoiceServices
rm -rf $BASE_DIR/system/priv-app/Bixby*
rm -rf $BASE_DIR/system/priv-app/EmergencySOS
rm -rf $BASE_DIR/system/priv-app/GameDriver*
rm -rf $BASE_DIR/system/priv-app/GameHome
rm -rf $BASE_DIR/system/priv-app/GameOptimizingService
rm -rf $BASE_DIR/system/priv-app/GameTools_Dream
rm -rf $BASE_DIR/system/priv-app/PhotoRemasterService
rm -rf $BASE_DIR/system/priv-app/Routines
rm -rf $BASE_DIR/system/priv-app/SamsungVideoPlayer
rm -rf $BASE_DIR/system/priv-app/SendHelpMessage
rm -rf $BASE_DIR/system/priv-app/ShareLive
rm -rf $BASE_DIR/system/priv-app/Upday
rm -rf $BASE_DIR/system/priv-app/SamsungSmartSuggestions
rm -rf $BASE_DIR/system/priv-app/VexScanner
rm -rf $BASE_DIR/system/priv-app/DualOutFocusViewer_V
rm -rf $BASE_DIR/system/priv-app/AutoDoodle
rm -rf $BASE_DIR/system/priv-app/SingleTakeService
rm -rf $BASE_DIR/system/priv-app/StickerFaceARAvatar
rm -rf $BASE_DIR/system/priv-app/PhotoEditor_Mid
rm -rf $BASE_DIR/system/priv-app/MateAgent
rm -rf $BASE_DIR/system/priv-app/PeopleStripe
rm -rf $BASE_DIR/system/priv-app/SystemUpdate
rm -rf $BASE_DIR/system/priv-app/PaymentFramework
rm -rf $BASE_DIR/system/priv-app/AuthFramework
rm -rf $BASE_DIR/system/priv-app/BCService
rm -rf $BASE_DIR/system/priv-app/CIDManager
rm -rf $BASE_DIR/system/priv-app/DeviceKeystring
rm -rf $BASE_DIR/system/priv-app/DiagMonAgent91
rm -rf $BASE_DIR/system/priv-app/DigitalKey
rm -rf $BASE_DIR/system/priv-app/FBInstaller_NS
rm -rf $BASE_DIR/system/priv-app/FBServices
rm -rf $BASE_DIR/system/priv-app/FacAtFunction
rm -rf $BASE_DIR/system/priv-app/FactoryTestProvider
rm -rf $BASE_DIR/system/priv-app/FotaAgent
rm -rf $BASE_DIR/system/priv-app/ModemServiceMode
rm -rf $BASE_DIR/system/priv-app/SamsungCarKeyFw
rm -rf $BASE_DIR/system/priv-app/SamsungPass
rm -rf $BASE_DIR/system/priv-app/SmartEpdgTestApp
rm -rf $BASE_DIR/system/priv-app/SOAgent7
rm -rf $BASE_DIR/system/priv-app/SamsungPayStubMini
rm -rf $BASE_DIR/system/priv-app/AppsEdgePanel*
rm -rf $BASE_DIR/system/priv-app/TaskEdgePanel*
rm -rf $BASE_DIR/system/priv-app/Netflix*
rm -rf $BASE_DIR/system/priv-app/OneDrive_Samsung*
rm -rf $BASE_DIR/system/priv-app/YourPhone*

rm -rf $product/app/Chrome
rm -rf $product/app/Gmail2
rm -rf $product/app/Maps
rm -rf $product/app/YouTube
rm -rf $product/app/BardShell

rm -rf $product/priv-app/AndroidAutoStub
rm -rf $product/priv-app/Velvet
rm -rf $product/priv-app/FamilyLinkParentalControls
rm -rf $product/priv-app/SearchSelector
rm -rf $product/priv-app/AiWallpaper


# Hotword
rm -rf $product/priv-app/HotwordEnrollment*
rm -rf $system_ext/framework/com.android.hotwordenrollment*
rm -rf $system_ext/framework/oat/arm/com.android.hotwordenrollment*
rm -rf $system_ext/framework/oat/arm64/com.android.hotwordenrollment*

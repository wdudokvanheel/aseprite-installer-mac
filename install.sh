#!/bin/zsh
emulate -LR zsh

PLIST="/Applications/Aseprite.app/Contents/Info.plist"

export DEPS=$HOME/aseprite_build

# Copy to the application folder
mkdir -p /Applications/Aseprite.app/contents/
cp -Rv $DEPS/aseprite/build/bin/* /Applications/Aseprite.app/contents/

# Add file associations to the Aseprite plist file

# Create the CFBundleDocumentTypes array if it doesn't already exist
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes array" "$PLIST" 2>/dev/null

# PNG
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:0 dict"      "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:0:CFBundleTypeName string 'PNG image'" "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:0:CFBundleTypeExtensions array"     "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:0:CFBundleTypeExtensions:0 string 'png'"       "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:0:CFBundleTypeRole string 'Editor'"   "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:0:LSItemContentTypes array"       "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:0:LSItemContentTypes:0 string 'public.png'"   "$PLIST"

# JPEG
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:1 dict"      "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:1:CFBundleTypeName string 'JPEG image'" "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:1:CFBundleTypeExtensions array"     "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:1:CFBundleTypeExtensions:0 string 'jpg'"       "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:1:CFBundleTypeExtensions:1 string 'jpeg'"      "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:1:CFBundleTypeRole string 'Editor'"   "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:1:LSItemContentTypes array"       "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:1:LSItemContentTypes:0 string 'public.jpeg'"  "$PLIST"

# GIF
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:2 dict"      "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:2:CFBundleTypeName string 'GIF image'"  "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:2:CFBundleTypeExtensions array"     "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:2:CFBundleTypeExtensions:0 string 'gif'"       "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:2:CFBundleTypeRole string 'Editor'"   "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:2:LSItemContentTypes array"       "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:2:LSItemContentTypes:0 string 'com.compuserve.gif'" "$PLIST"

# BMP
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:3 dict"      "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:3:CFBundleTypeName string 'BMP image'"  "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:3:CFBundleTypeExtensions array"     "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:3:CFBundleTypeExtensions:0 string 'bmp'"       "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:3:CFBundleTypeRole string 'Editor'"   "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:3:LSItemContentTypes array"       "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:3:LSItemContentTypes:0 string 'public.bmp'"    "$PLIST"

# TIFF
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:4 dict"      "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:4:CFBundleTypeName string 'TIFF image'" "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:4:CFBundleTypeExtensions array"     "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:4:CFBundleTypeExtensions:0 string 'tif'"       "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:4:CFBundleTypeExtensions:1 string 'tiff'"      "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:4:CFBundleTypeRole string 'Editor'"   "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:4:LSItemContentTypes array"       "$PLIST"
/usr/libexec/PlistBuddy -c "Add :CFBundleDocumentTypes:4:LSItemContentTypes:0 string 'public.tiff'"  "$PLIST"

# Install icon
mkdir -p /Applications/Aseprite.app/Contents/Resources/
cp ./Aseprite.icns /Applications/Aseprite.app/Contents/Resources/
/usr/libexec/PlistBuddy -c "Set :CFBundleIconFile Aseprite" "$PLIST" 2>/dev/null || /usr/libexec/PlistBuddy -c "Add :CFBundleIconFile string Aseprite" "$PLIST"

# Refresh LaunchServices database and restart Finder
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -f /Applications/Aseprite.app
killall Finder


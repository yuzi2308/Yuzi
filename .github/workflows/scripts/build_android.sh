#!/bin/bash

# X-FCOLS Android Native Builder Script
# By Emakloewe & Yuzi Dev

set -e

echo "🔥 X-FCOLS Android Native Builder 🔥"
echo "======================================"

SOURCE_DIR="$1"
BUILD_TYPE="$2"
OUTPUT_PATH="$3"

if [ -z "$SOURCE_DIR" ] || [ -z "$BUILD_TYPE" ]; then
    echo "Usage: $0 <source_dir> <debug|release> [output_path]"
    exit 1
fi

cd "$SOURCE_DIR"

# Create gradle wrapper if not exists
if [ ! -f "gradlew" ]; then
    echo "📦 Creating gradle wrapper..."
    gradle wrapper
fi

# Make gradlew executable
chmod +x gradlew

# Clean previous builds
echo "🧹 Cleaning previous builds..."
./gradlew clean --no-daemon

# Build APK
if [ "$BUILD_TYPE" == "release" ]; then
    echo "🏗️ Building Release APK..."
    ./gradlew assembleRelease --no-daemon
    APK_PATH=$(find app/build/outputs/apk/release -name "*.apk" | head -n 1)
else
    echo "🏗️ Building Debug APK..."
    ./gradlew assembleDebug --no-daemon
    APK_PATH=$(find app/build/outputs/apk/debug -name "*.apk" | head -n 1)
fi

# Copy APK to output
if [ -n "$OUTPUT_PATH" ] && [ -f "$APK_PATH" ]; then
    cp "$APK_PATH" "$OUTPUT_PATH"
    echo "✅ APK saved to: $OUTPUT_PATH"
elif [ -f "$APK_PATH" ]; then
    cp "$APK_PATH" ./app.apk
    echo "✅ APK saved to: ./app.apk"
fi

echo "🎉 Build completed successfully!"

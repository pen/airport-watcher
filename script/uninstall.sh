#!/bin/sh

cd `dirname $0`/..

. script/common.sh

sudo launchctl unload "$TARGET/$PLIST" >/dev/null 2>&1
sudo rm -f "$TARGET/$PLIST"
rm -f "dist/$PLIST" "dist/$SCRIPT"


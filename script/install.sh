#!/bin/sh

cd `dirname $0`/..

. script/common.sh

if [[ ! -f conf/$CONF ]]; then
    echo "missing: conf/$CONF"
    exit
fi

if [[ -f "$TARGET/$PLIST" ]]; then
    echo "already installed"
    exit
fi


cases=''
while read -r name env; do
    echo "$name" | grep -q '^#' && continue
    cases="$cases\n    $name) LOCATION='$env' ;;"
done < "conf/$CONF"

sed -e "s!__CASES__!$cases!" "tmpl/$SCRIPT.tmpl" > "dist/$SCRIPT"
chmod 755 "dist/$SCRIPT"

BASE=`pwd`
sudo rm -f "dist/$PLIST"
sed -e "s!__SCRIPT__!$BASE/dist/$SCRIPT!" "tmpl/$PLIST.tmpl" > "dist/$PLIST"
sudo chown root "dist/$PLIST"
sudo ln -sf "$BASE/dist/$PLIST" "$TARGET/"
sudo launchctl load "$TARGET/$PLIST"

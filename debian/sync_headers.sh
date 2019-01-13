#!/bin/sh

REPO=https://github.com/KhronosGroup/Vulkan-Headers.git
VERSION=`dpkg-parsechangelog -S Version|sed 's/-.*//'`

# clean old checkout
git rm -rf vulkan-headers

git clone $REPO vulkan-headers
(cd vulkan-headers; git reset --hard v$VERSION; cd ..)
rm -rf vulkan-headers/.git

git add -f vulkan-headers
git commit -m "Refresh vulkan-headers to $VERSION"

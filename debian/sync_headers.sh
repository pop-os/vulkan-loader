#!/bin/sh

REPO=https://github.com/KhronosGroup/Vulkan-Headers.git

if [ -n $1 ]; then
  VERSION=$1
else
  VERSION=`dpkg-parsechangelog -S Version|sed 's/-.*//'`
fi

# clean old checkout
git rm -rf vulkan-headers

git clone $REPO vulkan-headers
(cd vulkan-headers; git checkout sdk-$VERSION; cd ..)
rm -rf vulkan-headers/.git

git add -f vulkan-headers
git commit -m "Refresh vulkan-headers to $VERSION"

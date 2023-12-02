#!/bin/bash

CURRENT_MD5=$(md5sum package.json | awk '{print $1}')

if [ -f "node_modules/package_md5" ]; then
    PREVIEW_MD5=$(cat node_modules/package_md5)
fi

echo "当前依赖MD5: "$CURRENT_MD5
echo "缓存依赖MD5: "$PREVIEW_MD5

if [ "$CURRENT_MD5" != "$PREVIEW_MD5" ]; then
    echo "指纹不一致，依赖文件有变化，开始更新依赖"

    npm install --registry=http://registry.npm.taobao.org/ --verbose
    # cnpm install --verbose
    echo $CURRENT_MD5 > node_modules/package_md5
fi

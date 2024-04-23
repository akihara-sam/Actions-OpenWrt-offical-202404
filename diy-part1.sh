#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git passwall_pk https://github.com/xiaorouji/openwrt-passwall-packages.git' >>feeds.conf.default
echo 'src-git passwall_app https://github.com/xiaorouji/openwrt-passwall.git' >>feeds.conf.default
echo 'src-git helloworld https://github.com/fw876/helloworld.git' >>feeds.conf.default
echo 'src-git poweroff https://github.com/akihara-sam/luci-app-poweroff.git' >>feeds.conf.default
echo 'src-git openclash https://github.com/vernesong/OpenClash.git' >>feeds.conf.default

# 删除旧的 Go 语言包
rm -rf ./feeds/packages/lang/golang

# 克隆指定版本的 Go 语言包
git clone https://github.com/openwrt/packages.git -b master --single-branch --depth 1 temp_packages

# 仅复制golang目录
cp -R temp_packages/lang/golang ./feeds/packages/lang/

# 清理临时文件
rm -rf temp_packages

#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.2.4/g" ./package/base-files/files/bin/config_generate

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

# Modify hostname
sed -i "s/hostname='.*'/hostname='JDCloud'/g" ./package/base-files/files/bin/config_generate

# Modify WiFi
sed -i "s/ImmortalWrt-/RE-CP-03_/g" ./package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i "s/channel=\"[0-9]*\"/channel=\"auto\"/g" ./package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i "s/encryption=.*/encryption='sae-mixed'/g" ./package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i "/set wireless.default_\${dev}.encryption='sae-mixed'/a \\\t\t\t\t\t\set wireless.default_\${dev}.key='123456789'" ./package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i "s/set wireless.\${dev}.country=CN/set wireless.\${dev}.country=AU/g" ./package/mtk/applications/mtwifi-cfg/files/mtwifi.sh

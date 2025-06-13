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
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.2.5/g" /package/base-files/files/bin/config_generate

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-light/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-ssl-nginx/Makefile

# Modify hostname
sed -i "s/hostname='.*'/hostname='Newifi-D2'/g" package/base-files/files/bin/config_generate

# Modify WiFi
sed -i "s/LEDE/Newifi-D2/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh
# sed -i "s/channel=\"[0-9]*\"/channel=\"auto\"/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i "s/encryption=.*/encryption='sae-mixed'/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i "/set wireless.default_radio\${devidx}.encryption='sae-mixed'/a \\\t\t\t\t\t\set wireless.default_radio\${devidx}.key='123456789'" package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i "s/set wireless.radio\${devidx}.country=US/set wireless.\${devidx}.country=AU/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh

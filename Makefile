
include $(TOPDIR)/rules.mk

PKG_NAME:=wifi-information-collector
PKG_VERSION:=0.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/wifi-information-collector
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=wireless
  TITLE:=wifi-information-collector
  DEPENDS:=+libnl
endef

define Package/wifi-information-collector/description
  Example for WiFi stat collection using netlink
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) -rf ./src $(PKG_BUILD_DIR)/
endef

CONFIGURE_PATH:=src

MAKE_PATH:=src

TARGET_CFLAGS+=$(TARGET_CPPFLAGS)
ONFIGURE_VARS += LIBS="-lnl -lnl-genl"

define Package/wifi-information-collector/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/wifi-information-collector $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,wifi-information-collector))

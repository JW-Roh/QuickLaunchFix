ARCHS = armv7 armv7s #arm64
SDKVERSION = 7.0
TARGET = iphone:clang::7.0
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 7.0

include theos/makefiles/common.mk

TWEAK_NAME = QuickLaunchFix
QuickLaunchFix_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"

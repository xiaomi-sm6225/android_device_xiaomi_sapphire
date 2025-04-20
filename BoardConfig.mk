#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from xiaomi sm6225-common
include device/xiaomi/sm6225-common/BoardConfigCommon.mk

# Inherit the proprietary files
include vendor/xiaomi/sapphire/BoardConfigVendor.mk

DEVICE_PATH := device/xiaomi/sapphire

# Kernel (prebuilt)
PREBUILT_PATH := device/xiaomi/sapphire-prebuilt
TARGET_NO_KERNEL_OVERRIDE := true
TARGET_KERNEL_SOURCE := $(PREBUILT_PATH)/kernel-headers
BOARD_PREBUILT_DTBIMAGE_DIR := $(PREBUILT_PATH)/images/dtbs/
BOARD_PREBUILT_DTBOIMAGE := $(PREBUILT_PATH)/images/dtbo.img
PRODUCT_COPY_FILES += \
	$(PREBUILT_PATH)/images/kernel:kernel

# Kernel modules (prebuilt)
DLKM_MODULES_PATH := $(PREBUILT_PATH)/modules/vendor_dlkm
RAMDISK_MODULES_PATH := $(PREBUILT_PATH)/modules/vendor_boot
SYSTEM_DLKM_MODULES_PATH := $(PREBUILT_PATH)/modules/system_dlkm/5.15.148

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(SYSTEM_DLKM_MODULES_PATH)/,$(TARGET_COPY_OUT_SYSTEM_DLKM)/lib/modules/5.15.148/)

BOARD_VENDOR_KERNEL_MODULES := $(wildcard $(DLKM_MODULES_PATH)/*.ko)
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(patsubst %,$(DLKM_MODULES_PATH)/%,$(shell cat $(DLKM_MODULES_PATH)/modules.load))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(DLKM_MODULES_PATH)/modules.blocklist

BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(wildcard $(RAMDISK_MODULES_PATH)/*.ko)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(patsubst %,$(RAMDISK_MODULES_PATH)/%,$(shell cat $(RAMDISK_MODULES_PATH)/modules.load))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD  := $(patsubst %,$(RAMDISK_MODULES_PATH)/%,$(shell cat $(RAMDISK_MODULES_PATH)/modules.load.recovery))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_BLOCKLIST_FILE := $(RAMDISK_MODULES_PATH)/modules.blocklist

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/properties/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/properties/vendor.prop

# Screen density
TARGET_SCREEN_DENSITY := 440

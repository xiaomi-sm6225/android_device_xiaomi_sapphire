#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/sapphire

# Inherit from xiaomi sm6225-common
include device/xiaomi/sm6225-common/BoardConfigCommon.mk

# Inherit the proprietary files
include vendor/xiaomi/sapphire/BoardConfigVendor.mk
#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from xiaomi sm6225-common
$(call inherit-product, device/xiaomi/sm6225-common/common.mk)

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/sapphire/sapphire-vendor.mk)

# Overlay
PRODUCT_PACKAGES += \
    FrameworksResSapphire

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

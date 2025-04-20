#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixup_remove,
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'device/xiaomi/sm6225-common',
    'hardware/qcom-caf/sm6225',
    'hardware/xiaomi',
    'vendor/qcom/opensource/commonsys-intf/display',
    'vendor/xiaomi/sm6225-common',
]

lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
    (
        'libagmclient',
    ): lib_fixup_remove,
}

blob_fixups: blob_fixups_user_type = {
    (
        'vendor/lib64/libalLDC.so',
        'vendor/lib64/libalhLDC.so',
        'vendor/lib64/libmorpho_ldc.so',
        'vendor/lib64/libmorpho_Ldc.so',
        'vendor/lib64/libmorpho_ubwc.so',
        'vendor/lib64/libTrueSight.so',
    ): blob_fixup()
        .clear_symbol_version('AHardwareBuffer_acquire')
        .clear_symbol_version('AHardwareBuffer_allocate')
        .clear_symbol_version('AHardwareBuffer_describe')
        .clear_symbol_version('AHardwareBuffer_lock')
        .clear_symbol_version('AHardwareBuffer_lockPlanes')
        .clear_symbol_version('AHardwareBuffer_release')
        .clear_symbol_version('AHardwareBuffer_unlock'),
}  # fmt: skip

module = ExtractUtilsModule(
    'sapphire',
    'xiaomi',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, 'sm6225-common', module.vendor
    )
    utils.run()

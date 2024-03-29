#-------------------------------------------------------------------------------
# Copyright (c) 2023, Nordic Semiconductor ASA.
#
# SPDX-License-Identifier: LicenseRef-Nordic-5-Clause
#
#-------------------------------------------------------------------------------

include(${CMAKE_CURRENT_LIST_DIR}/../common/config.cmake)

set(OOT_PLATFORM_PATH ${NRF_DIR}/modules/trusted-firmware-m/platform/ext/target/nordic_nrf)
set(PLATFORM_PATH                                           platform/ext/target/nordic_nrf)

include(${OOT_PLATFORM_PATH}/common/nrf54l15/config.cmake)

# Override the AEAD algorithm configuration
set(PS_CRYPTO_AEAD_ALG                  PSA_ALG_GCM CACHE STRING    "The AEAD algorithm to use for authenticated encryption in Protected Storage")

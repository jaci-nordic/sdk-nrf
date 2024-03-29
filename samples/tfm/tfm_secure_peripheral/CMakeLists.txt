#
# Copyright (c) 2022 Nordic Semiconductor ASA
#
# SPDX-License-Identifier: LicenseRef-Nordic-5-Clause
#

cmake_minimum_required(VERSION 3.20)

find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})

get_target_property(TFM_BINARY_DIR tfm TFM_BINARY_DIR)
configure_file(
  ${CMAKE_CURRENT_LIST_DIR}/secure_peripheral_partition/tfm_manifest_list.yaml.in
  ${CMAKE_CURRENT_BINARY_DIR}/secure_peripheral_partition/tfm_manifest_list.yaml
)

set_property(TARGET zephyr_property_target
  APPEND PROPERTY TFM_CMAKE_OPTIONS
  -DTFM_EXTRA_MANIFEST_LIST_FILES=${CMAKE_CURRENT_BINARY_DIR}/secure_peripheral_partition/tfm_manifest_list.yaml
  -DTFM_EXTRA_PARTITION_PATHS=${CMAKE_CURRENT_LIST_DIR}/secure_peripheral_partition
)

project(tfm_secure_partition)

target_sources(app PRIVATE
  src/main.c
  src/secure_peripheral_partition.c
)

target_include_directories(app PRIVATE
  $<TARGET_PROPERTY:tfm,TFM_BINARY_DIR>/api_ns/interface/include
)

target_compile_definitions(app
    PRIVATE TFM_PARTITION_SECURE_PERIPHERAL_PARTITION
)

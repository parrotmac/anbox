# Copyright (C) 2011 The Android-x86 Open Source Project

LOCAL_PATH := $(call my-dir)

# HAL module implemenation, not prelinked and stored in
# hw/<OVERLAY_HARDWARE_MODULE_ID>.<ro.product.board>.so
include $(CLEAR_VARS)
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SHARED_LIBRARIES := liblog libcutils
LOCAL_MODULE := gps
LOCAL_SRC_FILES := gps.c

ifeq ($(wildcard $(LOCAL_PATH)/power-$(TARGET_PRODUCT).c),)
LOCAL_SRC_FILES += power-stub.c
else
LOCAL_SRC_FILES += power-$(TARGET_PRODUCT).c
endif

include $(BUILD_SHARED_LIBRARY)

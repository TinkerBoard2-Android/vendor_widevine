########################################################
#add drm function
#######################################################
PRODUCT_COPY_FILES += \
    vendor/widevine/bin/move_widevine_data.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/move_widevine_data.sh	\
    vendor/widevine/lib/libwvhidl.so:$(TARGET_COPY_OUT_VENDOR)/lib/libwvhidl.so \
    vendor/widevine/lib/mediadrm/libwvdrmengine.so:$(TARGET_COPY_OUT_VENDOR)/lib/mediadrm/libwvdrmengine.so

ifeq ($(strip $(ROCKCHIP_USE_LAZY_HAL)), true)
PRODUCT_COPY_FILES += \
    vendor/widevine/bin/hw/android.hardware.drm@1.2-service-lazy.widevine:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.drm@1.2-service-lazy.widevine \
    vendor/widevine/etc/init/android.hardware.drm@1.2-service-lazy.widevine.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.drm@1.2-service-lazy.widevine.rc
else
PRODUCT_COPY_FILES += \
    vendor/widevine/bin/hw/android.hardware.drm@1.2-service.widevine:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.drm@1.2-service.widevine \
    vendor/widevine/etc/init/android.hardware.drm@1.2-service.widevine.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.drm@1.2-service.widevine.rc
endif

ifeq ($(strip $(TARGET_ARCH)), arm64)
PRODUCT_COPY_FILES += \
    vendor/widevine/lib64/libwvhidl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libwvhidl.so \
    vendor/widevine/lib64/mediadrm/libwvdrmengine.so:$(TARGET_COPY_OUT_VENDOR)/lib64/mediadrm/libwvdrmengine.so
endif

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

ifeq ($(BOARD_WIDEVINE_OEMCRYPTO_LEVEL), 1)
PRODUCT_COPY_FILES += \
    vendor/widevine/lib/mediadrm/L1/liboemcrypto.so:$(TARGET_COPY_OUT_VENDOR)/lib/liboemcrypto.so \
    vendor/widevine/lib/mediadrm/L1/libRkWvClient.so:$(TARGET_COPY_OUT_VENDOR)/lib/libRkWvClient.so \
    vendor/widevine/bin/L1/arm/c11fe8ac-b997-48cf-a28de2a55e5240ef.ta:$(TARGET_COPY_OUT_VENDOR)/lib/optee_armtz/c11fe8ac-b997-48cf-a28de2a55e5240ef.ta \
    vendor/widevine/bin/L1/arm/rk_store_keybox:$(TARGET_COPY_OUT_VENDOR)/bin/rk_store_keybox
endif

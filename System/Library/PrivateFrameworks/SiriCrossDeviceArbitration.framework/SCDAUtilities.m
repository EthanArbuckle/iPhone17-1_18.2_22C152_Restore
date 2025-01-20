@interface SCDAUtilities
+ (BOOL)_hasPearlCameraCapability;
+ (BOOL)accessibilitySupportsAttentionAwareFeatures;
+ (BOOL)deviceCanMakeEmergencyCall;
+ (BOOL)isATV;
+ (BOOL)isCommunal;
+ (BOOL)isDeviceUnlocked;
+ (BOOL)isHorseman;
+ (BOOL)isIOS;
+ (BOOL)isMac;
+ (BOOL)isNano;
+ (BOOL)isPhone;
+ (BOOL)isReality;
@end

@implementation SCDAUtilities

+ (BOOL)isCommunal
{
  if (isCommunal_onceToken != -1) {
    dispatch_once(&isCommunal_onceToken, &__block_literal_global_21);
  }
  return isCommunal_isCommunal;
}

BOOL __27__SCDAUtilities_isCommunal__block_invoke()
{
  BOOL result = +[SCDAUtilities isHorseman];
  isCommunal_isCommunal = result;
  return result;
}

+ (BOOL)isHorseman
{
  if (isHorseman_onceToken != -1) {
    dispatch_once(&isHorseman_onceToken, &__block_literal_global_16);
  }
  return isHorseman_isHorseman;
}

uint64_t __27__SCDAUtilities_isHorseman__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isHorseman_isHorseman = result;
  return result;
}

+ (BOOL)isPhone
{
  if (isPhone_onceToken != -1) {
    dispatch_once(&isPhone_onceToken, &__block_literal_global_11);
  }
  return isPhone_isIPhone;
}

uint64_t __24__SCDAUtilities_isPhone__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  isPhone_isIPhone = result == 1;
  return result;
}

+ (BOOL)isReality
{
  return 0;
}

+ (BOOL)isNano
{
  return 0;
}

+ (BOOL)isIOS
{
  return 1;
}

+ (BOOL)isMac
{
  return 0;
}

+ (BOOL)isATV
{
  return 0;
}

+ (BOOL)deviceCanMakeEmergencyCall
{
  return +[SCDAUtilities isPhone];
}

+ (BOOL)accessibilitySupportsAttentionAwareFeatures
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  v2 = (uint64_t (*)(void))get_AXSAttentionAwarenessFeaturesEnabledSymbolLoc_ptr;
  v12 = get_AXSAttentionAwarenessFeaturesEnabledSymbolLoc_ptr;
  if (!get_AXSAttentionAwarenessFeaturesEnabledSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __get_AXSAttentionAwarenessFeaturesEnabledSymbolLoc_block_invoke;
    v14 = &unk_2654B7FF8;
    v15 = &v9;
    __get_AXSAttentionAwarenessFeaturesEnabledSymbolLoc_block_invoke((uint64_t)buf);
    v2 = (uint64_t (*)(void))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v2)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  uint64_t v3 = v2();
  v4 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    v6 = NSNumber;
    v7 = v4;
    v8 = [v6 numberWithBool:v3];
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "+[SCDAUtilities accessibilitySupportsAttentionAwareFeatures]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_debug_impl(&dword_25C707000, v7, OS_LOG_TYPE_DEBUG, "%s #scda _AXSAttentionAwarenessFeaturesEnabled %@", buf, 0x16u);
  }
  return v3;
}

+ (BOOL)_hasPearlCameraCapability
{
  if (_hasPearlCameraCapability_onceToken != -1) {
    dispatch_once(&_hasPearlCameraCapability_onceToken, &__block_literal_global_5);
  }
  return _hasPearlCameraCapability_hasPearlCameraCapability;
}

uint64_t __42__SCDAUtilities__hasPearlCameraCapability__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _hasPearlCameraCapability_hasPearlCameraCapability = result;
  return result;
}

+ (BOOL)isDeviceUnlocked
{
  return soft_MKBGetDeviceLockState() == 3 || soft_MKBGetDeviceLockState() == 0;
}

@end
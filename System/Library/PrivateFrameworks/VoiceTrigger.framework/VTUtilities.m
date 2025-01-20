@interface VTUtilities
+ (BOOL)VTIsHorseman;
+ (BOOL)isAlwaysOn;
+ (BOOL)isExclaveHardware;
+ (BOOL)isIOS;
+ (BOOL)isInternalInstall;
+ (BOOL)isNano;
+ (BOOL)isNonUI;
+ (BOOL)isTorpedo;
+ (BOOL)supportBargeIn;
+ (BOOL)supportExternalPhraseSpotter;
+ (BOOL)supportPremiumAssets;
+ (BOOL)supportRemoteDarwinVoiceTrigger;
+ (BOOL)supportTTS;
+ (double)VTMachAbsoluteTimeGetTimeInterval:(unint64_t)a3;
+ (double)_round:(double)a3 withPlaces:(int)a4;
+ (double)systemUpTime;
+ (id)convertToShortLPCMBufFromFloatLPCMBuf:(id)a3;
+ (id)deviceProductType;
+ (id)deviceProductVersion;
+ (id)deviceSoftwareVersion;
+ (id)getAssetHashFromConfigPath:(id)a3;
+ (id)sanitizeEventInfoForLogging:(id)a3;
+ (unint64_t)deviceCategoryForDeviceProductType:(id)a3;
+ (unint64_t)horsemanDeviceType;
+ (void)forceReload;
@end

@implementation VTUtilities

+ (unint64_t)horsemanDeviceType
{
  return 0;
}

+ (id)convertToShortLPCMBufFromFloatLPCMBuf:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  vDSP_Length v5 = v4 >> 2;
  float v20 = 32767.0;
  float __C = 1.0;
  float __B = -1.0;
  v6 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:v4 & 0xFFFFFFFFFFFFFFFCLL];
  v7 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:2 * (v4 >> 2)];
  id v8 = v3;
  v9 = (const float *)[v8 bytes];

  id v10 = v6;
  vDSP_vclip(v9, 1, &__B, &__C, (float *)[v10 bytes], 1, v5);
  id v11 = v10;
  v12 = (const float *)[v11 bytes];
  id v13 = v11;
  vDSP_vsmul(v12, 1, &v20, (float *)[v13 bytes], 1, v5);
  id v14 = v13;
  v15 = (const float *)[v14 bytes];
  id v16 = v7;
  vDSP_vfix16(v15, 1, (__int16 *)[v16 bytes], 1, v5);

  return v16;
}

+ (BOOL)isTorpedo
{
  if (isTorpedo_onceToken != -1) {
    dispatch_once(&isTorpedo_onceToken, &__block_literal_global_170);
  }
  return isTorpedo_isTorpedo;
}

uint64_t __24__VTUtilities_isTorpedo__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isTorpedo_isTorpedo = result;
  return result;
}

+ (double)VTMachAbsoluteTimeGetTimeInterval:(unint64_t)a3
{
  if (VTMachAbsoluteTimeGetTimeInterval__onceToken != -1) {
    dispatch_once(&VTMachAbsoluteTimeGetTimeInterval__onceToken, &__block_literal_global_168);
  }
  return *(double *)&VTMachAbsoluteTimeGetTimeInterval__rate * (double)a3 / 1000000000.0;
}

double __49__VTUtilities_VTMachAbsoluteTimeGetTimeInterval___block_invoke()
{
  mach_timebase_info info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(result) = info.numer;
    LODWORD(v1) = info.denom;
    double result = (double)*(unint64_t *)&result / (double)v1;
    VTMachAbsoluteTimeGetTimeInterval__rate = *(void *)&result;
  }
  return result;
}

+ (id)getAssetHashFromConfigPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"com_apple_MobileAsset_VoiceTriggerAssets/"];
  uint64_t v6 = v5;
  uint64_t v7 = [v3 rangeOfString:@".asset"];
  v9 = @"nohash";
  if (v6 && v8)
  {
    objc_msgSend(v3, "substringWithRange:", v4 + v6, v7 - (v4 + v6));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (unint64_t)deviceCategoryForDeviceProductType:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (deviceCategoryForDeviceProductType__onceToken != -1) {
    dispatch_once(&deviceCategoryForDeviceProductType__onceToken, &__block_literal_global_61);
  }
  if ([(id)deviceCategoryForDeviceProductType__nonAopDeviceSet containsObject:v3])
  {
    unint64_t v4 = 1;
  }
  else
  {
    if ([(id)deviceCategoryForDeviceProductType__macOsDeviceSet containsObject:v3]) {
      goto LABEL_6;
    }
    if (([v3 containsString:@"iPad"] & 1) != 0
      || ([v3 containsString:@"iPhone"] & 1) != 0)
    {
      unint64_t v4 = 2;
      goto LABEL_10;
    }
    if ([v3 containsString:@"Mac"])
    {
LABEL_6:
      unint64_t v4 = 3;
    }
    else
    {
      uint64_t v6 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138412290;
        id v8 = v3;
        _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_DEFAULT, "Unknown Device category for deviceProduceType: %@", (uint8_t *)&v7, 0xCu);
      }
      unint64_t v4 = 0;
    }
  }
LABEL_10:

  return v4;
}

uint64_t __50__VTUtilities_deviceCategoryForDeviceProductType___block_invoke()
{
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"iPad3,4", @"iPad3,5", @"iPad3,6", @"iPad4,1", @"iPad4,2", @"iPad4,3", @"iPad4,4", @"iPad4,5", @"iPad4,6", @"iPad4,7", @"iPad4,8", @"iPad4,9", @"iPad5,1", @"iPad5,2", @"iPad5,3", @"iPad5,4", @"iPad6,7",
    @"iPad6,8",
    @"iPad6,11",
    @"iPad6,12",
    @"iPhone5,1",
    @"iPhone5,2",
    @"iPhone5,3",
    @"iPhone5,4",
    @"iPhone6,1",
    @"iPhone6,2",
    @"iPhone7,1",
    @"iPhone7,2",
  uint64_t v0 = 0);
  unint64_t v1 = (void *)deviceCategoryForDeviceProductType__nonAopDeviceSet;
  deviceCategoryForDeviceProductType__nonAopDeviceSet = v0;

  deviceCategoryForDeviceProductType__macOsDeviceSet = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"macOS", @"Mac", 0);

  return MEMORY[0x270F9A758]();
}

+ (id)deviceSoftwareVersion
{
  v2 = (__CFString *)MGCopyAnswer();
  if (!v2) {
    v2 = @"???";
  }

  return v2;
}

+ (id)deviceProductType
{
  v2 = (__CFString *)MGCopyAnswer();
  if (!v2) {
    v2 = @"???";
  }

  return v2;
}

+ (id)deviceProductVersion
{
  v2 = (__CFString *)MGCopyAnswer();
  if (!v2) {
    v2 = @"???";
  }

  return v2;
}

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1) {
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global_44);
  }
  return isInternalInstall_isInternal;
}

void __32__VTUtilities_isInternalInstall__block_invoke()
{
  id v0 = (id)MGCopyAnswer();
  isInternalInstall_isInternal = [v0 BOOLValue];
}

+ (BOOL)supportRemoteDarwinVoiceTrigger
{
  if (supportRemoteDarwinVoiceTrigger_onceToken != -1) {
    dispatch_once(&supportRemoteDarwinVoiceTrigger_onceToken, &__block_literal_global_39);
  }
  return supportRemoteDarwinVoiceTrigger_supportDarwinVT;
}

uint64_t __46__VTUtilities_supportRemoteDarwinVoiceTrigger__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  supportRemoteDarwinVoiceTrigger_supportDarwinVT = result;
  return result;
}

+ (BOOL)supportPremiumAssets
{
  if (+[VTUtilities isAlwaysOn]) {
    return 1;
  }

  return +[VTUtilities VTIsHorseman];
}

+ (BOOL)supportBargeIn
{
  if (supportBargeIn_onceToken != -1) {
    dispatch_once(&supportBargeIn_onceToken, &__block_literal_global_33);
  }
  return supportBargeIn_bargeInSupported;
}

uint64_t __29__VTUtilities_supportBargeIn__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  supportBargeIn_bargeInSupported = result;
  return result;
}

+ (BOOL)isAlwaysOn
{
  return MGGetBoolAnswer();
}

+ (BOOL)supportExternalPhraseSpotter
{
  return 1;
}

+ (BOOL)supportTTS
{
  return MGGetBoolAnswer();
}

+ (BOOL)VTIsHorseman
{
  if (VTIsHorseman_onceToken != -1) {
    dispatch_once(&VTIsHorseman_onceToken, &__block_literal_global_22);
  }
  return VTIsHorseman_isHorseman;
}

uint64_t __27__VTUtilities_VTIsHorseman__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  VTIsHorseman_isHorseman = result;
  return result;
}

+ (BOOL)isExclaveHardware
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v2 = (void *)getCSUtilsClass_softClass;
  uint64_t v8 = getCSUtilsClass_softClass;
  if (!getCSUtilsClass_softClass)
  {
    if (!CoreSpeechFoundationLibraryCore_frameworkLibrary)
    {
      uint64_t v9 = MEMORY[0x263EF8330];
      uint64_t v10 = 3221225472;
      id v11 = __CoreSpeechFoundationLibraryCore_block_invoke;
      v12 = &__block_descriptor_40_e5_v8__0l;
      uint64_t v13 = 0;
      long long v14 = xmmword_264325228;
      uint64_t v15 = 0;
      CoreSpeechFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    v6[3] = (uint64_t)objc_getClass("CSUtils");
    getCSUtilsClass_softClass = v6[3];
    v2 = (void *)v6[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v5, 8);
  return [v3 isExclaveHardware];
}

+ (BOOL)isNano
{
  return 0;
}

+ (BOOL)isIOS
{
  return 1;
}

+ (BOOL)isNonUI
{
  if (isNonUI_onceToken != -1) {
    dispatch_once(&isNonUI_onceToken, &__block_literal_global);
  }
  return isNonUI_isNonUI;
}

uint64_t __22__VTUtilities_isNonUI__block_invoke()
{
  uint64_t result = MGCopyAnswer();
  if (result)
  {
    uint64_t result = CFEqual((CFTypeRef)result, @"NonUI");
    isNonUI_isNonUI = result != 0;
  }
  return result;
}

+ (double)systemUpTime
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  *(void *)uint64_t v9 = 0x1500000001;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  size_t v6 = 16;
  int v2 = sysctl(v9, 2u, &v7, &v6, 0, 0);
  double result = -1.0;
  if (v2 != -1 && v7 != 0)
  {
    v5.tv_sec = 0;
    *(void *)&v5.tv_usec = 0;
    gettimeofday(&v5, 0);
    return (double)(v5.tv_usec - (int)v8) / 1000000.0 + (double)(v5.tv_sec - v7);
  }
  return result;
}

+ (double)_round:(double)a3 withPlaces:(int)a4
{
  double v5 = __exp10((double)a4);
  return round(v5 * a3) / v5;
}

+ (id)sanitizeEventInfoForLogging:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0xBFF0000000000000;
    double v5 = [MEMORY[0x263EFF9A0] dictionary];
    size_t v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_26C9A89F0];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __43__VTUtilities_sanitizeEventInfoForLogging___block_invoke;
    v12[3] = &unk_264325208;
    id v7 = v6;
    id v13 = v7;
    uint64_t v15 = v17;
    id v8 = v5;
    id v14 = v8;
    id v16 = a1;
    [v4 enumerateKeysAndObjectsUsingBlock:v12];
    uint64_t v9 = v14;
    id v10 = v8;

    _Block_object_dispose(v17, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __43__VTUtilities_sanitizeEventInfoForLogging___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v15]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    id v7 = v6;
    double v8 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v8 < 0.0)
    {
      [v6 doubleValue];
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9 + -10.0;
      double v8 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
    id v10 = *(void **)(a1 + 40);
    id v11 = NSNumber;
    v12 = *(void **)(a1 + 56);
    [v7 doubleValue];
    [v12 _round:2 withPlaces:v13 - v8];
    id v14 = objc_msgSend(v11, "numberWithDouble:");
    [v10 setObject:v14 forKey:v15];
  }
  else
  {
    [*(id *)(a1 + 40) setObject:v5 forKey:v15];
  }
}

+ (void)forceReload
{
}

@end
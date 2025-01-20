@interface WFDevice
+ (BOOL)deviceIsChinaSKU;
+ (BOOL)deviceIsGreenTea;
+ (WFDevice)currentDevice;
+ (id)systemShortcutsUserDefaults;
- (BOOL)hasCapability:(id)a3;
- (BOOL)hasPairedAndSetUpWatch;
- (BOOL)hasSystemAperture;
- (BOOL)idiomSupportsPosters:(int64_t)a3;
- (BOOL)isChineseRegionDevice;
- (CGRect)screenBounds;
- (NSArray)capabilities;
- (NSString)hostname;
- (NSString)localStorageDisplayName;
- (NSString)localizedWiFiDisplayName;
- (NSString)marketingName;
- (NSString)model;
- (NSString)name;
- (NSString)symbolName;
- (NSString)systemBuildNumber;
- (NSString)systemName;
- (NSString)systemVersion;
- (WFDevice)init;
- (double)screenCornerRadius;
- (double)screenScale;
- (id)description;
- (int64_t)chipID;
- (int64_t)idiom;
- (int64_t)platform;
- (os_unfair_lock_s)capabilitiesLock;
@end

@implementation WFDevice

- (int64_t)platform
{
  return 0;
}

+ (WFDevice)currentDevice
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__WFDevice_currentDevice__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentDevice_onceToken != -1) {
    dispatch_once(&currentDevice_onceToken, block);
  }
  v2 = (void *)currentDevice_currentDevice;
  return (WFDevice *)v2;
}

- (NSString)systemVersion
{
  if (systemVersion_onceTokenkMGQProductVersion[0] != -1) {
    dispatch_once(systemVersion_onceTokenkMGQProductVersion, &__block_literal_global_166);
  }
  if (systemVersion_cachedAnswer) {
    v2 = (__CFString *)systemVersion_cachedAnswer;
  }
  else {
    v2 = @"Unknown";
  }
  return (NSString *)v2;
}

- (int64_t)idiom
{
  if (idiom_onceTokenkMGQDeviceClassNumber != -1) {
    dispatch_once(&idiom_onceTokenkMGQDeviceClassNumber, &__block_literal_global_207);
  }
  uint64_t v2 = [(id)idiom_cachedAnswer integerValue];
  if ((unint64_t)(v2 - 1) > 0xA) {
    return -1;
  }
  else {
    return qword_1B3D88BE0[v2 - 1];
  }
}

uint64_t __25__WFDevice_currentDevice__block_invoke()
{
  currentDevice_currentDevice = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (WFDevice)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFDevice;
  uint64_t v2 = [(WFDevice *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_capabilitiesLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

void __17__WFDevice_idiom__block_invoke()
{
  id v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v0 = v3;
    }
    else {
      v0 = 0;
    }
  }
  else
  {
    v0 = 0;
  }
  id v1 = v0;

  uint64_t v2 = (void *)idiom_cachedAnswer;
  idiom_cachedAnswer = (uint64_t)v1;
}

- (BOOL)hasCapability:(id)a3
{
  id v4 = a3;
  v5 = [(WFDevice *)self capabilities];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (NSArray)capabilities
{
  p_capabilitiesLock = &self->_capabilitiesLock;
  os_unfair_lock_lock(&self->_capabilitiesLock);
  p_capabilities = &self->_capabilities;
  if (!self->_capabilities)
  {
    v5 = objc_opt_new();
    if (capabilities_onceTokenkMGQVibratorCapability != -1) {
      dispatch_once(&capabilities_onceTokenkMGQVibratorCapability, &__block_literal_global_213);
    }
    if (capabilities_cachedAnswer) {
      [v5 addObject:@"Vibration"];
    }
    if (capabilities_onceTokenkMGQSupportsForceTouch != -1) {
      dispatch_once(&capabilities_onceTokenkMGQSupportsForceTouch, &__block_literal_global_219);
    }
    if (capabilities_cachedAnswer_217) {
      [v5 addObject:@"ForceTouch"];
    }
    if (capabilities_onceTokenkMGQDeviceSupportsHaptics != -1) {
      dispatch_once(&capabilities_onceTokenkMGQDeviceSupportsHaptics, &__block_literal_global_225);
    }
    if (capabilities_cachedAnswer_223) {
      [v5 addObject:@"Haptic"];
    }
    if (MGGetBoolAnswer()) {
      [v5 addObject:@"Baseband"];
    }
    if (capabilities_onceTokenkMGQCellularDataCapability != -1) {
      dispatch_once(&capabilities_onceTokenkMGQCellularDataCapability, &__block_literal_global_234);
    }
    if (capabilities_cachedAnswer_232) {
      [v5 addObject:@"CellularData"];
    }
    if (capabilities_onceTokenkMGQCellularTelephonyCapability != -1) {
      dispatch_once(&capabilities_onceTokenkMGQCellularTelephonyCapability, &__block_literal_global_240);
    }
    if (capabilities_cachedAnswer_238) {
      [v5 addObject:@"CellularTelephony"];
    }
    if ([(WFDevice *)self idiomSupportsPosters:[(WFDevice *)self idiom]]) {
      [v5 addObject:@"Posters"];
    }
    if (capabilities_onceTokenkMGQDeviceSupportsAlwaysOnTime != -1) {
      dispatch_once(&capabilities_onceTokenkMGQDeviceSupportsAlwaysOnTime, &__block_literal_global_246);
    }
    if (capabilities_cachedAnswer_244) {
      [v5 addObject:@"AlwaysOnDisplay"];
    }
    if (capabilities_onceTokenkMGQRingerSwitchCapability != -1) {
      dispatch_once(&capabilities_onceTokenkMGQRingerSwitchCapability, &__block_literal_global_252);
    }
    if (capabilities_cachedAnswer_250) {
      [v5 addObject:@"HardwareRingerSwitch"];
    }
    if (capabilities_onceTokenkMGQWAPICapability != -1) {
      dispatch_once(&capabilities_onceTokenkMGQWAPICapability, &__block_literal_global_258);
    }
    if (capabilities_cachedAnswer_256) {
      [v5 addObject:@"WAPI"];
    }
    if (capabilities_onceTokenkMGQRingerButtonCapability != -1) {
      dispatch_once(&capabilities_onceTokenkMGQRingerButtonCapability, &__block_literal_global_264);
    }
    if (capabilities_cachedAnswer_262) {
      [v5 addObject:@"ActionButton"];
    }
    if (capabilities_onceTokenkMGQHomeButtonType != -1) {
      dispatch_once(&capabilities_onceTokenkMGQHomeButtonType, &__block_literal_global_269);
    }
    if (capabilities_cachedHasHomeButton) {
      [v5 addObject:@"HomeButton"];
    }
    if (capabilities_onceTokenkMGQDeviceSupportsApplePencil != -1) {
      dispatch_once(&capabilities_onceTokenkMGQDeviceSupportsApplePencil, &__block_literal_global_275);
    }
    if (capabilities_cachedAnswer_273) {
      [v5 addObject:@"ApplePencil"];
    }
    if (capabilities_onceTokenkMGQPersonalHotspotCapability != -1) {
      dispatch_once(&capabilities_onceTokenkMGQPersonalHotspotCapability, &__block_literal_global_281);
    }
    int v6 = capabilities_cachedAnswer_279;
    if (VCIsInternalBuild_onceToken != -1) {
      dispatch_once(&VCIsInternalBuild_onceToken, &__block_literal_global_17849);
    }
    if (VCIsInternalBuild_isInternal)
    {
      int v7 = MGGetBoolAnswer();
      if (!v6)
      {
        if (v7) {
          goto LABEL_61;
        }
      }
    }
    if (v6)
    {
      uint64_t v21 = 0;
      v22 = &v21;
      uint64_t v23 = 0x2050000000;
      v8 = (void *)getMCProfileConnectionClass_softClass;
      uint64_t v24 = getMCProfileConnectionClass_softClass;
      if (!getMCProfileConnectionClass_softClass)
      {
        uint64_t v16 = MEMORY[0x1E4F143A8];
        uint64_t v17 = 3221225472;
        v18 = __getMCProfileConnectionClass_block_invoke;
        v19 = &unk_1E6079C28;
        v20 = &v21;
        __getMCProfileConnectionClass_block_invoke((uint64_t)&v16);
        v8 = (void *)v22[3];
      }
      id v9 = v8;
      _Block_object_dispose(&v21, 8);
      v10 = [v9 sharedConnection];
      int v11 = [v10 isPersonalHotspotModificationAllowed];

      if (v11) {
LABEL_61:
      }
        [v5 addObject:@"PersonalHotspot"];
    }
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    v12 = (void *)getVKCRemoveBackgroundRequestHandlerClass_softClass_14437;
    uint64_t v24 = getVKCRemoveBackgroundRequestHandlerClass_softClass_14437;
    if (!getVKCRemoveBackgroundRequestHandlerClass_softClass_14437)
    {
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __getVKCRemoveBackgroundRequestHandlerClass_block_invoke_14438;
      v19 = &unk_1E6079C28;
      v20 = &v21;
      __getVKCRemoveBackgroundRequestHandlerClass_block_invoke_14438((uint64_t)&v16);
      v12 = (void *)v22[3];
    }
    id v13 = v12;
    _Block_object_dispose(&v21, 8);
    if ([v13 isSupported]) {
      [v5 addObject:@"Scarlett"];
    }
    if (capabilities_onceTokenkMGQDeviceSupportsSingleDisplayEnhancedMultitasking != -1) {
      dispatch_once(&capabilities_onceTokenkMGQDeviceSupportsSingleDisplayEnhancedMultitasking, &__block_literal_global_290);
    }
    if (capabilities_cachedAnswer_288) {
      goto LABEL_72;
    }
    if (capabilities_onceTokenkMGQDeviceSupportsEnhancedMultitasking != -1) {
      dispatch_once(&capabilities_onceTokenkMGQDeviceSupportsEnhancedMultitasking, &__block_literal_global_296);
    }
    if (capabilities_cachedAnswer_294) {
LABEL_72:
    }
      [v5 addObject:@"StageManager"];
    if ([getCBClientClass() supportsAdaptation]) {
      [v5 addObject:@"TrueTone"];
    }
    if ([getCBClientClass() supportsBlueLightReduction]) {
      [v5 addObject:@"NightShift"];
    }
    uint64_t v16 = 0;
    if (!os_eligibility_get_domain_answer() && v16 == 4) {
      [v5 addObject:@"GreyMatter"];
    }
    objc_storeStrong((id *)p_capabilities, v5);
  }
  os_unfair_lock_unlock(p_capabilitiesLock);
  v14 = *p_capabilities;
  return v14;
}

void __24__WFDevice_capabilities__block_invoke_9()
{
  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_262 = v0 == (const void *)*MEMORY[0x1E4F1CFD0];
  if (v0)
  {
    CFRelease(v0);
  }
}

void __24__WFDevice_capabilities__block_invoke_8()
{
  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_256 = v0 == (const void *)*MEMORY[0x1E4F1CFD0];
  if (v0)
  {
    CFRelease(v0);
  }
}

void __24__WFDevice_capabilities__block_invoke_7()
{
  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_250 = v0 == (const void *)*MEMORY[0x1E4F1CFD0];
  if (v0)
  {
    CFRelease(v0);
  }
}

void __24__WFDevice_capabilities__block_invoke_6()
{
  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_244 = v0 == (const void *)*MEMORY[0x1E4F1CFD0];
  if (v0)
  {
    CFRelease(v0);
  }
}

void __24__WFDevice_capabilities__block_invoke_5()
{
  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_238 = v0 == (const void *)*MEMORY[0x1E4F1CFD0];
  if (v0)
  {
    CFRelease(v0);
  }
}

void __24__WFDevice_capabilities__block_invoke_4()
{
  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_232 = v0 == (const void *)*MEMORY[0x1E4F1CFD0];
  if (v0)
  {
    CFRelease(v0);
  }
}

void __24__WFDevice_capabilities__block_invoke_3()
{
  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_223 = v0 == (const void *)*MEMORY[0x1E4F1CFD0];
  if (v0)
  {
    CFRelease(v0);
  }
}

void __24__WFDevice_capabilities__block_invoke_2()
{
  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_217 = v0 == (const void *)*MEMORY[0x1E4F1CFD0];
  if (v0)
  {
    CFRelease(v0);
  }
}

void __24__WFDevice_capabilities__block_invoke_12()
{
  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_279 = v0 == (const void *)*MEMORY[0x1E4F1CFD0];
  if (v0)
  {
    CFRelease(v0);
  }
}

void __24__WFDevice_capabilities__block_invoke_11()
{
  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_273 = v0 == (const void *)*MEMORY[0x1E4F1CFD0];
  if (v0)
  {
    CFRelease(v0);
  }
}

uint64_t __24__WFDevice_capabilities__block_invoke_10()
{
  uint64_t result = MGGetSInt32Answer();
  capabilities_cachedHasHomeButton = result != 2;
  return result;
}

void __24__WFDevice_capabilities__block_invoke()
{
  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer = v0 == (const void *)*MEMORY[0x1E4F1CFD0];
  if (v0)
  {
    CFRelease(v0);
  }
}

- (BOOL)idiomSupportsPosters:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

- (void).cxx_destruct
{
}

- (os_unfair_lock_s)capabilitiesLock
{
  return self->_capabilitiesLock;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)WFDevice;
  id v4 = [(WFDevice *)&v11 description];
  v5 = [(WFDevice *)self marketingName];
  int v6 = [(WFDevice *)self systemName];
  int v7 = [(WFDevice *)self systemVersion];
  v8 = [(WFDevice *)self systemBuildNumber];
  id v9 = [v3 stringWithFormat:@"<%@: %@ (%@ %@ %@)>", v4, v5, v6, v7, v8];

  return v9;
}

- (NSString)symbolName
{
  id v3 = @"ipodtouch";
  switch([(WFDevice *)self idiom])
  {
    case 1:
      BOOL v4 = [(WFDevice *)self hasCapability:@"HomeButton"];
      v5 = @"ipad.gen2";
      int v6 = @"ipad.gen1";
      goto LABEL_11;
    case 2:
      size_t size = 0;
      sysctlbyname("hw.model", 0, &size, 0, 0);
      int v7 = malloc_type_malloc(size, 0x6EC04381uLL);
      sysctlbyname("hw.model", v7, &size, 0, 0);
      id v8 = [NSString alloc];
      id v9 = (void *)[v8 initWithBytesNoCopy:v7 length:size - 1 encoding:4 freeWhenDone:1];
      if ([v9 containsString:@"MacBook"]) {
        id v3 = @"macbook";
      }
      else {
        id v3 = @"desktopcomputer";
      }

      break;
    case 3:
      id v3 = @"applewatch";
      break;
    case 4:
      return (NSString *)v3;
    default:
      if ([(WFDevice *)self hasCapability:@"HomeButton"])
      {
        id v3 = @"iphone.gen1";
      }
      else
      {
        BOOL v4 = [(WFDevice *)self hasSystemAperture];
        v5 = @"iphone.gen2";
        int v6 = @"iphone.gen3";
LABEL_11:
        if (v4) {
          id v3 = v6;
        }
        else {
          id v3 = v5;
        }
      }
      break;
  }
  return (NSString *)v3;
}

- (NSString)localStorageDisplayName
{
  unint64_t v2 = [(WFDevice *)self idiom];
  if (v2 > 4) {
    id v3 = @"On My Device";
  }
  else {
    id v3 = off_1E6079CE8[v2];
  }
  BOOL v4 = WFLocalizedString(v3);
  return (NSString *)v4;
}

- (BOOL)hasPairedAndSetUpWatch
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  unint64_t v2 = (void *)getNRPairedDeviceRegistryClass_softClass;
  uint64_t v12 = getNRPairedDeviceRegistryClass_softClass;
  if (!getNRPairedDeviceRegistryClass_softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getNRPairedDeviceRegistryClass_block_invoke;
    v8[3] = &unk_1E6079C28;
    v8[4] = &v9;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)v8);
    unint64_t v2 = (void *)v10[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v9, 8);
  BOOL v4 = [v3 sharedInstance];
  v5 = [v4 getSetupCompletedDevices];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (BOOL)hasSystemAperture
{
  return MEMORY[0x1F415C3A0](self, a2);
}

- (BOOL)isChineseRegionDevice
{
  unint64_t v2 = +[WFDevice systemShortcutsUserDefaults];
  if ([v2 BOOLForKey:@"WFGreenTeaOverridingKey"])
  {
    if (VCIsInternalBuild_onceToken != -1) {
      dispatch_once(&VCIsInternalBuild_onceToken, &__block_literal_global_17849);
    }
    BOOL v3 = VCIsInternalBuild_isInternal != 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  if (+[WFDevice deviceIsGreenTea]) {
    return 1;
  }
  else {
    return +[WFDevice deviceIsChinaSKU] || v3;
  }
}

- (int64_t)chipID
{
  if (chipID_onceTokenkMGQChipID != -1) {
    dispatch_once(&chipID_onceTokenkMGQChipID, &__block_literal_global_312);
  }
  unint64_t v2 = (void *)chipID_cachedAnswer;
  return [v2 longLongValue];
}

void __18__WFDevice_chipID__block_invoke()
{
  id v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v0 = v3;
    }
    else {
      v0 = 0;
    }
  }
  else
  {
    v0 = 0;
  }
  id v1 = v0;

  unint64_t v2 = (void *)chipID_cachedAnswer;
  chipID_cachedAnswer = (uint64_t)v1;
}

- (NSString)hostname
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (gethostname(v4, 0xFFuLL))
  {
    unint64_t v2 = 0;
  }
  else
  {
    unint64_t v2 = [NSString stringWithUTF8String:v4];
  }
  return (NSString *)v2;
}

- (NSString)marketingName
{
  if (marketingName_onceTokenkMGQMarketingNameString != -1) {
    dispatch_once(&marketingName_onceTokenkMGQMarketingNameString, &__block_literal_global_307);
  }
  unint64_t v2 = (void *)marketingName_cachedAnswer;
  return (NSString *)v2;
}

void __25__WFDevice_marketingName__block_invoke()
{
  id v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v0 = v3;
    }
    else {
      v0 = 0;
    }
  }
  else
  {
    v0 = 0;
  }
  id v1 = v0;

  unint64_t v2 = (void *)marketingName_cachedAnswer;
  marketingName_cachedAnswer = (uint64_t)v1;
}

- (NSString)localizedWiFiDisplayName
{
  if ([(WFDevice *)self hasCapability:@"WAPI"]) {
    unint64_t v2 = @"WLAN";
  }
  else {
    unint64_t v2 = @"Wi-Fi";
  }
  id v3 = WFLocalizedString(v2);
  return (NSString *)v3;
}

void __24__WFDevice_capabilities__block_invoke_14()
{
  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_294 = v0 == (const void *)*MEMORY[0x1E4F1CFD0];
  if (v0)
  {
    CFRelease(v0);
  }
}

void __24__WFDevice_capabilities__block_invoke_13()
{
  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_288 = v0 == (const void *)*MEMORY[0x1E4F1CFD0];
  if (v0)
  {
    CFRelease(v0);
  }
}

- (NSString)systemName
{
  if (systemName_onceTokenkMGQMarketingProductName != -1) {
    dispatch_once(&systemName_onceTokenkMGQMarketingProductName, &__block_literal_global_196);
  }
  unint64_t v2 = (__CFString *)(id)systemName_cachedAnswer;
  id v3 = v2;
  if (!v2)
  {
    if (systemName_onceTokenkMGQProductName != -1) {
      dispatch_once(&systemName_onceTokenkMGQProductName, &__block_literal_global_202);
    }
    unint64_t v2 = (__CFString *)(id)systemName_cachedAnswer_200;
    id v3 = v2;
    if (!v2) {
      unint64_t v2 = @"Unknown";
    }
  }
  BOOL v4 = v2;

  return (NSString *)v4;
}

void __22__WFDevice_systemName__block_invoke_2()
{
  id v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v0 = v3;
    }
    else {
      v0 = 0;
    }
  }
  else
  {
    v0 = 0;
  }
  id v1 = v0;

  unint64_t v2 = (void *)systemName_cachedAnswer_200;
  systemName_cachedAnswer_200 = (uint64_t)v1;
}

void __22__WFDevice_systemName__block_invoke()
{
  id v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v0 = v3;
    }
    else {
      v0 = 0;
    }
  }
  else
  {
    v0 = 0;
  }
  id v1 = v0;

  unint64_t v2 = (void *)systemName_cachedAnswer;
  systemName_cachedAnswer = (uint64_t)v1;
}

- (NSString)model
{
  if (model_onceTokenkMGQDeviceName != -1) {
    dispatch_once(&model_onceTokenkMGQDeviceName, &__block_literal_global_185);
  }
  unint64_t v2 = (__CFString *)(id)model_cachedAnswer;
  id v3 = v2;
  if (v2)
  {
    if ([(__CFString *)v2 isEqualToString:@"iPod"]) {
      BOOL v4 = @"iPod touch";
    }
    else {
      BOOL v4 = v3;
    }
  }
  else
  {
    BOOL v4 = @"Unknown";
  }
  uint64_t v5 = v4;

  return v5;
}

void __17__WFDevice_model__block_invoke()
{
  id v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v0 = v3;
    }
    else {
      v0 = 0;
    }
  }
  else
  {
    v0 = 0;
  }
  id v1 = v0;

  unint64_t v2 = (void *)model_cachedAnswer;
  model_cachedAnswer = (uint64_t)v1;
}

- (NSString)name
{
  if (name_onceTokenkMGQUserAssignedDeviceName != -1) {
    dispatch_once(&name_onceTokenkMGQUserAssignedDeviceName, &__block_literal_global_180);
  }
  if (name_cachedAnswer) {
    unint64_t v2 = (__CFString *)name_cachedAnswer;
  }
  else {
    unint64_t v2 = @"Unknown";
  }
  return (NSString *)v2;
}

void __16__WFDevice_name__block_invoke()
{
  id v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v0 = v3;
    }
    else {
      v0 = 0;
    }
  }
  else
  {
    v0 = 0;
  }
  id v1 = v0;

  unint64_t v2 = (void *)name_cachedAnswer;
  name_cachedAnswer = (uint64_t)v1;
}

- (NSString)systemBuildNumber
{
  if (systemBuildNumber_onceTokenkMGQBuildVersion != -1) {
    dispatch_once(&systemBuildNumber_onceTokenkMGQBuildVersion, &__block_literal_global_175);
  }
  if (systemBuildNumber_cachedAnswer) {
    unint64_t v2 = (__CFString *)systemBuildNumber_cachedAnswer;
  }
  else {
    unint64_t v2 = @"Unknown";
  }
  return (NSString *)v2;
}

void __29__WFDevice_systemBuildNumber__block_invoke()
{
  id v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v0 = v3;
    }
    else {
      v0 = 0;
    }
  }
  else
  {
    v0 = 0;
  }
  id v1 = v0;

  unint64_t v2 = (void *)systemBuildNumber_cachedAnswer;
  systemBuildNumber_cachedAnswer = (uint64_t)v1;
}

void __25__WFDevice_systemVersion__block_invoke()
{
  id v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v0 = v3;
    }
    else {
      v0 = 0;
    }
  }
  else
  {
    v0 = 0;
  }
  id v1 = v0;

  unint64_t v2 = (void *)systemVersion_cachedAnswer;
  systemVersion_cachedAnswer = (uint64_t)v1;
}

- (double)screenCornerRadius
{
  if (screenCornerRadius_onceTokenkMGQDeviceCornerRadius != -1) {
    dispatch_once(&screenCornerRadius_onceTokenkMGQDeviceCornerRadius, &__block_literal_global_161_14509);
  }
  unint64_t v2 = (void *)screenCornerRadius_cachedAnswer;
  [v2 doubleValue];
  return result;
}

void __30__WFDevice_screenCornerRadius__block_invoke()
{
  id v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v0 = v3;
    }
    else {
      v0 = 0;
    }
  }
  else
  {
    v0 = 0;
  }
  id v1 = v0;

  unint64_t v2 = (void *)screenCornerRadius_cachedAnswer;
  screenCornerRadius_cachedAnswer = (uint64_t)v1;
}

- (double)screenScale
{
  if (screenScale_onceTokenkMGQMainScreenScale != -1) {
    dispatch_once(&screenScale_onceTokenkMGQMainScreenScale, &__block_literal_global_156);
  }
  [(id)screenScale_cachedAnswer doubleValue];
  if (result <= 0.0) {
    return 1.0;
  }
  return result;
}

void __23__WFDevice_screenScale__block_invoke()
{
  id v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v0 = v3;
    }
    else {
      v0 = 0;
    }
  }
  else
  {
    v0 = 0;
  }
  id v1 = v0;

  unint64_t v2 = (void *)screenScale_cachedAnswer;
  screenScale_cachedAnswer = (uint64_t)v1;
}

- (CGRect)screenBounds
{
  if (screenBounds_onceTokenkMGQMainScreenWidth != -1) {
    dispatch_once(&screenBounds_onceTokenkMGQMainScreenWidth, &__block_literal_global_14517);
  }
  id v3 = (id)screenBounds_cachedAnswer;
  if (screenBounds_onceTokenkMGQMainScreenHeight != -1) {
    dispatch_once(&screenBounds_onceTokenkMGQMainScreenHeight, &__block_literal_global_151);
  }
  id v4 = (id)screenBounds_cachedAnswer_149;
  [(WFDevice *)self screenScale];
  if (v5 == 0.0)
  {
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    double v10 = v5;
    [v3 doubleValue];
    double v8 = v11 / v10;
    [v4 doubleValue];
    double v6 = 0.0;
    double v7 = 0.0;
    double v9 = v12 / v10;
  }

  double v13 = v6;
  double v14 = v7;
  double v15 = v8;
  double v16 = v9;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

void __24__WFDevice_screenBounds__block_invoke_2()
{
  id v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v0 = v3;
    }
    else {
      v0 = 0;
    }
  }
  else
  {
    v0 = 0;
  }
  id v1 = v0;

  unint64_t v2 = (void *)screenBounds_cachedAnswer_149;
  screenBounds_cachedAnswer_149 = (uint64_t)v1;
}

void __24__WFDevice_screenBounds__block_invoke()
{
  id v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v0 = v3;
    }
    else {
      v0 = 0;
    }
  }
  else
  {
    v0 = 0;
  }
  id v1 = v0;

  unint64_t v2 = (void *)screenBounds_cachedAnswer;
  screenBounds_cachedAnswer = (uint64_t)v1;
}

+ (id)systemShortcutsUserDefaults
{
  if (systemShortcutsUserDefaults_onceToken[0] != -1) {
    dispatch_once(systemShortcutsUserDefaults_onceToken, &__block_literal_global_391);
  }
  unint64_t v2 = (void *)systemShortcutsUserDefaults_systemShortcutsUserDefaults;
  return v2;
}

uint64_t __39__WFDevice_systemShortcutsUserDefaults__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.siri.shortcuts"];
  uint64_t v1 = systemShortcutsUserDefaults_systemShortcutsUserDefaults;
  systemShortcutsUserDefaults_systemShortcutsUserDefaults = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)deviceIsChinaSKU
{
  if (deviceIsChinaSKU_onceToken != -1) {
    dispatch_once(&deviceIsChinaSKU_onceToken, &__block_literal_global_383);
  }
  return deviceIsChinaSKU_deviceIsChinaSKU;
}

void __28__WFDevice_deviceIsChinaSKU__block_invoke()
{
  id v0 = (id)MGCopyAnswer();
  deviceIsChinaSKU_deviceIsChinaSKU = [v0 caseInsensitiveCompare:@"CH"] == 0;
}

+ (BOOL)deviceIsGreenTea
{
  if (deviceIsGreenTea_onceToken != -1) {
    dispatch_once(&deviceIsGreenTea_onceToken, &__block_literal_global_378);
  }
  return deviceIsGreenTea_deviceIsGreenTea;
}

uint64_t __28__WFDevice_deviceIsGreenTea__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  deviceIsGreenTea_deviceIsGreenTea = result;
  return result;
}

@end
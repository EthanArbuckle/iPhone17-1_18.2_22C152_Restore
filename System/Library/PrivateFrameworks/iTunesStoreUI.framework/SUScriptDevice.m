@interface SUScriptDevice
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSArray)automaticDownloadMediaTypes;
- (NSNumber)diskSpaceAvailable;
- (NSNumber)mainScreenScale;
- (NSNumber)metricsPostFrequencyOverride;
- (NSString)UTIImage;
- (NSString)UTIMovie;
- (NSString)UTIText;
- (NSString)capabilityNameEmail;
- (NSString)capabilityNameExplicitMedia;
- (NSString)capabilityNameHDVideo;
- (NSString)capabilityNameHDVideo1080p;
- (NSString)capabilityNameHDVideo720p;
- (NSString)capabilityNamePodcasts;
- (NSString)capabilityNameWiFi;
- (NSString)freeSpaceOptionEffortLevel;
- (NSString)orientationStringLandscapeLeft;
- (NSString)orientationStringLandscapeRight;
- (NSString)orientationStringPortrait;
- (NSString)orientationStringPortraitUpsideDown;
- (NSString)restrictionAccountModificationAllowed;
- (NSString)restrictionAllowGlobalBackgroundFetchWhenRoaming;
- (NSString)restrictionAllowVoiceDialing;
- (NSString)restrictionAppInstallationAllowed;
- (NSString)restrictionAppRemovalAllowed;
- (NSString)restrictionBookStoreAllowed;
- (NSString)restrictionBookStoreEroticaAllowed;
- (NSString)restrictionCameraAllowed;
- (NSString)restrictionCellularHDUploadsAllowed;
- (NSString)restrictionITunesAllowed;
- (NSString)restrictionITunesSocialAllowed;
- (NSString)restrictionMultiplayerGamingAllowed;
- (NSString)restrictionSafariAllowed;
- (NSString)restrictionScreenShotAllowed;
- (NSString)restrictionTypeApplications;
- (NSString)restrictionTypeMovies;
- (NSString)restrictionTypeTelevision;
- (NSString)restrictionVideoConferencingAllowed;
- (NSString)restrictionYouTubeAllowed;
- (SUScriptColor)accessibilitySingleColor;
- (SUScriptDevice)init;
- (SUScriptDictionary)diskUsageDictionary;
- (id)UTIForURL:(id)a3;
- (id)_className;
- (id)accessibilityBoldTextEnabled;
- (id)accessibilityButtonShapesEnabled;
- (id)accessibilityDarkenSystemColors;
- (id)accessibilityEnhanceBackgroundContrast;
- (id)accessibilityMotionAutoPlayVideo;
- (id)accessibilitySingleColorSelected;
- (id)accessibilityUseDarkerKeyboard;
- (id)checkCapabilitiesPropertyListString:(id)a3 showFailureDialog:(BOOL)a4;
- (id)getMachineIdentifierForAccountIdentifier:(id)a3;
- (id)hasCapability:(id)a3;
- (id)isRestrictionLockedDown:(id)a3;
- (id)needsToneRegrantOption;
- (id)restrictionExplicitMedia;
- (id)restrictionLevelForType:(id)a3;
- (id)scriptAttributeKeys;
- (id)valueForRestriction:(id)a3;
- (int64_t)BOOLValueForRestriction:(id)a3;
- (int64_t)_deviceCapabilityForString:(id)a3;
- (int64_t)activeNetworkType;
- (int64_t)freeSpaceEffortLevelAutomaticOnly;
- (int64_t)freeSpaceEffortLevelDoNothing;
- (int64_t)freeSpaceEffortLevelManualSpaceManagement;
- (int64_t)freeSpaceEffortLevelPromptUser;
- (int64_t)hardwareType;
- (int64_t)hardwareTypeAppleTVJ33;
- (int64_t)hardwareTypeAppleTVK66;
- (int64_t)hardwareTypeIPadJ1;
- (int64_t)hardwareTypeIPadJ2;
- (int64_t)hardwareTypeIPadJ2a;
- (int64_t)hardwareTypeIPadK93;
- (int64_t)hardwareTypeIPadK93a;
- (int64_t)hardwareTypeIPadK94;
- (int64_t)hardwareTypeIPadK95;
- (int64_t)hardwareTypeIPhoneM68;
- (int64_t)hardwareTypeIPhoneN82;
- (int64_t)hardwareTypeIPhoneN88;
- (int64_t)hardwareTypeIPhoneN90;
- (int64_t)hardwareTypeIPhoneN92;
- (int64_t)hardwareTypeIPhoneN94;
- (int64_t)hardwareTypeIPodTouchN18;
- (int64_t)hardwareTypeIPodTouchN45;
- (int64_t)hardwareTypeIPodTouchN72;
- (int64_t)hardwareTypeIPodTouchN81;
- (int64_t)hardwareTypeIPodTouchN81a;
- (int64_t)hardwareTypeUnknown;
- (int64_t)hardwareTypeWildcatK48;
- (int64_t)networkType2G;
- (int64_t)networkType3G;
- (int64_t)networkType4G;
- (int64_t)networkType5G;
- (int64_t)networkType6G;
- (int64_t)networkType7G;
- (int64_t)networkType8G;
- (int64_t)networkType9G;
- (int64_t)networkTypeNone;
- (int64_t)networkTypeWiFi;
- (int64_t)restrictionBoolNo;
- (int64_t)restrictionBoolNoData;
- (int64_t)restrictionBoolYes;
- (unsigned)deviceTypeIdentifier;
- (void)_accessibilitySettingsChangedNotification:(id)a3;
- (void)_addScriptFunction:(id)a3;
- (void)_autoDownloadKindsChangedNotification:(id)a3;
- (void)_removeScriptFunction:(id)a3;
- (void)dealloc;
- (void)requestFreeSpaceWithBytes:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)setAutomaticDownloadKinds:(id)a3 withCompletionHandler:(id)a4;
- (void)setDiskUsageDictionary:(id)a3;
- (void)setValueForRestriction:(id)a3 enabled:(id)a4;
@end

@implementation SUScriptDevice

- (SUScriptDevice)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptDevice;
  v2 = [(SUScriptObject *)&v5 init];
  if (v2)
  {
    v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__autoDownloadKindsChangedNotification_ name:*MEMORY[0x263F7B4C8] object:0];
    [v3 addObserver:v2 selector:sel__accessibilitySettingsChangedNotification_ name:*MEMORY[0x263F1CDE0] object:0];
    [v3 addObserver:v2 selector:sel__accessibilitySettingsChangedNotification_ name:*MEMORY[0x263F1CDF0] object:0];
    [v3 addObserver:v2 selector:sel__accessibilitySettingsChangedNotification_ name:*MEMORY[0x263F1CF80] object:0];
    [v3 addObserver:v2 selector:sel__accessibilitySettingsChangedNotification_ name:*MEMORY[0x263F1CE58] object:0];
    [v3 addObserver:v2 selector:sel__accessibilitySettingsChangedNotification_ name:*MEMORY[0x263F1CE70] object:0];
    [v3 addObserver:v2 selector:sel__accessibilitySettingsChangedNotification_ name:*MEMORY[0x263F1CF78] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F7B4C8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1CDE0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1CDF0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1CF80] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1CE58] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1CE70] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1CF78] object:0];
  [(NSMutableArray *)self->_scriptFunctions makeObjectsPerformSelector:sel_setThisObject_ withObject:0];

  v4.receiver = self;
  v4.super_class = (Class)SUScriptDevice;
  [(SUScriptObject *)&v4 dealloc];
}

- (int64_t)BOOLValueForRestriction:(id)a3
{
  if (objc_opt_isKindOfClass()) {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x263F53C50], "sharedConnection"), "effectiveBoolValueForSetting:", a3);
  }
  [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  return 0;
}

- (id)checkCapabilitiesPropertyListString:(id)a3 showFailureDialog:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263F086B0]);
  uint64_t v7 = SUScriptPropertyListFromString(a3);
  if (v7)
  {
    id v11 = 0;
    int v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F89480], "sharedInstance"), "checkCapabilities:withMismatches:", v7, &v11);
    if ((v8 & 1) == 0 && v4) {
      WebThreadRunOnMainThread();
    }

    v9 = (id *)MEMORY[0x263EFFB40];
    if (!v8) {
      v9 = (id *)MEMORY[0x263EFFB38];
    }
  }
  else
  {

    v9 = (id *)MEMORY[0x263EFFB38];
  }
  return *v9;
}

void __72__SUScriptDevice_checkCapabilitiesPropertyListString_showFailureDialog___block_invoke(uint64_t a1)
{
  id v1 = (id)[objc_alloc(MEMORY[0x263F89510]) initWithRequiredCapabilities:*(void *)(a1 + 32) mismatches:*(void *)(a1 + 40)];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F894E0], "mainQueue"), "addOperation:", v1);
}

- (id)getMachineIdentifierForAccountIdentifier:(id)a3
{
  if (objc_opt_respondsToSelector()) {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "unsignedLongLongValue"));
  }
  else {
    uint64_t v4 = 0;
  }
  id v9 = 0;
  objc_super v5 = 0;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B148], "currentDevice", 0), "getMachineIdentifier:otp:forAccountIdentifier:", &v9, &v8, v4))
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (v9) {
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(v9, "base64EncodedStringWithOptions:", 0), @"mid");
    }
    if (v8) {
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(v8, "base64EncodedStringWithOptions:", 0), @"otp");
    }
    objc_super v5 = [[SUScriptDictionary alloc] initWithDictionary:v6];
  }
  return v5;
}

- (id)hasCapability:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (objc_msgSend(a3, "isEqualToString:", -[SUScriptDevice capabilityNameEmail](self, "capabilityNameEmail")))
    {
      if (!CPCanSendMail()) {
        goto LABEL_6;
      }
LABEL_13:
      objc_super v5 = (id *)MEMORY[0x263EFFB40];
      return *v5;
    }
    if (objc_msgSend(a3, "isEqualToString:", -[SUScriptDevice capabilityNameExplicitMedia](self, "capabilityNameExplicitMedia")))
    {
      if ((SSRestrictionsShouldRestrictExplicitContent() & 1) == 0) {
        goto LABEL_13;
      }
    }
    else
    {
      if (objc_msgSend(a3, "isEqualToString:", -[SUScriptDevice capabilityNamePodcasts](self, "capabilityNamePodcasts")))goto LABEL_13; {
      int64_t v6 = [(SUScriptDevice *)self _deviceCapabilityForString:a3];
      }
      if (v6 == -1)
      {
        CFBooleanRef v8 = (const __CFBoolean *)MGCopyAnswer();
        if (v8)
        {
          CFBooleanRef v9 = v8;
          CFTypeID v10 = CFGetTypeID(v8);
          if (v10 == CFBooleanGetTypeID())
          {
            int Value = CFBooleanGetValue(v9);
            CFRelease(v9);
            if (!Value) {
              goto LABEL_6;
            }
            goto LABEL_13;
          }
          CFRelease(v9);
        }
      }
      else if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B148], "currentDevice"), "supportsDeviceCapability:", v6))
      {
        goto LABEL_13;
      }
    }
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
LABEL_6:
  objc_super v5 = (id *)MEMORY[0x263EFFB38];
  return *v5;
}

- (id)isRestrictionLockedDown:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F53C50], "sharedConnection"), "isBoolSettingLockedDownByRestrictions:", a3);
    objc_super v5 = (id *)MEMORY[0x263EFFB40];
    if (!v4) {
      objc_super v5 = (id *)MEMORY[0x263EFFB38];
    }
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    objc_super v5 = (id *)MEMORY[0x263EFFB38];
  }
  return *v5;
}

- (void)requestFreeSpaceWithBytes:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFBooleanRef v9 = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    CFBooleanRef v9 = 0;
    if (a5 && (isKindOfClass & 1) == 0) {
      CFBooleanRef v9 = [[SUScriptFunction alloc] initWithScriptObject:a5];
    }
  }
  [(SUScriptDevice *)self _addScriptFunction:v9];
  if (a4) {
    a4 = (id)objc_msgSend(a4, "safeValueForKey:", -[SUScriptDevice freeSpaceOptionEffortLevel](self, "freeSpaceOptionEffortLevel"));
  }
  if (objc_opt_respondsToSelector())
  {
    id v11 = objc_alloc(NSDictionary);
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a4, "intValue"));
    v13 = objc_msgSend(v11, "initWithObjectsAndKeys:", v12, *MEMORY[0x263F255E0], 0);
  }
  else
  {
    v13 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a3 unsignedLongLongValue];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      strtoull((const char *)[a3 UTF8String], 0, 10);
    }
  }
  CPFreeSpaceRequestBytesAtPathWithCompletionBlock();
}

uint64_t __70__SUScriptDevice_requestFreeSpaceWithBytes_options_completionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  objc_super v5 = *(void **)(a1 + 32);
  int64_t v6 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v7 = [NSNumber numberWithBool:a2 != 0];
  objc_msgSend(v5, "callWithArguments:", objc_msgSend(v6, "arrayWithObjects:", v7, objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", a3), 0));
  uint64_t v9 = *(void *)(a1 + 32);
  CFBooleanRef v8 = *(void **)(a1 + 40);

  return [v8 _removeScriptFunction:v9];
}

- (id)restrictionLevelForType:(id)a3
{
  if (objc_msgSend(a3, "isEqual:", -[SUScriptDevice restrictionTypeApplications](self, "restrictionTypeApplications"))|| objc_msgSend(a3, "isEqual:", -[SUScriptDevice restrictionTypeMovies](self, "restrictionTypeMovies"))|| objc_msgSend(a3, "isEqual:", -[SUScriptDevice restrictionTypeTelevision](self, "restrictionTypeTelevision")))
  {
    objc_super v5 = (void *)SSRestrictionsCopyRankForMediaType();
    return v5;
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    return 0;
  }
}

- (void)setAutomaticDownloadKinds:(id)a3 withCompletionHandler:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = 0;
  }
  uint64_t v7 = [a3 copyArrayValueWithValidator:SUISAValidator context:objc_opt_class()];
  if (v7)
  {
    CFBooleanRef v8 = (void *)v7;
    if (a4) {
      a4 = [[SUScriptFunction alloc] initWithScriptObject:a4];
    }
    [(SUScriptDevice *)self _addScriptFunction:a4];
    uint64_t v9 = (void *)[MEMORY[0x263F7B148] currentDevice];
    uint64_t v10 = [MEMORY[0x263EFFA08] setWithArray:v8];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __66__SUScriptDevice_setAutomaticDownloadKinds_withCompletionHandler___block_invoke;
    v12[3] = &unk_264813DE8;
    v12[4] = a4;
    v12[5] = self;
    [v9 setAutomaticDownloadKinds:v10 withCompletionBlock:v12];
  }
  else
  {
    id v11 = (void *)MEMORY[0x263F1FA90];
    [v11 throwException:@"Invalid argument"];
  }
}

uint64_t __66__SUScriptDevice_setAutomaticDownloadKinds_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "callWithArguments:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", objc_msgSend(NSNumber, "numberWithBool:", a2)));
  uint64_t v4 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);

  return [v3 _removeScriptFunction:v4];
}

- (void)setValueForRestriction:(id)a3 enabled:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    int64_t v6 = (void *)[MEMORY[0x263F53C50] sharedConnection];
    uint64_t v7 = [a4 BOOLValue];
    [v6 setBoolValue:v7 forSetting:a3];
  }
  else
  {
    CFBooleanRef v8 = (void *)MEMORY[0x263F1FA90];
    [v8 throwException:@"Invalid argument"];
  }
}

- (id)UTIForURL:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (uint64_t v4 = (void *)[objc_alloc(NSURL) initWithString:a3]) != 0)
  {
    objc_super v5 = v4;
    CFStringRef v6 = (id)SUCopyUTIForFilePath((void *)[v4 path], 1);

    return (id)v6;
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    return 0;
  }
}

- (id)valueForRestriction:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = (void *)[MEMORY[0x263F53C50] sharedConnection];
    return (id)[v4 effectiveValueForSetting:a3];
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    return 0;
  }
}

- (id)accessibilityBoldTextEnabled
{
  BOOL IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (id *)MEMORY[0x263EFFB40];
  if (!IsBoldTextEnabled) {
    v3 = (id *)MEMORY[0x263EFFB38];
  }
  return *v3;
}

- (id)accessibilityButtonShapesEnabled
{
  int v2 = _UIAccessibilityButtonShapesEnabled();
  v3 = (id *)MEMORY[0x263EFFB40];
  if (!v2) {
    v3 = (id *)MEMORY[0x263EFFB38];
  }
  return *v3;
}

- (id)accessibilityDarkenSystemColors
{
  BOOL v2 = UIAccessibilityDarkerSystemColorsEnabled();
  v3 = (id *)MEMORY[0x263EFFB40];
  if (!v2) {
    v3 = (id *)MEMORY[0x263EFFB38];
  }
  return *v3;
}

- (id)accessibilityEnhanceBackgroundContrast
{
  BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  v3 = (id *)MEMORY[0x263EFFB40];
  if (!IsReduceTransparencyEnabled) {
    v3 = (id *)MEMORY[0x263EFFB38];
  }
  return *v3;
}

- (id)accessibilityMotionAutoPlayVideo
{
  BOOL IsVideoAutoplayEnabled = UIAccessibilityIsVideoAutoplayEnabled();
  v3 = (id *)MEMORY[0x263EFFB40];
  if (!IsVideoAutoplayEnabled) {
    v3 = (id *)MEMORY[0x263EFFB38];
  }
  return *v3;
}

- (id)accessibilitySingleColorSelected
{
  int IsSingleColorSelected = _UIAccessibilityIsSingleColorSelected();
  v3 = (id *)MEMORY[0x263EFFB40];
  if (!IsSingleColorSelected) {
    v3 = (id *)MEMORY[0x263EFFB38];
  }
  return *v3;
}

- (SUScriptColor)accessibilitySingleColor
{
  BOOL v2 = [[SUScriptColor alloc] initWithUIColor:_UIAccessibilitySingleSystemColor()];

  return v2;
}

- (id)accessibilityUseDarkerKeyboard
{
  int v2 = _UIAccessibilityUseDarkerKeyboard();
  v3 = (id *)MEMORY[0x263EFFB40];
  if (!v2) {
    v3 = (id *)MEMORY[0x263EFFB38];
  }
  return *v3;
}

- (int64_t)activeNetworkType
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F894C0], "sharedInstance"), "networkType");
  switch(v3)
  {
    case 1:
      int64_t result = [(SUScriptDevice *)self networkType2G];
      break;
    case 2:
      int64_t result = [(SUScriptDevice *)self networkType3G];
      break;
    case 3:
      int64_t result = [(SUScriptDevice *)self networkType4G];
      break;
    case 4:
      int64_t result = [(SUScriptDevice *)self networkType5G];
      break;
    case 5:
      int64_t result = [(SUScriptDevice *)self networkType6G];
      break;
    case 6:
      int64_t result = [(SUScriptDevice *)self networkType7G];
      break;
    case 7:
      int64_t result = [(SUScriptDevice *)self networkType8G];
      break;
    case 8:
      int64_t result = [(SUScriptDevice *)self networkType9G];
      break;
    default:
      if (v3 == 1000)
      {
        int64_t result = [(SUScriptDevice *)self networkTypeWiFi];
      }
      else
      {
        int64_t result = [(SUScriptDevice *)self networkTypeNone];
      }
      break;
  }
  return result;
}

- (NSArray)automaticDownloadMediaTypes
{
  int v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B148], "currentDevice"), "automaticDownloadKinds"), "allObjects");

  return (NSArray *)[v2 sortedArrayUsingSelector:sel_compare_];
}

- (id)_className
{
  return @"iTunesDevice";
}

- (unsigned)deviceTypeIdentifier
{
  int v2 = (void *)[MEMORY[0x263F7B148] currentDevice];

  return [v2 deviceTypeIdentifier];
}

- (NSNumber)diskSpaceAvailable
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  uint64_t v12 = __Block_byref_object_copy__38;
  v13 = __Block_byref_object_dispose__38;
  uint64_t v14 = 0;
  id v2 = objc_alloc(NSDictionary);
  uint64_t v3 = [NSNumber numberWithInteger:0];
  uint64_t v4 = objc_msgSend(v2, "initWithObjectsAndKeys:", v3, *MEMORY[0x263F255E0], 0);
  objc_super v5 = dispatch_semaphore_create(0);
  CPFreeSpaceRequestBytesAtPathWithCompletionBlock();
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v5);

  id v6 = (id)v10[5];
  uint64_t v7 = (NSNumber *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v7;
}

intptr_t __36__SUScriptDevice_diskSpaceAvailable__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [objc_alloc(NSNumber) initWithUnsignedLongLong:a3];
  uint64_t v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

- (SUScriptDictionary)diskUsageDictionary
{
  v15[10] = *MEMORY[0x263EF8340];
  uint64_t v2 = MGCopyAnswer();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = *MEMORY[0x263F8BD68];
    v15[0] = @"totalSystemCapacity";
    v15[1] = v4;
    uint64_t v5 = *MEMORY[0x263F8BD50];
    v15[2] = @"totalSystemAvailable";
    v15[3] = v5;
    uint64_t v6 = *MEMORY[0x263F8BD30];
    v15[4] = @"totalDataCapacity";
    v15[5] = v6;
    uint64_t v7 = *MEMORY[0x263F8BD20];
    v15[6] = @"totalDataAvailable";
    v15[7] = v7;
    uint64_t v8 = *MEMORY[0x263F8BD40];
    v15[8] = @"totalDiskCapacity";
    v15[9] = v8;
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    for (uint64_t i = 0; i != 10; i += 2)
    {
      uint64_t v11 = v15[i];
      uint64_t v12 = [v3 objectForKey:v15[i + 1]];
      if (v12) {
        [v9 setObject:v12 forKey:v11];
      }
    }
    v13 = [[SUScriptDictionary alloc] initWithDictionary:v9];

    CFRelease(v3);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (int64_t)hardwareType
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B148], "currentDevice"), "deviceType");
  if (v3 <= 1999)
  {
    switch(v3)
    {
      case 1000:
        int64_t result = [(SUScriptDevice *)self hardwareTypeWildcatK48];
        break;
      case 1001:
        int64_t result = [(SUScriptDevice *)self hardwareTypeIPadK93];
        break;
      case 1002:
        int64_t result = [(SUScriptDevice *)self hardwareTypeIPadK93a];
        break;
      case 1003:
        int64_t result = [(SUScriptDevice *)self hardwareTypeIPadK94];
        break;
      case 1004:
        int64_t result = [(SUScriptDevice *)self hardwareTypeIPadK95];
        break;
      case 1005:
        int64_t result = [(SUScriptDevice *)self hardwareTypeIPadJ1];
        break;
      case 1006:
        int64_t result = [(SUScriptDevice *)self hardwareTypeIPadJ2];
        break;
      case 1007:
        int64_t result = [(SUScriptDevice *)self hardwareTypeIPadJ2a];
        break;
      default:
LABEL_71:
        int64_t result = [(SUScriptDevice *)self hardwareTypeUnknown];
        break;
    }
  }
  else if (v3 <= 2999)
  {
    switch(v3)
    {
      case 2000:
        int64_t result = [(SUScriptDevice *)self hardwareTypeIPhoneM68];
        break;
      case 2001:
        int64_t result = [(SUScriptDevice *)self hardwareTypeIPhoneN82];
        break;
      case 2002:
        int64_t result = [(SUScriptDevice *)self hardwareTypeIPhoneN88];
        break;
      case 2003:
        int64_t result = [(SUScriptDevice *)self hardwareTypeIPhoneN90];
        break;
      case 2005:
        int64_t result = [(SUScriptDevice *)self hardwareTypeIPhoneN92];
        break;
      case 2006:
        int64_t result = [(SUScriptDevice *)self hardwareTypeIPhoneN94];
        break;
      default:
        goto LABEL_71;
    }
  }
  else
  {
    switch(v3)
    {
      case 3000:
        int64_t result = [(SUScriptDevice *)self hardwareTypeIPodTouchN45];
        break;
      case 3001:
      case 3002:
        int64_t result = [(SUScriptDevice *)self hardwareTypeIPodTouchN72];
        break;
      case 3003:
        int64_t result = [(SUScriptDevice *)self hardwareTypeIPodTouchN18];
        break;
      case 3004:
        int64_t result = [(SUScriptDevice *)self hardwareTypeIPodTouchN81];
        break;
      case 3005:
        int64_t result = [(SUScriptDevice *)self hardwareTypeIPodTouchN81a];
        break;
      default:
        if (v3 == 4000)
        {
          int64_t result = [(SUScriptDevice *)self hardwareTypeAppleTVK66];
        }
        else
        {
          if (v3 != 4001) {
            goto LABEL_71;
          }
          int64_t result = [(SUScriptDevice *)self hardwareTypeAppleTVJ33];
        }
        break;
    }
  }
  return result;
}

- (NSNumber)mainScreenScale
{
  uint64_t v2 = NSNumber;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "scale");
  *(float *)&double v3 = v3;

  return (NSNumber *)[v2 numberWithFloat:v3];
}

- (NSNumber)metricsPostFrequencyOverride
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  id v9 = __Block_byref_object_copy__38;
  uint64_t v10 = __Block_byref_object_dispose__38;
  uint64_t v11 = 0;
  uint64_t v2 = dispatch_semaphore_create(0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__SUScriptDevice_metricsPostFrequencyOverride__block_invoke;
  v5[3] = &unk_2648140F0;
  v5[4] = v2;
  v5[5] = &v6;
  [MEMORY[0x263F7B230] getReportingFrequencyOverrideWithCompletionBlock:v5];
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v2);
  double v3 = (NSNumber *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

intptr_t __46__SUScriptDevice_metricsPostFrequencyOverride__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
  double v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

- (id)needsToneRegrantOption
{
  id v2 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  int v3 = [v2 _wasAffectedByAccidentalToneDeletion];

  uint64_t v4 = (id *)MEMORY[0x263EFFB40];
  if (!v3) {
    uint64_t v4 = (id *)MEMORY[0x263EFFB38];
  }
  return *v4;
}

- (void)setDiskUsageDictionary:(id)a3
{
  int v3 = (void *)MEMORY[0x263F1FA90];
  uint64_t v4 = [NSString stringWithFormat:@"%@ is readonly", @"diskUsage"];

  [v3 throwException:v4];
}

- (NSString)capabilityNameEmail
{
  return (NSString *)@"email";
}

- (NSString)capabilityNameExplicitMedia
{
  return (NSString *)@"explicit";
}

- (NSString)capabilityNameHDVideo
{
  return (NSString *)@"hd-video";
}

- (NSString)capabilityNameHDVideo1080p
{
  return (NSString *)@"hd-video-1080p";
}

- (NSString)capabilityNameHDVideo720p
{
  return (NSString *)@"hd-video-720p";
}

- (NSString)capabilityNamePodcasts
{
  return (NSString *)@"podcasts";
}

- (NSString)capabilityNameWiFi
{
  return (NSString *)@"wifi";
}

- (int64_t)hardwareTypeAppleTVJ33
{
  return 22;
}

- (int64_t)hardwareTypeAppleTVK66
{
  return 21;
}

- (int64_t)hardwareTypeIPadJ1
{
  return 15;
}

- (int64_t)hardwareTypeIPadJ2
{
  return 16;
}

- (int64_t)hardwareTypeIPadJ2a
{
  return 17;
}

- (int64_t)hardwareTypeIPadK93
{
  return 10;
}

- (int64_t)hardwareTypeIPadK93a
{
  return 18;
}

- (int64_t)hardwareTypeIPadK94
{
  return 11;
}

- (int64_t)hardwareTypeIPadK95
{
  return 12;
}

- (int64_t)hardwareTypeIPhoneM68
{
  return 1;
}

- (int64_t)hardwareTypeIPhoneN82
{
  return 3;
}

- (int64_t)hardwareTypeIPhoneN88
{
  return 4;
}

- (int64_t)hardwareTypeIPhoneN90
{
  return 8;
}

- (int64_t)hardwareTypeIPhoneN92
{
  return 9;
}

- (int64_t)hardwareTypeIPhoneN94
{
  return 13;
}

- (int64_t)hardwareTypeIPodTouchN45
{
  return 2;
}

- (int64_t)hardwareTypeIPodTouchN72
{
  return 5;
}

- (int64_t)hardwareTypeIPodTouchN18
{
  return 6;
}

- (int64_t)hardwareTypeIPodTouchN81
{
  return 8;
}

- (int64_t)hardwareTypeIPodTouchN81a
{
  return 14;
}

- (int64_t)hardwareTypeUnknown
{
  return 0;
}

- (int64_t)hardwareTypeWildcatK48
{
  return 7;
}

- (int64_t)networkTypeNone
{
  return 0;
}

- (int64_t)networkType2G
{
  return 1;
}

- (int64_t)networkType3G
{
  return 2;
}

- (int64_t)networkType4G
{
  return 4;
}

- (int64_t)networkType5G
{
  return 5;
}

- (int64_t)networkType6G
{
  return 6;
}

- (int64_t)networkType7G
{
  return 7;
}

- (int64_t)networkType8G
{
  return 8;
}

- (int64_t)networkType9G
{
  return 9;
}

- (int64_t)networkTypeWiFi
{
  return 3;
}

- (NSString)orientationStringLandscapeLeft
{
  return (NSString *)@"landscape-left";
}

- (NSString)orientationStringLandscapeRight
{
  return (NSString *)@"landscape-right";
}

- (NSString)orientationStringPortrait
{
  return (NSString *)@"portrait";
}

- (NSString)orientationStringPortraitUpsideDown
{
  return (NSString *)@"portrait-upside-down";
}

- (int64_t)freeSpaceEffortLevelDoNothing
{
  return 0;
}

- (int64_t)freeSpaceEffortLevelAutomaticOnly
{
  return 1;
}

- (int64_t)freeSpaceEffortLevelManualSpaceManagement
{
  return 3;
}

- (int64_t)freeSpaceEffortLevelPromptUser
{
  return 2;
}

- (NSString)freeSpaceOptionEffortLevel
{
  return (NSString *)*MEMORY[0x263F255E0];
}

- (int64_t)restrictionBoolNo
{
  return 2;
}

- (int64_t)restrictionBoolNoData
{
  return 0;
}

- (int64_t)restrictionBoolYes
{
  return 1;
}

- (NSString)restrictionAccountModificationAllowed
{
  return (NSString *)*MEMORY[0x263F53710];
}

- (NSString)restrictionAllowGlobalBackgroundFetchWhenRoaming
{
  return (NSString *)*MEMORY[0x263F53720];
}

- (NSString)restrictionAllowVoiceDialing
{
  return (NSString *)*MEMORY[0x263F53728];
}

- (NSString)restrictionAppInstallationAllowed
{
  return (NSString *)*MEMORY[0x263F53750];
}

- (NSString)restrictionAppRemovalAllowed
{
  return (NSString *)*MEMORY[0x263F53758];
}

- (NSString)restrictionBookStoreAllowed
{
  return (NSString *)*MEMORY[0x263F537C8];
}

- (NSString)restrictionBookStoreEroticaAllowed
{
  return (NSString *)*MEMORY[0x263F537D0];
}

- (NSString)restrictionCameraAllowed
{
  return (NSString *)*MEMORY[0x263F537D8];
}

- (NSString)restrictionCellularHDUploadsAllowed
{
  return (NSString *)*MEMORY[0x263F537E8];
}

- (id)restrictionExplicitMedia
{
  return (id)*MEMORY[0x263F538B8];
}

- (NSString)restrictionITunesAllowed
{
  return (NSString *)*MEMORY[0x263F53910];
}

- (NSString)restrictionITunesSocialAllowed
{
  return (NSString *)*MEMORY[0x263F53918];
}

- (NSString)restrictionMultiplayerGamingAllowed
{
  return (NSString *)*MEMORY[0x263F539A0];
}

- (NSString)restrictionSafariAllowed
{
  return (NSString *)*MEMORY[0x263F53A28];
}

- (NSString)restrictionScreenShotAllowed
{
  return (NSString *)*MEMORY[0x263F53A48];
}

- (NSString)restrictionTypeApplications
{
  return (NSString *)@"applications";
}

- (NSString)restrictionTypeMovies
{
  return (NSString *)@"movies";
}

- (NSString)restrictionTypeTelevision
{
  return (NSString *)@"television";
}

- (NSString)restrictionVideoConferencingAllowed
{
  return (NSString *)*MEMORY[0x263F53AA8];
}

- (NSString)restrictionYouTubeAllowed
{
  return (NSString *)*MEMORY[0x263F53AD8];
}

- (NSString)UTIImage
{
  return (NSString *)*MEMORY[0x263F01A68];
}

- (NSString)UTIMovie
{
  return (NSString *)*MEMORY[0x263F01AC0];
}

- (NSString)UTIText
{
  return (NSString *)*MEMORY[0x263F01B48];
}

- (void)_accessibilitySettingsChangedNotification:(id)a3
{
}

- (void)_autoDownloadKindsChangedNotification:(id)a3
{
}

- (void)_addScriptFunction:(id)a3
{
  if (a3)
  {
    [a3 setThisObject:self];
    [(SUScriptObject *)self lock];
    scriptFunctions = self->_scriptFunctions;
    if (!scriptFunctions)
    {
      scriptFunctions = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      self->_scriptFunctions = scriptFunctions;
    }
    [(NSMutableArray *)scriptFunctions addObject:a3];
    [(SUScriptObject *)self unlock];
  }
}

- (int64_t)_deviceCapabilityForString:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", -[SUScriptDevice capabilityNameHDVideo](self, "capabilityNameHDVideo"))) {
    return 1;
  }
  if (objc_msgSend(a3, "isEqualToString:", -[SUScriptDevice capabilityNameHDVideo1080p](self, "capabilityNameHDVideo1080p")))return 2; {
  if (objc_msgSend(a3, "isEqualToString:", -[SUScriptDevice capabilityNameHDVideo720p](self, "capabilityNameHDVideo720p")))return 1;
  }
  else {
    return objc_msgSend(a3, "isEqualToString:", -[SUScriptDevice capabilityNameWiFi](self, "capabilityNameWiFi"))- 1;
  }
}

- (void)_removeScriptFunction:(id)a3
{
  if (a3)
  {
    [a3 setThisObject:0];
    [(SUScriptObject *)self lock];
    [(NSMutableArray *)self->_scriptFunctions removeObjectIdenticalTo:a3];
    [(SUScriptObject *)self unlock];
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_50, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDevice;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_38, 11);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDevice;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptDevice;
  id v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_50 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_38 = (uint64_t)sel_BOOLValueForRestriction_;
    unk_2681B52F0 = @"BOOLValueForRestriction";
    qword_2681B52F8 = (uint64_t)sel_checkCapabilitiesPropertyListString_showFailureDialog_;
    unk_2681B5300 = @"checkApplicationCapabilities";
    qword_2681B5308 = (uint64_t)sel_getMachineIdentifierForAccountIdentifier_;
    unk_2681B5310 = @"getMachineID";
    qword_2681B5318 = (uint64_t)sel_hasCapability_;
    unk_2681B5320 = @"hasCapability";
    qword_2681B5328 = (uint64_t)sel_isRestrictionLockedDown_;
    unk_2681B5330 = @"isRestrictionLockedDown";
    qword_2681B5338 = (uint64_t)sel_requestFreeSpaceWithBytes_options_completionHandler_;
    unk_2681B5340 = @"requestFreeSpace";
    qword_2681B5348 = (uint64_t)sel_restrictionLevelForType_;
    unk_2681B5350 = @"restrictionLevelForType";
    qword_2681B5358 = (uint64_t)sel_setAutomaticDownloadKinds_withCompletionHandler_;
    unk_2681B5360 = @"setAutomaticDownloadMediaTypes";
    qword_2681B5368 = (uint64_t)sel_setValueForRestriction_enabled_;
    unk_2681B5370 = @"setValueForRestriction";
    qword_2681B5378 = (uint64_t)sel_UTIForURL_;
    unk_2681B5380 = @"UTIForURL";
    qword_2681B5388 = (uint64_t)sel_valueForRestriction_;
    unk_2681B5390 = @"valueForRestriction";
    __KeyMapping_50 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"accessibilityBoldTextEnabled", @"accessibilityButtonShapesEnabled", @"accessibilityButtonShapesEnabled", @"accessibilityDarkenSystemColors", @"accessibilityDarkenSystemColors", @"accessibilityEnhanceBackgroundContrast", @"accessibilityEnhanceBackgroundContrast", @"accessibilityMotionAutoPlayVideo", @"accessibilityMotionAutoPlayVideo", @"accessibilitySingleColorSelected", @"accessibilitySingleColorSelected", @"accessibilitySingleColor", @"accessibilitySingleColor", @"accessibilityUseDarkerKeyboard", @"accessibilityUseDarkerKeyboard", @"activeNetworkType", @"activeNetworkType",
                        @"automaticDownloadMediaTypes",
                        @"automaticDownloadMediaTypes",
                        @"deviceTypeIdentifier",
                        @"deviceTypeIdentifier",
                        @"diskSpaceAvailable",
                        @"diskSpaceAvailable",
                        @"diskUsage",
                        @"diskUsageDictionary",
                        @"hardwareType",
                        @"hardwareType",
                        @"mainScreenScale",
                        @"mainScreenScale",
                        @"metricsPostFrequencyOverride",
                        @"metricsPostFrequencyOverride",
                        @"needsToneRegrantOption",
                        @"needsToneRegrantOption",
                        @"CAPABILITY_EMAIL",
                        @"capabilityNameEmail",
                        @"CAPABILITY_EXPLICIT_MEDIA",
                        @"capabilityNameExplicitMedia",
                        @"CAPABILITY_HD_VIDEO",
                        @"capabilityNameHDVideo",
                        @"CAPABILITY_HD_VIDEO_1080P",
                        @"capabilityNameHDVideo1080p",
                        @"CAPABILITY_HD_VIDEO_720P",
                        @"capabilityNameHDVideo720p",
                        @"CAPABILITY_PODCASTS",
                        @"capabilityNamePodcasts",
                        @"CAPABILITY_WIFI",
                        @"capabilityNameWiFi",
                        @"FREE_SPACE_EFFORT_DO_NOTHING",
                        @"freeSpaceEffortLevelDoNothing",
                        @"FREE_SPACE_EFFORT_AUTOMATIC_ONLY",
                        @"freeSpaceEffortLevelAutomaticOnly",
                        @"FREE_SPACE_EFFORT_MANUAL",
                        @"freeSpaceEffortLevelManualSpaceManagement",
                        @"FREE_SPACE_EFFORT_PROMPT_USER",
                        @"freeSpaceEffortLevelPromptUser",
                        @"FREE_SPACE_OPTION_EFFORT_LEVEL",
                        @"freeSpaceOptionEffortLevel",
                        @"HARDWARE_TYPE_APPLETV_J33",
                        @"hardwareTypeAppleTVJ33",
                        @"HARDWARE_TYPE_APPLETV_K66",
                        @"hardwareTypeAppleTVK66");
  }
}

@end
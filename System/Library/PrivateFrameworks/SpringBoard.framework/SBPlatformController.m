@interface SBPlatformController
+ (id)sharedInstance;
- (BOOL)deviceSupportsHWButtonBezelEffects;
- (BOOL)isCarrierInstall;
- (BOOL)isHomeGestureEnabled;
- (BOOL)isInternalInstall;
- (BOOL)isMedusaCapable;
- (BOOL)isRoundCornerPad;
- (BOOL)isRoundCornerPhone;
- (BOOL)isiPadMini;
- (BOOL)prefersAlwaysOnOrientation;
- (SBPlatformController)init;
- (id)defaultIconState;
- (id)defaultIconStateDisplayIdentifiers;
- (id)deviceClass;
- (id)hardwareModel;
- (id)localizedPlatformName;
- (id)productType;
- (id)systemBuildVersion;
- (id)uniqueDeviceIdentifier;
- (int64_t)medusaCapabilities;
- (void)_loadDefaultIconInfo;
@end

@implementation SBPlatformController

- (BOOL)isHomeGestureEnabled
{
  v2 = +[SBHomeGestureDomain rootSettings];
  char v3 = [v2 isHomeGestureEnabled];

  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1) {
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_68);
  }
  v2 = (void *)sharedInstance___sharedInstance_5;
  return v2;
}

- (BOOL)isInternalInstall
{
  return self->_internalInstall;
}

- (BOOL)isRoundCornerPhone
{
  BOOL v2 = 1;
  uint64_t v3 = SBFEffectiveArtworkSubtype();
  if (v3 > 2621)
  {
    if (v3 <= 2777)
    {
      if (v3 != 2622 && v3 != 2688) {
        return 0;
      }
    }
    else if (v3 != 2778 && v3 != 2796 && v3 != 2868)
    {
      return 0;
    }
  }
  else if (v3 <= 2435)
  {
    if (v3 != 1792 && v3 != 2340) {
      return 0;
    }
  }
  else if (v3 != 2436 && v3 != 2532 && v3 != 2556)
  {
    return 0;
  }
  return v2;
}

- (BOOL)isMedusaCapable
{
  return self->_medusaCapabilities != 0;
}

uint64_t __38__SBPlatformController_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBPlatformController);
  v1 = (void *)sharedInstance___sharedInstance_5;
  sharedInstance___sharedInstance_5 = (uint64_t)v0;

  return kdebug_trace();
}

- (SBPlatformController)init
{
  v13.receiver = self;
  v13.super_class = (Class)SBPlatformController;
  BOOL v2 = [(SBPlatformController *)&v13 init];
  if (v2)
  {
    uint64_t v3 = MGCopyAnswer();
    localizedDeviceName = v2->_localizedDeviceName;
    v2->_localizedDeviceName = (NSString *)v3;

    v2->_internalInstall = MGGetBoolAnswer();
    v2->_carrierInstall = MGGetBoolAnswer();
    if _os_feature_enabled_impl() && (MGGetBoolAnswer())
    {
      v5 = [MEMORY[0x1E4F4F7D0] sharedInstance];
      v2->_supportsHWButtonBezelEffects = [v5 deviceClass] == 0;
    }
    else
    {
      v2->_supportsHWButtonBezelEffects = 0;
    }
    v6 = +[SBDefaults localDefaults];
    v7 = [v6 workspaceDefaults];
    uint64_t v8 = [v7 medusaDeviceSimulation];

    if ((unint64_t)(v8 - 2) < 2)
    {
      uint64_t v11 = 1;
    }
    else if (v8 == 4)
    {
      uint64_t v11 = 2;
    }
    else if (v8)
    {
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v9 = MGGetBoolAnswer();
      int v10 = MGGetBoolAnswer();
      uint64_t v11 = 2;
      if (!v10) {
        uint64_t v11 = v9;
      }
    }
    v2->_medusaCapabilities = v11;
    [(SBPlatformController *)v2 _loadDefaultIconInfo];
  }
  return v2;
}

- (id)systemBuildVersion
{
  BOOL v2 = (void *)MGCopyAnswer();
  return v2;
}

- (id)hardwareModel
{
  BOOL v2 = (void *)MGCopyAnswer();
  return v2;
}

- (id)productType
{
  BOOL v2 = (void *)MGCopyAnswer();
  return v2;
}

- (id)deviceClass
{
  BOOL v2 = (void *)MGCopyAnswer();
  return v2;
}

- (id)uniqueDeviceIdentifier
{
  BOOL v2 = (void *)MGCopyAnswer();
  return v2;
}

- (id)defaultIconState
{
  return self->_defaultIconState;
}

- (id)defaultIconStateDisplayIdentifiers
{
  return self->_defaultIconStateDisplayIdentifiers;
}

- (id)localizedPlatformName
{
  return self->_localizedDeviceName;
}

- (BOOL)isCarrierInstall
{
  return self->_carrierInstall;
}

- (int64_t)medusaCapabilities
{
  return self->_medusaCapabilities;
}

- (BOOL)isiPadMini
{
  int v2 = isiPadMini_sScreenClass;
  if (isiPadMini_sScreenClass == -1)
  {
    int v2 = MGGetSInt32Answer();
    isiPadMini_sScreenClass = v2;
  }
  return v2 == 7;
}

- (BOOL)prefersAlwaysOnOrientation
{
  if (prefersAlwaysOnOrientation_onceToken != -1) {
    dispatch_once(&prefersAlwaysOnOrientation_onceToken, &__block_literal_global_41_1);
  }
  return prefersAlwaysOnOrientation_sPrefersAlwaysOnOrientation;
}

uint64_t __50__SBPlatformController_prefersAlwaysOnOrientation__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F221E8] isAlwaysOn];
  prefersAlwaysOnOrientation_sPrefersAlwaysOnOrientation = result;
  return result;
}

- (BOOL)isRoundCornerPad
{
  if (SBFEffectiveHomeButtonType() != 2) {
    return 0;
  }
  BOOL v2 = 1;
  uint64_t v3 = SBFEffectiveArtworkSubtype();
  if (v3 > 2731)
  {
    if (v3 == 2732 || v3 == 2752) {
      return v2;
    }
    return 0;
  }
  if (((unint64_t)(v3 - 2360) > 0x3C || ((1 << (v3 - 56)) & 0x1000000010000001) == 0)
    && v3 != 2266)
  {
    return 0;
  }
  return v2;
}

- (BOOL)deviceSupportsHWButtonBezelEffects
{
  return self->_supportsHWButtonBezelEffects;
}

- (void)_loadDefaultIconInfo
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (self->_defaultIconState)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"SBPlatformController.m", 230, @"already loaded defaultIconState : %@", self->_defaultIconState object file lineNumber description];
  }
  if (self->_defaultIconStateDisplayIdentifiers)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"SBPlatformController.m", 231, @"already loaded defaultIconStateDisplayIdentifiers : %@", self->_defaultIconStateDisplayIdentifiers object file lineNumber description];
  }
  v4 = (void *)MEMORY[0x1D948C4D0]();
  v5 = NSString;
  v6 = [(SBPlatformController *)self deviceClass];
  v7 = [v6 lowercaseString];
  uint64_t v8 = [v5 stringWithFormat:@"~%@", v7];

  uint64_t v9 = [MEMORY[0x1E4F28B50] mainBundle];
  int v10 = [MEMORY[0x1E4F62420] sharedInstance];
  uint64_t v11 = [v10 mainConfiguration];
  [v11 bounds];
  uint64_t v13 = v12;
  uint64_t v15 = v14;

  v16 = [NSString stringWithFormat:@"%@-%.0fw-%.0fh", @"DefaultIconState", v13, v15];
  v17 = [v16 stringByAppendingString:v8];
  v18 = [v9 URLForResource:v17 withExtension:@"plist"];
  v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    v43 = v4;
    v42 = [NSString stringWithFormat:@"%@-%.0fw", @"DefaultIconState", v13];
    v21 = [v42 stringByAppendingString:v8];
    v22 = [v9 URLForResource:v21 withExtension:@"plist"];
    v23 = v22;
    if (v22)
    {
      id v20 = v22;
    }
    else
    {
      v40 = [NSString stringWithFormat:@"%@-%.0fh", @"DefaultIconState", v15];
      v41 = [v40 stringByAppendingString:v8];
      v24 = objc_msgSend(v9, "URLForResource:withExtension:");
      if (v24)
      {
        v25 = v24;
        id v20 = v24;
      }
      else
      {
        v39 = [@"DefaultIconState" stringByAppendingString:v8];
        v26 = objc_msgSend(v9, "URLForResource:withExtension:");
        v27 = v26;
        if (v26)
        {
          id v28 = v26;
        }
        else
        {
          id v28 = [v9 URLForResource:@"DefaultIconState" withExtension:@"plist"];
        }
        id v20 = v28;

        v25 = 0;
      }
    }
    v4 = v43;
  }

  v29 = SBLogCommon();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v45 = v20;
    _os_log_impl(&dword_1D85BA000, v29, OS_LOG_TYPE_INFO, "Loading default icon state from: %{public}@", buf, 0xCu);
  }

  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v20];
  v31 = +[SBIconStateArchiver modernizeRootArchive:v30];
  v32 = (NSDictionary *)[v31 copy];
  defaultIconState = self->_defaultIconState;
  self->_defaultIconState = v32;

  v34 = +[SBIconStateArchiver leafIdentifiersFromArchive:self->_defaultIconState];
  v35 = (NSOrderedSet *)[v34 copy];
  defaultIconStateDisplayIdentifiers = self->_defaultIconStateDisplayIdentifiers;
  self->_defaultIconStateDisplayIdentifiers = v35;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDeviceName, 0);
  objc_storeStrong((id *)&self->_defaultIconStateDisplayIdentifiers, 0);
  objc_storeStrong((id *)&self->_defaultIconState, 0);
}

@end
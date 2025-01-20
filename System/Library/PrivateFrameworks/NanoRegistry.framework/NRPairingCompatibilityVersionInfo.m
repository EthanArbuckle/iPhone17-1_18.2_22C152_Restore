@interface NRPairingCompatibilityVersionInfo
+ (id)_minPairingCompatibilityVersionWatchProductTypes;
+ (id)stringFromCFPrefs:(id)a3;
+ (id)systemVersions;
+ (unint64_t)valueForToken:(int)a3;
- (BOOL)isOverrideActive;
- (BOOL)isRevlockFeatureFlagActive;
- (id)compatibilityIndexDictionary;
- (id)initInternal;
- (int64_t)maxPairingCompatibilityVersion;
- (int64_t)maxPairingCompatibilityVersionForPhoneProductType:(id)a3;
- (int64_t)minPairingCompatibilityVersion;
- (int64_t)minPairingCompatibilityVersionForChipID:(id)a3;
- (int64_t)minPairingCompatibilityVersionForChipID:(id)a3 name:(id)a4 defaultVersion:(int64_t)a5;
- (int64_t)minPairingCompatibilityVersionForWatchProductType:(id)a3;
- (int64_t)minPairingCompatibilityVersionWithChipID;
- (int64_t)minQuickSwitchCompatibilityVersion;
- (int64_t)minQuickSwitchPairingCompatibilityVersionForChipID:(id)a3;
- (int64_t)pairingCompatibilityVersion;
- (unint64_t)pairingCompatibilitySupportStateForAdvertisingWatchVersion:(int64_t)a3;
- (void)setIsOverrideActive:(BOOL)a3;
- (void)setIsRevlockFeatureFlagActive:(BOOL)a3;
- (void)setMaxPairingCompatibilityVersion:(int64_t)a3;
- (void)setMinPairingCompatibilityVersion:(int64_t)a3;
- (void)setMinPairingCompatibilityVersionWithChipID:(int64_t)a3;
- (void)setMinQuickSwitchCompatibilityVersion:(int64_t)a3;
- (void)setPairingCompatibilityVersion:(int64_t)a3;
@end

@implementation NRPairingCompatibilityVersionInfo

- (int64_t)maxPairingCompatibilityVersion
{
  return qword_1E95CE9F0;
}

- (int64_t)minPairingCompatibilityVersion
{
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend((id)objc_opt_class(), "valueForToken:", _MergedGlobals_11));
  int64_t v4 = [(NRPairingCompatibilityVersionInfo *)self minPairingCompatibilityVersionForChipID:v3];

  return v4;
}

- (int64_t)minQuickSwitchCompatibilityVersion
{
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend((id)objc_opt_class(), "valueForToken:", _MergedGlobals_11));
  int64_t v4 = [(NRPairingCompatibilityVersionInfo *)self minQuickSwitchPairingCompatibilityVersionForChipID:v3];

  return v4;
}

- (int64_t)minPairingCompatibilityVersionWithChipID
{
  return qword_1E95CE9F8;
}

- (int64_t)pairingCompatibilityVersion
{
  v2 = objc_opt_class();
  uint64_t v3 = dword_1E95CE8A4;

  return [v2 valueForToken:v3];
}

- (int64_t)minPairingCompatibilityVersionForWatchProductType:(id)a3
{
  int64_t v3 = qword_1E95CEA00;
  if (a3)
  {
    int64_t v4 = objc_msgSend((id)qword_1E95CEA08, "objectForKeyedSubscript:");
    v5 = v4;
    if (v4) {
      int64_t v3 = [v4 integerValue];
    }
  }
  return v3;
}

- (int64_t)maxPairingCompatibilityVersionForPhoneProductType:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = [(NRPairingCompatibilityVersionInfo *)self compatibilityIndexDictionary];
  v6 = [v5 objectForKeyedSubscript:v4];

  int64_t v7 = [v6 integerValue];
  return v7;
}

- (id)compatibilityIndexDictionary
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (_NRIsInternalInstall___onceToken != -1) {
    dispatch_once(&_NRIsInternalInstall___onceToken, &__block_literal_global_18);
  }
  if (!_NRIsInternalInstall___internalInstall
    || (v2 = (__CFString *)CFPreferencesCopyValue(@"compatibilityIndexOverride", @"com.apple.NanoRegistry", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8])) == 0)
  {
LABEL_10:
    int64_t v7 = CFPreferencesCopyAppValue(@"latestAssetURL", @"com.apple.nanoregistryd");
    v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
    v9 = [v8 URLByAppendingPathComponent:@"NanoRegistryPairingCompatibilityIndex.plist"];
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v9];
    v11 = nr_framework_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      v13 = nr_framework_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412546;
        v23 = v9;
        __int16 v24 = 2112;
        v25 = v10;
        _os_log_impl(&dword_1A356E000, v13, OS_LOG_TYPE_DEFAULT, "NRPairingCompatibilityVersionInfo - Latest plist path: %@\nWith contents: %@", (uint8_t *)&v22, 0x16u);
      }
    }
    if (v10)
    {
      v14 = [v10 objectForKeyedSubscript:@"iPhone"];
      if (v14)
      {
        v15 = v14;
        int64_t v3 = (__CFString *)v15;
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      v18 = nr_framework_log();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

      if (v19)
      {
        v20 = nr_framework_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 138543362;
          v23 = @"iPhone";
          _os_log_impl(&dword_1A356E000, v20, OS_LOG_TYPE_DEFAULT, "NRPairingCompatibilityVersionInfo - %{public}@ key not found in compatibility index asset plist", (uint8_t *)&v22, 0xCu);
        }
      }
      v15 = 0;
    }
    else
    {
      v16 = nr_framework_log();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

      if (!v17)
      {
        int64_t v3 = 0;
        goto LABEL_27;
      }
      v15 = nr_framework_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138543362;
        v23 = v9;
        _os_log_impl(&dword_1A356E000, v15, OS_LOG_TYPE_DEFAULT, "NRPairingCompatibilityVersionInfo - Unable to read compatibility index asset plist at %{public}@", (uint8_t *)&v22, 0xCu);
      }
    }
    int64_t v3 = 0;
    goto LABEL_26;
  }
  int64_t v3 = v2;
  CFTypeID v4 = CFGetTypeID(v2);
  if (v4 != CFDictionaryGetTypeID())
  {
    CFRelease(v3);
    goto LABEL_10;
  }
  v5 = nr_framework_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (!v6) {
    goto LABEL_29;
  }
  int64_t v7 = nr_framework_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    v23 = v3;
    _os_log_impl(&dword_1A356E000, v7, OS_LOG_TYPE_DEFAULT, "NRPairingCompatibilityVersionInfo - Overriding compatibility index dictionary to %@", (uint8_t *)&v22, 0xCu);
  }
LABEL_28:

LABEL_29:

  return v3;
}

- (unint64_t)pairingCompatibilitySupportStateForAdvertisingWatchVersion:(int64_t)a3
{
  if ([(NRPairingCompatibilityVersionInfo *)self maxPairingCompatibilityVersion] >= a3) {
    return 1;
  }
  v5 = (void *)MGGetStringAnswer();
  int64_t v6 = [(NRPairingCompatibilityVersionInfo *)self maxPairingCompatibilityVersionForPhoneProductType:v5];
  if (v6 >= a3 || v6 == 0) {
    unint64_t v8 = 2;
  }
  else {
    unint64_t v8 = 3;
  }

  return v8;
}

- (int64_t)minPairingCompatibilityVersionForChipID:(id)a3
{
  return [(NRPairingCompatibilityVersionInfo *)self minPairingCompatibilityVersionForChipID:a3 name:@"Minimum pairing compatibility version" defaultVersion:qword_1E95CEA00];
}

- (int64_t)minQuickSwitchPairingCompatibilityVersionForChipID:(id)a3
{
  return [(NRPairingCompatibilityVersionInfo *)self minPairingCompatibilityVersionForChipID:a3 name:@"QuickSwitch pairing compatibility version" defaultVersion:qword_1E95CEA10];
}

- (int64_t)minPairingCompatibilityVersionForChipID:(id)a3 name:(id)a4 defaultVersion:(int64_t)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = (id)qword_1E95CEA18;
    if ([v7 length])
    {
      unint64_t v8 = [v7 stringByReplacingOccurrencesOfString:@" " withString:&stru_1EF6CAD80];

      [v8 componentsSeparatedByString:@","];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        v20 = v8;
        uint64_t v11 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v23 != v11) {
              objc_enumerationMutation(obj);
            }
            v13 = [*(id *)(*((void *)&v22 + 1) + 8 * i) componentsSeparatedByString:@"="];
            v14 = NSNumber;
            v15 = [v13 objectAtIndexedSubscript:0];
            v16 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "integerValue"));
            int v17 = [v6 isEqual:v16];

            if (v17)
            {
              v18 = [v13 objectAtIndexedSubscript:1];
              a5 = [v18 integerValue];

              goto LABEL_13;
            }
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v10) {
            continue;
          }
          break;
        }
LABEL_13:
        unint64_t v8 = v20;
      }

      id v7 = v8;
    }
  }
  return a5;
}

- (BOOL)isOverrideActive
{
  return _MergedGlobals_12;
}

- (BOOL)isRevlockFeatureFlagActive
{
  return byte_1E95CE9E9;
}

- (id)initInternal
{
  v3.receiver = self;
  v3.super_class = (Class)NRPairingCompatibilityVersionInfo;
  return [(NRPairingCompatibilityVersionInfo *)&v3 init];
}

+ (id)stringFromCFPrefs:(id)a3
{
  CFPropertyListRef v3 = CFPreferencesCopyValue((CFStringRef)a3, @"com.apple.NanoRegistry", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v3)
  {
    CFTypeID v4 = (void *)v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFStringGetTypeID()) {
      id v6 = v4;
    }
    else {
      id v6 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)systemVersions
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NRPairingCompatibilityVersionInfo_systemVersions__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1E95CEA28 != -1) {
    dispatch_once(&qword_1E95CEA28, block);
  }
  v2 = (void *)qword_1E95CEA20;

  return v2;
}

void __51__NRPairingCompatibilityVersionInfo_systemVersions__block_invoke(uint64_t a1)
{
  v2 = nr_framework_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A356E000, v2, OS_LOG_TYPE_DEFAULT, "Revlock is set to shipping behavior", buf, 2u);
  }

  byte_1E95CE9E9 = 1;
  qword_1E95CE9F0 = 23;
  CFPropertyListRef v3 = numberFromCFPrefs(@"maxPairingCompatibilityVersion");
  CFTypeID v4 = v3;
  if (v3)
  {
    qword_1E95CE9F0 = [v3 integerValue];
    _MergedGlobals_12 = 1;
  }
  qword_1E95CEA00 = 22;
  CFTypeID v5 = numberFromCFPrefs(@"minPairingCompatibilityVersion");

  if (v5)
  {
    qword_1E95CEA00 = [v5 integerValue];
    _MergedGlobals_12 = 1;
  }
  qword_1E95CE9F8 = 10;
  id v6 = numberFromCFPrefs(@"minPairingCompatibilityVersionWithChipID");

  if (v6)
  {
    qword_1E95CE9F8 = [v6 integerValue];
    _MergedGlobals_12 = 1;
  }
  qword_1E95CEA10 = 6;
  id v7 = numberFromCFPrefs(@"minQuickSwitchCompatibilityVersion");

  if (v7)
  {
    qword_1E95CEA10 = [v7 integerValue];
    _MergedGlobals_12 = 1;
  }
  uint64_t v8 = [*(id *)(a1 + 32) _minPairingCompatibilityVersionWatchProductTypes];
  uint64_t v9 = (void *)qword_1E95CEA08;
  qword_1E95CEA08 = v8;

  uint64_t v10 = (void *)qword_1E95CEA18;
  qword_1E95CEA18 = @"28674=10,32770=14,32772=18";

  uint64_t v11 = [*(id *)(a1 + 32) stringFromCFPrefs:@"IOS_PAIRING_EOL_MIN_PAIRING_COMPATIBILITY_VERSION_CHIPIDS"];
  if (v11)
  {
    objc_storeStrong((id *)&qword_1E95CEA18, v11);
    _MergedGlobals_12 = 1;
  }
  if (notify_register_check("com.apple.nanoregistry.pairingcompatibilityversion", &dword_1E95CE8A4))
  {
    BOOL v12 = nr_framework_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      v14 = nr_framework_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1A356E000, v14, OS_LOG_TYPE_DEFAULT, "Failed to register for version notify token", v21, 2u);
      }
    }
  }
  if (notify_register_check("com.apple.nanoregistry.activedevicechipid", &_MergedGlobals_11))
  {
    v15 = nr_framework_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      int v17 = nr_framework_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1A356E000, v17, OS_LOG_TYPE_DEFAULT, "Failed to register for active device chip id notify token", v20, 2u);
      }
    }
  }
  id v18 = [[NRPairingCompatibilityVersionInfo alloc] initInternal];
  BOOL v19 = (void *)qword_1E95CEA20;
  qword_1E95CEA20 = (uint64_t)v18;
}

+ (id)_minPairingCompatibilityVersionWatchProductTypes
{
  return &unk_1EF6D4458;
}

+ (unint64_t)valueForToken:(int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 == -1) {
    return 0;
  }
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(a3, &state64);
  if (state)
  {
    uint32_t v4 = state;
    CFTypeID v5 = nr_framework_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      id v7 = nr_framework_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        uint32_t v11 = v4;
        _os_log_impl(&dword_1A356E000, v7, OS_LOG_TYPE_DEFAULT, "Failed to get version notify token with result %d", buf, 8u);
      }
    }
    return 0;
  }
  return state64;
}

- (void)setPairingCompatibilityVersion:(int64_t)a3
{
  self->_pairingCompatibilityVersion = a3;
}

- (void)setMaxPairingCompatibilityVersion:(int64_t)a3
{
  self->_maxPairingCompatibilityVersion = a3;
}

- (void)setMinPairingCompatibilityVersion:(int64_t)a3
{
  self->_minPairingCompatibilityVersion = a3;
}

- (void)setMinPairingCompatibilityVersionWithChipID:(int64_t)a3
{
  self->_minPairingCompatibilityVersionWithChipID = a3;
}

- (void)setMinQuickSwitchCompatibilityVersion:(int64_t)a3
{
  self->_minQuickSwitchCompatibilityVersion = a3;
}

- (void)setIsOverrideActive:(BOOL)a3
{
  self->_isOverrideActive = a3;
}

- (void)setIsRevlockFeatureFlagActive:(BOOL)a3
{
  self->_isRevlockFeatureFlagActive = a3;
}

@end
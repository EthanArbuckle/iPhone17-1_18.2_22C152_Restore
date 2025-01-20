@interface TransparencySettings
+ (BOOL)enableSelfValidationXPCActivity;
+ (BOOL)getBool:(id)a3;
+ (BOOL)getBool:(id)a3 defaultValue:(BOOL)a4;
+ (BOOL)isAccountsInQA;
+ (double)backgroundFollowupDelayPeriod;
+ (double)backgroundNetworkTimeout;
+ (double)defaultNetworkTimeout;
+ (double)defaultQueryCacheTimeout;
+ (double)defaultSelfFollowupTicketLifetime;
+ (double)dismissFailureAfterSeenPeriod;
+ (double)failureIgnorePeriod;
+ (double)queryCacheHardTimeout;
+ (double)queryJustMadeTimeout;
+ (double)uiBlockingNetworkTimeout;
+ (id)automatedDeviceGroup;
+ (id)cfPrefsJson;
+ (id)devicePlatform;
+ (id)deviceUserAgent;
+ (id)getIMEnvironmentName;
+ (id)getOverride:(id)a3;
+ (id)jsonArrayFromPlistArray:(id)a3;
+ (id)jsonDictFromPlistDict:(id)a3;
+ (id)transparencyVersionStr;
+ (unint64_t)backgroundFollowupFailureCount;
+ (unint64_t)getEnvironment;
- (BOOL)allowsInternalSecurityPolicies;
- (BOOL)getBool:(id)a3;
- (BOOL)systemFailureFeatureEnabled;
- (double)atBackgroundFollowupDelayPeriod;
- (double)defaultNetworkTimeout;
- (double)uiBlockingNetworkTimeout;
- (id)automatedDeviceGroup;
- (id)devicePlatform;
- (id)getOverride:(id)a3;
- (id)testingSelfValidationFailing;
- (id)transparencyVersionStr;
- (unint64_t)getEnvironment;
@end

@implementation TransparencySettings

+ (BOOL)isAccountsInQA
{
  if (isAccountsInQA_onceToken != -1) {
    dispatch_once(&isAccountsInQA_onceToken, &__block_literal_global_7);
  }
  return isAccountsInQA_sIMIsAccountsInQA;
}

void __38__TransparencySettings_isAccountsInQA__block_invoke()
{
  v0 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v1 = [v0 lastObject];
  id v3 = [v1 stringByAppendingPathComponent:@"Caches/com.apple.setmme"];

  v2 = [MEMORY[0x263F08850] defaultManager];
  isAccountsInQA_sIMIsAccountsInQA = [v2 fileExistsAtPath:v3];
}

+ (id)getIMEnvironmentName
{
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"env", @"com.apple.ids");
  id v3 = (void *)getIMEnvironmentName_name;
  getIMEnvironmentName_name = (uint64_t)v2;

  v4 = (void *)getIMEnvironmentName_name;

  return v4;
}

+ (unint64_t)getEnvironment
{
  if (+[TransparencySettings getBool:@"useQAConfig"]) {
    return 2;
  }
  if (+[TransparencySettings getBool:@"useQA1Config"]) {
    return 1;
  }
  id v3 = +[TransparencySettings getIMEnvironmentName];
  if (![v3 length]
    && +[TransparencySettings isAccountsInQA]
    || ([v3 isEqualToString:@"ven1-external"] & 1) != 0)
  {
    unint64_t v2 = 1;
  }
  else if ([v3 isEqualToString:@"ven2-external"])
  {
    unint64_t v2 = 2;
  }
  else
  {
    unint64_t v2 = 0;
  }

  return v2;
}

- (unint64_t)getEnvironment
{
  return +[TransparencySettings getEnvironment];
}

- (BOOL)systemFailureFeatureEnabled
{
  return MEMORY[0x270ED8070]("Transparency", "KTSystemFailureUI");
}

+ (BOOL)getBool:(id)a3
{
  return CFPreferencesGetAppBooleanValue((CFStringRef)a3, @"com.apple.transparencyd", 0) == 1;
}

- (BOOL)getBool:(id)a3
{
  return +[TransparencySettings getBool:a3];
}

+ (BOOL)getBool:(id)a3 defaultValue:(BOOL)a4
{
  Boolean keyExistsAndHasValidFormat = 0;
  BOOL v5 = CFPreferencesGetAppBooleanValue((CFStringRef)a3, @"com.apple.transparencyd", &keyExistsAndHasValidFormat) != 0;
  if (keyExistsAndHasValidFormat) {
    return v5;
  }
  else {
    return a4;
  }
}

- (BOOL)allowsInternalSecurityPolicies
{
  return os_variant_allows_internal_security_policies();
}

+ (double)defaultNetworkTimeout
{
  return 60.0;
}

- (double)defaultNetworkTimeout
{
  +[TransparencySettings defaultNetworkTimeout];
  return result;
}

+ (double)uiBlockingNetworkTimeout
{
  return 5.0;
}

- (double)uiBlockingNetworkTimeout
{
  +[TransparencySettings uiBlockingNetworkTimeout];
  return result;
}

+ (double)backgroundNetworkTimeout
{
  return 300.0;
}

- (id)testingSelfValidationFailing
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_variant_allows_internal_security_policies())
  {
    unint64_t v2 = CFPreferencesCopyAppValue(@"testingSelfValidationFailing", @"com.apple.transparency");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v3 = v2;
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v11;
        while (2)
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v11 != v6) {
              objc_enumerationMutation(v3);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              goto LABEL_14;
            }
          }
          uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (v5) {
            continue;
          }
          break;
        }
      }

      id v8 = v3;
    }
    else
    {
LABEL_14:
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (double)defaultQueryCacheTimeout
{
  unint64_t v2 = +[TransparencySettings getOverride:@"overrideDefaultQueryCacheTimeout"];
  double v3 = 86400.0;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v3 = (double)(unint64_t)[v2 unsignedIntegerValue];
    }
  }

  return v3;
}

+ (double)queryCacheHardTimeout
{
  unint64_t v2 = +[TransparencySettings getOverride:@"overrideQueryCacheHardTimeout"];
  double v3 = 604800.0;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v3 = (double)(unint64_t)[v2 unsignedIntegerValue];
    }
  }

  return v3;
}

+ (double)queryJustMadeTimeout
{
  unint64_t v2 = +[TransparencySettings getOverride:@"overrideQueryJustMadeTimeout"];
  double v3 = 3.0;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v3 = (double)(unint64_t)[v2 unsignedIntegerValue];
    }
  }

  return v3;
}

+ (double)dismissFailureAfterSeenPeriod
{
  unint64_t v2 = +[TransparencySettings getOverride:@"overrideFailureDismissAfterSeenSeconds"];
  double v3 = 3600.0;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v3 = (double)(unint64_t)[v2 unsignedIntegerValue];
    }
  }

  return v3;
}

+ (double)failureIgnorePeriod
{
  unint64_t v2 = +[TransparencySettings getOverride:@"overrideFailureIgnorePeriod"];
  double v3 = 86400.0;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v3 = (double)(unint64_t)[v2 unsignedIntegerValue];
    }
  }

  return v3;
}

+ (double)defaultSelfFollowupTicketLifetime
{
  unint64_t v2 = +[TransparencySettings getOverride:@"overrideSelfValidationTicketExpiry"];
  double v3 = 86400.0;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v3 = (double)(unint64_t)[v2 unsignedIntegerValue];
    }
  }

  return v3;
}

+ (double)backgroundFollowupDelayPeriod
{
  unint64_t v2 = +[TransparencySettings getOverride:@"overrideBackgroundFollowupDelayPeriod"];
  double v3 = 172800.0;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v3 = (double)(unint64_t)[v2 unsignedIntegerValue];
    }
  }

  return v3;
}

+ (unint64_t)backgroundFollowupFailureCount
{
  unint64_t v2 = +[TransparencySettings getOverride:@"overrideBackgroundFollowupFailureCount"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unint64_t v3 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v3 = 6;
  }

  return v3;
}

- (double)atBackgroundFollowupDelayPeriod
{
  unint64_t v2 = +[TransparencySettings getOverride:@"overrideATBackgroundFollowupDelayPeriod"];
  double v3 = 604800.0;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v3 = (double)(unint64_t)[v2 unsignedIntegerValue];
    }
  }

  return v3;
}

+ (BOOL)enableSelfValidationXPCActivity
{
  if (!os_variant_allows_internal_security_policies()) {
    return 1;
  }
  unint64_t v2 = +[TransparencySettings getOverride:@"enableSelfValidationXPCActivity"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

+ (id)deviceUserAgent
{
  if (deviceUserAgent_onceToken != -1) {
    dispatch_once(&deviceUserAgent_onceToken, &__block_literal_global_121);
  }
  unint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"com.apple.Transparency"];
  [v2 appendFormat:@" [%@, %@]", deviceUserAgent_deviceClass, deviceUserAgent_buildVersion];

  return v2;
}

void __39__TransparencySettings_deviceUserAgent__block_invoke()
{
  v0 = (void *)_CFCopySystemVersionDictionary();
  if (v0)
  {
    id v5 = v0;
    uint64_t v1 = [v0 objectForKeyedSubscript:*MEMORY[0x263EFFAB0]];
    unint64_t v2 = (void *)deviceUserAgent_buildVersion;
    deviceUserAgent_buildVersion = v1;

    uint64_t v3 = [v5 objectForKeyedSubscript:*MEMORY[0x263EFFAB8]];
    uint64_t v4 = (void *)deviceUserAgent_deviceClass;
    deviceUserAgent_deviceClass = v3;

    v0 = v5;
  }
}

+ (id)devicePlatform
{
  if (devicePlatform_onceToken != -1) {
    dispatch_once(&devicePlatform_onceToken, &__block_literal_global_127);
  }
  unint64_t v2 = [(id)devicePlatform_deviceClass lowercaseString];
  uint64_t v3 = [v2 stringByReplacingOccurrencesOfString:@" " withString:&stru_26DA0B3F0];

  return v3;
}

void __38__TransparencySettings_devicePlatform__block_invoke()
{
  v0 = (void *)_CFCopySystemVersionDictionary();
  if (v0)
  {
    id v3 = v0;
    uint64_t v1 = [v0 objectForKeyedSubscript:*MEMORY[0x263EFFAB8]];
    unint64_t v2 = (void *)devicePlatform_deviceClass;
    devicePlatform_deviceClass = v1;

    v0 = v3;
  }
}

- (id)devicePlatform
{
  return +[TransparencySettings devicePlatform];
}

+ (id)automatedDeviceGroup
{
  if (automatedDeviceGroup_onceToken != -1) {
    dispatch_once(&automatedDeviceGroup_onceToken, &__block_literal_global_135);
  }
  unint64_t v2 = (void *)automatedDeviceGroup_automatedDeviceGroup;

  return v2;
}

uint64_t __44__TransparencySettings_automatedDeviceGroup__block_invoke()
{
  automatedDeviceGroup_automatedDeviceGroup = [MEMORY[0x263F5B620] automatedDeviceGroup];

  return MEMORY[0x270F9A758]();
}

- (id)automatedDeviceGroup
{
  return +[TransparencySettings automatedDeviceGroup];
}

+ (id)getOverride:(id)a3
{
  id v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.transparencyd");

  return v3;
}

- (id)getOverride:(id)a3
{
  return +[TransparencySettings getOverride:a3];
}

+ (id)transparencyVersionStr
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lld", 104);
}

- (id)transparencyVersionStr
{
  return +[TransparencySettings transparencyVersionStr];
}

+ (id)jsonArrayFromPlistArray:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  id v5 = [v3 array];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__TransparencySettings_jsonArrayFromPlistArray___block_invoke;
  v8[3] = &unk_26479EF18;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __48__TransparencySettings_jsonArrayFromPlistArray___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v4 = v3;
LABEL_4:
    id v5 = v4;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = +[TransparencySettings jsonArrayFromPlistArray:v3];
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = +[TransparencySettings jsonDictFromPlistDict:v3];
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v3, "kt_hexString");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v3, "kt_toISO_8601_UTCString");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  id v5 = [v3 description];
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_6 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_6, &__block_literal_global_145);
  }
  id v6 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_6;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_6, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v10 = 138412546;
    long long v11 = v9;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_ERROR, "jsonFromPlist: failed to convert obj (class: %@) %@, using description", (uint8_t *)&v10, 0x16u);
  }
LABEL_5:
  [*(id *)(a1 + 32) addObject:v5];
}

uint64_t __48__TransparencySettings_jsonArrayFromPlistArray___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_6 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

+ (id)jsonDictFromPlistDict:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = [v3 dictionary];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__TransparencySettings_jsonDictFromPlistDict___block_invoke;
  v8[3] = &unk_26479EF40;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __46__TransparencySettings_jsonDictFromPlistDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
LABEL_7:
    id v8 = v7;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v5, "kt_hexString");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v5, "kt_toISO_8601_UTCString");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  id v8 = [v5 description];
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_6 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_6, &__block_literal_global_150);
  }
  long long v11 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_6;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_6, OS_LOG_TYPE_ERROR))
  {
    __int16 v12 = v11;
    id v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    int v19 = 138412546;
    v20 = v14;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_226345000, v12, OS_LOG_TYPE_ERROR, "jsonFromPlist: failed to convert key (class: %@) %@, using description", (uint8_t *)&v19, 0x16u);
  }
LABEL_8:
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v9 = v6;
LABEL_11:
    int v10 = v9;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = +[TransparencySettings jsonArrayFromPlistArray:v6];
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = +[TransparencySettings jsonDictFromPlistDict:v6];
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v6, "kt_hexString");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v6, "kt_toISO_8601_UTCString");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  int v10 = [v6 description];
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_6 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_6, &__block_literal_global_153);
  }
  uint64_t v15 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_6;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_6, OS_LOG_TYPE_ERROR))
  {
    v16 = v15;
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    int v19 = 138412546;
    v20 = v18;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_226345000, v16, OS_LOG_TYPE_ERROR, "jsonFromPlist: failed to convert obj (class: %@) %@, using description", (uint8_t *)&v19, 0x16u);
  }
LABEL_12:
  if (v8 && v10) {
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v8];
  }
}

uint64_t __46__TransparencySettings_jsonDictFromPlistDict___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_6 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __46__TransparencySettings_jsonDictFromPlistDict___block_invoke_151()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_6 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

+ (id)cfPrefsJson
{
  CFDictionaryRef v2 = CFPreferencesCopyMultiple(0, @"com.apple.transparencyd", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  id v3 = +[TransparencySettings jsonDictFromPlistDict:v2];

  return v3;
}

@end
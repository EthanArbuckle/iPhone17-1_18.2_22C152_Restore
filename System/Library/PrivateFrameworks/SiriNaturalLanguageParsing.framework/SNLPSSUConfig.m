@interface SNLPSSUConfig
+ (BOOL)isInternalInstall;
+ (id)loadAppShortcutAlwaysTriggeredAllowList;
+ (id)loadAppShortcutAlwaysTriggeredAllowListPlist;
+ (id)loadAppShortcutAlwaysTriggeredAllowListUserDefaults;
+ (id)loadPlistArrayFromURL:(id)a3;
@end

@implementation SNLPSSUConfig

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1) {
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global_2643);
  }
  return isInternalInstall_isInternalBuild;
}

uint64_t __34__SNLPSSUConfig_isInternalInstall__block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  isInternalInstall_isInternalBuild = result;
  return result;
}

+ (id)loadAppShortcutAlwaysTriggeredAllowListUserDefaults
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.SiriNaturalLanguageParsing"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 stringArrayForKey:@"SSUAppShortcutAlwaysTriggeredAllowList"];
    if (v4) {
      goto LABEL_9;
    }
    v5 = SNLPOSLoggerForCategory(8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138412290;
      v9 = @"SSUAppShortcutAlwaysTriggeredAllowList";
      v6 = "User defaults string array key not configured: %@. Returning no user defaults.";
LABEL_7:
      _os_log_impl(&dword_1C8DA9000, v5, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    v5 = SNLPOSLoggerForCategory(8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138412290;
      v9 = @"com.apple.SiriNaturalLanguageParsing";
      v6 = "User defaults suite not configured: %@. Returning no user defaults.";
      goto LABEL_7;
    }
  }

  v4 = 0;
LABEL_9:

  return v4;
}

+ (id)loadAppShortcutAlwaysTriggeredAllowListPlist
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  v4 = [v3 URLForResource:@"SSUAppShortcutAlwaysTriggeredAllowList" withExtension:@"plist"];

  if (!v4)
  {
    int v8 = SNLPOSLoggerForCategory(8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = @"SSUAppShortcutAlwaysTriggeredAllowList";
      _os_log_impl(&dword_1C8DA9000, v8, OS_LOG_TYPE_ERROR, "Could not load framework plist: %@. Returning no plist allowlist entries.", buf, 0xCu);
    }
    goto LABEL_21;
  }
  uint64_t v5 = [a1 loadPlistArrayFromURL:v4];
  if (!v5)
  {
    v15 = SNLPOSLoggerForCategory(8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = @"SSUAppShortcutAlwaysTriggeredAllowList";
      _os_log_impl(&dword_1C8DA9000, v15, OS_LOG_TYPE_ERROR, "Could not load array contents of framework plist: %@. Returning no plist allowlist entries.", buf, 0xCu);
    }

    int v8 = 0;
LABEL_21:
    v7 = 0;
    goto LABEL_22;
  }
  v6 = (void *)v5;
  v7 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(__CFString **)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v7 addObject:v13];
        }
        else
        {
          v14 = SNLPOSLoggerForCategory(8);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v22 = v13;
            __int16 v23 = 2112;
            v24 = @"SSUAppShortcutAlwaysTriggeredAllowList";
            _os_log_impl(&dword_1C8DA9000, v14, OS_LOG_TYPE_ERROR, "Found non-string entry (%@) in framework plist: %@. Skipping.", buf, 0x16u);
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v10);
  }

LABEL_22:
  return v7;
}

+ (id)loadPlistArrayFromURL:(id)a3
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithContentsOfURL:a3];
}

+ (id)loadAppShortcutAlwaysTriggeredAllowList
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  v4 = [a1 loadAppShortcutAlwaysTriggeredAllowListPlist];
  [v3 addObjectsFromArray:v4];

  if ([a1 isInternalInstall])
  {
    uint64_t v5 = [a1 loadAppShortcutAlwaysTriggeredAllowListUserDefaults];
    [v3 addObjectsFromArray:v5];
  }
  return v3;
}

@end
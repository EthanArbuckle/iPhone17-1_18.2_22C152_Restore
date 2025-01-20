@interface SpotlightSettingsUtilities
+ (BOOL)isAppWithBundleIDPresent:(id)a3;
+ (void)logSearchPreferencesModificationState;
+ (void)updateSearchPreferencesModificationForKeys:(id)a3;
@end

@implementation SpotlightSettingsUtilities

+ (BOOL)isAppWithBundleIDPresent:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F01878];
  id v4 = a3;
  uint64_t v9 = 0;
  v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:1 error:&v9];

  if (v9)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v7 = [v5 applicationState];
    if ([v7 isInstalled]) {
      int v6 = [v7 isPlaceholder] ^ 1;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

+ (void)logSearchPreferencesModificationState
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = (void *)CFPreferencesCopyAppValue(@"SBSearchPreferencesModification", @"com.apple.spotlightui");
  v3 = (void *)[v2 mutableCopy];

  id v4 = spotlightSettingsLogHandles;
  if (!spotlightSettingsLogHandles)
  {
    SpotlightSettingsInitLogging();
    id v4 = spotlightSettingsLogHandles;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_25E39E000, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v5, 0xCu);
  }
}

+ (void)updateSearchPreferencesModificationForKeys:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)CFPreferencesCopyAppValue(@"SBSearchPreferencesModification", @"com.apple.spotlightui");
  int v5 = (void *)[v4 mutableCopy];

  if (!v5) {
    int v5 = objc_opt_new();
  }
  int v6 = [MEMORY[0x263EFF910] now];
  v17 = [v6 description];

  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v7 bundleIdentifier];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v3;
  uint64_t v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v13 = [NSString stringWithFormat:@"%@%@", v12, @"_DATE"];
        [v5 setObject:v17 forKey:v13];

        v14 = [NSString stringWithFormat:@"%@%@", v12, @"_SOURCE"];
        [v5 setObject:v16 forKey:v14];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  CFPreferencesSetAppValue(@"SBSearchPreferencesModification", v5, @"com.apple.spotlightui");
}

@end
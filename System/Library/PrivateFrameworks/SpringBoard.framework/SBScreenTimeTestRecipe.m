@interface SBScreenTimeTestRecipe
+ (void)_setApplicationBundleIdentifiers:(id)a3 blockedForScreenTimeExpiration:(BOOL)a4;
- (id)_defaultIdentifiers;
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBScreenTimeTestRecipe

- (id)title
{
  return @"Screen Time Policy Test";
}

- (void)handleVolumeIncrease
{
  v3 = objc_opt_class();
  id v4 = [(SBScreenTimeTestRecipe *)self _defaultIdentifiers];
  [v3 _setApplicationBundleIdentifiers:v4 blockedForScreenTimeExpiration:1];
}

- (void)handleVolumeDecrease
{
  v3 = objc_opt_class();
  id v4 = [(SBScreenTimeTestRecipe *)self _defaultIdentifiers];
  [v3 _setApplicationBundleIdentifiers:v4 blockedForScreenTimeExpiration:0];
}

- (id)_defaultIdentifiers
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.mobilecal";
  v4[1] = @"com.apple.mobilesafari";
  v4[2] = @"com.apple.calculator";
  v4[3] = @"com.apple.MobileSMS";
  v4[4] = @"com.apple.Maps";
  v4[5] = @"com.apple.facetime";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
  return v2;
}

+ (void)_setApplicationBundleIdentifiers:(id)a3 blockedForScreenTimeExpiration:(BOOL)a4
{
  BOOL v23 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:512];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v11 = objc_msgSend(MEMORY[0x1E4F223B8], "applicationProxyForIdentifier:", v10, v22);
        v12 = [v11 bundleURL];

        if (v12)
        {
          v13 = [[_SBDMPolicyTestAppInfo alloc] initWithApplicationProxy:v11];
          [(_SBDMPolicyTestAppInfo *)v13 setTestAppBlocked:v23];
          v14 = +[SBApplicationController sharedInstance];
          v15 = [v14 applicationWithBundleIdentifier:v10];
          v16 = [v15 info];

          if (v16) {
            [v22 setObject:v13 forKey:v16];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }
  v17 = v5;

  uint64_t v18 = objc_opt_class();
  v19 = +[SBApplicationController sharedInstance];
  v20 = [v19 _appLibraryObserver];
  v21 = SBSafeCast(v18, v20);

  [v21 _didUpdateApplications:v22];
}

@end
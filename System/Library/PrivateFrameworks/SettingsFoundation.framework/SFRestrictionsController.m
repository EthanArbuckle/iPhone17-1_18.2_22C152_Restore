@interface SFRestrictionsController
+ (id)TCCServices;
+ (id)restrictionSpecifiers;
+ (void)resetRestrictions;
+ (void)resetRestrictionsPassword;
+ (void)setSpringBoardCapability:(id)a3 enabled:(BOOL)a4;
@end

@implementation SFRestrictionsController

+ (id)restrictionSpecifiers
{
  v2 = SFBundleForSettingsFoundationFramework();
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    v4 = NSDictionary;
    v5 = [v2 pathForResource:@"Restrictions" ofType:@"plist"];
    v6 = [v4 dictionaryWithContentsOfFile:v5];

    v7 = [v6 objectForKey:@"items"];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v3 addObjectsFromArray:v7];
      }
    }
    v8 = NSDictionary;
    v9 = [v2 pathForResource:@"5.0~fmf" ofType:@"plist"];
    v10 = [v8 dictionaryWithContentsOfFile:v9];

    v11 = [v10 objectForKey:@"items"];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v3 addObjectsFromArray:v11];
      }
    }
    v12 = NSDictionary;
    v13 = [v2 pathForResource:@"5.0~Restrictions-Assistant" ofType:@"plist"];
    v14 = [v12 dictionaryWithContentsOfFile:v13];

    v15 = [v14 objectForKey:@"items"];
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v3 addObjectsFromArray:v15];
      }
    }
    v16 = (void *)[v3 copy];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)TCCServices
{
  v9[11] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F7C5C8];
  v9[0] = *MEMORY[0x263F7C4F8];
  v9[1] = v2;
  uint64_t v3 = *MEMORY[0x263F7C5B8];
  v9[2] = *MEMORY[0x263F7C508];
  v9[3] = v3;
  uint64_t v4 = *MEMORY[0x263F7C500];
  v9[4] = *MEMORY[0x263F7C5C0];
  v9[5] = v4;
  uint64_t v5 = *MEMORY[0x263F7C688];
  v9[6] = *MEMORY[0x263F7C598];
  v9[7] = v5;
  uint64_t v6 = *MEMORY[0x263F7C510];
  v9[8] = *MEMORY[0x263F7C5A0];
  v9[9] = v6;
  v9[10] = *MEMORY[0x263F7C590];
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:11];
  return v7;
}

+ (void)setSpringBoardCapability:(id)a3 enabled:(BOOL)a4
{
  id v11 = a3;
  uint64_t v5 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v5];
  int v7 = [v6 containsObject:v11];
  if (a4)
  {
    if (v7) {
      [v6 removeObject:v11];
    }
  }
  else if ((v7 & 1) == 0)
  {
    [v6 addObject:v11];
  }
  uint64_t v8 = [v6 count];
  if (v8 != [v5 count])
  {
    CFPreferencesSetAppValue(@"SBParentalControlsCapabilities", v6, @"com.apple.springboard");
    CFPreferencesAppSynchronize(@"com.apple.springboard");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.locationd/Restrictions", 0, 0, 1u);
    v10 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v10, SFPreferencesAppChangedRestrictionsEnabledStateNotification, 0, 0, 1u);
  }
}

+ (void)resetRestrictions
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[SFRestrictionsController restrictionSpecifiers];
  v48 = [MEMORY[0x263F53C50] sharedConnection];
  v45 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v2, "count") + 1);
  v46 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obuint64_t j = v2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v54;
    uint64_t v44 = *MEMORY[0x263F53768];
    v43 = (void *)*MEMORY[0x263F53888];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v54 != v5) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "objectForKey:", @"MCFeature", v43);
        uint64_t v9 = [v7 objectForKey:@"capability"];
        v10 = (void *)v9;
        if (v8)
        {
          id v11 = [v7 objectForKey:@"MCFeatureIsBool"];
          int v12 = [v11 BOOLValue];

          if (v12)
          {
            v13 = [v48 defaultParametersForBoolSetting:v8];
            if (v13)
            {
              [v45 setObject:v13 forKey:v8];
              if ([v8 isEqualToString:v44])
              {
                v14 = v45;
                v15 = v13;
                v16 = v43;
                goto LABEL_14;
              }
            }
            else
            {
              [v48 removeBoolSetting:v8];
            }
          }
          else
          {
            v13 = [v48 defaultParametersForValueSetting:v8];
            v14 = v46;
            v15 = v13;
            v16 = v8;
LABEL_14:
            [v14 setObject:v15 forKey:v16];
          }

          v17 = [v7 objectForKey:@"PostNotification"];
          if (v17)
          {
            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            CFNotificationCenterPostNotification(DarwinNotifyCenter, v17, 0, 0, 1u);
          }

          goto LABEL_19;
        }
        if (v9) {
          +[SFRestrictionsController setSpringBoardCapability:v9 enabled:1];
        }
LABEL_19:
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v4);
  }

  v19 = +[SFRestrictionsController TCCServices];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v50 != v22) {
          objc_enumerationMutation(v19);
        }
        +[SFRestrictionsController setSpringBoardCapability:*(void *)(*((void *)&v49 + 1) + 8 * j) enabled:1];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v21);
  }
  uint64_t v24 = *MEMORY[0x263F53AB8];
  v25 = [v48 defaultParametersForBoolSetting:*MEMORY[0x263F53AB8]];
  [v45 setObject:v25 forKeyedSubscript:v24];

  v26 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v27 = *MEMORY[0x263F53AC0];
  v28 = [v48 defaultParametersForIntersectionSetting:*MEMORY[0x263F53AC0]];
  [v26 setObject:v28 forKeyedSubscript:v27];

  v29 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v30 = *MEMORY[0x263F53AC8];
  v31 = [v48 defaultParametersForUnionSetting:*MEMORY[0x263F53AC8]];
  [v29 setObject:v31 forKeyedSubscript:v30];

  uint64_t v32 = *MEMORY[0x263F53778];
  v33 = [v48 defaultParametersForBoolSetting:*MEMORY[0x263F53778]];
  [v45 setObject:v33 forKeyedSubscript:v32];

  uint64_t v34 = *MEMORY[0x263F53770];
  v35 = [v48 defaultParametersForBoolSetting:*MEMORY[0x263F53770]];
  [v45 setObject:v35 forKeyedSubscript:v34];

  uint64_t v36 = *MEMORY[0x263F53748];
  v37 = [v48 defaultParametersForBoolSetting:*MEMORY[0x263F53748]];
  [v45 setObject:v37 forKeyedSubscript:v36];

  uint64_t v38 = *MEMORY[0x263F537F0];
  v39 = [v48 defaultParametersForBoolSetting:*MEMORY[0x263F537F0]];
  [v45 setObject:v39 forKeyedSubscript:v38];

  uint64_t v40 = *MEMORY[0x263F53B30];
  v57[0] = *MEMORY[0x263F53B20];
  v57[1] = v40;
  v58[0] = v45;
  v58[1] = v46;
  uint64_t v41 = *MEMORY[0x263F53B58];
  v57[2] = *MEMORY[0x263F53AE8];
  v57[3] = v41;
  v58[2] = v26;
  v58[3] = v29;
  v42 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:4];
  [v48 setParametersForSettingsByType:v42];
}

+ (void)resetRestrictionsPassword
{
  +[SFRestrictionsPasscodeController setPIN:0];
  +[SFRestrictionsController resetRestrictions];
}

@end
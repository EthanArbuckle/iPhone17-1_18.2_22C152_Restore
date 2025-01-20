@interface PSSystemPolicyManager
+ (BOOL)_backgroundAppRefreshSettingsNeededForProxy:(id)a3;
+ (BOOL)_cellularDataSettingsNeededForBundleID:(id)a3;
+ (BOOL)_defaultAppSettingsNeededForBundleID:(id)a3;
+ (BOOL)_documentSettingsNeededForBundleID:(id)a3;
+ (BOOL)_familyControlsSettingNeededForBundleID:(id)a3;
+ (BOOL)_journalingSuggestionsSettingsNeededForBundleID:(id)a3;
+ (BOOL)_languageSettingNeededForBundleID:(id)a3;
+ (BOOL)_liveActivitiesSettingsNeededForBundleID:(id)a3;
+ (BOOL)_notificationSettingsNeededForBundleID:(id)a3;
+ (BOOL)_pasteboardSettingsNeededForBundleID:(id)a3;
+ (BOOL)_photosSettingsNeededForProxy:(id)a3;
+ (BOOL)_privacySettingsNeededForProxy:(id)a3;
+ (BOOL)_shouldIncludeProxy:(id)a3;
+ (BOOL)_systemSettingsNeededForProxy:(id)a3;
+ (BOOL)_tapToPaySettingsNeededForBundleID:(id)a3;
+ (BOOL)hasAnyAppClip;
+ (BOOL)isInstalledByThirdPartyMarketplace:(id)a3;
+ (id)_dataUsageWorkspaceInfo;
+ (id)_thirdPartyApplicationProxies;
+ (id)_thirdPartyApplicationProxyForBundleID:(id)a3;
+ (id)specifiersForThirdPartyApps:(id)a3;
+ (id)thirdPartyApplicationForBundleID:(id)a3;
+ (id)thirdPartyApplications;
+ (id)thirdPartyApplicationsIncludingAppClips:(BOOL)a3;
+ (void)_populateBBSectionIDs;
@end

@implementation PSSystemPolicyManager

+ (id)thirdPartyApplications
{
  return (id)[a1 thirdPartyApplicationsIncludingAppClips:1];
}

+ (id)thirdPartyApplicationsIncludingAppClips:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = objc_msgSend(a1, "_thirdPartyApplicationProxies", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (!a3)
        {
          v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) appClipMetadata];

          if (v12) {
            continue;
          }
        }
        v13 = [[PSThirdPartyApp alloc] initWithApplicationRecord:v11];
        [(PSThirdPartyApp *)v13 load];
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)thirdPartyApplicationForBundleID:(id)a3
{
  v3 = [a1 _thirdPartyApplicationProxyForBundleID:a3];
  v4 = [[PSThirdPartyApp alloc] initWithApplicationRecord:v3];
  [(PSThirdPartyApp *)v4 load];

  return v4;
}

+ (BOOL)hasAnyAppClip
{
  PSGreenTeaAppListLog(@"Reading AppList from LSApplicationRecord", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v12);
  uint64_t v8 = [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_7];
  [v8 setPredicate:v9];

  v10 = [v8 nextObject];
  LOBYTE(v9) = v10 != 0;

  return (char)v9;
}

uint64_t __38__PSSystemPolicyManager_hasAnyAppClip__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 appClipMetadata];

  if (v3)
  {
    uint64_t v4 = [v2 bundleIdentifier];
    uint64_t v3 = [v4 length] != 0;
  }
  return v3;
}

+ (id)_thirdPartyApplicationProxies
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_new();
  PSGreenTeaAppListLog(@"Reading AppList from LSEnumerator", v3, v4, v5, v6, v7, v8, v9, v33);
  v10 = [MEMORY[0x1E4F223C8] enumeratorWithOptions:128];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = [*(id *)(*((void *)&v41 + 1) + 8 * i) compatibilityObject];
        [v2 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v12);
  }
  long long v16 = [MEMORY[0x1E4F223C8] enumeratorWithOptions:64];
  [v16 setFilter:&__block_literal_global_10];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [*(id *)(*((void *)&v37 + 1) + 8 * j) compatibilityObject];
        [v2 addObject:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v19);
  }

  v23 = [MEMORY[0x1E4F1CA48] array];
  v24 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v25 = [v24 BOOLForKey:@"kInternalPreferencesLoadsAllSettingsBundles"];

  +[PSSystemPolicyManager _populateBBSectionIDs];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v26 = v2;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v33 + 1) + 8 * k);
        if (v25 && (objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * k), "hasSettingsBundle", (void)v33) & 1) != 0
          || (objc_msgSend(v31, "isManagedAppDistributor", (void)v33) & 1) != 0
          || +[PSSystemPolicyManager isInstalledByThirdPartyMarketplace:](PSSystemPolicyManager, "isInstalledByThirdPartyMarketplace:", v31)|| +[PSSystemPolicyManager _shouldIncludeProxy:v31])
        {
          [v23 addObject:v31];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v28);
  }

  return v23;
}

uint64_t __54__PSSystemPolicyManager__thirdPartyApplicationProxies__block_invoke(uint64_t a1, void *a2)
{
  return PSIsWebAppPlaceholder(a2);
}

+ (id)_thirdPartyApplicationProxyForBundleID:(id)a3
{
  id v3 = a3;
  +[PSSystemPolicyManager _populateBBSectionIDs];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:0];

  if (v4
    && +[PSSystemPolicyManager _shouldIncludeProxy:v4]
    || ([v4 isManagedAppDistributor] & 1) != 0
    || +[PSSystemPolicyManager isInstalledByThirdPartyMarketplace:v4])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (BOOL)isInstalledByThirdPartyMarketplace:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 iTunesMetadata];
  id v5 = [v4 distributorInfo];
  uint64_t v6 = [v5 distributorID];
  if (v6)
  {
    uint64_t v7 = [v3 iTunesMetadata];
    uint64_t v8 = [v7 distributorInfo];
    int v9 = [v8 distributorIsFirstPartyApple] ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

+ (BOOL)_shouldIncludeProxy:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 compatibilityObject];
  id v5 = [v4 applicationType];
  if ([v5 isEqualToString:*MEMORY[0x1E4F22390]])
  {
    BOOL v6 = ([v3 hasSettingsBundle] & 1) != 0
      || +[PSSystemPolicyManager _systemSettingsNeededForProxy:v3];
  }
  else
  {
    uint64_t v7 = [v3 bundleIdentifier];
    if ([v7 isEqualToString:@"com.apple.PlaygroundsBeta"]) {
      BOOL v6 = ([v3 hasSettingsBundle] & 1) != 0
    }
        || +[PSSystemPolicyManager _systemSettingsNeededForProxy:v3];
    else {
      BOOL v6 = 0;
    }
  }
  return v6;
}

+ (BOOL)_systemSettingsNeededForProxy:(id)a3
{
  id v3 = a3;
  if (+[PSSystemPolicyManager _privacySettingsNeededForProxy:](PSSystemPolicyManager, "_privacySettingsNeededForProxy:", v3)|| +[PSSystemPolicyManager _photosSettingsNeededForProxy:](PSSystemPolicyManager, "_photosSettingsNeededForProxy:", v3)|| +[PSSystemPolicyManager _backgroundAppRefreshSettingsNeededForProxy:v3])
  {
    BOOL v4 = 1;
  }
  else
  {
    BOOL v6 = [v3 bundleIdentifier];
    if (+[PSSystemPolicyManager _cellularDataSettingsNeededForBundleID:v6])
    {
      BOOL v4 = 1;
    }
    else
    {
      uint64_t v7 = [v3 bundleIdentifier];
      if (+[PSSystemPolicyManager _notificationSettingsNeededForBundleID:v7])
      {
        BOOL v4 = 1;
      }
      else
      {
        uint64_t v8 = [v3 bundleIdentifier];
        if (+[PSSystemPolicyManager _documentSettingsNeededForBundleID:v8])
        {
          BOOL v4 = 1;
        }
        else
        {
          int v9 = [v3 bundleIdentifier];
          if (+[PSSystemPolicyManager _defaultAppSettingsNeededForBundleID:v9])
          {
            BOOL v4 = 1;
          }
          else
          {
            v10 = [v3 bundleIdentifier];
            if (+[PSSystemPolicyManager _languageSettingNeededForBundleID:v10])
            {
              BOOL v4 = 1;
            }
            else
            {
              uint64_t v11 = [v3 bundleIdentifier];
              if (+[PSSystemPolicyManager _familyControlsSettingNeededForBundleID:v11])
              {
                BOOL v4 = 1;
              }
              else
              {
                uint64_t v12 = [v3 bundleIdentifier];
                if (+[PSSystemPolicyManager _liveActivitiesSettingsNeededForBundleID:v12])
                {
                  BOOL v4 = 1;
                }
                else
                {
                  v14 = [v3 bundleIdentifier];
                  if (+[PSSystemPolicyManager _tapToPaySettingsNeededForBundleID:](PSSystemPolicyManager, "_tapToPaySettingsNeededForBundleID:"))
                  {
                    BOOL v4 = 1;
                  }
                  else
                  {
                    uint64_t v13 = [v3 bundleIdentifier];
                    BOOL v4 = +[PSSystemPolicyManager _pasteboardSettingsNeededForBundleID:v13];
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

+ (BOOL)_privacySettingsNeededForProxy:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  CFAllocatorRef Default = CFAllocatorGetDefault();
  CFURLRef v5 = [v3 URL];
  CFBundleRef v6 = CFBundleCreate(Default, v5);

  if (v6)
  {
    uint64_t v7 = (void *)TCCAccessCopyInformationForBundle();
    CFRelease(v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [v7 count];
  if (_os_feature_enabled_impl())
  {
    int v9 = PKLogForCategory(2);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (v8) {
        v10 = @"YES";
      }
      else {
        v10 = @"NO";
      }
      uint64_t v11 = [v3 bundleIdentifier];
      int v13 = 138412546;
      v14 = v10;
      __int16 v15 = 2112;
      long long v16 = v11;
      _os_log_impl(&dword_1A6597000, v9, OS_LOG_TYPE_INFO, "privacy == %@ for '%@'", (uint8_t *)&v13, 0x16u);
    }
  }

  return v8 != 0;
}

+ (BOOL)_photosSettingsNeededForProxy:(id)a3
{
  id v3 = [a3 bundleIdentifier];
  if ([v3 length])
  {
    BOOL v4 = PSPhotosPolicyBundleIdentifiersWithRecentPickerUsage();
    char v5 = [v4 containsObject:v3];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)_backgroundAppRefreshSettingsNeededForProxy:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v4 = objc_msgSend(v3, "UIBackgroundModes", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v9 isEqualToString:@"remote-notification"])
        {
          [v9 isEqualToString:@"fetch"];
LABEL_16:
          if (_os_feature_enabled_impl())
          {
            int v13 = PKLogForCategory(2);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              v14 = [v3 bundleIdentifier];
              *(_DWORD *)buf = 138412290;
              v21 = v14;
              _os_log_impl(&dword_1A6597000, v13, OS_LOG_TYPE_INFO, "backgroundAppRefresh == YES for '%@'", buf, 0xCu);
            }
          }
          BOOL v12 = 1;
          goto LABEL_21;
        }
        int v10 = [v9 isEqualToString:@"newsstand-content"];
        if (([v9 isEqualToString:@"fetch"] & 1) != 0 || v10) {
          goto LABEL_16;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (_os_feature_enabled_impl())
  {
    BOOL v4 = PKLogForCategory(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [v3 bundleIdentifier];
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_impl(&dword_1A6597000, v4, OS_LOG_TYPE_INFO, "backgroundAppRefresh == NO for '%@'", buf, 0xCu);
    }
    BOOL v12 = 0;
LABEL_21:
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (id)_dataUsageWorkspaceInfo
{
  BOOL v12 = 0;
  uint64_t v8 = 0;
  long long v10 = 0u;
  uint64_t v11 = 0;
  id v9 = a1;
  uint64_t v2 = _CTServerConnectionCreate();
  if (v2)
  {
    id v3 = (const void *)v2;
    _CTServerConnectionCopyCellularUsageWorkspaceInfo();
    CFRelease(v3);
  }
  BOOL v4 = _PSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1A6597000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get the data usage workspace information", v7, 2u);
  }

  uint64_t v5 = v12;
  return v5;
}

+ (BOOL)_cellularDataSettingsNeededForBundleID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (MGGetBoolAnswer())
  {
    if (_cellularDataSettingsNeededForBundleID__onceToken != -1) {
      dispatch_once(&_cellularDataSettingsNeededForBundleID__onceToken, &__block_literal_global_38);
    }
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    BOOL v4 = [(id)_cellularDataSettingsNeededForBundleID__workspace persistentStoreCoordinator];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__PSSystemPolicyManager__cellularDataSettingsNeededForBundleID___block_invoke_2;
    v10[3] = &unk_1E5C5DC60;
    id v5 = v3;
    id v11 = v5;
    BOOL v12 = &v13;
    [v4 performBlockAndWait:v10];

    if (_os_feature_enabled_impl())
    {
      uint64_t v6 = PKLogForCategory(2);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        if (*((unsigned char *)v14 + 24)) {
          uint64_t v7 = @"YES";
        }
        else {
          uint64_t v7 = @"NO";
        }
        *(_DWORD *)buf = 138412546;
        long long v18 = v7;
        __int16 v19 = 2112;
        id v20 = v5;
        _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_INFO, "cellularData == %@ for '%@'", buf, 0x16u);
      }
    }
    BOOL v8 = *((unsigned char *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __64__PSSystemPolicyManager__cellularDataSettingsNeededForBundleID___block_invoke()
{
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  uint64_t v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  v0 = +[PSSystemPolicyManager _dataUsageWorkspaceInfo];
  v1 = [v0 objectForKey:*MEMORY[0x1E4F23D38]];
  uint64_t v2 = [v0 objectForKey:*MEMORY[0x1E4F23D40]];
  id v3 = (void *)v2;
  if (v1) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    id v5 = (void *)_cellularDataSettingsNeededForBundleID__workspace;
    _cellularDataSettingsNeededForBundleID__workspace = 0;
  }
  else
  {
    uint64_t v18 = 0;
    __int16 v19 = &v18;
    uint64_t v20 = 0x2050000000;
    uint64_t v6 = (void *)getAnalyticsWorkspaceClass_softClass;
    uint64_t v21 = getAnalyticsWorkspaceClass_softClass;
    if (!getAnalyticsWorkspaceClass_softClass)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __getAnalyticsWorkspaceClass_block_invoke;
      v17[3] = &unk_1E5C5D4D8;
      v17[4] = &v18;
      __getAnalyticsWorkspaceClass_block_invoke((uint64_t)v17);
      uint64_t v6 = (void *)v19[3];
    }
    uint64_t v7 = v6;
    _Block_object_dispose(&v18, 8);
    uint64_t v8 = [[v7 alloc] initWorkspaceWithName:v1 atPath:v3 useReadOnly:1];
    id v9 = (void *)_cellularDataSettingsNeededForBundleID__workspace;
    _cellularDataSettingsNeededForBundleID__workspace = v8;

    id v5 = [(id)_cellularDataSettingsNeededForBundleID__workspace persistentStoreCoordinator];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__PSSystemPolicyManager__cellularDataSettingsNeededForBundleID___block_invoke_39;
    v10[3] = &unk_1E5C5D4D8;
    void v10[4] = &v11;
    [v5 performBlockAndWait:v10];
  }

  objc_storeStrong((id *)&_cellularDataSettingsNeededForBundleID__processAnalytics, (id)v12[5]);
  _Block_object_dispose(&v11, 8);
}

void __64__PSSystemPolicyManager__cellularDataSettingsNeededForBundleID___block_invoke_39(uint64_t a1)
{
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2050000000;
  uint64_t v2 = (void *)getProcessAnalyticsClass_softClass;
  uint64_t v12 = getProcessAnalyticsClass_softClass;
  if (!getProcessAnalyticsClass_softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getProcessAnalyticsClass_block_invoke;
    v8[3] = &unk_1E5C5D4D8;
    v8[4] = &v9;
    __getProcessAnalyticsClass_block_invoke((uint64_t)v8);
    uint64_t v2 = (void *)v10[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v9, 8);
  id v4 = [v3 alloc];
  uint64_t v5 = [v4 initWithWorkspace:_cellularDataSettingsNeededForBundleID__workspace withCache:0];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __64__PSSystemPolicyManager__cellularDataSettingsNeededForBundleID___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)_cellularDataSettingsNeededForBundleID__processAnalytics;
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"bundleName like %@", *(void *)(a1 + 32)];
  id v4 = [v2 fetchEntitiesFreeForm:v3 sortDesc:0];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) bundleName];
        int v11 = [v10 isEqualToString:*(void *)(a1 + 32)];

        if (v11)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

+ (BOOL)_tapToPaySettingsNeededForBundleID:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2050000000;
  id v4 = (void *)getPRSettingsProviderClass_softClass_0;
  uint64_t v11 = getPRSettingsProviderClass_softClass_0;
  if (!getPRSettingsProviderClass_softClass_0)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getPRSettingsProviderClass_block_invoke_0;
    v7[3] = &unk_1E5C5D4D8;
    v7[4] = &v8;
    __getPRSettingsProviderClass_block_invoke_0((uint64_t)v7);
    id v4 = (void *)v9[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);
  LOBYTE(v5) = [v5 isProximityReaderSupported:v3];

  return (char)v5;
}

+ (BOOL)_pasteboardSettingsNeededForBundleID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4FA9AD8];
  id v11 = 0;
  id v12 = 0;
  id v10 = 0;
  PSGetAuthorizationStatesForService(v4, &v12, &v11, &v10);
  id v5 = v12;
  id v6 = v11;
  id v7 = v10;
  if ([v5 containsObject:v3] & 1) != 0 || (objc_msgSend(v6, "containsObject:", v3)) {
    char v8 = 1;
  }
  else {
    char v8 = [v7 containsObject:v3];
  }

  return v8;
}

+ (id)specifiersForThirdPartyApps:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v18 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v21 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v21) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        char v8 = [v7 record];
        uint64_t v9 = [v8 URL];
        id v10 = [v8 bundleIdentifier];
        id v11 = [v9 URLByAppendingPathComponent:@"Settings.bundle"];
        if (v11)
        {
          id v12 = [MEMORY[0x1E4F28B50] bundleWithURL:v11];
          long long v13 = [v7 localizedName];
          long long v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:a1 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
          [v14 setProperty:@"Root" forKey:@"File"];
          long long v15 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
          [v14 setProperty:v15 forKey:@"useLazyIcons"];

          [v14 setProperty:v10 forKey:@"appIDForLazyIcon"];
          [v14 setProperty:v12 forKey:@"AppSettingsBundle"];
          [v14 setProperty:v10 forKey:@"AppBundleID"];
          [v14 setProperty:v10 forKey:@"id"];
          [v14 setProperty:v10 forKey:@"restrictByID"];
          if (!PSIsSpecifierHiddenDueToRestrictions(v14)) {
            [v18 addObject:v14];
          }
        }
        else
        {
          id v12 = _PSLoggingFacility();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_13;
          }
          long long v13 = [v8 localizedName];
          *(_DWORD *)buf = 136315650;
          uint64_t v27 = "+[PSSystemPolicyManager specifiersForThirdPartyApps:]";
          __int16 v28 = 2112;
          uint64_t v29 = v13;
          __int16 v30 = 2112;
          v31 = v8;
          _os_log_impl(&dword_1A6597000, v12, OS_LOG_TYPE_DEFAULT, "%s - settingsBundleURL is nil for (%@) %@ ", buf, 0x20u);
        }

LABEL_13:
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v5);
  }

  id v16 = (void *)[v18 copy];
  return v16;
}

+ (void)_populateBBSectionIDs
{
  obuint64_t j = a1;
  objc_sync_enter(obj);
  uint64_t v2 = +[PSNotificationSettingsController sharedInstance];
  uint64_t v3 = [v2 allSectionInfoIdentifiers];
  uint64_t v4 = (void *)gBBSectionIDs;
  gBBSectionIDs = v3;

  objc_sync_exit(obj);
}

+ (BOOL)_journalingSuggestionsSettingsNeededForBundleID:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F223C8];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  LOBYTE(v4) = [v5 supportsJournalingSuggestions];
  return (char)v4;
}

+ (BOOL)_liveActivitiesSettingsNeededForBundleID:(id)a3
{
  id v3 = a3;
  if (_os_feature_enabled_impl())
  {
    uint64_t v7 = 0;
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v7];
    char v5 = [v4 supportsLiveActivities];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)_notificationSettingsNeededForBundleID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  int v6 = [(id)gBBSectionIDs containsObject:v4];
  objc_sync_exit(v5);

  if (_os_feature_enabled_impl())
  {
    uint64_t v7 = PKLogForCategory(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      char v8 = @"NO";
      if (v6) {
        char v8 = @"YES";
      }
      int v10 = 138412546;
      id v11 = v8;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_INFO, "notification == %@ for '%@'", (uint8_t *)&v10, 0x16u);
    }
  }
  return v6;
}

+ (BOOL)_documentSettingsNeededForBundleID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:v3];
  id v5 = [v4 infoDictionary];

  int v6 = [v5 objectForKeyedSubscript:@"UISupportsDocumentBrowser"];
  int v7 = [v6 BOOLValue];

  if (_os_feature_enabled_impl())
  {
    char v8 = PKLogForCategory(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = @"NO";
      if (v7) {
        uint64_t v9 = @"YES";
      }
      int v11 = 138412546;
      __int16 v12 = v9;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_1A6597000, v8, OS_LOG_TYPE_INFO, "document == %@ for '%@'", (uint8_t *)&v11, 0x16u);
    }
  }
  return v7;
}

+ (BOOL)_defaultAppSettingsNeededForBundleID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v10 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v10];
  id v5 = v10;
  if ([v4 isEligibleWebBrowser]) {
    int v6 = 1;
  }
  else {
    int v6 = [v4 isEligibleMailClient];
  }
  if (_os_feature_enabled_impl())
  {
    int v7 = PKLogForCategory(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      char v8 = @"NO";
      if (v6) {
        char v8 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      __int16 v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_INFO, "defaultApp == %@ for '%@'", buf, 0x16u);
    }
  }
  return v6;
}

+ (BOOL)_languageSettingNeededForBundleID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = (__CFString *)a3;
  id v18 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v18];
  id v5 = v18;
  int v6 = [v4 URL];
  if (v6)
  {
    int v7 = [MEMORY[0x1E4F28B50] bundleWithURL:v6];
    char v8 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    unint64_t v9 = [v8 count];

    if (v9 >= 2)
    {
      _os_feature_enabled_impl();
    }
    else
    {
      id v10 = [v7 objectForInfoDictionaryKey:@"UIPrefersShowingLanguageSettings"];
      int v11 = [v10 BOOLValue];

      if (_os_feature_enabled_impl() && (v11 & 1) == 0)
      {
        __int16 v12 = PKLogForCategory(2);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v20 = v3;
          _os_log_impl(&dword_1A6597000, v12, OS_LOG_TYPE_INFO, "language == NO for '%@'", buf, 0xCu);
        }
        BOOL v13 = 0;
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      if (!v11)
      {
        BOOL v13 = 0;
        goto LABEL_17;
      }
    }
    __int16 v12 = [v7 normalizedLocalizations];
    unint64_t v14 = [v12 count];
    BOOL v13 = v14 > 1;
    if (_os_feature_enabled_impl())
    {
      uint64_t v15 = PKLogForCategory(2);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = @"NO";
        if (v14 > 1) {
          id v16 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v20 = v16;
        __int16 v21 = 2112;
        long long v22 = v3;
        _os_log_impl(&dword_1A6597000, v15, OS_LOG_TYPE_INFO, "language == %@ for '%@'", buf, 0x16u);
      }
    }
    goto LABEL_16;
  }
  BOOL v13 = 0;
LABEL_18:

  return v13;
}

+ (BOOL)_familyControlsSettingNeededForBundleID:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x2050000000;
  id v4 = (void *)getFOAuthorizationCenterClass_softClass_0;
  uint64_t v23 = getFOAuthorizationCenterClass_softClass_0;
  if (!getFOAuthorizationCenterClass_softClass_0)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    id v26 = __getFOAuthorizationCenterClass_block_invoke_0;
    uint64_t v27 = &unk_1E5C5D4D8;
    __int16 v28 = &v20;
    __getFOAuthorizationCenterClass_block_invoke_0((uint64_t)&buf);
    id v4 = (void *)v21[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v20, 8);
  int v6 = objc_msgSend(v5, "sharedCenter", (void)v16);
  int v7 = [v6 authorizationRecords];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        int v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) bundleIdentifier];
        int v12 = [v11 isEqualToString:v3];

        if (v12)
        {
          if (_os_feature_enabled_impl())
          {
            unint64_t v14 = PKLogForCategory(2);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v3;
              _os_log_impl(&dword_1A6597000, v14, OS_LOG_TYPE_INFO, "familyControls == YES for '%@'", (uint8_t *)&buf, 0xCu);
            }
          }
          BOOL v13 = 1;
          goto LABEL_20;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  if (_os_feature_enabled_impl())
  {
    int v7 = PKLogForCategory(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_INFO, "familyControls == NO for '%@'", (uint8_t *)&buf, 0xCu);
    }
    BOOL v13 = 0;
LABEL_20:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

@end
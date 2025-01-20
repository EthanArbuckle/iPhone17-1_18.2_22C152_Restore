@interface UNCNotificationSourceDescription(Factory)
+ (__CFString)systemSourcePathExtension;
+ (id)_validEnvironmentFromEnvironment:()Factory;
+ (id)applicationSourceDescriptionWithApplication:()Factory;
+ (id)applicationSourceDescriptionWithBundleIdentifier:()Factory;
+ (id)sourceDescriptionWithBundleIdentifier:()Factory;
+ (id)systemSourceDescriptionWithBundleIdentifier:()Factory;
+ (id)systemSourceDescriptionWithBundleURL:()Factory;
+ (id)systemSourceDirectoryURLs;
- (void)setDefaultCategoriesFromArray:()Factory bundle:;
- (void)setDefaultTopicsFromArray:()Factory bundle:;
- (void)setIconFilesFromDictionary:()Factory;
- (void)setSystemPropertiesFromDictionary:()Factory bundle:;
@end

@implementation UNCNotificationSourceDescription(Factory)

+ (id)applicationSourceDescriptionWithApplication:()Factory
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v10 = 0;
    goto LABEL_79;
  }
  v93 = a1;
  uint64_t v6 = [v4 bundleIdentifier];
  uint64_t v7 = [v5 bundleURL];
  uint64_t v8 = [v5 dataContainerURL];
  uint64_t v9 = [v5 groupContainerURLs];
  id v10 = objc_alloc_init(MEMORY[0x263F84278]);
  v96 = (void *)v6;
  [v10 setBundleIdentifier:v6];
  v95 = (void *)v7;
  [v10 setBundleURL:v7];
  v92 = (void *)v8;
  [v10 setDataContainerURL:v8];
  v91 = (void *)v9;
  [v10 setGroupContainerURLS:v9];
  v90 = [v5 appState];
  objc_msgSend(v10, "setRestricted:", objc_msgSend(v90, "isRestricted"));
  id v11 = v5;
  v12 = [MEMORY[0x263F29CA0] sharedInstance];
  LODWORD(v7) = [v12 deviceClass];

  int v84 = v7;
  v97 = v11;
  if (v7 == 4)
  {
    long long v108 = 0uLL;
    long long v109 = 0uLL;
    long long v106 = 0uLL;
    long long v107 = 0uLL;
    v13 = [v11 plugInKitPlugins];
    uint64_t v22 = [v13 countByEnumeratingWithState:&v106 objects:v122 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      v88 = v5;
      uint64_t v24 = *(void *)v107;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v107 != v24) {
            objc_enumerationMutation(v13);
          }
          v26 = *(void **)(*((void *)&v106 + 1) + 8 * i);
          v27 = [v26 objectForInfoDictionaryKey:@"NSExtensionPointIdentifier" ofClass:objc_opt_class() inScope:1];
          int v28 = [v27 isEqualToString:@"com.apple.watchkit"];

          if (v28)
          {
            id v29 = v26;
            id v11 = v97;
            v30 = v97;
LABEL_25:

            v5 = v88;
            goto LABEL_26;
          }
        }
        uint64_t v23 = [v13 countByEnumeratingWithState:&v106 objects:v122 count:16];
        if (v23) {
          continue;
        }
        goto LABEL_21;
      }
    }
LABEL_22:
    id v29 = v11;
    goto LABEL_26;
  }
  long long v104 = 0uLL;
  long long v105 = 0uLL;
  long long v102 = 0uLL;
  long long v103 = 0uLL;
  v13 = [v11 plugInKitPlugins];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v102 objects:v121 count:16];
  if (!v14) {
    goto LABEL_22;
  }
  uint64_t v15 = v14;
  v88 = v5;
  uint64_t v16 = *(void *)v103;
  uint64_t v17 = *MEMORY[0x263F84348];
  while (2)
  {
    for (uint64_t j = 0; j != v15; ++j)
    {
      if (*(void *)v103 != v16) {
        objc_enumerationMutation(v13);
      }
      v19 = *(void **)(*((void *)&v102 + 1) + 8 * j);
      v20 = [v19 objectForInfoDictionaryKey:@"NSExtensionPointIdentifier" ofClass:objc_opt_class() inScope:1];
      int v21 = [v20 isEqualToString:v17];

      if (v21)
      {
        v30 = [v19 entitlementValueForKey:@"com.apple.developer.usernotifications.filtering" ofClass:objc_opt_class()];
        objc_msgSend(v10, "setAllowServiceExtensionFiltering:", objc_msgSend(v30, "BOOLValue"));
        id v11 = v97;
        id v29 = v97;
        goto LABEL_25;
      }
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v102 objects:v121 count:16];
    if (v15) {
      continue;
    }
    break;
  }
LABEL_21:
  id v11 = v97;
  id v29 = v97;
  v5 = v88;
LABEL_26:

  v31 = [v11 correspondingApplicationRecord];
  v32 = v31;
  if (v31)
  {
    v33 = [v31 localizedName];
    [v10 setDisplayName:v33];

    v34 = [v32 appClipMetadata];
    [v10 setIsAppClip:v34 != 0];

    v35 = [v32 appClipMetadata];
    objc_msgSend(v10, "setWantsEphemeralNotifications:", objc_msgSend(v35, "wantsEphemeralNotifications"));
  }
  v89 = v32;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  uint64_t v36 = objc_opt_class();
  v37 = [v29 entitlementValueForKey:@"com.apple.developer.icloud-services" ofClass:v36 valuesOfClass:objc_opt_class()];
  uint64_t v38 = [v37 countByEnumeratingWithState:&v98 objects:v120 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v99;
    while (2)
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v99 != v40) {
          objc_enumerationMutation(v37);
        }
        if (![*(id *)(*((void *)&v98 + 1) + 8 * k) caseInsensitiveCompare:@"cloudkit"])
        {
          uint64_t v42 = 1;
          goto LABEL_38;
        }
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v98 objects:v120 count:16];
      if (v39) {
        continue;
      }
      break;
    }
    uint64_t v42 = 0;
LABEL_38:
    id v11 = v97;
  }
  else
  {
    uint64_t v42 = 0;
  }

  [v10 setUsesCloudKit:v42];
  v87 = [v29 entitlementValueForKey:@"aps-environment" ofClass:objc_opt_class()];
  v86 = objc_msgSend(v93, "_validEnvironmentFromEnvironment:");
  objc_msgSend(v10, "setPushEnvironment:");
  v43 = [v29 entitlementValueForKey:@"com.apple.developer.usernotifications.critical-alerts" ofClass:objc_opt_class()];
  BOOL v45 = v84 != 4 || v29 == v11;
  if (!v43 && !v45)
  {
    v43 = [v11 entitlementValueForKey:@"com.apple.developer.usernotifications.critical-alerts" ofClass:objc_opt_class()];
  }
  v85 = v43;
  objc_msgSend(v10, "setAllowCriticalAlerts:", objc_msgSend(v43, "BOOLValue"));
  v46 = [v29 entitlementValueForKey:@"com.apple.developer.usernotifications.time-sensitive" ofClass:objc_opt_class()];
  if (v46) {
    char v47 = 1;
  }
  else {
    char v47 = v45;
  }
  if ((v47 & 1) == 0)
  {
    v46 = [v11 entitlementValueForKey:@"com.apple.developer.usernotifications.time-sensitive" ofClass:objc_opt_class()];
  }
  v83 = v46;
  int v81 = [v46 BOOLValue];
  objc_msgSend(v10, "setAllowTimeSensitive:");
  v48 = [v29 entitlementValueForKey:@"com.apple.developer.usernotifications.communication" ofClass:objc_opt_class()];
  if (v48) {
    char v49 = 1;
  }
  else {
    char v49 = v45;
  }
  if ((v49 & 1) == 0)
  {
    v48 = [v11 entitlementValueForKey:@"com.apple.developer.usernotifications.communication" ofClass:objc_opt_class()];
  }
  v82 = v48;
  int v50 = [v48 BOOLValue];
  int v79 = objc_msgSend(v96, "un_isFirstPartyIdentifier");
  uint64_t v51 = *MEMORY[0x263F0F800];
  unsigned int CanDonateIntent = INBundleProxyCanDonateIntent();
  v53 = (__CFString *)*MEMORY[0x263F0F7F8];
  unsigned int v54 = INBundleProxyCanDonateIntent();
  uint64_t v55 = *MEMORY[0x263F0F818];
  unsigned int v56 = INBundleProxyCanDonateIntent();
  v94 = [v29 entitlementValueForKey:@"application-identifier" ofClass:objc_opt_class()];
  if ((v56 & 1) == 0 && (v54 & 1) == 0 && (CanDonateIntent & 1) == 0)
  {
    unsigned int CanDonateIntent = [v94 isEqualToString:@"com.apple.internal.suiautomation"] != 0;
    unsigned int v54 = CanDonateIntent;
    unsigned int v56 = CanDonateIntent;
  }
  [v10 setAllowCalls:v50 & v56];
  [v10 setAllowIntercom:v50 & v54];
  [v10 setAllowMessages:v50 & CanDonateIntent];
  if ((v56 & 1) == 0 && (v54 & 1) == 0 && (CanDonateIntent & 1) == 0 && ((v50 ^ 1) & 1) == 0)
  {
    v57 = *MEMORY[0x263F1E008];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E008], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544386;
      v76 = &stru_26D509FA0;
      v111 = v96;
      if (v79) {
        v76 = v53;
      }
      __int16 v112 = 2114;
      v113 = @"com.apple.developer.usernotifications.communication";
      __int16 v114 = 2114;
      uint64_t v115 = v55;
      __int16 v116 = 2114;
      v117 = v76;
      __int16 v118 = 2114;
      uint64_t v119 = v51;
      _os_log_error_impl(&dword_22289A000, v57, OS_LOG_TYPE_ERROR, "[%{public}@] Error: App has '%{public}@' entitlement but does not support donating [%{public}@,%{public}@,%{public}@]. Communication API features will be denied to app.", buf, 0x34u);
    }
  }
  uint64_t v58 = *MEMORY[0x263F1D0F0];
  uint64_t v59 = objc_opt_class();
  v60 = [v29 objectForInfoDictionaryKey:v58 ofClass:v59 valuesOfClass:objc_opt_class()];
  LODWORD(v58) = [v60 containsObject:*MEMORY[0x263F1D0E8]];
  v61 = [v97 activityTypes];
  v62 = (void *)[v61 copy];

  [v10 setActivityTypes:v62];
  objc_msgSend(v10, "setSupportsContentAvailableRemoteNotifications:", v58 | objc_msgSend(v97, "isNewsstandApp") & objc_msgSend(v60, "containsObject:", @"newsstand-content"));
  v63 = [v97 applicationType];
  int v64 = [v63 isEqualToString:@"System"];
  if (v64)
  {
    uint64_t v65 = [v97 objectForInfoDictionaryKey:@"UNUserNotificationCenter" ofClass:objc_opt_class()];
    if (v95)
    {
      v66 = (void *)[objc_alloc(MEMORY[0x263F29C00]) initWithURL:v95];
      [v10 setSystemPropertiesFromDictionary:v65 bundle:v66];
    }
    uint64_t v77 = v65;
    id v80 = v29;
    if (v81)
    {
      v67 = objc_msgSend(v10, "defaultSettings", v65);
      [v67 setSupportsTimeSensitive:1];
    }
    objc_msgSend(v10, "setAllowPrivateProperties:", 1, v77);
    v68 = [v97 objectForInfoDictionaryKey:@"SBAppUsesLocalNotifications" ofClass:0];
    int v69 = objc_msgSend(v68, "un_safeBoolValue");

    v70 = [v97 objectForInfoDictionaryKey:@"BBDataProvider" ofClass:0];
    int v71 = objc_msgSend(v70, "un_safeBoolValue");

    v72 = [v97 objectForInfoDictionaryKey:@"UNUserNotificationCenter" ofClass:0];

    if (v72) {
      int v73 = 1;
    }
    else {
      int v73 = v69;
    }
    [v10 setUseDefaultDataProvider:v73 & (v71 ^ 1u)];

    v74 = v95;
    id v29 = v80;
  }
  else
  {
    [v10 setUseDefaultDataProvider:1];
    v74 = v95;
  }
  objc_msgSend(v10, "setAllowAlternateLaunchBundleIdentifiers:", v64 | objc_msgSend(v89, "isWebApp"));

LABEL_79:
  return v10;
}

+ (id)systemSourceDescriptionWithBundleIdentifier:()Factory
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 hasPrefix:@"com.apple."])
  {
    [a1 systemSourceDirectoryURLs];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v9), "URLByAppendingPathComponent:", v4, (void)v15);
        id v11 = [a1 systemSourcePathExtension];
        v12 = [v10 URLByAppendingPathExtension:v11];

        v13 = [MEMORY[0x263F84278] systemSourceDescriptionWithBundleURL:v12];

        if (v13) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (__CFString)systemSourcePathExtension
{
  return @"bundle";
}

+ (id)systemSourceDescriptionWithBundleURL:()Factory
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263F29C00]) initWithURL:v3];
  id v5 = [v4 bundleIdentifier];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 stringByAppendingPathExtension:@"bundle"];
    uint64_t v8 = [v3 lastPathComponent];
    int v9 = [v7 isEqualToString:v8];

    if (v9)
    {
      id v10 = [v4 localizedInfoDictionary];
      id v11 = objc_msgSend(v10, "bs_safeObjectForKey:ofType:", *MEMORY[0x263EFFA90], objc_opt_class());
      if (!v11)
      {
        id v11 = objc_msgSend(v10, "bs_safeObjectForKey:ofType:", *MEMORY[0x263EFFB68], objc_opt_class());
      }
      v12 = [v4 infoDictionary];
      v13 = objc_msgSend(v12, "bs_safeObjectForKey:ofType:", @"UNUserNotificationCenter", objc_opt_class());
      id v14 = objc_alloc_init(MEMORY[0x263F84278]);
      [v14 setAllowPrivateProperties:1];
      [v14 setBundleIdentifier:v6];
      [v14 setBundleURL:v3];
      [v14 setDisplayName:v11];
      [v14 setUseDefaultDataProvider:1];
      [v14 setSystemPropertiesFromDictionary:v13 bundle:v4];
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (id)systemSourceDirectoryURLs
{
  v8[3] = *MEMORY[0x263EF8340];
  v0 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  if (UNIsInternalInstall())
  {
    v1 = NSString;
    v2 = BSSystemRootDirectory();
    v8[0] = v2;
    v8[1] = @"AppleInternal";
    v8[2] = @"Library";
    id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];
    id v4 = [v1 pathWithComponents:v3];
    uint64_t v5 = [v0 arrayByAddingObject:v4];

    v0 = (void *)v5;
  }
  uint64_t v6 = objc_msgSend(v0, "bs_map:", &__block_literal_global_8);

  return v6;
}

- (void)setIconFilesFromDictionary:()Factory
{
  id v4 = a3;
  int v21 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"UNNotificationIconCarPlay", objc_opt_class());
  uint64_t v20 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"UNNotificationIconDefault", objc_opt_class());
  v19 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"UNNotificationIconSettings", objc_opt_class());
  long long v18 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"UNNotificationIconSettingsSheet", objc_opt_class());
  long long v17 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"UNNotificationIconSubordinate", objc_opt_class());
  long long v16 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"UNNotificationIconWatchQuickLookSmall", objc_opt_class());
  long long v15 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"UNNotificationIconWatchQuickLookLarge", objc_opt_class());
  uint64_t v5 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"UNNotificationIconWatchListSmall", objc_opt_class());
  uint64_t v6 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"UNNotificationIconWatchListLarge", objc_opt_class());
  uint64_t v7 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"UNNotificationIconWatchQuickLook394h", objc_opt_class());
  uint64_t v8 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"UNNotificationIconWatchQuickLook448h", objc_opt_class());
  id v14 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"UNNotificationIconWatchList394h", objc_opt_class());
  v13 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"UNNotificationIconWatchList448h", objc_opt_class());
  v12 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"UNNotificationIconWatchQuickLook430h", objc_opt_class());
  id v11 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"UNNotificationIconWatchQuickLook484h", objc_opt_class());
  id v10 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"UNNotificationIconWatchQuickLook430h", objc_opt_class());
  int v9 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"UNNotificationIconWatchQuickLook484h", objc_opt_class());

  [a1 setDefaultIconFile:v20];
  [a1 setSettingsIconFile:v19];
  [a1 setSettingsSheetIconFile:v18];
  [a1 setSubordinateIconFile:v17];
  [a1 setCarPlayIconFile:v21];
  [a1 setWatchQuickLookSmallIconFile:v16];
  [a1 setWatchQuickLookLargeIconFile:v15];
  [a1 setWatchListSmallIconFile:v5];
  [a1 setWatchListLargeIconFile:v6];
  [a1 setWatchQuickLook394hIconFile:v7];
  [a1 setWatchQuickLook448hIconFile:v8];
  [a1 setWatchList394hIconFile:v14];
  [a1 setWatchList448hIconFile:v13];
  [a1 setWatchQuickLook430hIconFile:v12];
  [a1 setWatchQuickLook484hIconFile:v11];
  [a1 setWatchList430hIconFile:v10];
  [a1 setWatchList484hIconFile:v9];
}

- (void)setSystemPropertiesFromDictionary:()Factory bundle:
{
  id v6 = a4;
  id v7 = a3;
  char v47 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"UNUniversalApplicationIdentifier", objc_opt_class());
  BOOL v45 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"UNIntentsBundleIdentifier", objc_opt_class());
  v43 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"UNNotificationIcons", objc_opt_class());
  v46 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"UNDefaultSettings", objc_opt_class());
  uint64_t v8 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"UNDefaultCategories", objc_opt_class());
  int v9 = [MEMORY[0x263F84280] notificationSourceSettingsDescriptionFromDictionary:v46];
  uint64_t v40 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"UNDefaultTopics", objc_opt_class());
  v44 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"UNCustomSettingsBundle", objc_opt_class());
  uint64_t v42 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"UNCustomSettingsDetailControllerClass", objc_opt_class());
  id v10 = [v7 objectForKey:@"UNSuppressUserAuthorizationPrompt"];
  unsigned int v41 = objc_msgSend(v10, "un_safeBoolValue");

  id v11 = [v7 objectForKey:@"UNSuppressDismissalSync"];
  unsigned int v39 = objc_msgSend(v11, "un_safeBoolValue");

  v12 = [v7 objectForKey:@"UNSuppressIconMask"];
  unsigned int v38 = objc_msgSend(v12, "un_safeBoolValue");

  v13 = [v7 objectForKey:@"UNAllowUnlimitedContentBody"];
  unsigned int v37 = objc_msgSend(v13, "un_safeBoolValue");

  id v14 = [v7 objectForKey:@"UNAllowAlternateLaunchBundleIdentifiers"];
  unsigned int v36 = objc_msgSend(v14, "un_safeBoolValue");

  long long v15 = [v7 objectForKey:@"UNAutomaticallyShowSettings"];
  unsigned int v33 = objc_msgSend(v15, "un_safeBoolValue");

  long long v16 = [v7 objectForKey:@"UNHideSettings"];
  uint64_t v17 = objc_msgSend(v16, "un_safeBoolValue");

  long long v18 = [v7 objectForKey:@"UNDaemonShouldReceiveBackgroundResponses"];
  unsigned int v35 = objc_msgSend(v18, "un_safeBoolValue");

  v19 = [v7 objectForKey:@"UNDaemonShouldReceiveNotificationSettingsUpdates"];
  unsigned int v34 = objc_msgSend(v19, "un_safeBoolValue");

  uint64_t v20 = [v7 objectForKey:@"UNDaemonShouldReceiveApplicationEvents"];
  unsigned int v32 = objc_msgSend(v20, "un_safeBoolValue");

  int v21 = [v7 objectForKey:@"UNRequiresTopics"];
  unsigned int v31 = objc_msgSend(v21, "un_safeBoolValue");

  uint64_t v22 = [v7 objectForKey:@"UNAllowCriticalAlerts"];
  unsigned int v30 = objc_msgSend(v22, "un_safeBoolValue");

  uint64_t v23 = [v7 objectForKey:@"UNAllowCalls"];
  unsigned int v29 = objc_msgSend(v23, "un_safeBoolValue");

  uint64_t v24 = [v7 objectForKey:@"UNAllowIntercom"];
  int v28 = objc_msgSend(v24, "un_safeBoolValue");

  v25 = [v7 objectForKey:@"UNAllowMessages"];
  LODWORD(v24) = objc_msgSend(v25, "un_safeBoolValue");

  v26 = [v7 objectForKey:@"UNSupportsProvisionalAlerts"];

  uint64_t v27 = objc_msgSend(v26, "un_safeBoolValue");
  [a1 setDefaultCategoriesFromArray:v8 bundle:v6];
  [a1 setDefaultSettings:v9];
  [a1 setDefaultTopicsFromArray:v40 bundle:v6];

  [a1 setIconFilesFromDictionary:v43];
  [a1 setAutomaticallyShowSettings:v33];
  [a1 setHideSettings:v17];
  [a1 setUniversalApplicationIdentifier:v47];
  [a1 setIntentsBundleIdentifier:v45];
  [a1 setSuppressDismissalSync:v39];
  [a1 setSuppressIconMask:v38];
  [a1 setSuppressUserAuthorizationPrompt:v41];
  [a1 setAllowUnlimitedContentBody:v37];
  [a1 setAllowAlternateLaunchBundleIdentifiers:v36];
  [a1 setDaemonShouldReceiveBackgroundResponses:v35];
  [a1 setDaemonShouldReceiveNotificationSettingsUpdates:v34];
  [a1 setDaemonShouldReceiveApplicationEvents:v32];
  [a1 setRequiresTopics:v31];
  [a1 setCustomSettingsBundle:v44];
  [a1 setCustomSettingsDetailControllerClass:v42];
  [a1 setAllowCriticalAlerts:v30];
  [a1 setAllowCalls:v29];
  objc_msgSend(a1, "setAllowIntercom:", objc_msgSend(a1, "allowIntercom") | v28);
  objc_msgSend(a1, "setAllowMessages:", objc_msgSend(a1, "allowMessages") | v24);
  [a1 setSupportsProvisionalAlerts:v27];
}

- (void)setDefaultTopicsFromArray:()Factory bundle:
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __78__UNCNotificationSourceDescription_Factory__setDefaultTopicsFromArray_bundle___block_invoke;
    v9[3] = &unk_26462FCE8;
    id v10 = v7;
    uint64_t v8 = objc_msgSend(v6, "bs_map:", v9);
    [a1 setDefaultTopics:v8];
  }
  else
  {
    [a1 setDefaultTopics:0];
  }
}

- (void)setDefaultCategoriesFromArray:()Factory bundle:
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __82__UNCNotificationSourceDescription_Factory__setDefaultCategoriesFromArray_bundle___block_invoke;
    v9[3] = &unk_26462FCE8;
    id v10 = v7;
    uint64_t v8 = objc_msgSend(v6, "bs_map:", v9);
    [a1 setDefaultCategories:v8];
  }
  else
  {
    [a1 setDefaultCategories:0];
  }
}

+ (id)_validEnvironmentFromEnvironment:()Factory
{
  id v3 = a3;
  id v4 = v3;
  if (!v3
    || (uint64_t v5 = (void *)*MEMORY[0x263F280D0], [v3 caseInsensitiveCompare:*MEMORY[0x263F280D0]])
    && (uint64_t v5 = (void *)*MEMORY[0x263F280C8], [v4 caseInsensitiveCompare:*MEMORY[0x263F280C8]])
    && (uint64_t v5 = (void *)*MEMORY[0x263F280C0], [v4 caseInsensitiveCompare:*MEMORY[0x263F280C0]])
    && (uint64_t v5 = (void *)*MEMORY[0x263F280D8], [v4 caseInsensitiveCompare:*MEMORY[0x263F280D8]]))
  {
    id v6 = 0;
  }
  else
  {
    id v6 = v5;
  }

  return v6;
}

+ (id)sourceDescriptionWithBundleIdentifier:()Factory
{
  id v4 = a3;
  uint64_t v5 = [a1 systemSourceDescriptionWithBundleIdentifier:v4];
  if (!v5)
  {
    uint64_t v5 = [a1 applicationSourceDescriptionWithBundleIdentifier:v4];
  }

  return v5;
}

+ (id)applicationSourceDescriptionWithBundleIdentifier:()Factory
{
  if (a3)
  {
    id v4 = objc_msgSend(MEMORY[0x263F01868], "applicationProxyForIdentifier:");
    uint64_t v5 = [v4 correspondingApplicationRecord];
    int v6 = objc_msgSend(v5, "unc_isEligibleToDeliverNotifications");

    if (v6)
    {
      id v7 = [a1 applicationSourceDescriptionWithApplication:v4];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

@end
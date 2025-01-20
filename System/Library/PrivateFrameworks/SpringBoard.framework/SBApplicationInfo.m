@interface SBApplicationInfo
+ (uint64_t)_calculateApplicationSupportedTypesFromProxy:(uint64_t)a1;
+ (uint64_t)_visibilityOverrideFromInfo:(void *)a3 entitlements:;
- (BOOL)_supportsApplicationType:(BOOL)result;
- (BOOL)alwaysDeliversOpenURLActionsUsingWorkspace;
- (BOOL)alwaysReceivesOpenURLSource;
- (BOOL)canChangeBackgroundStyle;
- (BOOL)disablesClassicMode;
- (BOOL)disablesSnapshots;
- (BOOL)disallowsControlCenter;
- (BOOL)disallowsNotificationCenter;
- (BOOL)hasHiddenTag;
- (BOOL)isAppClip;
- (BOOL)isAppleApplication;
- (BOOL)isArcadeApplication;
- (BOOL)isAzulBLinked;
- (BOOL)isAzulHWLinked;
- (BOOL)isAzulLinked;
- (BOOL)isCloudDemoted;
- (BOOL)isCrystalLinked;
- (BOOL)isGameCenterEnabled;
- (BOOL)isIdentifiedGame;
- (BOOL)isInternalApplication;
- (BOOL)isLaunchableDuringSetup;
- (BOOL)isLicensedToDevice;
- (BOOL)isMonarchLinked;
- (BOOL)isNewsstand;
- (BOOL)isPeaceBLinked;
- (BOOL)isPeaceLinked;
- (BOOL)isRegionallyRestricted;
- (BOOL)isSkyLinked;
- (BOOL)isStatusBarLegacy;
- (BOOL)isSydneyLinked;
- (BOOL)isSystemApplication;
- (BOOL)isTigrisLinked;
- (BOOL)isYukonELinked;
- (BOOL)isYukonLinked;
- (BOOL)prefersSavedSnapshots;
- (BOOL)preventsLaunchInterfaceSplitting;
- (BOOL)representsWebApplication;
- (BOOL)requiresAuthorizationForAutoUpdates;
- (BOOL)requiresHiDPI;
- (BOOL)shouldLaunchSuspendedAlways;
- (BOOL)shouldLaunchWithLiveContentASAP;
- (BOOL)shouldSkipCrossfadeToLive;
- (BOOL)statusBarHiddenWhenVerticallyCompact;
- (BOOL)supports64Bit;
- (BOOL)supportsAudioBackgroundMode;
- (BOOL)supportsFetchBackgroundMode;
- (BOOL)supportsInactiveMicModeSelection;
- (BOOL)supportsLegacyVOIPBackgroundMode;
- (BOOL)supportsMultiwindow;
- (BOOL)supportsNewsstandContentBackgroundMode;
- (BOOL)supportsRemoteNotificationBackgroundMode;
- (BOOL)supportsYttrium;
- (BOOL)suppressUserNotificationPermissionAlert;
- (BOOL)systemAppSupportsLocalNotifications;
- (BOOL)triggersStoreKitMessaging;
- (BOOL)usesRLNDataProvider;
- (BOOL)usesSplashBoard;
- (BOOL)wantsExclusiveForeground;
- (BOOL)wantsFullScreen;
- (BOOL)wantsLaunchWithoutPNG;
- (BOOL)wasGameCenterEverEnabled;
- (CRCarPlayAppDeclaration)carPlayDeclaration;
- (NSArray)domainsToPreheat;
- (NSArray)iTunesCategoriesOrderedByRelevancy;
- (NSArray)launchImageInfo;
- (NSArray)staticApplicationShortcutItems;
- (NSSet)ignoredBackgroundActivityIdentifiers;
- (NSSet)urlSchemes;
- (NSString)applicationShortcutWidgetBundleIdentifier;
- (NSString)displayName;
- (NSString)installInstanceID;
- (NSString)launchInterfaceFileName;
- (NSString)vendorName;
- (NSURL)documentInboxURL;
- (NSURL)restorationArchiveContainerURL;
- (NSUserDefaults)userDefaults;
- (XBSnapshotContainerIdentity)manifestContainerIdentity;
- (id)_configureTags:(char)a3 hasVisibilityOverride:;
- (id)dataContainerURL;
- (int)networkUsageTypes;
- (int64_t)backgroundStyle;
- (int64_t)backgroundStyleForRequestedBackgroundStyle:(int64_t)a3;
- (int64_t)defaultStatusBarStyle;
- (int64_t)whitePointAdaptivityStyle;
- (uint64_t)_calculateVoipClassWithEntitlements:(uint64_t)a1;
- (unint64_t)allowedNKNotificationsPerDay;
- (unint64_t)applicationSizeInBytes;
- (unint64_t)dynamicApplicationShortcutItemsVersion;
- (unint64_t)supportedTypes;
- (unint64_t)uninstallCapability;
- (unint64_t)visibilityOverride;
- (unint64_t)voipClass;
- (void)_loadFromProxy:(id)a3;
@end

@implementation SBApplicationInfo

- (BOOL)shouldLaunchSuspendedAlways
{
  return self->_alwaysLaunchesSuspended;
}

- (BOOL)wantsLaunchWithoutPNG
{
  return self->_wantsLaunchWithoutPNG;
}

- (BOOL)shouldLaunchWithLiveContentASAP
{
  return self->_shouldLaunchWithLiveContentASAP;
}

- (BOOL)disablesSnapshots
{
  return self->_disablesSnapshots;
}

- (BOOL)statusBarHiddenWhenVerticallyCompact
{
  if (!self->_isOkemoLinked) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)SBApplicationInfo;
  return [(SBApplicationInfo *)&v3 statusBarHiddenWhenVerticallyCompact];
}

- (BOOL)wantsFullScreen
{
  return self->_wantsFullScreen;
}

- (BOOL)isSystemApplication
{
  return (unint64_t)[(SBApplicationInfo *)self type] < 2;
}

- (BOOL)isCloudDemoted
{
  return self->_cloudDemoted;
}

- (BOOL)usesSplashBoard
{
  return self->_usesSplashBoard;
}

- (BOOL)disablesClassicMode
{
  return self->_disablesClassicMode;
}

- (int64_t)defaultStatusBarStyle
{
  return self->_defaultStatusBarStyle;
}

- (int64_t)backgroundStyle
{
  if (!self->_allowNonDefaultBackgroundStyle) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)SBApplicationInfo;
  return [(SBApplicationInfo *)&v3 backgroundStyle];
}

- (int64_t)backgroundStyleForRequestedBackgroundStyle:(int64_t)a3
{
  if ([(SBApplicationInfo *)self canChangeBackgroundStyle]) {
    return a3;
  }
  return [(SBApplicationInfo *)self backgroundStyle];
}

- (BOOL)canChangeBackgroundStyle
{
  return self->_canChangeBackgroundStyle;
}

- (BOOL)isIdentifiedGame
{
  return self->_identifiedGame;
}

- (BOOL)isArcadeApplication
{
  return self->_arcadeApplication;
}

- (NSArray)domainsToPreheat
{
  return self->_domainsToPreheat;
}

- (BOOL)isSydneyLinked
{
  return self->_isSydneyLinked;
}

- (int)networkUsageTypes
{
  return self->_networkUsageTypes;
}

- (BOOL)supportsMultiwindow
{
  return self->_supportsMultiwindow;
}

- (BOOL)hasHiddenTag
{
  return self->_hasHiddenTag;
}

- (BOOL)supportsLegacyVOIPBackgroundMode
{
  return [(SBApplicationInfo *)self voipClass] == 1;
}

- (unint64_t)voipClass
{
  return self->_voipClass;
}

- (BOOL)wantsExclusiveForeground
{
  return self->_wantsExclusiveForeground;
}

- (BOOL)supports64Bit
{
  return self->_supports64Bit;
}

- (BOOL)isAzulBLinked
{
  return self->_isAzulBLinked;
}

- (int64_t)whitePointAdaptivityStyle
{
  return self->_whitePointAdaptivityStyle;
}

- (BOOL)isAppleApplication
{
  if ([(SBApplicationInfo *)self isSystemApplication])
  {
    LOBYTE(v3) = 1;
  }
  else if (![(SBApplicationInfo *)self isProvisioningProfileValidated] {
         || (int v3 = [(SBApplicationInfo *)self isBeta]) != 0)
  }
  {
    v4 = [(SBApplicationInfo *)self bundleIdentifier];
    char v5 = [v4 hasPrefix:@"com.apple."];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isRegionallyRestricted
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = self->_eligibilityDomains;
  uint64_t v3 = [(NSSet *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v8 = [(SBApplicationInfo *)self bundleIdentifier];
        v9 = [(SBApplicationInfo *)self processIdentity];
        v10 = [v9 personaString];
        id v11 = v8;
        id v12 = v10;
        uint64_t v13 = [v7 unsignedLongLongValue];
        id v14 = objc_alloc(MEMORY[0x1E4F83A28]);
        id v26 = 0;
        v15 = (void *)[v14 initWithDomain:v13 bundleID:v11 persona:v12 error:&v26];

        id v16 = v26;
        if (!v15)
        {
          v19 = SBLogCommon();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218498;
            uint64_t v29 = v13;
            __int16 v30 = 2112;
            id v31 = v11;
            __int16 v32 = 2112;
            id v33 = v16;
            _os_log_error_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_ERROR, "failure getting eligibility info for domain %qu, bundleID %@ with error: %@", buf, 0x20u);
          }

LABEL_15:
          BOOL v18 = 1;
          goto LABEL_16;
        }
        uint64_t v17 = [v15 answer];

        if (v17 != 4) {
          goto LABEL_15;
        }
      }
      uint64_t v4 = [(NSSet *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      BOOL v18 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_16:

  return v18;
}

- (BOOL)isAppClip
{
  return self->_appClip;
}

- (BOOL)alwaysDeliversOpenURLActionsUsingWorkspace
{
  return self->_alwaysDeliversOpenURLActionsUsingWorkspace;
}

- (NSURL)restorationArchiveContainerURL
{
  return self->_restorationArchiveContainerURL;
}

- (BOOL)preventsLaunchInterfaceSplitting
{
  return self->_preventsLaunchInterfaceSplitting;
}

- (BOOL)triggersStoreKitMessaging
{
  return self->_triggersStoreKitMessaging;
}

- (BOOL)requiresAuthorizationForAutoUpdates
{
  return self->_requiresAuthorizationForAutoUpdates;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)supportsInactiveMicModeSelection
{
  return self->_supportsInactiveMicModeSelection;
}

- (BOOL)shouldSkipCrossfadeToLive
{
  return self->_shouldSkipCrossfadeToLive;
}

- (id)dataContainerURL
{
  dataContainerURLOverride = self->_dataContainerURLOverride;
  if (dataContainerURLOverride)
  {
    uint64_t v3 = dataContainerURLOverride;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBApplicationInfo;
    uint64_t v3 = [(SBApplicationInfo *)&v5 dataContainerURL];
  }
  return v3;
}

- (unint64_t)dynamicApplicationShortcutItemsVersion
{
  return self->_dynamicApplicationShortcutItemsVersion;
}

- (BOOL)isInternalApplication
{
  return [(SBApplicationInfo *)self type] == 0;
}

- (NSUserDefaults)userDefaults
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__SBApplicationInfo_userDefaults__block_invoke;
  v4[3] = &unk_1E6AF4AC0;
  v4[4] = self;
  [(SBApplicationInfo *)self _synchronize:v4];
  return self->_lazy_userDefaults;
}

void __33__SBApplicationInfo_userDefaults__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 528))
  {
    id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
    id v6 = [*(id *)(a1 + 32) preferenceDomain];
    uint64_t v3 = [v2 initWithSuiteName:v6];
    uint64_t v4 = *(void *)(a1 + 32);
    objc_super v5 = *(void **)(v4 + 528);
    *(void *)(v4 + 528) = v3;
  }
}

- (NSArray)staticApplicationShortcutItems
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__SBApplicationInfo_staticApplicationShortcutItems__block_invoke;
  v4[3] = &unk_1E6AF4AC0;
  v4[4] = self;
  [(SBApplicationInfo *)self _synchronize:v4];
  return self->_staticApplicationShortcutItems;
}

void __51__SBApplicationInfo_staticApplicationShortcutItems__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 679))
  {
    if ([*(id *)(v1 + 448) count])
    {
      id v3 = objc_alloc(MEMORY[0x1E4F4F6D0]);
      uint64_t v4 = [*v2 bundleURL];
      objc_super v5 = (void *)[v3 initWithURL:v4];

      if (v5)
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v6 = *((id *)*v2 + 56);
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
              id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
              v13[0] = MEMORY[0x1E4F143A8];
              v13[1] = 3221225472;
              v13[2] = __51__SBApplicationInfo_staticApplicationShortcutItems__block_invoke_2;
              v13[3] = &unk_1E6AF9D28;
              id v14 = v5;
              [v11 _localizeWithHandler:v13];
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v8);
        }

        *((unsigned char *)*v2 + 679) = 1;
      }
      else
      {
        id v12 = SBLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          __51__SBApplicationInfo_staticApplicationShortcutItems__block_invoke_cold_1(v2, v12);
        }
      }
    }
    else
    {
      *((unsigned char *)*v2 + 679) = 1;
    }
  }
}

id __51__SBApplicationInfo_staticApplicationShortcutItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) localizedStringForKey:v3 value:0 table:@"InfoPlist"];
  if ([v4 isEqualToString:v3])
  {
    uint64_t v5 = [*(id *)(a1 + 32) localizedStringForKey:v3 value:0 table:@"InfoPlist-OrbHW"];

    uint64_t v4 = (void *)v5;
  }

  return v4;
}

- (BOOL)supportsAudioBackgroundMode
{
  return [(SBApplicationInfo *)self supportsBackgroundMode:*MEMORY[0x1E4F43720]];
}

- (BOOL)supportsRemoteNotificationBackgroundMode
{
  return [(SBApplicationInfo *)self supportsBackgroundMode:*MEMORY[0x1E4F43730]];
}

- (BOOL)supportsFetchBackgroundMode
{
  return [(SBApplicationInfo *)self supportsBackgroundMode:*MEMORY[0x1E4F43728]];
}

- (BOOL)supportsNewsstandContentBackgroundMode
{
  return [(SBApplicationInfo *)self supportsBackgroundMode:@"newsstand-content"];
}

- (BOOL)suppressUserNotificationPermissionAlert
{
  return [(SBApplicationInfo *)self type] == 1;
}

- (unint64_t)uninstallCapability
{
  uint64_t uninstallCapability = self->_uninstallCapability;
  if (uninstallCapability == 2)
  {
    id v3 = [(SBApplicationInfo *)self bundleIdentifier];
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F6F530]) initWithBundleIdentifier:v3];
    uint64_t uninstallCapability = 2
                        * ([MEMORY[0x1E4F6F528] removabilityForAppWithIdentity:v4 error:0] != 3);
  }
  return uninstallCapability;
}

- (void)_loadFromProxy:(id)a3
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_loadFromProxy__onceToken != -1) {
    dispatch_once(&_loadFromProxy__onceToken, &__block_literal_global_47);
  }
  v151.receiver = self;
  v151.super_class = (Class)SBApplicationInfo;
  [(SBApplicationInfo *)&v151 _loadFromProxy:v4];
  uint64_t v5 = [(SBApplicationInfo *)self bundleIdentifier];
  id v6 = [v4 objectsForInfoDictionaryKeys:_loadFromProxy____infoKeys];
  uint64_t v7 = [v4 entitlementValuesForKeys:_loadFromProxy____entitlementKeys];
  uint64_t v8 = [(SBApplicationInfo *)self bundleURL];
  uint64_t v9 = [v8 absoluteString];
  installInstanceID = self->_installInstanceID;
  self->_installInstanceID = v9;

  self->_isNewsstand = [v6 BOOLForKey:@"UINewsstandApp"];
  v141 = v5;
  if ([v5 isEqualToString:@"com.apple.webapp"]) {
    self->_representsWebApplication = 1;
  }
  id v11 = [(SBApplicationInfo *)self dataContainerURL];
  v144 = v7;
  if (!v11)
  {
    if ([(SBApplicationInfo *)self isSystemApplication])
    {
      id v12 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v13 = BSCurrentUserDirectory();
      id v11 = [v12 fileURLWithPath:v13];
    }
    else
    {
      id v11 = 0;
    }
  }
  objc_storeStrong((id *)&self->_restorationArchiveContainerURL, v11);
  self->_isOkemoLinked = [(SBApplicationInfo *)self builtOnOrAfterSDKVersion:@"8.0"];
  self->_isMonarchLinked = [(SBApplicationInfo *)self builtOnOrAfterSDKVersion:@"9.0"];
  self->_isTigrisLinked = [(SBApplicationInfo *)self builtOnOrAfterSDKVersion:@"11.0"];
  self->_isPeaceLinked = [(SBApplicationInfo *)self builtOnOrAfterSDKVersion:@"12.0"];
  self->_isPeaceBLinked = [(SBApplicationInfo *)self builtOnOrAfterSDKVersion:@"12.1"];
  self->_isYukonLinked = [(SBApplicationInfo *)self builtOnOrAfterSDKVersion:@"13.0"];
  self->_isYukonELinked = [(SBApplicationInfo *)self builtOnOrAfterSDKVersion:@"13.2"];
  self->_isAzulLinked = [(SBApplicationInfo *)self builtOnOrAfterSDKVersion:@"14.0"];
  self->_isAzulHWLinked = [(SBApplicationInfo *)self builtOnOrAfterSDKVersion:@"14.1"];
  self->_isAzulBLinked = [(SBApplicationInfo *)self builtOnOrAfterSDKVersion:@"14.2"];
  self->_isSkyLinked = [(SBApplicationInfo *)self builtOnOrAfterSDKVersion:@"15.0"];
  self->_isSydneyLinked = [(SBApplicationInfo *)self builtOnOrAfterSDKVersion:@"16.0"];
  self->_isCrystalLinked = [(SBApplicationInfo *)self builtOnOrAfterSDKVersion:@"18.0"];
  if ([v6 BOOLForKey:@"SBIsLaunchableDuringSetup"]) {
    char v14 = 1;
  }
  else {
    char v14 = [v7 BOOLForKey:@"com.apple.private.shortcuts.IntentsAvailableDuringBuddy"];
  }
  v140 = v11;
  self->_isLaunchableDuringSetup = v14;
  self->_isLicensedToDevice = [v4 hasMIDBasedSINF];
  v150.receiver = self;
  v150.super_class = (Class)SBApplicationInfo;
  long long v15 = [(SBApplicationInfo *)&v150 displayName];
  v143 = v6;
  if (![v15 length])
  {
    long long v16 = [(SBApplicationInfo *)self bundleURL];
    long long v17 = [v16 path];
    long long v18 = [v17 lastPathComponent];
    uint64_t v19 = [v18 stringByDeletingPathExtension];

    id v6 = v143;
    long long v15 = (void *)v19;
  }
  v139 = v15;
  uint64_t v20 = (NSString *)[v15 copy];
  displayName = self->_displayName;
  self->_displayName = v20;

  self->_preventsLaunchInterfaceSplitting = [v6 BOOLForKey:@"SBPreventsDefaultLaunchImageSplitting"];
  uint64_t v22 = *MEMORY[0x1E4FA5940];
  long long v23 = [v6 stringForKey:*MEMORY[0x1E4FA5940]];
  launchInterfaceFileName = self->_launchInterfaceFileName;
  self->_launchInterfaceFileName = v23;

  long long v25 = [v6 objectForKey:v22];
  if (v25)
  {
    p_usesSplashBoard = &self->_usesSplashBoard;
    self->_usesSplashBoard = 1;
  }
  else
  {
    [v6 objectForKey:*MEMORY[0x1E4FA5948]];
    v28 = v27 = v6;
    if (v28)
    {
      p_usesSplashBoard = &self->_usesSplashBoard;
      self->_usesSplashBoard = 1;
    }
    else
    {
      uint64_t v29 = [v27 objectForKey:*MEMORY[0x1E4FA5930]];
      if (v29)
      {
        p_usesSplashBoard = &self->_usesSplashBoard;
        self->_usesSplashBoard = 1;
      }
      else
      {
        __int16 v30 = [v27 objectForKey:*MEMORY[0x1E4FA5938]];
        p_usesSplashBoard = &self->_usesSplashBoard;
        self->_usesSplashBoard = v30 != 0;
      }
    }

    id v6 = v143;
  }

  if (!*p_usesSplashBoard)
  {
    id v31 = [v6 objectForKey:@"UILaunchImages"];
    __int16 v32 = +[SBApplicationLaunchImageParameters launchImageParametersFromLaunchImagesInfo:v31 withBundleIdentifier:v141 isMonarchLinked:self->_isMonarchLinked];
    launchImageInfo = self->_launchImageInfo;
    self->_launchImageInfo = v32;
  }
  uint64_t v34 = objc_msgSend(v7, "numberForKey:", @"com.apple.springboard.disablecompatibilitymode.late2022", p_usesSplashBoard);
  if ([v34 BOOLValue])
  {
    self->_disablesClassicMode = 1;
  }
  else
  {
    v35 = [v7 numberForKey:@"com.apple.springboard.disablecompatibilitymode.forever"];
    self->_disablesClassicMode = [v35 BOOLValue];
  }
  self->_statusBarIsLegacy = [(SBApplicationInfo *)self builtOnOrAfterSDKVersion:@"7.0"] ^ 1;
  v36 = [v6 arrayForKey:*MEMORY[0x1E4F1CCB8]];
  v37 = objc_msgSend(v36, "bs_objectsOfClass:", objc_opt_class());

  v142 = v37;
  if ([v37 count])
  {
    id v138 = v4;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    id v38 = v37;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v146 objects:v156 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      v41 = 0;
      uint64_t v42 = *(void *)v147;
      uint64_t v43 = *MEMORY[0x1E4F1CCB0];
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v147 != v42) {
            objc_enumerationMutation(v38);
          }
          v45 = objc_msgSend(*(id *)(*((void *)&v146 + 1) + 8 * i), "bs_safeArrayForKey:", v43);
          v46 = objc_msgSend(v45, "bs_objectsOfClass:", objc_opt_class());

          if ([v46 count])
          {
            if (v41)
            {
              [v41 addObjectsFromArray:v46];
            }
            else
            {
              v41 = [MEMORY[0x1E4F1CA80] setWithArray:v46];
            }
          }
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v146 objects:v156 count:16];
      }
      while (v40);
    }
    else
    {
      v41 = 0;
    }

    v47 = (NSSet *)[v41 copy];
    urlSchemes = self->_urlSchemes;
    self->_urlSchemes = v47;

    id v4 = v138;
    id v6 = v143;
  }
  v49 = [v6 stringForKey:@"UIApplicationShortcutWidget"];
  v50 = (NSString *)[v49 copy];
  applicationShortcutWidgetBundleIdentifier = self->_applicationShortcutWidgetBundleIdentifier;
  self->_applicationShortcutWidgetBundleIdentifier = v50;

  v52 = (void *)MEMORY[0x1E4FA69D0];
  v53 = [v6 objectForKey:@"UIApplicationShortcutItems"];
  v54 = [v52 _staticApplicationShortcutItemsFromInfoPlistEntry:v53];
  staticApplicationShortcutItems = self->_staticApplicationShortcutItems;
  self->_staticApplicationShortcutItems = v54;

  v56 = [v6 numberForKey:@"UIApplicationShortcutItemsVersion"];
  self->_dynamicApplicationShortcutItemsVersion = [v56 unsignedIntegerValue];

  if ([(SBApplicationInfo *)self isSystemApplication])
  {
    int v57 = [v4 isDeletable];
    unint64_t v58 = 2;
    if (!v57) {
      unint64_t v58 = 0;
    }
  }
  else
  {
    unint64_t v58 = 1;
  }
  self->_uint64_t uninstallCapability = v58;
  self->_visibilityOverride = +[SBApplicationInfo _visibilityOverrideFromInfo:entitlements:]((uint64_t)SBApplicationInfo, v6, v144);
  v59 = [(SBApplicationInfo *)self tags];
  char v60 = self->_uninstallCapability == 2 || self->_visibilityOverride != 0;
  v61 = -[SBApplicationInfo _configureTags:hasVisibilityOverride:](self, v59, v60);
  [(SBApplicationInfo *)self _overrideTags:v61];

  v62 = [(SBApplicationInfo *)self tags];
  self->_hasHiddenTag = [v62 containsObject:@"hidden"];

  int v63 = [(SBApplicationInfo *)self isSystemApplication];
  if (v63) {
    LOBYTE(v63) = [v6 BOOLForKey:@"SBDisableSnapshots"];
  }
  self->_disablesSnapshots = v63;
  int v64 = [(SBApplicationInfo *)self isSystemApplication];
  if (v64) {
    LOBYTE(v64) = [v6 BOOLForKey:@"SBPrefersSavedSnapshots"];
  }
  self->_prefersSavedSnapshots = v64;
  self->_wantsLaunchWithoutPNG = [v6 BOOLForKey:@"SBWantsLiveResume"];
  self->_supportedTypes |= +[SBApplicationInfo _calculateApplicationSupportedTypesFromProxy:]((uint64_t)SBApplicationInfo, v4);
  self->_defaultStatusBarStyle = [(SBApplicationInfo *)self requestedStatusBarStyle];
  if ((unint64_t)[MEMORY[0x1E4F628E0] _applicationTypeForProxy:v4] > 1)
  {
    v66 = [v144 numberForKey:@"com.apple.springboard.appbackgroundstyle"];
    char v67 = [v66 BOOLValue];

    self->_canChangeBackgroundStyle = v67;
    self->_allowNonDefaultBackgroundStyle = v67;
    v68 = [v144 numberForKey:@"com.apple.developer.openURL-source"];
    char v65 = [v68 BOOLValue];
  }
  else
  {
    char v65 = 1;
    self->_canChangeBackgroundStyle = 1;
    self->_allowNonDefaultBackgroundStyle = 1;
  }
  self->_alwaysReceivesOpenURLSource = v65;
  unint64_t supportedTypes = self->_supportedTypes;
  v70 = +[SBPlatformController sharedInstance];
  int v71 = [v70 isMedusaCapable];

  LOBYTE(v72) = 1;
  if (v71 && (supportedTypes & 2) != 0)
  {
    v73 = +[SBDefaults localDefaults];
    v74 = [v73 applicationDefaults];
    int v75 = [v74 forcesMedusaAdoption];

    if (v75)
    {
      self->_wantsFullScreen = 0;
      goto LABEL_67;
    }
    if (self->_isMonarchLinked && *v137 && ([v143 BOOLForKey:@"UIRequiresFullScreen"] & 1) == 0) {
      int v72 = [(SBApplicationInfo *)self supportsAllInterfaceOrientations] ^ 1;
    }
    else {
      LOBYTE(v72) = 1;
    }
  }
  self->_wantsFullScreen = v72;
LABEL_67:
  if ([(SBApplicationInfo *)self isSystemApplication])
  {
    v76 = (void *)MEMORY[0x1E4F42738];
    v77 = [v143 objectForKey:*MEMORY[0x1E4F43D10]];
    [v76 _statusBarStyleOverridesForArray:v77];

    STUIBackgroundActivityIdentifiersForStyleOverrides();
    v78 = (NSSet *)objc_claimAutoreleasedReturnValue();
    ignoredBackgroundActivityIdentifiers = self->_ignoredBackgroundActivityIdentifiers;
    self->_ignoredBackgroundActivityIdentifiers = v78;
  }
  v80 = +[SBDefaults localDefaults];
  v81 = [v80 applicationDefaults];
  char v82 = [v81 ignoresDeclaredNetworkUsage];

  v83 = v143;
  if ((v82 & 1) == 0)
  {
    v84 = [v143 numberForKey:@"SBUsesNetwork"];
    self->_networkUsageTypes = [v84 unsignedIntValue];
  }
  if ([v143 BOOLForKey:@"UIRequiresPersistentWiFi"]) {
    self->_networkUsageTypes |= 2u;
  }
  if (![(SBApplicationInfo *)self isSystemApplication])
  {
    self->_isGameCenterEnabled = [v4 isGameCenterEnabled];
    self->_wasGameCenterEverEnabled = [v4 gameCenterEverEnabled];
  }
  v85 = [v143 objectForKey:*MEMORY[0x1E4F43640]];
  if (v85)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v86 = [v85 containsObject:@"hidpi"];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_81;
      }
      char v86 = objc_msgSend(v85, "bs_BOOLForKey:", @"hidpi");
    }
    self->_requiresHiDPI = v86;
  }
LABEL_81:
  self->_voipClass = -[SBApplicationInfo _calculateVoipClassWithEntitlements:]((uint64_t)self, v144);
  v87 = [MEMORY[0x1E4F57EE8] declarationForBundleIdentifier:v141 info:v143 entitlements:v144];
  carPlayDeclaration = self->_carPlayDeclaration;
  self->_carPlayDeclaration = v87;

  if ([(SBApplicationInfo *)self isSystemApplication]) {
    self->_alwaysLaunchesSuspended = [v143 BOOLForKey:@"SBLaunchSuspendedAlways"];
  }
  self->_systemAppSupportsLocalNotifications = [v143 BOOLForKey:@"SBAppUsesLocalNotifications"];
  if ([(SBApplicationInfo *)self isSystemApplication])
  {
    v89 = [v143 arrayForKey:@"SBDomainsToPreheat"];
    objc_msgSend(v89, "bs_objectsOfClass:", objc_opt_class());
    v90 = (NSArray *)objc_claimAutoreleasedReturnValue();
    domainsToPreheat = self->_domainsToPreheat;
    self->_domainsToPreheat = v90;
  }
  v92 = [v143 stringForKey:*MEMORY[0x1E4F43EE0]];
  if (v92)
  {
    id v93 = v92;

LABEL_88:
    self->_whitePointAdaptivityStyle = _UIWhitePointAdaptivityStyleFromString();

    goto LABEL_89;
  }
  id v93 = [v143 stringForKey:*MEMORY[0x1E4F44240]];

  if (v93) {
    goto LABEL_88;
  }
  self->_whitePointAdaptivityStyle = 0;
LABEL_89:
  v94 = [(SBApplicationInfo *)self dataContainerURL];
  v95 = [v94 URLByAppendingPathComponent:@"Documents/Inbox/"];
  documentInboxURL = self->_documentInboxURL;
  self->_documentInboxURL = v95;

  v97 = [v144 numberForKey:@"com.apple.springboard.disallowNotificationCenter"];
  self->_disallowsNotificationCenter = [v97 BOOLValue];

  v98 = [v144 numberForKey:@"com.apple.springboard.disallowControlCenter"];
  self->_disallowsControlCenter = [v98 BOOLValue];

  v99 = [v144 numberForKey:@"com.apple.springboard.deliveropenurlusingworkspace"];
  self->_alwaysDeliversOpenURLActionsUsingWorkspace = [v99 BOOLValue];

  if ([(SBApplicationInfo *)self isNewsstand])
  {
    v100 = [v144 stringForKey:@"com.apple.newsstand.content-notification-daily-limit"];
    v101 = v100;
    if (v100)
    {
      uint64_t v102 = [v100 integerValue];
      self->_unint64_t allowedNKNotificationsPerDay = v102 & ~(v102 >> 63);
      v103 = SBLogCommon();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
      {
        unint64_t allowedNKNotificationsPerDay = self->_allowedNKNotificationsPerDay;
        id v105 = [(SBApplicationInfo *)self bundleIdentifier];
        *(_DWORD *)buf = 134218242;
        unint64_t v153 = allowedNKNotificationsPerDay;
        __int16 v154 = 2114;
        id v155 = v105;
        _os_log_impl(&dword_1D85BA000, v103, OS_LOG_TYPE_INFO, "NKThrottle: setting _allowedContentNotificationsPerDay=%lu for app=%{public}@", buf, 0x16u);
      }
      v83 = v143;
    }
    else
    {
      self->_unint64_t allowedNKNotificationsPerDay = 1;
    }
  }
  else
  {
    self->_unint64_t allowedNKNotificationsPerDay = 0;
  }
  BOOL v106 = [(SBApplicationInfo *)self type] != 1
      || [(SBApplicationInfo *)self systemAppSupportsLocalNotifications];
  self->_usesRLNDataProvider = v106;
  if ([v83 BOOLForKey:@"SBShouldLaunchLiveImmediately"])
  {
    self->_shouldSkipCrossfadeToLive = 1;
  }
  else
  {
    v107 = [(SBApplicationInfo *)self bundleIdentifier];
    self->_shouldSkipCrossfadeToLive = [v107 isEqualToString:@"com.apple.camera"];
  }
  [v4 installType];
  self->_cloudDemoted = FBSInstallTypeIsCloudDemoted();
  self->_supports64Bit = [v4 compatibilityState] != 2;
  v145.receiver = self;
  v145.super_class = (Class)SBApplicationInfo;
  self->_supportsMultiwindow = [(SBApplicationInfo *)&v145 supportsMultiwindow];
  v108 = [v144 numberForKey:@"com.apple.developer.on-demand-install-capable"];
  int v109 = [v108 BOOLValue];

  if (v109)
  {
    self->_supportsMultiwindow = 0;
    self->_appClip = 1;
  }
  self->_supportsYttrium = [v83 BOOLForKey:@"UISupportsYttrium"];
  self->_wantsExclusiveForeground = [v83 BOOLForKey:@"SBWantsExclusiveForeground"];
  v110 = [v4 diskUsage];
  v111 = [v110 staticUsage];
  self->_applicationSizeInBytes = [v111 unsignedLongLongValue];

  self->_arcadeApplication = [v4 isArcadeApp];
  v112 = objc_opt_new();
  v113 = v112;
  if (self->_arcadeApplication)
  {
    [v112 addObject:@" Arcade"];
  }
  else
  {
    v114 = [v4 genre];

    if (v114)
    {
      v115 = [v4 genre];
      [v113 addObject:v115];
    }
    v116 = [v4 subgenres];

    if (v116)
    {
      v117 = [v4 subgenres];
      [v113 addObjectsFromArray:v117];
    }
  }
  if (![v113 count])
  {
    [v113 removeAllObjects];
    if ([(SBApplicationInfo *)self isSystemApplication])
    {
      v118 = @" System";
    }
    else if ([(SBApplicationInfo *)self isInternalApplication])
    {
      v118 = @" Internal";
    }
    else
    {
      v118 = @"Other";
    }
    [v113 addObject:v118];
  }
  v119 = (NSArray *)[v113 copy];
  iTunesCategoriesOrderedByRelevancy = self->_iTunesCategoriesOrderedByRelevancy;
  self->_iTunesCategoriesOrderedByRelevancy = v119;

  self->_identifiedGame = [MEMORY[0x1E4F63B70] applicationIsIdentifiedGame:v4 info:v83 entitlements:v144];
  v121 = [v4 vendorName];
  v122 = (NSString *)[v121 copy];
  vendorName = self->_vendorName;
  self->_vendorName = v122;

  v124 = [v144 numberForKey:@"com.apple.developer.storekit.external-purchase-link"];
  if ([v124 BOOLValue])
  {
    self->_triggersStoreKitMessaging = 1;
  }
  else
  {
    v125 = [v144 numberForKey:@"com.apple.developer.storekit.external-purchase"];
    self->_triggersStoreKitMessaging = [v125 BOOLValue];
  }
  self->_requiresAuthorizationForAutoUpdates = [v83 BOOLForKey:@"NSAppNeedsAutoUpdateConsent"];
  v126 = [v83 objectForKey:@"NSAllowMicModeControlWithoutSensorsActive"];

  if (v126) {
    v127 = @"NSAllowMicModeControlWithoutSensorsActive";
  }
  else {
    v127 = @"NSAlwaysAllowMicrophoneModeControl";
  }
  self->_supportsInactiveMicModeSelection = [v83 BOOLForKey:v127];
  if (([v141 isEqualToString:@"com.apple.mobilesafari"] & 1) == 0
    && ([v141 isEqualToString:@"com.apple.SafariViewService"] & 1) == 0)
  {
    v128 = [v144 numberForKey:@"com.apple.developer.web-browser-engine.host"];
    int v129 = [v128 BOOLValue];

    if (v129)
    {
      v130 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F33497A0];
      eligibilityDomains = self->_eligibilityDomains;
      self->_eligibilityDomains = v130;
    }
    v132 = [v144 numberForKey:@"com.apple.developer.embedded-web-browser-engine"];
    int v133 = [v132 BOOLValue];

    if (v133)
    {
      v134 = self->_eligibilityDomains;
      if (v134) {
        [(NSSet *)v134 setByAddingObject:&unk_1F33497B8];
      }
      else {
      v135 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F33497B8];
      }
      v136 = self->_eligibilityDomains;
      self->_eligibilityDomains = v135;
    }
  }
}

void __36__SBApplicationInfo__loadFromProxy___block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"SBIsLaunchableDuringSetup", *MEMORY[0x1E4FA5940], *MEMORY[0x1E4FA5948], *MEMORY[0x1E4FA5930], *MEMORY[0x1E4FA5938], @"UILaunchImages", *MEMORY[0x1E4F1CCB8], @"UIApplicationShortcutWidget", @"UIApplicationShortcutItems", @"UIApplicationShortcutItemsVersion", @"SBIconVisibilitySetByAppPreference", @"SBIconVisibilityDefaultVisible", @"SBIconVisibilityDefaultVisibleInstallTypes", @"SBIconVisibilityDefaultVisiblePlatforms", @"SBIconVisibilityDefaultVisibleFeatureFlag", @"SBDisableSnapshots", @"SBPrefersSavedSnapshots",
    @"SBWantsLiveResume",
    @"UIRequiresFullScreen",
    *MEMORY[0x1E4F43D10],
    @"SBUsesNetwork",
    @"UIRequiresPersistentWiFi",
    @"SBPreventsDefaultLaunchImageSplitting",
    *MEMORY[0x1E4F43640],
    @"UIApplicationShouldDisableScreenJail",
    @"SBLaunchSuspendedAlways",
    @"SBRequiresPasscodeBeforeFirstUnlock",
    @"SBAppUsesLocalNotifications",
    @"SBDomainsToPreheat",
    @"SBShouldLaunchLiveImmediately",
    *MEMORY[0x1E4F43EE0],
    *MEMORY[0x1E4F44240],
    @"UISupportsYttrium",
    @"UINewsstandApp",
    @"SBWantsExclusiveForeground",
    @"UIApplicationInterfaceManifest",
    *MEMORY[0x1E4F436A0],
    @"AVInitialRouteSharingPolicy",
    @"CFBundleAlternateNames",
    @"NSAppNeedsAutoUpdateConsent",
    @"LSApplicationCategoryType",
    @"NSAllowMicModeControlWithoutSensorsActive",
    @"NSAlwaysAllowMicrophoneModeControl",
  v0 = 0);
  uint64_t v1 = [MEMORY[0x1E4F57EE8] requiredInfoKeys];
  [v0 unionSet:v1];

  uint64_t v2 = [v0 copy];
  id v3 = (void *)_loadFromProxy____infoKeys;
  _loadFromProxy____infoKeys = v2;

  objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"com.apple.springboard.allowIconVisibilityChanges", @"com.apple.developer.legacyvoip", @"com.apple.springboard.disallowNotificationCenter", @"com.apple.springboard.disallowControlCenter", @"com.apple.newsstand.content-notification-daily-limit", @"com.apple.springboard.appbackgroundstyle", @"com.apple.springboard.disablecompatibilitymode.late2022", @"com.apple.springboard.disablecompatibilitymode.forever", @"com.apple.developer.openURL-source", @"com.apple.developer.on-demand-install-capable", @"com.apple.springboard.deliveropenurlusingworkspace", @"com.apple.developer.storekit.external-purchase", @"com.apple.developer.storekit.external-purchase-link", @"com.apple.developer.sustained-execution", @"com.apple.developer.kernel.increased-memory-limit", @"com.apple.developer.kernel.increased-debugging-memory-limit", @"com.apple.private.shortcuts.IntentsAvailableDuringBuddy",
    @"com.apple.developer.web-browser-engine.host",
    @"com.apple.developer.embedded-web-browser-engine",
  uint64_t v7 = 0);

  id v4 = [MEMORY[0x1E4F57EE8] requiredEntitlementKeys];
  [v7 unionSet:v4];

  uint64_t v5 = [v7 copy];
  id v6 = (void *)_loadFromProxy____entitlementKeys;
  _loadFromProxy____entitlementKeys = v5;
}

+ (uint64_t)_visibilityOverrideFromInfo:(void *)a3 entitlements:
{
  id v4 = a2;
  id v5 = a3;
  self;
  id v6 = +[SBPlatformController sharedInstance];
  int v7 = [v6 isInternalInstall];
  int v8 = [v6 isCarrierInstall];
  if ([v4 BOOLForKey:@"SBIconVisibilitySetByAppPreference"]
    && (((v7 | v8) & 1) != 0
     || [v5 BOOLForKey:@"com.apple.springboard.allowIconVisibilityChanges"]))
  {
    uint64_t v9 = [v4 objectForKey:@"SBIconVisibilityDefaultVisible"];

    if (v9)
    {
      if ([v4 BOOLForKey:@"SBIconVisibilityDefaultVisible"]) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = 2;
      }
    }
    else
    {
      id v12 = self;
      uint64_t v13 = [v4 arrayForKey:@"SBIconVisibilityDefaultVisibleInstallTypes" withValuesOfClass:v12];

      if (v13)
      {
        char v14 = @"user";
        if (v8) {
          char v14 = @"carrier";
        }
        if (v7) {
          long long v15 = @"internal";
        }
        else {
          long long v15 = v14;
        }
        int v16 = [v13 containsObject:v15];
      }
      else
      {
        int v16 = 0;
      }
      long long v17 = self;
      long long v18 = [v4 arrayForKey:@"SBIconVisibilityDefaultVisiblePlatforms" withValuesOfClass:v17];

      if (v18)
      {
        uint64_t v19 = [v6 deviceClass];
        v16 |= [v18 containsObject:v19];
      }
      uint64_t v20 = [v4 stringForKey:@"SBIconVisibilityDefaultVisibleFeatureFlag"];
      v21 = v20;
      if (v20)
      {
        uint64_t v22 = [v20 componentsSeparatedByString:@"/"];
        if ([v22 count] == 2)
        {
          long long v23 = [v22 objectAtIndex:0];
          long long v24 = [v22 objectAtIndex:1];
          id v25 = v23;
          [v25 UTF8String];
          id v26 = v24;
          [v26 UTF8String];
          v16 |= _os_feature_enabled_impl();
        }
      }
      if (v16) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = 2;
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_configureTags:(char)a3 hasVisibilityOverride:
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    if (a3)
    {
LABEL_3:
      id v6 = 0;
      goto LABEL_7;
    }
    if ([a1 isInternalApplication])
    {
      int v7 = SBInternalAppTag;
    }
    else
    {
      if (![a1 isSystemApplication]) {
        goto LABEL_3;
      }
      id v11 = +[SBPlatformController sharedInstance];
      id v12 = [v11 defaultIconStateDisplayIdentifiers];
      uint64_t v13 = [a1 bundleIdentifier];
      char v14 = [v12 containsObject:v13];

      if (v14) {
        goto LABEL_3;
      }
      int v7 = &SBNonDefaultSystemAppTag;
    }
    id v6 = *v7;
LABEL_7:
    if ([a1 isAppleApplication])
    {
      if ([v5 count]) {
        int v8 = v5;
      }
      else {
        int v8 = 0;
      }
      id v9 = v8;
      a1 = v9;
      if (!v6) {
        goto LABEL_20;
      }
      if (v9)
      {
        uint64_t v10 = [v9 arrayByAddingObject:v6];

        a1 = (void *)v10;
LABEL_20:

        goto LABEL_21;
      }
    }
    else if (!v6)
    {
      a1 = 0;
      goto LABEL_20;
    }
    v16[0] = v6;
    a1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    goto LABEL_20;
  }
LABEL_21:

  return a1;
}

+ (uint64_t)_calculateApplicationSupportedTypesFromProxy:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_3:
      uint64_t v3 = 1;
      goto LABEL_20;
    }
  }
  else
  {
    id v4 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 != 1) {
      goto LABEL_3;
    }
  }
  id v6 = [v2 deviceFamily];
  int v7 = v6;
  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v3 = 0;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) description];
          if ([v12 isEqualToString:@"2"]) {
            uint64_t v13 = 2;
          }
          else {
            uint64_t v13 = [v12 isEqualToString:@"1"];
          }
          v3 |= v13;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 1;
  }

LABEL_20:
  return v3;
}

- (BOOL)_supportsApplicationType:(BOOL)result
{
  if (result) {
    return (*(void *)(result + 640) & a2) != 0;
  }
  return result;
}

- (uint64_t)_calculateVoipClassWithEntitlements:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if ([(id)a1 supportsBackgroundMode:*MEMORY[0x1E4F43738]])
    {
      if ([(id)a1 builtOnOrAfterSDKVersion:@"10.0"])
      {
        id v4 = [v3 objectForKey:@"com.apple.developer.legacyvoip"];

        if (v4) {
          uint64_t v5 = 1;
        }
        else {
          uint64_t v5 = 2;
        }
      }
      else
      {
        uint64_t v5 = 1;
      }
      if ([(id)a1 builtOnOrAfterSDKVersion:@"15.0"]) {
        a1 = 2;
      }
      else {
        a1 = v5;
      }
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (NSString)installInstanceID
{
  return self->_installInstanceID;
}

- (BOOL)isMonarchLinked
{
  return self->_isMonarchLinked;
}

- (BOOL)isTigrisLinked
{
  return self->_isTigrisLinked;
}

- (BOOL)isPeaceLinked
{
  return self->_isPeaceLinked;
}

- (BOOL)isPeaceBLinked
{
  return self->_isPeaceBLinked;
}

- (BOOL)isYukonLinked
{
  return self->_isYukonLinked;
}

- (BOOL)isYukonELinked
{
  return self->_isYukonELinked;
}

- (BOOL)isAzulLinked
{
  return self->_isAzulLinked;
}

- (BOOL)isAzulHWLinked
{
  return self->_isAzulHWLinked;
}

- (BOOL)isSkyLinked
{
  return self->_isSkyLinked;
}

- (BOOL)isCrystalLinked
{
  return self->_isCrystalLinked;
}

- (BOOL)representsWebApplication
{
  return self->_representsWebApplication;
}

- (NSString)applicationShortcutWidgetBundleIdentifier
{
  return self->_applicationShortcutWidgetBundleIdentifier;
}

- (unint64_t)visibilityOverride
{
  return self->_visibilityOverride;
}

- (BOOL)isLaunchableDuringSetup
{
  return self->_isLaunchableDuringSetup;
}

- (BOOL)prefersSavedSnapshots
{
  return self->_prefersSavedSnapshots;
}

- (NSSet)ignoredBackgroundActivityIdentifiers
{
  return self->_ignoredBackgroundActivityIdentifiers;
}

- (BOOL)isGameCenterEnabled
{
  return self->_isGameCenterEnabled;
}

- (BOOL)wasGameCenterEverEnabled
{
  return self->_wasGameCenterEverEnabled;
}

- (BOOL)requiresHiDPI
{
  return self->_requiresHiDPI;
}

- (BOOL)systemAppSupportsLocalNotifications
{
  return self->_systemAppSupportsLocalNotifications;
}

- (CRCarPlayAppDeclaration)carPlayDeclaration
{
  return self->_carPlayDeclaration;
}

- (unint64_t)supportedTypes
{
  return self->_supportedTypes;
}

- (BOOL)isStatusBarLegacy
{
  return self->_statusBarIsLegacy;
}

- (NSArray)launchImageInfo
{
  return self->_launchImageInfo;
}

- (NSString)launchInterfaceFileName
{
  return self->_launchInterfaceFileName;
}

- (NSSet)urlSchemes
{
  return self->_urlSchemes;
}

- (NSURL)documentInboxURL
{
  return self->_documentInboxURL;
}

- (BOOL)disallowsNotificationCenter
{
  return self->_disallowsNotificationCenter;
}

- (BOOL)disallowsControlCenter
{
  return self->_disallowsControlCenter;
}

- (unint64_t)allowedNKNotificationsPerDay
{
  return self->_allowedNKNotificationsPerDay;
}

- (BOOL)usesRLNDataProvider
{
  return self->_usesRLNDataProvider;
}

- (BOOL)supportsYttrium
{
  return self->_supportsYttrium;
}

- (BOOL)isNewsstand
{
  return self->_isNewsstand;
}

- (BOOL)alwaysReceivesOpenURLSource
{
  return self->_alwaysReceivesOpenURLSource;
}

- (BOOL)isLicensedToDevice
{
  return self->_isLicensedToDevice;
}

- (unint64_t)applicationSizeInBytes
{
  return self->_applicationSizeInBytes;
}

- (NSArray)iTunesCategoriesOrderedByRelevancy
{
  return self->_iTunesCategoriesOrderedByRelevancy;
}

- (XBSnapshotContainerIdentity)manifestContainerIdentity
{
  return self->_manifestContainerIdentity;
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_manifestContainerIdentity, 0);
  objc_storeStrong((id *)&self->_iTunesCategoriesOrderedByRelevancy, 0);
  objc_storeStrong((id *)&self->_documentInboxURL, 0);
  objc_storeStrong((id *)&self->_eligibilityDomains, 0);
  objc_storeStrong((id *)&self->_ignoredBackgroundActivityIdentifiers, 0);
  objc_storeStrong((id *)&self->_installInstanceID, 0);
  objc_storeStrong((id *)&self->_lazy_userDefaults, 0);
  objc_storeStrong((id *)&self->_dataContainerURLOverride, 0);
  objc_storeStrong((id *)&self->_restorationArchiveContainerURL, 0);
  objc_storeStrong((id *)&self->_supportedContentTypes, 0);
  objc_storeStrong((id *)&self->_urlSchemes, 0);
  objc_storeStrong((id *)&self->_launchInterfaceFileName, 0);
  objc_storeStrong((id *)&self->_launchImageInfo, 0);
  objc_storeStrong((id *)&self->_domainsToPreheat, 0);
  objc_storeStrong((id *)&self->_carPlayDeclaration, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_staticApplicationShortcutItems, 0);
  objc_storeStrong((id *)&self->_applicationShortcutWidgetBundleIdentifier, 0);
}

void __51__SBApplicationInfo_staticApplicationShortcutItems__block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = [*a1 bundleIdentifier];
  uint64_t v5 = [*a1 bundleURL];
  int v6 = 138412546;
  int v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Unable to localize staticApplicationShortcutItems for %@ because we failed to create a bundle for %@", (uint8_t *)&v6, 0x16u);
}

@end
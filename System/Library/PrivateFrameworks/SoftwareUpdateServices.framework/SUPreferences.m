@interface SUPreferences
+ (SUPreferences)sharedInstance;
- (BOOL)_autoInstallDefaultValue;
- (BOOL)_autoInstallSecurityResponseDefaultValue;
- (BOOL)_autoInstallSystemDataFilesDefaultValue;
- (BOOL)_cachedBoolValueForKey:(id)a3 withDefaultValue:(BOOL)a4;
- (BOOL)_getBooleanPreferenceForKey:(id)a3 withDefaultValue:(BOOL)a4;
- (BOOL)allowSameBuildUpdates;
- (BOOL)allowSameRestoreVersionSplatUpdate;
- (BOOL)allowSplatUpdate;
- (BOOL)autoDownloadDeletedBuild;
- (BOOL)autoInstallSecurityResponse;
- (BOOL)autoInstallSecurityResponseForceOff;
- (BOOL)autoInstallSecurityResponseForceOn;
- (BOOL)autoInstallSystemAndDataFiles;
- (BOOL)autoInstallSystemDataFilesForceOff;
- (BOOL)autoInstallSystemDataFilesForceOn;
- (BOOL)autoUpdateForceOff;
- (BOOL)autoUpdateForceOn;
- (BOOL)backgroundDLKnownBuilds;
- (BOOL)buddyInitiatedScan;
- (BOOL)bypassSystemRootWarning;
- (BOOL)customerPowerPolicies;
- (BOOL)disableAutoDownload;
- (BOOL)disableAutoDownloadJitter;
- (BOOL)disableAutoInstallJitter;
- (BOOL)disableAvailabilityAlerts;
- (BOOL)disableBuildNumberComparison;
- (BOOL)disableFollowUps;
- (BOOL)disableFullReplacementFallback;
- (BOOL)disableManagedRequest;
- (BOOL)disablePurgeOnNewerUpdateFound;
- (BOOL)disableRollback;
- (BOOL)disableSplombo;
- (BOOL)disableUserWiFiOnlyPeriod;
- (BOOL)enablePreSUStaging;
- (BOOL)enablePreSUStagingForOptionalAssets;
- (BOOL)fakeAppOffload;
- (BOOL)fakeInstallFailure;
- (BOOL)fakeSplatInstalled;
- (BOOL)forceFullReplacement;
- (BOOL)haveEnoughSpace;
- (BOOL)ignoreBatteryInfo;
- (BOOL)isAutoDownloadDisabled;
- (BOOL)isAutoSUDisabled;
- (BOOL)isAutomaticDownloadEnabled;
- (BOOL)isAutomaticUpdateV2Enabled;
- (BOOL)isChinaDevice;
- (BOOL)isKeySetInPreferences:(id)a3;
- (BOOL)overrideAllowAutoDownloadOnBattery;
- (BOOL)overrideGranularRamping;
- (BOOL)overrideRamping;
- (BOOL)previousUserSpecifiedAutoDownload;
- (BOOL)previousUserSpecifiedAutoInstallSecurityResponse;
- (BOOL)previousUserSpecifiedAutomaticUpdateV2Enabled;
- (BOOL)queryCustomerBuilds;
- (BOOL)scanWeeklyInternally;
- (BOOL)shouldDelayInMinutes;
- (BOOL)shouldDelayUpdates;
- (BOOL)skipApply;
- (BOOL)skipDownload;
- (BOOL)spacePurgeSuccessful;
- (BOOL)suppressSSOTokenInDownload;
- (BOOL)suppressSSOTokenInInstall;
- (BOOL)useEmptyPatches;
- (BOOL)useSUCoreXPCActivityScheduler;
- (NSDictionary)overrideCarrierDownloadPolicyProperties;
- (NSDictionary)preferencesDefinitions;
- (NSHashTable)observers;
- (NSMutableDictionary)cachedPreferences;
- (NSNumber)MDMSoftwareUpdatePath;
- (NSNumber)analyticsSubmissionIntervalOverride;
- (NSNumber)autoDownloadOverrideInterval;
- (NSNumber)autoInstallRetryDelay;
- (NSNumber)autoSUEndDelta;
- (NSNumber)autoSUStartDelta;
- (NSNumber)autoSUUnlockEndDelta;
- (NSNumber)autoSUUnlockStartDelta;
- (NSNumber)bannerDelay;
- (NSNumber)batteryLevelOverride;
- (NSNumber)batteryOverridePluggedIn;
- (NSNumber)batteryOverrideWirelessCharging;
- (NSNumber)keybagState;
- (NSNumber)networkMonitorOverride;
- (NSNumber)overrideAutoDownloadOnBatteryDelay;
- (NSNumber)recommendedUpdateInterval;
- (NSNumber)spacePurgeTime;
- (NSNumber)splatScanInterval;
- (NSNumber)unmetConstraints;
- (NSNumber)updateDelayInterval;
- (NSString)overrideScanSessionIDRampingPortion;
- (NSString)overrideSplatComboBuildVersion;
- (NSString)requestedPMV;
- (NSString)ssoTokenForPersonalization;
- (NSString)ssoUsernameForPersonalization;
- (NSString)suggestedRollbackSplatVersion;
- (SUPreferences)init;
- (id)_cachedDictValueForKey:(id)a3;
- (id)_cachedNumberValueForKey:(id)a3;
- (id)_cachedObjectForKey:(id)a3 ofClass:(Class)a4;
- (id)_cachedStringValueForKey:(id)a3;
- (id)_copyDictPreferenceForKey:(id)a3;
- (id)_copyNumberPreferenceForKey:(id)a3;
- (id)_copyStringPreferenceForKey:(id)a3;
- (id)_copyValueOfKey:(id)a3 withType:(int64_t)a4;
- (id)_mandatorySUFlagsForPreferences;
- (void)_copyPreferenceForKey:(__CFString *)a3 ofType:(unint64_t)a4;
- (void)_loadPreferences;
- (void)_setBooleanPreferenceForKey:(id)a3 value:(BOOL)a4;
- (void)_setCachedBooleanPreferenceForKey:(id)a3 value:(BOOL)a4;
- (void)_setObjectPreferenceForKey:(id)a3 value:(id)a4;
- (void)_setupAutomaticUpdateV2Enabled;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)enableAutoInstallSecurityResponse:(BOOL)a3;
- (void)enableAutoInstallSystemAndDataFiles:(BOOL)a3;
- (void)enableAutomaticDownload:(BOOL)a3;
- (void)enableAutomaticUpdateV2:(BOOL)a3;
- (void)enablePreviousUserSpecifiedAutoDownload:(BOOL)a3;
- (void)enablePreviousUserSpecifiedAutoInstallSecurityResponse:(BOOL)a3;
- (void)enablePreviousUserSpecifiedAutomaticUpdateV2:(BOOL)a3;
- (void)preference:(id)a3 didChangeTo:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setCachedPreferences:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPreferencesDefinitions:(id)a3;
- (void)setSuggestedRollbackSplatVersion:(id)a3;
@end

@implementation SUPreferences

SUPreferences *__31__SUPreferences_sharedInstance__block_invoke()
{
  result = objc_alloc_init(SUPreferences);
  sharedInstance___instance_10 = (uint64_t)result;
  return result;
}

uint64_t __57__SUPreferences__setCachedBooleanPreferenceForKey_value___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = *(void **)(*(void *)(a1 + 32) + 24);
  return [v4 setObject:v2 forKeyedSubscript:v3];
}

void __33__SUPreferences__loadPreferences__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  SULogInfo(@"%s: loading preferences", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"-[SUPreferences _loadPreferences]_block_invoke");
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) allValues];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v18 = v10;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v9);
        }
        v21 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "isKeySetInPreferences:", objc_msgSend(v21, "preferenceKey")))
        {
          v22 = objc_msgSend(*(id *)(a1 + 32), "_copyValueOfKey:withType:", objc_msgSend(v21, "preferenceKey"), objc_msgSend(v21, "type"));
          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setValue:forKey:", v22, objc_msgSend(v21, "preferenceKey"));
        }
      }
      uint64_t v18 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v18);
  }
  SULogInfo(@"%s: done loading preferences", v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[SUPreferences _loadPreferences]_block_invoke");
}

- (BOOL)isKeySetInPreferences:(id)a3
{
  CFPropertyListRef v3 = CFPreferencesCopyValue((CFStringRef)a3, @"com.apple.softwareupdateservicesd", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
  CFPropertyListRef v4 = v3;
  if (v3) {
    CFRelease(v3);
  }
  return v4 != 0;
}

- (id)_copyValueOfKey:(id)a3 withType:(int64_t)a4
{
  switch(a4)
  {
    case 0:
      BOOL v8 = [(SUPreferences *)self _getBooleanPreferenceForKey:a3 withDefaultValue:0];
      v9 = (void *)[NSNumber numberWithBool:v8];
      id result = v9;
      break;
    case 1:
      id result = [(SUPreferences *)self _copyStringPreferenceForKey:a3];
      break;
    case 2:
      id result = [(SUPreferences *)self _copyNumberPreferenceForKey:a3];
      break;
    case 3:
      id result = [(SUPreferences *)self _copyDictPreferenceForKey:a3];
      break;
    default:
      SULogInfo(@"Unknown SUPreferenceType for key: %@ type:%ld", (uint64_t)a2, (uint64_t)a3, a4, v4, v5, v6, v7, (uint64_t)a3);
      id result = 0;
      break;
  }
  return result;
}

- (BOOL)_getBooleanPreferenceForKey:(id)a3 withDefaultValue:(BOOL)a4
{
  uint64_t v5 = [(SUPreferences *)self _copyPreferenceForKey:a3 ofType:CFBooleanGetTypeID()];
  if (v5)
  {
    uint64_t v6 = v5;
    a4 = CFBooleanGetValue((CFBooleanRef)v5) != 0;
    CFRelease(v6);
  }
  return a4;
}

- (void)_copyPreferenceForKey:(__CFString *)a3 ofType:(unint64_t)a4
{
  CFPropertyListRef v5 = CFPreferencesCopyValue(a3, @"com.apple.softwareupdateservicesd", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
  uint64_t v6 = v5;
  if (v5 && CFGetTypeID(v5) != a4)
  {
    CFRelease(v6);
    return 0;
  }
  return (void *)v6;
}

- (SUPreferences)init
{
  v88.receiver = self;
  v88.super_class = (Class)SUPreferences;
  uint64_t v2 = [(SUPreferences *)&v88 init];
  if (v2)
  {
    v2->_preferencesWorkloop = (OS_dispatch_workloop *)dispatch_workloop_create("com.apple.softwareupdateservices.preferencesWorkLoop");
    v2->_cachedPreferences = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v2->_preferencesDefinitions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v2->_observers = (NSHashTable *)(id)[MEMORY[0x263F088B0] weakObjectsHashTable];
    CFPropertyListRef v3 = [[SUPreferenceEntry alloc] initWithKey:@"SUUpdateRequiredFromFactory" type:0 description:@"Sets mandatory update dictionary value SUMandatoryUpdateRequiredFromFactory"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v3 forKey:@"SUUpdateRequiredFromFactory"];

    uint64_t v4 = [[SUPreferenceEntry alloc] initWithKey:@"SUCheckForUpdateFromFactory" type:0 description:@"Sets mandatory update dictionary value SUMandatoryUpdateCheckForUpdateFromFactory"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v4 forKey:@"SUCheckForUpdateFromFactory"];

    CFPropertyListRef v5 = [[SUPreferenceEntry alloc] initWithKey:@"SUUpdateRequiredOnErase" type:0 description:@"Sets mandatory update dictionary value SUMandatoryUpdateRequiredOnErase"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v5 forKey:@"SUUpdateRequiredOnErase"];

    uint64_t v6 = [[SUPreferenceEntry alloc] initWithKey:@"SUCheckForUpdateOnErase" type:0 description:@"Sets mandatory update dictionary value SUMandatoryUpdateCheckForUpdateOnErase"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v6 forKey:@"SUCheckForUpdateOnErase"];

    uint64_t v7 = [[SUPreferenceEntry alloc] initWithKey:@"SUDisableManagedRequest" type:0 description:@"Disables managed update requests"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v7 forKey:@"SUDisableManagedRequest"];

    BOOL v8 = [[SUPreferenceEntry alloc] initWithKey:@"SUDisableUserWiFiOnlyPeriod" type:0 description:@"Disables wifi-only download period, allowing cellular download immediately"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v8 forKey:@"SUDisableUserWiFiOnlyPeriod"];

    v9 = [[SUPreferenceEntry alloc] initWithKey:@"SUDisableBuildNumberComparison" type:0 description:@"Disables build version number comparison"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v9 forKey:@"SUDisableBuildNumberComparison"];

    uint64_t v10 = [[SUPreferenceEntry alloc] initWithKey:@"SUAllowSameBuildUpdates" type:0 description:@"Allows device to update to the same build version as currently installed version"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v10 forKey:@"SUAllowSameBuildUpdates"];

    uint64_t v11 = [[SUPreferenceEntry alloc] initWithKey:@"SUDisableAvailabilityAlerts" type:0 description:@"Disabled SU availability alerts"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v11 forKey:@"SUDisableAvailabilityAlerts"];

    uint64_t v12 = [[SUPreferenceEntry alloc] initWithKey:@"SUDisableAutoDownload" type:0 description:@"Disabled automatic downloads of software update assets"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v12 forKey:@"SUDisableAutoDownload"];

    uint64_t v13 = [[SUPreferenceEntry alloc] initWithKey:@"SUScanWeeklyInternally" type:0 description:@"Changes the auto scan interval to once a week for internal builds"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v13 forKey:@"SUScanWeeklyInternally"];

    uint64_t v14 = [[SUPreferenceEntry alloc] initWithKey:@"SUForceFullReplacement" type:0 description:@"Forces the device to only return full replacement update assets"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v14 forKey:@"SUForceFullReplacement"];

    uint64_t v15 = [[SUPreferenceEntry alloc] initWithKey:@"SUDisbaleFullReplacementFallback" type:0 description:@"Disabled full replacement fallback if prepare fails with patching error"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v15 forKey:@"SUDisbaleFullReplacementFallback"];

    uint64_t v16 = [[SUPreferenceEntry alloc] initWithKey:@"SUAutoDownloadOverrideInterval" type:2 description:@"Overrides the auto download interval to a specified number of days"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v16 forKey:@"SUAutoDownloadOverrideInterval"];

    uint64_t v17 = [[SUPreferenceEntry alloc] initWithKey:@"SUUpdateDelayInterval" type:2 description:@"Sets the managed update delay period to specified number of days. Requires SUShouldDelayUpdates = true"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v17 forKey:@"SUUpdateDelayInterval"];

    uint64_t v18 = [[SUPreferenceEntry alloc] initWithKey:@"SUDelayInMinutes" type:0 description:@"Sets the managed update delay period interval to be in minutes instead of days"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v18 forKey:@"SUDelayInMinutes"];

    uint64_t v19 = [[SUPreferenceEntry alloc] initWithKey:@"SUShouldDelayUpdates" type:0 description:@"Enables managed update delay period"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v19 forKey:@"SUShouldDelayUpdates"];

    v20 = [[SUPreferenceEntry alloc] initWithKey:@"SUUnmetConstraints" type:2 description:@"Simulates unmet installation constraints"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v20 forKey:@"SUUnmetConstraints"];

    v21 = [[SUPreferenceEntry alloc] initWithKey:@"SURequestedPMV" type:1 description:@"Simulates an MDM administrator pushing a requested product marketing version"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v21 forKey:@"SURequestedPMV"];

    v22 = [[SUPreferenceEntry alloc] initWithKey:@"SUAutoUpdateForceOn" type:0 description:@"Forces the auto install setting ON for client option and asset attribute"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v22 forKey:@"SUAutoUpdateForceOn"];

    long long v23 = [[SUPreferenceEntry alloc] initWithKey:@"SUAutoUpdateForceOff" type:0 description:@"Forces the auto install setting OFF for client option and asset attribute"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v23 forKey:@"SUAutoUpdateForceOff"];

    long long v24 = [[SUPreferenceEntry alloc] initWithKey:@"SUAutoSUStartDelta" type:2 description:@"Sets automatic installation start time to N seconds after prepare completes."];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v24 forKey:@"SUAutoSUStartDelta"];

    long long v25 = [[SUPreferenceEntry alloc] initWithKey:@"SUAutoSUEndDelta" type:2 description:@"Sets automatic installation end time to N seconds after prepare completes"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v25 forKey:@"SUAutoSUEndDelta"];

    long long v26 = [[SUPreferenceEntry alloc] initWithKey:@"SUAutoSUUnlockStartDelta" type:2 description:@"Sets automatic installation unlock start time to N seconds after prepare completes"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v26 forKey:@"SUAutoSUUnlockStartDelta"];

    v27 = [[SUPreferenceEntry alloc] initWithKey:@"SUAutoSUUnlockEndDelta" type:2 description:@"Sets automatic installation unlock end time to N seconds after prepare completes"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v27 forKey:@"SUAutoSUUnlockEndDelta"];

    uint64_t v28 = [[SUPreferenceEntry alloc] initWithKey:@"SUAutomaticUpdateV2Enabled" type:0 description:@"Enables/Disabled automatic update client setting"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v28 forKey:@"SUAutomaticUpdateV2Enabled"];

    v29 = [[SUPreferenceEntry alloc] initWithKey:@"SUAutomaticUpdateV2Enabled_prev" type:0 description:@"Enables/Disabled automatic update client setting (previous user specified setting). Probably not what you're looking for. You likely want to use SUAutomaticUpdateV2Enabled"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v29 forKey:@"SUAutomaticUpdateV2Enabled_prev"];

    v30 = [[SUPreferenceEntry alloc] initWithKey:@"SUBannerDelay" type:2 description:@"Sets the delay value in seconds for presenting auto update banner (30 minutes by default)"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v30 forKey:@"SUBannerDelay"];

    v31 = [[SUPreferenceEntry alloc] initWithKey:@"SUAutoDownloadDeletedBuild" type:0 description:@"Enabled auto download of deleted builds"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v31 forKey:@"SUAutoDownloadDeletedBuild"];

    v32 = [[SUPreferenceEntry alloc] initWithKey:@"SUMDMSoftwareUpdatePath" type:2 description:@"Sets the MDM user initiated scan SU path\n\t0 = Default\n\t1 = slow lane\n\t2 = fast lane"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v32 forKey:@"SUMDMSoftwareUpdatePath"];

    v33 = [[SUPreferenceEntry alloc] initWithKey:@"SUAnalyticsSubmissionInterval" type:2 description:@"Sets the time interval(in minutes) for the submission of Analytics events"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v33 forKey:@"SUAnalyticsSubmissionInterval"];

    v34 = [[SUPreferenceEntry alloc] initWithKey:@"SUQueryCustomerBuilds" type:0 description:@"If set to true, MobileAsset query for SU, brain and doc asset will have NULL ReleaseType"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v34 forKey:@"SUQueryCustomerBuilds"];

    v35 = [[SUPreferenceEntry alloc] initWithKey:@"SUDisableRollback" type:0 description:@"Disabled Splat rollback"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v35 forKey:@"SUDisableRollback"];

    v36 = [[SUPreferenceEntry alloc] initWithKey:@"SUPreferencesSuggestedRollbackSplatVersion" type:1 description:@"Suggested rollback splat version"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v36 forKey:@"SUPreferencesSuggestedRollbackSplatVersion"];

    v37 = [[SUPreferenceEntry alloc] initWithKey:@"SUUseEmptyPatches" type:0 description:@"If set to true, MobileAsset query for SU, brain and doc asset will use \"Empty\" ReleaseType"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v37 forKey:@"SUUseEmptyPatches"];

    v38 = [[SUPreferenceEntry alloc] initWithKey:@"SUAllowSplatUpdate" type:0 description:@"Allow Splat software updates"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v38 forKey:@"SUAllowSplatUpdate"];

    v39 = [[SUPreferenceEntry alloc] initWithKey:@"SUFakeSplatInstalled" type:0 description:@"Fake Splat installed"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v39 forKey:@"SUFakeSplatInstalled"];

    v40 = [[SUPreferenceEntry alloc] initWithKey:@"SUAllowSameSplatUpdate" type:0 description:@"Allow updating Splat to the same version as currently installed splat"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v40 forKey:@"SUAllowSameSplatUpdate"];

    v41 = [[SUPreferenceEntry alloc] initWithKey:@"SUSplatScanInterval" type:2 description:@"Auto-scan interval for splat updates"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v41 forKey:@"SUSplatScanInterval"];

    v42 = [[SUPreferenceEntry alloc] initWithKey:@"SUAutoInstallSystemDataFilesForceOn" type:0 description:@"Forces the auto install system and data files setting ON for client option and asset attribute"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v42 forKey:@"SUAutoInstallSystemDataFilesForceOn"];

    v43 = [[SUPreferenceEntry alloc] initWithKey:@"SUAutoInstallSystemDataFilesForceOff" type:0 description:@"Forces the auto install system and data files setting OFF for client option and asset attribute"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v43 forKey:@"SUAutoInstallSystemDataFilesForceOff"];

    v44 = [[SUPreferenceEntry alloc] initWithKey:@"SUAutoInstallSystemDataFiles" type:0 description:@"Auto install system and data files"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v44 forKey:@"SUAutoInstallSystemDataFiles"];

    v45 = [[SUPreferenceEntry alloc] initWithKey:@"SUAutoInstallSecurityResponseForceOn" type:0 description:@"Forces the auto install Rapid Security Reponse setting ON for client option and asset attribute"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v45 forKey:@"SUAutoInstallSecurityResponseForceOn"];

    v46 = [[SUPreferenceEntry alloc] initWithKey:@"SUAutoInstallSecurityResponseForceOff" type:0 description:@"Forces the auto install Rapid Security Reponse setting OFF for client option and asset attribute"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v46 forKey:@"SUAutoInstallSecurityResponseForceOff"];

    v47 = [[SUPreferenceEntry alloc] initWithKey:@"SUAutoInstallSecurityResponse" type:0 description:@"Auto install Rapid Security Response"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v47 forKey:@"SUAutoInstallSecurityResponse"];

    v48 = [[SUPreferenceEntry alloc] initWithKey:@"SUAutoInstallSecurityResponse_prev" type:0 description:@"Auto install Rapid Security Response (previous user specified setting). Probably not what you're looking for. You likely want to use SUAutoInstallSecurityResponse"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v48 forKey:@"SUAutoInstallSecurityResponse_prev"];

    v49 = [[SUPreferenceEntry alloc] initWithKey:@"SUIgnoreBatteryInfo" type:0 description:@"If set to true, battery will be considered as plugged-in and fully charged"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v49 forKey:@"SUIgnoreBatteryInfo"];

    v50 = [[SUPreferenceEntry alloc] initWithKey:@"SUBatteryInfoOverridePluggedIn" type:2 description:@"If set to true, battery will be considered as plugged-in. If false, battery will be considered as not plugged in. This overrides SUIgnoreBatteryInfo"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v50 forKey:@"SUBatteryInfoOverridePluggedIn"];

    v51 = [[SUPreferenceEntry alloc] initWithKey:@"SUBatteryInfoOverrideWirelessCharging" type:2 description:@"If set to true, battery will be considered as wirelessly charging. If false, battery will be considered as wirelessly charging. This overrides SUIgnoreBatteryInfo"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v51 forKey:@"SUBatteryInfoOverrideWirelessCharging"];

    v52 = [[SUPreferenceEntry alloc] initWithKey:@"SUBatteryLevelOverride" type:2 description:@"Set this to a numerical value from 0 to 100 to override the current battery level. This overrides SUIgnoreBatteryInfo"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v52 forKey:@"SUBatteryLevelOverride"];

    v53 = [[SUPreferenceEntry alloc] initWithKey:@"SUCustomerPowerPolicies" type:0 description:@"If set to true, customer power policies will be used on internal build"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v53 forKey:@"SUCustomerPowerPolicies"];

    v54 = [[SUPreferenceEntry alloc] initWithKey:@"SUDisablePurgeOnNewerUpdateFound" type:0 description:@"If set to true, prepared updates will not be purged if a newer update is located"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v54 forKey:@"SUDisablePurgeOnNewerUpdateFound"];

    v55 = [[SUPreferenceEntry alloc] initWithKey:@"SURecommendedUpdateInterval" type:2 description:@"Interval time in seconds between recommended update notifications"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v55 forKey:@"SURecommendedUpdateInterval"];

    v56 = [[SUPreferenceEntry alloc] initWithKey:@"SUUseXPCActivityScheduler" type:0 description:@"If set to true, the SUCoreXPCActivity scheduler will be used for scheduling"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v56 forKey:@"SUUseXPCActivityScheduler"];

    v57 = [[SUPreferenceEntry alloc] initWithKey:@"SUNetworkMonitorOverride" type:2 description:@"Set this to override the network monitor."];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v57 forKey:@"SUNetworkMonitorOverride"];

    v58 = [[SUPreferenceEntry alloc] initWithKey:@"SUSkipDownload" type:0 description:@"If set to true, skip the download and the apply phases."];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v58 forKey:@"SUSkipDownload"];

    v59 = [[SUPreferenceEntry alloc] initWithKey:@"SUSkipApply" type:0 description:@"If set to true, skip the apply phase."];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v59 forKey:@"SUSkipApply"];

    v60 = [[SUPreferenceEntry alloc] initWithKey:@"SUSuppressSSOTokenInInstall" type:0 description:@"If set to true, suppress issuing apple connect SSO token when installing SU."];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v60 forKey:@"SUSuppressSSOTokenInInstall"];

    v61 = [[SUPreferenceEntry alloc] initWithKey:@"SUSuppressSSOTokenInDownload" type:0 description:@"If set to true, suppress issuing apple connect SSO token when downloading SU asset."];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v61 forKey:@"SUSuppressSSOTokenInDownload"];

    v62 = [[SUPreferenceEntry alloc] initWithKey:@"SUKeybagState" type:2 description:@"Set this to override the keybag state."];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v62 forKey:@"SUKeybagState"];

    v63 = [[SUPreferenceEntry alloc] initWithKey:@"SUBuddyInitiatedScan" type:0 description:@"If set to true, scans will be buddy-initiated"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v63 forKey:@"SUBuddyInitiatedScan"];

    v64 = [[SUPreferenceEntry alloc] initWithKey:@"SUHaveEnoughSpace" type:0 description:@"If set to false, it forces a storage shortage error; otherwise takes no effect"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v64 forKey:@"SUHaveEnoughSpace"];

    v65 = [[SUPreferenceEntry alloc] initWithKey:@"SUSpacePurgeSuccessful" type:0 description:@"If set to false, it forces a space purge failure; otherwise forces a success."];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v65 forKey:@"SUSpacePurgeSuccessful"];

    v66 = [[SUPreferenceEntry alloc] initWithKey:@"SUSpacePurgeTime" type:2 description:@"Number of seconds for space purge (+[SUSpace makeRoomForUpdate:error:]) to finish. Even => success; odd => failure."];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v66 forKey:@"SUSpacePurgeTime"];

    v67 = [[SUPreferenceEntry alloc] initWithKey:@"SUBypassSystemRootWarning" type:0 description:@"If set to true, updates won't be blocked on live fs"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v67 forKey:@"SUBypassSystemRootWarning"];

    v68 = [[SUPreferenceEntry alloc] initWithKey:@"SUDisableAutoDownloadJitter" type:0 description:@"If set to true, disable jitter for auto downloads"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v68 forKey:@"SUDisableAutoDownloadJitter"];

    v69 = [[SUPreferenceEntry alloc] initWithKey:@"SUFakeAppOffload" type:0 description:@"If set to true, fake an app offload when making room"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v69 forKey:@"SUFakeAppOffload"];

    v70 = [[SUPreferenceEntry alloc] initWithKey:@"SUDisableAutoInstallJitter" type:0 description:@"If set to true, disable jitter for auto installations"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v70 forKey:@"SUDisableAutoInstallJitter"];

    v71 = [[SUPreferenceEntry alloc] initWithKey:@"SUAutoInstallRetryDelay" type:2 description:@"Delay before scheduling another auto installation"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v71 forKey:@"SUAutoInstallRetryDelay"];

    v72 = [[SUPreferenceEntry alloc] initWithKey:@"SUOverrideRamping" type:0 description:@"If set to true, descriptors will be considered ramped"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v72 forKey:@"SUOverrideRamping"];

    v73 = [[SUPreferenceEntry alloc] initWithKey:@"SUOverrideGranularRamping" type:0 description:@"If set to true, descriptors will be considered granularly ramped"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v73 forKey:@"SUOverrideGranularRamping"];

    v74 = [[SUPreferenceEntry alloc] initWithKey:@"SUOverrideScanSessionIDRampingPortion" type:1 description:@"To override the ramping portion of a scan session id"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v74 forKey:@"SUOverrideScanSessionIDRampingPortion"];

    v75 = [[SUPreferenceEntry alloc] initWithKey:@"SUOverrideAllowAutoDownloadOnBattery" type:0 description:@"If set to true, allow auto-downloading on battery"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v75 forKey:@"SUOverrideAllowAutoDownloadOnBattery"];

    v76 = [[SUPreferenceEntry alloc] initWithKey:@"SUOverrideAutoDownloadOnBatteryDelay" type:2 description:@"Delay before auto-downloading on battery after the update is fully-unramped"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v76 forKey:@"SUOverrideAutoDownloadOnBatteryDelay"];

    v77 = [[SUPreferenceEntry alloc] initWithKey:@"SUDisableSplombo" type:0 description:@"If set to false, enable splombo"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v77 forKey:@"SUDisableSplombo"];

    v78 = [[SUPreferenceEntry alloc] initWithKey:@"SUFakeInstallFailure" type:0 description:@"If set to true, force an installation failure"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v78 forKey:@"SUFakeInstallFailure"];

    v79 = [[SUPreferenceEntry alloc] initWithKey:@"SUDisableFollowUps" type:0 description:@"If set to true, don't post followups"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v79 forKey:@"SUDisableFollowUps"];

    v80 = [[SUPreferenceEntry alloc] initWithKey:@"SUOverrideSplatComboBuildVersion" type:1 description:@"Set to override the build version of the associated splat for a splombo"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v80 forKey:@"SUOverrideSplatComboBuildVersion"];

    v81 = [[SUPreferenceEntry alloc] initWithKey:@"SUEnablePreSuStaging" type:0 description:@"If set to true, enable pre SU staging in SUCore"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v81 forKey:@"SUEnablePreSuStaging"];

    v82 = [[SUPreferenceEntry alloc] initWithKey:@"SUEnablePreSuStagingForOptionalAssets" type:0 description:@"If set to true, enable pre SU staging for optional assets in SUCore"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v82 forKey:@"SUEnablePreSuStagingForOptionalAssets"];

    v83 = [[SUPreferenceEntry alloc] initWithKey:@"SUSSOUsernameForPersonalization" type:1 description:@"If set, use this username for personalization"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v83 forKey:@"SUSSOUsernameForPersonalization"];

    v84 = [[SUPreferenceEntry alloc] initWithKey:@"SUSSOTokenForPersonalization" type:1 description:@"If set, use this token for personalization"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v84 forKey:@"SUSSOTokenForPersonalization"];

    v85 = [[SUPreferenceEntry alloc] initWithKey:@"SUOverrideCarrierDownloadPolicyProperties" type:3 description:@"Override carrier download policy properties. Don't set via sus_tool; use defaults write instead"];
    [(NSMutableDictionary *)v2->_preferencesDefinitions setValue:v85 forKey:@"SUOverrideCarrierDownloadPolicyProperties"];

    [(SUPreferences *)v2 _loadPreferences];
    [(SUPreferences *)v2 _setupAutomaticUpdateV2Enabled];
    CFPreferencesSynchronize(@"com.apple.softwareupdateservicesd", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__SUPreferencesChanged, @"SUPreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return v2;
}

- (void)_setupAutomaticUpdateV2Enabled
{
  BOOL v3 = ![(SUPreferences *)self disableAutoDownload]
    && [(SUPreferences *)self _getBooleanPreferenceForKey:@"SUAutomaticUpdateV2Enabled" withDefaultValue:[(SUPreferences *)self _autoInstallDefaultValue]];
  [(SUPreferences *)self _setCachedBooleanPreferenceForKey:@"SUAutomaticUpdateV2Enabled" value:v3];
}

- (BOOL)disableAutoDownload
{
  BOOL v3 = [(SUPreferences *)self _autoDownloadDisableDefaultValue];
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUDisableAutoDownload" withDefaultValue:v3];
}

- (BOOL)isChinaDevice
{
  uint64_t v2 = (void *)MGCopyAnswerWithError();
  if (v2)
  {
    uint64_t v10 = v2;
    char v11 = [v2 isEqualToString:@"CH"];
    CFRelease(v10);
  }
  else
  {
    SULogDebug(@"Failed to copy region code: %d", v3, v4, v5, v6, v7, v8, v9, 0);
    return 0;
  }
  return v11;
}

- (void)_setCachedBooleanPreferenceForKey:(id)a3 value:(BOOL)a4
{
  preferencesWorkloop = self->_preferencesWorkloop;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SUPreferences__setCachedBooleanPreferenceForKey_value___block_invoke;
  block[3] = &unk_26447F0E0;
  block[4] = self;
  block[5] = a3;
  BOOL v6 = a4;
  dispatch_async(preferencesWorkloop, block);
}

- (void)_loadPreferences
{
  preferencesWorkloop = self->_preferencesWorkloop;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SUPreferences__loadPreferences__block_invoke;
  block[3] = &unk_26447CCB0;
  block[4] = self;
  dispatch_async_and_wait(preferencesWorkloop, block);
}

- (BOOL)_cachedBoolValueForKey:(id)a3 withDefaultValue:(BOOL)a4
{
  id v5 = [(SUPreferences *)self _cachedObjectForKey:a3 ofClass:objc_opt_class()];
  if (!v5) {
    return a4;
  }
  return [v5 BOOLValue];
}

- (id)_cachedObjectForKey:(id)a3 ofClass:(Class)a4
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  char v11 = __Block_byref_object_copy__22;
  uint64_t v12 = __Block_byref_object_dispose__22;
  uint64_t v13 = 0;
  preferencesWorkloop = self->_preferencesWorkloop;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__SUPreferences__cachedObjectForKey_ofClass___block_invoke;
  v7[3] = &unk_26447F108;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a4;
  v7[7] = &v8;
  dispatch_async_and_wait(preferencesWorkloop, v7);
  id v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)addObserver:(id)a3
{
  preferencesWorkloop = self->_preferencesWorkloop;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__SUPreferences_addObserver___block_invoke;
  v4[3] = &unk_26447F090;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async_and_wait(preferencesWorkloop, v4);
}

- (NSHashTable)observers
{
  return self->_observers;
}

+ (SUPreferences)sharedInstance
{
  if (sharedInstance_pred_4 != -1) {
    dispatch_once(&sharedInstance_pred_4, &__block_literal_global_21);
  }
  return (SUPreferences *)sharedInstance___instance_10;
}

uint64_t __45__SUPreferences__cachedObjectForKey_ofClass___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 24) valueForKey:a1[5]];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t result = objc_opt_isKindOfClass();
    if (result) {
      *(void *)(*(void *)(a1[7] + 8) + 40) = v3;
    }
  }
  return result;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SUPreferencesChangedNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)SUPreferences;
  [(SUPreferences *)&v4 dealloc];
}

uint64_t __29__SUPreferences_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) observers];
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 addObject:v3];
}

- (void)removeObserver:(id)a3
{
  preferencesWorkloop = self->_preferencesWorkloop;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__SUPreferences_removeObserver___block_invoke;
  v4[3] = &unk_26447F090;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async_and_wait(preferencesWorkloop, v4);
}

uint64_t __32__SUPreferences_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) observers];
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 removeObject:v3];
}

- (void)preference:(id)a3 didChangeTo:(id)a4
{
  preferencesWorkloop = self->_preferencesWorkloop;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__SUPreferences_preference_didChangeTo___block_invoke;
  block[3] = &unk_26447F0B8;
  block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  dispatch_async(preferencesWorkloop, block);
}

uint64_t __40__SUPreferences_preference_didChangeTo___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 preferences:*(void *)(a1 + 32) didChangePreference:*(void *)(a1 + 40) toValue:*(void *)(a1 + 48)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)disableManagedRequest
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUDisableManagedRequest" withDefaultValue:0];
}

- (BOOL)disableUserWiFiOnlyPeriod
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUDisableUserWiFiOnlyPeriod" withDefaultValue:0];
}

- (BOOL)disableBuildNumberComparison
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUDisableBuildNumberComparison" withDefaultValue:0];
}

- (BOOL)allowSameBuildUpdates
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUAllowSameBuildUpdates" withDefaultValue:0];
}

- (BOOL)disableAvailabilityAlerts
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUDisableAvailabilityAlerts" withDefaultValue:0];
}

- (BOOL)scanWeeklyInternally
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUScanWeeklyInternally" withDefaultValue:0];
}

- (NSNumber)autoDownloadOverrideInterval
{
  return (NSNumber *)[(SUPreferences *)self _cachedNumberValueForKey:@"SUAutoDownloadOverrideInterval"];
}

- (BOOL)forceFullReplacement
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUForceFullReplacement" withDefaultValue:0];
}

- (BOOL)disableFullReplacementFallback
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUDisbaleFullReplacementFallback" withDefaultValue:0];
}

- (BOOL)shouldDelayUpdates
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUShouldDelayUpdates" withDefaultValue:0];
}

- (NSNumber)updateDelayInterval
{
  return (NSNumber *)[(SUPreferences *)self _cachedNumberValueForKey:@"SUUpdateDelayInterval"];
}

- (BOOL)shouldDelayInMinutes
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUDelayInMinutes" withDefaultValue:0];
}

- (NSNumber)unmetConstraints
{
  return (NSNumber *)[(SUPreferences *)self _cachedNumberValueForKey:@"SUUnmetConstraints"];
}

- (BOOL)allowSplatUpdate
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUAllowSplatUpdate" withDefaultValue:1];
}

- (BOOL)fakeSplatInstalled
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUFakeSplatInstalled" withDefaultValue:0];
}

- (BOOL)allowSameRestoreVersionSplatUpdate
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUAllowSameSplatUpdate" withDefaultValue:0];
}

- (BOOL)autoInstallSystemDataFilesForceOn
{
  BOOL v9 = [(SUPreferences *)self _cachedBoolValueForKey:@"SUAutoInstallSystemDataFilesForceOn" withDefaultValue:0];
  if (v9) {
    SULogInfo(@"%s: %@ is ON", v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUPreferences autoInstallSystemDataFilesForceOn]");
  }
  return v9;
}

- (BOOL)autoInstallSystemDataFilesForceOff
{
  BOOL v9 = [(SUPreferences *)self _cachedBoolValueForKey:@"SUAutoInstallSystemDataFilesForceOff" withDefaultValue:0];
  if (v9) {
    SULogInfo(@"%s: %@ is OFF", v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUPreferences autoInstallSystemDataFilesForceOff]");
  }
  return v9;
}

- (BOOL)autoInstallSystemAndDataFiles
{
  BOOL v3 = [(SUPreferences *)self _autoInstallSystemDataFilesDefaultValue];
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUAutoInstallSystemDataFiles" withDefaultValue:v3];
}

- (BOOL)autoInstallSecurityResponseForceOn
{
  BOOL v9 = [(SUPreferences *)self _cachedBoolValueForKey:@"SUAutoInstallSecurityResponseForceOn" withDefaultValue:0];
  if (v9) {
    SULogInfo(@"%s: %@ is ON", v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUPreferences autoInstallSecurityResponseForceOn]");
  }
  return v9;
}

- (BOOL)autoInstallSecurityResponseForceOff
{
  BOOL v9 = [(SUPreferences *)self _cachedBoolValueForKey:@"SUAutoInstallSecurityResponseForceOff" withDefaultValue:0];
  if (v9) {
    SULogInfo(@"%s: %@ is OFF", v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUPreferences autoInstallSecurityResponseForceOff]");
  }
  return v9;
}

- (BOOL)autoInstallSecurityResponse
{
  BOOL v3 = [(SUPreferences *)self _autoInstallSecurityResponseDefaultValue];
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUAutoInstallSecurityResponse" withDefaultValue:v3];
}

- (BOOL)previousUserSpecifiedAutoInstallSecurityResponse
{
  BOOL v3 = [(SUPreferences *)self _autoInstallSecurityResponseDefaultValue];
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUAutoInstallSecurityResponse_prev" withDefaultValue:v3];
}

- (NSNumber)splatScanInterval
{
  return (NSNumber *)[(SUPreferences *)self _cachedNumberValueForKey:@"SUSplatScanInterval"];
}

- (NSString)requestedPMV
{
  return (NSString *)[(SUPreferences *)self _cachedStringValueForKey:@"SURequestedPMV"];
}

- (NSNumber)autoSUStartDelta
{
  return (NSNumber *)[(SUPreferences *)self _cachedNumberValueForKey:@"SUAutoSUStartDelta"];
}

- (NSNumber)autoSUEndDelta
{
  return (NSNumber *)[(SUPreferences *)self _cachedNumberValueForKey:@"SUAutoSUEndDelta"];
}

- (NSNumber)autoSUUnlockStartDelta
{
  return (NSNumber *)[(SUPreferences *)self _cachedNumberValueForKey:@"SUAutoSUUnlockStartDelta"];
}

- (NSNumber)autoSUUnlockEndDelta
{
  return (NSNumber *)[(SUPreferences *)self _cachedNumberValueForKey:@"SUAutoSUUnlockEndDelta"];
}

- (BOOL)autoUpdateForceOn
{
  BOOL v9 = [(SUPreferences *)self _cachedBoolValueForKey:@"SUAutoUpdateForceOn" withDefaultValue:0];
  if (v9) {
    SULogInfo(@"%s: %@ is ON", v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUPreferences autoUpdateForceOn]");
  }
  return v9;
}

- (BOOL)autoUpdateForceOff
{
  BOOL v9 = [(SUPreferences *)self _cachedBoolValueForKey:@"SUAutoUpdateForceOff" withDefaultValue:0];
  if (v9) {
    SULogInfo(@"%s: %@ is OFF", v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUPreferences autoUpdateForceOff]");
  }
  return v9;
}

- (BOOL)isAutomaticUpdateV2Enabled
{
  BOOL v3 = [(SUPreferences *)self _autoInstallDefaultValue];
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUAutomaticUpdateV2Enabled" withDefaultValue:v3];
}

- (BOOL)previousUserSpecifiedAutomaticUpdateV2Enabled
{
  BOOL v3 = [(SUPreferences *)self _autoInstallDefaultValue];
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUAutomaticUpdateV2Enabled_prev" withDefaultValue:v3];
}

- (NSNumber)bannerDelay
{
  return (NSNumber *)[(SUPreferences *)self _cachedNumberValueForKey:@"SUBannerDelay"];
}

- (BOOL)autoDownloadDeletedBuild
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUAutoDownloadDeletedBuild" withDefaultValue:0];
}

- (NSNumber)MDMSoftwareUpdatePath
{
  return (NSNumber *)[(SUPreferences *)self _cachedNumberValueForKey:@"SUMDMSoftwareUpdatePath"];
}

- (NSNumber)analyticsSubmissionIntervalOverride
{
  return (NSNumber *)[(SUPreferences *)self _cachedNumberValueForKey:@"SUAnalyticsSubmissionInterval"];
}

- (BOOL)queryCustomerBuilds
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUQueryCustomerBuilds" withDefaultValue:0];
}

- (BOOL)disableRollback
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUDisableRollback" withDefaultValue:0];
}

- (NSString)suggestedRollbackSplatVersion
{
  return (NSString *)[(SUPreferences *)self _cachedStringValueForKey:@"SUPreferencesSuggestedRollbackSplatVersion"];
}

- (void)setSuggestedRollbackSplatVersion:(id)a3
{
}

- (BOOL)useEmptyPatches
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUUseEmptyPatches" withDefaultValue:0];
}

- (BOOL)disablePurgeOnNewerUpdateFound
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUDisablePurgeOnNewerUpdateFound" withDefaultValue:0];
}

- (id)_mandatorySUFlagsForPreferences
{
  v18[4] = *MEMORY[0x263EF8340];
  v17[0] = @"SUUpdateRequiredFromFactory";
  v18[0] = [NSNumber numberWithUnsignedInteger:1];
  v17[1] = @"SUCheckForUpdateFromFactory";
  v18[1] = [NSNumber numberWithUnsignedInteger:2];
  v17[2] = @"SUUpdateRequiredOnErase";
  v18[2] = [NSNumber numberWithUnsignedInteger:4];
  v17[3] = @"SUCheckForUpdateOnErase";
  v18[3] = [NSNumber numberWithUnsignedInteger:8];
  BOOL v3 = (void *)[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if ([(SUPreferences *)self _getBooleanPreferenceForKey:v10 withDefaultValue:0])
        {
          v7 |= objc_msgSend((id)objc_msgSend(v3, "objectForKey:", v10), "unsignedIntegerValue");
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return (id)[NSNumber numberWithUnsignedInteger:v7];
}

- (id)_cachedStringValueForKey:(id)a3
{
  uint64_t v5 = objc_opt_class();
  return [(SUPreferences *)self _cachedObjectForKey:a3 ofClass:v5];
}

- (id)_cachedNumberValueForKey:(id)a3
{
  uint64_t v5 = objc_opt_class();
  return [(SUPreferences *)self _cachedObjectForKey:a3 ofClass:v5];
}

- (id)_cachedDictValueForKey:(id)a3
{
  uint64_t v5 = objc_opt_class();
  return [(SUPreferences *)self _cachedObjectForKey:a3 ofClass:v5];
}

- (void)_setBooleanPreferenceForKey:(id)a3 value:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  }
  else {
    uint64_t v4 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFStringRef v5 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPreferencesSetValue((CFStringRef)a3, *v4, @"com.apple.softwareupdateservicesd", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
  CFPreferencesSynchronize(@"com.apple.softwareupdateservicesd", @"mobile", v5);
  SULogDebug(@"%s: posting change notification... Key: %@ enabled: %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUPreferences _setBooleanPreferenceForKey:value:]");
  long long v13 = (const char *)[@"SUPreferencesChangedNotification" UTF8String];
  notify_post(v13);
}

- (void)_setObjectPreferenceForKey:(id)a3 value:(id)a4
{
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPreferencesSetValue((CFStringRef)a3, a4, @"com.apple.softwareupdateservicesd", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
  CFPreferencesSynchronize(@"com.apple.softwareupdateservicesd", @"mobile", v4);
  SULogDebug(@"%s: posting change notification... Key: %@: Value: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUPreferences _setObjectPreferenceForKey:value:]");
  uint64_t v12 = (const char *)[@"SUPreferencesChangedNotification" UTF8String];
  notify_post(v12);
}

- (id)_copyStringPreferenceForKey:(id)a3
{
  CFTypeID TypeID = CFStringGetTypeID();
  return [(SUPreferences *)self _copyPreferenceForKey:a3 ofType:TypeID];
}

- (id)_copyNumberPreferenceForKey:(id)a3
{
  CFTypeID TypeID = CFNumberGetTypeID();
  return [(SUPreferences *)self _copyPreferenceForKey:a3 ofType:TypeID];
}

- (id)_copyDictPreferenceForKey:(id)a3
{
  CFTypeID TypeID = CFDictionaryGetTypeID();
  return [(SUPreferences *)self _copyPreferenceForKey:a3 ofType:TypeID];
}

- (void)enableAutomaticUpdateV2:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SUPreferences *)self isAutomaticUpdateV2Enabled] != a3)
  {
    if (v3 && [(SUPreferences *)self disableAutoDownload])
    {
      SULogInfo(@"Unable to enabled auto update while auto download is disabled", v5, v6, v7, v8, v9, v10, v11, v14);
    }
    else
    {
      [(SUPreferences *)self _setCachedBooleanPreferenceForKey:@"SUAutomaticUpdateV2Enabled" value:v3];
      [(SUPreferences *)self _setBooleanPreferenceForKey:@"SUAutomaticUpdateV2Enabled" value:v3];
      uint64_t v12 = (const char *)[@"SUPreferencesChangedNotificationAutoUpdate" UTF8String];
      notify_post(v12);
    }
  }
}

- (void)enablePreviousUserSpecifiedAutomaticUpdateV2:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SUPreferences *)self previousUserSpecifiedAutomaticUpdateV2Enabled] != a3)
  {
    if (v3 && [(SUPreferences *)self disableAutoDownload])
    {
      SULogInfo(@"Unable to enabled auto update while auto download is disabled", v5, v6, v7, v8, v9, v10, v11, v13);
    }
    else
    {
      [(SUPreferences *)self _setCachedBooleanPreferenceForKey:@"SUAutomaticUpdateV2Enabled_prev" value:v3];
      [(SUPreferences *)self _setBooleanPreferenceForKey:@"SUAutomaticUpdateV2Enabled_prev" value:v3];
    }
  }
}

- (void)enableAutoInstallSystemAndDataFiles:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SUPreferences *)self autoInstallSystemAndDataFiles] != a3)
  {
    uint64_t v12 = @"disabled";
    if (v3) {
      uint64_t v12 = @"enabled";
    }
    SULogInfo(@"Setting auto install system and data files to %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v12);
    [(SUPreferences *)self _setCachedBooleanPreferenceForKey:@"SUAutoInstallSystemDataFiles" value:v3];
    [(SUPreferences *)self _setBooleanPreferenceForKey:@"SUAutoInstallSystemDataFiles" value:v3];
  }
}

- (void)enableAutoInstallSecurityResponse:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SUPreferences *)self autoInstallSecurityResponse] != a3)
  {
    uint64_t v12 = @"disabled";
    if (v3) {
      uint64_t v12 = @"enabled";
    }
    SULogInfo(@"Setting auto install Rapid Security Response to %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v12);
    [(SUPreferences *)self _setCachedBooleanPreferenceForKey:@"SUAutoInstallSecurityResponse" value:v3];
    [(SUPreferences *)self _setBooleanPreferenceForKey:@"SUAutoInstallSecurityResponse" value:v3];
  }
}

- (void)enablePreviousUserSpecifiedAutoInstallSecurityResponse:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SUPreferences *)self previousUserSpecifiedAutoInstallSecurityResponse] != a3)
  {
    uint64_t v12 = @"disabled";
    if (v3) {
      uint64_t v12 = @"enabled";
    }
    SULogInfo(@"Setting auto install Rapid Security Response (previous user specified) to %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v12);
    [(SUPreferences *)self _setCachedBooleanPreferenceForKey:@"SUAutoInstallSecurityResponse_prev" value:v3];
    [(SUPreferences *)self _setBooleanPreferenceForKey:@"SUAutoInstallSecurityResponse_prev" value:v3];
  }
}

- (BOOL)isAutomaticDownloadEnabled
{
  return ![(SUPreferences *)self disableAutoDownload];
}

- (BOOL)isAutoDownloadDisabled
{
  return ![(SUPreferences *)self isAutomaticDownloadEnabled];
}

- (void)enableAutomaticDownload:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SUPreferences *)self isAutomaticDownloadEnabled] != a3)
  {
    [(SUPreferences *)self _setCachedBooleanPreferenceForKey:@"SUDisableAutoDownload" value:!v3];
    [(SUPreferences *)self _setBooleanPreferenceForKey:@"SUDisableAutoDownload" value:!v3];
    if (!v3)
    {
      [(SUPreferences *)self _setCachedBooleanPreferenceForKey:@"SUAutomaticUpdateV2Enabled" value:0];
      [(SUPreferences *)self _setBooleanPreferenceForKey:@"SUAutomaticUpdateV2Enabled" value:0];
      uint64_t v5 = (const char *)[@"SUPreferencesChangedNotificationAutoUpdate" UTF8String];
      notify_post(v5);
    }
  }
}

- (BOOL)_autoInstallDefaultValue
{
  if ([(SUPreferences *)self isChinaDevice])
  {
    SULogDebug(@"Defaulting to Auto Install OFF for green tea", v3, v4, v5, v6, v7, v8, v9, v11);
    return 0;
  }
  else
  {
    return [(SUPreferences *)self isAutomaticDownloadEnabled];
  }
}

- (BOOL)_autoInstallSystemDataFilesDefaultValue
{
  return 1;
}

- (BOOL)_autoInstallSecurityResponseDefaultValue
{
  BOOL v3 = [(SUPreferences *)self autoInstallSystemAndDataFiles];
  if (![(SUPreferences *)self isChinaDevice]) {
    return v3;
  }
  return [(SUPreferences *)self isAutomaticUpdateV2Enabled];
}

- (BOOL)ignoreBatteryInfo
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUIgnoreBatteryInfo" withDefaultValue:0];
}

- (BOOL)customerPowerPolicies
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUCustomerPowerPolicies" withDefaultValue:0];
}

- (NSNumber)batteryOverridePluggedIn
{
  return (NSNumber *)[(SUPreferences *)self _cachedNumberValueForKey:@"SUBatteryInfoOverridePluggedIn"];
}

- (NSNumber)batteryOverrideWirelessCharging
{
  return (NSNumber *)[(SUPreferences *)self _cachedNumberValueForKey:@"SUBatteryInfoOverrideWirelessCharging"];
}

- (NSNumber)batteryLevelOverride
{
  return (NSNumber *)[(SUPreferences *)self _cachedNumberValueForKey:@"SUBatteryLevelOverride"];
}

- (NSNumber)recommendedUpdateInterval
{
  return (NSNumber *)[(SUPreferences *)self _cachedNumberValueForKey:@"SURecommendedUpdateInterval"];
}

- (BOOL)useSUCoreXPCActivityScheduler
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUUseXPCActivityScheduler" withDefaultValue:0];
}

- (NSNumber)networkMonitorOverride
{
  return (NSNumber *)[(SUPreferences *)self _cachedNumberValueForKey:@"SUNetworkMonitorOverride"];
}

- (BOOL)skipDownload
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUSkipDownload" withDefaultValue:0];
}

- (BOOL)skipApply
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUSkipApply" withDefaultValue:0];
}

- (BOOL)suppressSSOTokenInInstall
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUSuppressSSOTokenInInstall" withDefaultValue:0];
}

- (BOOL)suppressSSOTokenInDownload
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUSuppressSSOTokenInDownload" withDefaultValue:0];
}

- (NSNumber)keybagState
{
  return (NSNumber *)[(SUPreferences *)self _cachedNumberValueForKey:@"SUKeybagState"];
}

- (BOOL)buddyInitiatedScan
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUBuddyInitiatedScan" withDefaultValue:0];
}

- (BOOL)haveEnoughSpace
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUHaveEnoughSpace" withDefaultValue:1];
}

- (BOOL)spacePurgeSuccessful
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUSpacePurgeSuccessful" withDefaultValue:1];
}

- (NSNumber)spacePurgeTime
{
  return (NSNumber *)[(SUPreferences *)self _cachedNumberValueForKey:@"SUSpacePurgeTime"];
}

- (BOOL)bypassSystemRootWarning
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUBypassSystemRootWarning" withDefaultValue:0];
}

- (BOOL)disableAutoDownloadJitter
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUDisableAutoDownloadJitter" withDefaultValue:0];
}

- (BOOL)fakeAppOffload
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUFakeAppOffload" withDefaultValue:0];
}

- (BOOL)disableAutoInstallJitter
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUDisableAutoInstallJitter" withDefaultValue:0];
}

- (NSNumber)autoInstallRetryDelay
{
  return (NSNumber *)[(SUPreferences *)self _cachedNumberValueForKey:@"SUAutoInstallRetryDelay"];
}

- (BOOL)overrideRamping
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUOverrideRamping" withDefaultValue:0];
}

- (BOOL)overrideGranularRamping
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUOverrideGranularRamping" withDefaultValue:0];
}

- (NSString)overrideScanSessionIDRampingPortion
{
  return (NSString *)[(SUPreferences *)self _cachedStringValueForKey:@"SUOverrideScanSessionIDRampingPortion"];
}

- (BOOL)overrideAllowAutoDownloadOnBattery
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUOverrideAllowAutoDownloadOnBattery" withDefaultValue:0];
}

- (NSNumber)overrideAutoDownloadOnBatteryDelay
{
  return (NSNumber *)[(SUPreferences *)self _cachedNumberValueForKey:@"SUOverrideAutoDownloadOnBatteryDelay"];
}

- (BOOL)disableSplombo
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUDisableSplombo" withDefaultValue:0];
}

- (BOOL)fakeInstallFailure
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUFakeInstallFailure" withDefaultValue:0];
}

- (NSString)overrideSplatComboBuildVersion
{
  return (NSString *)[(SUPreferences *)self _cachedStringValueForKey:@"SUOverrideSplatComboBuildVersion"];
}

- (BOOL)disableFollowUps
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUDisableFollowUps" withDefaultValue:0];
}

- (BOOL)enablePreSUStaging
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUEnablePreSuStaging" withDefaultValue:1];
}

- (BOOL)enablePreSUStagingForOptionalAssets
{
  return [(SUPreferences *)self _cachedBoolValueForKey:@"SUEnablePreSuStagingForOptionalAssets" withDefaultValue:1];
}

- (NSString)ssoUsernameForPersonalization
{
  return (NSString *)[(SUPreferences *)self _cachedStringValueForKey:@"SUSSOUsernameForPersonalization"];
}

- (NSString)ssoTokenForPersonalization
{
  return (NSString *)[(SUPreferences *)self _cachedStringValueForKey:@"SUSSOTokenForPersonalization"];
}

- (NSDictionary)overrideCarrierDownloadPolicyProperties
{
  return (NSDictionary *)[(SUPreferences *)self _cachedDictValueForKey:@"SUOverrideCarrierDownloadPolicyProperties"];
}

- (NSDictionary)preferencesDefinitions
{
  return &self->_preferencesDefinitions->super;
}

- (void)setPreferencesDefinitions:(id)a3
{
}

- (NSMutableDictionary)cachedPreferences
{
  return self->_cachedPreferences;
}

- (void)setCachedPreferences:(id)a3
{
}

- (BOOL)backgroundDLKnownBuilds
{
  return self->_backgroundDLKnownBuilds;
}

- (BOOL)isAutoSUDisabled
{
  return self->_disableAutoSU;
}

- (BOOL)previousUserSpecifiedAutoDownload
{
  return self->_previousUserSpecifiedAutoDownload;
}

- (void)enablePreviousUserSpecifiedAutoDownload:(BOOL)a3
{
  self->_previousUserSpecifiedAutoDownload = a3;
}

- (void)setObservers:(id)a3
{
}

@end
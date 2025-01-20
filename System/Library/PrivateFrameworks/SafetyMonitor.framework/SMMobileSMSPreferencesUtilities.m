@interface SMMobileSMSPreferencesUtilities
+ (BOOL)hasUserCompletedOnboarding;
+ (BOOL)isLockScreenSuggestionsAllowed;
+ (BOOL)isMobileSMSPreferencesLockScreenSuggestionsAllowed;
+ (BOOL)isUserOnBoardedForCriticalAlert;
+ (BOOL)shareAllLocations;
+ (id)_copyDuetExpertPreferencesValueForKey:(id)a3;
+ (id)_copyMobileSMSPreferencesValueForKey:(id)a3;
+ (id)_criticalAlertPreference;
+ (id)duetExpertStore;
+ (id)legacyStore;
+ (id)store;
+ (int64_t)criticalAlertPreference;
+ (void)_setHasUserCompletedOnboarding:(id)a3;
+ (void)_setMobileSMSPreferencesValue:(id)a3 forKey:(id)a4;
+ (void)_setShareAllLocations:(id)a3;
+ (void)_syncSiriLockScreenSuggestionsPrefIfNeeded;
+ (void)_syncSiriLockScreenSuggestionsPrefWithValue:(BOOL)a3;
+ (void)clearCriticalAlertUserPreference;
+ (void)clearHasUserCompletedOnboarding;
+ (void)clearShareAllLocations;
+ (void)migrateIfNeeded;
+ (void)setCriticalAlertPreference:(int64_t)a3;
+ (void)setHasUserCompletedOnboarding:(BOOL)a3;
+ (void)setShareAllLocations:(BOOL)a3;
+ (void)syncSiriLockScreenSuggestionsPrefs;
@end

@implementation SMMobileSMSPreferencesUtilities

+ (id)store
{
  if (qword_26B349908 != -1) {
    dispatch_once(&qword_26B349908, &__block_literal_global_0);
  }
  v2 = (void *)_MergedGlobals_12;
  return v2;
}

uint64_t __40__SMMobileSMSPreferencesUtilities_store__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08C40]) initWithStoreIdentifier:@"com.apple.MobileSMS" type:0];
  v1 = (void *)_MergedGlobals_12;
  _MergedGlobals_12 = v0;

  v2 = (void *)_MergedGlobals_12;
  return [v2 synchronize];
}

+ (id)legacyStore
{
  if (qword_26B349918 != -1) {
    dispatch_once(&qword_26B349918, &__block_literal_global_30);
  }
  v2 = (void *)qword_26B349910;
  return v2;
}

uint64_t __46__SMMobileSMSPreferencesUtilities_legacyStore__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 bundleIdentifier];
  int v2 = [v1 isEqualToString:@"com.apple.MobileSMS"];

  id v3 = objc_alloc(MEMORY[0x263EFFA40]);
  if (v2) {
    v4 = 0;
  }
  else {
    v4 = @"com.apple.MobileSMS";
  }
  qword_26B349910 = [v3 initWithSuiteName:v4];
  return MEMORY[0x270F9A758]();
}

+ (id)duetExpertStore
{
  if (qword_26B349928 != -1) {
    dispatch_once(&qword_26B349928, &__block_literal_global_34);
  }
  int v2 = (void *)qword_26B349920;
  return v2;
}

uint64_t __50__SMMobileSMSPreferencesUtilities_duetExpertStore__block_invoke()
{
  qword_26B349920 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.duetexpertd"];
  return MEMORY[0x270F9A758]();
}

+ (void)migrateIfNeeded
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  [a1 _syncSiriLockScreenSuggestionsPrefIfNeeded];
  id v3 = [a1 legacyStore];
  v4 = [v3 objectForKey:@"SafetyMonitorFirstTimeUI"];

  v5 = [a1 legacyStore];
  v6 = [v5 objectForKey:@"SafetyMonitorUseCriticalAlerts"];

  v7 = [a1 legacyStore];
  v8 = [v7 objectForKey:@"SafetyMonitorShareAllLocations"];

  if (v4 || v6 || v8)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      int v21 = 138412290;
      v22 = v11;
      _os_log_impl(&dword_25B6E0000, v9, OS_LOG_TYPE_INFO, "%@, migrating legacy preferences", (uint8_t *)&v21, 0xCu);
    }
    v12 = [a1 store];
    v13 = [v12 objectForKey:@"SafetyMonitorFirstTimeUI"];

    if (!v13) {
      [a1 _setMobileSMSPreferencesValue:v4 forKey:@"SafetyMonitorFirstTimeUI"];
    }
    v14 = [a1 store];
    v15 = [v14 objectForKey:@"SafetyMonitorUseCriticalAlerts"];

    if (!v15) {
      [a1 _setMobileSMSPreferencesValue:v6 forKey:@"SafetyMonitorUseCriticalAlerts"];
    }
    v16 = [a1 store];
    v17 = [v16 objectForKey:@"SafetyMonitorShareAllLocations"];

    if (!v17) {
      [a1 _setMobileSMSPreferencesValue:v8 forKey:@"SafetyMonitorShareAllLocations"];
    }
    v18 = [a1 legacyStore];
    [v18 removeObjectForKey:@"SafetyMonitorFirstTimeUI"];

    v19 = [a1 legacyStore];
    [v19 removeObjectForKey:@"SafetyMonitorUseCriticalAlerts"];

    v20 = [a1 legacyStore];
    [v20 removeObjectForKey:@"SafetyMonitorShareAllLocations"];
  }
}

+ (void)_syncSiriLockScreenSuggestionsPrefIfNeeded
{
  uint64_t v3 = [a1 isLockScreenSuggestionsAllowed];
  if (v3 != [a1 isMobileSMSPreferencesLockScreenSuggestionsAllowed])
  {
    [a1 _syncSiriLockScreenSuggestionsPrefWithValue:v3];
  }
}

+ (void)_syncSiriLockScreenSuggestionsPrefWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (const void *)MGCopyAnswer();
  CFTypeRef v6 = CFAutorelease(v5);
  if (CFEqual(v6, @"iPhone"))
  {
    id v7 = [NSNumber numberWithBool:v3];
    [a1 _setMobileSMSPreferencesValue:v7 forKey:@"SafetyMonitorLockscreenSuggestionsEnabledWatch"];
  }
}

+ (void)syncSiriLockScreenSuggestionsPrefs
{
  uint64_t v3 = [a1 isLockScreenSuggestionsAllowed];
  [a1 _syncSiriLockScreenSuggestionsPrefWithValue:v3];
}

+ (id)_copyMobileSMSPreferencesValueForKey:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 store];
  CFTypeRef v6 = [v5 objectForKey:v4];

  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    int v11 = 138412802;
    v12 = v9;
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_25B6E0000, v7, OS_LOG_TYPE_INFO, "%@, getting preference %@ value: %@", (uint8_t *)&v11, 0x20u);
  }
  return v6;
}

+ (id)_copyDuetExpertPreferencesValueForKey:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 duetExpertStore];
  CFTypeRef v6 = [v5 objectForKey:v4];

  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    int v11 = 138412802;
    v12 = v9;
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_25B6E0000, v7, OS_LOG_TYPE_INFO, "%@, getting preference %@ value: %@", (uint8_t *)&v11, 0x20u);
  }
  return v6;
}

+ (void)_setMobileSMSPreferencesValue:(id)a3 forKey:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    int v12 = 138412802;
    __int16 v13 = v10;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_25B6E0000, v8, OS_LOG_TYPE_INFO, "%@, setting preference %@ to %@", (uint8_t *)&v12, 0x20u);
  }
  int v11 = [a1 store];
  [v11 setObject:v6 forKey:v7];
}

+ (BOOL)hasUserCompletedOnboarding
{
  int v2 = (void *)[a1 _copyMobileSMSPreferencesValueForKey:@"SafetyMonitorFirstTimeUI"];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (void)setHasUserCompletedOnboarding:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [a1 _setHasUserCompletedOnboarding:v4];
}

+ (void)clearHasUserCompletedOnboarding
{
}

+ (void)_setHasUserCompletedOnboarding:(id)a3
{
}

+ (BOOL)shareAllLocations
{
  int v2 = (void *)[a1 _copyMobileSMSPreferencesValueForKey:@"SafetyMonitorShareAllLocations"];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

+ (void)setShareAllLocations:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [a1 _setShareAllLocations:v4];
}

+ (void)clearShareAllLocations
{
}

+ (void)_setShareAllLocations:(id)a3
{
  [a1 _setMobileSMSPreferencesValue:a3 forKey:@"SafetyMonitorShareAllLocations"];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SMShareAllLocationsChangedNotification", 0, 0, 1u);
}

+ (BOOL)isUserOnBoardedForCriticalAlert
{
  int v2 = [a1 _criticalAlertPreference];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (int64_t)criticalAlertPreference
{
  int v2 = [a1 _criticalAlertPreference];
  BOOL v3 = v2;
  if (v2)
  {
    if ([v2 BOOLValue]) {
      int64_t v4 = 1;
    }
    else {
      int64_t v4 = 2;
    }
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (id)_criticalAlertPreference
{
  int v2 = (void *)[a1 _copyMobileSMSPreferencesValueForKey:@"SafetyMonitorUseCriticalAlerts"];
  return v2;
}

+ (void)setCriticalAlertPreference:(int64_t)a3
{
  if (a3)
  {
    uint64_t v4 = [NSNumber numberWithInt:a3 == 1];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v6 = (id)v4;
  [a1 _setMobileSMSPreferencesValue:v4 forKey:@"SafetyMonitorUseCriticalAlerts"];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.SafetyMonitorUseCriticalAlerts.changed", 0, 0, 1u);
}

+ (void)clearCriticalAlertUserPreference
{
}

+ (BOOL)isMobileSMSPreferencesLockScreenSuggestionsAllowed
{
  int v2 = (void *)[a1 _copyMobileSMSPreferencesValueForKey:@"SafetyMonitorLockscreenSuggestionsEnabledWatch"];
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

+ (BOOL)isLockScreenSuggestionsAllowed
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)CFPreferencesCopyAppValue(@"LockscreenSuggestionsDisabledBundles", @"com.apple.duetexpertd");
  int v4 = [v3 containsObject:@"com.apple.MobileSMS"];

  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"LockScreenSuggestionsDisabled", @"com.apple.lockscreen.shared", &keyExistsAndHasValidFormat);
  int v6 = keyExistsAndHasValidFormat;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(a2);
    int v11 = (void *)v10;
    int v12 = @"YES";
    *(_DWORD *)buf = 138413314;
    v20 = v9;
    if (v4) {
      __int16 v13 = @"NO";
    }
    else {
      __int16 v13 = @"YES";
    }
    if (AppBooleanValue) {
      __int16 v14 = @"NO";
    }
    else {
      __int16 v14 = @"YES";
    }
    __int16 v21 = 2112;
    uint64_t v22 = v10;
    if (!keyExistsAndHasValidFormat) {
      int v12 = @"NO";
    }
    __int16 v23 = 2112;
    v24 = v13;
    __int16 v25 = 2112;
    v26 = v14;
    __int16 v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_25B6E0000, v7, OS_LOG_TYPE_INFO, "%@, %@, MobileSMSSuggestionsEnabled, %@, globalSiriSuggestionsEnabled, %@, globalSiriSuggestionsEnabledQuerySuccess, %@", buf, 0x34u);
  }
  if (v6) {
    BOOL v15 = AppBooleanValue == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15) {
    char v16 = v4 ^ 1;
  }
  else {
    char v16 = 0;
  }

  return v16;
}

@end
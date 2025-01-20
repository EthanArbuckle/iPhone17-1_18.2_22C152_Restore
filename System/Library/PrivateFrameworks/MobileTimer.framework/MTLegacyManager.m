@interface MTLegacyManager
+ (id)_bundleIDForUNSchedule;
+ (id)_numberFromString:(id)a3;
+ (id)alarmFromOldAlarm:(id)a3;
+ (id)sharedManager;
+ (id)soundFromOldAlarm:(id)a3;
+ (unint64_t)repeatScheduleFromOldAlarm:(id)a3;
- (Alarm)sleepAlarm;
- (BOOL)_discardOldAlarms;
- (BOOL)_discardOldTimers;
- (BOOL)_discardOldVersion;
- (BOOL)_upgrade;
- (BOOL)_upgradeAlarms;
- (BOOL)_upgradeIfNeverAttempted;
- (BOOL)_upgradeTimers;
- (BOOL)loaded;
- (BOOL)purged;
- (MTLegacyManager)init;
- (NSArray)alarms;
- (NSArray)scheduledNotifications;
- (NSString)defaultSound;
- (OS_dispatch_queue)serializer;
- (UNUserNotificationCenter)notificationCenter;
- (double)defaultDuration;
- (id)_copyLegacyAlarmsFromPreferences;
- (id)_copyLegacySleepAlarmFromPreferences;
- (void)_cancelNotifications;
- (void)_loadAlarms;
- (void)_loadScheduledNotifications;
- (void)_loadTimerDefaults;
- (void)_loadUserPreferences;
- (void)_purgeAlarmsAndTimers;
- (void)_reconcileAlarmsAndNotifications;
- (void)_upgradeFromSpringboardDefaults;
- (void)cancelNotifications;
- (void)clearInvalidPendingNotifications;
- (void)loadLegacyData;
- (void)purgeLegacyData;
- (void)setAlarms:(id)a3;
- (void)setDefaultDuration:(double)a3;
- (void)setDefaultSound:(id)a3;
- (void)setLoaded:(BOOL)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setPurged:(BOOL)a3;
- (void)setScheduledNotifications:(id)a3;
- (void)setSerializer:(id)a3;
- (void)setSleepAlarm:(id)a3;
@end

@implementation MTLegacyManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_38);
  }
  v2 = (void *)sharedManager__manager;
  return v2;
}

uint64_t __32__MTLegacyManager_sharedManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedManager__manager;
  sharedManager__manager = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (MTLegacyManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTLegacyManager;
  v2 = [(MTLegacyManager *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MTLegacyManager", 0);
    serializer = v2->_serializer;
    v2->_serializer = (OS_dispatch_queue *)v3;

    id v5 = objc_alloc(MEMORY[0x1E4F44680]);
    v6 = [(id)objc_opt_class() _bundleIDForUNSchedule];
    uint64_t v7 = [v5 initWithBundleIdentifier:v6];
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (UNUserNotificationCenter *)v7;
  }
  return v2;
}

+ (id)_bundleIDForUNSchedule
{
  return @"com.apple.mobiletimer";
}

- (void)loadLegacyData
{
  serializer = self->_serializer;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__MTLegacyManager_loadLegacyData__block_invoke;
  block[3] = &unk_1E59150A8;
  block[4] = self;
  dispatch_sync(serializer, block);
}

uint64_t __33__MTLegacyManager_loadLegacyData__block_invoke(uint64_t result)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    v2 = MTLogForCategory(3);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(v1 + 32);
      int v4 = 138543362;
      uint64_t v5 = v3;
      _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ loading legacy data", (uint8_t *)&v4, 0xCu);
    }

    [*(id *)(v1 + 32) _loadUserPreferences];
    [*(id *)(v1 + 32) _loadScheduledNotifications];
    [*(id *)(v1 + 32) _upgradeFromSpringboardDefaults];
    [*(id *)(v1 + 32) _loadAlarms];
    [*(id *)(v1 + 32) _reconcileAlarmsAndNotifications];
    result = [*(id *)(v1 + 32) _loadTimerDefaults];
    *(unsigned char *)(*(void *)(v1 + 32) + 8) = 1;
  }
  return result;
}

- (void)_loadUserPreferences
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ loading user preferences", (uint8_t *)&v4, 0xCu);
  }

  CFPreferencesAppSynchronize(@"com.apple.mobiletimer");
}

- (void)_loadScheduledNotifications
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ loading scheduled notifications", buf, 0xCu);
  }

  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  notificationCenter = self->_notificationCenter;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __46__MTLegacyManager__loadScheduledNotifications__block_invoke;
  v12 = &unk_1E5917B98;
  v13 = self;
  uint64_t v6 = v4;
  v14 = v6;
  [(UNUserNotificationCenter *)notificationCenter getPendingNotificationRequestsWithCompletionHandler:&v9];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v7 = MTLogForCategory(3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v8 = [(NSArray *)self->_scheduledNotifications count];
    *(_DWORD *)buf = 138543618;
    v16 = self;
    __int16 v17 = 2048;
    NSUInteger v18 = v8;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ found %lu scheduled notifications", buf, 0x16u);
  }
}

void __46__MTLegacyManager__loadScheduledNotifications__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_upgradeFromSpringboardDefaults
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "void MTGSSendAppPreferencesChanged(CFStringRef, CFStringRef)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MTLegacyManager.m", 25, @"%s", dlerror());

  __break(1u);
}

- (BOOL)_upgradeIfNeverAttempted
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"UpgradeAttempted", @"com.apple.mobiletimer", &keyExistsAndHasValidFormat);
  BOOL v4 = 0;
  if (keyExistsAndHasValidFormat) {
    BOOL v5 = AppBooleanValue == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    CFPropertyListRef v6 = CFPreferencesCopyAppValue(@"SBCountdownTimerSoundIdentifier", @"com.apple.springboard");
    if (v6)
    {
      uint64_t v7 = v6;
      BOOL v4 = [(MTLegacyManager *)self _upgrade];
      CFRelease(v7);
    }
    else
    {
      CFPreferencesSetAppValue(@"UpgradeAttempted", (CFPropertyListRef)*MEMORY[0x1E4F1CFD0], @"com.apple.mobiletimer");
      return 1;
    }
  }
  return v4;
}

- (BOOL)_upgrade
{
  CFPreferencesSetAppValue(@"UpgradeAttempted", (CFPropertyListRef)*MEMORY[0x1E4F1CFD0], @"com.apple.mobiletimer");
  BOOL v3 = [(MTLegacyManager *)self _upgradeAlarms];
  return v3 | [(MTLegacyManager *)self _upgradeTimers];
}

- (BOOL)_upgradeAlarms
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  BOOL v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v35 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ upgrading alarms", buf, 0xCu);
  }

  BOOL v4 = (void *)CFPreferencesCopyAppValue(@"AlarmList", @"com.apple.springboard");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 count])
  {
    BOOL v5 = MTLogForCategory(3);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [v4 count];
      *(_DWORD *)buf = 138543618;
      v35 = self;
      __int16 v36 = 2048;
      uint64_t v37 = v6;
      _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ found %ld alarms to upgrade", buf, 0x16u);
    }

    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v27 = [(MTLegacyManager *)self _copyLegacyAlarmsFromPreferences];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v4;
    uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v13 = objc_alloc_init(Alarm);
          v14 = [v12 objectForKey:@"hour"];
          -[Alarm setHour:](v13, "setHour:", [v14 unsignedIntValue]);

          v15 = [v12 objectForKey:@"minute"];
          -[Alarm setMinute:](v13, "setMinute:", [v15 unsignedIntValue]);

          v16 = [v12 objectForKey:@"allows snooze"];
          -[Alarm setAllowsSnooze:](v13, "setAllowsSnooze:", [v16 BOOLValue]);

          __int16 v17 = [v12 objectForKey:@"sound path"];
          [(Alarm *)v13 setSound:v17 ofType:1];

          NSUInteger v18 = [v12 objectForKey:@"title"];
          [(Alarm *)v13 setTitle:v18];

          uint64_t v19 = [v12 objectForKey:@"setting"];
          -[Alarm setDaySetting:](v13, "setDaySetting:", [v19 unsignedIntValue]);

          id v20 = [(Alarm *)v13 alarmID];
          [(Alarm *)v13 markModified];
          v21 = [v12 objectForKey:@"active"];
          -[Alarm setForceActiveForMigration:](v13, "setForceActiveForMigration:", [v21 BOOLValue]);

          [v7 addObject:v13];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v9);
    }

    v22 = MTLogForCategory(3);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v35 = self;
      __int16 v36 = 2112;
      uint64_t v37 = (uint64_t)v7;
      _os_log_impl(&dword_19CC95000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Old alarms being upgraded: %@", buf, 0x16u);
    }

    v23 = MTLogForCategory(3);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v35 = self;
      __int16 v36 = 2112;
      uint64_t v37 = (uint64_t)v27;
      _os_log_impl(&dword_19CC95000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ New alarms already present: %@", buf, 0x16u);
    }

    [(NSArray *)v27 addObjectsFromArray:v7];
    [(NSArray *)v27 sortUsingSelector:sel_compareTime_];
    alarms = self->_alarms;
    self->_alarms = v27;

    BOOL v25 = 1;
  }
  else
  {
    uint64_t v7 = MTLogForCategory(3);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = self;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ No alarms found to upgrade", buf, 0xCu);
    }
    BOOL v25 = 0;
  }

  return v25;
}

- (BOOL)_upgradeTimers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ upgrading timer", buf, 0xCu);
  }

  CFArrayRef v4 = (const __CFArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"SBCountdownTimerSoundIdentifier", @"SBCountdownTimerTimeIdentifier", 0);
  CFDictionaryRef v5 = CFPreferencesCopyMultiple(v4, @"com.apple.springboard", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  uint64_t v6 = [(__CFDictionary *)v5 objectForKey:@"SBCountdownTimerSoundIdentifier"];
  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FAF5F0]);
    uint64_t v6 = [v7 defaultToneIdentifierForAlertType:14];
  }
  if ([v6 length])
  {
    CFPreferencesSetAppValue(@"timerSleepiPod", (CFPropertyListRef)*MEMORY[0x1E4F1CFC8], @"com.apple.mobiletimer");
    CFPreferencesSetAppValue(@"timerSound", v6, @"com.apple.mobiletimer");
    uint64_t v8 = MTLogForCategory(4);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v14 = self;
      __int16 v15 = 2112;
      v16 = v6;
      uint64_t v9 = "%{public}@ setting current sound: %@";
      uint64_t v10 = v8;
      uint32_t v11 = 22;
LABEL_10:
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }
  else
  {
    CFPreferencesSetAppValue(@"timerSleepiPod", (CFPropertyListRef)*MEMORY[0x1E4F1CFD0], @"com.apple.mobiletimer");
    uint64_t v8 = MTLogForCategory(4);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = self;
      uint64_t v9 = "%{public}@ setting current sound: Stop Playing";
      uint64_t v10 = v8;
      uint32_t v11 = 12;
      goto LABEL_10;
    }
  }

  return 1;
}

- (BOOL)_discardOldVersion
{
  BOOL v3 = [(MTLegacyManager *)self _discardOldAlarms];
  return [(MTLegacyManager *)self _discardOldTimers] || v3;
}

- (BOOL)_discardOldAlarms
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)CFPreferencesCopyAppValue(@"AlarmList", @"com.apple.springboard");
  if (v3)
  {
    CFArrayRef v4 = MTLogForCategory(3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = self;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing AlarmList", (uint8_t *)&v6, 0xCu);
    }

    CFPreferencesSetAppValue(@"AlarmList", 0, @"com.apple.springboard");
  }

  return v3 != 0;
}

- (BOOL)_discardOldTimers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CFArrayRef v3 = (const __CFArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"SBCountdownTimerSoundIdentifier", @"SBCountdownTimerTimeIdentifier", 0);
  CFDictionaryRef v4 = CFPreferencesCopyMultiple(v3, @"com.apple.springboard", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFDictionaryRef v5 = [(__CFDictionary *)v4 objectForKey:@"SBCountdownTimerSoundIdentifier"];
  if (v5)
  {
  }
  else
  {
    int v6 = [(__CFDictionary *)v4 objectForKey:@"SBCountdownTimerTimeIdentifier"];

    if (!v6)
    {
      BOOL v11 = 0;
      goto LABEL_13;
    }
  }
  id v7 = [(__CFDictionary *)v4 objectForKey:@"SBCountdownTimerSoundIdentifier"];

  if (v7)
  {
    CFPreferencesSetAppValue(@"SBCountdownTimerSoundIdentifier", 0, @"com.apple.springboard");
    uint64_t v8 = MTLogForCategory(4);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = self;
      _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing SBCountdownTimerSoundIdentifier", buf, 0xCu);
    }
  }
  uint64_t v9 = [(__CFDictionary *)v4 objectForKey:@"SBCountdownTimerTimeIdentifier"];

  if (v9)
  {
    CFPreferencesSetAppValue(@"SBCountdownTimerTimeIdentifier", 0, @"com.apple.springboard");
    uint64_t v10 = MTLogForCategory(4);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = self;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing SBCountdownTimerTimeIdentifier", buf, 0xCu);
    }
  }
  BOOL v11 = 1;
LABEL_13:

  return v11;
}

- (id)_copyLegacyAlarmsFromPreferences
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CFArrayRef v3 = (void *)CFPreferencesCopyAppValue(@"Alarms", @"com.apple.mobiletimer");
  CFDictionaryRef v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  CFDictionaryRef v5 = MTLogForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v22 = self;
    __int16 v23 = 2112;
    v24 = v3;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Reading alarms from preferences: %@", buf, 0x16u);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v17;
    *(void *)&long long v8 = 138543618;
    long long v15 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (+[Alarm verifySettings:](Alarm, "verifySettings:", v12, v15, (void)v16))
        {
          v13 = [[Alarm alloc] initWithSettings:v12];
          [v4 addObject:v13];
        }
        else
        {
          MTLogForCategory(3);
          v13 = (Alarm *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v15;
            v22 = self;
            __int16 v23 = 2112;
            v24 = v12;
            _os_log_impl(&dword_19CC95000, &v13->super, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalid alarm found in preferences :: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v4;
}

- (id)_copyLegacySleepAlarmFromPreferences
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CFArrayRef v3 = (void *)CFPreferencesCopyAppValue(@"SleepAlarm", @"com.apple.mobiletimer");
  CFDictionaryRef v4 = MTLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    long long v8 = self;
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Reading sleep alarm from preferences: %@", (uint8_t *)&v7, 0x16u);
  }

  if (+[Alarm verifySettings:v3]) {
    CFDictionaryRef v5 = [[Alarm alloc] initWithSettings:v3];
  }
  else {
    CFDictionaryRef v5 = 0;
  }

  return v5;
}

- (void)_loadAlarms
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  CFArrayRef v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    __int16 v9 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ loading alarms", (uint8_t *)&v8, 0xCu);
  }

  if (!self->_alarms)
  {
    CFDictionaryRef v4 = [(MTLegacyManager *)self _copyLegacyAlarmsFromPreferences];
    alarms = self->_alarms;
    self->_alarms = v4;
  }
  id v6 = [(MTLegacyManager *)self _copyLegacySleepAlarmFromPreferences];
  sleepAlarm = self->_sleepAlarm;
  self->_sleepAlarm = v6;
}

- (void)_reconcileAlarmsAndNotifications
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  CFArrayRef v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v38 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ reconiling alarms with notifications", buf, 0xCu);
  }

  CFDictionaryRef v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSArray count](self->_alarms, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  CFDictionaryRef v5 = self->_alarms;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v11 = [v10 alarmID];
        [v4 setObject:v10 forKey:v11];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v7);
  }

  sleepAlarm = self->_sleepAlarm;
  if (sleepAlarm)
  {
    v13 = [self->_sleepAlarm alarmID];
    [v4 setObject:sleepAlarm forKey:v13];
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v14 = self;
  long long v15 = self->_scheduledNotifications;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v30;
    *(void *)&long long v17 = 138543618;
    long long v28 = v17;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v15);
        }
        v21 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * j), "content", v28, (void)v29);
        v22 = [v21 userInfo];
        __int16 v23 = [v22 objectForKey:@"alarmId"];

        if ([v23 length])
        {
          v24 = [v4 objectForKey:v23];
          uint64_t v25 = v24;
          if (v24)
          {
            [v24 setForceActiveForMigration:1];
            v26 = MTLogForCategory(3);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v28;
              uint64_t v38 = v14;
              __int16 v39 = 2114;
              v40 = v23;
              _os_log_impl(&dword_19CC95000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ found scheduled notification matching alarm %{public}@.  Forcing active for migration.", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v18 = [(NSArray *)v15 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v18);
  }

  v27 = MTLogForCategory(3);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v38 = v14;
    _os_log_impl(&dword_19CC95000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ finished reconiling alarms with notifications", buf, 0xCu);
  }
}

- (void)_loadTimerDefaults
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CFArrayRef v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(float *)buf = 5.8381e-34;
    v14 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ loading timer defaults", buf, 0xCu);
  }

  CFNumberRef v4 = (const __CFNumber *)CFPreferencesCopyAppValue(@"TIMER_INTERVAL", @"com.apple.mobiletimer");
  *(float *)buf = 0.0;
  if (v4)
  {
    CFNumberRef v5 = v4;
    if (CFNumberGetValue(v4, kCFNumberFloatType, buf))
    {
      float v6 = floorf(*(float *)buf);
      if (v6 < 1.0) {
        float v6 = 1.0;
      }
      float v7 = fminf(v6, 86399.0);
    }
    else
    {
      float v7 = 900.0;
    }
    *(float *)buf = v7;
    CFRelease(v5);
    double v8 = *(float *)buf;
  }
  else
  {
    *(float *)buf = 900.0;
    double v8 = 900.0;
  }
  self->_defaultDuration = v8;
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"timerSleepiPod", @"com.apple.mobiletimer", &keyExistsAndHasValidFormat)&& keyExistsAndHasValidFormat)
  {
    __int16 v9 = (NSString *)(id)*MEMORY[0x1E4FAF638];
  }
  else
  {
    __int16 v9 = (NSString *)CFPreferencesCopyAppValue(@"timerSound", @"com.apple.mobiletimer");
    if (!v9)
    {
      uint64_t v10 = [MEMORY[0x1E4FAF5F0] sharedToneManager];
      __int16 v9 = [v10 defaultToneIdentifierForAlertType:14];
    }
  }
  defaultSound = self->_defaultSound;
  self->_defaultSound = v9;
}

- (void)purgeLegacyData
{
  serializer = self->_serializer;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__MTLegacyManager_purgeLegacyData__block_invoke;
  block[3] = &unk_1E59150A8;
  block[4] = self;
  dispatch_sync(serializer, block);
}

uint64_t __34__MTLegacyManager_purgeLegacyData__block_invoke(uint64_t result)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(result + 32) + 9))
  {
    uint64_t v1 = result;
    v2 = MTLogForCategory(3);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(v1 + 32);
      int v4 = 138543362;
      uint64_t v5 = v3;
      _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ purging legacy data", (uint8_t *)&v4, 0xCu);
    }

    [*(id *)(v1 + 32) _purgeAlarmsAndTimers];
    result = [*(id *)(v1 + 32) _cancelNotifications];
    *(unsigned char *)(*(void *)(v1 + 32) + 9) = 1;
  }
  return result;
}

- (void)_purgeAlarmsAndTimers
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deleting defaults", (uint8_t *)&v4, 0xCu);
  }

  CFPreferencesSetAppValue(@"Alarms", 0, @"com.apple.mobiletimer");
  CFPreferencesSetAppValue(@"AlarmsLastModified", 0, @"com.apple.mobiletimer");
  CFPreferencesSetAppValue(@"SleepAlarm", 0, @"com.apple.mobiletimer");
  CFPreferencesSetAppValue(@"timerSound", 0, @"com.apple.mobiletimer");
  CFPreferencesSetAppValue(@"timerSleepiPod", 0, @"com.apple.mobiletimer");
  CFPreferencesSetAppValue(@"TIMER_INTERVAL", 0, @"com.apple.mobiletimer");
  CFPreferencesAppSynchronize(@"com.apple.mobiletimer");
}

- (void)cancelNotifications
{
  serializer = self->_serializer;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MTLegacyManager_cancelNotifications__block_invoke;
  block[3] = &unk_1E59150A8;
  block[4] = self;
  dispatch_sync(serializer, block);
}

uint64_t __38__MTLegacyManager_cancelNotifications__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) removeAllPendingNotificationRequests];
}

- (void)_cancelNotifications
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelling notifications", (uint8_t *)&v4, 0xCu);
  }

  [(UNUserNotificationCenter *)self->_notificationCenter removeAllPendingNotificationRequests];
}

- (void)clearInvalidPendingNotifications
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    float v7 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ clearInvalidPendingNotifications", buf, 0xCu);
  }

  notificationCenter = self->_notificationCenter;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__MTLegacyManager_clearInvalidPendingNotifications__block_invoke;
  v5[3] = &unk_1E5917BE8;
  v5[4] = self;
  [(UNUserNotificationCenter *)notificationCenter getPendingNotificationRequestsWithCompletionHandler:v5];
}

void __51__MTLegacyManager_clearInvalidPendingNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__MTLegacyManager_clearInvalidPendingNotifications__block_invoke_2;
    v8[3] = &unk_1E5917BC0;
    v8[4] = *(void *)(a1 + 32);
    objc_msgSend(v3, "na_each:", v8);
    int v4 = MTLogForCategory(3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v10 = v5;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ removing all pending notifications", buf, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 56) removeAllPendingNotificationRequests];
  }
  else
  {
    uint64_t v6 = MTLogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v10 = v7;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ no pending notifications to remove", buf, 0xCu);
    }
  }
}

void __51__MTLegacyManager_clearInvalidPendingNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 identifier];
  uint64_t v5 = [v4 mtStringByRemovingNotificationDate];

  uint64_t v6 = [v3 content];
  uint64_t v7 = [v6 categoryIdentifier];

  uint64_t v8 = [v3 content];

  __int16 v9 = [v8 userInfo];

  uint64_t v10 = MTLogForCategory(3);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138544130;
    uint64_t v13 = v11;
    __int16 v14 = 2114;
    uint64_t v15 = v5;
    __int16 v16 = 2114;
    long long v17 = v7;
    __int16 v18 = 2114;
    uint64_t v19 = v9;
    _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ retrieved pending notification with alarm id: %{public}@, category id: %{public}@, user info: %{public}@", (uint8_t *)&v12, 0x2Au);
  }
}

+ (id)alarmFromOldAlarm:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[MTAlarm initWithHour:minute:]([MTMutableAlarm alloc], "initWithHour:minute:", [v4 hour], objc_msgSend(v4, "minute"));
  -[MTAlarm setBedtimeHour:](v5, "setBedtimeHour:", [v4 bedtimeHour]);
  -[MTAlarm setBedtimeMinute:](v5, "setBedtimeMinute:", [v4 bedtimeMinute]);
  uint64_t v6 = [v4 bedtimeReminderMinutes];
  -[MTAlarm setBedtimeReminderMinutes:](v5, "setBedtimeReminderMinutes:", [v6 integerValue]);

  -[MTAlarm setRepeatSchedule:](v5, "setRepeatSchedule:", [a1 repeatScheduleFromOldAlarm:v4]);
  uint64_t v7 = [a1 soundFromOldAlarm:v4];
  [(MTAlarm *)v5 setSound:v7];

  -[MTAlarm setEnabled:](v5, "setEnabled:", [v4 isActive]);
  -[MTAlarm setSleepAlarm:](v5, "setSleepAlarm:", [v4 isSleepAlarm]);
  -[MTAlarm setAllowsSnooze:](v5, "setAllowsSnooze:", [v4 allowsSnooze]);
  uint64_t v8 = [v4 title];

  [(MTAlarm *)v5 setTitle:v8];
  return v5;
}

+ (unint64_t)repeatScheduleFromOldAlarm:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = objc_msgSend(a3, "repeatDays", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= MTAlarmRepeatScheduleFromDay([*(id *)(*((void *)&v10 + 1) + 8 * i) integerValue]);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)soundFromOldAlarm:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 sound];
  unint64_t v6 = [a1 _numberFromString:v5];

  switch([v4 soundType])
  {
    case -1:
      goto LABEL_8;
    case 0:
      uint64_t v8 = *MEMORY[0x1E4FAF638];
      __int16 v9 = [v4 vibrationID];
      long long v10 = [v4 soundVolume];
      uint64_t v7 = +[MTSound toneSoundWithIdentifier:v8 vibrationIdentifer:v9 volume:v10];

      goto LABEL_9;
    case 1:
      long long v11 = [v4 sound];
      long long v12 = [v4 vibrationID];
      long long v13 = [v4 soundVolume];
      uint64_t v7 = +[MTSound toneSoundWithIdentifier:v11 vibrationIdentifer:v12 volume:v13];

      goto LABEL_7;
    case 2:
      if (v6)
      {
        long long v11 = [v4 vibrationID];
        long long v12 = [v4 soundVolume];
        uint64_t v7 = +[MTSound songSoundWithIdentifier:v6 vibrationIdentifier:v11 volume:v12];
LABEL_7:
      }
      else
      {
LABEL_8:
        uint64_t v7 = +[MTSound defaultSoundForCategory:0];
      }
LABEL_9:

      return v7;
    default:
      uint64_t v7 = 0;
      goto LABEL_9;
  }
}

+ (id)_numberFromString:(id)a3
{
  uint64_t v3 = _numberFromString__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_numberFromString__onceToken, &__block_literal_global_73);
  }
  uint64_t v5 = [(id)_numberFromString__f numberFromString:v4];

  return v5;
}

uint64_t __37__MTLegacyManager__numberFromString___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  uint64_t v1 = (void *)_numberFromString__f;
  _numberFromString__f = (uint64_t)v0;

  v2 = (void *)_numberFromString__f;
  return [v2 setNumberStyle:1];
}

- (NSArray)alarms
{
  return self->_alarms;
}

- (void)setAlarms:(id)a3
{
}

- (Alarm)sleepAlarm
{
  return self->_sleepAlarm;
}

- (void)setSleepAlarm:(id)a3
{
}

- (double)defaultDuration
{
  return self->_defaultDuration;
}

- (void)setDefaultDuration:(double)a3
{
  self->_defaultDuration = a3;
}

- (NSString)defaultSound
{
  return self->_defaultSound;
}

- (void)setDefaultSound:(id)a3
{
}

- (OS_dispatch_queue)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (NSArray)scheduledNotifications
{
  return self->_scheduledNotifications;
}

- (void)setScheduledNotifications:(id)a3
{
}

- (BOOL)loaded
{
  return self->_loaded;
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (BOOL)purged
{
  return self->_purged;
}

- (void)setPurged:(BOOL)a3
{
  self->_purged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledNotifications, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_defaultSound, 0);
  objc_storeStrong((id *)&self->_sleepAlarm, 0);
  objc_storeStrong((id *)&self->_alarms, 0);
}

@end
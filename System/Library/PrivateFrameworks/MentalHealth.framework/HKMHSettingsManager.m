@interface HKMHSettingsManager
- (BOOL)endOfDayNotificationsEnabled;
- (BOOL)hasAnyMentalHealthNotificationsEnabled;
- (BOOL)hasAnyStateOfMindReminderEnabled;
- (BOOL)hasEverEnabledAStateOfMindReminderNotification;
- (BOOL)middayNotificationsEnabled;
- (BOOL)periodicPromptedAssessmentNotificationsEnabled;
- (HKMHSettingsManager)init;
- (HKMHSettingsManager)initWithUserDefaults:(id)a3;
- (NSArray)customReminderSchedule;
- (NSUserDefaults)userDefaults;
- (id)periodicPromptedAssessmentNotificationTimeOfDay;
- (void)_notificationSettingsDidUpdate;
- (void)_setTestDefaults:(id)a3;
- (void)_startObservingDefaults;
- (void)_stopObservingAllDefaults;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)customReminderSchedule;
- (void)dealloc;
- (void)endOfDayNotificationsEnabled;
- (void)middayNotificationsEnabled;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)onboardToPregnancyRecommendedSettings;
- (void)periodicPromptedAssessmentNotificationTimeOfDay;
- (void)periodicPromptedAssessmentNotificationsEnabled;
- (void)removeObserver:(id)a3;
- (void)setCustomReminderSchedule:(id)a3;
- (void)setEndOfDayNotificationsEnabled:(BOOL)a3;
- (void)setMiddayNotificationsEnabled:(BOOL)a3;
- (void)setPeriodicPromptedAssessmentNotificationTimeOfDay:(id)a3;
- (void)setPeriodicPromptedAssessmentNotificationsEnabled:(BOOL)a3;
- (void)setReminders:(BOOL)a3;
@end

@implementation HKMHSettingsManager

- (HKMHSettingsManager)init
{
  v3 = objc_msgSend(MEMORY[0x263EFFA40], "hkmh_mentalHealthDefaults");
  v4 = [(HKMHSettingsManager *)self initWithUserDefaults:v3];

  return v4;
}

- (HKMHSettingsManager)initWithUserDefaults:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKMHSettingsManager;
  v6 = [(HKMHSettingsManager *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userDefaults, a3);
    id v8 = objc_alloc(MEMORY[0x263F0A5A8]);
    uint64_t v9 = [v8 initWithName:@"HKMHSettingsManagerObservers" loggingCategory:*MEMORY[0x263F09938]];
    observers = v7->_observers;
    v7->_observers = (HKObserverSet *)v9;

    uint64_t v11 = _NotificationSettingKeys();
    allSettingsToObserve = v7->_allSettingsToObserve;
    v7->_allSettingsToObserve = (NSArray *)v11;

    [(HKMHSettingsManager *)v7 _startObservingDefaults];
  }

  return v7;
}

- (void)dealloc
{
  [(HKMHSettingsManager *)self _stopObservingAllDefaults];
  v3.receiver = self;
  v3.super_class = (Class)HKMHSettingsManager;
  [(HKMHSettingsManager *)&v3 dealloc];
}

- (BOOL)middayNotificationsEnabled
{
  _HKInitializeLogging();
  objc_super v3 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEBUG)) {
    [(HKMHSettingsManager *)v3 middayNotificationsEnabled];
  }
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"StateOfMindLoggingReminderNotificationMiddayEnabledKey"];
}

- (void)setMiddayNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = objc_opt_class();
    id v8 = @"NO";
    if (v3) {
      id v8 = @"YES";
    }
    *(_DWORD *)uint64_t v11 = 138543618;
    *(void *)&v11[4] = v7;
    *(_WORD *)&v11[12] = 2114;
    *(void *)&v11[14] = v8;
    id v9 = v7;
    _os_log_impl(&dword_255F13000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set emotion logging reminder notifications enabled: %{public}@", v11, 0x16u);
  }
  [(NSUserDefaults *)self->_userDefaults setBool:v3, @"StateOfMindLoggingReminderNotificationMiddayEnabledKey", *(_OWORD *)v11, *(void *)&v11[16], v12 forKey];
  v10 = [MEMORY[0x263EFFA08] setWithObject:@"StateOfMindLoggingReminderNotificationMiddayEnabledKey"];
  HKSynchronizeNanoPreferencesUserDefaults();
}

- (BOOL)endOfDayNotificationsEnabled
{
  _HKInitializeLogging();
  BOOL v3 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEBUG)) {
    [(HKMHSettingsManager *)v3 endOfDayNotificationsEnabled];
  }
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"StateOfMindLoggingReminderNotificationEndOfDayEnabledKey"];
}

- (void)setEndOfDayNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = objc_opt_class();
    id v8 = @"NO";
    if (v3) {
      id v8 = @"YES";
    }
    *(_DWORD *)uint64_t v11 = 138543618;
    *(void *)&v11[4] = v7;
    *(_WORD *)&v11[12] = 2114;
    *(void *)&v11[14] = v8;
    id v9 = v7;
    _os_log_impl(&dword_255F13000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set emotion logging reminder notifications enabled: %{public}@", v11, 0x16u);
  }
  [(NSUserDefaults *)self->_userDefaults setBool:v3, @"StateOfMindLoggingReminderNotificationEndOfDayEnabledKey", *(_OWORD *)v11, *(void *)&v11[16], v12 forKey];
  v10 = [MEMORY[0x263EFFA08] setWithObject:@"StateOfMindLoggingReminderNotificationEndOfDayEnabledKey"];
  HKSynchronizeNanoPreferencesUserDefaults();
}

- (NSArray)customReminderSchedule
{
  v2 = [(NSUserDefaults *)self->_userDefaults dataForKey:@"StateOfMindLoggingReminderNotificationCustomScheduleKey"];
  if (v2)
  {
    id v7 = 0;
    BOOL v3 = [MEMORY[0x263F08928] unarchivedArrayOfObjectsOfClass:objc_opt_class() fromData:v2 error:&v7];
    id v4 = v7;
    if (!v3)
    {
      _HKInitializeLogging();
      id v5 = (void *)*MEMORY[0x263F09938];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_ERROR)) {
        -[HKMHSettingsManager customReminderSchedule](v5);
      }
    }
  }
  else
  {
    BOOL v3 = (void *)MEMORY[0x263EFFA68];
  }

  return (NSArray *)v3;
}

- (void)setCustomReminderSchedule:(id)a3
{
  id v8 = 0;
  id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v8];
  id v5 = v8;
  if (v4)
  {
    [(NSUserDefaults *)self->_userDefaults setObject:v4 forKey:@"StateOfMindLoggingReminderNotificationCustomScheduleKey"];
    v6 = [MEMORY[0x263EFFA08] setWithObject:@"StateOfMindLoggingReminderNotificationCustomScheduleKey"];
    HKSynchronizeNanoPreferencesUserDefaults();
  }
  else
  {
    _HKInitializeLogging();
    id v7 = (void *)*MEMORY[0x263F09938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_ERROR)) {
      -[HKMHSettingsManager setCustomReminderSchedule:](v7);
    }
  }
}

- (BOOL)periodicPromptedAssessmentNotificationsEnabled
{
  _HKInitializeLogging();
  BOOL v3 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEBUG)) {
    [(HKMHSettingsManager *)v3 periodicPromptedAssessmentNotificationsEnabled];
  }
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"PeriodicPromptedAssessmentNotificationEnabledKey"];
}

- (void)onboardToPregnancyRecommendedSettings
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (HKShowSensitiveLogItems())
  {
    _HKInitializeLogging();
    BOOL v3 = (void *)*MEMORY[0x263F09938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      *(_DWORD *)v6 = 138543362;
      *(void *)&v6[4] = objc_opt_class();
      id v5 = *(id *)&v6[4];
      _os_log_impl(&dword_255F13000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding to recommended pregnancy settings", v6, 0xCu);
    }
  }
  -[HKMHSettingsManager setPeriodicPromptedAssessmentNotificationsEnabled:](self, "setPeriodicPromptedAssessmentNotificationsEnabled:", 1, *(_OWORD *)v6);
}

- (void)setPeriodicPromptedAssessmentNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    uint64_t v7 = objc_opt_class();
    id v8 = @"NO";
    *(_DWORD *)v10 = 138543874;
    *(void *)&v10[4] = v7;
    *(_WORD *)&v10[12] = 2114;
    if (v3) {
      id v8 = @"YES";
    }
    *(void *)&v10[14] = @"PeriodicPromptedAssessmentNotificationEnabledKey";
    *(_WORD *)&v10[22] = 2114;
    uint64_t v11 = v8;
    id v9 = v7;
    _os_log_impl(&dword_255F13000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set Periodic prompted assessment notifications for key: %{public}@: %{public}@", v10, 0x20u);
  }
  [(NSUserDefaults *)self->_userDefaults setBool:v3, @"PeriodicPromptedAssessmentNotificationEnabledKey", *(_OWORD *)v10, *(void *)&v10[16], v11 forKey];
}

- (id)periodicPromptedAssessmentNotificationTimeOfDay
{
  BOOL v3 = [MEMORY[0x263F0A980] sharedBehavior];
  int v4 = [v3 isAppleInternalInstall];

  if (v4
    && (id v5 = (void *)MEMORY[0x263F08928],
        uint64_t v6 = objc_opt_class(),
        -[NSUserDefaults dataForKey:](self->_userDefaults, "dataForKey:", @"PeriodicPromptedAssessmentNotificationTimeOfDayOverride"), v7 = objc_claimAutoreleasedReturnValue(), [v5 unarchivedObjectOfClass:v6 fromData:v7 error:0], id v8 = (id)objc_claimAutoreleasedReturnValue(), v7, v8))
  {
    _HKInitializeLogging();
    id v9 = (void *)*MEMORY[0x263F09938];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEBUG)) {
      -[HKMHSettingsManager periodicPromptedAssessmentNotificationTimeOfDay](v9);
    }
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v8 setHour:20];
  }
  return v8;
}

- (void)setPeriodicPromptedAssessmentNotificationTimeOfDay:(id)a3
{
  id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  [(NSUserDefaults *)self->_userDefaults setObject:v4 forKey:@"PeriodicPromptedAssessmentNotificationTimeOfDayOverride"];
}

- (void)_startObservingDefaults
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = self->_allSettingsToObserve;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_userDefaults, "addObserver:forKeyPath:options:context:", self, *(void *)(*((void *)&v8 + 1) + 8 * v7++), 3, 0, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_stopObservingAllDefaults
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = self->_allSettingsToObserve;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[NSUserDefaults removeObserver:forKeyPath:](self->_userDefaults, "removeObserver:forKeyPath:", self, *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  _HKInitializeLogging();
  uint64_t v13 = (void *)*MEMORY[0x263F09938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v14 = v13;
    v15 = objc_opt_class();
    uint64_t v16 = *MEMORY[0x263F081C8];
    id v17 = v15;
    v18 = [v12 objectForKeyedSubscript:v16];
    v19 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    *(_DWORD *)buf = 138544130;
    v24 = v15;
    __int16 v25 = 2114;
    id v26 = v10;
    __int16 v27 = 2114;
    v28 = v18;
    __int16 v29 = 2114;
    v30 = v19;
    _os_log_impl(&dword_255F13000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ changed: %{public}@ -> %{public}@", buf, 0x2Au);
  }
  v20 = _NotificationSettingKeys();
  int v21 = [v20 containsObject:v10];

  if (v21)
  {
    [(HKMHSettingsManager *)self _notificationSettingsDidUpdate];
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)HKMHSettingsManager;
    [(HKMHSettingsManager *)&v22 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (BOOL)hasAnyMentalHealthNotificationsEnabled
{
  if ([(HKMHSettingsManager *)self hasAnyStateOfMindReminderEnabled]) {
    return 1;
  }
  return [(HKMHSettingsManager *)self periodicPromptedAssessmentNotificationsEnabled];
}

- (BOOL)hasAnyStateOfMindReminderEnabled
{
  if ([(HKMHSettingsManager *)self middayNotificationsEnabled]
    || [(HKMHSettingsManager *)self endOfDayNotificationsEnabled])
  {
    return 1;
  }
  uint64_t v4 = [(HKMHSettingsManager *)self customReminderSchedule];
  BOOL v3 = [v4 count] != 0;

  return v3;
}

- (BOOL)hasEverEnabledAStateOfMindReminderNotification
{
  uint64_t v3 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"StateOfMindLoggingReminderNotificationMiddayEnabledKey"];

  uint64_t v4 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"StateOfMindLoggingReminderNotificationEndOfDayEnabledKey"];
  uint64_t v5 = v3 | v4;

  uint64_t v6 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"StateOfMindLoggingReminderNotificationCustomScheduleKey"];

  return (v5 | v6) != 0;
}

- (void)setReminders:(BOOL)a3
{
  BOOL v3 = a3;
  -[HKMHSettingsManager setMiddayNotificationsEnabled:](self, "setMiddayNotificationsEnabled:");
  [(HKMHSettingsManager *)self setEndOfDayNotificationsEnabled:v3];
}

- (void)addObserver:(id)a3 queue:(id)a4
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_notificationSettingsDidUpdate
{
  observers = self->_observers;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__HKMHSettingsManager__notificationSettingsDidUpdate__block_invoke;
  v3[3] = &unk_2653EF2E8;
  v3[4] = self;
  [(HKObserverSet *)observers notifyObservers:v3];
}

void __53__HKMHSettingsManager__notificationSettingsDidUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 settingsManagerDidUpdateNotificationSettings:*(void *)(a1 + 32)];
  }
}

- (void)_setTestDefaults:(id)a3
{
  uint64_t v4 = (NSUserDefaults *)a3;
  [(HKMHSettingsManager *)self _stopObservingAllDefaults];
  userDefaults = self->_userDefaults;
  self->_userDefaults = v4;

  [(HKMHSettingsManager *)self _startObservingDefaults];
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_allSettingsToObserve, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)middayNotificationsEnabled
{
  id v3 = a1;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(void **)(a2 + 24);
  id v6 = v4;
  [v5 BOOLForKey:@"StateOfMindLoggingReminderNotificationMiddayEnabledKey"];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_255F13000, v7, v8, "[%{public}@] Emotion logging enabled: %{public}@", v9, v10, v11, v12, v13);
}

- (void)endOfDayNotificationsEnabled
{
  id v3 = a1;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(void **)(a2 + 24);
  id v6 = v4;
  [v5 BOOLForKey:@"StateOfMindLoggingReminderNotificationEndOfDayEnabledKey"];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_255F13000, v7, v8, "[%{public}@] Emotion logging enabled: %{public}@", v9, v10, v11, v12, v13);
}

- (void)customReminderSchedule
{
  id v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_1(v2);
  OUTLINED_FUNCTION_3(&dword_255F13000, v4, v5, "[%{public}@] Failed to fetch custom schedule with error: %{public}@", v6, v7, v8, v9, v10);
}

- (void)setCustomReminderSchedule:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_1(v2);
  OUTLINED_FUNCTION_3(&dword_255F13000, v4, v5, "[%{public}@] Failed to write data with error: %{public}@", v6, v7, v8, v9, v10);
}

- (void)periodicPromptedAssessmentNotificationsEnabled
{
  id v3 = a1;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(void **)(a2 + 24);
  id v6 = v4;
  [v5 BOOLForKey:@"PeriodicPromptedAssessmentNotificationEnabledKey"];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_255F13000, v7, v8, "[%{public}@] Periodic prompted assessment notifications enabled: %{public}@", v9, v10, v11, v12, v13);
}

- (void)periodicPromptedAssessmentNotificationTimeOfDay
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_1(v2);
  _os_log_debug_impl(&dword_255F13000, v1, OS_LOG_TYPE_DEBUG, "[%{public}@] Using overridden mental health notification time: %{public}@", v4, 0x16u);
}

@end
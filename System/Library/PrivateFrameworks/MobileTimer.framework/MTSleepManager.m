@interface MTSleepManager
+ (id)nextSleepAlarm;
+ (void)nextSleepAlarm;
- (BOOL)_didCompleteSleepOnboarding;
- (BOOL)watchSleepFeaturesEnabled;
- (HKHealthStore)healthStore;
- (HKSPFeatureAvailabilityStore)featureStore;
- (HKSPSleepStore)sleepStore;
- (MTAlarmStorage)alarmStorage;
- (MTPersistence)persistence;
- (MTSleepManager)initWithAlarmStorage:(id)a3;
- (MTSleepManager)initWithAlarmStorage:(id)a3 sleepStoreProvider:(id)a4 featureStoreProvider:(id)a5 healthStore:(id)a6 persistence:(id)a7;
- (id)sleepStoreProvider;
- (id)sourceIdentifier;
- (void)markSleepMigrationComplete;
- (void)resetSleepAlarmSnoozeState;
- (void)setFeatureStore:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setPersistence:(id)a3;
- (void)setSleepStore:(id)a3;
- (void)setSleepStoreProvider:(id)a3;
- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4;
- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5;
- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5;
- (void)source:(id)a3 didUpdateAlarms:(id)a4;
- (void)updateSleepAlarms;
- (void)watchSleepFeaturesEnabled;
@end

@implementation MTSleepManager

- (MTSleepManager)initWithAlarmStorage:(id)a3
{
  id v4 = a3;
  getHKHealthStoreClass();
  v5 = objc_opt_new();
  v6 = +[MTUserDefaults sharedUserDefaults];
  v7 = [(MTSleepManager *)self initWithAlarmStorage:v4 sleepStoreProvider:&__block_literal_global_45 featureStoreProvider:&__block_literal_global_286 healthStore:v5 persistence:v6];

  return v7;
}

id __39__MTSleepManager_initWithAlarmStorage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (objc_class *)MEMORY[0x1E4FA5568];
  id v5 = a3;
  id v6 = a2;
  v7 = (void *)[[v4 alloc] initWithIdentifier:v6 healthStore:v5];

  return v7;
}

id __39__MTSleepManager_initWithAlarmStorage___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4FA54F0]);
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  id v4 = (void *)getHKFeatureIdentifierSleepCoachingSymbolLoc_ptr;
  uint64_t v11 = getHKFeatureIdentifierSleepCoachingSymbolLoc_ptr;
  if (!getHKFeatureIdentifierSleepCoachingSymbolLoc_ptr)
  {
    id v5 = (void *)HealthKitLibrary_1();
    v9[3] = (uint64_t)dlsym(v5, "HKFeatureIdentifierSleepCoaching");
    getHKFeatureIdentifierSleepCoachingSymbolLoc_ptr = v9[3];
    id v4 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4) {
    __39__MTSleepManager_initWithAlarmStorage___block_invoke_2_cold_1();
  }
  id v6 = (void *)[v3 initWithFeatureIdentifier:*v4 sleepStore:v2];

  return v6;
}

- (MTSleepManager)initWithAlarmStorage:(id)a3 sleepStoreProvider:(id)a4 featureStoreProvider:(id)a5 healthStore:(id)a6 persistence:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  v15 = (void (**)(id, void *))a5;
  id v16 = a6;
  id v17 = a7;
  v30.receiver = self;
  v30.super_class = (Class)MTSleepManager;
  v18 = [(MTSleepManager *)&v30 init];
  if (v18)
  {
    v19 = MTLogForCategory(7);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v18;
      _os_log_impl(&dword_19CC95000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep manager initialized", buf, 0xCu);
    }

    objc_storeStrong((id *)&v18->_alarmStorage, a3);
    [(MTAlarmStorage *)v18->_alarmStorage registerObserver:v18];
    [(MTSleepManager *)v18 setHealthStore:v16];
    v20 = (void *)[v14 copy];
    [(MTSleepManager *)v18 setSleepStoreProvider:v20];

    v21 = [(MTSleepManager *)v18 sleepStoreProvider];
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    v24 = [(MTSleepManager *)v18 healthStore];
    v25 = ((void (**)(void, void *, void *))v21)[2](v21, v23, v24);
    [(MTSleepManager *)v18 setSleepStore:v25];

    v26 = [(MTSleepManager *)v18 sleepStore];
    [v26 addObserver:v18];

    v27 = [(MTSleepManager *)v18 sleepStore];
    v28 = v15[2](v15, v27);
    [(MTSleepManager *)v18 setFeatureStore:v28];

    [(MTSleepManager *)v18 setPersistence:v17];
  }

  return v18;
}

- (void)updateSleepAlarms
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ failed to retrieve sleep schedule model with error: %{public}@");
}

id __35__MTSleepManager_updateSleepAlarms__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 isEnabled];
  id v6 = [*(id *)(a1 + 40) wakeUpConfirmedUntilDate];
  v7 = +[MTSleepUtilities alarmFromSleepOccurrence:v4 scheduleEnabled:v5 keepOffUntilDate:v6];

  return v7;
}

- (BOOL)_didCompleteSleepOnboarding
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(MTSleepManager *)self featureStore];
  id v9 = 0;
  id v4 = [v3 isCurrentOnboardingVersionCompletedWithError:&v9];
  id v5 = v9;

  id v6 = MTLogForCategory(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ completed sleep onboarding check with result: %{public}@, error: %{public}@ ", buf, 0x20u);
  }

  if (v5) {
    char v7 = 0;
  }
  else {
    char v7 = [v4 BOOLValue];
  }

  return v7;
}

- (void)resetSleepAlarmSnoozeState
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = MTLogForCategory(7);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ resetSleepAlarmSnoozeState", (uint8_t *)&v4, 0xCu);
  }

  if (MTShouldHandleForEucalyptus()) {
    [(MTAlarmStorage *)self->_alarmStorage updateSleepAlarmsWithBlock:&__block_literal_global_297 source:self];
  }
}

uint64_t __44__MTSleepManager_resetSleepAlarmSnoozeState__block_invoke(uint64_t a1, void *a2)
{
  return [a2 resetSnoozeFireDate];
}

- (BOOL)watchSleepFeaturesEnabled
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(MTSleepManager *)self persistence];
  int v4 = [v3 objectForKey:@"MTNeedsSleepMigration"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    uint64_t v6 = MTLogForCategory(7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = self;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_INFO, "%{public}@ needs sleep migration, fetching watchSleepFeaturesEnabled async", buf, 0xCu);
    }

    char v7 = [(MTSleepManager *)self sleepStore];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __43__MTSleepManager_watchSleepFeaturesEnabled__block_invoke;
    v15[3] = &unk_1E5918010;
    v15[4] = self;
    [v7 currentSleepSettingsWithCompletion:v15];

    return 0;
  }
  else
  {
    id v9 = [(MTSleepManager *)self sleepStore];
    id v14 = 0;
    uint64_t v10 = [v9 currentSleepSettingsWithError:&v14];
    id v11 = v14;
    char v8 = [v10 watchSleepFeaturesEnabled];

    if (v11)
    {
      __int16 v12 = MTLogForCategory(7);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[MTSleepManager watchSleepFeaturesEnabled]();
      }
    }
  }
  return v8;
}

void __43__MTSleepManager_watchSleepFeaturesEnabled__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    int v5 = MTLogForCategory(7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __43__MTSleepManager_watchSleepFeaturesEnabled__block_invoke_cold_1(a1, (uint64_t)v4, v5);
    }
  }
  else
  {
    [*(id *)(a1 + 32) markSleepMigrationComplete];
    uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:MTSleepManagerSettingsDidChange object:0];
  }
}

- (void)markSleepMigrationComplete
{
  id v3 = [(MTSleepManager *)self persistence];
  id v2 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
  [v3 setObject:v2 forKey:@"MTNeedsSleepMigration"];
}

- (id)sourceIdentifier
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:MTSleepManagerSettingsDidChange object:0];
}

+ (id)nextSleepAlarm
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = a1;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching sleep alarm from health", buf, 0xCu);
  }

  getHKHealthStoreClass();
  id v4 = objc_opt_new();
  int v5 = (void *)[objc_alloc(MEMORY[0x1E4FA5568]) initWithHealthStore:v4];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] mtNow];
  id v14 = 0;
  char v7 = [v5 upcomingScheduleOccurrenceAfterDate:v6 error:&v14];
  id v8 = v14;

  if (v8)
  {
    id v9 = MTLogForCategory(7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[MTSleepManager nextSleepAlarm]();
    }
    goto LABEL_10;
  }
  id v13 = 0;
  id v9 = [v5 currentSleepScheduleWithError:&v13];
  id v8 = v13;
  if (v8)
  {
    uint64_t v10 = MTLogForCategory(7);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[MTSleepManager nextSleepAlarm]();
    }
LABEL_9:

LABEL_10:
    id v11 = 0;
    goto LABEL_11;
  }
  if (!v7)
  {
    uint64_t v10 = MTLogForCategory(7);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[MTSleepManager nextSleepAlarm];
    }
    goto LABEL_9;
  }
  id v11 = +[MTSleepUtilities alarmFromSleepOccurrence:v7 scheduleEnabled:v9 != 0 keepOffUntilDate:0];
LABEL_11:

  return v11;
}

- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v9 isSleepAlarm])
  {
    if (a5 <= 0xB && ((1 << a5) & 0x8E0) != 0)
    {
      uint64_t v10 = MTLogForCategory(7);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [v9 alarmIDString];
        __int16 v12 = [v9 dismissedDate];
        id v13 = MTDismissAlarmActionDescription(a5);
        *(_DWORD *)buf = 138544130;
        v23 = self;
        __int16 v24 = 2114;
        v25 = v11;
        __int16 v26 = 2114;
        v27 = v12;
        __int16 v28 = 2114;
        v29 = v13;
        _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ informing sleep store of alarm dismiss: %{public}@, dismiss date:%{public}@ action: %{public}@", buf, 0x2Au);
      }
      if (objc_opt_respondsToSelector()) {
        uint64_t v14 = [v8 isFromOtherDevice];
      }
      else {
        uint64_t v14 = 0;
      }
      id v15 = [(MTSleepManager *)self sleepStore];
      id v16 = [v9 dismissedDate];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __55__MTSleepManager_source_didDismissAlarm_dismissAction___block_invoke;
      v20[3] = &unk_1E5918038;
      v20[4] = self;
      id v21 = v9;
      [v15 sleepAlarmWasDismissedOnDate:v16 source:v14 completion:v20];
    }
    else
    {
      uint64_t v17 = MTLogForCategory(7);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [v9 alarmIDString];
        v19 = MTDismissAlarmActionDescription(a5);
        *(_DWORD *)buf = 138543874;
        v23 = self;
        __int16 v24 = 2114;
        v25 = v18;
        __int16 v26 = 2114;
        v27 = v19;
        _os_log_impl(&dword_19CC95000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ not informing sleep store of alarm dismiss: %{public}@, action: %{public}@", buf, 0x20u);
      }
    }
  }
}

void __55__MTSleepManager_source_didDismissAlarm_dismissAction___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = MTLogForCategory(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) alarmIDString];
    int v9 = 138544130;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    __int16 v12 = v8;
    __int16 v13 = 1024;
    int v14 = a2;
    __int16 v15 = 2114;
    id v16 = v5;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep store sleepAlarmWasDismissedOnDate completed for alarm id: %{public}@ with status: %d, error: %{public}@", (uint8_t *)&v9, 0x26u);
  }
}

- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 isSleepAlarm])
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = [v7 isFromOtherDevice];
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = [(MTSleepManager *)self sleepStore];
    __int16 v11 = [v8 snoozeFireDate];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__MTSleepManager_source_didSnoozeAlarm_snoozeAction___block_invoke;
    v12[3] = &unk_1E5918038;
    v12[4] = self;
    id v13 = v8;
    [v10 sleepAlarmWasSnoozedUntilDate:v11 source:v9 completion:v12];
  }
}

void __53__MTSleepManager_source_didSnoozeAlarm_snoozeAction___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = MTLogForCategory(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) alarmIDString];
    int v9 = 138544130;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    __int16 v12 = v8;
    __int16 v13 = 1024;
    int v14 = a2;
    __int16 v15 = 2114;
    id v16 = v5;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep store sleepAlarmWasSnoozedUntilDate completed for alarm id: %{public}@ with status: %d, error: %{public}@", (uint8_t *)&v9, 0x26u);
  }
}

- (void)source:(id)a3 didUpdateAlarms:(id)a4
{
  id v6 = a3;
  if (objc_msgSend(a4, "na_any:", &__block_literal_global_307))
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = [v6 isFromOtherDevice];
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = [(MTSleepManager *)self sleepStore];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__MTSleepManager_source_didUpdateAlarms___block_invoke_2;
    v9[3] = &unk_1E5918060;
    v9[4] = self;
    [v8 sleepAlarmWasModifiedFromSource:v7 completion:v9];
  }
}

uint64_t __41__MTSleepManager_source_didUpdateAlarms___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSleepAlarm];
}

void __41__MTSleepManager_source_didUpdateAlarms___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = MTLogForCategory(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543874;
    uint64_t v9 = v7;
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep store sleepAlarmWasModified completed with status: %d, error: %{public}@", (uint8_t *)&v8, 0x1Cu);
  }
}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (id)sleepStoreProvider
{
  return self->_sleepStoreProvider;
}

- (void)setSleepStoreProvider:(id)a3
{
}

- (HKSPSleepStore)sleepStore
{
  return self->_sleepStore;
}

- (void)setSleepStore:(id)a3
{
}

- (HKSPFeatureAvailabilityStore)featureStore
{
  return self->_featureStore;
}

- (void)setFeatureStore:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (MTPersistence)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_featureStore, 0);
  objc_storeStrong((id *)&self->_sleepStore, 0);
  objc_storeStrong(&self->_sleepStoreProvider, 0);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
}

void __39__MTSleepManager_initWithAlarmStorage___block_invoke_2_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"HKFeatureIdentifier getHKFeatureIdentifierSleepCoaching(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MTSleepManager.m", 33, @"%s", dlerror());

  __break(1u);
}

- (void)watchSleepFeaturesEnabled
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ failed to get sleep settings, error: %{public}@ ");
}

void __43__MTSleepManager_watchSleepFeaturesEnabled__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, a2, a3, "%{public}@ failed to get sleep settings, error: %{public}@ ", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

+ (void)nextSleepAlarm
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ failed to retrieve upcoming sleep occurrence with error: %{public}@");
}

@end
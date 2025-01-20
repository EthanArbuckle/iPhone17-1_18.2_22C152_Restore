@interface HDSPSleepScheduleModelMigrationManager
- (BOOL)needDataMigration;
- (HDSPEnvironment)environment;
- (HDSPSleepScheduleModelMigrationManager)initWithEnvironment:(id)a3;
- (NSString)sourceIdentifier;
- (id)_migrateHomeScreenPage;
- (id)_migrateOnboardingSettings;
- (id)_migrateSleepFocus;
- (id)_migrateSleepScheduleFromMobileTimer;
- (id)_migrateToCloudKit;
- (id)performDataMigration;
@end

@implementation HDSPSleepScheduleModelMigrationManager

- (HDSPSleepScheduleModelMigrationManager)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSPSleepScheduleModelMigrationManager;
  v5 = [(HDSPSleepScheduleModelMigrationManager *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)needDataMigration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v3 = [WeakRetained sleepStorage];
  char v4 = [v3 needsMigration];

  return v4;
}

- (id)performDataMigration
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  char v4 = [(HDSPSleepScheduleModelMigrationManager *)self _migrateToCloudKit];
  [v3 addObject:v4];

  v5 = [(HDSPSleepScheduleModelMigrationManager *)self _migrateSleepScheduleFromMobileTimer];
  [v3 addObject:v5];

  v6 = [(HDSPSleepScheduleModelMigrationManager *)self _migrateSleepFocus];
  [v3 addObject:v6];

  v7 = [(HDSPSleepScheduleModelMigrationManager *)self _migrateOnboardingSettings];
  [v3 addObject:v7];

  v8 = [(HDSPSleepScheduleModelMigrationManager *)self _migrateHomeScreenPage];
  [v3 addObject:v8];

  objc_super v9 = [MEMORY[0x263F58190] chainFutures:v3];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__HDSPSleepScheduleModelMigrationManager_performDataMigration__block_invoke;
  v12[3] = &unk_2645D9F30;
  v12[4] = self;
  v10 = [v9 addSuccessBlock:v12];

  return v10;
}

void __62__HDSPSleepScheduleModelMigrationManager_performDataMigration__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) environment];
  v1 = [v2 sleepStorage];
  [v1 saveDataVersion];
}

- (id)_migrateToCloudKit
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__HDSPSleepScheduleModelMigrationManager__migrateToCloudKit__block_invoke;
  v7[3] = &unk_2645D9F80;
  v7[4] = self;
  id v3 = [MEMORY[0x263F58190] lazyFutureWithBlock:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__HDSPSleepScheduleModelMigrationManager__migrateToCloudKit__block_invoke_2;
  v6[3] = &unk_2645D9FA8;
  v6[4] = self;
  char v4 = [v3 recover:v6];

  return v4;
}

void __60__HDSPSleepScheduleModelMigrationManager__migrateToCloudKit__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v5 = [WeakRetained behavior];
  v6 = [v5 features];
  char v7 = [v6 sleepCloudKitSync];

  if ((v7 & 1) == 0)
  {
    v13 = HKSPLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = (id)objc_opt_class();
      id v14 = v19;
      _os_log_impl(&dword_221A52000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] skipping CloudKit migration because feature is disabled", buf, 0xCu);
    }
    goto LABEL_9;
  }
  v8 = [WeakRetained sleepStorage];
  uint64_t v9 = [v8 cloudStorageDataVersion];

  if (v9)
  {
LABEL_9:
    v15 = NAEmptyResult();
    [v3 finishWithResult:v15];

    goto LABEL_10;
  }
  v10 = HKSPLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = (id)objc_opt_class();
    id v11 = v19;
    _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing CloudKit migration", buf, 0xCu);
  }
  v12 = [WeakRetained sleepStorage];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __60__HDSPSleepScheduleModelMigrationManager__migrateToCloudKit__block_invoke_279;
  v16[3] = &unk_2645D9F58;
  id v17 = v3;
  [v12 performInitialSyncWithCompletion:v16];

LABEL_10:
}

void __60__HDSPSleepScheduleModelMigrationManager__migrateToCloudKit__block_invoke_279(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a3;
  NAEmptyResult();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 finishWithResult:v5 error:v4];
}

id __60__HDSPSleepScheduleModelMigrationManager__migrateToCloudKit__block_invoke_2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = HKSPLogForCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = (id)objc_opt_class();
    id v3 = v5;
    _os_log_error_impl(&dword_221A52000, v0, OS_LOG_TYPE_ERROR, "[%{public}@] initial sync failed, continuing anyway", (uint8_t *)&v4, 0xCu);
  }
  v1 = [MEMORY[0x263F58190] futureWithNoResult];

  return v1;
}

- (id)_migrateSleepScheduleFromMobileTimer
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __78__HDSPSleepScheduleModelMigrationManager__migrateSleepScheduleFromMobileTimer__block_invoke;
  v4[3] = &unk_2645D9F80;
  v4[4] = self;
  id v2 = [MEMORY[0x263F58190] lazyFutureWithBlock:v4];

  return v2;
}

void __78__HDSPSleepScheduleModelMigrationManager__migrateSleepScheduleFromMobileTimer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v5 = [WeakRetained sleepStorage];
  uint64_t v6 = [v5 dataVersion];

  if (v6)
  {
LABEL_9:
    id v19 = NAEmptyResult();
    [v3 finishWithResult:v19];

    goto LABEL_10;
  }
  char v7 = [WeakRetained behavior];
  uint64_t v8 = objc_msgSend(v7, "hksp_supportsLegacySleepAlarms");

  if ((v8 & 1) == 0)
  {
    id v17 = HKSPLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = (id)objc_opt_class();
      id v18 = v25;
      _os_log_impl(&dword_221A52000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] skipping MobileTimer migration because this device doesn't support legacy alarms", buf, 0xCu);
    }
    goto LABEL_9;
  }
  uint64_t v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = (id)objc_opt_class();
    id v10 = v25;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] migrating from MobileTimer", buf, 0xCu);
  }
  id v11 = [WeakRetained sleepAlarmManager];
  v12 = [v11 sleepAlarmProvider];

  v13 = [v12 sleepAlarmsFuture];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __78__HDSPSleepScheduleModelMigrationManager__migrateSleepScheduleFromMobileTimer__block_invoke_283;
  v20[3] = &unk_2645D9FD0;
  id v14 = v3;
  uint64_t v15 = *(void *)(a1 + 32);
  id v21 = v14;
  uint64_t v22 = v15;
  id v23 = WeakRetained;
  id v16 = (id)[v13 addCompletionBlock:v20];

LABEL_10:
}

void __78__HDSPSleepScheduleModelMigrationManager__migrateSleepScheduleFromMobileTimer__block_invoke_283(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a3)
  {
    int v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "finishWithError:");
  }
  else
  {
    id v5 = HKSPNilify();
    uint64_t v6 = [v5 firstObject];
    char v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      id v18 = v6;
      id v8 = v16;
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] migrating from sleep alarm %{public}@", buf, 0x16u);
    }
    uint64_t v9 = +[HDSPMobileTimerBridge sleepScheduleModelFromSleepAlarm:v6];
    id v10 = [*(id *)(a1 + 48) sleepStorage];
    id v14 = 0;
    [v10 saveSleepScheduleModel:v9 error:&v14];
    id v11 = v14;

    v12 = *(void **)(a1 + 32);
    v13 = NAEmptyResult();
    [v12 finishWithResult:v13 error:v11];
  }
}

- (id)_migrateOnboardingSettings
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __68__HDSPSleepScheduleModelMigrationManager__migrateOnboardingSettings__block_invoke;
  v4[3] = &unk_2645D9F80;
  v4[4] = self;
  id v2 = [MEMORY[0x263F58190] lazyFutureWithBlock:v4];

  return v2;
}

void __68__HDSPSleepScheduleModelMigrationManager__migrateOnboardingSettings__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v5 = [WeakRetained sleepStorage];
  unint64_t v6 = [v5 dataVersion];

  if (v6 < 8)
  {
    id v8 = HKSPLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v30 = (id)objc_opt_class();
      id v9 = v30;
      _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] migrating settings based on onboarding", buf, 0xCu);
    }
    id v10 = [WeakRetained sleepStorage];
    id v28 = 0;
    id v11 = [v10 loadSleepEventRecord:&v28];
    id v12 = v28;

    if (v11)
    {
      v13 = [WeakRetained sleepStorage];
      id v27 = v12;
      id v14 = [v13 loadSleepSettings:&v27];
      id v15 = v27;

      id v16 = (void *)[v14 mutableCopy];
      if (v16)
      {
        if ([v11 isAnySleepCoachingOnboardingCompleted])
        {
          __int16 v17 = HKSPLogForCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            id v30 = v18;
            id v19 = v18;
            _os_log_impl(&dword_221A52000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep coaching completed, enabling dnd during wind down", buf, 0xCu);
          }
          objc_msgSend(v16, "setSleepModeOptions:", objc_msgSend(v16, "sleepModeOptions") | 0x840);
        }
        if ([v11 isAnySleepTrackingOnboardingCompleted])
        {
          uint64_t v20 = HKSPLogForCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            id v30 = v21;
            id v22 = v21;
            _os_log_impl(&dword_221A52000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep tracking completed, enabling watch face", buf, 0xCu);
          }
          objc_msgSend(v16, "setSleepModeOptions:", objc_msgSend(v16, "sleepModeOptions") | 4);
        }
        id v23 = [WeakRetained sleepStorage];
        id v26 = v15;
        [v23 saveSleepSettings:v16 error:&v26];
        id v24 = v26;

        id v25 = NAEmptyResult();
        [v3 finishWithResult:v25 error:v24];
        id v15 = v24;
      }
      else
      {
        id v25 = NAEmptyResult();
        [v3 finishWithResult:v25 error:v15];
      }

      id v12 = v15;
    }
    else
    {
      id v16 = NAEmptyResult();
      [v3 finishWithResult:v16 error:v12];
    }
  }
  else
  {
    char v7 = NAEmptyResult();
    [v3 finishWithResult:v7];
  }
}

- (id)_migrateSleepFocus
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__HDSPSleepScheduleModelMigrationManager__migrateSleepFocus__block_invoke;
  v4[3] = &unk_2645D9F80;
  v4[4] = self;
  id v2 = [MEMORY[0x263F58190] lazyFutureWithBlock:v4];

  return v2;
}

void __60__HDSPSleepScheduleModelMigrationManager__migrateSleepFocus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v5 = [WeakRetained sleepStorage];
  unint64_t v6 = [v5 dataVersion];

  if (v6 < 6)
  {
    id v8 = HKSPLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v32 = (id)objc_opt_class();
      id v9 = v32;
      _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] migrating sleep focus", buf, 0xCu);
    }
    id v10 = [WeakRetained sleepStorage];
    id v30 = 0;
    id v11 = [v10 loadSleepEventRecord:&v30];
    id v12 = v30;

    if (!v11)
    {
      id v14 = NAEmptyResult();
      [v3 finishWithResult:v14 error:v12];
      id v15 = v12;
LABEL_22:

      goto LABEL_23;
    }
    v13 = [WeakRetained sleepStorage];
    id v29 = v12;
    id v14 = [v13 loadSleepSettings:&v29];
    id v15 = v29;

    if (!v14)
    {
      NAEmptyResult();
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      [v3 finishWithResult:v21 error:v15];
LABEL_21:

      goto LABEL_22;
    }
    if (([v11 isAnySleepCoachingOnboardingCompleted] & 1) != 0
      || [v14 scheduledSleepMode])
    {
      id v16 = HKSPLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v17 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v32 = v17;
        id v18 = v17;
        _os_log_impl(&dword_221A52000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] creating sleep focus because we've already onboarded or enabled scheduledSleepMode", buf, 0xCu);
      }
      id v19 = [WeakRetained sleepModeManager];
      id v28 = 0;
      char v20 = objc_msgSend(v19, "createFocusModeInState:error:", objc_msgSend(MEMORY[0x263F75E68], "defaultConfigurationState"), &v28);
      id v21 = v28;

      if (v20) {
        goto LABEL_20;
      }
      id v22 = HKSPLogForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v32 = v23;
        id v24 = v23;
        _os_log_error_impl(&dword_221A52000, v22, OS_LOG_TYPE_ERROR, "[%{public}@] failed to migrate sleep focus", buf, 0xCu);
      }
    }
    else
    {
      id v22 = HKSPLogForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v32 = v25;
        id v26 = v25;
        _os_log_impl(&dword_221A52000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] skipping focus creation", buf, 0xCu);
      }
      id v21 = 0;
    }

LABEL_20:
    id v27 = NAEmptyResult();
    [v3 finishWithResult:v27 error:v21];

    goto LABEL_21;
  }
  char v7 = NAEmptyResult();
  [v3 finishWithResult:v7];

LABEL_23:
}

- (id)_migrateHomeScreenPage
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__HDSPSleepScheduleModelMigrationManager__migrateHomeScreenPage__block_invoke;
  v4[3] = &unk_2645D9F80;
  v4[4] = self;
  id v2 = [MEMORY[0x263F58190] lazyFutureWithBlock:v4];

  return v2;
}

void __64__HDSPSleepScheduleModelMigrationManager__migrateHomeScreenPage__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v5 = [WeakRetained sleepStorage];
  uint64_t v6 = [v5 localDataVersion];

  if (v6)
  {
    [v3 finishWithNoResult];
  }
  else
  {
    char v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = (id)objc_opt_class();
      id v8 = v33;
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] migrating home screen", buf, 0xCu);
    }
    id v9 = [WeakRetained sleepStorage];
    id v31 = 0;
    id v10 = [v9 loadSleepEventRecord:&v31];
    id v11 = v31;

    if (v10)
    {
      id v12 = [WeakRetained sleepStorage];
      id v30 = v11;
      v13 = [v12 loadSleepSettings:&v30];
      id v14 = v30;

      id v15 = (id)[v13 mutableCopy];
      if (v15)
      {
        if ([v10 isAnySleepWindDownShortcutsOnboardingCompleted]
          && (objc_msgSend(MEMORY[0x263EFFA40], "hksp_springBoardUserDefaults"),
              id v16 = objc_claimAutoreleasedReturnValue(),
              int v17 = objc_msgSend(v16, "hksp_BOOLForKey:", *MEMORY[0x263F75A68]),
              v16,
              v17))
        {
          id v18 = HKSPLogForCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            id v33 = v19;
            id v20 = v19;
            _os_log_impl(&dword_221A52000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] creating home screen page because we've already onboarded shortcuts", buf, 0xCu);
          }
          id v21 = [WeakRetained sleepModeManager];
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __64__HDSPSleepScheduleModelMigrationManager__migrateHomeScreenPage__block_invoke_288;
          v26[3] = &unk_2645D9FF8;
          v26[4] = *(void *)(a1 + 32);
          id v27 = v3;
          id v15 = v15;
          id v28 = v15;
          id v29 = WeakRetained;
          [v21 createHomeScreenPageWithCompletion:v26];
        }
        else
        {
          id v22 = HKSPLogForCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            id v23 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            id v33 = v23;
            id v24 = v23;
            _os_log_impl(&dword_221A52000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] skipping home screen page creation because we haven't onboarded shortcuts", buf, 0xCu);
          }
          [v3 finishWithNoResult];
        }
      }
      else
      {
        id v25 = NAEmptyResult();
        [v3 finishWithResult:v25 error:v14];
      }
    }
    else
    {
      NAEmptyResult();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      [v3 finishWithResult:v15 error:v11];
      id v14 = v11;
    }
  }
}

void __64__HDSPSleepScheduleModelMigrationManager__migrateHomeScreenPage__block_invoke_288(id *a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    char v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v13 = (id)objc_opt_class();
      __int16 v14 = 2114;
      id v15 = v6;
      id v10 = v13;
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to migrate home screen: %{public}@", buf, 0x16u);
    }
    [a1[5] finishWithError:v6];
  }
  else
  {
    if (a2)
    {
      [a1[6] setSpringBoardSuggestedPageCreated:1];
      id v8 = [a1[7] sleepStorage];
      id v9 = a1[6];
      id v11 = 0;
      [v8 saveSleepSettings:v9 error:&v11];
      id v6 = v11;
    }
    else
    {
      id v6 = 0;
    }
    [a1[5] finishWithNoResult];
  }
}

- (NSString)sourceIdentifier
{
  id v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end
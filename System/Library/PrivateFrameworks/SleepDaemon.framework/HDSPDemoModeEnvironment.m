@interface HDSPDemoModeEnvironment
+ (id)_sleepModeManagerProvider;
- (BOOL)isDemoEnvironment;
- (BOOL)isUnitTestEnvironment;
- (HDSPDemoModeEnvironment)init;
- (NSString)sourceIdentifier;
- (id)demoEventRecord;
- (id)demoScheduleModel;
- (id)demoSleepSchedule;
- (id)demoSleepSettings;
- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4;
- (void)environmentDidBecomeReady;
- (void)resetDemoMode;
- (void)setInitialSchedule;
- (void)setIsUnitTestEnvironment:(BOOL)a3;
@end

@implementation HDSPDemoModeEnvironment

- (HDSPDemoModeEnvironment)init
{
  v3 = [MEMORY[0x263F0A980] sharedBehavior];
  uint64_t v4 = [(id)objc_opt_class() _sleepModeManagerProvider];
  int v5 = objc_msgSend(v3, "hksp_supportsSleepAlarms");
  v6 = &__block_literal_global_307;
  if (!v5) {
    v6 = 0;
  }
  v17 = v6;
  int v18 = objc_msgSend(v3, "hksp_supportsHealthData");
  v19 = (void *)v4;
  if (v18) {
    v7 = (void *)[objc_alloc(MEMORY[0x263F75DE8]) initWithLocalDeviceHealthStore];
  }
  else {
    v7 = 0;
  }
  if (objc_msgSend(v3, "hksp_supportsSleepLockScreen")) {
    v8 = &__block_literal_global_328;
  }
  else {
    v8 = 0;
  }
  if (objc_msgSend(v3, "hksp_supportsSleepWidget")) {
    v9 = &__block_literal_global_332;
  }
  else {
    v9 = 0;
  }
  v10 = objc_alloc_init(HDSPAssertionManager);
  v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v12 = [MEMORY[0x263F08850] defaultManager];
  v13 = HKSPCurrentDateProvider();
  v14 = HKSPUnfairLockGenerator();
  v15 = objc_retain(-[HDSPEnvironment initWithBehavior:sleepStorageProvider:sleepScheduleModelManagerProvider:sleepSchedulerProvider:sleepServerProvider:sleepCoordinatorProvider:sleepModeManagerProvider:sleepTrackingManagerProvider:goodMorningAlertManagerProvider:chargingReminderManagerProvider:wakeDetectionManagerProvider:wakeUpResultsNotificationManagerProvider:actionManagerProvider:sleepAlarmManagerProvider:healthStoreProvider:contextStoreManagerProvider:biomeManagerProvider:migrationManagerProvider:notificationManagerProvider:notificationListenerProvider:sleepLockScreenManagerProvider:sleepWidgetManagerProvider:idsServiceManagerProvider:diagnosticsProvider:systemMonitorProvider:assertionManager:timeChangeListenerProvider:sensitiveUIMonitorProvider:analyticsManagerProvider:userDefaults:fileManager:currentDateProvider:defaultCallbackScheduler:mutexGenerator:](self, "initWithBehavior:sleepStorageProvider:sleepScheduleModelManagerProvider:sleepSchedulerProvider:sleepServerProvider:sleepCoordinatorProvider:sleepModeManagerProvider:sleepTrackingManagerProvider:goodMorningAlertManagerProvider:chargingReminderManagerProvider:wakeDetectionManagerProvider:wakeUpResultsNotificationManagerProvider:actionManagerProvider:sleepAlarmManagerProvider:healthStoreProvider:contextStoreManagerProvider:biomeManagerProvider:migrationManagerProvider:notificationManagerProvider:notificationListenerProvider:sleepLockScreenManagerProvider:sleepWidgetManagerProvider:idsServiceManagerProvider:diagnosticsProvider:systemMonitorProvider:assertionManager:timeChangeListenerProvider:sensitiveUIMonitorProvider:analyticsManagerProvider:userDefaults:fileManager:currentDateProvider:defaultCallbackScheduler:mutexGenerator:", v3, &__block_literal_global_0, &__block_literal_global_287, &__block_literal_global_291, &__block_literal_global_295, &__block_literal_global_299, v19, 0, 0,
            0,
            0,
            0,
            &__block_literal_global_303,
            v17,
            v7,
            &__block_literal_global_312,
            &__block_literal_global_316,
            &__block_literal_global_320,
            0,
            &__block_literal_global_324,
            v8,
            v9,
            &__block_literal_global_336,
            &__block_literal_global_340,
            &__block_literal_global_344,
            v10,
            &__block_literal_global_349,
            &__block_literal_global_353,
            0,
            v11,
            v12,
            v13,
            0,
            v14));

  if (v18) {
  return v15;
  }
}

HDSPSleepStorage *__31__HDSPDemoModeEnvironment_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPSleepStorage alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSleepScheduleModelManager *__31__HDSPDemoModeEnvironment_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPSleepScheduleModelManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSleepEventScheduler *__31__HDSPDemoModeEnvironment_init__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPSleepEventScheduler alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSleepStoreServer *__31__HDSPDemoModeEnvironment_init__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPSleepStoreServer alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSleepScheduleStateCoordinator *__31__HDSPDemoModeEnvironment_init__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPSleepScheduleStateCoordinator alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSleepActionManager *__31__HDSPDemoModeEnvironment_init__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPSleepActionManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSleepAlarmManager *__31__HDSPDemoModeEnvironment_init__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPSleepAlarmManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPContextStoreManager *__31__HDSPDemoModeEnvironment_init__block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPContextStoreManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPBiomeManager *__31__HDSPDemoModeEnvironment_init__block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPBiomeManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSleepScheduleModelMigrationManager *__31__HDSPDemoModeEnvironment_init__block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPSleepScheduleModelMigrationManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPNotificationListener *__31__HDSPDemoModeEnvironment_init__block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPNotificationListener alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSleepLockScreenManager *__31__HDSPDemoModeEnvironment_init__block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPSleepLockScreenManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSleepWidgetManager *__31__HDSPDemoModeEnvironment_init__block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPSleepWidgetManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPIDSServiceManager *__31__HDSPDemoModeEnvironment_init__block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPIDSServiceManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPDiagnostics *__31__HDSPDemoModeEnvironment_init__block_invoke_15(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPDiagnostics alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSystemMonitor *__31__HDSPDemoModeEnvironment_init__block_invoke_16(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPSystemMonitor alloc] initWithEnvironment:v2];

  return v3;
}

HDSPTimeChangeListener *__31__HDSPDemoModeEnvironment_init__block_invoke_17(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPTimeChangeListener alloc] initWithEnvironment:v2];

  return v3;
}

id __31__HDSPDemoModeEnvironment_init__block_invoke_18(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x263F75E48];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithEnvironment:v3];

  return v4;
}

- (BOOL)isDemoEnvironment
{
  return 1;
}

+ (id)_sleepModeManagerProvider
{
  return &__block_literal_global_359;
}

id __52__HDSPDemoModeEnvironment__sleepModeManagerProvider__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [v2 isUnitTestEnvironment];
  uint64_t v4 = [HDSPSleepModeManager alloc];
  if (v3) {
    uint64_t v5 = [(HDSPSleepModeManager *)v4 initWithEnvironment:v2 sleepFocusModeBridge:0 sleepProactiveBridge:0];
  }
  else {
    uint64_t v5 = [(HDSPSleepModeManager *)v4 initWithEnvironment:v2];
  }
  v6 = (void *)v5;

  return v6;
}

- (void)environmentDidBecomeReady
{
  v3.receiver = self;
  v3.super_class = (Class)HDSPDemoModeEnvironment;
  [(HDSPEnvironment *)&v3 environmentDidBecomeReady];
  [(HDSPDemoModeEnvironment *)self setInitialSchedule];
}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  [(HDSPDemoModeEnvironment *)self resetDemoMode];
  uint64_t v4 = (void *)MEMORY[0x263F58190];

  return (id)[v4 futureWithNoResult];
}

- (void)setInitialSchedule
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_super v3 = [(HDSPEnvironment *)self sleepScheduleModelManager];
  uint64_t v4 = [v3 sleepSchedule];

  if (!v4)
  {
    uint64_t v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = (id)objc_opt_class();
      id v6 = v8;
      _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] setting initial demo schedule", (uint8_t *)&v7, 0xCu);
    }
    [(HDSPDemoModeEnvironment *)self resetDemoMode];
  }
}

- (void)resetDemoMode
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_super v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = (id)objc_opt_class();
    id v4 = v8;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] resetDemoMode", buf, 0xCu);
  }
  uint64_t v5 = [(HDSPEnvironment *)self sleepModeManager];
  [v5 setSleepMode:0];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__HDSPDemoModeEnvironment_resetDemoMode__block_invoke;
  v6[3] = &unk_2645D90C0;
  v6[4] = self;
  [(HDSPEnvironment *)self perform:v6 withSource:self];
}

void __40__HDSPDemoModeEnvironment_resetDemoMode__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) sleepScheduleModelManager];
  id v15 = 0;
  char v3 = [v2 saveSleepSchedule:0 error:&v15];
  id v4 = v15;

  if ((v3 & 1) == 0)
  {
    uint64_t v9 = HKSPLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v17 = v10;
      __int16 v18 = 2114;
      id v19 = v4;
      id v11 = v10;
      _os_log_error_impl(&dword_221A52000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] failed to delete schedule with error %{public}@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  uint64_t v5 = [*(id *)(a1 + 32) sleepScheduleModelManager];
  id v6 = [*(id *)(a1 + 32) demoScheduleModel];
  id v14 = v4;
  char v7 = [v5 saveSleepScheduleModel:v6 error:&v14];
  id v8 = v14;

  if ((v7 & 1) == 0)
  {
    uint64_t v9 = HKSPLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v17 = v12;
      __int16 v18 = 2114;
      id v19 = v8;
      id v13 = v12;
      _os_log_error_impl(&dword_221A52000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] failed to save model with error %{public}@", buf, 0x16u);
    }
    id v4 = v8;
LABEL_8:

    id v8 = v4;
  }
}

- (id)demoScheduleModel
{
  char v3 = (void *)MEMORY[0x263F75E88];
  id v4 = [(HDSPDemoModeEnvironment *)self demoSleepSchedule];
  uint64_t v5 = [(HDSPDemoModeEnvironment *)self demoSleepSettings];
  id v6 = [(HDSPDemoModeEnvironment *)self demoEventRecord];
  char v7 = [v3 sleepScheduleModelWithSleepSchedule:v4 sleepSettings:v5 sleepEventRecord:v6];

  return v7;
}

- (id)demoSleepSettings
{
  id v2 = objc_alloc_init(MEMORY[0x263F75E18]);
  [v2 setScheduledSleepMode:1];
  [v2 setSleepTracking:1];
  [v2 setTimeInBedTracking:1];
  [v2 setBedtimeReminders:1];
  [v2 setChargingReminders:1];
  [v2 setWakeUpResults:1];
  objc_msgSend(v2, "setSleepModeOptions:", objc_msgSend(v2, "sleepModeOptions") | 0x4000);

  return v2;
}

- (id)demoSleepSchedule
{
  id v2 = objc_alloc_init(MEMORY[0x263F75E10]);
  [v2 setWeekdays:*MEMORY[0x263F75D68]];
  id v3 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v3 setHour:7];
  [v3 setMinute:0];
  id v4 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v4 setHour:23];
  [v4 setMinute:0];
  [v2 setWakeUpComponents:v3];
  [v2 setBedtimeComponents:v4];
  uint64_t v5 = [v2 alarmConfiguration];
  id v6 = (void *)[v5 mutableCopy];

  [v6 setEnabled:0];
  [v2 setAlarmConfiguration:v6];
  id v7 = objc_alloc_init(MEMORY[0x263F75E10]);
  [v7 setWeekdays:*MEMORY[0x263F75D70]];
  id v8 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v8 setHour:8];
  [v8 setMinute:0];
  id v9 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v9 setHour:0];
  [v9 setMinute:0];
  [v7 setWakeUpComponents:v8];
  [v7 setBedtimeComponents:v9];
  v10 = [v7 alarmConfiguration];
  id v11 = (void *)[v10 mutableCopy];

  [v11 setEnabled:0];
  [v7 setAlarmConfiguration:v11];
  id v12 = objc_alloc_init(MEMORY[0x263F75E08]);
  [v12 saveOccurrence:v2];
  [v12 saveOccurrence:v7];
  [v12 setSleepDurationGoal:*MEMORY[0x263F75C00] * 3600.0];
  id v13 = (void *)[v12 copy];

  return v13;
}

- (id)demoEventRecord
{
  id v3 = [(HDSPEnvironment *)self sleepScheduleModelManager];
  id v4 = [v3 sleepEventRecord];
  uint64_t v5 = (void *)[v4 mutableCopy];
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x263F75E00]);
  }
  id v8 = v7;

  [v8 setSleepCoachingOnboardingCompletedVersion:3];
  [v8 setSleepTrackingOnboardingCompletedVersion:3];
  [v8 setSleepWindDownShortcutsOnboardingCompletedVersion:2];
  id v9 = [v8 sleepCoachingOnboardingFirstCompletedDate];
  if (v9)
  {
    [v8 setSleepCoachingOnboardingFirstCompletedDate:v9];
  }
  else
  {
    v10 = [(HDSPEnvironment *)self currentDateProvider];
    id v11 = v10[2]();
    [v8 setSleepCoachingOnboardingFirstCompletedDate:v11];
  }
  id v12 = [v8 sleepTrackingOnboardingFirstCompletedDate];
  if (v12)
  {
    [v8 setSleepTrackingOnboardingFirstCompletedDate:v12];
  }
  else
  {
    id v13 = [(HDSPEnvironment *)self currentDateProvider];
    id v14 = v13[2]();
    [v8 setSleepTrackingOnboardingFirstCompletedDate:v14];
  }
  id v15 = [v8 sleepWindDownShortcutsOnboardingFirstCompletedDate];
  if (v15)
  {
    [v8 setSleepWindDownShortcutsOnboardingFirstCompletedDate:v15];
  }
  else
  {
    v16 = [(HDSPEnvironment *)self currentDateProvider];
    v17 = v16[2]();
    [v8 setSleepWindDownShortcutsOnboardingFirstCompletedDate:v17];
  }

  return v8;
}

- (NSString)sourceIdentifier
{
  id v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (BOOL)isUnitTestEnvironment
{
  return self->isUnitTestEnvironment;
}

- (void)setIsUnitTestEnvironment:(BOOL)a3
{
  self->isUnitTestEnvironment = a3;
}

@end
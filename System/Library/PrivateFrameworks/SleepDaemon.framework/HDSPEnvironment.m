@interface HDSPEnvironment
+ (id)_sleepTrackingManagerProviderForBehavior:(id)a3;
+ (id)demoModeEnvironment;
+ (id)disabledEnvironment;
+ (id)standardEnvironment;
- (BOOL)isDemoEnvironment;
- (BOOL)isDisabled;
- (BOOL)isEnvironmentReady;
- (BOOL)isSystemReady;
- (BOOL)isUnitTestEnvironment;
- (BOOL)needsDataMigration;
- (HDSPAnalyticsManager)analyticsManager;
- (HDSPAssertionManager)assertionManager;
- (HDSPBiomeManager)biomeManager;
- (HDSPChargingReminderManager)chargingReminderManager;
- (HDSPContextStoreManager)contextStoreManager;
- (HDSPDiagnostics)diagnostics;
- (HDSPEnvironment)initWithBehavior:(id)a3 sleepStorageProvider:(id)a4 sleepScheduleModelManagerProvider:(id)a5 sleepSchedulerProvider:(id)a6 sleepServerProvider:(id)a7 sleepCoordinatorProvider:(id)a8 sleepModeManagerProvider:(id)a9 sleepTrackingManagerProvider:(id)a10 goodMorningAlertManagerProvider:(id)a11 chargingReminderManagerProvider:(id)a12 wakeDetectionManagerProvider:(id)a13 wakeUpResultsNotificationManagerProvider:(id)a14 actionManagerProvider:(id)a15 sleepAlarmManagerProvider:(id)a16 healthStoreProvider:(id)a17 contextStoreManagerProvider:(id)a18 biomeManagerProvider:(id)a19 migrationManagerProvider:(id)a20 notificationManagerProvider:(id)a21 notificationListenerProvider:(id)a22 sleepLockScreenManagerProvider:(id)a23 sleepWidgetManagerProvider:(id)a24 idsServiceManagerProvider:(id)a25 diagnosticsProvider:(id)a26 systemMonitorProvider:(id)a27 assertionManager:(id)a28 timeChangeListenerProvider:(id)a29 sensitiveUIMonitorProvider:(id)a30 analyticsManagerProvider:(id)a31 userDefaults:(id)a32 fileManager:(id)a33 currentDateProvider:(id)a34 defaultCallbackScheduler:(id)a35 mutexGenerator:(id)a36;
- (HDSPEnvironmentStateMachine)stateMachine;
- (HDSPGoodMorningAlertManager)goodMorningAlertManager;
- (HDSPIDSServiceManager)idsServiceManager;
- (HDSPNotificationListener)notificationListener;
- (HDSPSleepActionManager)actionManager;
- (HDSPSleepAlarmManager)sleepAlarmManager;
- (HDSPSleepEventScheduler)sleepScheduler;
- (HDSPSleepLockScreenManager)sleepLockScreenManager;
- (HDSPSleepModeManager)sleepModeManager;
- (HDSPSleepNotificationManager)notificationManager;
- (HDSPSleepScheduleModelManager)sleepScheduleModelManager;
- (HDSPSleepScheduleModelMigrationManager)migrationManager;
- (HDSPSleepScheduleStateCoordinator)sleepCoordinator;
- (HDSPSleepStorage)sleepStorage;
- (HDSPSleepStoreServer)sleepServer;
- (HDSPSleepTrackingManager)sleepTrackingManager;
- (HDSPSleepWidgetManager)sleepWidgetManager;
- (HDSPSystemMonitor)systemMonitor;
- (HDSPTimeChangeListener)timeChangeListener;
- (HDSPWakeDetectionManager)wakeDetectionManager;
- (HDSPWakeUpResultsNotificationManager)wakeUpResultsNotificationManager;
- (HKSPFileManager)fileManager;
- (HKSPHealthStoreProvider)healthStoreProvider;
- (HKSPMutexProvider)mutexProvider;
- (HKSPScheduler)defaultCallbackScheduler;
- (HKSPSensitiveUIMonitor)sensitiveUIMonitor;
- (HKSPUserDefaults)userDefaults;
- (NAFuture)environmentIsReady;
- (NAScheduler)callbackScheduler;
- (_HKBehavior)behavior;
- (id)_environmentAwareComponents;
- (id)currentContext;
- (id)currentDateProvider;
- (id)currentSource;
- (id)currentState;
- (id)diagnosticDescription;
- (id)diagnosticInfo;
- (id)mutexGenerator;
- (void)_withLock:(id)a3;
- (void)dealloc;
- (void)environmentDidBecomeReady;
- (void)environmentShouldMigrateData;
- (void)perform:(id)a3 withContext:(id)a4;
- (void)perform:(id)a3 withSource:(id)a4;
- (void)performWhenEnvironmentIsReady:(id)a3;
- (void)performWhenEnvironmentIsReady:(id)a3 withContext:(id)a4;
- (void)prepare;
- (void)shutdown;
- (void)systemDidBecomeReady;
- (void)updateState;
@end

@implementation HDSPEnvironment

- (BOOL)isDisabled
{
  return 0;
}

void __61__HDSPEnvironment_performWhenEnvironmentIsReady_withContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = WeakRetained;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(WeakRetained, "perform:withContext:", v3);
  }
  else {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
}

- (void)perform:(id)a3 withContext:(id)a4
{
  v13 = (void (**)(void))a3;
  id v5 = a4;
  v6 = [MEMORY[0x263F08B88] currentThread];
  v7 = [v6 threadDictionary];

  if (v5)
  {
    v8 = [v7 objectForKeyedSubscript:@"HDSPEnvironmentContext"];
    v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    v11 = v10;

    [v11 addObject:v5];
    [v7 setObject:v11 forKeyedSubscript:@"HDSPEnvironmentContext"];

    v13[2]();
    v12 = [v7 objectForKeyedSubscript:@"HDSPEnvironmentContext"];
    [v12 removeLastObject];
  }
  else
  {
    v13[2]();
  }
}

- (HDSPSleepScheduleModelManager)sleepScheduleModelManager
{
  return self->_sleepScheduleModelManager;
}

- (void)performWhenEnvironmentIsReady:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    environmentIsReady = self->_environmentIsReady;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __61__HDSPEnvironment_performWhenEnvironmentIsReady_withContext___block_invoke;
    v10[3] = &unk_2645D9AB8;
    objc_copyWeak(&v13, &location);
    id v11 = v7;
    id v12 = v6;
    id v9 = (id)[(NAFuture *)environmentIsReady addSuccessBlock:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

+ (id)standardEnvironment
{
  uint64_t v3 = [MEMORY[0x263F0A980] sharedBehavior];
  v32 = [HDSPEnvironment alloc];
  uint64_t v4 = [a1 _sleepTrackingManagerProviderForBehavior:v3];
  int v5 = objc_msgSend(v3, "hksp_supportsGoodMorningAlerts");
  id v6 = &__block_literal_global_308;
  if (!v5) {
    id v6 = 0;
  }
  v31 = v6;
  int v7 = objc_msgSend(v3, "hksp_supportsChargingReminders");
  v8 = &__block_literal_global_312_0;
  if (!v7) {
    v8 = 0;
  }
  v30 = v8;
  int v9 = objc_msgSend(v3, "hksp_supportsWakeDetection");
  id v10 = &__block_literal_global_316_0;
  if (!v9) {
    id v10 = 0;
  }
  v29 = v10;
  int v11 = objc_msgSend(v3, "hksp_supportsWakeUpResults");
  id v12 = &__block_literal_global_320_0;
  if (!v11) {
    id v12 = 0;
  }
  v27 = v12;
  int v13 = objc_msgSend(v3, "hksp_supportsSleepAlarms");
  v14 = &__block_literal_global_328_0;
  if (!v13) {
    v14 = 0;
  }
  v26 = v14;
  int v15 = objc_msgSend(v3, "hksp_supportsHealthData");
  v33 = (void *)v4;
  if (v15) {
    v28 = (void *)[objc_alloc(MEMORY[0x263F75DE8]) initWithLocalDeviceHealthStore];
  }
  else {
    v28 = 0;
  }
  if (objc_msgSend(v3, "hksp_supportsSleepLockScreen")) {
    v16 = &__block_literal_global_353_0;
  }
  else {
    v16 = 0;
  }
  if (objc_msgSend(v3, "hksp_supportsSleepWidget")) {
    v17 = &__block_literal_global_357;
  }
  else {
    v17 = 0;
  }
  v18 = objc_alloc_init(HDSPAssertionManager);
  if (objc_msgSend(v3, "hksp_supportsDailyAnalytics")) {
    v19 = &__block_literal_global_382;
  }
  else {
    v19 = 0;
  }
  v20 = objc_msgSend(MEMORY[0x263EFFA40], "hksp_sleepdUserDefaults");
  v21 = [MEMORY[0x263F08850] defaultManager];
  v22 = HKSPCurrentDateProvider();
  v23 = HKSPUnfairLockGenerator();
  v24 = -[HDSPEnvironment initWithBehavior:sleepStorageProvider:sleepScheduleModelManagerProvider:sleepSchedulerProvider:sleepServerProvider:sleepCoordinatorProvider:sleepModeManagerProvider:sleepTrackingManagerProvider:goodMorningAlertManagerProvider:chargingReminderManagerProvider:wakeDetectionManagerProvider:wakeUpResultsNotificationManagerProvider:actionManagerProvider:sleepAlarmManagerProvider:healthStoreProvider:contextStoreManagerProvider:biomeManagerProvider:migrationManagerProvider:notificationManagerProvider:notificationListenerProvider:sleepLockScreenManagerProvider:sleepWidgetManagerProvider:idsServiceManagerProvider:diagnosticsProvider:systemMonitorProvider:assertionManager:timeChangeListenerProvider:sensitiveUIMonitorProvider:analyticsManagerProvider:userDefaults:fileManager:currentDateProvider:defaultCallbackScheduler:mutexGenerator:](v32, "initWithBehavior:sleepStorageProvider:sleepScheduleModelManagerProvider:sleepSchedulerProvider:sleepServerProvider:sleepCoordinatorProvider:sleepModeManagerProvider:sleepTrackingManagerProvider:goodMorningAlertManagerProvider:chargingReminderManagerProvider:wakeDetectionManagerProvider:wakeUpResultsNotificationManagerProvider:actionManagerProvider:sleepAlarmManagerProvider:healthStoreProvider:contextStoreManagerProvider:biomeManagerProvider:migrationManagerProvider:notificationManagerProvider:notificationListenerProvider:sleepLockScreenManagerProvider:sleepWidgetManagerProvider:idsServiceManagerProvider:diagnosticsProvider:systemMonitorProvider:assertionManager:timeChangeListenerProvider:sensitiveUIMonitorProvider:analyticsManagerProvider:userDefaults:fileManager:currentDateProvider:defaultCallbackScheduler:mutexGenerator:", v3, &__block_literal_global_3, &__block_literal_global_288, &__block_literal_global_292, &__block_literal_global_296, &__block_literal_global_300, &__block_literal_global_304, v33, v31, v30,
          v29,
          v27,
          &__block_literal_global_324_0,
          v26,
          v28,
          &__block_literal_global_333,
          &__block_literal_global_337,
          &__block_literal_global_341,
          &__block_literal_global_345,
          &__block_literal_global_349_0,
          v16,
          v17,
          &__block_literal_global_361,
          &__block_literal_global_365,
          &__block_literal_global_369,
          v18,
          &__block_literal_global_374,
          &__block_literal_global_378,
          v19,
          v20,
          v21,
          v22,
          0,
          v23);

  if (v15) {

  }
  return v24;
}

HDSPSleepStorage *__38__HDSPEnvironment_standardEnvironment__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPSleepStorage alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSleepScheduleModelManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPSleepScheduleModelManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSleepEventScheduler *__38__HDSPEnvironment_standardEnvironment__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPSleepEventScheduler alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSleepStoreServer *__38__HDSPEnvironment_standardEnvironment__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPSleepStoreServer alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSleepScheduleStateCoordinator *__38__HDSPEnvironment_standardEnvironment__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPSleepScheduleStateCoordinator alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSleepModeManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPSleepModeManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPGoodMorningAlertManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPGoodMorningAlertManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPChargingReminderManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPChargingReminderManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPWakeDetectionManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPWakeDetectionManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPWakeUpResultsNotificationManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPWakeUpResultsNotificationManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSleepActionManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPSleepActionManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSleepAlarmManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPSleepAlarmManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPContextStoreManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPContextStoreManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPBiomeManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPBiomeManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSleepScheduleModelMigrationManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_15(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPSleepScheduleModelMigrationManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSleepNotificationManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_16(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPSleepNotificationManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPNotificationListener *__38__HDSPEnvironment_standardEnvironment__block_invoke_17(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPNotificationListener alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSleepLockScreenManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_18(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPSleepLockScreenManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSleepWidgetManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_19(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPSleepWidgetManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPIDSServiceManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_20(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPIDSServiceManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPDiagnostics *__38__HDSPEnvironment_standardEnvironment__block_invoke_21(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPDiagnostics alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSystemMonitor *__38__HDSPEnvironment_standardEnvironment__block_invoke_22(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPSystemMonitor alloc] initWithEnvironment:v2];

  return v3;
}

HDSPTimeChangeListener *__38__HDSPEnvironment_standardEnvironment__block_invoke_23(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HDSPTimeChangeListener alloc] initWithEnvironment:v2];

  return v3;
}

id __38__HDSPEnvironment_standardEnvironment__block_invoke_24(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x263F75E48];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithEnvironment:v3];

  return v4;
}

HDSPAnalyticsManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_25(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[HDSPAnalyticsManager alloc] initWithEnvironment:v2];

  return v3;
}

+ (id)_sleepTrackingManagerProviderForBehavior:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "hksp_supportsSleepTracking"))
  {
    if (objc_msgSend(v3, "hksp_supportsAlwaysOnTracking")) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = &__block_literal_global_388;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

HDSPSleepTrackingManager *__60__HDSPEnvironment__sleepTrackingManagerProviderForBehavior___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[HDSPSleepTrackingManager alloc] initWithEnvironment:v2];

  return v3;
}

- (HDSPEnvironment)initWithBehavior:(id)a3 sleepStorageProvider:(id)a4 sleepScheduleModelManagerProvider:(id)a5 sleepSchedulerProvider:(id)a6 sleepServerProvider:(id)a7 sleepCoordinatorProvider:(id)a8 sleepModeManagerProvider:(id)a9 sleepTrackingManagerProvider:(id)a10 goodMorningAlertManagerProvider:(id)a11 chargingReminderManagerProvider:(id)a12 wakeDetectionManagerProvider:(id)a13 wakeUpResultsNotificationManagerProvider:(id)a14 actionManagerProvider:(id)a15 sleepAlarmManagerProvider:(id)a16 healthStoreProvider:(id)a17 contextStoreManagerProvider:(id)a18 biomeManagerProvider:(id)a19 migrationManagerProvider:(id)a20 notificationManagerProvider:(id)a21 notificationListenerProvider:(id)a22 sleepLockScreenManagerProvider:(id)a23 sleepWidgetManagerProvider:(id)a24 idsServiceManagerProvider:(id)a25 diagnosticsProvider:(id)a26 systemMonitorProvider:(id)a27 assertionManager:(id)a28 timeChangeListenerProvider:(id)a29 sensitiveUIMonitorProvider:(id)a30 analyticsManagerProvider:(id)a31 userDefaults:(id)a32 fileManager:(id)a33 currentDateProvider:(id)a34 defaultCallbackScheduler:(id)a35 mutexGenerator:(id)a36
{
  uint64_t v164 = *MEMORY[0x263EF8340];
  id v136 = a3;
  v158 = (void (**)(id, HDSPEnvironment *))a4;
  v157 = (void (**)(id, HDSPEnvironment *))a5;
  v156 = (void (**)(id, HDSPEnvironment *))a6;
  v155 = (void (**)(id, HDSPEnvironment *))a7;
  id v41 = a8;
  v137 = (void (**)(id, HDSPEnvironment *))a9;
  v42 = (void (**)(void, HDSPEnvironment *))a10;
  v43 = (void (**)(id, HDSPEnvironment *))a11;
  v44 = (void (**)(id, HDSPEnvironment *))a12;
  v45 = (void (**)(void, HDSPEnvironment *))a13;
  v46 = (void (**)(void, HDSPEnvironment *))a14;
  v47 = (void (**)(void, HDSPEnvironment *))a15;
  v154 = (void (**)(id, HDSPEnvironment *))a16;
  id v135 = a17;
  v153 = (void (**)(id, HDSPEnvironment *))a18;
  v152 = (void (**)(id, HDSPEnvironment *))a19;
  v151 = (void (**)(id, HDSPEnvironment *))a20;
  v150 = (void (**)(void))a21;
  v149 = (void (**)(void))a22;
  v148 = (void (**)(void))a23;
  v147 = (void (**)(void))a24;
  v146 = (void (**)(void))a25;
  v145 = (void (**)(void))a26;
  v144 = (void (**)(void))a27;
  v143 = (void (**)(void))a29;
  v142 = (void (**)(void))a30;
  v141 = (void (**)(void))a31;
  id v134 = a32;
  id v133 = a33;
  id v140 = a34;
  id v139 = a35;
  id v138 = a36;
  v159.receiver = self;
  v159.super_class = (Class)HDSPEnvironment;
  v48 = [(HDSPEnvironment *)&v159 init];
  if (v48)
  {
    v127 = v46;
    v128 = v47;
    v126 = v45;
    v132 = v43;
    v49 = v42;
    id v50 = v41;
    v51 = HKSPLogForCategory();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v161 = v52;
      __int16 v162 = 2048;
      v163 = v48;
      id v53 = v52;
      _os_log_impl(&dword_221A52000, v51, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);
    }
    objc_storeStrong((id *)&v48->_behavior, a3);
    v130 = v50;
    if (v139)
    {
      v54 = (HKSPScheduler *)v139;
      defaultCallbackScheduler = v48->_defaultCallbackScheduler;
      v48->_defaultCallbackScheduler = v54;
    }
    else
    {
      defaultCallbackScheduler = HKSPDispatchQueueName();
      uint64_t v56 = HKSPSerialQueueBackedScheduler();
      v57 = v48->_defaultCallbackScheduler;
      v48->_defaultCallbackScheduler = (HKSPScheduler *)v56;
    }
    uint64_t v58 = [v140 copy];
    id currentDateProvider = v48->_currentDateProvider;
    v48->_id currentDateProvider = (id)v58;

    objc_storeStrong((id *)&v48->_userDefaults, a32);
    objc_storeStrong((id *)&v48->_fileManager, a33);
    v60 = (NAFuture *)objc_alloc_init(MEMORY[0x263F58190]);
    environmentIsReady = v48->_environmentIsReady;
    v48->_environmentIsReady = v60;

    uint64_t v62 = [v138 copy];
    id mutexGenerator = v48->_mutexGenerator;
    v48->_id mutexGenerator = (id)v62;

    uint64_t v64 = (*((void (**)(void))v48->_mutexGenerator + 2))();
    mutexProvider = v48->_mutexProvider;
    v48->_mutexProvider = (HKSPMutexProvider *)v64;

    v66 = v49;
    if (v145)
    {
      uint64_t v67 = v145[2]();
      diagnostics = v48->_diagnostics;
      v48->_diagnostics = (HDSPDiagnostics *)v67;
    }
    else
    {
      diagnostics = v48->_diagnostics;
      v48->_diagnostics = 0;
    }

    [(HDSPDiagnostics *)v48->_diagnostics addProvider:v48];
    v69 = objc_alloc_init(HDSPAssertionManager);
    assertionManager = v48->_assertionManager;
    v48->_assertionManager = v69;

    [(HDSPDiagnostics *)v48->_diagnostics addProvider:v48->_assertionManager];
    v45 = v126;
    if (v153)
    {
      uint64_t v71 = v153[2](v153, v48);
      contextStoreManager = v48->_contextStoreManager;
      v48->_contextStoreManager = (HDSPContextStoreManager *)v71;
    }
    else
    {
      contextStoreManager = v48->_contextStoreManager;
      v48->_contextStoreManager = 0;
    }

    if (v152)
    {
      uint64_t v73 = v152[2](v152, v48);
      biomeManager = v48->_biomeManager;
      v48->_biomeManager = (HDSPBiomeManager *)v73;
    }
    else
    {
      biomeManager = v48->_biomeManager;
      v48->_biomeManager = 0;
    }

    if (v144)
    {
      uint64_t v75 = v144[2]();
      systemMonitor = v48->_systemMonitor;
      v48->_systemMonitor = (HDSPSystemMonitor *)v75;
    }
    else
    {
      systemMonitor = v48->_systemMonitor;
      v48->_systemMonitor = 0;
    }

    [(HDSPSystemMonitor *)v48->_systemMonitor setDelegate:v48];
    objc_storeStrong((id *)&v48->_healthStoreProvider, a17);
    if (v158)
    {
      uint64_t v77 = v158[2](v158, v48);
      sleepStorage = v48->_sleepStorage;
      v48->_sleepStorage = (HDSPSleepStorage *)v77;
    }
    else
    {
      sleepStorage = v48->_sleepStorage;
      v48->_sleepStorage = 0;
    }

    if (v151)
    {
      uint64_t v79 = v151[2](v151, v48);
      migrationManager = v48->_migrationManager;
      v48->_migrationManager = (HDSPSleepScheduleModelMigrationManager *)v79;
    }
    else
    {
      migrationManager = v48->_migrationManager;
      v48->_migrationManager = 0;
    }

    if (v157)
    {
      uint64_t v81 = v157[2](v157, v48);
      sleepScheduleModelManager = v48->_sleepScheduleModelManager;
      v48->_sleepScheduleModelManager = (HDSPSleepScheduleModelManager *)v81;
    }
    else
    {
      sleepScheduleModelManager = v48->_sleepScheduleModelManager;
      v48->_sleepScheduleModelManager = 0;
    }

    if (v156)
    {
      uint64_t v83 = v156[2](v156, v48);
      sleepScheduler = v48->_sleepScheduler;
      v48->_sleepScheduler = (HDSPSleepEventScheduler *)v83;
    }
    else
    {
      sleepScheduler = v48->_sleepScheduler;
      v48->_sleepScheduler = 0;
    }

    if (v50)
    {
      uint64_t v85 = (*((void (**)(void))v50 + 2))();
      sleepCoordinator = v48->_sleepCoordinator;
      v48->_sleepCoordinator = (HDSPSleepScheduleStateCoordinator *)v85;
    }
    else
    {
      sleepCoordinator = v48->_sleepCoordinator;
      v48->_sleepCoordinator = 0;
    }

    if (v137)
    {
      uint64_t v87 = v137[2](v137, v48);
      sleepModeManager = v48->_sleepModeManager;
      v48->_sleepModeManager = (HDSPSleepModeManager *)v87;
    }
    else
    {
      sleepModeManager = v48->_sleepModeManager;
      v48->_sleepModeManager = 0;
    }

    if (v66)
    {
      uint64_t v89 = v66[2](v66, v48);
      sleepTrackingManager = v48->_sleepTrackingManager;
      v48->_sleepTrackingManager = (HDSPSleepTrackingManager *)v89;
    }
    else
    {
      sleepTrackingManager = v48->_sleepTrackingManager;
      v48->_sleepTrackingManager = 0;
    }

    if (v43)
    {
      uint64_t v91 = v43[2](v43, v48);
      goodMorningAlertManager = v48->_goodMorningAlertManager;
      v48->_goodMorningAlertManager = (HDSPGoodMorningAlertManager *)v91;
    }
    else
    {
      goodMorningAlertManager = v48->_goodMorningAlertManager;
      v48->_goodMorningAlertManager = 0;
    }

    if (v44)
    {
      uint64_t v93 = v44[2](v44, v48);
      chargingReminderManager = v48->_chargingReminderManager;
      v48->_chargingReminderManager = (HDSPChargingReminderManager *)v93;
    }
    else
    {
      chargingReminderManager = v48->_chargingReminderManager;
      v48->_chargingReminderManager = 0;
    }

    if (v127)
    {
      uint64_t v95 = v127[2](v127, v48);
      wakeUpResultsNotificationManager = v48->_wakeUpResultsNotificationManager;
      v48->_wakeUpResultsNotificationManager = (HDSPWakeUpResultsNotificationManager *)v95;
    }
    else
    {
      wakeUpResultsNotificationManager = v48->_wakeUpResultsNotificationManager;
      v48->_wakeUpResultsNotificationManager = 0;
    }

    if (v126)
    {
      uint64_t v97 = v126[2](v126, v48);
      wakeDetectionManager = v48->_wakeDetectionManager;
      v48->_wakeDetectionManager = (HDSPWakeDetectionManager *)v97;
    }
    else
    {
      wakeDetectionManager = v48->_wakeDetectionManager;
      v48->_wakeDetectionManager = 0;
    }

    if (v128)
    {
      uint64_t v99 = v128[2](v128, v48);
      actionManager = v48->_actionManager;
      v48->_actionManager = (HDSPSleepActionManager *)v99;
    }
    else
    {
      actionManager = v48->_actionManager;
      v48->_actionManager = 0;
    }

    if (v154)
    {
      uint64_t v101 = v154[2](v154, v48);
      sleepAlarmManager = v48->_sleepAlarmManager;
      v48->_sleepAlarmManager = (HDSPSleepAlarmManager *)v101;
    }
    else
    {
      sleepAlarmManager = v48->_sleepAlarmManager;
      v48->_sleepAlarmManager = 0;
    }

    if (v150)
    {
      uint64_t v103 = v150[2]();
      notificationManager = v48->_notificationManager;
      v48->_notificationManager = (HDSPSleepNotificationManager *)v103;
    }
    else
    {
      notificationManager = v48->_notificationManager;
      v48->_notificationManager = 0;
    }

    if (v149)
    {
      uint64_t v105 = v149[2]();
      notificationListener = v48->_notificationListener;
      v48->_notificationListener = (HDSPNotificationListener *)v105;
    }
    else
    {
      notificationListener = v48->_notificationListener;
      v48->_notificationListener = 0;
    }

    if (v148)
    {
      uint64_t v107 = v148[2]();
      sleepLockScreenManager = v48->_sleepLockScreenManager;
      v48->_sleepLockScreenManager = (HDSPSleepLockScreenManager *)v107;
    }
    else
    {
      sleepLockScreenManager = v48->_sleepLockScreenManager;
      v48->_sleepLockScreenManager = 0;
    }

    if (v147)
    {
      uint64_t v109 = v147[2]();
      sleepWidgetManager = v48->_sleepWidgetManager;
      v48->_sleepWidgetManager = (HDSPSleepWidgetManager *)v109;
    }
    else
    {
      sleepWidgetManager = v48->_sleepWidgetManager;
      v48->_sleepWidgetManager = 0;
    }

    if (v146)
    {
      uint64_t v111 = v146[2]();
      idsServiceManager = v48->_idsServiceManager;
      v48->_idsServiceManager = (HDSPIDSServiceManager *)v111;
    }
    else
    {
      idsServiceManager = v48->_idsServiceManager;
      v48->_idsServiceManager = 0;
    }

    if (v155)
    {
      uint64_t v113 = v155[2](v155, v48);
      p_sleepServer = (id *)&v48->_sleepServer;
      sleepServer = v48->_sleepServer;
      v48->_sleepServer = (HDSPSleepStoreServer *)v113;
    }
    else
    {
      p_sleepServer = (id *)&v48->_sleepServer;
      sleepServer = v48->_sleepServer;
      v48->_sleepServer = 0;
    }

    [*p_sleepServer startListening];
    if (v143)
    {
      uint64_t v116 = v143[2]();
      timeChangeListener = v48->_timeChangeListener;
      v48->_timeChangeListener = (HDSPTimeChangeListener *)v116;
    }
    else
    {
      timeChangeListener = v48->_timeChangeListener;
      v48->_timeChangeListener = 0;
    }
    v43 = v132;

    if (v142)
    {
      uint64_t v118 = v142[2]();
      sensitiveUIMonitor = v48->_sensitiveUIMonitor;
      v48->_sensitiveUIMonitor = (HKSPSensitiveUIMonitor *)v118;
    }
    else
    {
      sensitiveUIMonitor = v48->_sensitiveUIMonitor;
      v48->_sensitiveUIMonitor = 0;
    }
    v42 = v66;

    v47 = v128;
    v46 = v127;
    if (v141)
    {
      uint64_t v120 = v141[2]();
      analyticsManager = v48->_analyticsManager;
      v48->_analyticsManager = (HDSPAnalyticsManager *)v120;
    }
    else
    {
      analyticsManager = v48->_analyticsManager;
      v48->_analyticsManager = 0;
    }

    v122 = [[HDSPEnvironmentStateMachine alloc] initWithDelegate:v48 infoProvider:v48];
    stateMachine = v48->_stateMachine;
    v48->_stateMachine = v122;

    v124 = v48;
    id v41 = v130;
  }

  return v48;
}

+ (id)disabledEnvironment
{
  id v2 = objc_alloc_init(HDSPDisabledEnvironment);

  return v2;
}

+ (id)demoModeEnvironment
{
  id v2 = objc_alloc_init(HDSPDemoModeEnvironment);

  return v2;
}

- (void)dealloc
{
  [(HDSPEnvironment *)self shutdown];
  v3.receiver = self;
  v3.super_class = (Class)HDSPEnvironment;
  [(HDSPEnvironment *)&v3 dealloc];
}

- (void)shutdown
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_super v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = (id)objc_opt_class();
    id v4 = v8;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] shutdown", buf, 0xCu);
  }
  int v5 = [(HDSPEnvironment *)self _environmentAwareComponents];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __27__HDSPEnvironment_shutdown__block_invoke;
  v6[3] = &unk_2645D9A90;
  v6[4] = self;
  objc_msgSend(v5, "na_each:", v6);
}

void __27__HDSPEnvironment_shutdown__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 environmentWillInvalidate:*(void *)(a1 + 32)];
  }
}

- (void)_withLock:(id)a3
{
}

- (void)performWhenEnvironmentIsReady:(id)a3
{
}

- (void)perform:(id)a3 withSource:(id)a4
{
  id v6 = a3;
  id v7 = +[HDSPEnvironmentContext contextWithSource:a4];
  [(HDSPEnvironment *)self perform:v6 withContext:v7];
}

- (id)currentContext
{
  id v2 = [MEMORY[0x263F08B88] currentThread];
  id v3 = [v2 threadDictionary];
  id v4 = [v3 objectForKeyedSubscript:@"HDSPEnvironmentContext"];

  int v5 = [v4 lastObject];

  return v5;
}

- (id)currentSource
{
  id v2 = [(HDSPEnvironment *)self currentContext];
  id v3 = [v2 source];

  return v3;
}

- (void)prepare
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] prepare", (uint8_t *)&v5, 0xCu);
  }
  [(HDSPEnvironment *)self updateState];
}

- (void)updateState
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] updateState", buf, 0xCu);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__HDSPEnvironment_updateState__block_invoke;
  v5[3] = &unk_2645D90C0;
  v5[4] = self;
  [(HDSPEnvironment *)self _withLock:v5];
}

uint64_t __30__HDSPEnvironment_updateState__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) updateState];
}

- (void)systemDidBecomeReady
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] systemDidBecomeReady", buf, 0xCu);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__HDSPEnvironment_systemDidBecomeReady__block_invoke;
  v5[3] = &unk_2645D90C0;
  v5[4] = self;
  [(HDSPEnvironment *)self _withLock:v5];
}

uint64_t __39__HDSPEnvironment_systemDidBecomeReady__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) systemDidBecomeReady];
}

- (BOOL)isEnvironmentReady
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__HDSPEnvironment_isEnvironmentReady__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPEnvironment *)self _withLock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __37__HDSPEnvironment_isEnvironmentReady__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 80) currentState];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 80) readyState];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 == v2;
}

- (BOOL)isSystemReady
{
  return [(HDSPSystemMonitor *)self->_systemMonitor isSystemReady];
}

- (BOOL)needsDataMigration
{
  return [(HDSPSleepScheduleModelMigrationManager *)self->_migrationManager needDataMigration];
}

- (void)environmentShouldMigrateData
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = (id)objc_opt_class();
    id v4 = v9;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] environment needs migration", buf, 0xCu);
  }
  uint64_t v5 = [(HDSPSleepScheduleModelMigrationManager *)self->_migrationManager performDataMigration];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__HDSPEnvironment_environmentShouldMigrateData__block_invoke;
  v7[3] = &unk_2645D9AE0;
  v7[4] = self;
  id v6 = (id)[v5 addCompletionBlock:v7];
}

void __47__HDSPEnvironment_environmentShouldMigrateData__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2114;
    id v12 = v4;
    id v6 = v10;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] dataMigrationDidComplete (error: %{public}@))", buf, 0x16u);
  }
  uint64_t v7 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__HDSPEnvironment_environmentShouldMigrateData__block_invoke_407;
  v8[3] = &unk_2645D90C0;
  v8[4] = v7;
  [v7 _withLock:v8];
}

uint64_t __47__HDSPEnvironment_environmentShouldMigrateData__block_invoke_407(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) dataMigrationDidComplete];
}

- (NAScheduler)callbackScheduler
{
  return self->_defaultCallbackScheduler;
}

- (id)_environmentAwareComponents
{
  id v3 = objc_opt_new();
  objc_msgSend(v3, "na_safeAddObject:", self->_sleepStorage);
  objc_msgSend(v3, "na_safeAddObject:", self->_sleepScheduleModelManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_migrationManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_actionManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_sleepServer);
  objc_msgSend(v3, "na_safeAddObject:", self->_sleepAlarmManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_sleepTrackingManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_chargingReminderManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_wakeUpResultsNotificationManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_goodMorningAlertManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_wakeDetectionManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_sleepCoordinator);
  objc_msgSend(v3, "na_safeAddObject:", self->_contextStoreManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_biomeManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_sleepModeManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_sleepScheduler);
  objc_msgSend(v3, "na_safeAddObject:", self->_systemMonitor);
  objc_msgSend(v3, "na_safeAddObject:", self->_notificationManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_diagnostics);
  objc_msgSend(v3, "na_safeAddObject:", self->_timeChangeListener);
  objc_msgSend(v3, "na_safeAddObject:", self->_notificationListener);
  objc_msgSend(v3, "na_safeAddObject:", self->_sleepLockScreenManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_sleepWidgetManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_idsServiceManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_analyticsManager);
  id v4 = (void *)[v3 copy];

  return v4;
}

- (void)environmentDidBecomeReady
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [(HDSPEnvironment *)self _environmentAwareComponents];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__HDSPEnvironment_environmentDidBecomeReady__block_invoke;
  v8[3] = &unk_2645D9A90;
  v8[4] = self;
  objc_msgSend(v3, "na_each:", v8);
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v10 = v5;
    id v6 = v5;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] environment is ready", buf, 0xCu);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__HDSPEnvironment_environmentDidBecomeReady__block_invoke_411;
  v7[3] = &unk_2645D9A90;
  v7[4] = self;
  objc_msgSend(v3, "na_each:", v7);
  [(NAFuture *)self->_environmentIsReady finishWithNoResult];
}

void __44__HDSPEnvironment_environmentDidBecomeReady__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 environmentWillBecomeReady:*(void *)(a1 + 32)];
  }
}

void __44__HDSPEnvironment_environmentDidBecomeReady__block_invoke_411(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 environmentDidBecomeReady:*(void *)(a1 + 32)];
  }
}

- (BOOL)isDemoEnvironment
{
  id v2 = [(HDSPEnvironment *)self behavior];
  char v3 = objc_msgSend(v2, "hksp_demoMode");

  return v3;
}

- (BOOL)isUnitTestEnvironment
{
  return 0;
}

- (id)currentState
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__5;
  id v9 = __Block_byref_object_dispose__5;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__HDSPEnvironment_currentState__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPEnvironment *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __31__HDSPEnvironment_currentState__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 80) currentState];

  return MEMORY[0x270F9A758]();
}

- (id)diagnosticDescription
{
  char v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(HDSPEnvironment *)self currentState];
  uint64_t v7 = [v3 stringWithFormat:@"(%@) Current State: %@, System Ready: %d, Environment Ready: %d", v5, v6, -[HDSPEnvironment isSystemReady](self, "isSystemReady"), -[HDSPEnvironment isEnvironmentReady](self, "isEnvironmentReady")];

  return v7;
}

- (id)diagnosticInfo
{
  v14[4] = *MEMORY[0x263EF8340];
  v13[0] = @"Environment";
  char v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v14[0] = v4;
  v13[1] = @"Current State";
  uint64_t v5 = [(HDSPEnvironment *)self currentState];
  uint64_t v6 = [v5 stateName];
  uint64_t v7 = (void *)v6;
  char v8 = @"none";
  if (v6) {
    char v8 = (__CFString *)v6;
  }
  v14[1] = v8;
  v13[2] = @"System Ready";
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[HDSPEnvironment isSystemReady](self, "isSystemReady"));
  v14[2] = v9;
  v13[3] = @"Environment Ready";
  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HDSPEnvironment isEnvironmentReady](self, "isEnvironmentReady"));
  v14[3] = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

- (_HKBehavior)behavior
{
  return self->_behavior;
}

- (HDSPSleepStorage)sleepStorage
{
  return self->_sleepStorage;
}

- (HDSPSleepEventScheduler)sleepScheduler
{
  return self->_sleepScheduler;
}

- (HDSPSleepScheduleStateCoordinator)sleepCoordinator
{
  return self->_sleepCoordinator;
}

- (HDSPSleepModeManager)sleepModeManager
{
  return self->_sleepModeManager;
}

- (HDSPSleepTrackingManager)sleepTrackingManager
{
  return self->_sleepTrackingManager;
}

- (HDSPSleepActionManager)actionManager
{
  return self->_actionManager;
}

- (HDSPSleepNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (HDSPEnvironmentStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (HKSPMutexProvider)mutexProvider
{
  return self->_mutexProvider;
}

- (NAFuture)environmentIsReady
{
  return self->_environmentIsReady;
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (HKSPUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (HDSPSleepStoreServer)sleepServer
{
  return self->_sleepServer;
}

- (HDSPGoodMorningAlertManager)goodMorningAlertManager
{
  return self->_goodMorningAlertManager;
}

- (HDSPChargingReminderManager)chargingReminderManager
{
  return self->_chargingReminderManager;
}

- (HDSPWakeDetectionManager)wakeDetectionManager
{
  return self->_wakeDetectionManager;
}

- (HDSPWakeUpResultsNotificationManager)wakeUpResultsNotificationManager
{
  return self->_wakeUpResultsNotificationManager;
}

- (HDSPSleepAlarmManager)sleepAlarmManager
{
  return self->_sleepAlarmManager;
}

- (HKSPHealthStoreProvider)healthStoreProvider
{
  return self->_healthStoreProvider;
}

- (HDSPDiagnostics)diagnostics
{
  return self->_diagnostics;
}

- (HDSPNotificationListener)notificationListener
{
  return self->_notificationListener;
}

- (HDSPSleepLockScreenManager)sleepLockScreenManager
{
  return self->_sleepLockScreenManager;
}

- (HDSPSleepWidgetManager)sleepWidgetManager
{
  return self->_sleepWidgetManager;
}

- (HDSPSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (HDSPAssertionManager)assertionManager
{
  return self->_assertionManager;
}

- (HDSPTimeChangeListener)timeChangeListener
{
  return self->_timeChangeListener;
}

- (HKSPSensitiveUIMonitor)sensitiveUIMonitor
{
  return self->_sensitiveUIMonitor;
}

- (HDSPSleepScheduleModelMigrationManager)migrationManager
{
  return self->_migrationManager;
}

- (HDSPContextStoreManager)contextStoreManager
{
  return self->_contextStoreManager;
}

- (HDSPBiomeManager)biomeManager
{
  return self->_biomeManager;
}

- (HDSPIDSServiceManager)idsServiceManager
{
  return self->_idsServiceManager;
}

- (HKSPScheduler)defaultCallbackScheduler
{
  return self->_defaultCallbackScheduler;
}

- (HDSPAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (HKSPFileManager)fileManager
{
  return self->_fileManager;
}

- (id)mutexGenerator
{
  return self->_mutexGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mutexGenerator, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_defaultCallbackScheduler, 0);
  objc_storeStrong((id *)&self->_idsServiceManager, 0);
  objc_storeStrong((id *)&self->_biomeManager, 0);
  objc_storeStrong((id *)&self->_contextStoreManager, 0);
  objc_storeStrong((id *)&self->_migrationManager, 0);
  objc_storeStrong((id *)&self->_sensitiveUIMonitor, 0);
  objc_storeStrong((id *)&self->_timeChangeListener, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_sleepWidgetManager, 0);
  objc_storeStrong((id *)&self->_sleepLockScreenManager, 0);
  objc_storeStrong((id *)&self->_notificationListener, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_healthStoreProvider, 0);
  objc_storeStrong((id *)&self->_sleepAlarmManager, 0);
  objc_storeStrong((id *)&self->_wakeUpResultsNotificationManager, 0);
  objc_storeStrong((id *)&self->_wakeDetectionManager, 0);
  objc_storeStrong((id *)&self->_chargingReminderManager, 0);
  objc_storeStrong((id *)&self->_goodMorningAlertManager, 0);
  objc_storeStrong((id *)&self->_sleepServer, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_environmentIsReady, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_sleepTrackingManager, 0);
  objc_storeStrong((id *)&self->_sleepModeManager, 0);
  objc_storeStrong((id *)&self->_sleepCoordinator, 0);
  objc_storeStrong((id *)&self->_sleepScheduler, 0);
  objc_storeStrong((id *)&self->_sleepStorage, 0);
  objc_storeStrong((id *)&self->_sleepScheduleModelManager, 0);

  objc_storeStrong((id *)&self->_behavior, 0);
}

@end
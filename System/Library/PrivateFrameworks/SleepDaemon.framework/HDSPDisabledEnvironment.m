@interface HDSPDisabledEnvironment
- (BOOL)isDisabled;
- (HDSPDisabledEnvironment)init;
- (void)prepare;
@end

@implementation HDSPDisabledEnvironment

- (HDSPDisabledEnvironment)init
{
  v3 = [MEMORY[0x263F0A980] sharedBehavior];
  v4 = HKSPCurrentDateProvider();
  v5 = HKSPUnfairLockGenerator();
  v8.receiver = self;
  v8.super_class = (Class)HDSPDisabledEnvironment;
  v6 = -[HDSPEnvironment initWithBehavior:sleepStorageProvider:sleepScheduleModelManagerProvider:sleepSchedulerProvider:sleepServerProvider:sleepCoordinatorProvider:sleepModeManagerProvider:sleepTrackingManagerProvider:goodMorningAlertManagerProvider:chargingReminderManagerProvider:wakeDetectionManagerProvider:wakeUpResultsNotificationManagerProvider:actionManagerProvider:sleepAlarmManagerProvider:healthStoreProvider:contextStoreManagerProvider:biomeManagerProvider:migrationManagerProvider:notificationManagerProvider:notificationListenerProvider:sleepLockScreenManagerProvider:sleepWidgetManagerProvider:idsServiceManagerProvider:diagnosticsProvider:systemMonitorProvider:assertionManager:timeChangeListenerProvider:sensitiveUIMonitorProvider:analyticsManagerProvider:userDefaults:fileManager:currentDateProvider:defaultCallbackScheduler:mutexGenerator:](&v8, sel_initWithBehavior_sleepStorageProvider_sleepScheduleModelManagerProvider_sleepSchedulerProvider_sleepServerProvider_sleepCoordinatorProvider_sleepModeManagerProvider_sleepTrackingManagerProvider_goodMorningAlertManagerProvider_chargingReminderManagerProvider_wakeDetectionManagerProvider_wakeUpResultsNotificationManagerProvider_actionManagerProvider_sleepAlarmManagerProvider_healthStoreProvider_contextStoreManagerProvider_biomeManagerProvider_migrationManagerProvider_notificationManagerProvider_notificationListenerProvider_sleepLockScreenManagerProvider_sleepWidgetManagerProvider_idsServiceManagerProvider_diagnosticsProvider_systemMonitorProvider_assertionManager_timeChangeListenerProvider_sensitiveUIMonitorProvider_analyticsManagerProvider_userDefaults_fileManager_currentDateProvider_defaultCallbackScheduler_mutexGenerator_, v3, 0, 0, 0, &__block_literal_global_20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, &__block_literal_global_284_1,
         0,
         0,
         &__block_literal_global_288_0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         v4,
         0,
         v5);

  return v6;
}

HDSPSleepStoreServer *__31__HDSPDisabledEnvironment_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPSleepStoreServer alloc] initWithEnvironment:v2];

  return v3;
}

HDSPBiomeManager *__31__HDSPDisabledEnvironment_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPBiomeManager alloc] initWithEnvironment:v2];

  return v3;
}

HDSPNotificationListener *__31__HDSPDisabledEnvironment_init__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPNotificationListener alloc] initWithEnvironment:v2];

  return v3;
}

- (void)prepare
{
  v3 = [(HDSPEnvironment *)self biomeManager];
  v4 = +[HDSPBiomeManager sleepModePublisher];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__HDSPDisabledEnvironment_prepare__block_invoke;
  v6[3] = &unk_2645DAA80;
  v6[4] = self;
  id v5 = (id)[v3 subscribe:v4 callback:v6];

  [(HDSPEnvironment *)self environmentDidBecomeReady];
}

void __34__HDSPDisabledEnvironment_prepare__block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v0 = HKSPLogForCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 138543362;
    id v3 = (id)objc_opt_class();
    id v1 = v3;
    _os_log_impl(&dword_221A52000, v0, OS_LOG_TYPE_DEFAULT, "[%{public}@] dropping Biome callback", (uint8_t *)&v2, 0xCu);
  }
}

- (BOOL)isDisabled
{
  return 1;
}

@end
@interface HDSPSleepNotificationManager
- (BOOL)_bedtimeOrWindDownNotificationsEnabled;
- (HDSPEnvironment)environment;
- (HDSPSleepEventDelegate)sleepEventDelegate;
- (HDSPSleepNotificationManager)initWithEnvironment:(id)a3;
- (HDSPSleepNotificationManager)initWithEnvironment:(id)a3 notificationPublishers:(id)a4;
- (NSArray)notificationPublishers;
- (NSString)providerIdentifier;
- (id)_bedtimeNotificationEventAfterDate:(id)a3;
- (id)_sleepScheduleModel;
- (id)_windDownNotificationEventAfterDate:(id)a3;
- (id)eventIdentifiers;
- (id)upcomingEventsDueAfterDate:(id)a3;
- (void)_bedtimeOrWindDownNotificationEventIsDue:(id)a3;
- (void)_rescheduleEvents;
- (void)_tearDownBedtimeReminder;
- (void)_tearDownChargingReminder;
- (void)_tearDownMorningNotification;
- (void)_tearDownWakeDetectionNotification;
- (void)_tearDownWindDownReminder;
- (void)environmentDidBecomeReady:(id)a3;
- (void)environmentWillBecomeReady:(id)a3;
- (void)presentAlertForGoodMorning;
- (void)publishNotificationForEvent:(id)a3;
- (void)setSleepEventDelegate:(id)a3;
- (void)significantTimeChangeDetected:(id)a3;
- (void)sleepEventIsDue:(id)a3;
- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepSchedule:(id)a4;
- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5;
- (void)tearDownNotificationForEventIdentifier:(id)a3;
- (void)tearDownNotifications;
@end

@implementation HDSPSleepNotificationManager

- (HDSPSleepNotificationManager)initWithEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v6 = [v4 behavior];
  int v7 = objc_msgSend(v6, "hksp_supportsUserNotificationCenter");

  if (v7)
  {
    v8 = [[HDSPUserNotificationCenter alloc] initWithEnvironment:v4];
    [v5 addObject:v8];
  }
  v9 = [v4 behavior];
  int v10 = objc_msgSend(v9, "hksp_supportsCFUserNotifications");

  if (v10)
  {
    v11 = [[HDSPCFUserNotificationCenter alloc] initWithEnvironment:v4];
    [v5 addObject:v11];
  }
  v12 = [v4 behavior];
  int v13 = [v12 isAppleWatch];

  if (v13)
  {
    v14 = [[HDSPDarwinNotificationCenter alloc] initWithEnvironment:v4];
    [v5 addObject:v14];
  }
  v15 = [(HDSPSleepNotificationManager *)self initWithEnvironment:v4 notificationPublishers:v5];

  return v15;
}

- (HDSPSleepNotificationManager)initWithEnvironment:(id)a3 notificationPublishers:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDSPSleepNotificationManager;
  v8 = [(HDSPSleepNotificationManager *)&v14 init];
  if (v8)
  {
    v9 = HKSPLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      __int16 v17 = 2048;
      v18 = v8;
      id v11 = v10;
      _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);
    }
    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeStrong((id *)&v8->_notificationPublishers, a4);
    v12 = v8;
  }

  return v8;
}

- (void)environmentWillBecomeReady:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = (id)objc_opt_class();
    id v6 = v21;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentWillBecomeReady", buf, 0xCu);
  }
  id v7 = [v4 sleepScheduleModelManager];
  [v7 addObserver:self];

  v8 = [v4 sleepScheduler];
  [v8 addEventHandler:self];

  v9 = [v4 sleepScheduler];
  [v9 addEventProvider:self];

  int v10 = [v4 actionManager];
  [v10 addObserver:self];

  id v11 = [v4 sleepCoordinator];
  [v11 addObserver:self];

  v12 = [v4 timeChangeListener];
  [v12 addObserver:self];

  int v13 = [v4 behavior];
  int v14 = [v13 isAppleWatch];

  if (v14)
  {
    v15 = [v4 goodMorningAlertManager];
    [v15 addObserver:self];
  }
  notificationPublishers = self->_notificationPublishers;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __59__HDSPSleepNotificationManager_environmentWillBecomeReady___block_invoke;
  v18[3] = &unk_2645DAB10;
  id v19 = v4;
  id v17 = v4;
  [(NSArray *)notificationPublishers na_each:v18];
}

void __59__HDSPSleepNotificationManager_environmentWillBecomeReady___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 environmentWillBecomeReady:*(void *)(a1 + 32)];
  }
}

- (void)environmentDidBecomeReady:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentDidBecomeReady", buf, 0xCu);
  }
  notificationPublishers = self->_notificationPublishers;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__HDSPSleepNotificationManager_environmentDidBecomeReady___block_invoke;
  v9[3] = &unk_2645D9F30;
  id v10 = v4;
  id v8 = v4;
  [(NSArray *)notificationPublishers na_each:v9];
  [(HDSPSleepNotificationManager *)self _rescheduleEvents];
}

void __58__HDSPSleepNotificationManager_environmentDidBecomeReady___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 environmentDidBecomeReady:*(void *)(a1 + 32)];
  }
}

- (void)publishNotificationForEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2114;
    id v14 = v4;
    id v6 = v12;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] publishNotificationForEvent: %{public}@", buf, 0x16u);
  }
  notificationPublishers = self->_notificationPublishers;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__HDSPSleepNotificationManager_publishNotificationForEvent___block_invoke;
  v9[3] = &unk_2645DAB38;
  id v10 = v4;
  id v8 = v4;
  [(NSArray *)notificationPublishers na_each:v9];
}

uint64_t __60__HDSPSleepNotificationManager_publishNotificationForEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 publishNotificationForEvent:*(void *)(a1 + 32)];
}

- (void)tearDownNotificationForEventIdentifier:(id)a3
{
  id v4 = a3;
  notificationPublishers = self->_notificationPublishers;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__HDSPSleepNotificationManager_tearDownNotificationForEventIdentifier___block_invoke;
  v7[3] = &unk_2645DAB38;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)notificationPublishers na_each:v7];
}

uint64_t __71__HDSPSleepNotificationManager_tearDownNotificationForEventIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 tearDownNotificationForEventIdentifier:*(void *)(a1 + 32)];
}

- (void)tearDownNotifications
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] tearDownNotifications", (uint8_t *)&v5, 0xCu);
  }
  [(NSArray *)self->_notificationPublishers na_each:&__block_literal_global_23];
}

uint64_t __53__HDSPSleepNotificationManager_tearDownNotifications__block_invoke(uint64_t a1, void *a2)
{
  return [a2 tearDownNotifications];
}

- (NSString)providerIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)upcomingEventsDueAfterDate:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = [(HDSPSleepNotificationManager *)self _windDownNotificationEventAfterDate:v5];
  objc_msgSend(v6, "na_safeAddObject:", v7);

  id v8 = [(HDSPSleepNotificationManager *)self _bedtimeNotificationEventAfterDate:v5];

  objc_msgSend(v6, "na_safeAddObject:", v8);
  v9 = (void *)[v6 copy];

  return v9;
}

- (void)sleepEventIsDue:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v17 = 138543618;
    *(void *)&v17[4] = objc_opt_class();
    *(_WORD *)&v17[12] = 2114;
    *(void *)&v17[14] = v4;
    id v6 = *(id *)&v17[4];
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepEventIsDue: %{public}@", v17, 0x16u);
  }
  uint64_t v7 = [v4 identifier];
  if ([v7 isEqualToString:*MEMORY[0x263F75C20]])
  {

    goto LABEL_6;
  }
  id v8 = [v4 identifier];
  int v9 = [v8 isEqualToString:*MEMORY[0x263F75C58]];

  if (!v9)
  {
    id v10 = [v4 identifier];
    int v11 = [v10 isEqualToString:*MEMORY[0x263F75C40]];

    if (v11)
    {
      [(HDSPSleepNotificationManager *)self _tearDownWakeDetectionNotification];
      goto LABEL_17;
    }
    id v12 = [v4 identifier];
    if (([v12 isEqualToString:*MEMORY[0x263F75C28]] & 1) == 0)
    {
      __int16 v13 = [v4 identifier];
      if (([v13 isEqualToString:*MEMORY[0x263F75C38]] & 1) == 0)
      {
        id v14 = [v4 identifier];
        if (![v14 isEqualToString:*MEMORY[0x263F75C48]])
        {
          uint64_t v15 = [v4 identifier];
          char v16 = [v15 isEqualToString:*MEMORY[0x263F75C30]];

          if ((v16 & 1) == 0) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
      }
    }

LABEL_16:
    -[HDSPSleepNotificationManager publishNotificationForEvent:](self, "publishNotificationForEvent:", v4, *(void *)v17, *(_OWORD *)&v17[8], v18);
    goto LABEL_17;
  }
LABEL_6:
  if ([(HDSPSleepNotificationManager *)self _bedtimeOrWindDownNotificationsEnabled])
  {
    [(HDSPSleepNotificationManager *)self _bedtimeOrWindDownNotificationEventIsDue:v4];
  }
LABEL_17:
}

- (id)eventIdentifiers
{
  if (qword_26AB79120 != -1) {
    dispatch_once(&qword_26AB79120, &__block_literal_global_289_0);
  }
  v2 = (void *)_MergedGlobals_20;

  return v2;
}

uint64_t __48__HDSPSleepNotificationManager_eventIdentifiers__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v1 = (void *)_MergedGlobals_20;
  _MergedGlobals_20 = (uint64_t)v0;

  [(id)_MergedGlobals_20 addObject:*MEMORY[0x263F75C20]];
  [(id)_MergedGlobals_20 addObject:*MEMORY[0x263F75C58]];
  [(id)_MergedGlobals_20 addObject:*MEMORY[0x263F75C40]];
  [(id)_MergedGlobals_20 addObject:*MEMORY[0x263F75C28]];
  [(id)_MergedGlobals_20 addObject:*MEMORY[0x263F75C38]];
  [(id)_MergedGlobals_20 addObject:*MEMORY[0x263F75C48]];
  v2 = (void *)_MergedGlobals_20;
  uint64_t v3 = *MEMORY[0x263F75C30];

  return [v2 addObject:v3];
}

- (void)presentAlertForGoodMorning
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = (id)objc_opt_class();
    id v4 = v13;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] posting good morning notification", (uint8_t *)&v12, 0xCu);
  }
  id v5 = (void *)MEMORY[0x263F75E50];
  uint64_t v6 = *MEMORY[0x263F75C30];
  uint64_t v7 = [(HDSPSleepNotificationManager *)self environment];
  id v8 = [v7 currentDateProvider];
  id v10 = v8[2](v8, v9);
  int v11 = [v5 sleepEventWithIdentifier:v6 dueDate:v10];

  [(HDSPSleepNotificationManager *)self publishNotificationForEvent:v11];
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepSchedule:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v8 = 138543618;
    *(void *)&v8[4] = objc_opt_class();
    *(_WORD *)&v8[12] = 2114;
    *(void *)&v8[14] = v5;
    id v7 = *(id *)&v8[4];
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] didUpdateSleepSchedule: %{public}@", v8, 0x16u);
  }
  if (!v5 || ([v5 isEnabledAndHasOccurrences] & 1) == 0) {
    [(HDSPSleepNotificationManager *)self tearDownNotifications];
  }
  [(HDSPSleepNotificationManager *)self _rescheduleEvents];
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_opt_class();
    id v9 = v8;
    id v10 = NSStringFromHKSPSleepScheduleState();
    int v11 = NSStringFromHKSPSleepScheduleState();
    int v12 = NSStringFromHKSPSleepScheduleStateChangeReason();
    int v19 = 138544130;
    v20 = v8;
    __int16 v21 = 2114;
    uint64_t v22 = v10;
    __int16 v23 = 2114;
    v24 = v11;
    __int16 v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepScheduleStateChanged from %{public}@ to %{public}@ for %{public}@", (uint8_t *)&v19, 0x2Au);
  }
  if (a3 == 1)
  {
    char v16 = HKSPLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = objc_opt_class();
      int v19 = 138543362;
      v20 = v17;
      id v18 = v17;
      _os_log_impl(&dword_221A52000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] tearing down notifications at wake up", (uint8_t *)&v19, 0xCu);
    }
    [(HDSPSleepNotificationManager *)self _tearDownWindDownReminder];
    [(HDSPSleepNotificationManager *)self _tearDownBedtimeReminder];
    [(HDSPSleepNotificationManager *)self _tearDownWakeDetectionNotification];
  }
  else if (a3 == 2)
  {
    id v13 = HKSPLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      int v19 = 138543362;
      v20 = v14;
      id v15 = v14;
      _os_log_impl(&dword_221A52000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] tearing down notifications at bedtime", (uint8_t *)&v19, 0xCu);
    }
    [(HDSPSleepNotificationManager *)self _tearDownChargingReminder];
  }
  [(HDSPSleepNotificationManager *)self _rescheduleEvents];
}

- (void)significantTimeChangeDetected:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v5 = v7;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Significant time change detected", (uint8_t *)&v6, 0xCu);
  }
  [(HDSPSleepNotificationManager *)self _rescheduleEvents];
}

- (void)_tearDownChargingReminder
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] tearing down charging reminder", (uint8_t *)&v5, 0xCu);
  }
  [(HDSPSleepNotificationManager *)self tearDownNotificationForEventIdentifier:*MEMORY[0x263F75C28]];
}

- (void)_tearDownBedtimeReminder
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] tearing down bedtime reminder", (uint8_t *)&v5, 0xCu);
  }
  [(HDSPSleepNotificationManager *)self tearDownNotificationForEventIdentifier:*MEMORY[0x263F75C20]];
}

- (void)_tearDownWindDownReminder
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] tearing down wind down reminder", (uint8_t *)&v5, 0xCu);
  }
  [(HDSPSleepNotificationManager *)self tearDownNotificationForEventIdentifier:*MEMORY[0x263F75C58]];
}

- (void)_tearDownWakeDetectionNotification
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] tearing down wake detection notification", (uint8_t *)&v5, 0xCu);
  }
  [(HDSPSleepNotificationManager *)self tearDownNotificationForEventIdentifier:*MEMORY[0x263F75C38]];
}

- (void)_tearDownMorningNotification
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] tearing down good morning notification", (uint8_t *)&v5, 0xCu);
  }
  [(HDSPSleepNotificationManager *)self tearDownNotificationForEventIdentifier:*MEMORY[0x263F75C30]];
}

- (id)_sleepScheduleModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v3 = [WeakRetained sleepScheduleModelManager];
  id v4 = [v3 sleepScheduleModel];

  return v4;
}

- (void)_rescheduleEvents
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HDSPSleepNotificationManager *)self _bedtimeOrWindDownNotificationsEnabled];
  id v4 = HKSPLogForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138543362;
      id v10 = (id)objc_opt_class();
      id v6 = v10;
      _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Telling scheduler we have events to schedule", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v7 = [(HDSPSleepNotificationManager *)self sleepEventDelegate];
    [v7 eventProviderHasUpcomingEvents:self];
  }
  else
  {
    if (v5)
    {
      int v9 = 138543362;
      id v10 = (id)objc_opt_class();
      id v8 = v10;
      _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Bedtime and wind down notifications disabled", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v7 = [(HDSPSleepNotificationManager *)self sleepEventDelegate];
    [v7 eventProviderCancelledEvents:self];
  }
}

- (id)_bedtimeNotificationEventAfterDate:(id)a3
{
  id v4 = a3;
  if ([(HDSPSleepNotificationManager *)self _bedtimeOrWindDownNotificationsEnabled])
  {
    BOOL v5 = [(HDSPSleepNotificationManager *)self _sleepScheduleModel];
    id v6 = [v5 nextEventWithIdentifier:*MEMORY[0x263F75C18] dueAfterDate:v4];

    if (v6)
    {
      uint64_t v7 = [v6 dateByAddingTimeInterval:-*MEMORY[0x263F75D80]];
      id v8 = [MEMORY[0x263F75E50] sleepEventWithIdentifier:*MEMORY[0x263F75C20] dueDate:v7 expirationDate:v6 isUserVisible:1];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_windDownNotificationEventAfterDate:(id)a3
{
  id v4 = a3;
  if ([(HDSPSleepNotificationManager *)self _bedtimeOrWindDownNotificationsEnabled])
  {
    BOOL v5 = [(HDSPSleepNotificationManager *)self _sleepScheduleModel];
    id v6 = [v5 nextEventWithIdentifier:*MEMORY[0x263F75C50] dueAfterDate:v4];

    if (v6)
    {
      uint64_t v7 = [v6 dateByAddingTimeInterval:-*MEMORY[0x263F75D80]];
      id v8 = [MEMORY[0x263F75E50] sleepEventWithIdentifier:*MEMORY[0x263F75C58] dueDate:v7 expirationDate:v6 isUserVisible:1];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)_bedtimeOrWindDownNotificationsEnabled
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HDSPSleepNotificationManager *)self _sleepScheduleModel];
  id v4 = [v3 sleepSettings];
  BOOL v5 = [(HDSPSleepNotificationManager *)self environment];
  id v6 = [v5 behavior];
  if (![v6 isAppleWatch])
  {

    goto LABEL_7;
  }
  char v7 = [v4 watchSleepFeaturesEnabled];

  if (v7)
  {
LABEL_7:
    char v10 = [v4 bedtimeReminders];
    goto LABEL_8;
  }
  id v8 = HKSPLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = (id)objc_opt_class();
    id v9 = v13;
    _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Bedtime and wind down notifications disabled since sleep features are disabled on Watch.", (uint8_t *)&v12, 0xCu);
  }
  char v10 = 0;
LABEL_8:

  return v10;
}

- (void)_bedtimeOrWindDownNotificationEventIsDue:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v6 = [WeakRetained sleepCoordinator];
  [v6 sleepEventIsDue:v4];

  id v7 = objc_loadWeakRetained((id *)&self->_environment);
  id v8 = [v7 sleepCoordinator];
  unint64_t v9 = [v8 currentSleepScheduleState];

  if (v9 <= 6)
  {
    if (((1 << v9) & 0x4D) != 0)
    {
      char v10 = HKSPLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = objc_opt_class();
        id v12 = v11;
        id v13 = NSStringFromHKSPSleepScheduleState();
        int v14 = 138543874;
        id v15 = v11;
        __int16 v16 = 2114;
        id v17 = v4;
        __int16 v18 = 2114;
        int v19 = v13;
        _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring event %{public}@ due to being in current state %{public}@", (uint8_t *)&v14, 0x20u);
      }
    }
    else if (v9 == 1)
    {
      [(HDSPSleepNotificationManager *)self publishNotificationForEvent:v4];
    }
  }
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (HDSPSleepEventDelegate)sleepEventDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sleepEventDelegate);

  return (HDSPSleepEventDelegate *)WeakRetained;
}

- (void)setSleepEventDelegate:(id)a3
{
}

- (NSArray)notificationPublishers
{
  return self->_notificationPublishers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationPublishers, 0);
  objc_destroyWeak((id *)&self->_sleepEventDelegate);

  objc_destroyWeak((id *)&self->_environment);
}

@end
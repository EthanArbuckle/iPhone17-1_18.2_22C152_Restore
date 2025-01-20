@interface HDSPChargingReminderManager
+ (id)monitorActivity;
+ (id)monitorCriteria;
- (BOOL)isCharging;
- (BOOL)sleepFeaturesEnabled;
- (HDSPActivityScheduler)monitoringScheduler;
- (HDSPChargingReminderManager)initWithEnvironment:(id)a3;
- (HDSPChargingReminderManager)initWithEnvironment:(id)a3 monitoringScheduler:(id)a4;
- (HDSPChargingReminderStateMachine)stateMachine;
- (HDSPEnvironment)environment;
- (HDSPSleepEventDelegate)sleepEventDelegate;
- (HKSPMutexProvider)mutexProvider;
- (HKSPSleepScheduleModel)sleepScheduleModel;
- (NAScheduler)callbackScheduler;
- (NSDate)currentDate;
- (NSString)providerIdentifier;
- (id)_currentState;
- (id)devicePowerMonitor;
- (id)diagnosticDescription;
- (id)eventIdentifiers;
- (id)monitoringWindowAfterDate:(id)a3;
- (id)upcomingEventsDueAfterDate:(id)a3;
- (unint64_t)sleepScheduleState;
- (void)_withLock:(id)a3;
- (void)checkBatteryLevel;
- (void)deviceChangedChargingState:(BOOL)a3;
- (void)environmentDidBecomeReady:(id)a3;
- (void)environmentWillBecomeReady:(id)a3;
- (void)postChargingReminderNotification;
- (void)scheduleStateExpiration;
- (void)setSleepEventDelegate:(id)a3;
- (void)significantTimeChangeDetected:(id)a3;
- (void)sleepEventIsDue:(id)a3;
- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4;
- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5;
- (void)startBatteryMonitoring;
- (void)stopBatteryMonitoring;
- (void)unscheduleStateExpiration;
- (void)updateState;
@end

@implementation HDSPChargingReminderManager

- (HDSPChargingReminderManager)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v5 = [HDSPXPCActivityScheduler alloc];
  v6 = [v4 defaultCallbackScheduler];
  v7 = [(HDSPXPCActivityScheduler *)v5 initWithCallbackScheduler:v6];
  v8 = [(HDSPChargingReminderManager *)self initWithEnvironment:v4 monitoringScheduler:v7];

  return v8;
}

- (HDSPChargingReminderManager)initWithEnvironment:(id)a3 monitoringScheduler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HDSPChargingReminderManager;
  v8 = [(HDSPChargingReminderManager *)&v24 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeStrong((id *)&v9->_monitoringScheduler, a4);
    v10 = [v6 mutexGenerator];
    uint64_t v11 = v10[2]();
    mutexProvider = v9->_mutexProvider;
    v9->_mutexProvider = (HKSPMutexProvider *)v11;

    v13 = [HDSPChargingReminderStateMachine alloc];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    id v16 = objc_alloc(MEMORY[0x263F75ED8]);
    v17 = [v6 userDefaults];
    v18 = (void *)[v16 initWithUserDefaults:v17];
    v19 = [v6 currentDateProvider];
    uint64_t v20 = [(HDSPChargingReminderStateMachine *)v13 initWithIdentifier:v15 persistence:v18 delegate:v9 infoProvider:v9 currentDateProvider:v19];
    stateMachine = v9->_stateMachine;
    v9->_stateMachine = (HDSPChargingReminderStateMachine *)v20;

    v22 = v9;
  }

  return v9;
}

- (void)_withLock:(id)a3
{
}

- (id)devicePowerMonitor
{
  v2 = [(HDSPChargingReminderManager *)self environment];
  v3 = [v2 systemMonitor];
  id v4 = [v3 devicePowerMonitor];

  return v4;
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4 = a3;
  v5 = [v4 sleepScheduleModelManager];
  [v5 addObserver:self];

  id v6 = [v4 sleepScheduler];
  [v6 addEventHandler:self];

  id v7 = [v4 sleepScheduler];
  [v7 addEventProvider:self];

  v8 = [v4 sleepCoordinator];
  [v8 addObserver:self];

  v9 = [v4 timeChangeListener];
  [v9 addObserver:self];

  v10 = [v4 diagnostics];

  [v10 addProvider:self];
  id v11 = [(HDSPChargingReminderManager *)self devicePowerMonitor];
  [v11 addObserver:self];
}

- (void)environmentDidBecomeReady:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__HDSPChargingReminderManager_environmentDidBecomeReady___block_invoke;
  v3[3] = &unk_2645D90C0;
  v3[4] = self;
  [(HDSPChargingReminderManager *)self _withLock:v3];
}

uint64_t __57__HDSPChargingReminderManager_environmentDidBecomeReady___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) updateState];
}

- (void)updateState
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] updateState", buf, 0xCu);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__HDSPChargingReminderManager_updateState__block_invoke;
  v5[3] = &unk_2645D90C0;
  v5[4] = self;
  [(HDSPChargingReminderManager *)self _withLock:v5];
}

uint64_t __42__HDSPChargingReminderManager_updateState__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) updateState];
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2114;
    id v11 = v5;
    id v7 = v9;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] didUpdateSleepScheduleModel: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  [(HDSPChargingReminderManager *)self updateState];
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
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] significantTimeChangeDetected", (uint8_t *)&v6, 0xCu);
  }
  [(HDSPChargingReminderManager *)self updateState];
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = (id)objc_opt_class();
    id v7 = v9;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepScheduleStateDidChange", (uint8_t *)&v8, 0xCu);
  }
  [(HDSPChargingReminderManager *)self updateState];
}

- (void)deviceChangedChargingState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 1024;
    BOOL v10 = v3;
    id v6 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] deviceChangedChargingState (isCharging: %d)", (uint8_t *)&v7, 0x12u);
  }
  [(HDSPChargingReminderManager *)self updateState];
}

- (NSDate)currentDate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  BOOL v3 = [WeakRetained currentDateProvider];
  id v4 = v3[2]();

  return (NSDate *)v4;
}

- (HKSPSleepScheduleModel)sleepScheduleModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  BOOL v3 = [WeakRetained sleepScheduleModelManager];
  id v4 = [v3 sleepScheduleModel];

  return (HKSPSleepScheduleModel *)v4;
}

- (unint64_t)sleepScheduleState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  BOOL v3 = [WeakRetained sleepCoordinator];
  unint64_t v4 = [v3 currentSleepScheduleState];

  return v4;
}

- (BOOL)sleepFeaturesEnabled
{
  v2 = [(HDSPChargingReminderManager *)self sleepScheduleModel];
  BOOL v3 = [v2 sleepSettings];
  char v4 = [v3 watchSleepFeaturesEnabled];

  return v4;
}

- (id)monitoringWindowAfterDate:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HDSPChargingReminderManager *)self sleepScheduleModel];
  id v6 = (void *)*MEMORY[0x263F75C18];
  int v7 = [v5 nextEventWithIdentifier:*MEMORY[0x263F75C18] dueAfterDate:v4];

  if (!v7)
  {
    v23 = 0;
    goto LABEL_23;
  }
  id v8 = [v7 dateByAddingTimeInterval:-600.0];
  __int16 v9 = [v7 dateByAddingTimeInterval:-3600.0];
  BOOL v10 = [(HDSPChargingReminderManager *)self sleepScheduleModel];
  uint64_t v11 = [v10 sleepSettings];

  if (![v11 bedtimeReminders])
  {
    id v22 = v8;
LABEL_9:
    if (objc_msgSend(v22, "hksp_isBeforeOrSameAsDate:", v9))
    {
      objc_super v24 = HKSPLogForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v43 = (id)objc_opt_class();
        __int16 v44 = 2114;
        id v45 = v22;
        __int16 v46 = 2114;
        v47 = v9;
        id v25 = v43;
        _os_log_impl(&dword_221A52000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignoring monitor end date (%{public}@) before start date (%{public}@)", buf, 0x20u);
      }
      v23 = 0;
    }
    else
    {
      v26 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v9 endDate:v22];
      v27 = HKSPLogForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = objc_opt_class();
        id v39 = v28;
        [v26 hkspDescription];
        v41 = v9;
        v29 = v11;
        v31 = v30 = v8;
        *(_DWORD *)buf = 138543618;
        id v43 = v28;
        __int16 v44 = 2114;
        id v45 = v31;
        _os_log_impl(&dword_221A52000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] monitor window is: %{public}@", buf, 0x16u);

        id v8 = v30;
        uint64_t v11 = v29;
        __int16 v9 = v41;
      }
      v32 = [v26 endDate];
      int v33 = objc_msgSend(v4, "hksp_isAfterOrSameAsDate:", v32);

      if (v33)
      {
        v34 = HKSPLogForCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          id v43 = v35;
          __int16 v44 = 2114;
          id v45 = v26;
          id v36 = v35;
          _os_log_impl(&dword_221A52000, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@] already passed current window %{public}@", buf, 0x16u);
        }
        id v37 = [(HDSPChargingReminderManager *)self monitoringWindowAfterDate:v7];
      }
      else
      {
        id v37 = v26;
      }
      v23 = v37;
    }
    goto LABEL_22;
  }
  v40 = v9;
  uint64_t v12 = v11;
  v13 = v8;
  v14 = [(HDSPChargingReminderManager *)self sleepScheduleModel];
  v15 = [v14 sleepSchedule];

  [v15 windDownTime];
  id v16 = (void *)*MEMORY[0x263F75C50];
  if (v17 <= 0.0) {
    id v16 = v6;
  }
  id v18 = v16;
  v19 = [(HDSPChargingReminderManager *)self sleepScheduleModel];
  uint64_t v20 = [v19 nextEventWithIdentifier:v18 dueAfterDate:v4];

  if (v20)
  {
    v21 = [v20 dateByAddingTimeInterval:-*MEMORY[0x263F75D80]];
    id v22 = [v21 earlierDate:v13];

    id v8 = v13;
    uint64_t v11 = v12;
    __int16 v9 = v40;
    goto LABEL_9;
  }

  v23 = 0;
  id v8 = v13;
  uint64_t v11 = v12;
  __int16 v9 = v40;
LABEL_22:

LABEL_23:

  return v23;
}

- (BOOL)isCharging
{
  v2 = [(HDSPChargingReminderManager *)self devicePowerMonitor];
  char v3 = [v2 isCharging];

  return v3;
}

- (void)startBatteryMonitoring
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = (id)objc_opt_class();
    id v4 = v10;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] startBatteryMonitoring", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  monitoringScheduler = self->_monitoringScheduler;
  id v6 = [(id)objc_opt_class() monitorActivity];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__HDSPChargingReminderManager_startBatteryMonitoring__block_invoke;
  v7[3] = &unk_2645D92B0;
  objc_copyWeak(&v8, (id *)buf);
  [(HDSPActivityScheduler *)monitoringScheduler scheduleActivity:v6 activityHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __53__HDSPChargingReminderManager_startBatteryMonitoring__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained checkBatteryLevel];
}

+ (id)monitorCriteria
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x263EF81D8], *MEMORY[0x263EF8210]);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x263EF82A0], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x263EF8180], 1);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8288]);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x263EF82E8], 0);

  return v2;
}

+ (id)monitorActivity
{
  char v3 = [HDSPXPCActivity alloc];
  id v4 = [a1 monitorCriteria];
  id v5 = [(HDSPXPCActivity *)v3 initWithEventName:@"com.apple.sleep.BatteryMonitoring.activity" options:1 criteria:v4];

  return v5;
}

- (void)checkBatteryLevel
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  char v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = (id)objc_opt_class();
    id v4 = v11;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] checkBatteryLevel", buf, 0xCu);
  }
  id v5 = [(HDSPChargingReminderManager *)self devicePowerMonitor];
  [v5 batteryLevel];
  int v7 = v6;

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__HDSPChargingReminderManager_checkBatteryLevel__block_invoke;
  v8[3] = &unk_2645D9810;
  v8[4] = self;
  int v9 = v7;
  [(HDSPChargingReminderManager *)self _withLock:v8];
}

uint64_t __48__HDSPChargingReminderManager_checkBatteryLevel__block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return [*(id *)(*(void *)(a1 + 32) + 32) batteryLevelChanged:a2];
}

- (void)stopBatteryMonitoring
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  char v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] stopBatteryMonitoring", (uint8_t *)&v5, 0xCu);
  }
  [(HDSPActivityScheduler *)self->_monitoringScheduler unscheduleActivities];
}

- (void)scheduleStateExpiration
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] telling scheduler we have events to schedule", (uint8_t *)&v6, 0xCu);
  }
  int v5 = [(HDSPChargingReminderManager *)self sleepEventDelegate];
  [v5 eventProviderHasUpcomingEvents:self];
}

- (void)unscheduleStateExpiration
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] telling scheduler we no longer have events to schedule", (uint8_t *)&v6, 0xCu);
  }
  int v5 = [(HDSPChargingReminderManager *)self sleepEventDelegate];
  [v5 eventProviderCancelledEvents:self];
}

- (NAScheduler)callbackScheduler
{
  xpc_object_t v2 = [(HDSPChargingReminderManager *)self environment];
  char v3 = [v2 defaultCallbackScheduler];

  return (NAScheduler *)v3;
}

- (NSString)providerIdentifier
{
  xpc_object_t v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)upcomingEventsDueAfterDate:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  id v20 = (id)MEMORY[0x263EFFA68];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__HDSPChargingReminderManager_upcomingEventsDueAfterDate___block_invoke;
  v12[3] = &unk_2645D9680;
  v12[4] = self;
  id v5 = v4;
  id v13 = v5;
  v14 = &v15;
  [(HDSPChargingReminderManager *)self _withLock:v12];
  int v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    uint64_t v8 = v16[5];
    *(_DWORD *)buf = 138543618;
    id v22 = v7;
    __int16 v23 = 2114;
    uint64_t v24 = v8;
    id v9 = v7;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] scheduling expiration of %{public}@", buf, 0x16u);
  }
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v10;
}

void __58__HDSPChargingReminderManager_upcomingEventsDueAfterDate___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  xpc_object_t v2 = [*(id *)(a1 + 32) stateMachine];
  char v3 = [v2 currentStateExpirationDate];

  if (objc_msgSend(v3, "hksp_isAfterDate:", *(void *)(a1 + 40)))
  {
    id v4 = (void *)MEMORY[0x263F75E50];
    id v5 = [*(id *)(a1 + 32) stateMachine];
    int v6 = [v5 currentStateIdentifier];
    id v7 = [v4 sleepEventWithIdentifier:v6 dueDate:v3];

    v11[0] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (void)sleepEventIsDue:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 identifier];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F75C18]];

  id v7 = HKSPLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543362;
      id v16 = (id)objc_opt_class();
      id v9 = v16;
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's bedtime", buf, 0xCu);
    }
    [(HDSPChargingReminderManager *)self updateState];
  }
  else
  {
    if (v8)
    {
      id v10 = objc_opt_class();
      id v11 = v10;
      uint64_t v12 = [v4 identifier];
      *(_DWORD *)buf = 138543618;
      id v16 = v10;
      __int16 v17 = 2114;
      id v18 = v12;
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ expired", buf, 0x16u);
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __47__HDSPChargingReminderManager_sleepEventIsDue___block_invoke;
    v13[3] = &unk_2645D9288;
    v13[4] = self;
    id v14 = v4;
    [(HDSPChargingReminderManager *)self _withLock:v13];
  }
}

void __47__HDSPChargingReminderManager_sleepEventIsDue___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) stateMachine];
  xpc_object_t v2 = [*(id *)(a1 + 40) identifier];
  [v3 stateWithIdentifierDidExpire:v2];
}

- (id)eventIdentifiers
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__HDSPChargingReminderManager_eventIdentifiers__block_invoke;
  block[3] = &unk_2645D90C0;
  block[4] = self;
  if (qword_26AB790A0 != -1) {
    dispatch_once(&qword_26AB790A0, block);
  }
  return (id)_MergedGlobals_12;
}

void __47__HDSPChargingReminderManager_eventIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__4;
  id v11 = __Block_byref_object_dispose__4;
  id v12 = (id)MEMORY[0x263EFFA68];
  v1 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__HDSPChargingReminderManager_eventIdentifiers__block_invoke_2;
  v6[3] = &unk_2645D9630;
  v6[4] = v1;
  v6[5] = &v7;
  [v1 _withLock:v6];
  xpc_object_t v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(id)v8[5] arrayByAddingObject:*MEMORY[0x263F75C18]];
  uint64_t v4 = [v2 setWithArray:v3];
  id v5 = (void *)_MergedGlobals_12;
  _MergedGlobals_12 = v4;

  _Block_object_dispose(&v7, 8);
}

void __47__HDSPChargingReminderManager_eventIdentifiers__block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v2 = [v5 scheduledExpirationStateIdentifiers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)postChargingReminderNotification
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v27 = (id)objc_opt_class();
    id v4 = v27;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] posting battery reminder notification", buf, 0xCu);
  }
  id v5 = [(HDSPChargingReminderManager *)self sleepScheduleModel];
  int v6 = [v5 sleepSettings];
  uint64_t v7 = [v6 sleepTracking];

  BOOL v8 = [(HDSPChargingReminderManager *)self sleepScheduleModel];
  uint64_t v9 = [(HDSPChargingReminderManager *)self currentDate];
  id v10 = [v8 nextOccurrenceAfterDate:v9];

  id v11 = [v10 alarmConfiguration];
  uint64_t v12 = [v11 isEnabled];

  id v13 = (void *)MEMORY[0x263F75E50];
  uint64_t v14 = *MEMORY[0x263F75C28];
  uint64_t v15 = [(HDSPChargingReminderManager *)self currentDate];
  v24[0] = *MEMORY[0x263F75A70];
  id v16 = [NSNumber numberWithBool:v12];
  v25[0] = v16;
  v24[1] = *MEMORY[0x263F75A88];
  __int16 v17 = [NSNumber numberWithBool:v7];
  v25[1] = v17;
  id v18 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  uint64_t v19 = [v13 sleepEventWithIdentifier:v14 dueDate:v15 context:v18];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v21 = [WeakRetained sleepScheduler];
  __int16 v23 = v19;
  id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
  [v21 notifyForOverdueEvents:v22];
}

- (id)_currentState
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__4;
  uint64_t v9 = __Block_byref_object_dispose__4;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__HDSPChargingReminderManager__currentState__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPChargingReminderManager *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __44__HDSPChargingReminderManager__currentState__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) currentState];

  return MEMORY[0x270F9A758]();
}

- (id)diagnosticDescription
{
  id v2 = NSString;
  uint64_t v3 = [(HDSPChargingReminderManager *)self _currentState];
  id v4 = [v2 stringWithFormat:@"Current State: %@", v3];

  return v4;
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

- (HKSPMutexProvider)mutexProvider
{
  return self->_mutexProvider;
}

- (HDSPChargingReminderStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (HDSPActivityScheduler)monitoringScheduler
{
  return self->_monitoringScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoringScheduler, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_destroyWeak((id *)&self->_sleepEventDelegate);

  objc_destroyWeak((id *)&self->_environment);
}

@end
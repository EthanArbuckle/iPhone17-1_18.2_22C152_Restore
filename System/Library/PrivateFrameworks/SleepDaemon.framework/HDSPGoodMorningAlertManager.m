@interface HDSPGoodMorningAlertManager
- (BOOL)goodMorningAlertEnabled;
- (BOOL)isAppleWatch;
- (BOOL)isOnCharger;
- (HDSPEnvironment)environment;
- (HDSPGoodMorningAlertManager)initWithEnvironment:(id)a3;
- (HDSPGoodMorningAlertStateMachine)stateMachine;
- (HDSPSleepEventDelegate)sleepEventDelegate;
- (HKSPMutexProvider)mutexProvider;
- (HKSPObserverSet)goodMorningAlertObservers;
- (HKSPSleepScheduleModel)sleepScheduleModel;
- (NSDate)currentDate;
- (NSString)providerIdentifier;
- (id)_currentState;
- (id)diagnosticDescription;
- (id)eventIdentifiers;
- (id)upcomingEventsDueAfterDate:(id)a3;
- (unint64_t)sleepScheduleState;
- (void)_withLock:(id)a3;
- (void)addObserver:(id)a3;
- (void)dismissAlertForGoodMorning;
- (void)environmentWillBecomeReady:(id)a3;
- (void)goodMorningWasDismissed;
- (void)presentAlertForGoodMorning;
- (void)removeObserver:(id)a3;
- (void)scheduleStateExpiration;
- (void)setSleepEventDelegate:(id)a3;
- (void)significantTimeChangeDetected:(id)a3;
- (void)sleepEventIsDue:(id)a3;
- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4;
- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5;
- (void)unscheduleStateExpiration;
- (void)updateState;
@end

@implementation HDSPGoodMorningAlertManager

- (HDSPGoodMorningAlertManager)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HDSPGoodMorningAlertManager;
  v5 = [(HDSPGoodMorningAlertManager *)&v25 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    id v7 = objc_alloc(MEMORY[0x263F75E20]);
    v8 = [v4 defaultCallbackScheduler];
    uint64_t v9 = [v7 initWithCallbackScheduler:v8];
    goodMorningAlertObservers = v6->_goodMorningAlertObservers;
    v6->_goodMorningAlertObservers = (HKSPObserverSet *)v9;

    v11 = [v4 mutexGenerator];
    uint64_t v12 = v11[2]();
    mutexProvider = v6->_mutexProvider;
    v6->_mutexProvider = (HKSPMutexProvider *)v12;

    v14 = [HDSPGoodMorningAlertStateMachine alloc];
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    id v17 = objc_alloc(MEMORY[0x263F75ED8]);
    v18 = [v4 userDefaults];
    v19 = (void *)[v17 initWithUserDefaults:v18];
    v20 = [v4 currentDateProvider];
    uint64_t v21 = [(HDSPGoodMorningAlertStateMachine *)v14 initWithIdentifier:v16 persistence:v19 delegate:v6 infoProvider:v6 currentDateProvider:v20];
    stateMachine = v6->_stateMachine;
    v6->_stateMachine = (HDSPGoodMorningAlertStateMachine *)v21;

    v23 = v6;
  }

  return v6;
}

- (void)_withLock:(id)a3
{
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4 = a3;
  v5 = [v4 sleepScheduleModelManager];
  [v5 addObserver:self];

  v6 = [v4 sleepCoordinator];
  [v6 addObserver:self];

  id v7 = [v4 sleepScheduler];
  [v7 addEventHandler:self];

  v8 = [v4 sleepScheduler];
  [v8 addEventProvider:self];

  uint64_t v9 = [v4 actionManager];
  [v9 addObserver:self];

  v10 = [v4 timeChangeListener];
  [v10 addObserver:self];

  id v11 = [v4 diagnostics];

  [v11 addProvider:self];
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
  v5[2] = __42__HDSPGoodMorningAlertManager_updateState__block_invoke;
  v5[3] = &unk_2645D90C0;
  v5[4] = self;
  [(HDSPGoodMorningAlertManager *)self _withLock:v5];
}

uint64_t __42__HDSPGoodMorningAlertManager_updateState__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) updateState];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
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
  [(HDSPGoodMorningAlertManager *)self updateState];
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2114;
    id v11 = v5;
    id v7 = v9;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] didUpdateSleepScheduleModel: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  [(HDSPGoodMorningAlertManager *)self updateState];
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = objc_opt_class();
    id v9 = v8;
    __int16 v10 = NSStringFromHKSPSleepScheduleState();
    id v11 = NSStringFromHKSPSleepScheduleState();
    uint64_t v12 = NSStringFromHKSPSleepScheduleStateChangeReason();
    *(_DWORD *)buf = 138544130;
    v19 = v8;
    __int16 v20 = 2114;
    uint64_t v21 = v10;
    __int16 v22 = 2114;
    v23 = v11;
    __int16 v24 = 2114;
    objc_super v25 = v12;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepScheduleStateChanged from %{public}@ to %{public}@ for %{public}@", buf, 0x2Au);
  }
  if (a3 == 2)
  {
    v13 = &v15;
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v14 = __80__HDSPGoodMorningAlertManager_sleepScheduleStateDidChange_previousState_reason___block_invoke_2;
    goto LABEL_8;
  }
  if (a3 == 1 && HKSPSleepScheduleStateChangeReasonIsExpected())
  {
    v13 = v17;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v14 = __80__HDSPGoodMorningAlertManager_sleepScheduleStateDidChange_previousState_reason___block_invoke;
LABEL_8:
    v13[2] = (uint64_t)v14;
    v13[3] = (uint64_t)&unk_2645D90C0;
    v13[4] = (uint64_t)self;
    -[HDSPGoodMorningAlertManager _withLock:](self, "_withLock:", v15, v16);
  }
}

uint64_t __80__HDSPGoodMorningAlertManager_sleepScheduleStateDidChange_previousState_reason___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) sleepScheduleStateChangedToWakeUp];
}

uint64_t __80__HDSPGoodMorningAlertManager_sleepScheduleStateDidChange_previousState_reason___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) sleepScheduleStateChangedToBedtime];
}

- (NSString)providerIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)upcomingEventsDueAfterDate:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__18;
  v19 = __Block_byref_object_dispose__18;
  id v20 = (id)MEMORY[0x263EFFA68];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__HDSPGoodMorningAlertManager_upcomingEventsDueAfterDate___block_invoke;
  v12[3] = &unk_2645D9680;
  v12[4] = self;
  id v5 = v4;
  id v13 = v5;
  v14 = &v15;
  [(HDSPGoodMorningAlertManager *)self _withLock:v12];
  int v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    uint64_t v8 = v16[5];
    *(_DWORD *)buf = 138543618;
    __int16 v22 = v7;
    __int16 v23 = 2114;
    uint64_t v24 = v8;
    id v9 = v7;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] scheduling expiration of %{public}@", buf, 0x16u);
  }
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v10;
}

void __58__HDSPGoodMorningAlertManager_upcomingEventsDueAfterDate___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) stateMachine];
  v3 = [v2 currentStateExpirationDate];

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
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = objc_opt_class();
    id v7 = v6;
    uint64_t v8 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    id v13 = v6;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ expired", buf, 0x16u);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__HDSPGoodMorningAlertManager_sleepEventIsDue___block_invoke;
  v10[3] = &unk_2645D9288;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [(HDSPGoodMorningAlertManager *)self _withLock:v10];
}

void __47__HDSPGoodMorningAlertManager_sleepEventIsDue___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) stateMachine];
  v2 = [*(id *)(a1 + 40) identifier];
  [v3 stateWithIdentifierDidExpire:v2];
}

- (id)eventIdentifiers
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__HDSPGoodMorningAlertManager_eventIdentifiers__block_invoke;
  block[3] = &unk_2645D90C0;
  block[4] = self;
  if (qword_26AB79110 != -1) {
    dispatch_once(&qword_26AB79110, block);
  }
  return (id)_MergedGlobals_19;
}

void __47__HDSPGoodMorningAlertManager_eventIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__18;
  id v9 = __Block_byref_object_dispose__18;
  id v10 = (id)MEMORY[0x263EFFA68];
  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__HDSPGoodMorningAlertManager_eventIdentifiers__block_invoke_2;
  v4[3] = &unk_2645D9630;
  v4[4] = v1;
  v4[5] = &v5;
  [v1 _withLock:v4];
  uint64_t v2 = [MEMORY[0x263EFFA08] setWithArray:v6[5]];
  id v3 = (void *)_MergedGlobals_19;
  _MergedGlobals_19 = v2;

  _Block_object_dispose(&v5, 8);
}

void __47__HDSPGoodMorningAlertManager_eventIdentifiers__block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v2 = [v5 scheduledExpirationStateIdentifiers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)goodMorningWasDismissed
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] goodMorningWasDismissed", (uint8_t *)&v5, 0xCu);
  }
  [(HDSPGoodMorningAlertManager *)self updateState];
}

- (NSDate)currentDate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v3 = [WeakRetained currentDateProvider];
  id v4 = v3[2]();

  return (NSDate *)v4;
}

- (BOOL)goodMorningAlertEnabled
{
  p_environment = &self->_environment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v5 = [WeakRetained behavior];
  int v6 = objc_msgSend(v5, "hksp_supportsGoodMorningAlerts");

  if (!v6) {
    return 0;
  }
  id v7 = objc_loadWeakRetained((id *)p_environment);
  uint64_t v8 = [v7 behavior];
  int v9 = [v8 isAppleWatch];

  if (!v9)
  {
    id v12 = objc_loadWeakRetained((id *)p_environment);
    id v13 = [v12 behavior];
    int v14 = objc_msgSend(v13, "hksp_supportsSleepLockScreen");

    if (v14)
    {
      id v10 = [(HDSPGoodMorningAlertManager *)self sleepScheduleModel];
      char v11 = [v10 goodMorningScreenEnabledWithLogObject:self];
      goto LABEL_6;
    }
    return 0;
  }
  id v10 = [(HDSPGoodMorningAlertManager *)self sleepScheduleModel];
  char v11 = [v10 goodMorningAlertNotificationsEnabledWithLogObject:self];
LABEL_6:
  BOOL v15 = v11;

  return v15;
}

- (HKSPSleepScheduleModel)sleepScheduleModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v3 = [WeakRetained sleepScheduleModelManager];
  id v4 = [v3 sleepScheduleModel];

  return (HKSPSleepScheduleModel *)v4;
}

- (unint64_t)sleepScheduleState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v3 = [WeakRetained sleepCoordinator];
  unint64_t v4 = [v3 currentSleepScheduleState];

  return v4;
}

- (BOOL)isAppleWatch
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v3 = [WeakRetained behavior];
  char v4 = [v3 isAppleWatch];

  return v4;
}

- (BOOL)isOnCharger
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v3 = [WeakRetained systemMonitor];
  char v4 = [v3 devicePowerMonitor];
  char v5 = [v4 isCharging];

  return v5;
}

- (void)presentAlertForGoodMorning
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] telling observers to present good morning alert", (uint8_t *)&v5, 0xCu);
  }
  [(HKSPObserverSet *)self->_goodMorningAlertObservers enumerateObserversWithBlock:&__block_literal_global_22];
}

uint64_t __57__HDSPGoodMorningAlertManager_presentAlertForGoodMorning__block_invoke(uint64_t a1, void *a2)
{
  return [a2 presentAlertForGoodMorning];
}

- (void)dismissAlertForGoodMorning
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] telling observers to dismiss good morning alert", (uint8_t *)&v5, 0xCu);
  }
  [(HKSPObserverSet *)self->_goodMorningAlertObservers enumerateObserversWithBlock:&__block_literal_global_285];
}

uint64_t __57__HDSPGoodMorningAlertManager_dismissAlertForGoodMorning__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dismissAlertForGoodMorning];
}

- (void)scheduleStateExpiration
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] telling scheduler we have events to schedule", (uint8_t *)&v6, 0xCu);
  }
  int v5 = [(HDSPGoodMorningAlertManager *)self sleepEventDelegate];
  [v5 eventProviderHasUpcomingEvents:self];
}

- (void)unscheduleStateExpiration
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] telling scheduler we no longer have events to schedule", (uint8_t *)&v6, 0xCu);
  }
  int v5 = [(HDSPGoodMorningAlertManager *)self sleepEventDelegate];
  [v5 eventProviderCancelledEvents:self];
}

- (id)_currentState
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__18;
  int v9 = __Block_byref_object_dispose__18;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__HDSPGoodMorningAlertManager__currentState__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPGoodMorningAlertManager *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __44__HDSPGoodMorningAlertManager__currentState__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) currentState];

  return MEMORY[0x270F9A758]();
}

- (id)diagnosticDescription
{
  id v2 = NSString;
  uint64_t v3 = [(HDSPGoodMorningAlertManager *)self _currentState];
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

- (HDSPGoodMorningAlertStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (HKSPObserverSet)goodMorningAlertObservers
{
  return self->_goodMorningAlertObservers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goodMorningAlertObservers, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_destroyWeak((id *)&self->_sleepEventDelegate);

  objc_destroyWeak((id *)&self->_environment);
}

@end
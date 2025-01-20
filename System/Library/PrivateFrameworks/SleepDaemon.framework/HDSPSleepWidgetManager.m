@interface HDSPSleepWidgetManager
- (BOOL)inUnscheduledSleepMode;
- (BOOL)isOnboarded;
- (BOOL)shouldReloadWidgetOfKind:(id)a3;
- (HDSPEnvironment)environment;
- (HDSPSleepEventDelegate)sleepEventDelegate;
- (HDSPSleepWidgetManager)initWithEnvironment:(id)a3;
- (HDSPSleepWidgetManager)initWithEnvironment:(id)a3 widgetManager:(id)a4 reloadThrottler:(id)a5;
- (HKSPSleepScheduleModel)sleepScheduleModel;
- (NAScheduler)callbackScheduler;
- (NSDate)currentDate;
- (NSString)providerIdentifier;
- (id)diagnosticDescription;
- (id)eventIdentifiers;
- (id)upcomingEventsDueAfterDate:(id)a3;
- (int64_t)_lock_currentSleepWidgetState;
- (int64_t)currentSleepWidgetState;
- (unint64_t)sleepScheduleState;
- (void)_withLock:(id)a3;
- (void)clearWidgetOverrideState;
- (void)environmentDidBecomeReady:(id)a3;
- (void)environmentWillBecomeReady:(id)a3;
- (void)overrideWidgetState:(int64_t)a3;
- (void)scheduleStateExpiration;
- (void)setSleepEventDelegate:(id)a3;
- (void)significantTimeChangeDetected:(id)a3;
- (void)sleepEventIsDue:(id)a3;
- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5;
- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4;
- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5;
- (void)sleepWidgetShouldReload;
- (void)sleepWidgetStateDidChange:(int64_t)a3 previousState:(int64_t)a4;
- (void)timeZoneChangeDetected:(id)a3;
- (void)unscheduleStateExpiration;
- (void)updateState;
@end

@implementation HDSPSleepWidgetManager

- (HDSPSleepWidgetManager)initWithEnvironment:(id)a3
{
  id v4 = a3;
  if ([v4 isUnitTestEnvironment])
  {
    id v5 = 0;
    v6 = 0;
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x263F75EB0]);
    id v8 = objc_alloc(MEMORY[0x263F75EC0]);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __46__HDSPSleepWidgetManager_initWithEnvironment___block_invoke;
    v11[3] = &unk_2645D90C0;
    id v5 = v7;
    id v12 = v5;
    v6 = (void *)[v8 initWithInterval:v11 executeBlock:1.0];
  }
  v9 = [(HDSPSleepWidgetManager *)self initWithEnvironment:v4 widgetManager:v5 reloadThrottler:v6];

  return v9;
}

uint64_t __46__HDSPSleepWidgetManager_initWithEnvironment___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadWidgetsWithReason:4];
}

- (HDSPSleepWidgetManager)initWithEnvironment:(id)a3 widgetManager:(id)a4 reloadThrottler:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)HDSPSleepWidgetManager;
  v11 = [(HDSPSleepWidgetManager *)&v29 init];
  if (v11)
  {
    id v12 = HKSPLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v31 = v13;
      __int16 v32 = 2048;
      v33 = v11;
      id v14 = v13;
      _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);
    }
    objc_storeWeak((id *)&v11->_environment, v8);
    objc_storeStrong((id *)&v11->_widgetManager, a4);
    [(HKSPSleepWidgetManager *)v11->_widgetManager setDelegate:v11];
    objc_storeStrong((id *)&v11->_reloadThrottler, a5);
    v15 = [v8 mutexGenerator];
    uint64_t v16 = v15[2]();
    mutexProvider = v11->_mutexProvider;
    v11->_mutexProvider = (HKSPMutexProvider *)v16;

    v18 = [HDSPSleepWidgetStateMachine alloc];
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    id v21 = objc_alloc(MEMORY[0x263F75ED8]);
    v22 = [v8 userDefaults];
    v23 = (void *)[v21 initWithUserDefaults:v22];
    v24 = [v8 currentDateProvider];
    uint64_t v25 = [(HDSPSleepWidgetStateMachine *)v18 initWithIdentifier:v20 persistence:v23 delegate:v11 infoProvider:v11 currentDateProvider:v24];
    stateMachine = v11->_stateMachine;
    v11->_stateMachine = (HDSPSleepWidgetStateMachine *)v25;

    v27 = v11;
  }

  return v11;
}

- (void)_withLock:(id)a3
{
}

- (void)environmentWillBecomeReady:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    id v15 = (id)objc_opt_class();
    id v6 = v15;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentWillBecomeReady", (uint8_t *)&v14, 0xCu);
  }
  id v7 = [v4 sleepModeManager];
  [v7 addObserver:self];

  id v8 = [v4 sleepScheduleModelManager];
  [v8 addObserver:self];

  id v9 = [v4 sleepCoordinator];
  [v9 addObserver:self];

  id v10 = [v4 sleepScheduler];
  [v10 addEventHandler:self];

  v11 = [v4 sleepScheduler];
  [v11 addEventProvider:self];

  id v12 = [v4 timeChangeListener];
  [v12 addObserver:self];

  v13 = [v4 diagnostics];

  [v13 addProvider:self];
}

- (void)environmentDidBecomeReady:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v5 = v7;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentDidBecomeReady", (uint8_t *)&v6, 0xCu);
  }
  [(HDSPSleepWidgetManager *)self updateState];
}

- (void)updateState
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __37__HDSPSleepWidgetManager_updateState__block_invoke;
  v2[3] = &unk_2645D90C0;
  v2[4] = self;
  [(HDSPSleepWidgetManager *)self _withLock:v2];
}

uint64_t __37__HDSPSleepWidgetManager_updateState__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) updateState];
}

- (int64_t)currentSleepWidgetState
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__HDSPSleepWidgetManager_currentSleepWidgetState__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPSleepWidgetManager *)self _withLock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __49__HDSPSleepWidgetManager_currentSleepWidgetState__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_lock_currentSleepWidgetState");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_lock_currentSleepWidgetState
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_isOverridingWidgetState)
  {
    v3 = HKSPLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = (id)objc_opt_class();
      id v4 = v9;
      _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] overriding widget state", (uint8_t *)&v8, 0xCu);
    }
    return self->_overrideState;
  }
  else
  {
    int v6 = [(HKSPStateMachine *)self->_stateMachine currentState];
    int64_t v7 = [v6 widgetState];

    return v7;
  }
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v7 = v12;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule model did change", buf, 0xCu);
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __80__HDSPSleepWidgetManager_sleepScheduleModelManager_didUpdateSleepScheduleModel___block_invoke;
  v9[3] = &unk_2645D9288;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [(HDSPSleepWidgetManager *)self _withLock:v9];
}

uint64_t __80__HDSPSleepWidgetManager_sleepScheduleModelManager_didUpdateSleepScheduleModel___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) sleepScheduleModelDidChange:*(void *)(a1 + 40)];
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = (id)objc_opt_class();
    id v8 = v11;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule state did change", buf, 0xCu);
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__HDSPSleepWidgetManager_sleepScheduleStateDidChange_previousState_reason___block_invoke;
  v9[3] = &unk_2645D96F8;
  v9[4] = self;
  void v9[5] = a3;
  [(HDSPSleepWidgetManager *)self _withLock:v9];
}

uint64_t __75__HDSPSleepWidgetManager_sleepScheduleStateDidChange_previousState_reason___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) sleepScheduleStateDidChange:*(void *)(a1 + 40)];
}

- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v8 = HKSPLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v9 = v12;
    _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode did change", buf, 0xCu);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__HDSPSleepWidgetManager_sleepModeDidChange_previousMode_reason___block_invoke;
  v10[3] = &unk_2645D9608;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a5;
  [(HDSPSleepWidgetManager *)self _withLock:v10];
}

uint64_t __65__HDSPSleepWidgetManager_sleepModeDidChange_previousMode_reason___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  int64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = HKSPSleepModeChangeReasonTreatedAsUserRequested();

  return [v2 sleepModeDidChange:v1 isUserRequested:v3];
}

- (void)significantTimeChangeDetected:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = (id)objc_opt_class();
    id v5 = v8;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] significantTimeChangeDetected", buf, 0xCu);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__HDSPSleepWidgetManager_significantTimeChangeDetected___block_invoke;
  v6[3] = &unk_2645D90C0;
  v6[4] = self;
  [(HDSPSleepWidgetManager *)self _withLock:v6];
}

uint64_t __56__HDSPSleepWidgetManager_significantTimeChangeDetected___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) significantTimeChangeOccurred];
}

- (void)timeZoneChangeDetected:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = (id)objc_opt_class();
    id v5 = v8;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] timeZoneChangeDetected", buf, 0xCu);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__HDSPSleepWidgetManager_timeZoneChangeDetected___block_invoke;
  v6[3] = &unk_2645D90C0;
  v6[4] = self;
  [(HDSPSleepWidgetManager *)self _withLock:v6];
}

uint64_t __49__HDSPSleepWidgetManager_timeZoneChangeDetected___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) significantTimeChangeOccurred];
}

- (void)sleepWidgetStateDidChange:(int64_t)a3 previousState:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a3 != a4)
  {
    id v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = objc_opt_class();
      id v7 = v6;
      id v8 = NSStringFromHKSPSleepWidgetState();
      uint64_t v9 = [(HDSPSleepWidgetManager *)self environment];
      id v10 = [v9 currentContext];
      id v11 = [v10 source];
      int v12 = 138543874;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      id v15 = v8;
      __int16 v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepWidgetStateDidChange: %{public}@ (%{public}@)", (uint8_t *)&v12, 0x20u);
    }
    [(HKSPThrottler *)self->_reloadThrottler execute];
    [(HKSPSleepWidgetManager *)self->_widgetManager invalidateRelevances];
  }
}

- (void)sleepWidgetShouldReload
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_opt_class();
    id v5 = v4;
    int v6 = [(HDSPSleepWidgetManager *)self environment];
    id v7 = [v6 currentContext];
    id v8 = [v7 source];
    int v9 = 138543618;
    id v10 = v4;
    __int16 v11 = 2114;
    int v12 = v8;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepWidgetShouldReload (%{public}@)", (uint8_t *)&v9, 0x16u);
  }
  [(HKSPThrottler *)self->_reloadThrottler execute];
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
  id v5 = [(HDSPSleepWidgetManager *)self sleepEventDelegate];
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
  id v5 = [(HDSPSleepWidgetManager *)self sleepEventDelegate];
  [v5 eventProviderCancelledEvents:self];
}

- (NAScheduler)callbackScheduler
{
  int64_t v2 = [(HDSPSleepWidgetManager *)self environment];
  uint64_t v3 = [v2 defaultCallbackScheduler];

  return (NAScheduler *)v3;
}

- (NSDate)currentDate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v3 = [WeakRetained currentDateProvider];
  id v4 = v3[2]();

  return (NSDate *)v4;
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

- (BOOL)inUnscheduledSleepMode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v3 = [WeakRetained sleepModeManager];
  char v4 = [v3 inUnscheduledSleepMode];

  return v4;
}

- (BOOL)isOnboarded
{
  int64_t v2 = [(HDSPSleepWidgetManager *)self sleepScheduleModel];
  uint64_t v3 = [v2 sleepEventRecord];
  char v4 = [v3 isAnySleepCoachingOnboardingCompleted];

  return v4;
}

- (BOOL)shouldReloadWidgetOfKind:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x263F75CF8]];
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
    uint64_t v13 = v6;
    __int16 v14 = 2114;
    id v15 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ expired", buf, 0x16u);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__HDSPSleepWidgetManager_sleepEventIsDue___block_invoke;
  v10[3] = &unk_2645D9288;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [(HDSPSleepWidgetManager *)self _withLock:v10];
}

void __42__HDSPSleepWidgetManager_sleepEventIsDue___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  id v2 = [*(id *)(a1 + 40) identifier];
  [v1 stateWithIdentifierDidExpire:v2];
}

- (id)eventIdentifiers
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__HDSPSleepWidgetManager_eventIdentifiers__block_invoke;
  block[3] = &unk_2645D90C0;
  block[4] = self;
  if (qword_26AB79090 != -1) {
    dispatch_once(&qword_26AB79090, block);
  }
  return (id)_MergedGlobals_11;
}

void __42__HDSPSleepWidgetManager_eventIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__3;
  id v9 = __Block_byref_object_dispose__3;
  id v10 = (id)MEMORY[0x263EFFA68];
  uint64_t v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__HDSPSleepWidgetManager_eventIdentifiers__block_invoke_281;
  v4[3] = &unk_2645D9630;
  v4[4] = v1;
  v4[5] = &v5;
  [v1 _withLock:v4];
  uint64_t v2 = [MEMORY[0x263EFFA08] setWithArray:v6[5]];
  uint64_t v3 = (void *)_MergedGlobals_11;
  _MergedGlobals_11 = v2;

  _Block_object_dispose(&v5, 8);
}

uint64_t __42__HDSPSleepWidgetManager_eventIdentifiers__block_invoke_281(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) scheduledExpirationStateIdentifiers];

  return MEMORY[0x270F9A758]();
}

- (NSString)providerIdentifier
{
  uint64_t v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)upcomingEventsDueAfterDate:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  id v20 = (id)MEMORY[0x263EFFA68];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__HDSPSleepWidgetManager_upcomingEventsDueAfterDate___block_invoke;
  v12[3] = &unk_2645D9680;
  v12[4] = self;
  id v5 = v4;
  id v13 = v5;
  __int16 v14 = &v15;
  [(HDSPSleepWidgetManager *)self _withLock:v12];
  int v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = v16[5];
    *(_DWORD *)buf = 138543618;
    v22 = v7;
    __int16 v23 = 2114;
    uint64_t v24 = v8;
    id v9 = v7;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] scheduling expiration of %{public}@", buf, 0x16u);
  }
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v10;
}

void __53__HDSPSleepWidgetManager_upcomingEventsDueAfterDate___block_invoke(void *a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1[4] + 16) currentStateExpirationDate];
  if (objc_msgSend(v2, "hksp_isAfterDate:", a1[5]))
  {
    uint64_t v3 = (void *)MEMORY[0x263F75E50];
    id v4 = [*(id *)(a1[4] + 16) currentStateIdentifier];
    id v5 = [v3 sleepEventWithIdentifier:v4 dueDate:v2];

    v9[0] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    uint64_t v7 = *(void *)(a1[6] + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (void)overrideWidgetState:(int64_t)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__HDSPSleepWidgetManager_overrideWidgetState___block_invoke;
  v4[3] = &unk_2645D96F8;
  v4[4] = self;
  v4[5] = a3;
  [(HDSPSleepWidgetManager *)self _withLock:v4];
  [(HKSPThrottler *)self->_reloadThrottler execute];
}

uint64_t __46__HDSPSleepWidgetManager_overrideWidgetState___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 48) = *(void *)(result + 40);
  *(unsigned char *)(*(void *)(result + 32) + 40) = 1;
  return result;
}

- (void)clearWidgetOverrideState
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__HDSPSleepWidgetManager_clearWidgetOverrideState__block_invoke;
  v3[3] = &unk_2645D90C0;
  v3[4] = self;
  [(HDSPSleepWidgetManager *)self _withLock:v3];
  [(HKSPThrottler *)self->_reloadThrottler execute];
}

uint64_t __50__HDSPSleepWidgetManager_clearWidgetOverrideState__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 40) = 0;
  return result;
}

- (id)diagnosticDescription
{
  uint64_t v2 = NSString;
  [(HDSPSleepWidgetManager *)self currentSleepWidgetState];
  uint64_t v3 = NSStringFromHKSPSleepWidgetState();
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sleepEventDelegate);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_reloadThrottler, 0);
  objc_storeStrong((id *)&self->_widgetManager, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);

  objc_storeStrong((id *)&self->_mutexProvider, 0);
}

@end
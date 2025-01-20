@interface HDSPSleepLockScreenManager
- (BOOL)_lock_overridingLockScreenState;
- (BOOL)_lock_shouldShowLockScreenForState:(int64_t)a3;
- (BOOL)inUnscheduledSleepMode;
- (BOOL)isLockScreenActive;
- (HDSPEnvironment)environment;
- (HDSPSleepEventDelegate)sleepEventDelegate;
- (HDSPSleepLockScreenAssertionManager)assertionManager;
- (HDSPSleepLockScreenManager)initWithEnvironment:(id)a3;
- (HDSPSleepLockScreenManager)initWithEnvironment:(id)a3 assertionManager:(id)a4;
- (HDSPSleepLockScreenStateMachine)stateMachine;
- (HKSPMutexProvider)mutexProvider;
- (HKSPSleepScheduleModel)sleepScheduleModel;
- (NSDate)currentDate;
- (NSString)providerIdentifier;
- (id)_currentState;
- (id)diagnosticDescription;
- (id)didUpdateAlertAssertion;
- (id)eventIdentifiers;
- (id)upcomingEventsDueAfterDate:(id)a3;
- (int64_t)_lock_resolvedLockScreenState;
- (int64_t)currentLockScreenState;
- (int64_t)sleepMode;
- (void)_lock_updateLockScreenAssertion;
- (void)_withLock:(id)a3;
- (void)dismissAlertForGoodMorning;
- (void)environmentDidBecomeReady:(id)a3;
- (void)environmentWillBecomeReady:(id)a3;
- (void)lockScreenDidConnect;
- (void)overrideLockScreenState:(int64_t)a3 userInfo:(id)a4;
- (void)presentAlertForGoodMorning;
- (void)scheduleStateExpiration;
- (void)sensitiveUIStateChanged;
- (void)setCurrentLockScreenState:(int64_t)a3;
- (void)setDidUpdateAlertAssertion:(id)a3;
- (void)setSleepEventDelegate:(id)a3;
- (void)significantTimeChangeDetected:(id)a3;
- (void)sleepEventIsDue:(id)a3;
- (void)sleepLockScreenStateDidChange:(int64_t)a3 previousState:(int64_t)a4;
- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5;
- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepSettings:(id)a4;
- (void)timeZoneChangeDetected:(id)a3;
- (void)unscheduleStateExpiration;
@end

@implementation HDSPSleepLockScreenManager

- (HDSPSleepLockScreenManager)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v5 = [[HDSPSleepLockScreenAssertionManager alloc] initWithEnvironment:v4];
  v6 = [(HDSPSleepLockScreenManager *)self initWithEnvironment:v4 assertionManager:v5];

  return v6;
}

- (HDSPSleepLockScreenManager)initWithEnvironment:(id)a3 assertionManager:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)HDSPSleepLockScreenManager;
  v8 = [(HDSPSleepLockScreenManager *)&v26 init];
  if (v8)
  {
    v9 = HKSPLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v28 = v10;
      __int16 v29 = 2048;
      v30 = v8;
      id v11 = v10;
      _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);
    }
    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeStrong((id *)&v8->_assertionManager, a4);
    [(HDSPSleepLockScreenAssertionManager *)v8->_assertionManager setDelegate:v8];
    v12 = [v6 mutexGenerator];
    uint64_t v13 = v12[2]();
    mutexProvider = v8->_mutexProvider;
    v8->_mutexProvider = (HKSPMutexProvider *)v13;

    v15 = [HDSPSleepLockScreenStateMachine alloc];
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    id v18 = objc_alloc(MEMORY[0x263F75ED8]);
    v19 = [v6 userDefaults];
    v20 = (void *)[v18 initWithUserDefaults:v19];
    v21 = [v6 currentDateProvider];
    uint64_t v22 = [(HDSPSleepLockScreenStateMachine *)v15 initWithIdentifier:v17 persistence:v20 delegate:v8 infoProvider:v8 currentDateProvider:v21];
    stateMachine = v8->_stateMachine;
    v8->_stateMachine = (HDSPSleepLockScreenStateMachine *)v22;

    v24 = v8;
  }

  return v8;
}

- (void)_withLock:(id)a3
{
}

- (void)environmentWillBecomeReady:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    id v16 = (id)objc_opt_class();
    id v6 = v16;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentWillBecomeReady", (uint8_t *)&v15, 0xCu);
  }
  id v7 = [v4 sleepModeManager];
  [v7 addObserver:self];

  v8 = [v4 sleepScheduleModelManager];
  [v8 addObserver:self];

  v9 = [v4 goodMorningAlertManager];
  [v9 addObserver:self];

  v10 = [v4 diagnostics];
  [v10 addProvider:self];

  id v11 = [v4 timeChangeListener];
  [v11 addObserver:self];

  v12 = [v4 sleepScheduler];
  [v12 addEventHandler:self];

  uint64_t v13 = [v4 sleepScheduler];
  [v13 addEventProvider:self];

  v14 = [v4 sensitiveUIMonitor];

  [v14 addObserver:self];
}

- (void)environmentDidBecomeReady:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = (id)objc_opt_class();
    id v5 = v8;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentDidBecomeReady", buf, 0xCu);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__HDSPSleepLockScreenManager_environmentDidBecomeReady___block_invoke;
  v6[3] = &unk_2645D90C0;
  v6[4] = self;
  [(HDSPSleepLockScreenManager *)self _withLock:v6];
}

uint64_t __56__HDSPSleepLockScreenManager_environmentDidBecomeReady___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) updateState];
}

- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = HKSPLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    id v10 = v9;
    id v11 = NSStringFromHKSPSleepMode();
    v12 = NSStringFromHKSPSleepModeChangeReason();
    *(_DWORD *)buf = 138543874;
    int v15 = v9;
    __int16 v16 = 2114;
    uint64_t v17 = v11;
    __int16 v18 = 2114;
    v19 = v12;
    _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode did change: %{public}@ (%{public}@)", buf, 0x20u);
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__HDSPSleepLockScreenManager_sleepModeDidChange_previousMode_reason___block_invoke;
  v13[3] = &unk_2645D9608;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = a5;
  [(HDSPSleepLockScreenManager *)self _withLock:v13];
}

void __69__HDSPSleepLockScreenManager_sleepModeDidChange_previousMode_reason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateMachine];
  [v2 sleepModeDidChange:*(void *)(a1 + 40) reason:*(void *)(a1 + 48)];
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepSettings:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = (id)objc_opt_class();
    id v6 = v9;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep settings did change", buf, 0xCu);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__HDSPSleepLockScreenManager_sleepScheduleModelManager_didUpdateSleepSettings___block_invoke;
  v7[3] = &unk_2645D90C0;
  v7[4] = self;
  [(HDSPSleepLockScreenManager *)self _withLock:v7];
}

void __79__HDSPSleepLockScreenManager_sleepScheduleModelManager_didUpdateSleepSettings___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stateMachine];
  [v1 updateState];
}

- (void)presentAlertForGoodMorning
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] present the good morning alert", buf, 0xCu);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__HDSPSleepLockScreenManager_presentAlertForGoodMorning__block_invoke;
  v5[3] = &unk_2645D90C0;
  v5[4] = self;
  [(HDSPSleepLockScreenManager *)self _withLock:v5];
}

void __56__HDSPSleepLockScreenManager_presentAlertForGoodMorning__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stateMachine];
  [v1 presentAlertForGoodMorning];
}

- (void)dismissAlertForGoodMorning
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] dismiss the good morning alert", buf, 0xCu);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__HDSPSleepLockScreenManager_dismissAlertForGoodMorning__block_invoke;
  v5[3] = &unk_2645D90C0;
  v5[4] = self;
  [(HDSPSleepLockScreenManager *)self _withLock:v5];
}

void __56__HDSPSleepLockScreenManager_dismissAlertForGoodMorning__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stateMachine];
  [v1 dismissAlertForGoodMorning];
}

- (void)sleepLockScreenStateDidChange:(int64_t)a3 previousState:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543874;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2048;
    int64_t v12 = a3;
    __int16 v13 = 2048;
    int64_t v14 = a4;
    id v8 = v10;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepLockScreenStateDidChange: %ld previousState: %ld", (uint8_t *)&v9, 0x20u);
  }
  self->_state = a3;
  [(HDSPSleepLockScreenManager *)self _lock_updateLockScreenAssertion];
}

- (void)scheduleStateExpiration
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] telling scheduler we have events to schedule", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(HDSPSleepLockScreenManager *)self sleepEventDelegate];
  [v5 eventProviderHasUpcomingEvents:self];
}

- (void)unscheduleStateExpiration
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] telling scheduler we no longer have events to schedule", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(HDSPSleepLockScreenManager *)self sleepEventDelegate];
  [v5 eventProviderCancelledEvents:self];
}

- (BOOL)_lock_shouldShowLockScreenForState:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 3;
}

- (void)_lock_updateLockScreenAssertion
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  p_environment = &self->_environment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v5 = [WeakRetained sleepScheduleModelManager];
  int v6 = [v5 sleepSettings];
  unint64_t v7 = [v6 sleepModeOptions];

  id v8 = objc_loadWeakRetained((id *)p_environment);
  int v9 = [v8 sleepModeManager];
  uint64_t v10 = [v9 sleepMode];

  __int16 v11 = HKSPLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v12 = objc_opt_class();
    __int16 v13 = NSNumber;
    id v14 = v12;
    uint64_t v15 = [v13 numberWithBool:(v7 >> 14) & 1];
    __int16 v16 = [NSNumber numberWithBool:v10 != 0];
    int v23 = 138543874;
    v24 = v12;
    __int16 v25 = 2112;
    objc_super v26 = v15;
    __int16 v27 = 2112;
    v28 = v16;
    _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating assertion, sleep screen enabled: %@, sleep mode on: %@", (uint8_t *)&v23, 0x20u);
  }
  int64_t v17 = [(HDSPSleepLockScreenManager *)self _lock_resolvedLockScreenState];
  if ([(HDSPSleepLockScreenManager *)self _lock_overridingLockScreenState]) {
    overrideUserInfo = self->_overrideUserInfo;
  }
  else {
    overrideUserInfo = 0;
  }
  v19 = overrideUserInfo;
  BOOL v20 = [(HDSPSleepLockScreenManager *)self _lock_shouldShowLockScreenForState:v17];
  assertionManager = self->_assertionManager;
  if (v20)
  {
    [(HDSPSleepLockScreenAssertionManager *)assertionManager takeAssertionIfNeeded];
    [(HDSPSleepLockScreenAssertionManager *)self->_assertionManager sendLockScreenState:v17 userInfo:v19];
  }
  else
  {
    [(HDSPSleepLockScreenAssertionManager *)assertionManager invalidateAssertion];
  }
  didUpdateAlertAssertion = (void (**)(id, int64_t))self->_didUpdateAlertAssertion;
  if (didUpdateAlertAssertion) {
    didUpdateAlertAssertion[2](didUpdateAlertAssertion, v17);
  }
}

- (BOOL)_lock_overridingLockScreenState
{
  return self->_overrideState != 0;
}

- (int64_t)_lock_resolvedLockScreenState
{
  BOOL v3 = [(HDSPSleepLockScreenManager *)self _lock_overridingLockScreenState];
  uint64_t v4 = 8;
  if (v3) {
    uint64_t v4 = 16;
  }
  return *(int64_t *)((char *)&self->super.isa + v4);
}

- (void)sensitiveUIStateChanged
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __53__HDSPSleepLockScreenManager_sensitiveUIStateChanged__block_invoke;
  v2[3] = &unk_2645D90C0;
  v2[4] = self;
  [(HDSPSleepLockScreenManager *)self _withLock:v2];
}

uint64_t __53__HDSPSleepLockScreenManager_sensitiveUIStateChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_updateLockScreenAssertion");
}

- (void)significantTimeChangeDetected:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = (id)objc_opt_class();
    id v5 = v8;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] significantTimeChangeDetected", buf, 0xCu);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__HDSPSleepLockScreenManager_significantTimeChangeDetected___block_invoke;
  v6[3] = &unk_2645D90C0;
  v6[4] = self;
  [(HDSPSleepLockScreenManager *)self _withLock:v6];
}

void __60__HDSPSleepLockScreenManager_significantTimeChangeDetected___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stateMachine];
  [v1 updateState];
}

- (void)timeZoneChangeDetected:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = (id)objc_opt_class();
    id v5 = v8;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] timeZoneChangeDetected", buf, 0xCu);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__HDSPSleepLockScreenManager_timeZoneChangeDetected___block_invoke;
  v6[3] = &unk_2645D90C0;
  v6[4] = self;
  [(HDSPSleepLockScreenManager *)self _withLock:v6];
}

void __53__HDSPSleepLockScreenManager_timeZoneChangeDetected___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stateMachine];
  [v1 updateState];
}

- (NSDate)currentDate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  BOOL v3 = [WeakRetained currentDateProvider];
  uint64_t v4 = v3[2]();

  return (NSDate *)v4;
}

- (HKSPSleepScheduleModel)sleepScheduleModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  BOOL v3 = [WeakRetained sleepScheduleModelManager];
  uint64_t v4 = [v3 sleepScheduleModel];

  return (HKSPSleepScheduleModel *)v4;
}

- (int64_t)sleepMode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  BOOL v3 = [WeakRetained sleepModeManager];
  int64_t v4 = [v3 sleepMode];

  return v4;
}

- (BOOL)inUnscheduledSleepMode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  BOOL v3 = [WeakRetained sleepModeManager];
  char v4 = [v3 inUnscheduledSleepMode];

  return v4;
}

- (BOOL)isLockScreenActive
{
  return [(HDSPSleepLockScreenAssertionManager *)self->_assertionManager hasLockScreenConnection];
}

- (int64_t)currentLockScreenState
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__HDSPSleepLockScreenManager_currentLockScreenState__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPSleepLockScreenManager *)self _withLock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __52__HDSPSleepLockScreenManager_currentLockScreenState__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_lock_resolvedLockScreenState");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)overrideLockScreenState:(int64_t)a3 userInfo:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = v8;
    uint64_t v10 = NSStringFromHKSPSleepLockScreenState();
    *(_DWORD *)buf = 138543874;
    __int16 v16 = v8;
    __int16 v17 = 2112;
    __int16 v18 = v10;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] overriding lock screen state: %@ (userInfo: %@)", buf, 0x20u);
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__HDSPSleepLockScreenManager_overrideLockScreenState_userInfo___block_invoke;
  v12[3] = &unk_2645D9658;
  id v13 = v6;
  int64_t v14 = a3;
  v12[4] = self;
  id v11 = v6;
  [(HDSPSleepLockScreenManager *)self _withLock:v12];
}

uint64_t __63__HDSPSleepLockScreenManager_overrideLockScreenState_userInfo___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = *(void *)(a1 + 48);
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  uint64_t v5 = *(void **)(a1 + 32);

  return objc_msgSend(v5, "_lock_updateLockScreenAssertion");
}

- (void)sleepEventIsDue:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
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
  v10[2] = __46__HDSPSleepLockScreenManager_sleepEventIsDue___block_invoke;
  v10[3] = &unk_2645D9288;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [(HDSPSleepLockScreenManager *)self _withLock:v10];
}

void __46__HDSPSleepLockScreenManager_sleepEventIsDue___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v2 = [*(id *)(a1 + 40) identifier];
  [v3 stateWithIdentifierDidExpire:v2];
}

- (id)eventIdentifiers
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__HDSPSleepLockScreenManager_eventIdentifiers__block_invoke;
  block[3] = &unk_2645D90C0;
  block[4] = self;
  if (qword_26AB79080 != -1) {
    dispatch_once(&qword_26AB79080, block);
  }
  return (id)_MergedGlobals_10;
}

void __46__HDSPSleepLockScreenManager_eventIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__1;
  id v9 = __Block_byref_object_dispose__1;
  id v10 = (id)MEMORY[0x263EFFA68];
  id v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__HDSPSleepLockScreenManager_eventIdentifiers__block_invoke_281;
  v4[3] = &unk_2645D9630;
  v4[4] = v1;
  v4[5] = &v5;
  [v1 _withLock:v4];
  uint64_t v2 = [MEMORY[0x263EFFA08] setWithArray:v6[5]];
  id v3 = (void *)_MergedGlobals_10;
  _MergedGlobals_10 = v2;

  _Block_object_dispose(&v5, 8);
}

void __46__HDSPSleepLockScreenManager_eventIdentifiers__block_invoke_281(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v2 = [v5 scheduledExpirationStateIdentifiers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
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
  __int16 v18 = __Block_byref_object_copy__1;
  __int16 v19 = __Block_byref_object_dispose__1;
  id v20 = (id)MEMORY[0x263EFFA68];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__HDSPSleepLockScreenManager_upcomingEventsDueAfterDate___block_invoke;
  v12[3] = &unk_2645D9680;
  v12[4] = self;
  id v5 = v4;
  id v13 = v5;
  __int16 v14 = &v15;
  [(HDSPSleepLockScreenManager *)self _withLock:v12];
  id v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = v16[5];
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v7;
    __int16 v23 = 2114;
    uint64_t v24 = v8;
    id v9 = v7;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] scheduling expiration of %{public}@", buf, 0x16u);
  }
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v10;
}

void __57__HDSPSleepLockScreenManager_upcomingEventsDueAfterDate___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v3 = [v2 currentStateExpirationDate];

  if (objc_msgSend(v3, "hksp_isAfterDate:", *(void *)(a1 + 40)))
  {
    id v4 = (void *)MEMORY[0x263F75E50];
    id v5 = [*(id *)(a1 + 32) stateMachine];
    id v6 = [v5 currentStateIdentifier];
    uint64_t v7 = [v4 sleepEventWithIdentifier:v6 dueDate:v3];

    v11[0] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (void)lockScreenDidConnect
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __50__HDSPSleepLockScreenManager_lockScreenDidConnect__block_invoke;
  v2[3] = &unk_2645D90C0;
  v2[4] = self;
  [(HDSPSleepLockScreenManager *)self _withLock:v2];
}

uint64_t __50__HDSPSleepLockScreenManager_lockScreenDidConnect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_updateLockScreenAssertion");
}

- (id)_currentState
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__1;
  uint64_t v9 = __Block_byref_object_dispose__1;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__HDSPSleepLockScreenManager__currentState__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPSleepLockScreenManager *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __43__HDSPSleepLockScreenManager__currentState__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 56) currentState];

  return MEMORY[0x270F9A758]();
}

- (id)diagnosticDescription
{
  id v2 = NSString;
  uint64_t v3 = [(HDSPSleepLockScreenManager *)self _currentState];
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

- (HDSPSleepLockScreenStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (HDSPSleepLockScreenAssertionManager)assertionManager
{
  return self->_assertionManager;
}

- (void)setCurrentLockScreenState:(int64_t)a3
{
  self->_currentLockScreenState = a3;
}

- (id)didUpdateAlertAssertion
{
  return self->_didUpdateAlertAssertion;
}

- (void)setDidUpdateAlertAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didUpdateAlertAssertion, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_destroyWeak((id *)&self->_sleepEventDelegate);
  objc_destroyWeak((id *)&self->_environment);

  objc_storeStrong((id *)&self->_overrideUserInfo, 0);
}

@end
@interface HDSPSleepModeManager
+ (unint64_t)_sleepModeChangeReasonForBiomeReason:(int)a3 source:(int)a4;
- (BOOL)_isScheduledSleepModeEnabled;
- (BOOL)_isSleepModeDuringWindDownEnabled;
- (BOOL)_shouldHandleBiomeEvent:(id)a3;
- (BOOL)configureFocusModeWithState:(unint64_t)a3 error:(id *)a4;
- (BOOL)createFocusModeInState:(unint64_t)a3 error:(id *)a4;
- (BOOL)deleteFocusModeWithError:(id *)a3;
- (BOOL)hasSleepFocusMode;
- (BOOL)inUnscheduledSleepMode;
- (BOOL)isAppleWatch;
- (BOOL)isInDemoMode;
- (BOOL)shouldGoIntoSleepModeDuringState:(unint64_t)a3;
- (BOOL)sleepFeaturesEnabled;
- (BOOL)sleepScreenEnabled;
- (HDSPEnvironment)environment;
- (HDSPSleepFocusModeBridge)sleepFocusModeBridge;
- (HDSPSleepModeManager)initWithEnvironment:(id)a3;
- (HDSPSleepModeManager)initWithEnvironment:(id)a3 sleepFocusModeBridge:(id)a4 sleepProactiveBridge:(id)a5;
- (HDSPSleepModeStateMachine)stateMachine;
- (HDSPSleepProactiveBridge)sleepProactiveBridge;
- (HKSPMutexProvider)mutexProvider;
- (HKSPObserverSet)sleepModeObservers;
- (HKSPSleepScheduleModel)sleepScheduleModel;
- (NSDate)currentDate;
- (id)computeUserVisibleEndDate;
- (id)currentState;
- (id)diagnosticDescription;
- (id)diagnosticInfo;
- (int64_t)sleepMode;
- (unint64_t)sleepScheduleState;
- (void)_automationTurnedOffSleepModeWithReason:(unint64_t)a3;
- (void)_automationTurnedOnSleepModeWithReason:(unint64_t)a3;
- (void)_createFocusModeIfNeeded;
- (void)_ensureFocusModeCreatedForSleepMode:(int64_t)a3 reason:(unint64_t)a4;
- (void)_handleFocusModeEvent:(id)a3;
- (void)_powerLogSleepMode:(int64_t)a3 sleepScreenEnabled:(BOOL)a4;
- (void)_sleepModeTurnedOffForUnknownReason;
- (void)_sleepModeTurnedOnForUnknownReason;
- (void)_userTurnedOffSleepModeWithReason:(unint64_t)a3;
- (void)_userTurnedOnSleepModeWithReason:(unint64_t)a3;
- (void)_withLock:(id)a3;
- (void)addObserver:(id)a3;
- (void)createHomeScreenPageWithCompletion:(id)a3;
- (void)environmentDidBecomeReady:(id)a3;
- (void)environmentWillBecomeReady:(id)a3;
- (void)notifyObserversForSleepModeChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5;
- (void)removeObserver:(id)a3;
- (void)setSleepMode:(int64_t)a3;
- (void)setSleepMode:(int64_t)a3 reason:(unint64_t)a4;
- (void)significantTimeChangeDetected:(id)a3;
- (void)sleepFocusModeBridge:(id)a3 didUpdateSleepFocusConfiguration:(id)a4;
- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5;
- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4;
- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5;
- (void)updateState;
@end

@implementation HDSPSleepModeManager

- (HDSPSleepModeManager)initWithEnvironment:(id)a3
{
  v4 = (void *)MEMORY[0x263F75DC0];
  id v5 = a3;
  v6 = [v4 sleepFocusConfigurationServiceWithOptions:3];
  v7 = [[HDSPAppPredictionClient alloc] initWithSleepFocusModeBridge:v6];
  v8 = [(HDSPSleepModeManager *)self initWithEnvironment:v5 sleepFocusModeBridge:v6 sleepProactiveBridge:v7];

  return v8;
}

- (HDSPSleepModeManager)initWithEnvironment:(id)a3 sleepFocusModeBridge:(id)a4 sleepProactiveBridge:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v40.receiver = self;
  v40.super_class = (Class)HDSPSleepModeManager;
  v11 = [(HDSPSleepModeManager *)&v40 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_environment, v8);
    objc_storeStrong((id *)&v12->_sleepFocusModeBridge, a4);
    objc_storeStrong((id *)&v12->_sleepProactiveBridge, a5);
    id v13 = objc_alloc(MEMORY[0x263F75E20]);
    v14 = [v8 defaultCallbackScheduler];
    uint64_t v15 = [v13 initWithCallbackScheduler:v14];
    sleepModeObservers = v12->_sleepModeObservers;
    v12->_sleepModeObservers = (HKSPObserverSet *)v15;

    v17 = [v8 mutexGenerator];
    uint64_t v18 = v17[2]();
    mutexProvider = v12->_mutexProvider;
    v12->_mutexProvider = (HKSPMutexProvider *)v18;

    v20 = [HDSPSleepModeStateMachine alloc];
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    id v23 = objc_alloc(MEMORY[0x263F75ED8]);
    v24 = [v8 userDefaults];
    v25 = (void *)[v23 initWithUserDefaults:v24];
    v26 = [v8 currentDateProvider];
    uint64_t v27 = [(HDSPSleepModeStateMachine *)v20 initWithIdentifier:v22 persistence:v25 delegate:v12 infoProvider:v12 currentDateProvider:v26];
    stateMachine = v12->_stateMachine;
    v12->_stateMachine = (HDSPSleepModeStateMachine *)v27;

    objc_copyWeak(&to, (id *)&v12->_environment);
    id WeakRetained = objc_loadWeakRetained((id *)&v12->_environment);
    v30 = [WeakRetained biomeManager];
    v31 = +[HDSPBiomeManager sleepModePublisher];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __86__HDSPSleepModeManager_initWithEnvironment_sleepFocusModeBridge_sleepProactiveBridge___block_invoke;
    v36[3] = &unk_2645DB498;
    v32 = v12;
    v37 = v32;
    objc_copyWeak(&v38, &to);
    id v33 = (id)[v30 subscribe:v31 callback:v36];

    v34 = v32;
    objc_destroyWeak(&v38);

    objc_destroyWeak(&to);
  }

  return v12;
}

void __86__HDSPSleepModeManager_initWithEnvironment_sleepFocusModeBridge_sleepProactiveBridge___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2114;
    id v14 = v3;
    id v5 = v12;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] received biome event: %{public}@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __86__HDSPSleepModeManager_initWithEnvironment_sleepFocusModeBridge_sleepProactiveBridge___block_invoke_288;
  v8[3] = &unk_2645D9288;
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  id v7 = v3;
  [WeakRetained performWhenEnvironmentIsReady:v8];
}

uint64_t __86__HDSPSleepModeManager_initWithEnvironment_sleepFocusModeBridge_sleepProactiveBridge___block_invoke_288(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleFocusModeEvent:*(void *)(a1 + 40)];
}

- (void)_withLock:(id)a3
{
}

- (void)environmentWillBecomeReady:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentWillBecomeReady", (uint8_t *)&v11, 0xCu);
  }
  id v7 = [v4 sleepScheduleModelManager];
  [v7 addObserver:self];

  id v8 = [v4 sleepCoordinator];
  [v8 addObserver:self];

  id v9 = [v4 timeChangeListener];
  [v9 addObserver:self];

  id v10 = [v4 diagnostics];

  [v10 addProvider:self];
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
  v6[2] = __50__HDSPSleepModeManager_environmentDidBecomeReady___block_invoke;
  v6[3] = &unk_2645D90C0;
  v6[4] = self;
  [(HDSPSleepModeManager *)self _withLock:v6];
  [(HDSPSleepFocusModeBridge *)self->_sleepFocusModeBridge setDelegate:self];
}

uint64_t __50__HDSPSleepModeManager_environmentDidBecomeReady___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) updateState];
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
  v5[2] = __35__HDSPSleepModeManager_updateState__block_invoke;
  v5[3] = &unk_2645D90C0;
  v5[4] = self;
  [(HDSPSleepModeManager *)self _withLock:v5];
}

uint64_t __35__HDSPSleepModeManager_updateState__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) updateState];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (id)currentState
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__23;
  uint64_t v9 = __Block_byref_object_dispose__23;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__HDSPSleepModeManager_currentState__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPSleepModeManager *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __36__HDSPSleepModeManager_currentState__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) currentState];

  return MEMORY[0x270F9A758]();
}

- (int64_t)sleepMode
{
  id v2 = [(HDSPSleepModeManager *)self currentState];
  int64_t v3 = [v2 sleepMode];

  return v3;
}

- (BOOL)inUnscheduledSleepMode
{
  id v2 = [(HDSPSleepModeManager *)self currentState];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)setSleepMode:(int64_t)a3
{
}

- (void)setSleepMode:(int64_t)a3 reason:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v8 = HKSPLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    id v10 = v9;
    int v11 = NSStringFromHKSPSleepMode();
    id v12 = NSStringFromHKSPSleepModeChangeReason();
    int v14 = 138543874;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    v17 = v11;
    __int16 v18 = 2114;
    v19 = v12;
    _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] setSleepMode: %{public}@ (%{public}@)", (uint8_t *)&v14, 0x20u);
  }
  [(HDSPSleepModeManager *)self _ensureFocusModeCreatedForSleepMode:a3 reason:a4];
  switch(a3)
  {
    case 2:
      if (HKSPSleepModeChangeReasonTreatedAsAutomation())
      {
        [(HDSPSleepModeManager *)self _automationTurnedOnSleepModeWithReason:a4];
      }
      else if (HKSPSleepModeChangeReasonTreatedAsUserRequested())
      {
        [(HDSPSleepModeManager *)self _userTurnedOnSleepModeWithReason:a4];
      }
      else
      {
        [(HDSPSleepModeManager *)self _sleepModeTurnedOnForUnknownReason];
      }
      break;
    case 1:
      uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"HDSPSleepModeManager.m" lineNumber:174 description:@"Unable to set wind down via this method"];

      break;
    case 0:
      if (HKSPSleepModeChangeReasonTreatedAsAutomation())
      {
        [(HDSPSleepModeManager *)self _automationTurnedOffSleepModeWithReason:a4];
      }
      else if (HKSPSleepModeChangeReasonTreatedAsUserRequested())
      {
        [(HDSPSleepModeManager *)self _userTurnedOffSleepModeWithReason:a4];
      }
      else
      {
        [(HDSPSleepModeManager *)self _sleepModeTurnedOffForUnknownReason];
      }
      break;
  }
}

- (void)_userTurnedOnSleepModeWithReason:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__HDSPSleepModeManager__userTurnedOnSleepModeWithReason___block_invoke;
  v3[3] = &unk_2645D96F8;
  v3[4] = self;
  v3[5] = a3;
  [(HDSPSleepModeManager *)self _withLock:v3];
}

uint64_t __57__HDSPSleepModeManager__userTurnedOnSleepModeWithReason___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) userTurnedOnSleepModeWithReason:*(void *)(a1 + 40)];
}

- (void)_userTurnedOffSleepModeWithReason:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__HDSPSleepModeManager__userTurnedOffSleepModeWithReason___block_invoke;
  v3[3] = &unk_2645D96F8;
  v3[4] = self;
  v3[5] = a3;
  [(HDSPSleepModeManager *)self _withLock:v3];
}

uint64_t __58__HDSPSleepModeManager__userTurnedOffSleepModeWithReason___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) userTurnedOffSleepModeWithReason:*(void *)(a1 + 40)];
}

- (void)_automationTurnedOnSleepModeWithReason:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __63__HDSPSleepModeManager__automationTurnedOnSleepModeWithReason___block_invoke;
  v3[3] = &unk_2645D96F8;
  v3[4] = self;
  v3[5] = a3;
  [(HDSPSleepModeManager *)self _withLock:v3];
}

uint64_t __63__HDSPSleepModeManager__automationTurnedOnSleepModeWithReason___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) automationTurnedOnSleepModeWithReason:*(void *)(a1 + 40)];
}

- (void)_automationTurnedOffSleepModeWithReason:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __64__HDSPSleepModeManager__automationTurnedOffSleepModeWithReason___block_invoke;
  v3[3] = &unk_2645D96F8;
  v3[4] = self;
  v3[5] = a3;
  [(HDSPSleepModeManager *)self _withLock:v3];
}

uint64_t __64__HDSPSleepModeManager__automationTurnedOffSleepModeWithReason___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) automationTurnedOffSleepModeWithReason:*(void *)(a1 + 40)];
}

- (void)_sleepModeTurnedOnForUnknownReason
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __58__HDSPSleepModeManager__sleepModeTurnedOnForUnknownReason__block_invoke;
  v2[3] = &unk_2645D90C0;
  v2[4] = self;
  [(HDSPSleepModeManager *)self _withLock:v2];
}

uint64_t __58__HDSPSleepModeManager__sleepModeTurnedOnForUnknownReason__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) sleepModeTurnedOnForUnknownReason];
}

- (void)_sleepModeTurnedOffForUnknownReason
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __59__HDSPSleepModeManager__sleepModeTurnedOffForUnknownReason__block_invoke;
  v2[3] = &unk_2645D90C0;
  v2[4] = self;
  [(HDSPSleepModeManager *)self _withLock:v2];
}

uint64_t __59__HDSPSleepModeManager__sleepModeTurnedOffForUnknownReason__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) sleepModeTurnedOffForUnknownReason];
}

- (void)_handleFocusModeEvent:(id)a3
{
  id v6 = a3;
  if (-[HDSPSleepModeManager _shouldHandleBiomeEvent:](self, "_shouldHandleBiomeEvent:"))
  {
    uint64_t v4 = objc_msgSend((id)objc_opt_class(), "_sleepModeChangeReasonForBiomeReason:source:", objc_msgSend(v6, "updateReason"), objc_msgSend(v6, "updateSource"));
    if ([v6 starting]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 0;
    }
    [(HDSPSleepModeManager *)self setSleepMode:v5 reason:v4];
  }
}

- (BOOL)_shouldHandleBiomeEvent:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HDSPSleepModeManager *)self environment];
  uint64_t v6 = [v5 behavior];
  if ([(id)v6 isAppleWatch])
  {
    uint64_t v7 = [(HDSPSleepModeManager *)self sleepScheduleModel];
    uint64_t v8 = [v7 sleepSettings];
    char v9 = [v8 watchSleepFeaturesEnabled];

    if ((v9 & 1) == 0)
    {
      id v10 = HKSPLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138543362;
        id v17 = (id)objc_opt_class();
        id v11 = v17;
        id v12 = "[%{public}@] ignoring biome event because sleep features are disabled for this watch";
LABEL_13:
        _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, 0xCu);
      }
LABEL_14:
      LOBYTE(v6) = 0;
      goto LABEL_19;
    }
  }
  else
  {
  }
  switch([v4 updateReason])
  {
    case 0u:
      id v10 = HKSPLogForCategory();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      int v16 = 138543362;
      id v17 = (id)objc_opt_class();
      id v13 = v17;
      int v14 = "[%{public}@] handling biome event for unknown";
      break;
    case 1u:
      id v10 = HKSPLogForCategory();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      int v16 = 138543362;
      id v17 = (id)objc_opt_class();
      id v13 = v17;
      int v14 = "[%{public}@] handling biome event for user action";
      break;
    case 2u:
      id v10 = HKSPLogForCategory();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      int v16 = 138543362;
      id v17 = (id)objc_opt_class();
      id v11 = v17;
      id v12 = "[%{public}@] ignoring biome event for scheduled";
      goto LABEL_13;
    case 3u:
      id v10 = HKSPLogForCategory();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      int v16 = 138543362;
      id v17 = (id)objc_opt_class();
      id v13 = v17;
      int v14 = "[%{public}@] handling biome event for automation";
      break;
    default:
      goto LABEL_20;
  }
  _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0xCu);

LABEL_18:
  LOBYTE(v6) = 1;
LABEL_19:

LABEL_20:
  return v6 & 1;
}

+ (unint64_t)_sleepModeChangeReasonForBiomeReason:(int)a3 source:(int)a4
{
  if (a3 == 3)
  {
    if (a4 <= 3)
    {
      id v4 = &unk_221AD63C8;
      return v4[a4];
    }
  }
  else if (a3 == 1 && a4 < 4)
  {
    id v4 = &unk_221AD63A8;
    return v4[a4];
  }
  return 10;
}

- (void)_ensureFocusModeCreatedForSleepMode:(int64_t)a3 reason:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a3 == 2 && a4 == 5)
  {
    uint64_t v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = self;
      _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode engaged from Hunter watch, making sure focus mode is created", buf, 0xCu);
    }

    id v9 = 0;
    BOOL v6 = -[HDSPSleepModeManager createFocusModeInState:error:](self, "createFocusModeInState:error:", [MEMORY[0x263F75E68] defaultConfigurationState], &v9);
    id v7 = v9;
    if (!v6)
    {
      uint64_t v8 = HKSPLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v11 = self;
        __int16 v12 = 2114;
        id v13 = v7;
        _os_log_error_impl(&dword_221A52000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] failed to create focus mode: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2114;
    id v11 = v5;
    id v7 = v9;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] didUpdateSleepScheduleModel: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  [(HDSPSleepModeManager *)self _createFocusModeIfNeeded];
  [(HDSPSleepModeManager *)self updateState];
  [(HDSPSleepModeManager *)self _powerLogSleepMode:[(HDSPSleepModeManager *)self sleepMode] sleepScreenEnabled:[(HDSPSleepModeManager *)self sleepScreenEnabled]];
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = objc_opt_class();
    id v11 = v10;
    uint64_t v12 = NSStringFromHKSPSleepScheduleState();
    id v13 = NSStringFromHKSPSleepScheduleStateChangeReason();
    *(_DWORD *)buf = 138543874;
    v42 = v10;
    __int16 v43 = 2114;
    v44 = v12;
    __int16 v45 = 2114;
    v46 = v13;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepScheduleStateChanged: %{public}@ reason: %{public}@", buf, 0x20u);
  }
  switch(a3)
  {
    case 0uLL:
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      id v17 = __73__HDSPSleepModeManager_sleepScheduleStateDidChange_previousState_reason___block_invoke_4;
      uint64_t v18 = &unk_2645D90C0;
      v19 = self;
      uint64_t v14 = &v15;
      goto LABEL_8;
    case 1uLL:
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      v29 = __73__HDSPSleepModeManager_sleepScheduleStateDidChange_previousState_reason___block_invoke_2;
      v30 = &unk_2645D9608;
      v31 = self;
      unint64_t v32 = a5;
      unint64_t v33 = a4;
      uint64_t v14 = &v27;
      goto LABEL_8;
    case 2uLL:
      uint64_t v34 = MEMORY[0x263EF8330];
      uint64_t v35 = 3221225472;
      v36 = __73__HDSPSleepModeManager_sleepScheduleStateDidChange_previousState_reason___block_invoke;
      v37 = &unk_2645D9608;
      id v38 = self;
      unint64_t v39 = a5;
      unint64_t v40 = a4;
      uint64_t v14 = &v34;
      goto LABEL_8;
    case 3uLL:
      uint64_t v20 = MEMORY[0x263EF8330];
      uint64_t v21 = 3221225472;
      v22 = __73__HDSPSleepModeManager_sleepScheduleStateDidChange_previousState_reason___block_invoke_3;
      id v23 = &unk_2645D9608;
      v24 = self;
      unint64_t v25 = a5;
      unint64_t v26 = a4;
      uint64_t v14 = &v20;
LABEL_8:
      -[HDSPSleepModeManager _withLock:](self, "_withLock:", v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30,
        v31,
        v32,
        v33,
        v34,
        v35,
        v36,
        v37,
        v38,
        v39,
        v40);
      break;
    case 6uLL:
      [(HDSPSleepModeManager *)self updateState];
      break;
    default:
      return;
  }
}

uint64_t __73__HDSPSleepModeManager_sleepScheduleStateDidChange_previousState_reason___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) sleepScheduleStateChangedToBedtime:a1[5] fromState:a1[6]];
}

uint64_t __73__HDSPSleepModeManager_sleepScheduleStateDidChange_previousState_reason___block_invoke_2(void *a1)
{
  return [*(id *)(a1[4] + 24) sleepScheduleStateChangedToWakeUp:a1[5] fromState:a1[6]];
}

uint64_t __73__HDSPSleepModeManager_sleepScheduleStateDidChange_previousState_reason___block_invoke_3(void *a1)
{
  return [*(id *)(a1[4] + 24) sleepScheduleStateChangedToWindDown:a1[5] fromState:a1[6]];
}

uint64_t __73__HDSPSleepModeManager_sleepScheduleStateDidChange_previousState_reason___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) sleepScheduleStateChangedToDisabled];
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
  [(HDSPSleepModeManager *)self updateState];
}

- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = objc_opt_class();
    id v11 = v10;
    uint64_t v12 = NSStringFromHKSPSleepMode();
    id v13 = NSStringFromHKSPSleepMode();
    uint64_t v14 = NSStringFromHKSPSleepModeChangeReason();
    int v15 = 138544130;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    uint64_t v18 = v12;
    __int16 v19 = 2114;
    uint64_t v20 = v13;
    __int16 v21 = 2114;
    v22 = v14;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepModeDidChange: %{public}@ previousMode: %{public}@ reason: %{public}@, notifying observers", (uint8_t *)&v15, 0x2Au);
  }
  [(HDSPSleepModeManager *)self notifyObserversForSleepModeChange:a3 previousMode:a4 reason:a5];
  [(HDSPSleepModeManager *)self _powerLogSleepMode:a3 sleepScreenEnabled:[(HDSPSleepModeManager *)self sleepScreenEnabled]];
}

- (void)notifyObserversForSleepModeChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  id v9 = [(HDSPSleepModeManager *)self environment];
  __int16 v10 = [v9 currentContext];

  sleepModeObservers = self->_sleepModeObservers;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__HDSPSleepModeManager_notifyObserversForSleepModeChange_previousMode_reason___block_invoke;
  v13[3] = &unk_2645DB4E8;
  int64_t v15 = a3;
  int64_t v16 = a4;
  unint64_t v17 = a5;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [(HKSPObserverSet *)sleepModeObservers enumerateObserversWithBlock:v13];
}

void __78__HDSPSleepModeManager_notifyObserversForSleepModeChange_previousMode_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) environment];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__HDSPSleepModeManager_notifyObserversForSleepModeChange_previousMode_reason___block_invoke_2;
  v7[3] = &unk_2645DB4C0;
  id v8 = v3;
  long long v9 = *(_OWORD *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = v3;
  [v4 perform:v7 withContext:v5];
}

uint64_t __78__HDSPSleepModeManager_notifyObserversForSleepModeChange_previousMode_reason___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) sleepModeDidChange:*(void *)(a1 + 40) previousMode:*(void *)(a1 + 48) reason:*(void *)(a1 + 56)];
}

- (void)_powerLogSleepMode:(int64_t)a3 sleepScreenEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = &unk_26D40F110;
  uint64_t v12 = *MEMORY[0x263F75CC8];
  if (!a3) {
    uint64_t v5 = &unk_26D40F128;
  }
  v11[0] = v5;
  v10[0] = @"state";
  v10[1] = @"specificState";
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  v11[1] = v6;
  v10[2] = @"sleepScreenEnabled";
  id v7 = [NSNumber numberWithBool:v4];
  v11[2] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  v13[0] = v8;
  long long v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];

  HKSPPowerLog();
}

- (NSDate)currentDate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v3 = [WeakRetained currentDateProvider];
  BOOL v4 = v3[2]();

  return (NSDate *)v4;
}

- (unint64_t)sleepScheduleState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v3 = [WeakRetained sleepCoordinator];
  unint64_t v4 = [v3 currentSleepScheduleState];

  return v4;
}

- (HKSPSleepScheduleModel)sleepScheduleModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v3 = [WeakRetained sleepScheduleModelManager];
  unint64_t v4 = [v3 sleepScheduleModel];

  return (HKSPSleepScheduleModel *)v4;
}

- (BOOL)isAppleWatch
{
  id v2 = [(HDSPSleepModeManager *)self environment];
  id v3 = [v2 behavior];
  char v4 = [v3 isAppleWatch];

  return v4;
}

- (BOOL)sleepFeaturesEnabled
{
  id v2 = [(HDSPSleepModeManager *)self sleepScheduleModel];
  id v3 = [v2 sleepSettings];
  char v4 = [v3 watchSleepFeaturesEnabled];

  return v4;
}

- (BOOL)sleepScreenEnabled
{
  id v2 = [(HDSPSleepModeManager *)self sleepScheduleModel];
  id v3 = [v2 sleepSettings];
  unint64_t v4 = ((unint64_t)[v3 sleepModeOptions] >> 14) & 1;

  return v4;
}

- (BOOL)hasSleepFocusMode
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  sleepFocusModeBridge = self->_sleepFocusModeBridge;
  id v9 = 0;
  char v3 = [(HDSPSleepFocusModeBridge *)sleepFocusModeBridge hasSleepFocusMode:&v9];
  id v4 = v9;
  if (v4)
  {
    uint64_t v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v11 = v7;
      __int16 v12 = 2114;
      id v13 = v4;
      id v8 = v7;
      _os_log_error_impl(&dword_221A52000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] failed to fetch sleep focus mode: %{public}@)", buf, 0x16u);
    }
  }

  return v3;
}

- (id)computeUserVisibleEndDate
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  char v3 = [(HDSPSleepModeManager *)self sleepScheduleModel];
  id v4 = [v3 sleepEventRecord];
  unint64_t v5 = [(HDSPSleepModeManager *)self sleepScheduleState];
  id v6 = [(HDSPSleepModeManager *)self currentDate];
  if (v5 != 6)
  {
    __int16 v12 = [v3 nextEventWithIdentifier:*MEMORY[0x263F75C40] dueAfterDate:v6];
    [v12 timeIntervalSinceDate:v6];
    if (v13 > *MEMORY[0x263F75D08])
    {
      uint64_t v14 = HKSPLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 138543618;
        id v28 = (id)objc_opt_class();
        __int16 v29 = 2114;
        id v30 = v12;
        id v15 = v28;
        int64_t v16 = "[%{public}@] next wake up date is beyond maximum interval (%{public}@)";
        unint64_t v17 = v14;
        uint32_t v18 = 22;
LABEL_12:
        _os_log_impl(&dword_221A52000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v27, v18);
      }
LABEL_13:

      id v11 = 0;
LABEL_18:

      goto LABEL_19;
    }
LABEL_17:
    id v11 = v12;
    goto LABEL_18;
  }
  id v7 = [v4 wakeUpAlarmSnoozedUntilDate];
  int v8 = objc_msgSend(v7, "hksp_isAfterDate:", v6);

  if (!v8)
  {
    __int16 v12 = [v3 previousEventWithIdentifier:*MEMORY[0x263F75C40] dueBeforeDate:v6];
    __int16 v19 = [v4 wakeUpAlarmDismissedDate];
    int v20 = [v12 isEqualToDate:v19];

    uint64_t v14 = HKSPLogForCategory();
    BOOL v21 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v21)
      {
        int v27 = 138543362;
        id v28 = (id)objc_opt_class();
        id v15 = v28;
        int64_t v16 = "[%{public}@] wake up alarm already dismissed";
        unint64_t v17 = v14;
        uint32_t v18 = 12;
        goto LABEL_12;
      }
      goto LABEL_13;
    }
    if (v21)
    {
      int v27 = 138543362;
      id v28 = (id)objc_opt_class();
      id v22 = v28;
      _os_log_impl(&dword_221A52000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake up alarm is firing", (uint8_t *)&v27, 0xCu);
    }
    goto LABEL_17;
  }
  id v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138543362;
    id v28 = (id)objc_opt_class();
    id v10 = v28;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake up alarm was snoozed", (uint8_t *)&v27, 0xCu);
  }
  id v11 = [v3 nextEventWithIdentifier:*MEMORY[0x263F75C40] dueAfterDate:v6];
LABEL_19:
  uint64_t v23 = HKSPLogForCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = objc_opt_class();
    int v27 = 138543618;
    id v28 = v24;
    __int16 v29 = 2114;
    id v30 = v11;
    id v25 = v24;
    _os_log_impl(&dword_221A52000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] user visible end date is %{public}@", (uint8_t *)&v27, 0x16u);
  }

  return v11;
}

- (BOOL)shouldGoIntoSleepModeDuringState:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([(HDSPSleepModeManager *)self hasSleepFocusMode])
  {
    if (![(HDSPSleepModeManager *)self _isScheduledSleepModeEnabled])
    {
      id v4 = HKSPLogForCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138543362;
        id v9 = (id)objc_opt_class();
        id v5 = v9;
        id v6 = "[%{public}@] scheduled sleep mode not enabled";
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    if (HKSPSleepScheduleStateIsForWindDown())
    {
      if (![(HDSPSleepModeManager *)self _isSleepModeDuringWindDownEnabled])
      {
        id v4 = HKSPLogForCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 138543362;
          id v9 = (id)objc_opt_class();
          id v5 = v9;
          id v6 = "[%{public}@] sleep mode during wind down not enabled";
LABEL_11:
          _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);

          goto LABEL_12;
        }
        goto LABEL_12;
      }
    }
    else if ((HKSPSleepScheduleStateIsForBedtime() & 1) == 0)
    {
      return 0;
    }
    return 1;
  }
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = (id)objc_opt_class();
    id v5 = v9;
    id v6 = "[%{public}@] no sleep focus mode exists";
    goto LABEL_11;
  }
LABEL_12:

  return 0;
}

- (BOOL)_isScheduledSleepModeEnabled
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v3 = [(HDSPSleepModeManager *)self sleepScheduleModel];
  id v4 = [v3 sleepSchedule];

  if (v4)
  {
    if ([v4 isEnabledAndHasOccurrences])
    {
      id v5 = [(HDSPSleepModeManager *)self sleepScheduleModel];
      id v6 = [v5 sleepSettings];

      if ([v6 scheduledSleepMode])
      {
        if (![(HDSPSleepModeManager *)self isInDemoMode])
        {
          BOOL v12 = 1;
          goto LABEL_17;
        }
        id v7 = HKSPLogForCategory();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        int v14 = 138543362;
        id v15 = (id)objc_opt_class();
        id v8 = v15;
        id v9 = "[%{public}@] device is in demo mode";
      }
      else
      {
        id v7 = HKSPLogForCategory();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
LABEL_15:

          goto LABEL_16;
        }
        int v14 = 138543362;
        id v15 = (id)objc_opt_class();
        id v8 = v15;
        id v9 = "[%{public}@] scheduledSleepMode disabled";
      }
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, 0xCu);

      goto LABEL_15;
    }
    id v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = (id)objc_opt_class();
      id v10 = v15;
      id v11 = "[%{public}@] sleep schedule not enabled";
      goto LABEL_11;
    }
  }
  else
  {
    id v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = (id)objc_opt_class();
      id v10 = v15;
      id v11 = "[%{public}@] no sleep schedule";
LABEL_11:
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 0xCu);
    }
  }
LABEL_16:
  BOOL v12 = 0;
LABEL_17:

  return v12;
}

- (BOOL)_isSleepModeDuringWindDownEnabled
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = [(HDSPSleepModeManager *)self sleepScheduleModel];
  char v3 = [v2 sleepEventRecord];

  char v4 = [v3 isAnySleepCoachingOnboardingCompleted];
  if ((v4 & 1) == 0)
  {
    id v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = (id)objc_opt_class();
      id v6 = v9;
      _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] user hasn't onboarded wind down yet", (uint8_t *)&v8, 0xCu);
    }
  }

  return v4;
}

- (BOOL)isInDemoMode
{
  id v2 = [(HDSPSleepModeManager *)self environment];
  char v3 = [v2 isDemoEnvironment];

  return v3;
}

- (void)sleepFocusModeBridge:(id)a3 didUpdateSleepFocusConfiguration:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = (id)objc_opt_class();
    id v6 = v9;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepFocusModeDidChange", buf, 0xCu);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__HDSPSleepModeManager_sleepFocusModeBridge_didUpdateSleepFocusConfiguration___block_invoke;
  v7[3] = &unk_2645D90C0;
  void v7[4] = self;
  [(HDSPSleepModeManager *)self _withLock:v7];
}

uint64_t __78__HDSPSleepModeManager_sleepFocusModeBridge_didUpdateSleepFocusConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) updateState];
}

- (void)_createFocusModeIfNeeded
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v3 = [(HDSPSleepModeManager *)self environment];
  char v4 = [v3 currentContext];

  id v5 = [v4 changeEvaluation];
  id v6 = [v5 topLevelChangeKeys];
  int v7 = [v6 containsObject:*MEMORY[0x263F75BD0]];

  if (v7)
  {
    int v8 = [(HDSPSleepModeManager *)self sleepScheduleModel];
    id v9 = [v8 sleepSettings];

    if ([v9 scheduledSleepMode])
    {
      uint64_t v10 = HKSPLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = (id)objc_opt_class();
        id v11 = v14;
        _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] user just enabled scheduledSleepMode", buf, 0xCu);
      }
      uint64_t v12 = 0;
      -[HDSPSleepModeManager createFocusModeInState:error:](self, "createFocusModeInState:error:", [MEMORY[0x263F75E68] defaultConfigurationState], &v12);
    }
    else
    {
    }
  }
}

- (BOOL)createFocusModeInState:(unint64_t)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = objc_opt_class();
    id v9 = v8;
    uint64_t v10 = NSStringFromHKSPSleepFocusConfigurationState();
    int v19 = 138543618;
    int v20 = v8;
    __int16 v21 = 2114;
    id v22 = v10;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] creating sleep focus mode (state: %{public}@)", (uint8_t *)&v19, 0x16u);
  }
  char v11 = [(HDSPSleepFocusModeBridge *)self->_sleepFocusModeBridge createSleepFocusModeInState:a3 error:a4];
  uint64_t v12 = HKSPLogForCategory();
  double v13 = v12;
  if ((v11 & 1) == 0)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    unint64_t v17 = objc_opt_class();
    id v18 = *a4;
    int v19 = 138543618;
    int v20 = v17;
    __int16 v21 = 2114;
    id v22 = v18;
    id v15 = v17;
    _os_log_error_impl(&dword_221A52000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] failed to create sleep focus mode: %{public}@", (uint8_t *)&v19, 0x16u);
    goto LABEL_6;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = objc_opt_class();
    int v19 = 138543362;
    int v20 = v14;
    id v15 = v14;
    _os_log_impl(&dword_221A52000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully created sleep focus mode", (uint8_t *)&v19, 0xCu);
LABEL_6:
  }
LABEL_8:

  return v11;
}

- (BOOL)deleteFocusModeWithError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    id v16 = (id)objc_opt_class();
    id v6 = v16;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] deleting sleep focus mode", (uint8_t *)&v15, 0xCu);
  }
  char v7 = [(HDSPSleepFocusModeBridge *)self->_sleepFocusModeBridge removeSleepFocusMode:a3];
  int v8 = HKSPLogForCategory();
  id v9 = v8;
  if ((v7 & 1) == 0)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    double v13 = objc_opt_class();
    id v14 = *a3;
    int v15 = 138543618;
    id v16 = v13;
    __int16 v17 = 2114;
    id v18 = v14;
    id v11 = v13;
    _os_log_error_impl(&dword_221A52000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] failed to delete sleep focus mode: %{public}@", (uint8_t *)&v15, 0x16u);
    goto LABEL_6;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    int v15 = 138543362;
    id v16 = v10;
    id v11 = v10;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully deleted sleep focus mode", (uint8_t *)&v15, 0xCu);
LABEL_6:
  }
LABEL_8:

  return v7;
}

- (BOOL)configureFocusModeWithState:(unint64_t)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  char v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = objc_opt_class();
    id v9 = v8;
    uint64_t v10 = NSStringFromHKSPSleepFocusConfigurationState();
    int v19 = 138543618;
    int v20 = v8;
    __int16 v21 = 2114;
    id v22 = v10;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] configuring sleep focus mode (state: %{public}@)", (uint8_t *)&v19, 0x16u);
  }
  char v11 = [(HDSPSleepFocusModeBridge *)self->_sleepFocusModeBridge configureSleepFocusModeWithState:a3 error:a4];
  uint64_t v12 = HKSPLogForCategory();
  double v13 = v12;
  if ((v11 & 1) == 0)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    __int16 v17 = objc_opt_class();
    id v18 = *a4;
    int v19 = 138543618;
    int v20 = v17;
    __int16 v21 = 2114;
    id v22 = v18;
    id v15 = v17;
    _os_log_error_impl(&dword_221A52000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] failed to configure sleep focus mode: %{public}@", (uint8_t *)&v19, 0x16u);
    goto LABEL_6;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = objc_opt_class();
    int v19 = 138543362;
    int v20 = v14;
    id v15 = v14;
    _os_log_impl(&dword_221A52000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully configure sleep focus mode", (uint8_t *)&v19, 0xCu);
LABEL_6:
  }
LABEL_8:

  return v11;
}

- (void)createHomeScreenPageWithCompletion:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v6 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] creating home screen page", (uint8_t *)&v7, 0xCu);
  }
  [(HDSPSleepProactiveBridge *)self->_sleepProactiveBridge createSuggestedHomeScreenPageWithCompletion:v4];
}

- (id)diagnosticDescription
{
  id v2 = NSString;
  char v3 = [(HDSPSleepModeManager *)self currentState];
  id v4 = [v2 stringWithFormat:@"Current State: %@", v3];

  return v4;
}

- (id)diagnosticInfo
{
  v7[1] = *MEMORY[0x263EF8340];
  id v6 = @"Current State";
  id v2 = [(HDSPSleepModeManager *)self currentState];
  char v3 = [v2 stateName];
  v7[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (HKSPMutexProvider)mutexProvider
{
  return self->_mutexProvider;
}

- (HDSPSleepModeStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (HKSPObserverSet)sleepModeObservers
{
  return self->_sleepModeObservers;
}

- (HDSPSleepFocusModeBridge)sleepFocusModeBridge
{
  return self->_sleepFocusModeBridge;
}

- (HDSPSleepProactiveBridge)sleepProactiveBridge
{
  return self->_sleepProactiveBridge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepProactiveBridge, 0);
  objc_storeStrong((id *)&self->_sleepFocusModeBridge, 0);
  objc_storeStrong((id *)&self->_sleepModeObservers, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end
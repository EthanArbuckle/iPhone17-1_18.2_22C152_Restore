@interface HDSPWakeDetectionManager
+ (id)platformSpecificProviders:(id)a3;
- (BOOL)isDetecting;
- (BOOL)isWatch;
- (BOOL)sleepFeaturesEnabled;
- (BOOL)sleepModeIsOff;
- (HDSPEnvironment)environment;
- (HDSPSleepEventDelegate)sleepEventDelegate;
- (HDSPWakeDetectionManager)initWithEnvironment:(id)a3;
- (HDSPWakeDetectionManager)initWithEnvironment:(id)a3 wakeDetectorProviders:(id)a4;
- (HDSPWakeDetectionStateMachine)stateMachine;
- (HKSPMutexProvider)mutexProvider;
- (HKSPSleepScheduleModel)sleepScheduleModel;
- (HKSPSleepScheduleOccurrence)relevantOccurrence;
- (NSArray)wakeDetectors;
- (NSDate)currentDate;
- (NSDate)nextWakeUp;
- (NSDate)upcomingStartDetection;
- (NSString)providerIdentifier;
- (id)_currentState;
- (id)_detectionWindowForType:(unint64_t)a3 wakeUpDate:(id)a4 bedtimeDate:(id)a5;
- (id)detectionWindowForType:(unint64_t)a3;
- (id)diagnosticDescription;
- (id)eventIdentifiers;
- (id)upcomingEventsDueAfterDate:(id)a3;
- (unint64_t)activeTypes;
- (unint64_t)sleepScheduleState;
- (void)_simulateActivityDetectionOnDate:(id)a3;
- (void)_startWakeDetection;
- (void)_withLock:(id)a3;
- (void)earlyWakeUpWasNotifiedRemotely;
- (void)environmentDidBecomeReady:(id)a3;
- (void)environmentWillBecomeReady:(id)a3;
- (void)postWakeDetectionNotification:(unint64_t)a3;
- (void)scheduleStateExpiration;
- (void)setSleepEventDelegate:(id)a3;
- (void)significantTimeChangeDetected:(id)a3;
- (void)sleepEventIsDue:(id)a3;
- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4;
- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5;
- (void)startWakeDetection:(unint64_t)a3;
- (void)stopWakeDetection;
- (void)unscheduleStateExpiration;
- (void)updateState;
- (void)wakeDetector:(id)a3 didDetectWakeUpEventOnDate:(id)a4;
@end

@implementation HDSPWakeDetectionManager

- (HDSPWakeDetectionManager)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  v6 = [v4 behavior];
  v7 = [v5 platformSpecificProviders:v6];
  v8 = [(HDSPWakeDetectionManager *)self initWithEnvironment:v4 wakeDetectorProviders:v7];

  return v8;
}

+ (id)platformSpecificProviders:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF980];
  v11[0] = &__block_literal_global_13;
  v11[1] = &__block_literal_global_280;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:v11 count:2];
  v7 = [v3 arrayWithArray:v6];

  LODWORD(v6) = [v5 isAppleWatch];
  if (v6)
  {
    v10[0] = &__block_literal_global_284_0;
    v10[1] = &__block_literal_global_287_1;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    [v7 addObjectsFromArray:v8];
  }

  return v7;
}

HDSPSleepModeExitDetector *__54__HDSPWakeDetectionManager_platformSpecificProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPSleepModeExitDetector alloc] initWithEnvironment:v2];

  return v3;
}

HDSPSleepScreenUnlockDetector *__54__HDSPWakeDetectionManager_platformSpecificProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPSleepScreenUnlockDetector alloc] initWithEnvironment:v2];

  return v3;
}

HDSPWatchOnWristWakeDetector *__54__HDSPWakeDetectionManager_platformSpecificProviders___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDSPWatchOnWristWakeDetector alloc] initWithEnvironment:v2];

  return v3;
}

HDSPActivityWakeDetector *__54__HDSPWakeDetectionManager_platformSpecificProviders___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 behavior];
  int v4 = objc_msgSend(v3, "hksp_supportsAlwaysOnTracking");

  if (v4) {
    id v5 = [[HDSPActivityWakeDetector alloc] initWithEnvironment:v2];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (HDSPWakeDetectionManager)initWithEnvironment:(id)a3 wakeDetectorProviders:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)HDSPWakeDetectionManager;
  v8 = [(HDSPWakeDetectionManager *)&v38 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_environment, v6);
    uint64_t v32 = MEMORY[0x263EF8330];
    uint64_t v33 = 3221225472;
    v34 = __70__HDSPWakeDetectionManager_initWithEnvironment_wakeDetectorProviders___block_invoke;
    v35 = &unk_2645DA428;
    id v10 = v6;
    id v36 = v10;
    v11 = v9;
    v37 = v11;
    uint64_t v12 = objc_msgSend(v7, "na_map:", &v32);
    wakeDetectors = v11->_wakeDetectors;
    v11->_wakeDetectors = (NSArray *)v12;

    v14 = HKSPLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_opt_class();
      v16 = v11->_wakeDetectors;
      *(_DWORD *)buf = 138543618;
      v40 = v15;
      __int16 v41 = 2114;
      v42 = v16;
      id v17 = v15;
      _os_log_impl(&dword_221A52000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] has wakeDetectors: %{public}@", buf, 0x16u);
    }
    objc_msgSend(v10, "mutexGenerator", v32, v33, v34, v35);
    v18 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    uint64_t v19 = v18[2]();
    mutexProvider = v11->_mutexProvider;
    v11->_mutexProvider = (HKSPMutexProvider *)v19;

    v21 = [HDSPWakeDetectionStateMachine alloc];
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    id v24 = objc_alloc(MEMORY[0x263F75ED8]);
    v25 = [v10 userDefaults];
    v26 = (void *)[v24 initWithUserDefaults:v25];
    v27 = [v10 currentDateProvider];
    uint64_t v28 = [(HDSPWakeDetectionStateMachine *)v21 initWithIdentifier:v23 persistence:v26 delegate:v11 infoProvider:v11 currentDateProvider:v27];
    stateMachine = v11->_stateMachine;
    v11->_stateMachine = (HDSPWakeDetectionStateMachine *)v28;

    v30 = v11;
  }

  return v9;
}

id __70__HDSPWakeDetectionManager_initWithEnvironment_wakeDetectorProviders___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
  [v3 setWakeDetectorDelegate:*(void *)(a1 + 40)];

  return v3;
}

- (void)_withLock:(id)a3
{
}

- (void)environmentWillBecomeReady:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = (id)objc_opt_class();
    id v6 = v14;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentWillBecomeReady", (uint8_t *)&v13, 0xCu);
  }
  id v7 = [v4 sleepScheduleModelManager];
  [v7 addObserver:self];

  v8 = [v4 sleepScheduler];
  [v8 addEventHandler:self];

  v9 = [v4 sleepScheduler];
  [v9 addEventProvider:self];

  id v10 = [v4 sleepCoordinator];
  [v10 addObserver:self];

  v11 = [v4 timeChangeListener];
  [v11 addObserver:self];

  uint64_t v12 = [v4 diagnostics];

  [v12 addProvider:self];
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
  v6[2] = __54__HDSPWakeDetectionManager_environmentDidBecomeReady___block_invoke;
  v6[3] = &unk_2645D90C0;
  v6[4] = self;
  [(HDSPWakeDetectionManager *)self _withLock:v6];
}

uint64_t __54__HDSPWakeDetectionManager_environmentDidBecomeReady___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) updateState];
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
  v5[2] = __39__HDSPWakeDetectionManager_updateState__block_invoke;
  v5[3] = &unk_2645D90C0;
  v5[4] = self;
  [(HDSPWakeDetectionManager *)self _withLock:v5];
}

uint64_t __39__HDSPWakeDetectionManager_updateState__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) updateState];
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
  [(HDSPWakeDetectionManager *)self updateState];
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
  [(HDSPWakeDetectionManager *)self updateState];
}

- (void)wakeDetector:(id)a3 didDetectWakeUpEventOnDate:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = HKSPLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v16 = (id)objc_opt_class();
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 2114;
    id v20 = v7;
    id v9 = v16;
    _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake up event was detected by %{public}@ at %{public}@", buf, 0x20u);
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__HDSPWakeDetectionManager_wakeDetector_didDetectWakeUpEventOnDate___block_invoke;
  v12[3] = &unk_2645D9EE0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(HDSPWakeDetectionManager *)self _withLock:v12];
}

uint64_t __68__HDSPWakeDetectionManager_wakeDetector_didDetectWakeUpEventOnDate___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [*(id *)(a1 + 40) type];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v2 wakeupEventDetected:v3 date:v4];
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
  id v5 = [(HDSPWakeDetectionManager *)self sleepEventDelegate];
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
  id v5 = [(HDSPWakeDetectionManager *)self sleepEventDelegate];
  [v5 eventProviderCancelledEvents:self];
}

- (void)_startWakeDetection
{
}

- (void)startWakeDetection:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = objc_opt_class();
    id v7 = v6;
    uint64_t v8 = NSStringFromHDSPWakeDetectorTypes(a3);
    *(_DWORD *)buf = 138543618;
    id v13 = v6;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] startWakeDetection: %{public}@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v10 = [WeakRetained defaultCallbackScheduler];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__HDSPWakeDetectionManager_startWakeDetection___block_invoke;
  void v11[3] = &unk_2645D96F8;
  v11[4] = self;
  v11[5] = a3;
  [v10 performBlock:v11];
}

void __47__HDSPWakeDetectionManager_startWakeDetection___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__HDSPWakeDetectionManager_startWakeDetection___block_invoke_2;
  v3[3] = &__block_descriptor_40_e28_B16__0___HDSPWakeDetector__8l;
  v3[4] = *(void *)(a1 + 40);
  id v2 = objc_msgSend(v1, "na_filter:", v3);
  objc_msgSend(v2, "na_each:", &__block_literal_global_296_0);
}

BOOL __47__HDSPWakeDetectionManager_startWakeDetection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isDetecting])
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v4 = ([v3 type] & v5) != 0;
  }

  return v4;
}

uint64_t __47__HDSPWakeDetectionManager_startWakeDetection___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 startDetecting];
}

- (void)stopWakeDetection
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = (id)objc_opt_class();
    id v4 = v9;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] stopWakeDetection", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v6 = [WeakRetained defaultCallbackScheduler];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__HDSPWakeDetectionManager_stopWakeDetection__block_invoke;
  v7[3] = &unk_2645D90C0;
  v7[4] = self;
  [v6 performBlock:v7];
}

uint64_t __45__HDSPWakeDetectionManager_stopWakeDetection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "na_each:", &__block_literal_global_298);
}

uint64_t __45__HDSPWakeDetectionManager_stopWakeDetection__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 stopDetecting];
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
  [(HDSPWakeDetectionManager *)self updateState];
}

- (NSString)providerIdentifier
{
  id v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)upcomingEventsDueAfterDate:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__12;
  __int16 v19 = __Block_byref_object_dispose__12;
  id v20 = (id)MEMORY[0x263EFFA68];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__HDSPWakeDetectionManager_upcomingEventsDueAfterDate___block_invoke;
  v12[3] = &unk_2645D9680;
  v12[4] = self;
  id v5 = v4;
  id v13 = v5;
  __int16 v14 = &v15;
  [(HDSPWakeDetectionManager *)self _withLock:v12];
  int v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
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

void __55__HDSPWakeDetectionManager_upcomingEventsDueAfterDate___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) stateMachine];
  id v3 = [v2 currentStateExpirationDate];

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
    [(HDSPWakeDetectionManager *)self updateState];
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
    v13[2] = __44__HDSPWakeDetectionManager_sleepEventIsDue___block_invoke;
    v13[3] = &unk_2645D9288;
    v13[4] = self;
    id v14 = v4;
    [(HDSPWakeDetectionManager *)self _withLock:v13];
  }
}

void __44__HDSPWakeDetectionManager_sleepEventIsDue___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) stateMachine];
  id v2 = [*(id *)(a1 + 40) identifier];
  [v3 stateWithIdentifierDidExpire:v2];
}

- (id)eventIdentifiers
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__HDSPWakeDetectionManager_eventIdentifiers__block_invoke;
  block[3] = &unk_2645D90C0;
  block[4] = self;
  if (qword_26AB790D0 != -1) {
    dispatch_once(&qword_26AB790D0, block);
  }
  return (id)_MergedGlobals_15;
}

void __44__HDSPWakeDetectionManager_eventIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__12;
  id v11 = __Block_byref_object_dispose__12;
  id v12 = (id)MEMORY[0x263EFFA68];
  v1 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__HDSPWakeDetectionManager_eventIdentifiers__block_invoke_2;
  v6[3] = &unk_2645D9630;
  v6[4] = v1;
  void v6[5] = &v7;
  [v1 _withLock:v6];
  id v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(id)v8[5] arrayByAddingObject:*MEMORY[0x263F75C18]];
  uint64_t v4 = [v2 setWithArray:v3];
  id v5 = (void *)_MergedGlobals_15;
  _MergedGlobals_15 = v4;

  _Block_object_dispose(&v7, 8);
}

void __44__HDSPWakeDetectionManager_eventIdentifiers__block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v2 = [v5 scheduledExpirationStateIdentifiers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)postWakeDetectionNotification:(unint64_t)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  p_environment = &self->_environment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v6 = [WeakRetained sleepModeManager];
  uint64_t v7 = [v6 sleepMode];

  BOOL v8 = [(HDSPWakeDetectionManager *)self relevantOccurrence];
  uint64_t v9 = [v8 alarmConfiguration];
  uint64_t v10 = [v9 isEnabled];

  if (v7 == 2) {
    int v11 = 1;
  }
  else {
    int v11 = v10;
  }
  id v12 = HKSPLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544130;
    id v35 = (id)objc_opt_class();
    __int16 v36 = 1024;
    int v37 = v11 ^ 1;
    __int16 v38 = 1024;
    BOOL v39 = v7 == 2;
    __int16 v40 = 1024;
    int v41 = v10;
    id v13 = v35;
    _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_INFO, "[%{public}@] canAutoConfirmAwake: %d (isSleepModeOn: %d, isAlarmEnabled: %d)", buf, 0x1Eu);
  }
  id v14 = HKSPLogForCategory();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v15)
    {
      id v16 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v35 = v16;
      id v17 = v16;
      _os_log_impl(&dword_221A52000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] posting wake detection notification", buf, 0xCu);
    }
    BOOL v18 = v7 == 2;

    uint64_t v19 = (void *)MEMORY[0x263F75E50];
    uint64_t v20 = *MEMORY[0x263F75C38];
    uint64_t v21 = [(HDSPWakeDetectionManager *)self currentDate];
    v32[0] = *MEMORY[0x263F75D28];
    v22 = [NSNumber numberWithBool:v18];
    v33[0] = v22;
    v32[1] = *MEMORY[0x263F75D20];
    __int16 v23 = [NSNumber numberWithBool:v10];
    v33[1] = v23;
    uint64_t v24 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
    uint64_t v25 = [v19 sleepEventWithIdentifier:v20 dueDate:v21 context:v24];

    v26 = objc_loadWeakRetained((id *)p_environment);
    v27 = [v26 sleepScheduler];
    v31 = v25;
    uint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
    [v27 notifyForOverdueEvents:v28];
  }
  else
  {
    if (v15)
    {
      v29 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v35 = v29;
      id v30 = v29;
      _os_log_impl(&dword_221A52000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] auto-confirming awake since sleep focus and alarm are both off", buf, 0xCu);
    }
    uint64_t v25 = objc_loadWeakRetained((id *)p_environment);
    v26 = [v25 actionManager];
    [v26 confirmWakeUp:0];
  }
}

- (void)earlyWakeUpWasNotifiedRemotely
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake detection notification posted on other device", buf, 0xCu);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__HDSPWakeDetectionManager_earlyWakeUpWasNotifiedRemotely__block_invoke;
  v5[3] = &unk_2645D90C0;
  v5[4] = self;
  [(HDSPWakeDetectionManager *)self _withLock:v5];
}

uint64_t __58__HDSPWakeDetectionManager_earlyWakeUpWasNotifiedRemotely__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) earlyWakeUpWasNotifiedRemotely];
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

- (BOOL)sleepFeaturesEnabled
{
  uint64_t v2 = [(HDSPWakeDetectionManager *)self sleepScheduleModel];
  uint64_t v3 = [v2 sleepSettings];
  char v4 = [v3 watchSleepFeaturesEnabled];

  return v4;
}

- (unint64_t)sleepScheduleState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v3 = [WeakRetained sleepCoordinator];
  unint64_t v4 = [v3 currentSleepScheduleState];

  return v4;
}

- (HKSPSleepScheduleOccurrence)relevantOccurrence
{
  uint64_t v3 = [(HDSPWakeDetectionManager *)self sleepScheduleModel];
  unint64_t v4 = [(HDSPWakeDetectionManager *)self currentDate];
  id v5 = [v3 nextOccurrenceAfterDate:v4];

  return (HKSPSleepScheduleOccurrence *)v5;
}

- (BOOL)sleepModeIsOff
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v3 = [WeakRetained sleepModeManager];
  BOOL v4 = [v3 sleepMode] == 0;

  return v4;
}

- (BOOL)isWatch
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v3 = [WeakRetained behavior];
  char v4 = [v3 isAppleWatch];

  return v4;
}

- (unint64_t)activeTypes
{
  uint64_t v3 = [(HDSPWakeDetectionManager *)self currentDate];
  char v4 = [(HDSPWakeDetectionManager *)self sleepScheduleModel];
  id v5 = [v4 nextEventWithIdentifier:*MEMORY[0x263F75C40] dueAfterDate:v3];

  if (v5)
  {
    int v6 = [(HDSPWakeDetectionManager *)self sleepScheduleModel];
    id v7 = [v6 nextEventWithIdentifier:*MEMORY[0x263F75C18] dueAfterDate:v3];

    uint64_t v8 = 2;
    uint64_t v9 = [(HDSPWakeDetectionManager *)self _detectionWindowForType:2 wakeUpDate:v5 bedtimeDate:v7];
    uint64_t v10 = [v9 startDate];

    if (!objc_msgSend(v3, "hksp_isAfterOrSameAsDate:", v10)) {
      uint64_t v8 = 0;
    }
    int v11 = [(HDSPWakeDetectionManager *)self _detectionWindowForType:1 wakeUpDate:v5 bedtimeDate:v7];
    id v12 = [v11 startDate];

    unint64_t v13 = v8 | objc_msgSend(v3, "hksp_isAfterOrSameAsDate:", v12);
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

- (NSDate)upcomingStartDetection
{
  uint64_t v3 = [(HDSPWakeDetectionManager *)self currentDate];
  char v4 = [(HDSPWakeDetectionManager *)self sleepScheduleModel];
  id v5 = [v4 nextEventWithIdentifier:*MEMORY[0x263F75C40] dueAfterDate:v3];

  if (v5)
  {
    int v6 = [(HDSPWakeDetectionManager *)self sleepScheduleModel];
    id v7 = [v6 nextEventWithIdentifier:*MEMORY[0x263F75C18] dueAfterDate:v3];

    uint64_t v8 = [(HDSPWakeDetectionManager *)self _detectionWindowForType:2 wakeUpDate:v5 bedtimeDate:v7];
    uint64_t v9 = [v8 startDate];

    if (objc_msgSend(v3, "hksp_isBeforeDate:", v9))
    {
      id v10 = v9;
    }
    else
    {
      int v11 = [(HDSPWakeDetectionManager *)self _detectionWindowForType:1 wakeUpDate:v5 bedtimeDate:v7];
      id v12 = [v11 startDate];

      if (objc_msgSend(v3, "hksp_isBeforeDate:", v12)) {
        id v10 = v12;
      }
      else {
        id v10 = 0;
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return (NSDate *)v10;
}

- (id)detectionWindowForType:(unint64_t)a3
{
  id v5 = [(HDSPWakeDetectionManager *)self currentDate];
  int v6 = [(HDSPWakeDetectionManager *)self sleepScheduleModel];
  id v7 = [v6 nextEventWithIdentifier:*MEMORY[0x263F75C40] dueAfterDate:v5];

  if (v7)
  {
    uint64_t v8 = [(HDSPWakeDetectionManager *)self sleepScheduleModel];
    uint64_t v9 = [v8 nextEventWithIdentifier:*MEMORY[0x263F75C18] dueAfterDate:v5];

    id v10 = [(HDSPWakeDetectionManager *)self _detectionWindowForType:a3 wakeUpDate:v7 bedtimeDate:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_detectionWindowForType:(unint64_t)a3 wakeUpDate:(id)a4 bedtimeDate:(id)a5
{
  char v6 = a3;
  id v7 = a4;
  id v8 = a5;
  char v9 = objc_msgSend(v8, "hksp_isAfterDate:", v7);
  double v10 = 10800.0;
  if ((v6 & 2) == 0) {
    double v10 = 0.0;
  }
  if (v6) {
    double v10 = 1800.0;
  }
  int v11 = [v7 dateByAddingTimeInterval:-v10];
  id v12 = v11;
  if ((v9 & 1) == 0)
  {
    uint64_t v13 = [v11 laterDate:v8];

    id v12 = (void *)v13;
  }
  id v14 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v12 endDate:v7];

  return v14;
}

- (NSDate)nextWakeUp
{
  uint64_t v3 = [(HDSPWakeDetectionManager *)self currentDate];
  char v4 = [(HDSPWakeDetectionManager *)self sleepScheduleModel];
  id v5 = [v4 nextEventWithIdentifier:*MEMORY[0x263F75C40] dueAfterDate:v3];

  return (NSDate *)v5;
}

- (BOOL)isDetecting
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__HDSPWakeDetectionManager_isDetecting__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPWakeDetectionManager *)self _withLock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __39__HDSPWakeDetectionManager_isDetecting__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) stateMachine];
  char v2 = [v3 currentState];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isDetectingState];
}

- (id)_currentState
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__12;
  char v9 = __Block_byref_object_dispose__12;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__HDSPWakeDetectionManager__currentState__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPWakeDetectionManager *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __41__HDSPWakeDetectionManager__currentState__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) currentState];

  return MEMORY[0x270F9A758]();
}

- (id)diagnosticDescription
{
  id v2 = NSString;
  id v3 = [(HDSPWakeDetectionManager *)self _currentState];
  char v4 = [v2 stringWithFormat:@"Current State: %@", v3];

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

- (NSArray)wakeDetectors
{
  return self->_wakeDetectors;
}

- (HKSPMutexProvider)mutexProvider
{
  return self->_mutexProvider;
}

- (HDSPWakeDetectionStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_storeStrong((id *)&self->_wakeDetectors, 0);
  objc_destroyWeak((id *)&self->_sleepEventDelegate);

  objc_destroyWeak((id *)&self->_environment);
}

- (void)_simulateActivityDetectionOnDate:(id)a3
{
  id v8 = a3;
  char v4 = [(HDSPWakeDetectionManager *)self wakeDetectors];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    char v6 = [(HDSPWakeDetectionManager *)self wakeDetectors];
    uint64_t v7 = [v6 firstObject];
    [(HDSPWakeDetectionManager *)self wakeDetector:v7 didDetectWakeUpEventOnDate:v8];
  }
}

@end
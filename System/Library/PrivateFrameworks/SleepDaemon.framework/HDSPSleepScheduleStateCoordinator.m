@interface HDSPSleepScheduleStateCoordinator
- (BOOL)_updateEventRecordHelper:(id)a3 sleepScheduleState:(unint64_t)a4 context:(id)a5;
- (BOOL)isAppleWatch;
- (BOOL)sleepFeaturesEnabled;
- (HDSPEnvironment)environment;
- (HDSPSleepScheduleStateCoordinator)initWithEnvironment:(id)a3;
- (HDSPSleepScheduleStateCoordinatorStateMachine)stateMachine;
- (HKSPMutexProvider)mutexProvider;
- (HKSPObserverSet)observers;
- (HKSPSleepScheduleModel)sleepScheduleModel;
- (HKSPSleepScheduleOccurrence)previousOccurrence;
- (NSDate)currentDate;
- (NSString)sourceIdentifier;
- (id)currentState;
- (id)diagnosticDescription;
- (id)diagnosticInfo;
- (id)eventIdentifiers;
- (unint64_t)currentSleepScheduleState;
- (void)_updateEventRecordForSleepScheduleState:(unint64_t)a3 context:(id)a4 notifyBlock:(id)a5;
- (void)_updateSleepScheduleState;
- (void)_withLock:(id)a3;
- (void)addObserver:(id)a3;
- (void)environmentDidBecomeReady:(id)a3;
- (void)environmentWillBecomeReady:(id)a3;
- (void)removeObserver:(id)a3;
- (void)significantTimeChangeDetected:(id)a3;
- (void)sleepEventIsDue:(id)a3;
- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4;
- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 context:(id)a5;
- (void)snoozeFireDateShouldBeReset;
- (void)timeZoneChangeDetected:(id)a3;
- (void)wakeUpAlarmWasDismissedFromSource:(unint64_t)a3;
- (void)wakeUpWasConfirmed:(BOOL)a3;
@end

@implementation HDSPSleepScheduleStateCoordinator

- (HDSPSleepScheduleStateCoordinator)initWithEnvironment:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HDSPSleepScheduleStateCoordinator;
  v5 = [(HDSPSleepScheduleStateCoordinator *)&v27 init];
  if (v5)
  {
    v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v29 = v7;
      __int16 v30 = 2048;
      v31 = v5;
      id v8 = v7;
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);
    }
    objc_storeWeak((id *)&v5->_environment, v4);
    id v9 = objc_alloc(MEMORY[0x263F75E20]);
    v10 = [v4 defaultCallbackScheduler];
    uint64_t v11 = [v9 initWithCallbackScheduler:v10];
    observers = v5->_observers;
    v5->_observers = (HKSPObserverSet *)v11;

    v13 = [v4 mutexGenerator];
    uint64_t v14 = v13[2]();
    mutexProvider = v5->_mutexProvider;
    v5->_mutexProvider = (HKSPMutexProvider *)v14;

    v16 = [HDSPSleepScheduleStateCoordinatorStateMachine alloc];
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    id v19 = objc_alloc(MEMORY[0x263F75ED8]);
    v20 = [v4 userDefaults];
    v21 = (void *)[v19 initWithUserDefaults:v20];
    v22 = [v4 currentDateProvider];
    uint64_t v23 = [(HDSPSleepScheduleStateCoordinatorStateMachine *)v16 initWithIdentifier:v18 persistence:v21 delegate:v5 infoProvider:v5 currentDateProvider:v22];
    stateMachine = v5->_stateMachine;
    v5->_stateMachine = (HDSPSleepScheduleStateCoordinatorStateMachine *)v23;

    v25 = v5;
  }

  return v5;
}

- (void)_withLock:(id)a3
{
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_updateSleepScheduleState
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] _updateSleepScheduleState", buf, 0xCu);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__HDSPSleepScheduleStateCoordinator__updateSleepScheduleState__block_invoke;
  v5[3] = &unk_2645D90C0;
  v5[4] = self;
  [(HDSPSleepScheduleStateCoordinator *)self _withLock:v5];
}

uint64_t __62__HDSPSleepScheduleStateCoordinator__updateSleepScheduleState__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) updateState];
}

- (void)environmentWillBecomeReady:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = (id)objc_opt_class();
    id v6 = v13;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentWillBecomeReady", (uint8_t *)&v12, 0xCu);
  }
  id v7 = [v4 sleepScheduleModelManager];
  [v7 addObserver:self];

  uint64_t v8 = [v4 sleepScheduler];
  [v8 addEventHandler:self];

  id v9 = [v4 actionManager];
  [v9 addObserver:self];

  v10 = [v4 timeChangeListener];
  [v10 addObserver:self];

  uint64_t v11 = [v4 diagnostics];

  [v11 addProvider:self];
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
  v6[2] = __63__HDSPSleepScheduleStateCoordinator_environmentDidBecomeReady___block_invoke;
  v6[3] = &unk_2645D90C0;
  v6[4] = self;
  [(HDSPSleepScheduleStateCoordinator *)self _withLock:v6];
}

uint64_t __63__HDSPSleepScheduleStateCoordinator_environmentDidBecomeReady___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) updateState];
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 context:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a5;
  uint64_t v9 = [(HDSPSleepScheduleStateCoordinator *)self environment];
  v10 = [v9 currentContext];

  uint64_t v11 = HKSPLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = objc_opt_class();
    id v19 = v12;
    id v13 = NSStringFromHKSPSleepScheduleState();
    uint64_t v14 = NSStringFromHKSPSleepScheduleState();
    [v8 reason];
    v15 = NSStringFromHKSPSleepScheduleStateChangeReason();
    *(_DWORD *)buf = 138544130;
    v26 = v12;
    __int16 v27 = 2114;
    v28 = v13;
    __int16 v29 = 2114;
    __int16 v30 = v14;
    __int16 v31 = 2114;
    uint64_t v32 = v15;
    _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying observers for sleepScheduleStateDidChange from %{public}@ to %{public}@ with reason %{public}@", buf, 0x2Au);
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __87__HDSPSleepScheduleStateCoordinator_sleepScheduleStateDidChange_previousState_context___block_invoke;
  v20[3] = &unk_2645DAA08;
  unint64_t v23 = a3;
  unint64_t v24 = a4;
  v20[4] = self;
  id v21 = v8;
  id v22 = v10;
  id v16 = v10;
  id v17 = v8;
  v18 = (void *)MEMORY[0x223C8D8E0](v20);
  [(HDSPSleepScheduleStateCoordinator *)self _updateEventRecordForSleepScheduleState:a3 context:v17 notifyBlock:v18];
}

id __87__HDSPSleepScheduleStateCoordinator_sleepScheduleStateDidChange_previousState_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __87__HDSPSleepScheduleStateCoordinator_sleepScheduleStateDidChange_previousState_context___block_invoke_2;
  v6[3] = &unk_2645DA9E0;
  v6[4] = v2;
  long long v9 = *(_OWORD *)(a1 + 56);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v4 = [v3 enumerateObserversWithFutureBlock:v6];

  return v4;
}

id __87__HDSPSleepScheduleStateCoordinator_sleepScheduleStateDidChange_previousState_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) environment];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __87__HDSPSleepScheduleStateCoordinator_sleepScheduleStateDidChange_previousState_context___block_invoke_3;
  int v12 = &unk_2645DA9B8;
  id v13 = v3;
  long long v15 = *(_OWORD *)(a1 + 56);
  id v14 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = v3;
  [v4 perform:&v9 withContext:v5];

  id v7 = objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", v9, v10, v11, v12);

  return v7;
}

uint64_t __87__HDSPSleepScheduleStateCoordinator_sleepScheduleStateDidChange_previousState_context___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 56);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) reason];

  return [v3 sleepScheduleStateDidChange:v1 previousState:v2 reason:v4];
}

- (void)_updateEventRecordForSleepScheduleState:(unint64_t)a3 context:(id)a4 notifyBlock:(id)a5
{
  id v8 = (uint64_t (**)(void))a5;
  id v9 = a4;
  uint64_t v10 = [(HDSPSleepScheduleStateCoordinator *)self sleepScheduleModel];
  uint64_t v11 = [v10 sleepEventRecord];
  int v12 = (void *)[v11 mutableCopy];

  LODWORD(a3) = [(HDSPSleepScheduleStateCoordinator *)self _updateEventRecordHelper:v12 sleepScheduleState:a3 context:v9];
  if (a3)
  {
    id v13 = [(HDSPSleepScheduleStateCoordinator *)self environment];
    id v14 = [v13 sleepScheduleModelManager];

    long long v15 = [(HDSPSleepScheduleStateCoordinator *)self environment];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __97__HDSPSleepScheduleStateCoordinator__updateEventRecordForSleepScheduleState_context_notifyBlock___block_invoke;
    v18[3] = &unk_2645DAA30;
    id v19 = v14;
    id v20 = v12;
    id v21 = self;
    id v22 = v8;
    id v16 = v14;
    [v15 perform:v18 withSource:self];
  }
  else
  {
    id v17 = (id)v8[2](v8);
  }
}

void __97__HDSPSleepScheduleStateCoordinator__updateEventRecordForSleepScheduleState_context_notifyBlock___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v9 = 0;
  char v4 = [v2 saveSleepEventRecord:v3 error:&v9 preNotifyBlock:a1[7]];
  id v5 = v9;
  if ((v4 & 1) == 0)
  {
    id v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = v5;
      id v8 = v7;
      _os_log_error_impl(&dword_221A52000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] failed to save event record with error %{public}@", buf, 0x16u);
    }
  }
}

- (BOOL)_updateEventRecordHelper:(id)a3 sleepScheduleState:(unint64_t)a4 context:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (a4 == 1 && [a5 isForAlarmTurnedOffWhileFiring])
  {
    id v9 = [(HDSPSleepScheduleStateCoordinator *)self currentDate];
    uint64_t v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v9;
      id v11 = v15;
      _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] setting wakeUpAlarmDismissedDate to %{public}@", (uint8_t *)&v14, 0x16u);
    }
    [v8 setWakeUpAlarmDismissedDate:v9];

    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)snoozeFireDateShouldBeReset
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = (id)objc_opt_class();
    id v4 = v19;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] snoozeFireDateShouldBeReset", buf, 0xCu);
  }
  id v5 = [(HDSPSleepScheduleStateCoordinator *)self sleepScheduleModel];
  id v6 = [v5 sleepEventRecord];
  id v7 = (void *)[v6 mutableCopy];

  [v7 setWakeUpAlarmSnoozedUntilDate:0];
  id v8 = [(HDSPSleepScheduleStateCoordinator *)self environment];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  int v14 = __64__HDSPSleepScheduleStateCoordinator_snoozeFireDateShouldBeReset__block_invoke;
  id v15 = &unk_2645D9288;
  __int16 v16 = self;
  id v17 = v7;
  id v9 = v7;
  [v8 perform:&v12 withSource:self];

  uint64_t v10 = [(HDSPSleepScheduleStateCoordinator *)self environment];
  id v11 = [v10 sleepAlarmManager];
  [v11 resetSleepAlarmSnoozeState];
}

void __64__HDSPSleepScheduleStateCoordinator_snoozeFireDateShouldBeReset__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) environment];
  uint64_t v3 = [v2 sleepScheduleModelManager];
  uint64_t v4 = *(void *)(a1 + 40);
  id v10 = 0;
  char v5 = [v3 saveSleepEventRecord:v4 error:&v10];
  id v6 = v10;

  if ((v5 & 1) == 0)
  {
    id v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      id v14 = v6;
      id v9 = v8;
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to save event record with error %{public}@", buf, 0x16u);
    }
  }
}

- (unint64_t)currentSleepScheduleState
{
  uint64_t v2 = [(HDSPSleepScheduleStateCoordinator *)self currentState];
  unint64_t v3 = [v2 scheduleState];

  return v3;
}

- (BOOL)isAppleWatch
{
  uint64_t v2 = [(HDSPSleepScheduleStateCoordinator *)self environment];
  unint64_t v3 = [v2 behavior];
  char v4 = [v3 isAppleWatch];

  return v4;
}

- (BOOL)sleepFeaturesEnabled
{
  uint64_t v2 = [(HDSPSleepScheduleStateCoordinator *)self sleepScheduleModel];
  unint64_t v3 = [v2 sleepSettings];
  char v4 = [v3 watchSleepFeaturesEnabled];

  return v4;
}

- (HKSPSleepScheduleModel)sleepScheduleModel
{
  uint64_t v2 = [(HDSPSleepScheduleStateCoordinator *)self environment];
  unint64_t v3 = [v2 sleepScheduleModelManager];
  char v4 = [v3 sleepScheduleModel];

  return (HKSPSleepScheduleModel *)v4;
}

- (NSDate)currentDate
{
  uint64_t v2 = [(HDSPSleepScheduleStateCoordinator *)self environment];
  unint64_t v3 = [v2 currentDateProvider];
  char v4 = v3[2]();

  return (NSDate *)v4;
}

- (HKSPSleepScheduleOccurrence)previousOccurrence
{
  unint64_t v3 = [(HDSPSleepScheduleStateCoordinator *)self sleepScheduleModel];
  char v4 = [(HDSPSleepScheduleStateCoordinator *)self currentDate];
  char v5 = [v3 previousOccurrenceBeforeDate:v4];

  return (HKSPSleepScheduleOccurrence *)v5;
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = (id)objc_opt_class();
    __int16 v15 = 2114;
    id v16 = v5;
    id v7 = v14;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] didUpdateSleepScheduleModel: %{public}@", buf, 0x16u);
  }
  id v8 = [(HDSPSleepScheduleStateCoordinator *)self environment];
  id v9 = [v8 currentContext];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __91__HDSPSleepScheduleStateCoordinator_sleepScheduleModelManager_didUpdateSleepScheduleModel___block_invoke;
  v11[3] = &unk_2645D9288;
  v11[4] = self;
  id v12 = v9;
  id v10 = v9;
  [(HDSPSleepScheduleStateCoordinator *)self _withLock:v11];
}

void __91__HDSPSleepScheduleStateCoordinator_sleepScheduleModelManager_didUpdateSleepScheduleModel___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 24);
  id v2 = [*(id *)(a1 + 40) changeEvaluation];
  [v1 scheduleModelChanged:v2];
}

- (void)significantTimeChangeDetected:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = (id)objc_opt_class();
    id v5 = v8;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] significantTimeChangeDetected", buf, 0xCu);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__HDSPSleepScheduleStateCoordinator_significantTimeChangeDetected___block_invoke;
  v6[3] = &unk_2645D90C0;
  v6[4] = self;
  [(HDSPSleepScheduleStateCoordinator *)self _withLock:v6];
}

uint64_t __67__HDSPSleepScheduleStateCoordinator_significantTimeChangeDetected___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) significantTimeChange];
}

- (void)timeZoneChangeDetected:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = (id)objc_opt_class();
    id v5 = v8;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] timeZoneChangeDetected", buf, 0xCu);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__HDSPSleepScheduleStateCoordinator_timeZoneChangeDetected___block_invoke;
  v6[3] = &unk_2645D90C0;
  v6[4] = self;
  [(HDSPSleepScheduleStateCoordinator *)self _withLock:v6];
}

uint64_t __60__HDSPSleepScheduleStateCoordinator_timeZoneChangeDetected___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) timeZoneChange];
}

- (void)sleepEventIsDue:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v28 = (id)objc_opt_class();
    __int16 v29 = 2114;
    id v30 = v4;
    id v6 = v28;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepEventIsDue: %{public}@", buf, 0x16u);
  }
  id v7 = [v4 identifier];
  int v8 = [v7 isEqualToString:*MEMORY[0x263F75C40]];

  if (v8)
  {
    uint64_t v9 = HKSPLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v28 = v10;
      id v11 = v10;
      _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] wakeTimeReached", buf, 0xCu);
    }
    id v12 = v26;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    __int16 v13 = __53__HDSPSleepScheduleStateCoordinator_sleepEventIsDue___block_invoke;
LABEL_15:
    v12[2] = v13;
    v12[3] = &unk_2645D90C0;
    v12[4] = self;
    -[HDSPSleepScheduleStateCoordinator _withLock:](self, "_withLock:");
    goto LABEL_16;
  }
  id v14 = [v4 identifier];
  int v15 = [v14 isEqualToString:*MEMORY[0x263F75C18]];

  if (v15)
  {
    id v16 = HKSPLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v28 = v17;
      id v18 = v17;
      _os_log_impl(&dword_221A52000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] bedtimeReached", buf, 0xCu);
    }
    id v12 = v25;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    __int16 v13 = __53__HDSPSleepScheduleStateCoordinator_sleepEventIsDue___block_invoke_283;
    goto LABEL_15;
  }
  id v19 = [v4 identifier];
  int v20 = [v19 isEqualToString:*MEMORY[0x263F75C50]];

  if (v20)
  {
    id v21 = HKSPLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v28 = v22;
      id v23 = v22;
      _os_log_impl(&dword_221A52000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] windDownReached", buf, 0xCu);
    }
    id v12 = v24;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    __int16 v13 = __53__HDSPSleepScheduleStateCoordinator_sleepEventIsDue___block_invoke_284;
    goto LABEL_15;
  }
LABEL_16:
}

uint64_t __53__HDSPSleepScheduleStateCoordinator_sleepEventIsDue___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) wakeTimeReached];
}

uint64_t __53__HDSPSleepScheduleStateCoordinator_sleepEventIsDue___block_invoke_283(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) bedtimeReached];
}

uint64_t __53__HDSPSleepScheduleStateCoordinator_sleepEventIsDue___block_invoke_284(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) windDownReached];
}

- (id)eventIdentifiers
{
  return (id)[MEMORY[0x263F75E50] standardEventIdentifiers];
}

- (void)wakeUpWasConfirmed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 1024;
    BOOL v12 = v3;
    id v6 = v10;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] wakeUpWasConfirmed (wasExplicitConfirmation: %d)", buf, 0x12u);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__HDSPSleepScheduleStateCoordinator_wakeUpWasConfirmed___block_invoke;
  v7[3] = &unk_2645DAA58;
  v7[4] = self;
  BOOL v8 = v3;
  [(HDSPSleepScheduleStateCoordinator *)self _withLock:v7];
}

uint64_t __56__HDSPSleepScheduleStateCoordinator_wakeUpWasConfirmed___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) wakeUpConfirmed:*(unsigned __int8 *)(a1 + 40)];
}

- (void)wakeUpAlarmWasDismissedFromSource:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = (id)objc_opt_class();
    id v5 = v8;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] wakeUpAlarmWasDismissed", buf, 0xCu);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__HDSPSleepScheduleStateCoordinator_wakeUpAlarmWasDismissedFromSource___block_invoke;
  v6[3] = &unk_2645D90C0;
  v6[4] = self;
  [(HDSPSleepScheduleStateCoordinator *)self _withLock:v6];
}

uint64_t __71__HDSPSleepScheduleStateCoordinator_wakeUpAlarmWasDismissedFromSource___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) alarmDismissed];
}

- (NSString)sourceIdentifier
{
  id v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)currentState
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__17;
  uint64_t v9 = __Block_byref_object_dispose__17;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__HDSPSleepScheduleStateCoordinator_currentState__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPSleepScheduleStateCoordinator *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __49__HDSPSleepScheduleStateCoordinator_currentState__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) currentState];

  return MEMORY[0x270F9A758]();
}

- (id)diagnosticDescription
{
  id v2 = NSString;
  BOOL v3 = [(HDSPSleepScheduleStateCoordinator *)self currentState];
  id v4 = [v2 stringWithFormat:@"Current State: %@", v3];

  return v4;
}

- (id)diagnosticInfo
{
  v7[1] = *MEMORY[0x263EF8340];
  id v6 = @"Current State";
  id v2 = [(HDSPSleepScheduleStateCoordinator *)self currentState];
  BOOL v3 = [v2 stateName];
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

- (HDSPSleepScheduleStateCoordinatorStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end
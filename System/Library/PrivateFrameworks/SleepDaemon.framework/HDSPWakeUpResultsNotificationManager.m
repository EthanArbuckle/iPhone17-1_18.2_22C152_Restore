@interface HDSPWakeUpResultsNotificationManager
+ (id)retryActivity;
+ (id)retryCriteria;
- (BOOL)_isDelayingForTracking;
- (BOOL)_isWaitingForWakeUp;
- (BOOL)isWakeUpResultsNotificationEnabled;
- (HDSPActivityScheduler)retryAttemptScheduler;
- (HDSPEnvironment)environment;
- (HDSPSleepEventDelegate)sleepEventDelegate;
- (HDSPWakeUpResultsNotificationManager)initWithEnvironment:(id)a3;
- (HDSPWakeUpResultsNotificationManager)initWithEnvironment:(id)a3 retryAttemptScheduler:(id)a4;
- (HDSPWakeUpResultsNotificationStateMachine)stateMachine;
- (HKSHSleepMetricsEngine)sleepMetricsEngine;
- (HKSPMutexProvider)mutexProvider;
- (NAFuture)queryResultFuture;
- (NSDate)currentDate;
- (NSString)providerIdentifier;
- (double)_trackingDelayDuration;
- (id)_currentState;
- (id)_fetchSleepDaySummariesForMorningIndexRange:(id)a3 healthStore:(id)a4;
- (id)_fetchUserFirstNameWithHealthStore:(id)a3;
- (id)_sleepDaySummariesFromResult:(id)a3 error:(id *)a4;
- (id)_sleepScheduleModel;
- (id)_userFirstNameFromResult:(id)a3;
- (id)diagnosticDescription;
- (id)eventIdentifiers;
- (id)notificationAttemptWindowForWakeUpBeforeDate:(id)a3;
- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4;
- (id)performImmediateQueryForNotification;
- (id)upcomingEventsDueAfterDate:(id)a3;
- (void)_lock_startQuery;
- (void)_updateState;
- (void)_withLock:(id)a3;
- (void)environmentDidBecomeReady:(id)a3;
- (void)environmentWillBecomeReady:(id)a3;
- (void)executeQuery;
- (void)postResultsNotification;
- (void)scheduleRetryAttempt;
- (void)scheduleStateExpiration;
- (void)setSleepEventDelegate:(id)a3;
- (void)significantTimeChangeDetected:(id)a3;
- (void)sleepEventIsDue:(id)a3;
- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4;
- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5;
- (void)startObservingProtectedHealthDataAvailability;
- (void)stopObservingProtectedHealthDataAvailability;
- (void)unscheduleRetryAttempt;
- (void)unscheduleStateExpiration;
@end

@implementation HDSPWakeUpResultsNotificationManager

- (HDSPWakeUpResultsNotificationManager)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v5 = [HDSPXPCActivityScheduler alloc];
  v6 = [v4 defaultCallbackScheduler];
  v7 = [(HDSPXPCActivityScheduler *)v5 initWithCallbackScheduler:v6];
  v8 = [(HDSPWakeUpResultsNotificationManager *)self initWithEnvironment:v4 retryAttemptScheduler:v7];

  return v8;
}

- (HDSPWakeUpResultsNotificationManager)initWithEnvironment:(id)a3 retryAttemptScheduler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HDSPWakeUpResultsNotificationManager;
  v8 = [(HDSPWakeUpResultsNotificationManager *)&v24 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeStrong((id *)&v9->_retryAttemptScheduler, a4);
    v10 = [v6 mutexGenerator];
    uint64_t v11 = v10[2]();
    mutexProvider = v9->_mutexProvider;
    v9->_mutexProvider = (HKSPMutexProvider *)v11;

    v13 = [HDSPWakeUpResultsNotificationStateMachine alloc];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    id v16 = objc_alloc(MEMORY[0x263F75ED8]);
    v17 = [v6 userDefaults];
    v18 = (void *)[v16 initWithUserDefaults:v17];
    v19 = [v6 currentDateProvider];
    uint64_t v20 = [(HDSPWakeUpResultsNotificationStateMachine *)v13 initWithIdentifier:v15 persistence:v18 delegate:v9 infoProvider:v9 currentDateProvider:v19];
    stateMachine = v9->_stateMachine;
    v9->_stateMachine = (HDSPWakeUpResultsNotificationStateMachine *)v20;

    v22 = v9;
  }

  return v9;
}

- (id)performImmediateQueryForNotification
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__13;
  v9 = __Block_byref_object_dispose__13;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __76__HDSPWakeUpResultsNotificationManager_performImmediateQueryForNotification__block_invoke;
  v4[3] = &unk_2645D90E8;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPWakeUpResultsNotificationManager *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __76__HDSPWakeUpResultsNotificationManager_performImmediateQueryForNotification__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) executeQuery];
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v3, v2);
}

- (id)_sleepScheduleModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v3 = [WeakRetained sleepScheduleModelManager];
  id v4 = [v3 sleepScheduleModel];

  return v4;
}

- (void)_withLock:(id)a3
{
}

- (void)_updateState
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Update state", buf, 0xCu);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__HDSPWakeUpResultsNotificationManager__updateState__block_invoke;
  v5[3] = &unk_2645D90C0;
  v5[4] = self;
  [(HDSPWakeUpResultsNotificationManager *)self _withLock:v5];
}

uint64_t __52__HDSPWakeUpResultsNotificationManager__updateState__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) updateState];
}

- (void)environmentWillBecomeReady:(id)a3
{
  p_environment = &self->_environment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v6 = [WeakRetained sleepScheduler];
  [v6 addEventHandler:self];

  id v7 = objc_loadWeakRetained((id *)p_environment);
  uint64_t v8 = [v7 sleepScheduler];
  [v8 addEventProvider:self];

  id v9 = objc_loadWeakRetained((id *)p_environment);
  id v10 = [v9 notificationListener];
  [v10 addObserver:self];

  id v11 = objc_loadWeakRetained((id *)p_environment);
  v12 = [v11 sleepCoordinator];
  [v12 addObserver:self];

  id v13 = objc_loadWeakRetained((id *)p_environment);
  v14 = [v13 sleepScheduleModelManager];
  [v14 addObserver:self];

  id v15 = objc_loadWeakRetained((id *)p_environment);
  id v16 = [v15 timeChangeListener];
  [v16 addObserver:self];

  id v18 = objc_loadWeakRetained((id *)p_environment);
  v17 = [v18 diagnostics];
  [v17 addProvider:self];
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
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Environment did become ready.", (uint8_t *)&v6, 0xCu);
  }
  [(HDSPWakeUpResultsNotificationManager *)self _updateState];
}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [NSString stringWithUTF8String:*MEMORY[0x263F09BB8]];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy__13;
    v19 = __Block_byref_object_dispose__13;
    id v20 = 0;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __92__HDSPWakeUpResultsNotificationManager_notificationListener_didReceiveNotificationWithName___block_invoke;
    v14[3] = &unk_2645D90E8;
    v14[4] = self;
    v14[5] = &v15;
    [(HDSPWakeUpResultsNotificationManager *)self _withLock:v14];
    id v10 = (void *)v16[5];
    if (v10)
    {
      id v11 = v10;
    }
    else
    {
      id v11 = [MEMORY[0x263F58190] futureWithNoResult];
    }
    v12 = v11;
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v12 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v12;
}

void __92__HDSPWakeUpResultsNotificationManager_notificationListener_didReceiveNotificationWithName___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) protectedHealthDataDidBecomeAvailable];
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v3, v2);
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
  [(HDSPWakeUpResultsNotificationManager *)self _updateState];
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v6 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sleep model changed", (uint8_t *)&v7, 0xCu);
  }
  [(HDSPWakeUpResultsNotificationManager *)self _updateState];
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_opt_class();
    id v9 = v8;
    id v10 = NSStringFromHKSPSleepScheduleState();
    id v11 = NSStringFromHKSPSleepScheduleState();
    v12 = NSStringFromHKSPSleepScheduleStateChangeReason();
    *(_DWORD *)buf = 138544130;
    uint64_t v15 = v8;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    v19 = v11;
    __int16 v20 = 2114;
    v21 = v12;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepScheduleStateChanged from %{public}@ to %{public}@ for %{public}@", buf, 0x2Au);
  }
  if (a3 == 1 && HKSPSleepScheduleStateChangeReasonIsExpected())
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __89__HDSPWakeUpResultsNotificationManager_sleepScheduleStateDidChange_previousState_reason___block_invoke;
    v13[3] = &unk_2645D90C0;
    v13[4] = self;
    [(HDSPWakeUpResultsNotificationManager *)self _withLock:v13];
  }
  else
  {
    [(HDSPWakeUpResultsNotificationManager *)self _updateState];
  }
}

uint64_t __89__HDSPWakeUpResultsNotificationManager_sleepScheduleStateDidChange_previousState_reason___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) wakeUpDidOccur];
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
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  __int16 v18 = __Block_byref_object_copy__13;
  v19 = __Block_byref_object_dispose__13;
  id v20 = (id)MEMORY[0x263EFFA68];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__HDSPWakeUpResultsNotificationManager_upcomingEventsDueAfterDate___block_invoke;
  v12[3] = &unk_2645D9680;
  v12[4] = self;
  id v5 = v4;
  id v13 = v5;
  v14 = &v15;
  [(HDSPWakeUpResultsNotificationManager *)self _withLock:v12];
  id v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = objc_opt_class();
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

void __67__HDSPWakeUpResultsNotificationManager_upcomingEventsDueAfterDate___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) stateMachine];
  v3 = [v2 currentStateExpirationDate];

  if (objc_msgSend(v3, "hksp_isAfterDate:", *(void *)(a1 + 40)))
  {
    id v4 = (void *)MEMORY[0x263F75E50];
    id v5 = [*(id *)(a1 + 32) stateMachine];
    id v6 = [v5 currentStateIdentifier];
    int v7 = [v4 sleepEventWithIdentifier:v6 dueDate:v3];

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
  v10[2] = __56__HDSPWakeUpResultsNotificationManager_sleepEventIsDue___block_invoke;
  v10[3] = &unk_2645D9288;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [(HDSPWakeUpResultsNotificationManager *)self _withLock:v10];
}

void __56__HDSPWakeUpResultsNotificationManager_sleepEventIsDue___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) stateMachine];
  id v2 = [*(id *)(a1 + 40) identifier];
  [v3 stateWithIdentifierDidExpire:v2];
}

- (id)eventIdentifiers
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__HDSPWakeUpResultsNotificationManager_eventIdentifiers__block_invoke;
  block[3] = &unk_2645D90C0;
  block[4] = self;
  if (qword_26AB790E0 != -1) {
    dispatch_once(&qword_26AB790E0, block);
  }
  return (id)_MergedGlobals_16;
}

void __56__HDSPWakeUpResultsNotificationManager_eventIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__13;
  id v9 = __Block_byref_object_dispose__13;
  id v10 = (id)MEMORY[0x263EFFA68];
  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__HDSPWakeUpResultsNotificationManager_eventIdentifiers__block_invoke_2;
  v4[3] = &unk_2645D9630;
  v4[4] = v1;
  v4[5] = &v5;
  [v1 _withLock:v4];
  uint64_t v2 = [MEMORY[0x263EFFA08] setWithArray:v6[5]];
  id v3 = (void *)_MergedGlobals_16;
  _MergedGlobals_16 = v2;

  _Block_object_dispose(&v5, 8);
}

void __56__HDSPWakeUpResultsNotificationManager_eventIdentifiers__block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v2 = [v5 scheduledExpirationStateIdentifiers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSDate)currentDate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v3 = [WeakRetained currentDateProvider];
  id v4 = v3[2]();

  return (NSDate *)v4;
}

- (BOOL)isWakeUpResultsNotificationEnabled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v3 = [WeakRetained sleepScheduleModelManager];
  id v4 = [v3 sleepSettings];
  char v5 = [v4 wakeUpResults];

  return v5;
}

- (id)notificationAttemptWindowForWakeUpBeforeDate:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(HDSPWakeUpResultsNotificationManager *)self currentDate];
  id v6 = [v5 laterDate:v4];

  uint64_t v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543874;
    id v15 = (id)objc_opt_class();
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    id v19 = v4;
    id v8 = v15;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resolved attempt window beforeDate: %@ (passed: %@)", (uint8_t *)&v14, 0x20u);
  }
  id v9 = [(HDSPWakeUpResultsNotificationManager *)self _sleepScheduleModel];
  id v10 = [v9 previousEventWithIdentifier:*MEMORY[0x263F75C40] dueBeforeDate:v6];

  if (v10)
  {
    [(HDSPWakeUpResultsNotificationManager *)self _trackingDelayDuration];
    id v11 = objc_msgSend(v10, "dateByAddingTimeInterval:");
    v12 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v11 duration:14400.0];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (double)_trackingDelayDuration
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"WakeUpResultsNotificationDelayOverride"];

  double v4 = 900.0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v3;
      id v6 = HKSPLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138543618;
        id v11 = (id)objc_opt_class();
        __int16 v12 = 2114;
        id v13 = v5;
        id v9 = v11;
        _os_log_error_impl(&dword_221A52000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Overriding default notification delay to %{public}@s", (uint8_t *)&v10, 0x16u);
      }
      [v5 doubleValue];
      double v4 = v7;
    }
  }

  return v4;
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
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting to schedule tracking delay", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(HDSPWakeUpResultsNotificationManager *)self sleepEventDelegate];
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
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting to cancel tracking delay", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(HDSPWakeUpResultsNotificationManager *)self sleepEventDelegate];
  [v5 eventProviderCancelledEvents:self];
}

- (void)scheduleRetryAttempt
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = (id)objc_opt_class();
    id v4 = v10;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduling retry attempt", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v5 = [(HDSPWakeUpResultsNotificationManager *)self retryAttemptScheduler];
  int v6 = [(id)objc_opt_class() retryActivity];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__HDSPWakeUpResultsNotificationManager_scheduleRetryAttempt__block_invoke;
  v7[3] = &unk_2645D92B0;
  objc_copyWeak(&v8, (id *)buf);
  [v5 scheduleActivity:v6 activityHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __60__HDSPWakeUpResultsNotificationManager_scheduleRetryAttempt__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v6 = (id)objc_opt_class();
    id v3 = v6;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Attempting retry", buf, 0xCu);
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__HDSPWakeUpResultsNotificationManager_scheduleRetryAttempt__block_invoke_294;
  v4[3] = &unk_2645D90C0;
  v4[4] = WeakRetained;
  [WeakRetained _withLock:v4];
}

uint64_t __60__HDSPWakeUpResultsNotificationManager_scheduleRetryAttempt__block_invoke_294(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) retryAttemptEventDue];
}

- (void)unscheduleRetryAttempt
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unscheduling retry attempt", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(HDSPWakeUpResultsNotificationManager *)self retryAttemptScheduler];
  [v5 unscheduleActivities];
}

+ (id)retryCriteria
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x263EF81D8], *MEMORY[0x263EF81E0]);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8290]);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x263EF82A0], 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x263EF82B0], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x263EF82E8], 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x263EF8180], 1);

  return v2;
}

+ (id)retryActivity
{
  id v3 = [HDSPXPCActivity alloc];
  id v4 = [a1 retryCriteria];
  id v5 = [(HDSPXPCActivity *)v3 initWithEventName:@"com.apple.sleep.WakeUpResultsNotificationRetry.activity" options:0 criteria:v4];

  return v5;
}

- (void)startObservingProtectedHealthDataAvailability
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = (id)objc_opt_class();
    id v4 = v11;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Start observing protected data availability", (uint8_t *)&v10, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v6 = [WeakRetained notificationListener];
  uint64_t v7 = *MEMORY[0x263F09BB8];
  uint64_t v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  [v6 registerForLaunchNotificationWithName:v7 key:v9];
}

- (void)stopObservingProtectedHealthDataAvailability
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = (id)objc_opt_class();
    id v4 = v11;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stop observing protected data availability", (uint8_t *)&v10, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v6 = [WeakRetained notificationListener];
  uint64_t v7 = *MEMORY[0x263F09BB8];
  uint64_t v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  [v6 unregisterForLaunchNotificationWithName:v7 key:v9];
}

- (void)executeQuery
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  queryResultFuture = self->_queryResultFuture;
  if (queryResultFuture && ![(NAFuture *)queryResultFuture isFinished])
  {
    int v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = (id)objc_opt_class();
      id v7 = v9;
      _os_log_error_impl(&dword_221A52000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpected call to start query while already in progress", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    id v4 = HKSPLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = (id)objc_opt_class();
      id v5 = v9;
      _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting new query", (uint8_t *)&v8, 0xCu);
    }
    [(HDSPWakeUpResultsNotificationManager *)self _lock_startQuery];
  }
}

- (void)postResultsNotification
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v5 = v12;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Preparing daily results notification", buf, 0xCu);
  }
  if (([(NAFuture *)self->_queryResultFuture isFinished] & 1) == 0)
  {
    int v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"HDSPWakeUpResultsNotificationManager.m" lineNumber:358 description:@"_queryResultFuture must be finished before we can post notification"];
  }
  objc_initWeak((id *)buf, self);
  queryResultFuture = self->_queryResultFuture;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__HDSPWakeUpResultsNotificationManager_postResultsNotification__block_invoke;
  v9[3] = &unk_2645DA4A8;
  objc_copyWeak(&v10, (id *)buf);
  id v7 = (id)[(NAFuture *)queryResultFuture addSuccessBlock:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __63__HDSPWakeUpResultsNotificationManager_postResultsNotification__block_invoke(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x263EF8340];
  xpc_object_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v2);
  id v5 = [v3 buildNotification];

  if (v5)
  {
    int v6 = (void *)MEMORY[0x263F75E50];
    id v7 = [v5 identifier];
    int v8 = [WeakRetained currentDate];
    id v9 = [v5 userInfo];
    id v10 = [v6 sleepEventWithIdentifier:v7 dueDate:v8 context:v9];

    id v11 = objc_loadWeakRetained(WeakRetained + 1);
    id v12 = [v11 sleepScheduler];
    v14[0] = v10;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    [v12 notifyForOverdueEvents:v13];
  }
  [WeakRetained[4] didPostResultsNotification];
}

- (void)_lock_startQuery
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v43 = (id)objc_opt_class();
    id v4 = v43;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Begin _lock_startQuery...", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v6 = [WeakRetained healthStoreProvider];
  id v7 = [v6 healthStore];

  int v8 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
  id v9 = [(HDSPWakeUpResultsNotificationManager *)self currentDate];
  uint64_t v10 = objc_msgSend(v9, "hk_dayIndexWithCalendar:", v8);

  id v11 = (void *)HDSPWakeUpResultsNotificationDaySummaryCount;
  id v12 = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v13 = [v12 defaultCallbackScheduler];

  uint64_t v14 = HKSPLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v43 = v15;
    id v16 = v15;
    _os_log_impl(&dword_221A52000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating future dependencies...", buf, 0xCu);
  }
  uint64_t v17 = [(HDSPWakeUpResultsNotificationManager *)self _fetchUserFirstNameWithHealthStore:v7];
  __int16 v18 = (void *)(v10 - (void)v11 + 1);
  v41[0] = v17;
  id v19 = -[HDSPWakeUpResultsNotificationManager _fetchSleepDaySummariesForMorningIndexRange:healthStore:](self, "_fetchSleepDaySummariesForMorningIndexRange:healthStore:", v18, v11, v7);
  v41[1] = v19;
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];

  v21 = HKSPLogForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v43 = v22;
    id v23 = v22;
    _os_log_impl(&dword_221A52000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Combining dependency futures...", buf, 0xCu);
  }
  objc_initWeak(&location, self);
  uint64_t v24 = [MEMORY[0x263F58190] combineAllFutures:v20 ignoringErrors:1 scheduler:v13];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __56__HDSPWakeUpResultsNotificationManager__lock_startQuery__block_invoke;
  v38[3] = &unk_2645DA4D0;
  objc_copyWeak(v39, &location);
  v39[1] = v18;
  v39[2] = v11;
  uint64_t v25 = [v24 flatMap:v38];
  queryResultFuture = self->_queryResultFuture;
  self->_queryResultFuture = v25;

  v27 = self->_queryResultFuture;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __56__HDSPWakeUpResultsNotificationManager__lock_startQuery__block_invoke_309;
  v36[3] = &unk_2645DA4F8;
  objc_copyWeak(&v37, &location);
  id v28 = (id)[(NAFuture *)v27 addFailureBlock:v36];
  v29 = self->_queryResultFuture;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __56__HDSPWakeUpResultsNotificationManager__lock_startQuery__block_invoke_2;
  v34[3] = &unk_2645DA4A8;
  objc_copyWeak(&v35, &location);
  id v30 = (id)[(NAFuture *)v29 addSuccessBlock:v34];
  v31 = HKSPLogForCategory();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v43 = v32;
    id v33 = v32;
    _os_log_impl(&dword_221A52000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] End _lock_startQuery...", buf, 0xCu);
  }
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(v39);
  objc_destroyWeak(&location);
}

id __56__HDSPWakeUpResultsNotificationManager__lock_startQuery__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = (id)objc_opt_class();
    __int16 v21 = 2114;
    id v22 = v3;
    id v6 = v20;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Query dependencies completed with results: %{public}@", buf, 0x16u);
  }
  id v7 = [v3 objectAtIndexedSubscript:0];
  int v8 = [WeakRetained _userFirstNameFromResult:v7];

  id v9 = [v3 objectAtIndexedSubscript:1];
  id v18 = 0;
  uint64_t v10 = [WeakRetained _sleepDaySummariesFromResult:v9 error:&v18];
  id v11 = v18;

  if (v10)
  {
    id v12 = -[HDSPWakeUpResultsNotificationBuilder initWithDaySummaries:morningIndexRange:userFirstName:]([HDSPWakeUpResultsNotificationBuilder alloc], "initWithDaySummaries:morningIndexRange:userFirstName:", v10, *(void *)(a1 + 40), *(void *)(a1 + 48), v8);
    BOOL v13 = [(HDSPWakeUpResultsNotificationBuilder *)v12 hasSufficientSleepData];
    uint64_t v14 = (void *)MEMORY[0x263F58190];
    if (v13)
    {
      id v15 = [MEMORY[0x263F58190] futureWithResult:v12];
    }
    else
    {
      id v16 = objc_msgSend(MEMORY[0x263F087E8], "hdsp_insufficientSleepDataError");
      id v15 = [v14 futureWithError:v16];
    }
  }
  else
  {
    id v15 = [MEMORY[0x263F58190] futureWithError:v11];
  }

  return v15;
}

void __56__HDSPWakeUpResultsNotificationManager__lock_startQuery__block_invoke_309(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2114;
    id v13 = v3;
    id v7 = v11;
    _os_log_error_impl(&dword_221A52000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Query failed with error: %{public}@", buf, 0x16u);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__HDSPWakeUpResultsNotificationManager__lock_startQuery__block_invoke_310;
  v8[3] = &unk_2645D9288;
  v8[4] = WeakRetained;
  id v9 = v3;
  id v6 = v3;
  [WeakRetained _withLock:v8];
}

uint64_t __56__HDSPWakeUpResultsNotificationManager__lock_startQuery__block_invoke_310(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) queryDidFailWithError:*(void *)(a1 + 40)];
}

void __56__HDSPWakeUpResultsNotificationManager__lock_startQuery__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2114;
    id v11 = v3;
    id v6 = v9;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Query succeeded with result: %{public}@", buf, 0x16u);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__HDSPWakeUpResultsNotificationManager__lock_startQuery__block_invoke_312;
  v7[3] = &unk_2645D90C0;
  void v7[4] = WeakRetained;
  [WeakRetained _withLock:v7];
}

uint64_t __56__HDSPWakeUpResultsNotificationManager__lock_startQuery__block_invoke_312(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) queryDidComplete];
}

- (id)_fetchUserFirstNameWithHealthStore:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F58190]);
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __75__HDSPWakeUpResultsNotificationManager__fetchUserFirstNameWithHealthStore___block_invoke;
  v19[3] = &unk_2645DA4F8;
  objc_copyWeak(&v20, &location);
  id v6 = (id)[v5 addFailureBlock:v19];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __75__HDSPWakeUpResultsNotificationManager__fetchUserFirstNameWithHealthStore___block_invoke_313;
  v17[3] = &unk_2645DA520;
  objc_copyWeak(&v18, &location);
  id v7 = (id)[v5 addSuccessBlock:v17];
  int v8 = HKSPLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    uint64_t v23 = v9;
    id v10 = v9;
    _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetching user first name...", buf, 0xCu);
  }
  id v11 = [MEMORY[0x263F0A470] healthAppDefaultsDomainWithHealthStore:v4];
  uint64_t v12 = *MEMORY[0x263F0AE00];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75__HDSPWakeUpResultsNotificationManager__fetchUserFirstNameWithHealthStore___block_invoke_316;
  v15[3] = &unk_2645DA548;
  id v13 = v5;
  id v16 = v13;
  [v11 propertyListValueForKey:v12 completion:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v13;
}

void __75__HDSPWakeUpResultsNotificationManager__fetchUserFirstNameWithHealthStore___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v3;
    id v6 = v8;
    _os_log_error_impl(&dword_221A52000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch user's first name with error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

void __75__HDSPWakeUpResultsNotificationManager__fetchUserFirstNameWithHealthStore___block_invoke_313(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543619;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2113;
    id v10 = v3;
    id v6 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully fetched user's first name with result: %{private}@", (uint8_t *)&v7, 0x16u);
  }
}

void __75__HDSPWakeUpResultsNotificationManager__fetchUserFirstNameWithHealthStore___block_invoke_316(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "finishWithError:");
  }
  else
  {
    uint64_t v5 = [a2 valueForKey:*MEMORY[0x263F0ADF0]];
    id v6 = (void *)v5;
    if (v5) {
      int v7 = (__CFString *)v5;
    }
    else {
      int v7 = &stru_26D3FAEE0;
    }
    uint64_t v11 = v7;

    if ([(__CFString *)v11 length])
    {
      if (arc4random_uniform(0x64u)) {
        id v8 = &stru_26D3FAEE0;
      }
      else {
        id v8 = v11;
      }
      __int16 v9 = v8;

      id v10 = v9;
    }
    else
    {
      id v10 = v11;
    }
    uint64_t v12 = v10;
    [*(id *)(a1 + 32) finishWithResult:v10];
  }
}

- (id)_fetchSleepDaySummariesForMorningIndexRange:(id)a3 healthStore:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F58190]);
  objc_initWeak(&location, self);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __96__HDSPWakeUpResultsNotificationManager__fetchSleepDaySummariesForMorningIndexRange_healthStore___block_invoke;
  v27[3] = &unk_2645DA4F8;
  objc_copyWeak(&v28, &location);
  id v9 = (id)[v8 addFailureBlock:v27];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __96__HDSPWakeUpResultsNotificationManager__fetchSleepDaySummariesForMorningIndexRange_healthStore___block_invoke_321;
  v25[3] = &unk_2645DA570;
  objc_copyWeak(&v26, &location);
  id v10 = (id)[v8 addSuccessBlock:v25];
  id v11 = objc_alloc(MEMORY[0x263F0A778]);
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  id v22 = __96__HDSPWakeUpResultsNotificationManager__fetchSleepDaySummariesForMorningIndexRange_healthStore___block_invoke_324;
  uint64_t v23 = &unk_2645DA598;
  id v12 = v8;
  id v24 = v12;
  id v13 = objc_msgSend(v11, "initWithMorningIndexRange:ascending:limit:options:resultsHandler:", var0, var1, 1, 0, 1, &v20);
  objc_msgSend(v13, "setDebugIdentifier:", @"WakeUpResults", v20, v21, v22, v23);
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F0A770]) initWithIdentifier:@"WakeUpResults" mode:0];
  [v13 setCacheSettings:v14];

  id v15 = HKSPLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v31 = v16;
    id v17 = v16;
    _os_log_impl(&dword_221A52000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetching sleep day summaries...", buf, 0xCu);
  }
  [v7 executeQuery:v13];
  id v18 = v12;

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

  return v18;
}

void __96__HDSPWakeUpResultsNotificationManager__fetchSleepDaySummariesForMorningIndexRange_healthStore___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v3;
    id v6 = v8;
    _os_log_error_impl(&dword_221A52000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch sleep day summaries with error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

void __96__HDSPWakeUpResultsNotificationManager__fetchSleepDaySummariesForMorningIndexRange_healthStore___block_invoke_321(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v3;
    id v6 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully fetched sleep day summaries with result: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

uint64_t __96__HDSPWakeUpResultsNotificationManager__fetchSleepDaySummariesForMorningIndexRange_healthStore___block_invoke_324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v4, "finishWithResult:");
  }
  else {
    return [v4 finishWithError:a4];
  }
}

- (id)_userFirstNameFromResult:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_sleepDaySummariesFromResult:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = v5;
  id v8 = v7;
  __int16 v9 = v7;
  if ((isKindOfClass & 1) == 0)
  {
    if (v7)
    {
      if (a4) {
        *a4 = v7;
      }
      else {
        _HKLogDroppedError();
      }
    }

    __int16 v9 = 0;
  }

  return v9;
}

- (id)_currentState
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__13;
  __int16 v9 = __Block_byref_object_dispose__13;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__HDSPWakeUpResultsNotificationManager__currentState__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  void v4[5] = &v5;
  [(HDSPWakeUpResultsNotificationManager *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __53__HDSPWakeUpResultsNotificationManager__currentState__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) currentState];

  return MEMORY[0x270F9A758]();
}

- (BOOL)_isDelayingForTracking
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__HDSPWakeUpResultsNotificationManager__isDelayingForTracking__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  void v4[5] = &v5;
  [(HDSPWakeUpResultsNotificationManager *)self _withLock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __62__HDSPWakeUpResultsNotificationManager__isDelayingForTracking__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) isDelayingForTracking];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_isWaitingForWakeUp
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__HDSPWakeUpResultsNotificationManager__isWaitingForWakeUp__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  void v4[5] = &v5;
  [(HDSPWakeUpResultsNotificationManager *)self _withLock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __59__HDSPWakeUpResultsNotificationManager__isWaitingForWakeUp__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) isWaitingForWakeUp];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)diagnosticDescription
{
  char v2 = NSString;
  id v3 = [(HDSPWakeUpResultsNotificationManager *)self _currentState];
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

- (HDSPWakeUpResultsNotificationStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (NAFuture)queryResultFuture
{
  return self->_queryResultFuture;
}

- (HKSHSleepMetricsEngine)sleepMetricsEngine
{
  return self->_sleepMetricsEngine;
}

- (HDSPActivityScheduler)retryAttemptScheduler
{
  return self->_retryAttemptScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryAttemptScheduler, 0);
  objc_storeStrong((id *)&self->_sleepMetricsEngine, 0);
  objc_storeStrong((id *)&self->_queryResultFuture, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_destroyWeak((id *)&self->_sleepEventDelegate);

  objc_destroyWeak((id *)&self->_environment);
}

@end
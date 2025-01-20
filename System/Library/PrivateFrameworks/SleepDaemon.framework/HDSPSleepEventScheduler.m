@interface HDSPSleepEventScheduler
- (BOOL)_lock_shouldScheduleEvents;
- (BOOL)_shouldNotifyHandler:(id)a3 forEvent:(id)a4;
- (HDSPEnvironment)environment;
- (HDSPEventScheduler)scheduler;
- (HDSPSleepEventList)sleepEvents;
- (HDSPSleepEventScheduler)initWithEnvironment:(id)a3;
- (HDSPSleepEventScheduler)initWithEnvironment:(id)a3 schedulerProvider:(id)a4 limitingScheduler:(id)a5;
- (HKSPLimitingScheduler)limitingScheduler;
- (HKSPMutexProvider)mutexProvider;
- (HKSPObserverSet)eventHandlers;
- (HKSPSleepEvent)lastStandardSleepEvent;
- (NSDate)lastEventTriggerDate;
- (NSHashTable)eventProviders;
- (NSHashTable)pendingEventProviders;
- (id)_allSleepEvents;
- (id)diagnosticDescription;
- (void)_enqueueHandleOverdueEventsTask;
- (void)_enqueueSchedulePendingEventsTask;
- (void)_handleOverdueEvents;
- (void)_loadLastStandardSleepEvent;
- (void)_lock_rescheduleEvents;
- (void)_lock_updateLastStandardSleepEvent:(id)a3;
- (void)_schedulePendingEvents;
- (void)_withLock:(id)a3;
- (void)addEventHandler:(id)a3;
- (void)addEventProvider:(id)a3;
- (void)environmentDidBecomeReady:(id)a3;
- (void)environmentWillBecomeReady:(id)a3;
- (void)eventProviderCancelledEvents:(id)a3;
- (void)eventProviderHasUpcomingEvents:(id)a3;
- (void)notifyForOverdueEvents:(id)a3;
- (void)removeEventHandler:(id)a3;
- (void)removeEventProvider:(id)a3;
- (void)rescheduleEvents;
- (void)scheduledEventIsDue;
- (void)setLastEventTriggerDate:(id)a3;
- (void)setLastStandardSleepEvent:(id)a3;
- (void)significantTimeChangeDetected:(id)a3;
- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4;
@end

@implementation HDSPSleepEventScheduler

- (HDSPSleepEventScheduler)initWithEnvironment:(id)a3
{
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__HDSPSleepEventScheduler_initWithEnvironment___block_invoke;
  v11[3] = &unk_2645DA6A8;
  v12 = self;
  v4 = (objc_class *)MEMORY[0x263F75DF0];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [MEMORY[0x263F581B8] serialDispatchQueueSchedulerWithName:@"com.apple.sleep.HDSPSleepEventScheduler"];
  v8 = (void *)[v6 initWithScheduler:v7];
  v9 = [(HDSPSleepEventScheduler *)v12 initWithEnvironment:v5 schedulerProvider:v11 limitingScheduler:v8];

  return v9;
}

HDSPXPCAlarmScheduler *__47__HDSPSleepEventScheduler_initWithEnvironment___block_invoke(uint64_t a1)
{
  v2 = [HDSPXPCAlarmScheduler alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v4 = [WeakRetained currentDateProvider];
  id v5 = [(HDSPXPCAlarmScheduler *)v2 initWithCurrentDateProvider:v4];

  return v5;
}

- (HDSPSleepEventScheduler)initWithEnvironment:(id)a3 schedulerProvider:(id)a4 limitingScheduler:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (void (**)(id, id))a4;
  id v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)HDSPSleepEventScheduler;
  v11 = [(HDSPSleepEventScheduler *)&v32 init];
  if (v11)
  {
    v12 = HKSPLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v34 = v13;
      __int16 v35 = 2048;
      v36 = v11;
      id v14 = v13;
      _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);
    }
    objc_storeWeak((id *)&v11->_environment, v8);
    v15 = [v8 mutexGenerator];
    uint64_t v16 = v15[2]();
    mutexProvider = v11->_mutexProvider;
    v11->_mutexProvider = (HKSPMutexProvider *)v16;

    v18 = objc_alloc_init(HDSPSleepEventList);
    sleepEvents = v11->_sleepEvents;
    v11->_sleepEvents = v18;

    id v20 = objc_alloc(MEMORY[0x263F75E20]);
    v21 = [v8 defaultCallbackScheduler];
    uint64_t v22 = [v20 initWithCallbackScheduler:v21];
    eventHandlers = v11->_eventHandlers;
    v11->_eventHandlers = (HKSPObserverSet *)v22;

    uint64_t v24 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    eventProviders = v11->_eventProviders;
    v11->_eventProviders = (NSHashTable *)v24;

    uint64_t v26 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    pendingEventProviders = v11->_pendingEventProviders;
    v11->_pendingEventProviders = (NSHashTable *)v26;

    if (v9)
    {
      uint64_t v28 = v9[2](v9, v8);
      scheduler = v11->_scheduler;
      v11->_scheduler = (HDSPEventScheduler *)v28;
    }
    else
    {
      scheduler = v11->_scheduler;
      v11->_scheduler = 0;
    }

    [(HDSPEventScheduler *)v11->_scheduler setDelegate:v11];
    objc_storeStrong((id *)&v11->_limitingScheduler, a5);
    v30 = v11;
  }

  return v11;
}

- (void)_withLock:(id)a3
{
}

- (void)rescheduleEvents
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] rescheduleEvents", buf, 0xCu);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__HDSPSleepEventScheduler_rescheduleEvents__block_invoke;
  v5[3] = &unk_2645D90C0;
  v5[4] = self;
  [(HDSPSleepEventScheduler *)self _withLock:v5];
}

uint64_t __43__HDSPSleepEventScheduler_rescheduleEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_rescheduleEvents");
}

- (void)_lock_rescheduleEvents
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HDSPSleepEventScheduler *)self _lock_shouldScheduleEvents];
  id v4 = HKSPLogForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138543362;
      id v14 = (id)objc_opt_class();
      id v6 = v14;
      _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] rescheduling events", buf, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    uint64_t v8 = [WeakRetained assertionManager];
    [v8 takeAssertionWithIdentifier:@"HDSPRescheduleTransaction" type:1];

    v9 = [WeakRetained assertionManager];
    [v9 takeAssertionWithIdentifier:@"HDSPRescheduleAssertion" type:2];

    id v10 = [(NSHashTable *)self->_eventProviders allObjects];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __49__HDSPSleepEventScheduler__lock_rescheduleEvents__block_invoke;
    v12[3] = &unk_2645DA6D0;
    v12[4] = self;
    objc_msgSend(v10, "na_each:", v12);
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 138543362;
      id v14 = (id)objc_opt_class();
      id v11 = v14;
      _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] unscheduling events", buf, 0xCu);
    }
    [(HDSPSleepEventList *)self->_sleepEvents removeAllEvents];
    [(NSHashTable *)self->_pendingEventProviders removeAllObjects];
    [(HDSPEventScheduler *)self->_scheduler unschedule];
  }
  [(HDSPSleepEventScheduler *)self _enqueueSchedulePendingEventsTask];
}

uint64_t __49__HDSPSleepEventScheduler__lock_rescheduleEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) addObject:a2];
}

- (void)_enqueueSchedulePendingEventsTask
{
  limitingScheduler = self->_limitingScheduler;
  id v4 = objc_alloc(MEMORY[0x263F75EB8]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__HDSPSleepEventScheduler__enqueueSchedulePendingEventsTask__block_invoke;
  v6[3] = &unk_2645D90C0;
  v6[4] = self;
  BOOL v5 = (void *)[v4 initWithIdentifier:@"schedulePendingEvents" block:v6 delay:0.1];
  [(HKSPLimitingScheduler *)limitingScheduler scheduleTask:v5];
}

uint64_t __60__HDSPSleepEventScheduler__enqueueSchedulePendingEventsTask__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _schedulePendingEvents];
}

- (BOOL)_lock_shouldScheduleEvents
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  p_environment = &self->_environment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v4 = [WeakRetained sleepScheduleModelManager];
  BOOL v5 = [v4 sleepSchedule];

  if (([v5 isEnabled] & 1) == 0)
  {
    id v11 = HKSPLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = (id)objc_opt_class();
      id v13 = v18;
      _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule disabled, not scheduling", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_11;
  }
  id v6 = objc_loadWeakRetained((id *)p_environment);
  id v7 = [v6 behavior];
  int v8 = [v7 isAppleWatch];

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_environment);
    id v10 = [v9 sleepScheduleModelManager];
    id v11 = [v10 sleepSettings];

    if ([v11 watchSleepFeaturesEnabled])
    {

      goto LABEL_5;
    }
    id v14 = HKSPLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = (id)objc_opt_class();
      id v15 = v18;
      _os_log_impl(&dword_221A52000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep features disabled for this watch, not scheduling", (uint8_t *)&v17, 0xCu);
    }
LABEL_11:

    BOOL v12 = 0;
    goto LABEL_12;
  }
LABEL_5:
  BOOL v12 = 1;
LABEL_12:

  return v12;
}

- (void)environmentWillBecomeReady:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentWillBecomeReady", (uint8_t *)&v11, 0xCu);
  }
  id v7 = [v4 sleepScheduleModelManager];
  [v7 addObserver:self];

  int v8 = [v4 timeChangeListener];
  [v8 addObserver:self];

  id v9 = [v4 diagnostics];
  [v9 addProvider:self];

  if ([(HDSPEventScheduler *)self->_scheduler conformsToProtocol:&unk_26D411EE8])
  {
    id v10 = [v4 notificationListener];
    [v10 addObserver:self->_scheduler];
  }
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
  [(HDSPSleepEventScheduler *)self _loadLastStandardSleepEvent];
  [(HDSPSleepEventScheduler *)self rescheduleEvents];
}

- (void)_loadLastStandardSleepEvent
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __54__HDSPSleepEventScheduler__loadLastStandardSleepEvent__block_invoke;
  v2[3] = &unk_2645D90C0;
  v2[4] = self;
  [(HDSPSleepEventScheduler *)self _withLock:v2];
}

void __54__HDSPSleepEventScheduler__loadLastStandardSleepEvent__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  BOOL v3 = [WeakRetained userDefaults];
  id v4 = objc_msgSend(v3, "hksp_objectForKey:", @"HDSPLastStandardSleepEvent");

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F75DD0]);
    int v6 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    id v7 = (void *)[v5 initWithAllowedClasses:v6 serializedDictionary:v4];

    id v15 = 0;
    uint64_t v8 = [v7 deserializeObjectOfClass:objc_opt_class() error:&v15];
    id v9 = v15;
    if (v9)
    {
      id v10 = HKSPLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        int v17 = v11;
        __int16 v18 = 2114;
        uint64_t v19 = v4;
        __int16 v20 = 2114;
        id v21 = v9;
        id v12 = v11;
        _os_log_error_impl(&dword_221A52000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] failed to deserialize sleep event %{public}@ with error %{public}@", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 32);
      id v14 = v8;
      id v10 = *(NSObject **)(v13 + 16);
      *(void *)(v13 + 16) = v14;
    }
  }
}

- (void)_lock_updateLastStandardSleepEvent:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    id v9 = [v5 identifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v7;
    __int16 v20 = 2114;
    id v21 = v9;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating last standard sleep event: %{public}@", buf, 0x16u);
  }
  objc_storeStrong((id *)&self->_lastStandardSleepEvent, a3);
  id v10 = objc_alloc_init(MEMORY[0x263F75DD8]);
  id v17 = 0;
  int v11 = [v10 serialize:v5 error:&v17];
  id v12 = v17;
  if (v11)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    id v14 = [WeakRetained userDefaults];
    id v15 = [v10 serializedDictionary];
    objc_msgSend(v14, "hksp_setObject:forKey:", v15, @"HDSPLastStandardSleepEvent");
  }
  else
  {
    id WeakRetained = HKSPLogForCategory();
    if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v16 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = v16;
    __int16 v20 = 2114;
    id v21 = v5;
    __int16 v22 = 2114;
    id v23 = v12;
    id v14 = v16;
    _os_log_error_impl(&dword_221A52000, WeakRetained, OS_LOG_TYPE_ERROR, "[%{public}@] failed to serialize sleep event %{public}@ with error %{public}@", buf, 0x20u);
  }

LABEL_7:
}

- (void)_schedulePendingEvents
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  BOOL v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v4 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] gathering pending events", (uint8_t *)&buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v6 = [WeakRetained currentDateProvider];

  if (v6) {
    v6[2](v6);
  }
  else {
  id v7 = [MEMORY[0x263EFF910] date];
  }
  id v8 = [(HDSPSleepEventScheduler *)self lastEventTriggerDate];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x263EFF910] distantPast];
  }
  int v11 = v10;

  id v12 = [v7 dateByAddingTimeInterval:-*MEMORY[0x263F75CC0]];
  uint64_t v13 = [v11 laterDate:v12];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  __int16 v18 = __49__HDSPSleepEventScheduler__schedulePendingEvents__block_invoke;
  uint64_t v19 = &unk_2645DA748;
  __int16 v20 = self;
  id v14 = v13;
  id v21 = v14;
  id v15 = v7;
  id v22 = v15;
  p_long long buf = &buf;
  [(HDSPSleepEventScheduler *)self _withLock:&v16];
  if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
    [(HDSPSleepEventScheduler *)self _enqueueHandleOverdueEventsTask];
  }

  _Block_object_dispose(&buf, 8);
}

void __49__HDSPSleepEventScheduler__schedulePendingEvents__block_invoke(void *a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if ((HKSPIsUnitTesting() & 1) == 0)
  {
    v2 = HKSPLogForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v3 = objc_opt_class();
      id v4 = (void *)a1[5];
      uint64_t v5 = *(void *)(a1[4] + 56);
      *(_DWORD *)long long buf = 138543874;
      __int16 v35 = v3;
      __int16 v36 = 2114;
      uint64_t v37 = v4;
      __int16 v38 = 2114;
      uint64_t v39 = v5;
      id v6 = v3;
      _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] looking for events due after: %{public}@ from: %{public}@", buf, 0x20u);
    }
  }
  id v7 = [*(id *)(a1[4] + 56) allObjects];
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  v30 = __49__HDSPSleepEventScheduler__schedulePendingEvents__block_invoke_356;
  v31 = &unk_2645DA720;
  id v8 = (void *)a1[5];
  uint64_t v32 = a1[4];
  id v33 = v8;
  objc_msgSend(v7, "na_each:", &v28);

  objc_msgSend(*(id *)(a1[4] + 56), "removeAllObjects", v28, v29, v30, v31, v32);
  if ((HKSPIsUnitTesting() & 1) == 0)
  {
    id v9 = HKSPLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_opt_class();
      int v11 = *(void **)(a1[4] + 32);
      *(_DWORD *)long long buf = 138543618;
      __int16 v35 = v10;
      __int16 v36 = 2114;
      uint64_t v37 = v11;
      id v12 = v10;
      _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] all upcoming events: %{public}@", buf, 0x16u);
    }
  }
  uint64_t v13 = [*(id *)(a1[4] + 32) nextEvent];
  if (v13)
  {
    if ((HKSPIsUnitTesting() & 1) == 0)
    {
      id v14 = HKSPLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = objc_opt_class();
        *(_DWORD *)long long buf = 138543618;
        __int16 v35 = v15;
        __int16 v36 = 2114;
        uint64_t v37 = v13;
        id v16 = v15;
        _os_log_impl(&dword_221A52000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] next event is %{public}@", buf, 0x16u);
      }
    }
    uint64_t v17 = [v13 dueDate];
    if ([v17 hksp_isAfterDate:a1[6]])
    {
      __int16 v18 = *(void **)(a1[4] + 64);
      uint64_t v19 = [v13 dueDate];
      objc_msgSend(v18, "scheduleEventForDate:options:", v19, objc_msgSend(v13, "isUserVisible"));
    }
    else
    {
      id v22 = HKSPLogForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = objc_opt_class();
        *(_DWORD *)long long buf = 138543362;
        __int16 v35 = v23;
        id v24 = v23;
        _os_log_impl(&dword_221A52000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] event is already due", buf, 0xCu);
      }
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    }
  }
  else
  {
    uint64_t v17 = HKSPLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = objc_opt_class();
      *(_DWORD *)long long buf = 138543362;
      __int16 v35 = v20;
      id v21 = v20;
      _os_log_impl(&dword_221A52000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] no upcoming events", buf, 0xCu);
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  char v26 = [WeakRetained assertionManager];
  [v26 releaseAssertionWithIdentifier:@"HDSPRescheduleAssertion"];

  uint64_t v27 = [WeakRetained assertionManager];
  [v27 releaseAssertionWithIdentifier:@"HDSPRescheduleTransaction"];
}

void __49__HDSPSleepEventScheduler__schedulePendingEvents__block_invoke_356(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 32) removeEventsForProvider:v3];
  id v4 = [v3 upcomingEventsDueAfterDate:*(void *)(a1 + 40)];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __49__HDSPSleepEventScheduler__schedulePendingEvents__block_invoke_2;
  v14[3] = &unk_2645DA6F8;
  id v15 = *(id *)(a1 + 40);
  uint64_t v5 = objc_msgSend(v4, "na_filter:", v14);

  uint64_t v6 = [v5 count];
  char v7 = HKSPIsUnitTesting();
  if (v6)
  {
    if ((v7 & 1) == 0)
    {
      id v8 = HKSPLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = objc_opt_class();
        *(_DWORD *)long long buf = 138543874;
        uint64_t v17 = v9;
        __int16 v18 = 2114;
        id v19 = v3;
        __int16 v20 = 2114;
        id v21 = v5;
        id v10 = v9;
        _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ has upcoming events: %{public}@", buf, 0x20u);
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 32) addEvents:v5 provider:v3];
  }
  else if ((v7 & 1) == 0)
  {
    int v11 = HKSPLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = objc_opt_class();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v17 = v12;
      __int16 v18 = 2114;
      id v19 = v3;
      id v13 = v12;
      _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ has no upcoming events", buf, 0x16u);
    }
  }
}

uint64_t __49__HDSPSleepEventScheduler__schedulePendingEvents__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 dueDate];
  uint64_t v4 = objc_msgSend(v3, "hksp_isAfterDate:", *(void *)(a1 + 32));

  return v4;
}

- (NSDate)lastEventTriggerDate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v3 = [WeakRetained userDefaults];
  uint64_t v4 = objc_msgSend(v3, "hksp_objectForKey:", @"HDSPLastEventTriggerDate");

  return (NSDate *)v4;
}

- (void)setLastEventTriggerDate:(id)a3
{
  p_environment = &self->_environment;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_environment);
  uint64_t v5 = [WeakRetained userDefaults];
  objc_msgSend(v5, "hksp_setObject:forKey:", v4, @"HDSPLastEventTriggerDate");
}

- (HKSPSleepEvent)lastStandardSleepEvent
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__14;
  id v9 = __Block_byref_object_dispose__14;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__HDSPSleepEventScheduler_lastStandardSleepEvent__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPSleepEventScheduler *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (HKSPSleepEvent *)v2;
}

void __49__HDSPSleepEventScheduler_lastStandardSleepEvent__block_invoke(uint64_t a1)
{
}

- (void)scheduledEventIsDue
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] scheduledEventIsDue", (uint8_t *)&v5, 0xCu);
  }
  [(HDSPSleepEventScheduler *)self _enqueueHandleOverdueEventsTask];
}

- (void)_enqueueHandleOverdueEventsTask
{
  limitingScheduler = self->_limitingScheduler;
  id v4 = objc_alloc(MEMORY[0x263F75EB8]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__HDSPSleepEventScheduler__enqueueHandleOverdueEventsTask__block_invoke;
  v6[3] = &unk_2645D90C0;
  v6[4] = self;
  int v5 = (void *)[v4 initWithIdentifier:@"handleOverdueEvents" block:v6];
  [(HKSPLimitingScheduler *)limitingScheduler scheduleTask:v5];
}

uint64_t __58__HDSPSleepEventScheduler__enqueueHandleOverdueEventsTask__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleOverdueEvents];
}

- (void)_handleOverdueEvents
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v17 = (id)objc_opt_class();
    id v4 = v17;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] handling overdue events", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v6 = [WeakRetained currentDateProvider];
  uint64_t v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
  else {
  id v8 = [MEMORY[0x263EFF910] date];
  }
  [(HDSPSleepEventScheduler *)self setLastEventTriggerDate:v8];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __47__HDSPSleepEventScheduler__handleOverdueEvents__block_invoke;
  id v13 = &unk_2645D9288;
  id v14 = self;
  id v15 = v8;
  id v9 = v8;
  [(HDSPSleepEventScheduler *)self _withLock:&v10];
  [(HDSPSleepEventScheduler *)self rescheduleEvents];
}

void __47__HDSPSleepEventScheduler__handleOverdueEvents__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) overdueEventsForDate:*(void *)(a1 + 40)];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__HDSPSleepEventScheduler__handleOverdueEvents__block_invoke_2;
  v6[3] = &unk_2645DA6F8;
  id v7 = *(id *)(a1 + 40);
  id v3 = objc_msgSend(v2, "na_filter:", v6);

  [*(id *)(*(void *)(a1 + 32) + 32) removeEvents:v3];
  id v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_16);
  int v5 = [v4 lastObject];

  if (v5) {
    objc_msgSend(*(id *)(a1 + 32), "_lock_updateLastStandardSleepEvent:", v5);
  }
  [*(id *)(a1 + 32) notifyForOverdueEvents:v3];
}

uint64_t __47__HDSPSleepEventScheduler__handleOverdueEvents__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isExpired:*(void *)(a1 + 32)] ^ 1;
}

uint64_t __47__HDSPSleepEventScheduler__handleOverdueEvents__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F75E50];
  id v3 = a2;
  id v4 = [v2 standardEventIdentifiers];
  int v5 = [v3 identifier];

  uint64_t v6 = [v4 containsObject:v5];
  return v6;
}

- (void)notifyForOverdueEvents:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v17 = (id)objc_opt_class();
    __int16 v18 = 2114;
    id v19 = v4;
    id v6 = v17;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] overdue events: %{public}@", buf, 0x16u);
  }
  if ([v4 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    id v8 = [WeakRetained assertionManager];
    [v8 takeAssertionWithIdentifier:@"HDSPNotifyDueAssertion" type:2];

    eventHandlers = self->_eventHandlers;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __50__HDSPSleepEventScheduler_notifyForOverdueEvents___block_invoke;
    v13[3] = &unk_2645DA7B8;
    id v14 = v4;
    id v15 = self;
    uint64_t v10 = [(HKSPObserverSet *)eventHandlers enumerateObserversWithFutureBlock:v13];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __50__HDSPSleepEventScheduler_notifyForOverdueEvents___block_invoke_364;
    v12[3] = &unk_2645D97E8;
    v12[4] = self;
    id v11 = (id)[v10 addCompletionBlock:v12];
  }
}

id __50__HDSPSleepEventScheduler_notifyForOverdueEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __50__HDSPSleepEventScheduler_notifyForOverdueEvents___block_invoke_2;
  id v11 = &unk_2645DA790;
  id v4 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = v3;
  id v5 = v3;
  objc_msgSend(v4, "na_each:", &v8);
  id v6 = objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", v8, v9, v10, v11, v12);

  return v6;
}

void __50__HDSPSleepEventScheduler_notifyForOverdueEvents___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([*(id *)(a1 + 32) _shouldNotifyHandler:*(void *)(a1 + 40) forEvent:v3])
  {
    id v4 = HKSPLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_opt_class();
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 138543874;
      uint64_t v9 = v5;
      __int16 v10 = 2114;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      id v13 = v3;
      id v7 = v5;
      _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying %{public}@ for %{public}@", (uint8_t *)&v8, 0x20u);
    }
    [*(id *)(a1 + 40) sleepEventIsDue:v3];
  }
}

void __50__HDSPSleepEventScheduler_notifyForOverdueEvents___block_invoke_364(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v1 = [WeakRetained assertionManager];
  [v1 releaseAssertionWithIdentifier:@"HDSPNotifyDueAssertion"];
}

- (BOOL)_shouldNotifyHandler:(id)a3 forEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v5 eventIdentifiers], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    int v8 = [v5 eventIdentifiers];
    uint64_t v9 = [v6 identifier];
    char v10 = [v8 containsObject:v9];
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (void)eventProviderHasUpcomingEvents:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v6 = [WeakRetained defaultCallbackScheduler];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__HDSPSleepEventScheduler_eventProviderHasUpcomingEvents___block_invoke;
  v8[3] = &unk_2645D9288;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 performBlock:v8];
}

void __58__HDSPSleepEventScheduler_eventProviderHasUpcomingEvents___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v14 = v3;
    __int16 v15 = 2114;
    uint64_t v16 = v4;
    id v5 = v3;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] eventProviderHasUpcomingEvents: %{public}@", buf, 0x16u);
  }
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __58__HDSPSleepEventScheduler_eventProviderHasUpcomingEvents___block_invoke_368;
  char v10 = &unk_2645D9288;
  uint64_t v11 = v6;
  id v12 = *(id *)(a1 + 40);
  [v6 _withLock:&v7];
  objc_msgSend(*(id *)(a1 + 32), "_enqueueSchedulePendingEventsTask", v7, v8, v9, v10, v11);
}

uint64_t __58__HDSPSleepEventScheduler_eventProviderHasUpcomingEvents___block_invoke_368(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) addObject:*(void *)(a1 + 40)];
}

- (void)eventProviderCancelledEvents:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v6 = [WeakRetained defaultCallbackScheduler];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__HDSPSleepEventScheduler_eventProviderCancelledEvents___block_invoke;
  v8[3] = &unk_2645D9288;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 performBlock:v8];
}

void __56__HDSPSleepEventScheduler_eventProviderCancelledEvents___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138543618;
    char v10 = v3;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    id v5 = v3;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] eventProviderCancelledEvents: %{public}@", buf, 0x16u);
  }
  id v6 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__HDSPSleepEventScheduler_eventProviderCancelledEvents___block_invoke_369;
  v7[3] = &unk_2645D9288;
  v7[4] = v6;
  id v8 = *(id *)(a1 + 40);
  [v6 _withLock:v7];
}

uint64_t __56__HDSPSleepEventScheduler_eventProviderCancelledEvents___block_invoke_369(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 32);

  return [v3 removeEventsForProvider:v2];
}

- (void)addEventProvider:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    if (objc_opt_respondsToSelector())
    {
      [v4 setSleepEventDelegate:self];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __44__HDSPSleepEventScheduler_addEventProvider___block_invoke;
      v7[3] = &unk_2645D9288;
      v7[4] = self;
      id v8 = v4;
      [(HDSPSleepEventScheduler *)self _withLock:v7];
    }
    else
    {
      id v5 = HKSPLogForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        id v10 = (id)objc_opt_class();
        __int16 v11 = 2114;
        id v12 = v4;
        id v6 = v10;
        _os_log_error_impl(&dword_221A52000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] event provider %{public}@ didn't synthesize a delegate", buf, 0x16u);
      }
    }
  }
}

uint64_t __44__HDSPSleepEventScheduler_addEventProvider___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
}

- (void)removeEventProvider:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v4 setSleepEventDelegate:0];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __47__HDSPSleepEventScheduler_removeEventProvider___block_invoke;
    v5[3] = &unk_2645D9288;
    v5[4] = self;
    id v6 = v4;
    [(HDSPSleepEventScheduler *)self _withLock:v5];
  }
}

uint64_t __47__HDSPSleepEventScheduler_removeEventProvider___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) removeEventsForProvider:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 56);

  return [v3 removeObject:v2];
}

- (void)addEventHandler:(id)a3
{
  if (a3) {
    -[HKSPObserverSet addObserver:](self->_eventHandlers, "addObserver:");
  }
}

- (void)removeEventHandler:(id)a3
{
  if (a3) {
    -[HKSPObserverSet removeObserver:](self->_eventHandlers, "removeObserver:");
  }
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
  [(HDSPSleepEventScheduler *)self rescheduleEvents];
}

- (void)significantTimeChangeDetected:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v14 = 138543362;
    *(void *)&void v14[4] = objc_opt_class();
    id v5 = *(id *)&v14[4];
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] significantTimeChangeDetected", v14, 0xCu);
  }
  id v6 = [(HDSPSleepEventScheduler *)self environment];
  id v7 = [v6 currentDateProvider];
  id v9 = v7[2](v7, v8);

  __int16 v10 = [(HDSPSleepEventScheduler *)self lastEventTriggerDate];
  LODWORD(v7) = objc_msgSend(v10, "hksp_isAfterDate:", v9);

  if (v7)
  {
    id v11 = HKSPLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      *(_DWORD *)uint64_t v14 = 138543362;
      *(void *)&void v14[4] = v12;
      id v13 = v12;
      _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] setting lastEventTriggerDate to current date because it's in the future", v14, 0xCu);
    }
    [(HDSPSleepEventScheduler *)self setLastEventTriggerDate:v9];
  }
  [(HDSPSleepEventScheduler *)self rescheduleEvents];
}

- (id)_allSleepEvents
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__14;
  id v9 = __Block_byref_object_dispose__14;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__HDSPSleepEventScheduler__allSleepEvents__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPSleepEventScheduler *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __42__HDSPSleepEventScheduler__allSleepEvents__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) sleepEvents];
  uint64_t v2 = [v5 allEvents];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)diagnosticDescription
{
  uint64_t v3 = NSString;
  id v4 = [(HDSPSleepEventScheduler *)self _allSleepEvents];
  id v5 = [(HDSPSleepEventScheduler *)self lastStandardSleepEvent];
  id v6 = [v5 identifier];
  uint64_t v7 = [v3 stringWithFormat:@"Scheduled Events: %@, Last Standard Sleep Event: %@", v4, v6];

  return v7;
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (void)setLastStandardSleepEvent:(id)a3
{
}

- (HKSPMutexProvider)mutexProvider
{
  return self->_mutexProvider;
}

- (HDSPSleepEventList)sleepEvents
{
  return self->_sleepEvents;
}

- (HKSPObserverSet)eventHandlers
{
  return self->_eventHandlers;
}

- (NSHashTable)eventProviders
{
  return self->_eventProviders;
}

- (NSHashTable)pendingEventProviders
{
  return self->_pendingEventProviders;
}

- (HDSPEventScheduler)scheduler
{
  return self->_scheduler;
}

- (HKSPLimitingScheduler)limitingScheduler
{
  return self->_limitingScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitingScheduler, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_pendingEventProviders, 0);
  objc_storeStrong((id *)&self->_eventProviders, 0);
  objc_storeStrong((id *)&self->_eventHandlers, 0);
  objc_storeStrong((id *)&self->_sleepEvents, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_storeStrong((id *)&self->_lastStandardSleepEvent, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end
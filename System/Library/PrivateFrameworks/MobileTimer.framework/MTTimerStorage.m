@interface MTTimerStorage
+ (id)_diagnosticDictionaryForTimer:(id)a3;
- (BOOL)_queue_hasMatchingTimer:(id)a3;
- (MTObserverStore)observers;
- (MTPersistence)persistence;
- (MTTimer)nextTimer;
- (MTTimerDurationManager)durationManager;
- (MTTimerMigrator)migrator;
- (MTTimerScheduler)scheduler;
- (MTTimerStorage)init;
- (MTTimerStorage)initWithPersistence:(id)a3;
- (MTTimerStorage)initWithPersistence:(id)a3 migrator:(id)a4 serializer:(id)a5 callbackScheduler:(id)a6 currentDateProvider:(id)a7;
- (NAScheduler)serializer;
- (NSArray)timers;
- (NSDate)lastModifiedDate;
- (NSMutableArray)orderedTimers;
- (id)_applyNecessaryChangesFromOldTimer:(id)a3 currentTimer:(id)a4;
- (id)_diagnosticTimerDictionary;
- (id)_queuePersistTimer:(id)a3 replacingTimer:(id)a4;
- (id)_queue_timerMatchingTimerIdentifier:(id)a3;
- (id)_queue_updateTimer:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (id)currentDateProvider;
- (id)gatherDiagnostics;
- (id)newCurrentTimer;
- (void)_createDefaultTimerIfNeededWithCompletion:(id)a3;
- (void)_loadTimersWithCompletion:(id)a3;
- (void)_queue_addTimer:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)_queue_dismissTimerWithIdentifier:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)_queue_notifyObserversForNextTimerChange:(id)a3 source:(id)a4;
- (void)_queue_notifyObserversForTimerAdd:(id)a3 source:(id)a4;
- (void)_queue_notifyObserversForTimerDismiss:(id)a3 source:(id)a4;
- (void)_queue_notifyObserversForTimerFire:(id)a3 source:(id)a4;
- (void)_queue_notifyObserversForTimerRemoval:(id)a3 source:(id)a4;
- (void)_queue_notifyObserversForTimerUpdate:(id)a3 fromTimers:(id)a4 source:(id)a5;
- (void)_queue_notifyObserversWithBlock:(id)a3;
- (void)_queue_persistTimers;
- (void)_queue_removeAllTimersForSource:(id)a3;
- (void)_queue_removeStaleTimers:(BOOL)a3;
- (void)_queue_removeTimer:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)_queue_repeatTimerWithIdentifier:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)_queue_setAllTimers:(id)a3 source:(id)a4;
- (void)_queue_setAllTimers:(id)a3 source:(id)a4 persist:(BOOL)a5 notify:(BOOL)a6;
- (void)_queue_sortTimers;
- (void)_removeTimerDataIfNecessary:(id)a3;
- (void)addFavoriteDuration:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)addRecentDuration:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)addTimer:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)dealloc;
- (void)dismissTimerWithIdentifier:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)getDurationsWithCompletion:(id)a3;
- (void)getTimersWithCompletion:(id)a3;
- (void)handleMigrationFinish;
- (void)loadTimers;
- (void)loadTimersSync;
- (void)printDiagnostics;
- (void)registerObserver:(id)a3;
- (void)removeFavoriteDuration:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)removeRecentDuration:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)removeTimer:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)repeatTimerWithIdentifier:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)saveLatestDuration:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)scheduler:(id)a3 didChangeNextTimer:(id)a4;
- (void)scheduler:(id)a3 didFireTimer:(id)a4;
- (void)setAllTimers:(id)a3 source:(id)a4;
- (void)setDurationManager:(id)a3;
- (void)setDurationUpdateDelegate:(id)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setMigrator:(id)a3;
- (void)setObservers:(id)a3;
- (void)setOrderedTimers:(id)a3;
- (void)setPersistence:(id)a3;
- (void)setScheduler:(id)a3;
- (void)setSerializer:(id)a3;
- (void)setupListeners;
- (void)timeListener:(id)a3 didDetectSignificantTimeChangeWithCompletionBlock:(id)a4;
- (void)updateTimer:(id)a3 withCompletion:(id)a4 source:(id)a5;
@end

@implementation MTTimerStorage

- (void)getTimersWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MTLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received request for timers", buf, 0xCu);
  }

  if (v4)
  {
    v6 = [(MTTimerStorage *)self nextTimer];
    v7 = [(MTTimerStorage *)self serializer];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__MTTimerStorage_getTimersWithCompletion___block_invoke;
    v9[3] = &unk_1E5915120;
    v9[4] = self;
    id v10 = v6;
    id v11 = v4;
    id v8 = v6;
    [v7 performBlock:v9];
  }
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (MTTimer)nextTimer
{
  v2 = [(MTTimerStorage *)self scheduler];
  v3 = [v2 nextTimer];

  return (MTTimer *)v3;
}

- (MTTimerScheduler)scheduler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scheduler);
  return (MTTimerScheduler *)WeakRetained;
}

- (void)getDurationsWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void *, void *, void *, void))a3;
  v5 = MTLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    v15 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ returning timer duration query", (uint8_t *)&v14, 0xCu);
  }

  v6 = [(MTTimerStorage *)self durationManager];
  v7 = [v6 recentDurations];
  id v8 = [(MTTimerStorage *)self durationManager];
  v9 = [v8 favoriteDurations];
  id v10 = [(MTTimerStorage *)self durationManager];
  id v11 = [(id)objc_opt_class() defaultDurations];
  v12 = [(MTTimerStorage *)self durationManager];
  v13 = [v12 latestDuration];
  v4[2](v4, v7, v9, v11, v13, 0);
}

- (MTTimerDurationManager)durationManager
{
  return self->_durationManager;
}

void __42__MTTimerStorage_getTimersWithCompletion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__MTTimerStorage_getTimersWithCompletion___block_invoke_2;
  v3[3] = &unk_1E5915120;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _createDefaultTimerIfNeededWithCompletion:v3];
}

- (void)_createDefaultTimerIfNeededWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = +[MTTimer currentTimerFromTimers:self->_orderedTimers];
  if (v5)
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    id v6 = [(MTTimerStorage *)self newCurrentTimer];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__MTTimerStorage__createDefaultTimerIfNeededWithCompletion___block_invoke;
    v7[3] = &unk_1E5914D18;
    id v8 = v4;
    [(MTTimerStorage *)self _queue_addTimer:v6 withCompletion:v7 source:0];
  }
}

uint64_t __42__MTTimerStorage_getTimersWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(4);
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

  id v4 = MTLogForCategory(4);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __42__MTTimerStorage_getTimersWithCompletion___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = [*(id *)(v6 + 24) valueForKey:@"timerID"];
    id v8 = [*(id *)(a1 + 40) timerID];
    int v10 = 138543874;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    v13 = v7;
    __int16 v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ returning timers: %{public}@, next timer: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __42__MTTimerStorage_getTimersWithCompletion___block_invoke_2_cold_1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_debug_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ returning timers: %{public}@, next timer: %{public}@", v4, 0x20u);
}

- (MTTimerStorage)init
{
  os_log_t v3 = +[MTUserDefaults sharedUserDefaults];
  id v4 = [(MTTimerStorage *)self initWithPersistence:v3];

  return v4;
}

- (MTTimerStorage)initWithPersistence:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  __int16 v6 = +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", @"com.apple.MTTimerStorage.access-queue", +[MTScheduler defaultPriority]);
  uint64_t v7 = [MEMORY[0x1E4F7A0F0] mtMainThreadScheduler];
  uint64_t v8 = MTCurrentDateProvider();
  v9 = [(MTTimerStorage *)self initWithPersistence:v4 migrator:v5 serializer:v6 callbackScheduler:v7 currentDateProvider:v8];

  return v9;
}

- (MTTimerStorage)initWithPersistence:(id)a3 migrator:(id)a4 serializer:(id)a5 callbackScheduler:(id)a6 currentDateProvider:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v29.receiver = self;
  v29.super_class = (Class)MTTimerStorage;
  v18 = [(MTTimerStorage *)&v29 init];
  if (v18)
  {
    v19 = MTLogForCategory(4);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v18;
      _os_log_impl(&dword_19CC95000, v19, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v18->_migrator, a4);
    objc_storeStrong((id *)&v18->_serializer, a5);
    v20 = [[MTObserverStore alloc] initWithCallbackScheduler:v16];
    observers = v18->_observers;
    v18->_observers = v20;

    uint64_t v22 = [v17 copy];
    id currentDateProvider = v18->_currentDateProvider;
    v18->_id currentDateProvider = (id)v22;

    objc_storeStrong((id *)&v18->_persistence, a3);
    v24 = objc_alloc_init(MTMetrics);
    metrics = v18->_metrics;
    v18->_metrics = v24;

    v26 = [[MTTimerDurationManager alloc] initWithPersistence:v18->_persistence storage:v18];
    durationManager = v18->_durationManager;
    v18->_durationManager = v26;
  }
  return v18;
}

- (void)dealloc
{
  os_log_t v3 = +[MTApplicationWorkspaceObserver sharedWorkspaceObserver];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MTTimerStorage;
  [(MTTimerStorage *)&v4 dealloc];
}

- (void)setupListeners
{
  id v3 = +[MTApplicationWorkspaceObserver sharedWorkspaceObserver];
  [v3 addObserver:self forBundleIdentifier:@"com.apple.mobiletimer"];
}

- (void)loadTimers
{
}

- (void)loadTimersSync
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__MTTimerStorage_loadTimersSync__block_invoke;
  v5[3] = &unk_1E59150A8;
  dispatch_semaphore_t v6 = v3;
  objc_super v4 = v3;
  [(MTTimerStorage *)self _loadTimersWithCompletion:v5];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __32__MTTimerStorage_loadTimersSync__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_loadTimersWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTTimerStorage *)self serializer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__MTTimerStorage__loadTimersWithCompletion___block_invoke;
  v7[3] = &unk_1E59150D0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __44__MTTimerStorage__loadTimersWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  dispatch_semaphore_t v3 = [*(id *)(a1 + 32) persistence];

  if (!v3) {
    goto LABEL_49;
  }
  id v4 = MTLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *v2;
    *(_DWORD *)buf = 138543362;
    id v49 = v5;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ loading timers", buf, 0xCu);
  }

  id v6 = [*v2 persistence];
  uint64_t v7 = [v6 objectForKey:@"MTTimers"];

  id v8 = [*v2 persistence];
  [v8 floatForKey:@"MTTimerStorageVersion"];
  float v10 = v9;

  uint64_t v11 = [*v2 persistence];
  __int16 v12 = [v11 objectForKey:@"MTTimerModifiedDate"];

  uint64_t v13 = objc_opt_new();
  id v14 = (void *)*((void *)*v2 + 3);
  *((void *)*v2 + 3) = v13;

  if (v10 >= 1.0)
  {
    if (v7)
    {
      if (v10 >= 2.0)
      {
        objc_opt_class();
        id v31 = v7;
        if (objc_opt_isKindOfClass()) {
          uint64_t v32 = v31;
        }
        else {
          uint64_t v32 = 0;
        }
        id v26 = v32;

        id v17 = [[MTStorageReader alloc] initWithEncodedDictionary:v26];
      }
      else
      {
        uint64_t v22 = MTLogForCategory(4);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = *v2;
          *(_DWORD *)buf = 138543362;
          id v49 = v23;
          _os_log_impl(&dword_19CC95000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ binary data storage version detected.  Using old reader.", buf, 0xCu);
        }

        objc_opt_class();
        id v24 = v7;
        if (objc_opt_isKindOfClass()) {
          v25 = v24;
        }
        else {
          v25 = 0;
        }
        id v26 = v25;

        id v46 = 0;
        id v17 = (MTStorageReader *)[[MTStorageReaderV1 alloc] initForReadingFromData:v26 error:&v46];
        id v27 = v46;
        if (v27)
        {
          v28 = MTLogForCategory(4);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            __44__MTTimerStorage__loadTimersWithCompletion___block_invoke_cold_2();
          }
        }
      }

      v21 = [(MTStorageReader *)v17 decodeObjectForKey:@"MTTimers"];
      if (v10 < 3.0)
      {
        v33 = MTLogForCategory(4);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          id v34 = *v2;
          *(_DWORD *)buf = 138543362;
          id v49 = v34;
          _os_log_impl(&dword_19CC95000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating latest timer duration", buf, 0xCu);
        }

        v35 = +[MTTimer currentTimerFromTimers:v21];
        v36 = [*v2 durationManager];
        v37 = +[MTTimerDurationManager durationFromTimer:v35];
        [v36 saveLatestDuration:v37];
      }
      goto LABEL_37;
    }
    MTLogForCategory(4);
    id v17 = (MTStorageReader *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v17->super.super, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = *v2;
      *(_DWORD *)buf = 138543362;
      id v49 = v30;
      _os_log_impl(&dword_19CC95000, &v17->super.super, OS_LOG_TYPE_DEFAULT, "%{public}@ has no timers", buf, 0xCu);
    }
  }
  else
  {
    id v15 = MTLogForCategory(4);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = *v2;
      *(_DWORD *)buf = 138543362;
      id v49 = v16;
      _os_log_impl(&dword_19CC95000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ migration needed", buf, 0xCu);
    }

    [*((id *)*v2 + 6) migrateFromOldStorage];
    id v17 = [*((id *)*v2 + 6) timer];
    v18 = MTLogForCategory(4);
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        id v20 = *v2;
        *(_DWORD *)buf = 138543618;
        id v49 = v20;
        __int16 v50 = 2114;
        v51 = v17;
        _os_log_impl(&dword_19CC95000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ migrated timer is %{public}@", buf, 0x16u);
      }

      v47 = v17;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
      goto LABEL_37;
    }
    if (v19)
    {
      id v29 = *v2;
      *(_DWORD *)buf = 138543362;
      id v49 = v29;
      _os_log_impl(&dword_19CC95000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ no timer created during migration.", buf, 0xCu);
    }
  }
  v21 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_37:

  objc_msgSend(*v2, "_queue_setAllTimers:source:persist:notify:", v21, 0, v10 < 1.0, 0);
  objc_msgSend(*v2, "_queue_removeStaleTimers:", 0);
  if (v10 < 1.0) {
    [*((id *)*v2 + 6) removeFromOldStorage];
  }
  v38 = MTLogForCategory(4);
  BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);

  v40 = MTLogForCategory(4);
  v41 = v40;
  if (v39)
  {
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      __44__MTTimerStorage__loadTimersWithCompletion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    id v42 = *v2;
    v43 = [*((id *)*v2 + 3) valueForKey:@"timerID"];
    *(_DWORD *)buf = 138543618;
    id v49 = v42;
    __int16 v50 = 2114;
    v51 = v43;
    _os_log_impl(&dword_19CC95000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ loaded %{public}@", buf, 0x16u);
  }
  v44 = v12;
  if (!v12)
  {
    v44 = (*(void (**)(void))(*((void *)*v2 + 5) + 16))();
  }
  objc_storeStrong((id *)*v2 + 4, v44);
  if (!v12) {

  }
LABEL_49:
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __60__MTTimerStorage__createDefaultTimerIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)newCurrentTimer
{
  dispatch_semaphore_t v3 = [MTMutableTimer alloc];
  +[MTTimerManager defaultDuration];
  id v4 = -[MTTimer initWithState:duration:currentDateProvider:](v3, "initWithState:duration:currentDateProvider:", 1, self->_currentDateProvider);
  [(MTTimer *)v4 setTitle:@"CURRENT_TIMER"];
  return v4;
}

- (void)setScheduler:(id)a3
{
  p_scheduler = &self->_scheduler;
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_scheduler);
  [WeakRetained setDelegate:0];

  objc_storeWeak((id *)p_scheduler, obj);
  [obj setDelegate:self];
}

- (NSArray)timers
{
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(MTTimerStorage *)self serializer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __24__MTTimerStorage_timers__block_invoke;
  v8[3] = &unk_1E59150F8;
  float v10 = &v11;
  v8[4] = self;
  id v5 = v3;
  float v9 = v5;
  [v4 performBlock:v8];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSArray *)v6;
}

intptr_t __24__MTTimerStorage_timers__block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 24) copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = a1[5];
  return dispatch_semaphore_signal(v5);
}

- (NSDate)lastModifiedDate
{
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(MTTimerStorage *)self serializer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__MTTimerStorage_lastModifiedDate__block_invoke;
  v8[3] = &unk_1E59150F8;
  float v10 = &v11;
  v8[4] = self;
  id v5 = v3;
  float v9 = v5;
  [v4 performBlock:v8];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSDate *)v6;
}

intptr_t __34__MTTimerStorage_lastModifiedDate__block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 32));
  uint64_t v2 = a1[5];
  return dispatch_semaphore_signal(v2);
}

- (void)registerObserver:(id)a3
{
}

- (void)setAllTimers:(id)a3 source:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = MTLogForCategory(4);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  float v10 = MTLogForCategory(4);
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[MTTimerStorage setAllTimers:source:]();
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    BOOL v19 = self;
    _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ setting all timers", buf, 0xCu);
  }

  __int16 v12 = [(MTTimerStorage *)self serializer];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __38__MTTimerStorage_setAllTimers_source___block_invoke;
  v15[3] = &unk_1E5915078;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  [v12 performBlock:v15];
}

uint64_t __38__MTTimerStorage_setAllTimers_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAllTimers:source:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_queue_setAllTimers:(id)a3 source:(id)a4
{
}

- (void)_queue_setAllTimers:(id)a3 source:(id)a4 persist:(BOOL)a5 notify:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v14 = a4;
  id v10 = a3;
  uint64_t v11 = [(MTTimerStorage *)self orderedTimers];
  __int16 v12 = (void *)[v11 copy];

  id v13 = [MEMORY[0x1E4F1CA48] arrayWithArray:v10];
  [(NSMutableArray *)self->_orderedTimers removeAllObjects];
  [(NSMutableArray *)self->_orderedTimers addObjectsFromArray:v10];

  if (v7) {
    [(MTTimerStorage *)self _queue_persistTimers];
  }
  [(MTTimerStorage *)self _queue_sortTimers];
  if (v6)
  {
    [(MTTimerStorage *)self _queue_notifyObserversForTimerRemoval:v12 source:v14];
    [(MTTimerStorage *)self _queue_notifyObserversForTimerAdd:v13 source:v14];
  }
}

- (void)addTimer:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = MTLogForCategory(4);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = [v8 timerID];
    *(_DWORD *)buf = 138543618;
    id v23 = self;
    __int16 v24 = 2114;
    v25 = v12;
    _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ adding timer %{public}@", buf, 0x16u);
  }
  id v13 = MTLogForCategory(9);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_INFO, "MTTimerStorage - Adding Timer", buf, 2u);
  }

  id v14 = [(MTTimerStorage *)self serializer];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __49__MTTimerStorage_addTimer_withCompletion_source___block_invoke;
  v18[3] = &unk_1E5915148;
  v18[4] = self;
  id v19 = v8;
  id v20 = v10;
  id v21 = v9;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  [v14 performBlock:v18];
}

uint64_t __49__MTTimerStorage_addTimer_withCompletion_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addTimer:withCompletion:source:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
}

- (void)updateTimer:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = MTLogForCategory(4);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = [v8 timerID];
    *(_DWORD *)buf = 138543618;
    id v23 = self;
    __int16 v24 = 2114;
    v25 = v12;
    _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ updating timer %{public}@", buf, 0x16u);
  }
  id v13 = MTLogForCategory(9);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_INFO, "MTTimerStorage - Updating Timer", buf, 2u);
  }

  id v14 = [(MTTimerStorage *)self serializer];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__MTTimerStorage_updateTimer_withCompletion_source___block_invoke;
  v18[3] = &unk_1E5915148;
  v18[4] = self;
  id v19 = v8;
  id v20 = v10;
  id v21 = v9;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  [v14 performBlock:v18];
}

id __52__MTTimerStorage_updateTimer_withCompletion_source___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_queue_updateTimer:withCompletion:source:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
}

- (void)removeTimer:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = MTLogForCategory(4);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = [v8 timerID];
    *(_DWORD *)buf = 138543618;
    id v23 = self;
    __int16 v24 = 2114;
    v25 = v12;
    _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ removing timer %{public}@", buf, 0x16u);
  }
  id v13 = MTLogForCategory(9);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_INFO, "MTTimerStorage - Removing Timer", buf, 2u);
  }

  id v14 = [(MTTimerStorage *)self serializer];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__MTTimerStorage_removeTimer_withCompletion_source___block_invoke;
  v18[3] = &unk_1E5915148;
  v18[4] = self;
  id v19 = v8;
  id v20 = v10;
  id v21 = v9;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  [v14 performBlock:v18];
}

uint64_t __52__MTTimerStorage_removeTimer_withCompletion_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeTimer:withCompletion:source:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
}

- (void)dismissTimerWithIdentifier:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = MTLogForCategory(4);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = self;
    __int16 v23 = 2114;
    id v24 = v8;
    _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing timer with ID %{public}@", buf, 0x16u);
  }

  __int16 v12 = MTLogForCategory(9);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v12, OS_LOG_TYPE_INFO, "MTTimerStorage - Dismissing Timer", buf, 2u);
  }

  id v13 = [(MTTimerStorage *)self serializer];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__MTTimerStorage_dismissTimerWithIdentifier_withCompletion_source___block_invoke;
  v17[3] = &unk_1E5915148;
  v17[4] = self;
  id v18 = v8;
  id v19 = v10;
  id v20 = v9;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  [v13 performBlock:v17];
}

uint64_t __67__MTTimerStorage_dismissTimerWithIdentifier_withCompletion_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_dismissTimerWithIdentifier:withCompletion:source:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
}

- (void)repeatTimerWithIdentifier:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = MTLogForCategory(4);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = self;
    __int16 v23 = 2114;
    id v24 = v8;
    _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ repeating timer with ID %{public}@", buf, 0x16u);
  }

  __int16 v12 = MTLogForCategory(9);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v12, OS_LOG_TYPE_INFO, "MTTimerStorage - Repeating Timer", buf, 2u);
  }

  id v13 = [(MTTimerStorage *)self serializer];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__MTTimerStorage_repeatTimerWithIdentifier_withCompletion_source___block_invoke;
  v17[3] = &unk_1E5915148;
  v17[4] = self;
  id v18 = v8;
  id v19 = v10;
  id v20 = v9;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  [v13 performBlock:v17];
}

uint64_t __66__MTTimerStorage_repeatTimerWithIdentifier_withCompletion_source___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_repeatTimerWithIdentifier:withCompletion:source:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
}

- (void)_queue_addTimer:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, void *))a4;
  id v9 = a5;
  id v10 = a3;
  if ([(MTTimerStorage *)self _queue_hasMatchingTimer:v10])
  {
    uint64_t v11 = MTLogForCategory(4);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MTTimerStorage _queue_addTimer:withCompletion:source:](v11);
    }

    __int16 v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = @"Timer already exists!";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    id v14 = [v12 errorWithDomain:@"com.apple.mobiletimerd.MTTimerStorage" code:1 userInfo:v13];

    id v15 = MTLogForCategory(9);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_19CC95000, v15, OS_LOG_TYPE_INFO, "MTTimerStorage - Failed Adding Timer", v17, 2u);
    }
  }
  else
  {
    [(NSMutableArray *)self->_orderedTimers addObject:v10];
    [(MTTimerStorage *)self _queue_persistTimers];
    id v18 = v10;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];

    [(MTTimerStorage *)self _queue_notifyObserversForTimerAdd:v16 source:v9];
    [(MTTimerStorage *)self _queue_sortTimers];
    id v15 = MTLogForCategory(9);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_19CC95000, v15, OS_LOG_TYPE_INFO, "MTTimerStorage - Finished Adding Timer", v17, 2u);
    }
    id v14 = 0;
  }

  if (v8) {
    v8[2](v8, v14);
  }
}

- (id)_queue_updateTimer:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a4;
  id v10 = a5;
  uint64_t v11 = [v8 timerIDString];
  __int16 v12 = [(MTTimerStorage *)self _queue_timerMatchingTimerIdentifier:v11];

  if (!v12)
  {
    id v18 = MTLogForCategory(4);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MTTimerStorage _queue_updateTimer:withCompletion:source:](v18);
    }

    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    id v34 = @"Timer doesn't exist";
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    id v17 = [v19 errorWithDomain:@"com.apple.mobiletimerd.MTTimerStorage" code:2 userInfo:v20];

    id v21 = MTLogForCategory(9);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19CC95000, v21, OS_LOG_TYPE_INFO, "MTTimerStorage - Failed Updating Timer", buf, 2u);
    }

    +[MTAnalytics sendCriticalEvent:@"Timer storage - trying to update timer that does not exist"];
LABEL_17:
    id v13 = 0;
    if (!v9) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (!+[MTTimer stateChangeIsAllowableFromState:toState:](MTTimer, "stateChangeIsAllowableFromState:toState:", [v12 state], objc_msgSend(v8, "state")))
  {
    uint64_t v22 = NSString;
    __int16 v23 = +[MTTimer descriptionForState:](MTTimer, "descriptionForState:", [v12 state]);
    id v24 = +[MTTimer descriptionForState:](MTTimer, "descriptionForState:", [v8 state]);
    uint64_t v25 = [v22 stringWithFormat:@"Can't update timer from %@ to %@", v23, v24];

    uint64_t v26 = MTLogForCategory(4);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[MTTimerStorage _queue_updateTimer:withCompletion:source:]((uint64_t)v25, v26);
    }

    id v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    v36 = v25;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    id v17 = [v27 errorWithDomain:@"com.apple.mobiletimerd.MTTimerStorage" code:3 userInfo:v28];

    id v29 = MTLogForCategory(9);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19CC95000, v29, OS_LOG_TYPE_INFO, "MTTimerStorage - Failed Updating Timer", buf, 2u);
    }

    id v30 = [NSString stringWithFormat:@"Timer storage: %@", v25];
    +[MTAnalytics sendCriticalEvent:v30];

    goto LABEL_17;
  }
  id v13 = [(MTTimerStorage *)self _queuePersistTimer:v8 replacingTimer:v12];
  v38[0] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
  v37 = v12;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  [(MTTimerStorage *)self _queue_notifyObserversForTimerUpdate:v14 fromTimers:v15 source:v10];

  id v16 = MTLogForCategory(9);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v16, OS_LOG_TYPE_INFO, "MTTimerStorage - Finished Updating Timer", buf, 2u);
  }

  id v17 = 0;
  if (v9) {
LABEL_18:
  }
    v9[2](v9, v17);
LABEL_19:

  return v13;
}

- (void)_queue_removeTimer:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a4;
  id v10 = a5;
  uint64_t v11 = [v8 timerIDString];
  __int16 v12 = [(MTTimerStorage *)self _queue_timerMatchingTimerIdentifier:v11];

  if (v12)
  {
    id v13 = [(MTTimerStorage *)self _queuePersistTimer:0 replacingTimer:v12];
    v24[0] = v8;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    [(MTTimerStorage *)self _queue_notifyObserversForTimerRemoval:v14 source:v10];

    id v15 = MTLogForCategory(9);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v21 = 0;
      _os_log_impl(&dword_19CC95000, v15, OS_LOG_TYPE_INFO, "MTTimerStorage - Finished Removing Timer", v21, 2u);
    }

    id v16 = 0;
    if (v9) {
LABEL_5:
    }
      v9[2](v9, v16);
  }
  else
  {
    id v17 = MTLogForCategory(4);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MTTimerStorage _queue_removeTimer:withCompletion:source:](v17);
    }

    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    __int16 v23 = @"Timer does not exist!";
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v16 = [v18 errorWithDomain:@"com.apple.mobiletimerd.MTTimerStorage" code:2 userInfo:v19];

    id v20 = MTLogForCategory(9);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v21 = 0;
      _os_log_impl(&dword_19CC95000, v20, OS_LOG_TYPE_INFO, "MTTimerStorage - Failed Removing Timer", v21, 2u);
    }

    +[MTAnalytics sendCriticalEvent:@"Timer storage - trying to remove timer that does not exist"];
    if (v9) {
      goto LABEL_5;
    }
  }
}

- (void)_queue_dismissTimerWithIdentifier:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a4;
  id v10 = a5;
  uint64_t v11 = [(MTTimerStorage *)self _queue_timerMatchingTimerIdentifier:v8];
  __int16 v12 = (*((void (**)(void))self->_currentDateProvider + 2))();
  if (v11)
  {
    id v13 = (void *)[v11 mutableCopy];
    [v13 setDismissedDate:v12];
    id v14 = MTLogForCategory(4);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v13 timerID];
      *(_DWORD *)buf = 138543618;
      id v27 = v15;
      __int16 v28 = 2114;
      id v29 = v12;
      _os_log_impl(&dword_19CC95000, v14, OS_LOG_TYPE_DEFAULT, "Dismissed timer %{public}@ at %{public}@", buf, 0x16u);
    }
    uint64_t v16 = [(MTTimerStorage *)self _queue_updateTimer:v13 withCompletion:v9 source:v10];
    id v17 = (void *)v16;
    if (v16) {
      id v18 = (void *)v16;
    }
    else {
      id v18 = v13;
    }
    [(MTTimerStorage *)self _queue_notifyObserversForTimerDismiss:v18 source:v10];
    uint64_t v19 = MTLogForCategory(9);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19CC95000, v19, OS_LOG_TYPE_INFO, "MTTimerStorage - Finished Dismissing Timer", buf, 2u);
    }
  }
  else
  {
    id v20 = MTLogForCategory(4);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[MTTimerStorage _queue_dismissTimerWithIdentifier:withCompletion:source:]();
    }

    +[MTAnalytics sendCriticalEvent:@"Timer storage - trying to dismiss timer that does not exist"];
    id v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    uint64_t v25 = @"Timer does not exist!";
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v13 = [v21 errorWithDomain:@"com.apple.mobiletimerd.MTTimerStorage" code:2 userInfo:v22];

    if (v9)
    {
      __int16 v23 = MTLogForCategory(9);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19CC95000, v23, OS_LOG_TYPE_INFO, "MTTimerStorage - Failed Dismissing Timer", buf, 2u);
      }

      v9[2](v9, v13);
    }
  }
}

- (void)_queue_repeatTimerWithIdentifier:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a4;
  id v10 = a5;
  uint64_t v11 = [(MTTimerStorage *)self _queue_timerMatchingTimerIdentifier:v8];
  __int16 v12 = v11;
  if (v11)
  {
    id v13 = [v11 timerByRestarting];
    id v14 = MTLogForCategory(4);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v13 timerID];
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v15;
      _os_log_impl(&dword_19CC95000, v14, OS_LOG_TYPE_DEFAULT, "Repeated timer %{public}@", buf, 0xCu);
    }
    id v16 = [(MTTimerStorage *)self _queue_updateTimer:v13 withCompletion:v9 source:v10];
    id v17 = MTLogForCategory(9);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19CC95000, v17, OS_LOG_TYPE_INFO, "MTTimerStorage - Finished Repeating Timer", buf, 2u);
    }
  }
  else
  {
    id v18 = MTLogForCategory(4);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MTTimerStorage _queue_dismissTimerWithIdentifier:withCompletion:source:]();
    }

    +[MTAnalytics sendCriticalEvent:@"Timer storage - trying to repeat timer that does not exist"];
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    __int16 v23 = @"Timer does not exist!";
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v13 = [v19 errorWithDomain:@"com.apple.mobiletimerd.MTTimerStorage" code:2 userInfo:v20];

    if (v9)
    {
      id v21 = MTLogForCategory(9);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19CC95000, v21, OS_LOG_TYPE_INFO, "MTTimerStorage - Failed Repeating Timer", buf, 2u);
      }

      v9[2](v9, v13);
    }
  }
}

- (void)_queue_removeAllTimersForSource:(id)a3
{
  id v4 = a3;
  id v5 = [(MTTimerStorage *)self orderedTimers];
  id v7 = (id)[v5 copy];

  BOOL v6 = [(MTTimerStorage *)self orderedTimers];
  [v6 removeAllObjects];

  [(MTTimerStorage *)self _queue_persistTimers];
  [(MTTimerStorage *)self _queue_notifyObserversForTimerRemoval:v7 source:v4];
}

- (id)_queuePersistTimer:(id)a3 replacingTimer:(id)a4
{
  id v6 = a4;
  id v7 = [(MTTimerStorage *)self _applyNecessaryChangesFromOldTimer:v6 currentTimer:a3];
  if (v6)
  {
    id v8 = [(MTTimerStorage *)self orderedTimers];
    [v8 removeObject:v6];
  }
  id v9 = v6;
  if (v7)
  {
    id v10 = [(MTTimerStorage *)self orderedTimers];
    [v10 addObject:v7];

    id v9 = v7;
  }
  [(MTTimerStorage *)self _queue_persistTimers];
  [(MTTimerStorage *)self _queue_sortTimers];
  id v11 = v9;

  return v11;
}

- (id)_applyNecessaryChangesFromOldTimer:(id)a3 currentTimer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[v6 mutableCopy];
  id v9 = (*((void (**)(void))self->_currentDateProvider + 2))();
  [v8 setLastModifiedDate:v9];

  uint64_t v10 = [v7 state];
  if (v10 != 3 && [v6 state] == 3)
  {
    [v8 setFiredDate:0];
    [v8 setDismissedDate:0];
  }

  return v8;
}

- (void)_queue_notifyObserversWithBlock:(id)a3
{
}

- (void)_queue_notifyObserversForTimerAdd:(id)a3 source:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = MTLogForCategory(4);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for timer addition", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__MTTimerStorage__queue_notifyObserversForTimerAdd_source___block_invoke;
    v9[3] = &unk_1E5915170;
    id v10 = v7;
    id v11 = v6;
    [(MTTimerStorage *)self _queue_notifyObserversWithBlock:v9];
  }
}

uint64_t __59__MTTimerStorage__queue_notifyObserversForTimerAdd_source___block_invoke(uint64_t a1, void *a2)
{
  return [a2 source:*(void *)(a1 + 32) didAddTimers:*(void *)(a1 + 40)];
}

- (void)_queue_notifyObserversForTimerUpdate:(id)a3 fromTimers:(id)a4 source:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v11 = MTLogForCategory(4);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = self;
      _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for timer update", buf, 0xCu);
    }

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __73__MTTimerStorage__queue_notifyObserversForTimerUpdate_fromTimers_source___block_invoke;
    v12[3] = &unk_1E5915198;
    id v13 = v10;
    id v14 = v8;
    id v15 = v9;
    [(MTTimerStorage *)self _queue_notifyObserversWithBlock:v12];
  }
}

void __73__MTTimerStorage__queue_notifyObserversForTimerUpdate_fromTimers_source___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  [v3 source:a1[4] didUpdateTimers:a1[5]];
  if (objc_opt_respondsToSelector()) {
    [v3 source:a1[4] didUpdateTimers:a1[5] fromTimers:a1[6]];
  }
}

- (void)_queue_notifyObserversForTimerRemoval:(id)a3 source:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = MTLogForCategory(4);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for timer removal", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__MTTimerStorage__queue_notifyObserversForTimerRemoval_source___block_invoke;
    v9[3] = &unk_1E5915170;
    id v10 = v7;
    id v11 = v6;
    [(MTTimerStorage *)self _queue_notifyObserversWithBlock:v9];
  }
}

uint64_t __63__MTTimerStorage__queue_notifyObserversForTimerRemoval_source___block_invoke(uint64_t a1, void *a2)
{
  return [a2 source:*(void *)(a1 + 32) didRemoveTimers:*(void *)(a1 + 40)];
}

- (void)_queue_notifyObserversForTimerDismiss:(id)a3 source:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = MTLogForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = self;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for timer dismissal", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__MTTimerStorage__queue_notifyObserversForTimerDismiss_source___block_invoke;
  v11[3] = &unk_1E5915170;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(MTTimerStorage *)self _queue_notifyObserversWithBlock:v11];
}

uint64_t __63__MTTimerStorage__queue_notifyObserversForTimerDismiss_source___block_invoke(uint64_t a1, void *a2)
{
  return [a2 source:*(void *)(a1 + 32) didDismissTimer:*(void *)(a1 + 40)];
}

- (void)_queue_notifyObserversForTimerFire:(id)a3 source:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = MTLogForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = self;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for timer firing", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__MTTimerStorage__queue_notifyObserversForTimerFire_source___block_invoke;
  v11[3] = &unk_1E5915170;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(MTTimerStorage *)self _queue_notifyObserversWithBlock:v11];
}

uint64_t __60__MTTimerStorage__queue_notifyObserversForTimerFire_source___block_invoke(uint64_t a1, void *a2)
{
  return [a2 source:*(void *)(a1 + 32) didFireTimer:*(void *)(a1 + 40)];
}

- (void)_queue_notifyObserversForNextTimerChange:(id)a3 source:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = MTLogForCategory(4);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = self;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying observers for next timer change", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__MTTimerStorage__queue_notifyObserversForNextTimerChange_source___block_invoke;
  v8[3] = &unk_1E59151C0;
  id v9 = v5;
  id v7 = v5;
  [(MTTimerStorage *)self _queue_notifyObserversWithBlock:v8];
}

uint64_t __66__MTTimerStorage__queue_notifyObserversForNextTimerChange_source___block_invoke(uint64_t a1, void *a2)
{
  return [a2 nextTimerDidChange:*(void *)(a1 + 32)];
}

- (id)_queue_timerMatchingTimerIdentifier:(id)a3
{
  id v4 = a3;
  orderedTimers = self->_orderedTimers;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__MTTimerStorage__queue_timerMatchingTimerIdentifier___block_invoke;
  v9[3] = &unk_1E59151E8;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(NSMutableArray *)orderedTimers na_firstObjectPassingTest:v9];

  return v7;
}

uint64_t __54__MTTimerStorage__queue_timerMatchingTimerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 timerIDString];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)_queue_hasMatchingTimer:(id)a3
{
  uint64_t v4 = [a3 timerIDString];
  id v5 = [(MTTimerStorage *)self _queue_timerMatchingTimerIdentifier:v4];

  return v5 != 0;
}

- (void)_queue_persistTimers
{
  id v3 = [(MTTimerStorage *)self persistence];

  if (v3)
  {
    id v10 = (id)objc_opt_new();
    [v10 encodeObject:self->_orderedTimers forKey:@"MTTimers"];
    uint64_t v4 = [v10 encodedDictionary];
    id v5 = [(MTTimerStorage *)self persistence];
    [v5 setObject:v4 forKey:@"MTTimers"];

    id v6 = [(MTTimerStorage *)self persistence];
    LODWORD(v7) = 3.0;
    [v6 setFloat:@"MTTimerStorageVersion" forKey:v7];

    id v8 = [(MTTimerStorage *)self persistence];
    id v9 = (*((void (**)(void))self->_currentDateProvider + 2))();
    [v8 setObject:v9 forKey:@"MTTimerModifiedDate"];
  }
}

- (void)_queue_sortTimers
{
}

uint64_t __35__MTTimerStorage__queue_sortTimers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)handleMigrationFinish
{
}

- (void)printDiagnostics
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "-----MTTimerStorage-----", (uint8_t *)&v8, 2u);
  }

  uint64_t v4 = MTLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(MTTimerStorage *)self _diagnosticTimerDictionary];
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "Timers: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  id v6 = MTLogForCategory(4);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = [(MTTimerStorage *)self lastModifiedDate];
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "Last Modified: %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (id)gatherDiagnostics
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"Timers";
  id v3 = [(MTTimerStorage *)self _diagnosticTimerDictionary];
  v7[1] = @"Timers Last Modified";
  v8[0] = v3;
  uint64_t v4 = [(MTTimerStorage *)self lastModifiedDate];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (id)_diagnosticTimerDictionary
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(MTTimerStorage *)self orderedTimers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [(id)objc_opt_class() _diagnosticDictionaryForTimer:v9];
        id v11 = [v9 timerIDString];
        [v3 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (id)_diagnosticDictionaryForTimer:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = +[MTTimer descriptionForState:](MTTimer, "descriptionForState:", [v3 state]);
  [v4 setObject:v5 forKeyedSubscript:@"state"];

  uint64_t v6 = [v3 firedDate];
  uint64_t v7 = (void *)v6;
  if (v6) {
    int v8 = (__CFString *)v6;
  }
  else {
    int v8 = @"None";
  }
  [v4 setObject:v8 forKeyedSubscript:@"fired"];

  uint64_t v9 = [v3 lastModifiedDate];
  uint64_t v10 = (void *)v9;
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  else {
    id v11 = @"None";
  }
  [v4 setObject:v11 forKeyedSubscript:@"modified"];

  uint64_t v12 = NSString;
  long long v13 = [v3 sound];
  long long v14 = [v13 toneIdentifier];
  long long v15 = [v3 sound];
  long long v16 = [v15 mediaItemIdentifier];
  id v17 = [v3 sound];
  uint64_t v18 = [v17 vibrationIdentifier];
  uint64_t v19 = [v3 sound];

  id v20 = [v19 soundVolume];
  id v21 = [v12 stringWithFormat:@"toneID: %@, mediaItemID: %@, vibeID: %@, volume: %@", v14, v16, v18, v20];
  [v4 setObject:v21 forKeyedSubscript:@"sound"];

  return v4;
}

- (void)scheduler:(id)a3 didChangeNextTimer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(MTTimerStorage *)self serializer];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__MTTimerStorage_scheduler_didChangeNextTimer___block_invoke;
  v11[3] = &unk_1E5915078;
  void v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 performBlock:v11];
}

uint64_t __47__MTTimerStorage_scheduler_didChangeNextTimer___block_invoke(uint64_t a1)
{
  uint64_t v2 = MTLogForCategory(9);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_INFO, "MTTimerStorage - Next Timer Changed", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyObserversForNextTimerChange:source:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)scheduler:(id)a3 didFireTimer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(MTTimerStorage *)self serializer];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__MTTimerStorage_scheduler_didFireTimer___block_invoke;
  v11[3] = &unk_1E5915078;
  void v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 performBlock:v11];
}

void __41__MTTimerStorage_scheduler_didFireTimer___block_invoke(uint64_t a1)
{
  uint64_t v2 = MTLogForCategory(9);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_INFO, "MTTimerStorage - Fired Timer", v5, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) scheduleable];
  objc_msgSend(v3, "_queue_notifyObserversForTimerFire:source:", v4, *(void *)(a1 + 48));
}

- (void)_removeTimerDataIfNecessary:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (([a3 isEqualToString:@"com.apple.mobiletimer"] & 1) != 0
    || !a3
    && (+[MTApplicationWorkspaceObserver sharedWorkspaceObserver](MTApplicationWorkspaceObserver, "sharedWorkspaceObserver"), v7 = objc_claimAutoreleasedReturnValue(), char v8 = [v7 isApplicationInstalledForBundleIdentifier:@"com.apple.mobiletimer"], v7, (v8 & 1) == 0))
  {
    uint64_t v5 = MTLogForCategory(4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = self;
      _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ removing all timers", buf, 0xCu);
    }

    id v6 = [(MTTimerStorage *)self serializer];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__MTTimerStorage__removeTimerDataIfNecessary___block_invoke;
    v9[3] = &unk_1E59150A8;
    void v9[4] = self;
    [v6 performBlock:v9];
  }
}

uint64_t __46__MTTimerStorage__removeTimerDataIfNecessary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllTimersForSource:", 0);
}

- (void)_queue_removeStaleTimers:(BOOL)a3
{
  BOOL v25 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = objc_opt_new();
  id v6 = (*((void (**)(void))self->_currentDateProvider + 2))();
  id v7 = [v6 dateByAddingTimeInterval:-172800.0];

  char v8 = MTLogForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v33 = self;
    __int16 v34 = 2114;
    uint64_t v35 = v7;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Checking for stale timers that have not been modified since: %{public}@", buf, 0x16u);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v27 = self;
  id v9 = self->_orderedTimers;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    uint64_t v26 = v5;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v15 = [v14 state];
        long long v16 = v5;
        if (v15 == 1)
        {
          id v17 = [v14 lastModifiedDate];
          int v18 = [v17 mtIsBeforeDate:v7];

          long long v16 = v5;
          if (v18)
          {
            uint64_t v19 = MTLogForCategory(4);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              id v20 = [v14 timerIDString];
              [v14 lastModifiedDate];
              id v21 = v9;
              uint64_t v22 = v7;
              v24 = __int16 v23 = v4;
              *(_DWORD *)buf = 138543874;
              uint64_t v33 = v27;
              __int16 v34 = 2114;
              uint64_t v35 = v20;
              __int16 v36 = 2114;
              v37 = v24;
              _os_log_impl(&dword_19CC95000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ timer: %{public}@ has not been modified since: %{public}@. Removing.", buf, 0x20u);

              uint64_t v4 = v23;
              id v7 = v22;
              id v9 = v21;
              uint64_t v5 = v26;
            }
            long long v16 = v4;
          }
        }
        [v16 addObject:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v11);
  }

  if ([v4 count])
  {
    [(MTTimerStorage *)v27 _queue_setAllTimers:v5 source:0 persist:1 notify:0];
    if (v25) {
      [(MTTimerStorage *)v27 _queue_notifyObserversForTimerRemoval:v4 source:0];
    }
  }
}

- (void)timeListener:(id)a3 didDetectSignificantTimeChangeWithCompletionBlock:(id)a4
{
  uint64_t v5 = [(MTTimerStorage *)self serializer];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__MTTimerStorage_timeListener_didDetectSignificantTimeChangeWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E59150A8;
  v6[4] = self;
  [v5 performBlock:v6];
}

uint64_t __81__MTTimerStorage_timeListener_didDetectSignificantTimeChangeWithCompletionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeStaleTimers:", 1);
}

- (void)addRecentDuration:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  char v8 = (void (**)(id, void))a4;
  id v9 = MTLogForCategory(4);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    uint64_t v12 = self;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ addRecentDuration %{public}@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = [(MTTimerStorage *)self durationManager];
  [v10 addRecentDuration:v7];

  if (v8) {
    v8[2](v8, 0);
  }
}

- (void)removeRecentDuration:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  char v8 = (void (**)(id, void))a4;
  id v9 = MTLogForCategory(4);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    uint64_t v12 = self;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ removeRecentDuration %{public}@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = [(MTTimerStorage *)self durationManager];
  [v10 removeRecentDuration:v7];

  if (v8) {
    v8[2](v8, 0);
  }
}

- (void)addFavoriteDuration:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  char v8 = (void (**)(id, void))a4;
  id v9 = MTLogForCategory(4);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    uint64_t v12 = self;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ addFavoriteDuration %{public}@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = [(MTTimerStorage *)self durationManager];
  [v10 addFavoriteDuration:v7];

  if (v8) {
    v8[2](v8, 0);
  }
}

- (void)removeFavoriteDuration:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  char v8 = (void (**)(id, void))a4;
  id v9 = MTLogForCategory(4);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    uint64_t v12 = self;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ removeFavoriteDuration %{public}@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = [(MTTimerStorage *)self durationManager];
  [v10 removeFavoriteDuration:v7];

  if (v8) {
    v8[2](v8, 0);
  }
}

- (void)saveLatestDuration:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  char v8 = (void (**)(id, void))a4;
  id v9 = MTLogForCategory(4);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    uint64_t v12 = self;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ saveLatestDuration %{public}@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = [(MTTimerStorage *)self durationManager];
  [v10 saveLatestDuration:v7];

  if (v8) {
    v8[2](v8, 0);
  }
}

- (void)setDurationUpdateDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(MTTimerStorage *)self durationManager];
  [v5 setDurationUpdateDelegate:v4];
}

- (NSMutableArray)orderedTimers
{
  return self->_orderedTimers;
}

- (void)setOrderedTimers:(id)a3
{
}

- (void)setLastModifiedDate:(id)a3
{
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (MTTimerMigrator)migrator
{
  return self->_migrator;
}

- (void)setMigrator:(id)a3
{
}

- (void)setSerializer:(id)a3
{
}

- (MTObserverStore)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (MTPersistence)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
}

- (void)setDurationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationManager, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_orderedTimers, 0);
  objc_destroyWeak((id *)&self->_scheduler);
  objc_storeStrong((id *)&self->_metrics, 0);
}

void __44__MTTimerStorage__loadTimersWithCompletion___block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_19CC95000, v1, OS_LOG_TYPE_DEBUG, "%{public}@ loaded %{public}@", v2, 0x16u);
}

void __44__MTTimerStorage__loadTimersWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ unexpected error reading data %{public}@");
}

- (void)setAllTimers:source:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_19CC95000, v0, OS_LOG_TYPE_DEBUG, "%{public}@ setting all timers %{public}@", v1, 0x16u);
}

- (void)_queue_addTimer:(os_log_t)log withCompletion:source:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "Timer already exists", v1, 2u);
}

- (void)_queue_updateTimer:(os_log_t)log withCompletion:source:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  uint64_t v2 = @"Timer doesn't exist";
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v1, 0xCu);
}

- (void)_queue_updateTimer:(uint64_t)a1 withCompletion:(NSObject *)a2 source:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19CC95000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_queue_removeTimer:(os_log_t)log withCompletion:source:.cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "Timer doesn't exist", v1, 2u);
}

- (void)_queue_dismissTimerWithIdentifier:withCompletion:source:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ couldn't find matching timer to dismiss for %{public}@");
}

@end
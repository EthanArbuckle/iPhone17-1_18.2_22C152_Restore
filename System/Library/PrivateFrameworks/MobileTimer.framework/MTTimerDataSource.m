@interface MTTimerDataSource
- (MTObserverStore)observers;
- (MTTimerDataSource)initWithTimerManager:(id)a3;
- (MTTimerDuration)latestDuration;
- (MTTimerManager)timerManager;
- (NSArray)defaultDurations;
- (NSArray)favoriteDurations;
- (NSArray)recentDurations;
- (NSMutableArray)activeTimers;
- (NSMutableArray)timers;
- (id)activeTimerAtRow:(unint64_t)a3;
- (id)addTimer:(id)a3;
- (id)addTimer:(id)a3 reload:(BOOL)a4;
- (id)getDefaultDurations;
- (id)getFavoriteDurations;
- (id)getLatestDuration;
- (id)getRecentDurations;
- (id)reloadTimers;
- (id)reloadTimersNotifyingObservers:(BOOL)a3;
- (id)removeTimer:(id)a3;
- (id)timerAtRow:(unint64_t)a3;
- (id)updateTimer:(id)a3;
- (id)updateTimer:(id)a3 reload:(BOOL)a4;
- (os_unfair_lock_s)timerLock;
- (unint64_t)numberOfActiveTimers;
- (unint64_t)numberOfTimers;
- (unint64_t)rowForTimer:(id)a3;
- (unint64_t)rowForTimerWithID:(id)a3;
- (void)_handleTimerDurationNotification:(id)a3 block:(id)a4;
- (void)_handleTimerNotification:(id)a3 block:(id)a4;
- (void)_iterateObserversWithBlock:(id)a3;
- (void)_registerForNotifications;
- (void)_stateReset;
- (void)_withLock:(id)a3;
- (void)dealloc;
- (void)processFavoriteDurationsUpdated:(id)a3;
- (void)processLatestDurationsUpdatedWith:(id)a3;
- (void)processRecentDurationsUpdated:(id)a3;
- (void)registerObserver:(id)a3;
- (void)reloadTimerDurations;
- (void)setActiveTimers:(id)a3;
- (void)setDefaultDurations:(id)a3;
- (void)setFavoriteDurations:(id)a3;
- (void)setLatestDuration:(id)a3;
- (void)setObservers:(id)a3;
- (void)setRecentDurations:(id)a3;
- (void)setTimerLock:(os_unfair_lock_s)a3;
- (void)setTimerManager:(id)a3;
- (void)setTimers:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation MTTimerDataSource

- (unint64_t)numberOfActiveTimers
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  activeTimers = self->_activeTimers;
  return [(NSMutableArray *)activeTimers count];
}

uint64_t __52__MTTimerDataSource_reloadTimersNotifyingObservers___block_invoke_42(uint64_t a1, void *a2)
{
  return [a2 dataSourceDidReload:*(void *)(a1 + 32)];
}

void __41__MTTimerDataSource_reloadTimerDurations__block_invoke_51(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dataSourceDidReloadAllDurations:*(void *)(a1 + 32)];
  }
}

- (id)reloadTimers
{
  return [(MTTimerDataSource *)self reloadTimersNotifyingObservers:1];
}

uint64_t __52__MTTimerDataSource_reloadTimersNotifyingObservers___block_invoke_44()
{
  return [MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

void __52__MTTimerDataSource_reloadTimersNotifyingObservers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = MTLogForCategory(4);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __52__MTTimerDataSource_reloadTimersNotifyingObservers___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = *(void **)(v9 + 32);
    *(void *)(v9 + 32) = v8;

    uint64_t v11 = objc_opt_new();
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v14 = v5;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          [*(id *)(*(void *)(a1 + 32) + 32) addObject:v19];
          if ([v19 state] == 3 || objc_msgSend(v19, "state") == 2) {
            [*(id *)(*(void *)(a1 + 32) + 40) addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v16);
    }

    int v20 = *(unsigned __int8 *)(a1 + 40);
    v21 = MTLogForCategory(4);
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v22)
      {
        uint64_t v23 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v33 = v23;
        _os_log_impl(&dword_19CC95000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ calling reload block", buf, 0xCu);
      }

      v24 = *(void **)(a1 + 32);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __52__MTTimerDataSource_reloadTimersNotifyingObservers___block_invoke_42;
      v27[3] = &unk_1E59180C8;
      v27[4] = v24;
      [v24 _iterateObserversWithBlock:v27];
    }
    else
    {
      if (v22)
      {
        uint64_t v25 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v33 = v25;
        _os_log_impl(&dword_19CC95000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ reload without notifying observers", buf, 0xCu);
      }
    }
    v7 = MTLogForCategory(4);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v26;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ finished reloading", buf, 0xCu);
    }
  }
}

- (id)getLatestDuration
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__16;
  uint64_t v9 = __Block_byref_object_dispose__16;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__MTTimerDataSource_getLatestDuration__block_invoke;
  v4[3] = &unk_1E5915340;
  v4[4] = self;
  v4[5] = &v5;
  [(MTTimerDataSource *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __41__MTTimerDataSource_reloadTimerDurations__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = MTLogForCategory(4);
  uint64_t v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __41__MTTimerDataSource_reloadTimerDurations__block_invoke_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v34 = v18;
      _os_log_impl(&dword_19CC95000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ loading durations with completion finished successfully", buf, 0xCu);
    }

    v19 = *(void **)(a1 + 32);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __41__MTTimerDataSource_reloadTimerDurations__block_invoke_47;
    v28[3] = &unk_1E59155B0;
    v28[4] = v19;
    id v29 = v11;
    id v30 = v12;
    id v31 = v13;
    id v32 = v14;
    [v19 _withLock:v28];
    int v20 = MTLogForCategory(4);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(void **)(a1 + 32);
      [v21 recentDurations];
      BOOL v22 = v26 = v11;
      uint64_t v23 = [*(id *)(a1 + 32) favoriteDurations];
      v24 = [*(id *)(a1 + 32) latestDuration];
      *(_DWORD *)buf = 138544130;
      v34 = v21;
      __int16 v35 = 2114;
      v36 = v22;
      __int16 v37 = 2114;
      v38 = v23;
      __int16 v39 = 2114;
      v40 = v24;
      _os_log_impl(&dword_19CC95000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ updated durations are recent: %{public}@, favorites: %{public}@, latest: %{public}@", buf, 0x2Au);

      id v11 = v26;
    }

    uint64_t v25 = *(void **)(a1 + 32);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __41__MTTimerDataSource_reloadTimerDurations__block_invoke_51;
    v27[3] = &unk_1E59180C8;
    v27[4] = v25;
    [v25 _iterateObserversWithBlock:v27];
  }
}

- (id)getRecentDurations
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__16;
  uint64_t v9 = __Block_byref_object_dispose__16;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__MTTimerDataSource_getRecentDurations__block_invoke;
  v4[3] = &unk_1E5915340;
  v4[4] = self;
  v4[5] = &v5;
  [(MTTimerDataSource *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)_withLock:(id)a3
{
  p_timerLock = &self->_timerLock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_timerLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_timerLock);
}

uint64_t __39__MTTimerDataSource_getRecentDurations__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) recentDurations];
  return MEMORY[0x1F41817F8]();
}

- (NSArray)recentDurations
{
  return self->_recentDurations;
}

- (MTTimerDuration)latestDuration
{
  return self->_latestDuration;
}

- (void)_iterateObserversWithBlock:(id)a3
{
}

uint64_t __41__MTTimerDataSource_reloadTimerDurations__block_invoke_47(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) sortedArrayUsingComparator:&__block_literal_global_50];
  [*(id *)(a1 + 32) setRecentDurations:v2];

  [*(id *)(a1 + 32) setFavoriteDurations:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setDefaultDurations:*(void *)(a1 + 56)];
  uint64_t v3 = *(void *)(a1 + 64);
  v4 = *(void **)(a1 + 32);
  return [v4 setLatestDuration:v3];
}

uint64_t __38__MTTimerDataSource_getLatestDuration__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) latestDuration];
  return MEMORY[0x1F41817F8]();
}

- (void)setRecentDurations:(id)a3
{
}

- (void)setLatestDuration:(id)a3
{
}

- (void)setFavoriteDurations:(id)a3
{
}

- (void)setDefaultDurations:(id)a3
{
}

- (NSArray)favoriteDurations
{
  return self->_favoriteDurations;
}

- (void)registerObserver:(id)a3
{
}

- (id)reloadTimersNotifyingObservers:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v5 = MTLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ asynchronously reloading timers", buf, 0xCu);
  }

  id v6 = [(MTTimerManager *)self->_timerManager timers];
  uint64_t v7 = [MEMORY[0x1E4F7A0F0] mtMainThreadScheduler];
  uint64_t v8 = [v6 reschedule:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__MTTimerDataSource_reloadTimersNotifyingObservers___block_invoke;
  v12[3] = &unk_1E5917D90;
  v12[4] = self;
  BOOL v13 = a3;
  uint64_t v9 = [v8 addCompletionBlock:v12];
  id v10 = [v9 flatMap:&__block_literal_global_47];

  return v10;
}

- (void)reloadTimerDurations
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v7 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ loading all durations with completion", buf, 0xCu);
  }

  timerManager = self->_timerManager;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__MTTimerDataSource_reloadTimerDurations__block_invoke;
  v5[3] = &unk_1E5917560;
  v5[4] = self;
  [(MTTimerManager *)timerManager loadAllDurationsWithCompletion:v5];
}

- (MTTimerDataSource)initWithTimerManager:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v13.receiver = self;
  v13.super_class = (Class)MTTimerDataSource;
  id v6 = [(MTTimerDataSource *)&v13 init];
  if (v6)
  {
    uint64_t v7 = MTLogForCategory(4);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v6;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing", buf, 0xCu);
    }

    v6->_timerLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_timerManager, a3);
    uint64_t v8 = objc_opt_new();
    timers = v6->_timers;
    v6->_timers = (NSMutableArray *)v8;

    uint64_t v10 = objc_opt_new();
    observers = v6->_observers;
    v6->_observers = (MTObserverStore *)v10;

    [(MTTimerDataSource *)v6 _registerForNotifications];
  }

  return v6;
}

- (void)_registerForNotifications
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  timerManager = self->_timerManager;
  id v5 = [MEMORY[0x1E4F28F08] mainQueue];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke;
  v41[3] = &unk_1E5917D18;
  v41[4] = self;
  id v6 = (id)[v3 addObserverForName:@"MTTimerManagerTimersAdded" object:timerManager queue:v5 usingBlock:v41];

  uint64_t v7 = self->_timerManager;
  uint64_t v8 = [MEMORY[0x1E4F28F08] mainQueue];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_4;
  v40[3] = &unk_1E5917D18;
  v40[4] = self;
  id v9 = (id)[v3 addObserverForName:@"MTTimerManagerTimersRemoved" object:v7 queue:v8 usingBlock:v40];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_3_12;
  v39[3] = &unk_1E5917BE8;
  v39[4] = self;
  uint64_t v10 = (void *)MEMORY[0x19F3A0FB0](v39);
  id v11 = self->_timerManager;
  id v12 = [MEMORY[0x1E4F28F08] mainQueue];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_5;
  v37[3] = &unk_1E5917D40;
  v37[4] = self;
  id v13 = v10;
  id v38 = v13;
  id v14 = (id)[v3 addObserverForName:@"MTTimerManagerFiringTimerChanged" object:v11 queue:v12 usingBlock:v37];

  id v15 = self->_timerManager;
  uint64_t v16 = [MEMORY[0x1E4F28F08] mainQueue];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_16;
  v35[3] = &unk_1E5917D40;
  v35[4] = self;
  id v36 = v13;
  id v17 = v13;
  id v18 = (id)[v3 addObserverForName:@"MTTimerManagerTimersUpdated" object:v15 queue:v16 usingBlock:v35];

  v19 = self->_timerManager;
  int v20 = [MEMORY[0x1E4F28F08] mainQueue];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_17;
  v34[3] = &unk_1E5917D18;
  v34[4] = self;
  id v21 = (id)[v3 addObserverForName:@"MTTimerManagerStateReset" object:v19 queue:v20 usingBlock:v34];

  BOOL v22 = self->_timerManager;
  uint64_t v23 = [MEMORY[0x1E4F28F08] mainQueue];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_25;
  v33[3] = &unk_1E5917D18;
  v33[4] = self;
  id v24 = (id)[v3 addObserverForName:@"MTTimerManagerRecentDurationsUpdated" object:v22 queue:v23 usingBlock:v33];

  uint64_t v25 = self->_timerManager;
  id v26 = [MEMORY[0x1E4F28F08] mainQueue];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_27;
  v32[3] = &unk_1E5917D18;
  v32[4] = self;
  id v27 = (id)[v3 addObserverForName:@"MTTimerManagerFavoriteDurationsUpdated" object:v25 queue:v26 usingBlock:v32];

  long long v28 = self->_timerManager;
  id v29 = [MEMORY[0x1E4F28F08] mainQueue];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_3_29;
  v31[3] = &unk_1E5917D18;
  v31[4] = self;
  id v30 = (id)[v3 addObserverForName:@"MTTimerManagerLatestDurationUpdated" object:v28 queue:v29 usingBlock:v31];
}

- (void)unregisterObserver:(id)a3
{
}

uint64_t __46__MTTimerDataSource__registerForNotifications__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_2;
  v4[3] = &unk_1E5917BE8;
  v4[4] = v2;
  return [v2 _handleTimerNotification:a2 block:v4];
}

void __46__MTTimerDataSource__registerForNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_3;
  v6[3] = &unk_1E59180A0;
  v6[4] = v4;
  id v7 = v3;
  id v5 = v3;
  [v4 _iterateObserversWithBlock:v6];
}

void __46__MTTimerDataSource__registerForNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dataSource:*(void *)(a1 + 32) didAddTimers:*(void *)(a1 + 40)];
  }
}

void __46__MTTimerDataSource__registerForNotifications__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = MTLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v5;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ MTTimerManagerTimersRemoved", buf, 0xCu);
  }

  id v6 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_8;
  v7[3] = &unk_1E5917BE8;
  v7[4] = v6;
  [v6 _handleTimerNotification:v3 block:v7];
}

void __46__MTTimerDataSource__registerForNotifications__block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_2_9;
  v6[3] = &unk_1E59180A0;
  v6[4] = v4;
  id v7 = v3;
  id v5 = v3;
  [v4 _iterateObserversWithBlock:v6];
}

void __46__MTTimerDataSource__registerForNotifications__block_invoke_2_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dataSource:*(void *)(a1 + 32) didRemoveTimers:*(void *)(a1 + 40)];
  }
}

void __46__MTTimerDataSource__registerForNotifications__block_invoke_3_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_4_13;
  v6[3] = &unk_1E59180A0;
  v6[4] = v4;
  id v7 = v3;
  id v5 = v3;
  [v4 _iterateObserversWithBlock:v6];
}

void __46__MTTimerDataSource__registerForNotifications__block_invoke_4_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dataSource:*(void *)(a1 + 32) didUpdateTimers:*(void *)(a1 + 40)];
  }
}

void __46__MTTimerDataSource__registerForNotifications__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = MTLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ MTTimerManagerFiringTimerChanged", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) _handleTimerNotification:v3 block:*(void *)(a1 + 40)];
}

void __46__MTTimerDataSource__registerForNotifications__block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = MTLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ MTTimerManagerTimersUpdated", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) _handleTimerNotification:v3 block:*(void *)(a1 + 40)];
}

uint64_t __46__MTTimerDataSource__registerForNotifications__block_invoke_17(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = MTLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ MTTimerManagerStateReset", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) _stateReset];
}

uint64_t __46__MTTimerDataSource__registerForNotifications__block_invoke_25(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_2_26;
  v4[3] = &unk_1E5917BE8;
  v4[4] = v2;
  return [v2 _handleTimerDurationNotification:a2 block:v4];
}

void __46__MTTimerDataSource__registerForNotifications__block_invoke_2_26(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = MTLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ processing recents notification update with durations: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 32) processRecentDurationsUpdated:v3];
}

uint64_t __46__MTTimerDataSource__registerForNotifications__block_invoke_27(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_2_28;
  v4[3] = &unk_1E5917BE8;
  v4[4] = v2;
  return [v2 _handleTimerDurationNotification:a2 block:v4];
}

uint64_t __46__MTTimerDataSource__registerForNotifications__block_invoke_2_28(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processFavoriteDurationsUpdated:a2];
}

uint64_t __46__MTTimerDataSource__registerForNotifications__block_invoke_3_29(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MTTimerDataSource__registerForNotifications__block_invoke_4_30;
  v4[3] = &unk_1E5917BE8;
  v4[4] = v2;
  return [v2 _handleTimerDurationNotification:a2 block:v4];
}

uint64_t __46__MTTimerDataSource__registerForNotifications__block_invoke_4_30(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processLatestDurationsUpdatedWith:a2];
}

- (void)processRecentDurationsUpdated:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__MTTimerDataSource_processRecentDurationsUpdated___block_invoke;
  v6[3] = &unk_1E5915000;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MTTimerDataSource *)self _withLock:v6];
}

uint64_t __51__MTTimerDataSource_processRecentDurationsUpdated___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = MTLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v9 = v3;
    __int16 v10 = 2114;
    uint64_t v11 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ updating recent durations to: %{public}@", buf, 0x16u);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  id v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__MTTimerDataSource_processRecentDurationsUpdated___block_invoke_31;
  v7[3] = &unk_1E59180C8;
  v7[4] = v5;
  return [v5 _iterateObserversWithBlock:v7];
}

void __51__MTTimerDataSource_processRecentDurationsUpdated___block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dataSourceDidReloadRecentDurations:*(void *)(a1 + 32)];
  }
}

- (void)processFavoriteDurationsUpdated:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__MTTimerDataSource_processFavoriteDurationsUpdated___block_invoke;
  v6[3] = &unk_1E5915000;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MTTimerDataSource *)self _withLock:v6];
}

uint64_t __53__MTTimerDataSource_processFavoriteDurationsUpdated___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__MTTimerDataSource_processFavoriteDurationsUpdated___block_invoke_2;
  v4[3] = &unk_1E59180C8;
  v4[4] = v2;
  return [v2 _iterateObserversWithBlock:v4];
}

void __53__MTTimerDataSource_processFavoriteDurationsUpdated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dataSourceDidReloadFavoriteDurations:*(void *)(a1 + 32)];
  }
}

- (void)processLatestDurationsUpdatedWith:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__MTTimerDataSource_processLatestDurationsUpdatedWith___block_invoke;
  v6[3] = &unk_1E5915000;
  id v7 = v4;
  __int16 v8 = self;
  id v5 = v4;
  [(MTTimerDataSource *)self _withLock:v6];
}

uint64_t __55__MTTimerDataSource_processLatestDurationsUpdatedWith___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = [*(id *)(a1 + 32) firstObject];
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(v3 + 72);
    *(void *)(v3 + 72) = v2;
  }
  id v5 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__MTTimerDataSource_processLatestDurationsUpdatedWith___block_invoke_2;
  v7[3] = &unk_1E59180C8;
  v7[4] = v5;
  return [v5 _iterateObserversWithBlock:v7];
}

void __55__MTTimerDataSource_processLatestDurationsUpdatedWith___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dataSourceDidReloadLatestDuration:*(void *)(a1 + 32)];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"MTTimerManagerTimersAdded" object:self->_timerManager];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"MTTimerManagerTimersRemoved" object:self->_timerManager];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"MTTimerManagerFiringTimerChanged" object:self->_timerManager];

  int v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:@"MTTimerManagerTimersUpdated" object:self->_timerManager];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self name:@"MTTimerManagerStateReset" object:self->_timerManager];

  __int16 v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 removeObserver:self name:@"MTTimerManagerRecentDurationsUpdated" object:self->_timerManager];

  uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 removeObserver:self name:@"MTTimerManagerFavoriteDurationsUpdated" object:self->_timerManager];

  __int16 v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 removeObserver:self name:@"MTTimerManagerLatestDurationUpdated" object:self->_timerManager];

  v11.receiver = self;
  v11.super_class = (Class)MTTimerDataSource;
  [(MTTimerDataSource *)&v11 dealloc];
}

- (void)_handleTimerNotification:(id)a3 block:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  __int16 v8 = [v6 userInfo];
  uint64_t v9 = [v8 objectForKey:@"Timers"];

  __int16 v10 = MTLogForCategory(4);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v11 = [v6 name];
    int v13 = 138543874;
    id v14 = self;
    __int16 v15 = 2114;
    uint64_t v16 = v11;
    __int16 v17 = 1024;
    int v18 = [v9 count];
    _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received %{public}@ notification for %d timers.", (uint8_t *)&v13, 0x1Cu);
  }
  id v12 = [(MTTimerDataSource *)self reloadTimers];
  v7[2](v7, v9);
}

- (void)_handleTimerDurationNotification:(id)a3 block:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  __int16 v8 = [v6 userInfo];
  uint64_t v9 = [v8 objectForKey:@"Durations"];

  __int16 v10 = MTLogForCategory(4);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v11 = [v6 name];
    int v12 = 138543874;
    int v13 = self;
    __int16 v14 = 2114;
    __int16 v15 = v11;
    __int16 v16 = 2114;
    __int16 v17 = v9;
    _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received %{public}@ duration payload: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  [(MTTimerDataSource *)self reloadTimerDurations];
  v7[2](v7, v9);
}

- (void)_stateReset
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ received MTTimerManagerStateReset notification.", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(MTTimerDataSource *)self reloadTimers];
}

BOOL __41__MTTimerDataSource_reloadTimerDurations__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 lastModified];
  id v6 = [v4 lastModified];

  BOOL v7 = [v5 compare:v6] == -1;
  return v7;
}

- (unint64_t)numberOfTimers
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  timers = self->_timers;
  return [(NSMutableArray *)timers count];
}

- (id)timerAtRow:(unint64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  timers = self->_timers;
  return (id)[(NSMutableArray *)timers objectAtIndexedSubscript:a3];
}

- (id)activeTimerAtRow:(unint64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  activeTimers = self->_activeTimers;
  return (id)[(NSMutableArray *)activeTimers objectAtIndexedSubscript:a3];
}

- (unint64_t)rowForTimer:(id)a3
{
  id v4 = [a3 timerIDString];
  unint64_t v5 = [(MTTimerDataSource *)self rowForTimerWithID:v4];

  return v5;
}

- (unint64_t)rowForTimerWithID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  timers = self->_timers;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__MTTimerDataSource_rowForTimerWithID___block_invoke;
  v9[3] = &unk_1E5918110;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = [(NSMutableArray *)timers indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __39__MTTimerDataSource_rowForTimerWithID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 timerIDString];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)getDefaultDurations
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  __int16 v8 = __Block_byref_object_copy__16;
  uint64_t v9 = __Block_byref_object_dispose__16;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__MTTimerDataSource_getDefaultDurations__block_invoke;
  v4[3] = &unk_1E5915340;
  v4[4] = self;
  void v4[5] = &v5;
  [(MTTimerDataSource *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __40__MTTimerDataSource_getDefaultDurations__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) defaultDurations];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)getFavoriteDurations
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  __int16 v8 = __Block_byref_object_copy__16;
  uint64_t v9 = __Block_byref_object_dispose__16;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__MTTimerDataSource_getFavoriteDurations__block_invoke;
  v4[3] = &unk_1E5915340;
  v4[4] = self;
  void v4[5] = &v5;
  [(MTTimerDataSource *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __41__MTTimerDataSource_getFavoriteDurations__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) favoriteDurations];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)addTimer:(id)a3
{
  return [(MTTimerDataSource *)self addTimer:a3 reload:1];
}

- (id)addTimer:(id)a3 reload:(BOOL)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(NSMutableArray *)self->_timers addObject:v6];
  uint64_t v7 = [(MTTimerDataSource *)self timerManager];
  __int16 v8 = [v7 addTimer:v6];

  uint64_t v9 = [MEMORY[0x1E4F7A0F0] mtMainThreadScheduler];
  id v10 = [v8 reschedule:v9];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __37__MTTimerDataSource_addTimer_reload___block_invoke;
  v13[3] = &unk_1E5917DB8;
  v13[4] = self;
  BOOL v14 = a4;
  objc_super v11 = [v10 flatMap:v13];

  return v11;
}

uint64_t __37__MTTimerDataSource_addTimer_reload___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadTimersNotifyingObservers:*(unsigned __int8 *)(a1 + 40)];
}

- (id)updateTimer:(id)a3
{
  return [(MTTimerDataSource *)self updateTimer:a3 reload:1];
}

- (id)updateTimer:(id)a3 reload:(BOOL)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  unint64_t v7 = [(MTTimerDataSource *)self rowForTimer:v6];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)self->_timers setObject:v6 atIndexedSubscript:v7];
  }
  __int16 v8 = [(MTTimerDataSource *)self timerManager];
  uint64_t v9 = [v8 updateTimer:v6];
  id v10 = [MEMORY[0x1E4F7A0F0] mtMainThreadScheduler];
  objc_super v11 = [v9 reschedule:v10];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __40__MTTimerDataSource_updateTimer_reload___block_invoke;
  v14[3] = &unk_1E5917DB8;
  v14[4] = self;
  BOOL v15 = a4;
  int v12 = [v11 flatMap:v14];

  return v12;
}

uint64_t __40__MTTimerDataSource_updateTimer_reload___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadTimersNotifyingObservers:*(unsigned __int8 *)(a1 + 40)];
}

- (id)removeTimer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  unint64_t v5 = [(MTTimerDataSource *)self rowForTimer:v4];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)self->_timers removeObjectAtIndex:v5];
  }
  id v6 = [(MTTimerDataSource *)self timerManager];
  unint64_t v7 = [v6 removeTimer:v4];
  __int16 v8 = [MEMORY[0x1E4F7A0F0] mtMainThreadScheduler];
  uint64_t v9 = [v7 reschedule:v8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __33__MTTimerDataSource_removeTimer___block_invoke;
  v12[3] = &unk_1E5915EF8;
  v12[4] = self;
  id v10 = [v9 flatMap:v12];

  return v10;
}

uint64_t __33__MTTimerDataSource_removeTimer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadTimers];
}

- (MTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (MTObserverStore)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSMutableArray)timers
{
  return self->_timers;
}

- (void)setTimers:(id)a3
{
}

- (NSMutableArray)activeTimers
{
  return self->_activeTimers;
}

- (void)setActiveTimers:(id)a3
{
}

- (NSArray)defaultDurations
{
  return self->_defaultDurations;
}

- (os_unfair_lock_s)timerLock
{
  return self->_timerLock;
}

- (void)setTimerLock:(os_unfair_lock_s)a3
{
  self->_timerLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestDuration, 0);
  objc_storeStrong((id *)&self->_favoriteDurations, 0);
  objc_storeStrong((id *)&self->_recentDurations, 0);
  objc_storeStrong((id *)&self->_defaultDurations, 0);
  objc_storeStrong((id *)&self->_activeTimers, 0);
  objc_storeStrong((id *)&self->_timers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
}

void __52__MTTimerDataSource_reloadTimersNotifyingObservers___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ failed reloading: %{public}@");
}

void __41__MTTimerDataSource_reloadTimerDurations__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ reloadTimerDurations failed with error: %{public}@");
}

@end
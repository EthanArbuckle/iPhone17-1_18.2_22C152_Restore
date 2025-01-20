@interface MTTimerManager
+ (double)defaultDuration;
+ (void)setDefaultDuration:(double)a3;
+ (void)warmUp;
- (BOOL)_updateCurrentTimerWithStateSync:(unint64_t)a3;
- (BOOL)pauseCurrentTimerSync;
- (BOOL)resumeCurrentTimerSync;
- (BOOL)startCurrentTimerWithDurationSync:(double)a3;
- (BOOL)stopCurrentTimerSync;
- (MTMetrics)metrics;
- (MTTimerCache)cache;
- (MTTimerManager)init;
- (MTTimerManager)initWithConnectionProvider:(id)a3 metrics:(id)a4;
- (MTTimerManager)initWithConnectionProvider:(id)a3 metrics:(id)a4 notificationCenter:(id)a5;
- (MTTimerManager)initWithMetrics:(id)a3;
- (MTTimerManagerExportedObject)exportedObject;
- (MTXPCConnectionProvider)connectionProvider;
- (NSNotificationCenter)notificationCenter;
- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4;
- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4 notificationCenter:(id)a5;
- (id)_runningTimerFromCurrentTimer:(id)a3 withDuration:(double)a4;
- (id)_updateCurrentTimerWithState:(unint64_t)a3;
- (id)_updateTimer:(id)a3 doSynchronous:(BOOL)a4;
- (id)_validateCanStartTimer:(id)a3;
- (id)addFavoriteDuration:(id)a3;
- (id)addRecentDuration:(id)a3;
- (id)addTimer:(id)a3;
- (id)currentTimer;
- (id)defaultDurations;
- (id)dismissTimerWithIdentifier:(id)a3;
- (id)favoriteDurations;
- (id)getCurrentTimerSync;
- (id)getQueryDurations:(id)a3 withFuture:(id)a4;
- (id)latestDuration;
- (id)nextTimer;
- (id)nextTimersForDate:(id)a3 maxCount:(unint64_t)a4;
- (id)pauseCurrentTimer;
- (id)recentDurations;
- (id)removeFavoriteDuration:(id)a3;
- (id)removeRecentDuration:(id)a3;
- (id)removeTimer:(id)a3;
- (id)repeatTimerWithIdentifier:(id)a3;
- (id)resumeCurrentTimer;
- (id)saveLatestDuration:(id)a3;
- (id)startCurrentTimerWithDuration:(double)a3;
- (id)stopCurrentTimer;
- (id)timerWithIdentifier:(id)a3;
- (id)timers;
- (id)timersSync;
- (id)updateTimer:(id)a3;
- (void)_getCachedTimersWithFuture:(id)a3 finishBlock:(id)a4;
- (void)dealloc;
- (void)loadAllDurationsWithCompletion:(id)a3;
- (void)reconnect;
- (void)setCache:(id)a3;
- (void)setExportedObject:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setNotificationCenter:(id)a3;
@end

@implementation MTTimerManager

uint64_t __49__MTTimerManager_loadAllDurationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 getTimerDurationsWithCompletion:*(void *)(a1 + 32)];
}

void __79__MTTimerManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__MTTimerManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_3;
  v3[3] = &unk_1E5917348;
  id v4 = *(id *)(a1 + 32);
  [a2 getTimersWithCompletion:v3];
}

uint64_t __79__MTTimerManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (MTTimerManager)init
{
  v3 = objc_alloc_init(MTMetrics);
  id v4 = [(MTTimerManager *)self initWithMetrics:v3];

  return v4;
}

- (MTTimerManager)initWithMetrics:(id)a3
{
  return (MTTimerManager *)[(MTTimerManager *)self _initWithConnectionProvidingBlock:&__block_literal_global_32 metrics:a3];
}

- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28EB8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 defaultCenter];
  id v10 = [(MTTimerManager *)self _initWithConnectionProvidingBlock:v8 metrics:v7 notificationCenter:v9];

  return v10;
}

- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4 notificationCenter:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, MTTimerManager *))a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MTTimerManager;
  v11 = [(MTTimerManager *)&v24 init];
  if (v11)
  {
    v12 = MTLogForCategory(4);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_impl(&dword_19CC95000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing...", buf, 0xCu);
    }

    objc_storeStrong((id *)&v11->_notificationCenter, a5);
    v13 = [[MTTimerManagerExportedObject alloc] initWithTimerManager:v11];
    exportedObject = v11->_exportedObject;
    v11->_exportedObject = v13;

    objc_storeStrong((id *)&v11->_metrics, a4);
    uint64_t v15 = v8[2](v8, v11);
    connectionProvider = v11->_connectionProvider;
    v11->_connectionProvider = (MTXPCConnectionProvider *)v15;

    v17 = +[MTUserDefaults sharedUserDefaults];
    [v17 registerNotification:@"MTTimerManagerPreferencesChanged" observer:v11];

    objc_initWeak((id *)buf, v11);
    v18 = [MTTimerCache alloc];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __79__MTTimerManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke;
    v22[3] = &unk_1E5917398;
    objc_copyWeak(&v23, (id *)buf);
    uint64_t v19 = [(MTTimerCache *)v18 initWithUpdateBlock:v22];
    cache = v11->_cache;
    v11->_cache = (MTTimerCache *)v19;

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

  return v11;
}

id __34__MTTimerManager_initWithMetrics___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = MTTimerServerInterface();
  id v4 = [v2 exportedObject];
  v5 = MTTimerClientInterface();
  v6 = +[MTXPCConnectionInfo infoForMachServiceName:@"com.apple.MobileTimer.timerserver" remoteObjectInterface:v3 exportedObject:v4 exportedObjectInterface:v5 lifecycleNotification:@"com.apple.MTTimerServer.wakeup" requiredEntitlement:0 options:4096];

  objc_initWeak(&location, v2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__MTTimerManager_initWithMetrics___block_invoke_2;
  v9[3] = &unk_1E5915428;
  objc_copyWeak(&v10, &location);
  id v7 = +[MTXPCConnectionProvider providerWithConnectionInfo:v6 reconnectHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

- (id)timers
{
  v3 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __24__MTTimerManager_timers__block_invoke;
  v8[3] = &unk_1E59173E0;
  id v4 = v3;
  id v9 = v4;
  v5 = (void *)MEMORY[0x19F3A0FB0](v8);
  [(MTTimerManager *)self _getCachedTimersWithFuture:v4 finishBlock:v5];
  id v6 = v4;

  return v6;
}

- (void)_getCachedTimersWithFuture:(id)a3 finishBlock:(id)a4
{
  id v5 = a4;
  cache = self->_cache;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__MTTimerManager__getCachedTimersWithFuture_finishBlock___block_invoke;
  v8[3] = &unk_1E5917348;
  id v9 = v5;
  id v7 = v5;
  [(MTTimerCache *)cache getCachedTimersWithCompletion:v8];
}

uint64_t __57__MTTimerManager__getCachedTimersWithFuture_finishBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __24__MTTimerManager_timers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2);
}

void __79__MTTimerManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained connectionProvider];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__MTTimerManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_2;
  v11[3] = &unk_1E5917370;
  id v12 = v5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__MTTimerManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_4;
  v9[3] = &unk_1E5914D18;
  id v10 = v12;
  id v8 = v12;
  [v7 performRemoteBlock:v11 withErrorHandler:v9 isSynchronous:a3];
}

- (MTTimerManagerExportedObject)exportedObject
{
  return self->_exportedObject;
}

- (void)loadAllDurationsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MTTimerManager *)self connectionProvider];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__MTTimerManager_loadAllDurationsWithCompletion___block_invoke;
  v9[3] = &unk_1E5917370;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__MTTimerManager_loadAllDurationsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E5914D18;
  id v8 = v10;
  id v6 = v10;
  [v5 performRemoteBlock:v9 withErrorHandler:v7];
}

- (MTXPCConnectionProvider)connectionProvider
{
  return self->_connectionProvider;
}

+ (void)warmUp
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = a1;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ warming...", (uint8_t *)&v6, 0xCu);
  }

  id v4 = MTTimerServerInterface();
  id v5 = MTTimerClientInterface();
}

+ (double)defaultDuration
{
  char v7 = 0;
  id v2 = +[MTUserDefaults sharedUserDefaults];
  [v2 floatForKey:@"MTTimerDefaultDuration" exists:&v7];
  float v4 = v3;

  double result = 900.0;
  if (v7 && v4 != 0.0)
  {
    float v6 = floorf(v4);
    if (v6 < 1.0) {
      float v6 = 1.0;
    }
    return fminf(v6, 86399.0);
  }
  return result;
}

+ (void)setDefaultDuration:(double)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  float v4 = MTLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    uint64_t v9 = objc_opt_class();
    __int16 v10 = 2048;
    double v11 = a3;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ setting default duration to %f", (uint8_t *)&v8, 0x16u);
  }

  float v6 = +[MTUserDefaults sharedUserDefaults];
  float v5 = a3;
  *(float *)&double v7 = v5;
  [v6 setFloat:@"MTTimerDefaultDuration" forKey:@"MTTimerManagerPreferencesChanged" notification:v7];
}

void __34__MTTimerManager_initWithMetrics___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reconnect];
}

- (MTTimerManager)initWithConnectionProvider:(id)a3 metrics:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__MTTimerManager_initWithConnectionProvider_metrics___block_invoke;
  v10[3] = &unk_1E5917320;
  id v11 = v6;
  id v7 = v6;
  int v8 = [(MTTimerManager *)self _initWithConnectionProvidingBlock:v10 metrics:a4];

  return v8;
}

id __53__MTTimerManager_initWithConnectionProvider_metrics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (MTTimerManager)initWithConnectionProvider:(id)a3 metrics:(id)a4 notificationCenter:(id)a5
{
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__MTTimerManager_initWithConnectionProvider_metrics_notificationCenter___block_invoke;
  v12[3] = &unk_1E5917320;
  id v13 = v8;
  id v9 = v8;
  __int16 v10 = [(MTTimerManager *)self _initWithConnectionProvidingBlock:v12 metrics:a4 notificationCenter:a5];

  return v10;
}

id __72__MTTimerManager_initWithConnectionProvider_metrics_notificationCenter___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __79__MTTimerManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  float v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v6 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing...", buf, 0xCu);
  }

  [(MTXPCConnectionProvider *)self->_connectionProvider invalidate];
  v4.receiver = self;
  v4.super_class = (Class)MTTimerManager;
  [(MTTimerManager *)&v4 dealloc];
}

- (void)reconnect
{
  float v3 = [(MTTimerManager *)self cache];
  [v3 markNeedsUpdate];

  id v4 = [(MTTimerManager *)self connectionProvider];
  [v4 performRemoteBlock:&__block_literal_global_64 withErrorHandler:0];
}

uint64_t __27__MTTimerManager_reconnect__block_invoke(uint64_t a1, void *a2)
{
  return [a2 checkIn];
}

- (id)nextTimer
{
  float v3 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __27__MTTimerManager_nextTimer__block_invoke;
  v8[3] = &unk_1E59173E0;
  id v4 = v3;
  id v9 = v4;
  float v5 = (void *)MEMORY[0x19F3A0FB0](v8);
  [(MTTimerManager *)self _getCachedTimersWithFuture:v4 finishBlock:v5];
  id v6 = v4;

  return v6;
}

uint64_t __27__MTTimerManager_nextTimer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4 = *(void **)(a1 + 32);
  if (a3 | a4) {
    return objc_msgSend(v4, "finishWithResult:error:");
  }
  else {
    return [v4 finishWithNoResult];
  }
}

- (id)timerWithIdentifier:(id)a3
{
  float v3 = [(MTTimerManager *)self timers];
  id v4 = [v3 flatMap:&__block_literal_global_68];

  return v4;
}

id __38__MTTimerManager_timerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "na_firstObjectPassingTest:", &__block_literal_global_71);
  float v3 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v3;
}

uint64_t __38__MTTimerManager_timerWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isCurrentTimer];
}

- (id)timersSync
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__10;
  __int16 v10 = __Block_byref_object_dispose__10;
  id v11 = 0;
  cache = self->_cache;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__MTTimerManager_timersSync__block_invoke;
  v5[3] = &unk_1E5917448;
  v5[4] = self;
  v5[5] = &v6;
  [(MTTimerCache *)cache getCachedTimersSyncWithCompletion:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __28__MTTimerManager_timersSync__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = MTLogForCategory(4);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __28__MTTimerManager_timersSync__block_invoke_cold_1(a1, (uint64_t)v6, v7);
    }
  }
  else
  {
    uint64_t v8 = [a2 copy];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    __int16 v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (id)nextTimersForDate:(id)a3 maxCount:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v8 = [v7 components:30 fromDate:v6];
  uint64_t v9 = [v7 dateFromComponents:v8];
  __int16 v10 = [(MTTimerManager *)self timers];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __45__MTTimerManager_nextTimersForDate_maxCount___block_invoke;
  v16[3] = &unk_1E5917498;
  id v17 = v6;
  id v18 = v7;
  id v19 = v9;
  unint64_t v20 = a4;
  id v11 = v9;
  id v12 = v7;
  id v13 = v6;
  v14 = [v10 flatMap:v16];

  return v14;
}

id __45__MTTimerManager_nextTimersForDate_maxCount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__MTTimerManager_nextTimersForDate_maxCount___block_invoke_2;
  v8[3] = &unk_1E5917470;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v12 = v4;
  uint64_t v13 = *(void *)(a1 + 56);
  id v5 = v4;
  [v3 enumerateObjectsUsingBlock:v8];

  id v6 = [MEMORY[0x1E4F7A0D8] futureWithResult:v5];

  return v6;
}

void __45__MTTimerManager_nextTimersForDate_maxCount___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if ([v10 state] == 3)
  {
    id v6 = [v10 nextTriggerAfterDate:*(void *)(a1 + 32)];
    uint64_t v7 = [v6 triggerDate];

    if (v7)
    {
      uint64_t v8 = [*(id *)(a1 + 40) components:30 fromDate:v7];
      id v9 = [*(id *)(a1 + 40) dateFromComponents:v8];
      if ([*(id *)(a1 + 48) isEqualToDate:v9]) {
        [*(id *)(a1 + 56) addObject:v10];
      }
    }
    else
    {
      NSLog(&cfstr_TimerIsRunning.isa);
    }
  }
  if ((unint64_t)[*(id *)(a1 + 56) count] >= *(void *)(a1 + 64)) {
    *a4 = 1;
  }
}

- (id)addTimer:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = MTLogForCategory(4);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 timerIDString];
    *(_DWORD *)buf = 138543618;
    unint64_t v20 = self;
    __int16 v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ addTimer:%{public}@", buf, 0x16u);
  }
  if (![v5 state])
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"MTTimerManager.m" lineNumber:293 description:@"State can't be unknown"];
  }
  uint64_t v8 = objc_opt_new();
  id v9 = MTNewChildActivityForName(12);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__MTTimerManager_addTimer___block_invoke;
  block[3] = &unk_1E5915078;
  block[4] = self;
  id v17 = v5;
  id v10 = v8;
  id v18 = v10;
  id v11 = v5;
  os_activity_apply(v9, block);

  id v12 = v18;
  id v13 = v10;

  return v13;
}

void __27__MTTimerManager_addTimer___block_invoke(id *a1)
{
  id v2 = [a1[4] cache];
  [v2 markNeedsUpdate];

  id v3 = [a1[4] connectionProvider];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__MTTimerManager_addTimer___block_invoke_2;
  v5[3] = &unk_1E59174C0;
  id v6 = a1[5];
  id v7 = a1[6];
  id v4 = objc_msgSend(a1[6], "errorOnlyCompletionHandlerAdapter", v5[0], 3221225472, __27__MTTimerManager_addTimer___block_invoke_2, &unk_1E59174C0);
  [v3 performRemoteBlock:v5 withErrorHandler:v4];

  [*((id *)a1[4] + 3) logTimerAdded];
}

void __27__MTTimerManager_addTimer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTTimerManager - Adding Timer", v7, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) errorOnlyCompletionHandlerAdapter];
  [v3 addTimer:v5 withCompletion:v6];
}

- (id)_updateTimer:(id)a3 doSynchronous:(BOOL)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = MTLogForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 timerIDString];
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = self;
    __int16 v24 = 2114;
    v25 = v9;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ updateTimer:%{public}@", buf, 0x16u);
  }
  if (![v7 state])
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"MTTimerManager.m" lineNumber:315 description:@"State can't be unknown"];
  }
  id v10 = objc_opt_new();
  id v11 = MTNewChildActivityForName(13);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __45__MTTimerManager__updateTimer_doSynchronous___block_invoke;
  v18[3] = &unk_1E59174E8;
  v18[4] = self;
  id v19 = v7;
  id v12 = v10;
  id v20 = v12;
  BOOL v21 = a4;
  id v13 = v7;
  os_activity_apply(v11, v18);

  v14 = v20;
  id v15 = v12;

  return v15;
}

void __45__MTTimerManager__updateTimer_doSynchronous___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cache];
  [v2 markNeedsUpdate];

  id v3 = [*(id *)(a1 + 32) connectionProvider];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__MTTimerManager__updateTimer_doSynchronous___block_invoke_2;
  v5[3] = &unk_1E59174C0;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v4 = objc_msgSend(*(id *)(a1 + 48), "errorOnlyCompletionHandlerAdapter", v5[0], 3221225472, __45__MTTimerManager__updateTimer_doSynchronous___block_invoke_2, &unk_1E59174C0);
  [v3 performRemoteBlock:v5 withErrorHandler:v4 isSynchronous:*(unsigned __int8 *)(a1 + 56)];

  [*(id *)(*(void *)(a1 + 32) + 24) logTimerUpdated];
}

void __45__MTTimerManager__updateTimer_doSynchronous___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTTimerManager - Updating Timer", v7, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) errorOnlyCompletionHandlerAdapter];
  [v3 updateTimer:v5 withCompletion:v6];
}

- (id)updateTimer:(id)a3
{
  return [(MTTimerManager *)self _updateTimer:a3 doSynchronous:0];
}

- (id)removeTimer:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 timerIDString];
    *(_DWORD *)buf = 138543618;
    id v18 = self;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ removeTimer:%{public}@", buf, 0x16u);
  }
  id v7 = objc_opt_new();
  uint64_t v8 = MTNewChildActivityForName(14);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__MTTimerManager_removeTimer___block_invoke;
  block[3] = &unk_1E5915078;
  block[4] = self;
  id v15 = v4;
  id v9 = v7;
  id v16 = v9;
  id v10 = v4;
  os_activity_apply(v8, block);

  id v11 = v16;
  id v12 = v9;

  return v12;
}

void __30__MTTimerManager_removeTimer___block_invoke(id *a1)
{
  id v2 = [a1[4] cache];
  [v2 markNeedsUpdate];

  id v3 = [a1[4] connectionProvider];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__MTTimerManager_removeTimer___block_invoke_2;
  v5[3] = &unk_1E59174C0;
  id v6 = a1[5];
  id v7 = a1[6];
  id v4 = objc_msgSend(a1[6], "errorOnlyCompletionHandlerAdapter", v5[0], 3221225472, __30__MTTimerManager_removeTimer___block_invoke_2, &unk_1E59174C0);
  [v3 performRemoteBlock:v5 withErrorHandler:v4];

  [*((id *)a1[4] + 3) logTimerDeleted];
}

void __30__MTTimerManager_removeTimer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTTimerManager - Removing Timer", v7, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) errorOnlyCompletionHandlerAdapter];
  [v3 removeTimer:v5 withCompletion:v6];
}

- (id)dismissTimerWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = self;
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissTimerWithIdentifier:%{public}@", buf, 0x16u);
  }

  id v6 = objc_opt_new();
  id v7 = MTNewChildActivityForName(15);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MTTimerManager_dismissTimerWithIdentifier___block_invoke;
  block[3] = &unk_1E5915078;
  block[4] = self;
  id v14 = v4;
  id v8 = v6;
  id v15 = v8;
  id v9 = v4;
  os_activity_apply(v7, block);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

void __45__MTTimerManager_dismissTimerWithIdentifier___block_invoke(id *a1)
{
  id v2 = [a1[4] cache];
  [v2 markNeedsUpdate];

  id v3 = [a1[4] connectionProvider];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__MTTimerManager_dismissTimerWithIdentifier___block_invoke_2;
  v5[3] = &unk_1E59174C0;
  id v6 = a1[5];
  id v7 = a1[6];
  id v4 = objc_msgSend(a1[6], "errorOnlyCompletionHandlerAdapter", v5[0], 3221225472, __45__MTTimerManager_dismissTimerWithIdentifier___block_invoke_2, &unk_1E59174C0);
  [v3 performRemoteBlock:v5 withErrorHandler:v4];

  [*((id *)a1[4] + 3) logTimerDismissed];
}

void __45__MTTimerManager_dismissTimerWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTTimerManager - Dismissing Timer", v7, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) errorOnlyCompletionHandlerAdapter];
  [v3 dismissTimerWithIdentifier:v5 withCompletion:v6];
}

- (id)repeatTimerWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = self;
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ repeatTimerWithIdentifier:%{public}@", buf, 0x16u);
  }

  id v6 = objc_opt_new();
  id v7 = MTNewChildActivityForName(16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MTTimerManager_repeatTimerWithIdentifier___block_invoke;
  block[3] = &unk_1E5915078;
  block[4] = self;
  id v14 = v4;
  id v8 = v6;
  id v15 = v8;
  id v9 = v4;
  os_activity_apply(v7, block);

  id v10 = v15;
  id v11 = v8;

  return v11;
}

void __44__MTTimerManager_repeatTimerWithIdentifier___block_invoke(id *a1)
{
  id v2 = [a1[4] cache];
  [v2 markNeedsUpdate];

  id v3 = [a1[4] connectionProvider];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__MTTimerManager_repeatTimerWithIdentifier___block_invoke_2;
  v5[3] = &unk_1E59174C0;
  id v6 = a1[5];
  id v7 = a1[6];
  id v4 = objc_msgSend(a1[6], "errorOnlyCompletionHandlerAdapter", v5[0], 3221225472, __44__MTTimerManager_repeatTimerWithIdentifier___block_invoke_2, &unk_1E59174C0);
  [v3 performRemoteBlock:v5 withErrorHandler:v4];

  [*((id *)a1[4] + 3) logTimerRepeated];
}

void __44__MTTimerManager_repeatTimerWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTTimerManager - Repeating Timer", v7, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) errorOnlyCompletionHandlerAdapter];
  [v3 repeatTimerWithIdentifier:v5 withCompletion:v6];
}

- (id)currentTimer
{
  id v2 = [(MTTimerManager *)self timers];
  id v3 = [v2 flatMap:&__block_literal_global_86];

  return v3;
}

id __30__MTTimerManager_currentTimer__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = +[MTTimer currentTimerFromTimers:a2];
  id v3 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v3;
}

- (id)_updateCurrentTimerWithState:(unint64_t)a3
{
  if (!a3)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MTTimerManager.m" lineNumber:414 description:@"State can't be unknown"];
  }
  uint64_t v5 = [(MTTimerManager *)self currentTimer];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__MTTimerManager__updateCurrentTimerWithState___block_invoke;
  v10[3] = &unk_1E5917510;
  void v10[4] = self;
  v10[5] = a3;
  id v6 = [v5 flatMap:v10];

  return v6;
}

id __47__MTTimerManager__updateCurrentTimerWithState___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 timerByUpdatingWithState:*(void *)(a1 + 40)];
  id v4 = [v2 updateTimer:v3];

  return v4;
}

- (id)stopCurrentTimer
{
  return [(MTTimerManager *)self _updateCurrentTimerWithState:1];
}

- (id)pauseCurrentTimer
{
  return [(MTTimerManager *)self _updateCurrentTimerWithState:2];
}

- (id)resumeCurrentTimer
{
  return [(MTTimerManager *)self _updateCurrentTimerWithState:3];
}

- (id)_validateCanStartTimer:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 state] == 1)
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = NSString;
    id v7 = [v4 timerIDString];
    id v8 = [v6 stringWithFormat:@"%@ cannot restart a timer (%@) that isn't stopped.", self, v7];

    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = v8;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t v5 = [v9 errorWithDomain:@"com.apple.mobiletimerd.MTTimerManager" code:1 userInfo:v10];

    id v11 = MTLogForCategory(4);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MTTimerStorage _queue_updateTimer:withCompletion:source:]((uint64_t)v8, v11);
    }
  }
  return v5;
}

- (id)_runningTimerFromCurrentTimer:(id)a3 withDuration:(double)a4
{
  uint64_t v5 = (void *)[a3 mutableCopy];
  [v5 setDuration:a4];
  [v5 setState:3];
  return v5;
}

- (id)startCurrentTimerWithDuration:(double)a3
{
  uint64_t v5 = [(MTTimerManager *)self currentTimer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__MTTimerManager_startCurrentTimerWithDuration___block_invoke;
  v8[3] = &unk_1E5917510;
  void v8[4] = self;
  *(double *)&v8[5] = a3;
  id v6 = [v5 flatMap:v8];

  return v6;
}

id __48__MTTimerManager_startCurrentTimerWithDuration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _validateCanStartTimer:v3];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F7A0D8] futureWithError:v4];
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v6 _runningTimerFromCurrentTimer:v3 withDuration:*(double *)(a1 + 40)];
    uint64_t v5 = [v6 updateTimer:v7];
  }
  return v5;
}

- (id)getCurrentTimerSync
{
  id v2 = [(MTTimerManager *)self timersSync];
  id v3 = +[MTTimer currentTimerFromTimers:v2];

  return v3;
}

- (BOOL)startCurrentTimerWithDurationSync:(double)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  id v6 = [(MTTimerManager *)self getCurrentTimerSync];
  id v7 = [(MTTimerManager *)self _validateCanStartTimer:v6];
  if (v7)
  {
    BOOL v8 = 0;
    *((unsigned char *)v16 + 24) = 0;
  }
  else
  {
    id v9 = [(MTTimerManager *)self _runningTimerFromCurrentTimer:v6 withDuration:a3];
    id v10 = [(MTTimerManager *)self _updateTimer:v9 doSynchronous:1];
    if (([v10 isFinished] & 1) == 0)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"MTTimerManager.m", 490, @"Start timer isn't finished, but expected it to be" object file lineNumber description];
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __52__MTTimerManager_startCurrentTimerWithDurationSync___block_invoke;
    v14[3] = &unk_1E5917538;
    v14[4] = &v15;
    id v11 = (id)[v10 addCompletionBlock:v14];

    BOOL v8 = *((unsigned char *)v16 + 24) != 0;
  }

  _Block_object_dispose(&v15, 8);
  return v8;
}

uint64_t __52__MTTimerManager_startCurrentTimerWithDurationSync___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3 == 0;
  return result;
}

- (BOOL)_updateCurrentTimerWithStateSync:(unint64_t)a3
{
  if (!a3)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MTTimerManager.m" lineNumber:501 description:@"State can't be unknown"];
  }
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  id v6 = [(MTTimerManager *)self getCurrentTimerSync];
  id v7 = [v6 timerByUpdatingWithState:a3];
  BOOL v8 = [(MTTimerManager *)self _updateTimer:v7 doSynchronous:1];

  if (([v8 isFinished] & 1) == 0)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"MTTimerManager.m", 507, @"Update Timer isn't finished, but expected it to be" object file lineNumber description];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __51__MTTimerManager__updateCurrentTimerWithStateSync___block_invoke;
  v14[3] = &unk_1E5917538;
  v14[4] = &v15;
  id v9 = (id)[v8 addCompletionBlock:v14];
  char v10 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t __51__MTTimerManager__updateCurrentTimerWithStateSync___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3 == 0;
  return result;
}

- (BOOL)stopCurrentTimerSync
{
  return [(MTTimerManager *)self _updateCurrentTimerWithStateSync:1];
}

- (BOOL)pauseCurrentTimerSync
{
  return [(MTTimerManager *)self _updateCurrentTimerWithStateSync:2];
}

- (BOOL)resumeCurrentTimerSync
{
  return [(MTTimerManager *)self _updateCurrentTimerWithStateSync:3];
}

uint64_t __49__MTTimerManager_loadAllDurationsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)recentDurations
{
  id v3 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__MTTimerManager_recentDurations__block_invoke;
  v9[3] = &unk_1E5917560;
  id v4 = v3;
  id v10 = v4;
  uint64_t v5 = (void *)MEMORY[0x19F3A0FB0](v9);
  id v6 = [(MTTimerManager *)self getQueryDurations:v5 withFuture:v4];
  id v7 = v4;

  return v7;
}

uint64_t __33__MTTimerManager_recentDurations__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a6];
}

- (id)getQueryDurations:(id)a3 withFuture:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MTTimerManager *)self connectionProvider];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__MTTimerManager_getQueryDurations_withFuture___block_invoke;
  v12[3] = &unk_1E5917370;
  id v13 = v6;
  id v9 = v6;
  id v10 = [v7 errorOnlyCompletionHandlerAdapter];
  [v8 performRemoteBlock:v12 withErrorHandler:v10];

  return v7;
}

uint64_t __47__MTTimerManager_getQueryDurations_withFuture___block_invoke(uint64_t a1, void *a2)
{
  return [a2 getTimerDurationsWithCompletion:*(void *)(a1 + 32)];
}

- (id)addRecentDuration:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    char v18 = self;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ addRecentDuration: %{public}@", buf, 0x16u);
  }

  id v6 = objc_opt_new();
  id v7 = [(MTTimerManager *)self connectionProvider];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  id v15 = v4;
  id v8 = v6;
  id v16 = v8;
  id v9 = v4;
  id v10 = objc_msgSend(v8, "errorOnlyCompletionHandlerAdapter", v14, 3221225472, __36__MTTimerManager_addRecentDuration___block_invoke, &unk_1E59174C0);
  [v7 performRemoteBlock:&v14 withErrorHandler:v10];

  id v11 = v16;
  id v12 = v8;

  return v12;
}

void __36__MTTimerManager_addRecentDuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 errorOnlyCompletionHandlerAdapter];
  [v4 addRecentDuration:v2 withCompletion:v5];
}

- (id)removeRecentDuration:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MTLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    char v18 = self;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ removeRecentDuration: %{public}@", buf, 0x16u);
  }

  id v6 = objc_opt_new();
  id v7 = [(MTTimerManager *)self connectionProvider];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  id v15 = v4;
  id v8 = v6;
  id v16 = v8;
  id v9 = v4;
  id v10 = objc_msgSend(v8, "errorOnlyCompletionHandlerAdapter", v14, 3221225472, __39__MTTimerManager_removeRecentDuration___block_invoke, &unk_1E59174C0);
  [v7 performRemoteBlock:&v14 withErrorHandler:v10];

  id v11 = v16;
  id v12 = v8;

  return v12;
}

void __39__MTTimerManager_removeRecentDuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 errorOnlyCompletionHandlerAdapter];
  [v4 removeRecentDuration:v2 withCompletion:v5];
}

- (id)defaultDurations
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ running query for default durations", buf, 0xCu);
  }

  id v4 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__MTTimerManager_defaultDurations__block_invoke;
  v10[3] = &unk_1E5917560;
  id v5 = v4;
  id v11 = v5;
  id v6 = (void *)MEMORY[0x19F3A0FB0](v10);
  id v7 = [(MTTimerManager *)self getQueryDurations:v6 withFuture:v5];
  id v8 = v5;

  return v8;
}

uint64_t __34__MTTimerManager_defaultDurations__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [*(id *)(a1 + 32) finishWithResult:a4 error:a6];
}

- (id)favoriteDurations
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ running query for favorite durations", buf, 0xCu);
  }

  id v4 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __35__MTTimerManager_favoriteDurations__block_invoke;
  v10[3] = &unk_1E5917560;
  id v5 = v4;
  id v11 = v5;
  id v6 = (void *)MEMORY[0x19F3A0FB0](v10);
  id v7 = [(MTTimerManager *)self getQueryDurations:v6 withFuture:v5];
  id v8 = v5;

  return v8;
}

uint64_t __35__MTTimerManager_favoriteDurations__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [*(id *)(a1 + 32) finishWithResult:a3 error:a6];
}

- (id)addFavoriteDuration:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MTLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    char v18 = self;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ addFavoriteDuration: %{public}@", buf, 0x16u);
  }

  id v6 = objc_opt_new();
  id v7 = [(MTTimerManager *)self connectionProvider];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  id v15 = v4;
  id v8 = v6;
  id v16 = v8;
  id v9 = v4;
  id v10 = objc_msgSend(v8, "errorOnlyCompletionHandlerAdapter", v14, 3221225472, __38__MTTimerManager_addFavoriteDuration___block_invoke, &unk_1E59174C0);
  [v7 performRemoteBlock:&v14 withErrorHandler:v10];

  id v11 = v16;
  id v12 = v8;

  return v12;
}

void __38__MTTimerManager_addFavoriteDuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 errorOnlyCompletionHandlerAdapter];
  [v4 addFavoriteDuration:v2 withCompletion:v5];
}

- (id)removeFavoriteDuration:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MTLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    char v18 = self;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ removeFavoriteDuration: %{public}@", buf, 0x16u);
  }

  id v6 = objc_opt_new();
  id v7 = [(MTTimerManager *)self connectionProvider];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  id v15 = v4;
  id v8 = v6;
  id v16 = v8;
  id v9 = v4;
  id v10 = objc_msgSend(v8, "errorOnlyCompletionHandlerAdapter", v14, 3221225472, __41__MTTimerManager_removeFavoriteDuration___block_invoke, &unk_1E59174C0);
  [v7 performRemoteBlock:&v14 withErrorHandler:v10];

  id v11 = v16;
  id v12 = v8;

  return v12;
}

void __41__MTTimerManager_removeFavoriteDuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 errorOnlyCompletionHandlerAdapter];
  [v4 removeFavoriteDuration:v2 withCompletion:v5];
}

- (id)latestDuration
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ running query for latest duration", buf, 0xCu);
  }

  id v4 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__MTTimerManager_latestDuration__block_invoke;
  v10[3] = &unk_1E5917560;
  id v5 = v4;
  id v11 = v5;
  id v6 = (void *)MEMORY[0x19F3A0FB0](v10);
  id v7 = [(MTTimerManager *)self getQueryDurations:v6 withFuture:v5];
  id v8 = v5;

  return v8;
}

uint64_t __32__MTTimerManager_latestDuration__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [*(id *)(a1 + 32) finishWithResult:a5 error:a6];
}

- (id)saveLatestDuration:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MTLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    char v18 = self;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ saveLatestDuration: %{public}@", buf, 0x16u);
  }

  id v6 = objc_opt_new();
  id v7 = [(MTTimerManager *)self connectionProvider];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  id v15 = v4;
  id v8 = v6;
  id v16 = v8;
  id v9 = v4;
  id v10 = objc_msgSend(v8, "errorOnlyCompletionHandlerAdapter", v14, 3221225472, __37__MTTimerManager_saveLatestDuration___block_invoke, &unk_1E59174C0);
  [v7 performRemoteBlock:&v14 withErrorHandler:v10];

  id v11 = v16;
  id v12 = v8;

  return v12;
}

void __37__MTTimerManager_saveLatestDuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 errorOnlyCompletionHandlerAdapter];
  [v4 saveLatestDuration:v2 withCompletion:v5];
}

- (void)setExportedObject:(id)a3
{
}

- (MTMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (MTTimerCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_exportedObject, 0);
}

void __28__MTTimerManager_timersSync__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "%{public}@ Error getting timers:%{public}@", (uint8_t *)&v4, 0x16u);
}

@end
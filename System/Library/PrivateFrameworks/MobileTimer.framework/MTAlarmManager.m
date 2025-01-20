@interface MTAlarmManager
+ (id)_filterSleepAlarmOverrides:(id)a3 date:(id)a4;
+ (id)_filteredAlarms:(id)a3 afterDate:(id)a4 maxCount:(unint64_t)a5 filter:(id)a6;
+ (id)_sortedAlarms:(id)a3 date:(id)a4 includeBedtimeNotification:(BOOL)a5;
+ (id)assistantSyncNotificationName;
+ (void)warmUp;
- (MTAlarmCache)cache;
- (MTAlarmManager)init;
- (MTAlarmManager)initWithConnectionProvider:(id)a3 metrics:(id)a4;
- (MTAlarmManager)initWithConnectionProvider:(id)a3 metrics:(id)a4 notificationCenter:(id)a5;
- (MTAlarmManager)initWithMetrics:(id)a3;
- (MTAlarmManagerExportedObject)exportedObject;
- (MTMetrics)metrics;
- (MTXPCConnectionProvider)connectionProvider;
- (NSNotificationCenter)notificationCenter;
- (id)_alarmWithIDStringAsync:(id)a3;
- (id)_alarmsIncludingSleepAlarm:(BOOL)a3 doSynchronous:(BOOL)a4;
- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4;
- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4 notificationCenter:(id)a5;
- (id)_nextAlarmsForDate:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5 includeBedtimeNotification:(BOOL)a6 doSynchronous:(BOOL)a7;
- (id)_nextAlarmsInRange:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5 includeBedtimeNotification:(BOOL)a6 doSynchronous:(BOOL)a7;
- (id)_sortedNextAlarmsAfterDate:(id)a3 includeSleepAlarm:(BOOL)a4 includeBedtimeNotification:(BOOL)a5;
- (id)_sortedNextAlarmsAfterDate:(id)a3 includeSleepAlarm:(BOOL)a4 includeBedtimeNotification:(BOOL)a5 doSynchronous:(BOOL)a6;
- (id)addAlarm:(id)a3;
- (id)alarmAtIndex:(unint64_t)a3;
- (id)alarmWithIDString:(id)a3;
- (id)alarmWithIDString:(id)a3 includeSleep:(BOOL)a4;
- (id)alarms;
- (id)alarmsIncludingSleepAlarm:(BOOL)a3;
- (id)alarmsSync;
- (id)alarmsSyncIncludingSleepAlarm:(BOOL)a3;
- (id)dismissAlarmWithIdentifier:(id)a3;
- (id)dismissAlarmWithIdentifier:(id)a3 dismissAction:(unint64_t)a4;
- (id)nextAlarm;
- (id)nextAlarmInHoursThreshold:(int64_t)a3;
- (id)nextAlarmSync;
- (id)nextAlarmsForDate:(id)a3 maxCount:(unint64_t)a4;
- (id)nextAlarmsForDate:(id)a3 maxCount:(unint64_t)a4 includeBedtimeNotification:(BOOL)a5;
- (id)nextAlarmsForDate:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5;
- (id)nextAlarmsForDate:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5 includeBedtimeNotification:(BOOL)a6;
- (id)nextAlarmsForDateSync:(id)a3 maxCount:(unint64_t)a4;
- (id)nextAlarmsForDateSync:(id)a3 maxCount:(unint64_t)a4 includeBedtimeNotification:(BOOL)a5;
- (id)nextAlarmsForDateSync:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5;
- (id)nextAlarmsForDateSync:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5 includeBedtimeNotification:(BOOL)a6;
- (id)nextAlarmsInRange:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5;
- (id)nextAlarmsInRange:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5 includeBedtimeNotification:(BOOL)a6;
- (id)nextAlarmsInRangeSync:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5;
- (id)nextAlarmsInRangeSync:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5 includeBedtimeNotification:(BOOL)a6;
- (id)nextExpectedRefreshDate;
- (id)nextFutureAlarmDate;
- (id)nextSleepAlarm;
- (id)nextWidgetAlarmInThreshold;
- (id)removeAlarm:(id)a3;
- (id)resetSleepAlarmSnoozeState;
- (id)sleepAlarm;
- (id)sleepAlarmSync;
- (id)sleepAlarms;
- (id)sleepAlarmsSync;
- (id)snoozeAlarmWithIdentifier:(id)a3;
- (id)snoozeAlarmWithIdentifier:(id)a3 snoozeAction:(unint64_t)a4;
- (id)updateAlarm:(id)a3;
- (id)updateSleepAlarms;
- (unint64_t)alarmCount;
- (unint64_t)alarmCountIncludingSleepAlarm:(BOOL)a3;
- (unint64_t)firingAlarmCount;
- (unint64_t)indexForAlarm:(id)a3;
- (void)_getCachedAlarmsWithFuture:(id)a3 finishBlock:(id)a4;
- (void)checkIn;
- (void)dealloc;
- (void)reconnect;
- (void)setCache:(id)a3;
- (void)setExportedObject:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setNotificationCenter:(id)a3;
@end

@implementation MTAlarmManager

uint64_t __59__MTAlarmManager__alarmsIncludingSleepAlarm_doSynchronous___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __79__MTAlarmManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__MTAlarmManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_3;
  v3[3] = &unk_1E5917658;
  id v4 = *(id *)(a1 + 32);
  [a2 getAlarmsWithCompletion:v3];
}

uint64_t __79__MTAlarmManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (MTAlarmManager)init
{
  v3 = objc_alloc_init(MTMetrics);
  id v4 = [(MTAlarmManager *)self initWithMetrics:v3];

  return v4;
}

- (MTAlarmManager)initWithMetrics:(id)a3
{
  return (MTAlarmManager *)[(MTAlarmManager *)self _initWithConnectionProvidingBlock:&__block_literal_global_34 metrics:a3];
}

- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28EB8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 defaultCenter];
  id v10 = [(MTAlarmManager *)self _initWithConnectionProvidingBlock:v8 metrics:v7 notificationCenter:v9];

  return v10;
}

- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4 notificationCenter:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, MTAlarmManager *))a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MTAlarmManager;
  v11 = [(MTAlarmManager *)&v23 init];
  if (v11)
  {
    v12 = MTLogForCategory(3);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_impl(&dword_19CC95000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing...", buf, 0xCu);
    }

    objc_storeStrong((id *)&v11->_notificationCenter, a5);
    v13 = [[MTAlarmManagerExportedObject alloc] initWithAlarmManager:v11];
    exportedObject = v11->_exportedObject;
    v11->_exportedObject = v13;

    objc_storeStrong((id *)&v11->_metrics, a4);
    uint64_t v15 = v8[2](v8, v11);
    connectionProvider = v11->_connectionProvider;
    v11->_connectionProvider = (MTXPCConnectionProvider *)v15;

    objc_initWeak((id *)buf, v11);
    v17 = [MTAlarmCache alloc];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __79__MTAlarmManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke;
    v21[3] = &unk_1E59176A8;
    objc_copyWeak(&v22, (id *)buf);
    uint64_t v18 = [(MTAlarmCache *)v17 initWithUpdateBlock:v21];
    cache = v11->_cache;
    v11->_cache = (MTAlarmCache *)v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }

  return v11;
}

id __34__MTAlarmManager_initWithMetrics___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = MTAlarmServerInterface();
  id v4 = [v2 exportedObject];
  v5 = MTAlarmClientInterface();
  v6 = +[MTXPCConnectionInfo infoForMachServiceName:@"com.apple.MobileTimer.alarmserver" remoteObjectInterface:v3 exportedObject:v4 exportedObjectInterface:v5 lifecycleNotification:@"com.apple.MTAlarmServer.wakeup" requiredEntitlement:0 options:4096];

  objc_initWeak(&location, v2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__MTAlarmManager_initWithMetrics___block_invoke_2;
  v9[3] = &unk_1E5915428;
  objc_copyWeak(&v10, &location);
  id v7 = +[MTXPCConnectionProvider providerWithConnectionInfo:v6 reconnectHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

- (id)alarmsIncludingSleepAlarm:(BOOL)a3
{
  return [(MTAlarmManager *)self _alarmsIncludingSleepAlarm:a3 doSynchronous:0];
}

- (id)_alarmsIncludingSleepAlarm:(BOOL)a3 doSynchronous:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = objc_opt_new();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __59__MTAlarmManager__alarmsIncludingSleepAlarm_doSynchronous___block_invoke;
  v24[3] = &__block_descriptor_33_e62___NSArray_40__0__NSArray_8__NSArray_16__MTAlarm_24__NSError_32l;
  BOOL v25 = a3;
  uint64_t v8 = MEMORY[0x19F3A0FB0](v24);
  id v9 = (void *)v8;
  if (v4)
  {
    cache = self->_cache;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59__MTAlarmManager__alarmsIncludingSleepAlarm_doSynchronous___block_invoke_3;
    v21[3] = &unk_1E5917718;
    v11 = &v22;
    v12 = &v23;
    id v22 = v7;
    objc_super v23 = v9;
    id v13 = v9;
    [(MTAlarmCache *)cache getCachedAlarmsSyncWithCompletion:v21];
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__MTAlarmManager__alarmsIncludingSleepAlarm_doSynchronous___block_invoke_4;
    v18[3] = &unk_1E5917740;
    v11 = (id *)&v20;
    uint64_t v20 = v8;
    v12 = &v19;
    id v14 = v7;
    id v19 = v14;
    id v15 = v9;
    v16 = (void *)MEMORY[0x19F3A0FB0](v18);
    [(MTAlarmManager *)self _getCachedAlarmsWithFuture:v14 finishBlock:v16];
  }
  return v7;
}

- (void)_getCachedAlarmsWithFuture:(id)a3 finishBlock:(id)a4
{
  id v5 = a4;
  cache = self->_cache;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__MTAlarmManager__getCachedAlarmsWithFuture_finishBlock___block_invoke;
  v8[3] = &unk_1E5917658;
  id v9 = v5;
  id v7 = v5;
  [(MTAlarmCache *)cache getCachedAlarmsWithCompletion:v8];
}

void __59__MTAlarmManager__alarmsIncludingSleepAlarm_doSynchronous___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, id))(v9 + 16);
  id v11 = a5;
  v10(v9, a2, a3, a4, v11);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) finishWithResult:v12 error:v11];
}

id __59__MTAlarmManager__alarmsIncludingSleepAlarm_doSynchronous___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v8 = a3;
  if (a5)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithArray:a2];
    [v9 sortUsingComparator:&__block_literal_global_57];
    if (*(unsigned char *)(a1 + 32)) {
      objc_msgSend(v9, "na_safeAddObjectsFromArray:", v8);
    }
  }

  return v9;
}

uint64_t __57__MTAlarmManager__getCachedAlarmsWithFuture_finishBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__MTAlarmManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained connectionProvider];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__MTAlarmManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_2;
  v11[3] = &unk_1E5917680;
  id v12 = v5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__MTAlarmManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_4;
  v9[3] = &unk_1E5914D18;
  id v10 = v12;
  id v8 = v12;
  [v7 performRemoteBlock:v11 withErrorHandler:v9 isSynchronous:a3];
}

- (MTAlarmManagerExportedObject)exportedObject
{
  return self->_exportedObject;
}

- (MTXPCConnectionProvider)connectionProvider
{
  return self->_connectionProvider;
}

+ (void)warmUp
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = a1;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ warming...", (uint8_t *)&v6, 0xCu);
  }

  id v4 = MTAlarmServerInterface();
  id v5 = MTAlarmClientInterface();
}

+ (id)assistantSyncNotificationName
{
  id v2 = [NSString stringWithCString:".siri_data_changed" encoding:4];
  v3 = [@"com.apple.alarm.label" stringByAppendingString:v2];

  return v3;
}

void __34__MTAlarmManager_initWithMetrics___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reconnect];
}

- (MTAlarmManager)initWithConnectionProvider:(id)a3 metrics:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__MTAlarmManager_initWithConnectionProvider_metrics___block_invoke;
  v10[3] = &unk_1E5917630;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = [(MTAlarmManager *)self _initWithConnectionProvidingBlock:v10 metrics:a4];

  return v8;
}

id __53__MTAlarmManager_initWithConnectionProvider_metrics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (MTAlarmManager)initWithConnectionProvider:(id)a3 metrics:(id)a4 notificationCenter:(id)a5
{
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__MTAlarmManager_initWithConnectionProvider_metrics_notificationCenter___block_invoke;
  v12[3] = &unk_1E5917630;
  id v13 = v8;
  id v9 = v8;
  id v10 = [(MTAlarmManager *)self _initWithConnectionProvidingBlock:v12 metrics:a4 notificationCenter:a5];

  return v10;
}

id __72__MTAlarmManager_initWithConnectionProvider_metrics_notificationCenter___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __79__MTAlarmManager__initWithConnectionProvidingBlock_metrics_notificationCenter___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v6 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing...", buf, 0xCu);
  }

  [(MTXPCConnectionProvider *)self->_connectionProvider invalidate];
  v4.receiver = self;
  v4.super_class = (Class)MTAlarmManager;
  [(MTAlarmManager *)&v4 dealloc];
}

- (void)checkIn
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ checking in...", (uint8_t *)&v4, 0xCu);
  }

  [(MTAlarmManager *)self reconnect];
}

- (void)reconnect
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ reconnecting...", buf, 0xCu);
  }

  int v4 = MTLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(MTAlarmManager *)self cache];
    *(_DWORD *)buf = 138543618;
    id v14 = self;
    __int16 v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ updating cache %{public}@", buf, 0x16u);
  }
  uint64_t v6 = [(MTAlarmManager *)self cache];
  [v6 markNeedsUpdate];

  uint64_t v7 = MTLogForCategory(3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(MTAlarmManager *)self connectionProvider];
    *(_DWORD *)buf = 138543618;
    id v14 = self;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ calling connection provider %{public}@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  id v9 = [(MTAlarmManager *)self connectionProvider];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __27__MTAlarmManager_reconnect__block_invoke;
  v11[3] = &unk_1E59176D0;
  objc_copyWeak(&v12, (id *)buf);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __27__MTAlarmManager_reconnect__block_invoke_52;
  v10[3] = &unk_1E5915AA8;
  void v10[4] = self;
  [v9 performRemoteBlock:v11 withErrorHandler:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __27__MTAlarmManager_reconnect__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = MTLogForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [WeakRetained connectionProvider];
    int v7 = 138543618;
    id v8 = WeakRetained;
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ remote block being called on connection provider %{public}@...", (uint8_t *)&v7, 0x16u);
  }
  [v3 checkIn];
}

void __27__MTAlarmManager_reconnect__block_invoke_52(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = MTLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __27__MTAlarmManager_reconnect__block_invoke_52_cold_1(a1, (uint64_t)v3, v4);
  }
}

void __59__MTAlarmManager__alarmsIncludingSleepAlarm_doSynchronous___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    [v6 finishWithError:a5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) finishWithResult:v7];
  }
}

- (id)sleepAlarm
{
  id v3 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__MTAlarmManager_sleepAlarm__block_invoke;
  v8[3] = &unk_1E5917768;
  id v4 = v3;
  id v9 = v4;
  id v5 = (void *)MEMORY[0x19F3A0FB0](v8);
  [(MTAlarmManager *)self _getCachedAlarmsWithFuture:v4 finishBlock:v5];
  id v6 = v4;

  return v6;
}

void __28__MTAlarmManager_sleepAlarm__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  unint64_t v9 = a5;
  uint64_t v7 = [a3 firstObject];
  id v8 = *(void **)(a1 + 32);
  if (v9 | v7) {
    [v8 finishWithResult:v7 error:v9];
  }
  else {
    [v8 finishWithNoResult];
  }
}

- (id)sleepAlarms
{
  id v3 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__MTAlarmManager_sleepAlarms__block_invoke;
  v8[3] = &unk_1E5917768;
  id v4 = v3;
  id v9 = v4;
  id v5 = (void *)MEMORY[0x19F3A0FB0](v8);
  [(MTAlarmManager *)self _getCachedAlarmsWithFuture:v4 finishBlock:v5];
  id v6 = v4;

  return v6;
}

uint64_t __29__MTAlarmManager_sleepAlarms__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5 = *(void **)(a1 + 32);
  if (a3 | a5) {
    return objc_msgSend(v5, "finishWithResult:error:");
  }
  else {
    return [v5 finishWithNoResult];
  }
}

- (id)nextAlarm
{
  id v3 = objc_opt_new();
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __27__MTAlarmManager_nextAlarm__block_invoke;
  uint64_t v11 = &unk_1E5917790;
  id v12 = self;
  id v4 = v3;
  id v13 = v4;
  id v5 = (void *)MEMORY[0x19F3A0FB0](&v8);
  -[MTAlarmManager _getCachedAlarmsWithFuture:finishBlock:](self, "_getCachedAlarmsWithFuture:finishBlock:", v4, v5, v8, v9, v10, v11, v12);
  id v6 = v4;

  return v6;
}

void __27__MTAlarmManager_nextAlarm__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = a4;
  unint64_t v8 = a5;
  uint64_t v9 = MTLogForCategory(3);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v15 = 138543362;
    uint64_t v16 = v10;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ finish block called for next alarm", (uint8_t *)&v15, 0xCu);
  }

  uint64_t v11 = MTLogForCategory(3);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v7 | v8)
  {
    if (v12)
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = 138543874;
      uint64_t v16 = v14;
      __int16 v17 = 2114;
      unint64_t v18 = v7;
      __int16 v19 = 2114;
      unint64_t v20 = v8;
      _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ finish block called with next alarm: %{public}@, error: %{public}@", (uint8_t *)&v15, 0x20u);
    }

    [*(id *)(a1 + 40) finishWithResult:v7 error:v8];
  }
  else
  {
    if (v12)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v15 = 138543362;
      uint64_t v16 = v13;
      _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ finish block called with no next alarm", (uint8_t *)&v15, 0xCu);
    }

    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

- (unint64_t)alarmCountIncludingSleepAlarm:(BOOL)a3
{
  id v4 = -[MTAlarmManager alarmsSyncIncludingSleepAlarm:](self, "alarmsSyncIncludingSleepAlarm:");
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__MTAlarmManager_alarmCountIncludingSleepAlarm___block_invoke;
  v8[3] = &__block_descriptor_33_e17_B16__0__MTAlarm_8l;
  BOOL v9 = a3;
  id v5 = objc_msgSend(v4, "na_filter:", v8);
  unint64_t v6 = [v5 count];

  return v6;
}

uint64_t __48__MTAlarmManager_alarmCountIncludingSleepAlarm___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    return 1;
  }
  else {
    return [a2 isSleepAlarm] ^ 1;
  }
}

- (unint64_t)firingAlarmCount
{
  id v2 = [(MTAlarmManager *)self alarmsSyncIncludingSleepAlarm:1];
  id v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_62);
  unint64_t v4 = [v3 count];

  return v4;
}

uint64_t __34__MTAlarmManager_firingAlarmCount__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isFiring];
}

- (id)alarmsSync
{
  return [(MTAlarmManager *)self alarmsSyncIncludingSleepAlarm:0];
}

- (id)alarmsSyncIncludingSleepAlarm:(BOOL)a3
{
  id v5 = [(MTAlarmManager *)self _alarmsIncludingSleepAlarm:a3 doSynchronous:1];
  if (([v5 isFinished] & 1) == 0)
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MTAlarmManager.m" lineNumber:316 description:@"Expected alarm future to be finished."];
  }
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__12;
  int v15 = __Block_byref_object_dispose__12;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__MTAlarmManager_alarmsSyncIncludingSleepAlarm___block_invoke;
  v10[3] = &unk_1E59177D8;
  void v10[4] = &v11;
  id v6 = (id)[v5 addCompletionBlock:v10];
  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __48__MTAlarmManager_alarmsSyncIncludingSleepAlarm___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (!a3)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v6 = v7;
  }
}

- (id)alarms
{
  return [(MTAlarmManager *)self alarmsIncludingSleepAlarm:0];
}

- (id)nextAlarmsForDate:(id)a3 maxCount:(unint64_t)a4
{
  return [(MTAlarmManager *)self nextAlarmsForDate:a3 maxCount:a4 includeSleepAlarm:1];
}

- (id)nextAlarmsForDate:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5
{
  return [(MTAlarmManager *)self nextAlarmsForDate:a3 maxCount:a4 includeSleepAlarm:a5 includeBedtimeNotification:0];
}

- (id)nextAlarmsForDate:(id)a3 maxCount:(unint64_t)a4 includeBedtimeNotification:(BOOL)a5
{
  return [(MTAlarmManager *)self nextAlarmsForDate:a3 maxCount:a4 includeSleepAlarm:1 includeBedtimeNotification:a5];
}

- (id)nextAlarmsForDate:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5 includeBedtimeNotification:(BOOL)a6
{
  return [(MTAlarmManager *)self _nextAlarmsForDate:a3 maxCount:a4 includeSleepAlarm:a5 includeBedtimeNotification:a6 doSynchronous:0];
}

- (id)_nextAlarmsForDate:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5 includeBedtimeNotification:(BOOL)a6 doSynchronous:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  uint64_t v13 = [(MTAlarmManager *)self _sortedNextAlarmsAfterDate:v12 includeSleepAlarm:v9 includeBedtimeNotification:v8 doSynchronous:v7];
  uint64_t v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int v15 = [v14 components:30 fromDate:v12];
  id v16 = [v14 dateFromComponents:v15];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  BOOL v25 = __105__MTAlarmManager__nextAlarmsForDate_maxCount_includeSleepAlarm_includeBedtimeNotification_doSynchronous___block_invoke;
  uint64_t v26 = &unk_1E5917800;
  BOOL v30 = v8;
  id v27 = v12;
  id v28 = v14;
  id v29 = v16;
  id v17 = v16;
  id v18 = v14;
  id v19 = v12;
  unint64_t v20 = (void *)MEMORY[0x19F3A0FB0](&v23);
  uint64_t v21 = objc_msgSend((id)objc_opt_class(), "_filteredAlarms:afterDate:maxCount:filter:", v13, v19, a4, v20, v23, v24, v25, v26);

  return v21;
}

uint64_t __105__MTAlarmManager__nextAlarmsForDate_maxCount_includeSleepAlarm_includeBedtimeNotification_doSynchronous___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEnabled])
  {
    unint64_t v4 = [v3 nextTriggerAfterDate:*(void *)(a1 + 32) includeBedtimeNotification:*(unsigned __int8 *)(a1 + 56)];
    id v5 = [v4 triggerDate];
    if ([v5 mtIsAfterDate:*(void *)(a1 + 32)]
      && ([v4 isPastOverrideEvent] & 1) == 0)
    {
      BOOL v7 = [*(id *)(a1 + 40) components:30 fromDate:v5];
      BOOL v8 = [*(id *)(a1 + 40) dateFromComponents:v7];
      uint64_t v6 = [*(id *)(a1 + 48) isEqualToDate:v8];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)nextAlarmsInRange:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5
{
  return [(MTAlarmManager *)self nextAlarmsInRange:a3 maxCount:a4 includeSleepAlarm:a5 includeBedtimeNotification:0];
}

- (id)nextAlarmsInRange:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5 includeBedtimeNotification:(BOOL)a6
{
  return [(MTAlarmManager *)self _nextAlarmsInRange:a3 maxCount:a4 includeSleepAlarm:a5 includeBedtimeNotification:a6 doSynchronous:0];
}

- (id)_nextAlarmsInRange:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5 includeBedtimeNotification:(BOOL)a6 doSynchronous:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  uint64_t v13 = [v12 startDate];
  uint64_t v14 = [(MTAlarmManager *)self _sortedNextAlarmsAfterDate:v13 includeSleepAlarm:v9 includeBedtimeNotification:v8 doSynchronous:v7];

  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __105__MTAlarmManager__nextAlarmsInRange_maxCount_includeSleepAlarm_includeBedtimeNotification_doSynchronous___block_invoke;
  uint64_t v24 = &unk_1E5917828;
  id v25 = v12;
  BOOL v26 = v8;
  id v15 = v12;
  id v16 = (void *)MEMORY[0x19F3A0FB0](&v21);
  id v17 = objc_opt_class();
  id v18 = objc_msgSend(v15, "startDate", v21, v22, v23, v24);
  id v19 = [v17 _filteredAlarms:v14 afterDate:v18 maxCount:a4 filter:v16];

  return v19;
}

uint64_t __105__MTAlarmManager__nextAlarmsInRange_maxCount_includeSleepAlarm_includeBedtimeNotification_doSynchronous___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEnabled])
  {
    unint64_t v4 = [*(id *)(a1 + 32) startDate];
    id v5 = [v3 nextFireDateAfterDate:v4 includeBedtimeNotification:*(unsigned __int8 *)(a1 + 40)];

    uint64_t v6 = [*(id *)(a1 + 32) containsDate:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_sortedNextAlarmsAfterDate:(id)a3 includeSleepAlarm:(BOOL)a4 includeBedtimeNotification:(BOOL)a5
{
  return [(MTAlarmManager *)self _sortedNextAlarmsAfterDate:a3 includeSleepAlarm:a4 includeBedtimeNotification:a5 doSynchronous:0];
}

- (id)_sortedNextAlarmsAfterDate:(id)a3 includeSleepAlarm:(BOOL)a4 includeBedtimeNotification:(BOOL)a5 doSynchronous:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v11 = [(MTAlarmManager *)self _alarmsIncludingSleepAlarm:v8 doSynchronous:v6];
  if (v8)
  {
    uint64_t v12 = [(id)objc_opt_class() _filterSleepAlarmOverrides:v11 date:v10];

    uint64_t v11 = (void *)v12;
  }
  uint64_t v13 = [(id)objc_opt_class() _sortedAlarms:v11 date:v10 includeBedtimeNotification:v7];

  return v13;
}

+ (id)_filterSleepAlarmOverrides:(id)a3 date:(id)a4
{
  id v5 = a4;
  BOOL v6 = (void *)MEMORY[0x1E4F1C9A8];
  id v7 = a3;
  BOOL v8 = [v6 mtGregorianCalendar];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__MTAlarmManager__filterSleepAlarmOverrides_date___block_invoke;
  v13[3] = &unk_1E5915F70;
  id v14 = v5;
  id v15 = v8;
  id v9 = v8;
  id v10 = v5;
  uint64_t v11 = [v7 flatMap:v13];

  return v11;
}

id __50__MTAlarmManager__filterSleepAlarmOverrides_date___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v19 = 0;
  unint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__12;
  uint64_t v23 = __Block_byref_object_dispose__12;
  id v24 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__MTAlarmManager__filterSleepAlarmOverrides_date___block_invoke_2;
  v15[3] = &unk_1E5917850;
  id v6 = v4;
  id v16 = v6;
  id v7 = v5;
  id v17 = v7;
  id v18 = &v19;
  objc_msgSend(v3, "na_each:", v15);
  if (v20[5])
  {
    objc_msgSend(v6, "addObject:");
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__MTAlarmManager__filterSleepAlarmOverrides_date___block_invoke_3;
    v10[3] = &unk_1E5917878;
    id v14 = &v19;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    id v13 = v6;
    objc_msgSend(v7, "na_each:", v10);
  }
  else
  {
    [v6 addObjectsFromArray:v7];
  }
  BOOL v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:v6];

  _Block_object_dispose(&v19, 8);
  return v8;
}

void __50__MTAlarmManager__filterSleepAlarmOverrides_date___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isSleepAlarm])
  {
    [*(id *)(a1 + 40) addObject:v4];
    if ([v4 isSingleTimeAlarm]) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    }
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

void __50__MTAlarmManager__filterSleepAlarmOverrides_date___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "overridesNextAlarm:date:calendar:") & 1) == 0) {
    [*(id *)(a1 + 48) addObject:v3];
  }
}

+ (id)_sortedAlarms:(id)a3 date:(id)a4 includeBedtimeNotification:(BOOL)a5
{
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__MTAlarmManager__sortedAlarms_date_includeBedtimeNotification___block_invoke;
  v11[3] = &unk_1E59178C8;
  id v12 = v7;
  BOOL v13 = a5;
  id v8 = v7;
  id v9 = [a3 flatMap:v11];

  return v9;
}

id __64__MTAlarmManager__sortedAlarms_date_includeBedtimeNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __64__MTAlarmManager__sortedAlarms_date_includeBedtimeNotification___block_invoke_2;
  id v10 = &unk_1E59178A0;
  id v11 = *(id *)(a1 + 32);
  char v12 = *(unsigned char *)(a1 + 40);
  id v4 = [a2 sortedArrayUsingComparator:&v7];
  id v5 = objc_msgSend(MEMORY[0x1E4F7A0D8], "futureWithResult:", v4, v7, v8, v9, v10);

  return v5;
}

uint64_t __64__MTAlarmManager__sortedAlarms_date_includeBedtimeNotification___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEnabled] && objc_msgSend(v6, "isEnabled"))
  {
    uint64_t v7 = [v5 nextFireDateAfterDate:*(void *)(a1 + 32) includeBedtimeNotification:*(unsigned __int8 *)(a1 + 40)];
    uint64_t v8 = [v6 nextFireDateAfterDate:*(void *)(a1 + 32) includeBedtimeNotification:*(unsigned __int8 *)(a1 + 40)];
    id v9 = (void *)v8;
    if (v7 && v8)
    {
      uint64_t v10 = [v7 compare:v8];
    }
    else if (v8)
    {
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v10 = -1;
    }
  }
  else if ([v6 isEnabled])
  {
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

+ (id)_filteredAlarms:(id)a3 afterDate:(id)a4 maxCount:(unint64_t)a5 filter:(id)a6
{
  id v8 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__MTAlarmManager__filteredAlarms_afterDate_maxCount_filter___block_invoke;
  v12[3] = &unk_1E59178F0;
  id v13 = v8;
  unint64_t v14 = a5;
  id v9 = v8;
  uint64_t v10 = [a3 flatMap:v12];

  return v10;
}

id __60__MTAlarmManager__filteredAlarms_afterDate_maxCount_filter___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
      if ((unint64_t)objc_msgSend(v4, "count", (void)v13) >= *(void *)(a1 + 40)) {
        break;
      }
      if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
        [v4 addObject:v10];
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v11 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v11;
}

- (id)nextAlarmsForDateSync:(id)a3 maxCount:(unint64_t)a4
{
  return [(MTAlarmManager *)self nextAlarmsForDateSync:a3 maxCount:a4 includeSleepAlarm:1];
}

- (id)nextAlarmsForDateSync:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5
{
  return [(MTAlarmManager *)self nextAlarmsForDateSync:a3 maxCount:a4 includeSleepAlarm:a5 includeBedtimeNotification:0];
}

- (id)nextAlarmsForDateSync:(id)a3 maxCount:(unint64_t)a4 includeBedtimeNotification:(BOOL)a5
{
  return [(MTAlarmManager *)self nextAlarmsForDateSync:a3 maxCount:a4 includeSleepAlarm:1 includeBedtimeNotification:a5];
}

- (id)nextAlarmsForDateSync:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5 includeBedtimeNotification:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v11 = a3;
  char v12 = [(MTAlarmManager *)self _nextAlarmsForDate:v11 maxCount:a4 includeSleepAlarm:v7 includeBedtimeNotification:v6 doSynchronous:1];
  if (([v12 isFinished] & 1) == 0)
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"MTAlarmManager.m" lineNumber:511 description:@"Expected next alarm future to be finished."];
  }
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__12;
  uint64_t v22 = __Block_byref_object_dispose__12;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __94__MTAlarmManager_nextAlarmsForDateSync_maxCount_includeSleepAlarm_includeBedtimeNotification___block_invoke;
  v17[3] = &unk_1E59177D8;
  v17[4] = &v18;
  id v13 = (id)[v12 addCompletionBlock:v17];
  id v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v14;
}

void __94__MTAlarmManager_nextAlarmsForDateSync_maxCount_includeSleepAlarm_includeBedtimeNotification___block_invoke(uint64_t a1, void *a2)
{
}

- (id)nextAlarmsInRangeSync:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5
{
  return [(MTAlarmManager *)self nextAlarmsInRangeSync:a3 maxCount:a4 includeSleepAlarm:a5 includeBedtimeNotification:0];
}

- (id)nextAlarmsInRangeSync:(id)a3 maxCount:(unint64_t)a4 includeSleepAlarm:(BOOL)a5 includeBedtimeNotification:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v11 = a3;
  char v12 = [(MTAlarmManager *)self _nextAlarmsInRange:v11 maxCount:a4 includeSleepAlarm:v7 includeBedtimeNotification:v6 doSynchronous:1];
  if (([v12 isFinished] & 1) == 0)
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"MTAlarmManager.m" lineNumber:527 description:@"Expected next alarm future to be finished."];
  }
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__12;
  uint64_t v22 = __Block_byref_object_dispose__12;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __94__MTAlarmManager_nextAlarmsInRangeSync_maxCount_includeSleepAlarm_includeBedtimeNotification___block_invoke;
  v17[3] = &unk_1E59177D8;
  v17[4] = &v18;
  id v13 = (id)[v12 addCompletionBlock:v17];
  id v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v14;
}

void __94__MTAlarmManager_nextAlarmsInRangeSync_maxCount_includeSleepAlarm_includeBedtimeNotification___block_invoke(uint64_t a1, void *a2)
{
}

- (id)sleepAlarmSync
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__12;
  uint64_t v10 = __Block_byref_object_dispose__12;
  id v11 = 0;
  cache = self->_cache;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__MTAlarmManager_sleepAlarmSync__block_invoke;
  v5[3] = &unk_1E5917918;
  v5[4] = &v6;
  [(MTAlarmCache *)cache getCachedAlarmsSyncWithCompletion:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __32__MTAlarmManager_sleepAlarmSync__block_invoke(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a5)
  {
    uint64_t v6 = result;
    uint64_t v7 = [a3 firstObject];
    uint64_t v8 = *(void *)(*(void *)(v6 + 32) + 8);
    uint64_t v9 = *(void *)(v8 + 40);
    *(void *)(v8 + 40) = v7;
    return MEMORY[0x1F41817F8](v7, v9);
  }
  return result;
}

- (id)sleepAlarmsSync
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__12;
  uint64_t v10 = __Block_byref_object_dispose__12;
  id v11 = 0;
  cache = self->_cache;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__MTAlarmManager_sleepAlarmsSync__block_invoke;
  v5[3] = &unk_1E5917918;
  v5[4] = &v6;
  [(MTAlarmCache *)cache getCachedAlarmsSyncWithCompletion:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __33__MTAlarmManager_sleepAlarmsSync__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v8 = a3;
  if (!a5)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v8 = v9;
  }
}

- (id)nextAlarmSync
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__12;
  uint64_t v10 = __Block_byref_object_dispose__12;
  id v11 = 0;
  cache = self->_cache;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__MTAlarmManager_nextAlarmSync__block_invoke;
  v5[3] = &unk_1E5917918;
  v5[4] = &v6;
  [(MTAlarmCache *)cache getCachedAlarmsSyncWithCompletion:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __31__MTAlarmManager_nextAlarmSync__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8 = a4;
  if (!a5)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a4);
    id v8 = v9;
  }
}

- (id)alarmWithIDString:(id)a3
{
  return [(MTAlarmManager *)self alarmWithIDString:a3 includeSleep:0];
}

- (id)alarmWithIDString:(id)a3 includeSleep:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = -[MTAlarmManager alarmsSyncIncludingSleepAlarm:](self, "alarmsSyncIncludingSleepAlarm:", v4, 0);
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        char v12 = [v11 alarmIDString];
        char v13 = [v12 isEqualToString:v6];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)_alarmWithIDStringAsync:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTAlarmManager *)self _alarmsIncludingSleepAlarm:1 doSynchronous:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__MTAlarmManager__alarmWithIDStringAsync___block_invoke;
  v9[3] = &unk_1E5917940;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 flatMap:v9];

  return v7;
}

id __42__MTAlarmManager__alarmWithIDStringAsync___block_invoke(uint64_t a1, void *a2)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__MTAlarmManager__alarmWithIDStringAsync___block_invoke_2;
  v8[3] = &unk_1E5914D40;
  id v9 = *(id *)(a1 + 32);
  id v3 = objc_msgSend(a2, "na_firstObjectPassingTest:", v8);
  id v4 = (void *)MEMORY[0x1E4F7A0D8];
  if (v3)
  {
    uint64_t v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.mobiletimer.MTAlarmManager" code:1 userInfo:0];
    uint64_t v5 = [v4 futureWithError:v6];
  }
  return v5;
}

uint64_t __42__MTAlarmManager__alarmWithIDStringAsync___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 alarmIDString];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (unint64_t)indexForAlarm:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTAlarmManager *)self alarmsSync];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __32__MTAlarmManager_indexForAlarm___block_invoke;
  v9[3] = &unk_1E5917968;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = [v5 indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __32__MTAlarmManager_indexForAlarm___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 alarmIDString];
  uint64_t v5 = [v3 alarmIDString];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

- (id)alarmAtIndex:(unint64_t)a3
{
  id v4 = [(MTAlarmManager *)self alarmsSync];
  if ([v4 count] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [v4 objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (unint64_t)alarmCount
{
  return [(MTAlarmManager *)self alarmCountIncludingSleepAlarm:0];
}

- (id)nextSleepAlarm
{
  id v3 = objc_opt_new();
  id v4 = [(MTAlarmManager *)self connectionProvider];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__MTAlarmManager_nextSleepAlarm__block_invoke;
  v8[3] = &unk_1E59179B8;
  id v5 = v3;
  id v9 = v5;
  uint64_t v6 = [v5 errorOnlyCompletionHandlerAdapter];
  [v4 performRemoteBlock:v8 withErrorHandler:v6];

  return v5;
}

void __32__MTAlarmManager_nextSleepAlarm__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__MTAlarmManager_nextSleepAlarm__block_invoke_2;
  v3[3] = &unk_1E5917990;
  id v4 = *(id *)(a1 + 32);
  [a2 nextSleepAlarmWithCompletion:v3];
}

uint64_t __32__MTAlarmManager_nextSleepAlarm__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a2 | a3) {
    return [v3 finishWithResult:a2 error:a3];
  }
  else {
    return [v3 finishWithNoResult];
  }
}

- (id)addAlarm:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MTLogForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 alarmIDString];
    *(_DWORD *)buf = 138543618;
    long long v18 = self;
    __int16 v19 = 2114;
    uint64_t v20 = v6;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ addAlarm:%{public}@", buf, 0x16u);
  }
  unint64_t v7 = objc_opt_new();
  id v8 = MTNewChildActivityForName(0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__MTAlarmManager_addAlarm___block_invoke;
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

void __27__MTAlarmManager_addAlarm___block_invoke(id *a1)
{
  id v2 = [a1[4] cache];
  [v2 markNeedsUpdate];

  id v3 = [a1[4] connectionProvider];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__MTAlarmManager_addAlarm___block_invoke_2;
  v6[3] = &unk_1E59179E0;
  id v7 = a1[5];
  id v8 = a1[6];
  id v4 = objc_msgSend(a1[6], "errorOnlyCompletionHandlerAdapter", v6[0], 3221225472, __27__MTAlarmManager_addAlarm___block_invoke_2, &unk_1E59179E0);
  [v3 performRemoteBlock:v6 withErrorHandler:v4];

  objc_msgSend(*((id *)a1[4] + 3), "logAlarmAdded:", objc_msgSend(a1[5], "isSleepAlarm"));
  id v5 = +[MTAlarmManager assistantSyncNotificationName];
  notify_post((const char *)[v5 cStringUsingEncoding:4]);
}

void __27__MTAlarmManager_addAlarm___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTAlarmManager - Adding Alarm", v7, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) errorOnlyCompletionHandlerAdapter];
  [v3 addAlarm:v5 withCompletion:v6];
}

- (id)updateAlarm:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 alarmIDString];
    *(_DWORD *)buf = 138543618;
    long long v18 = self;
    __int16 v19 = 2114;
    uint64_t v20 = v6;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ updateAlarm:%{public}@", buf, 0x16u);
  }
  id v7 = objc_opt_new();
  id v8 = MTNewChildActivityForName(1);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__MTAlarmManager_updateAlarm___block_invoke;
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

void __30__MTAlarmManager_updateAlarm___block_invoke(id *a1)
{
  id v2 = [a1[4] cache];
  [v2 markNeedsUpdate];

  id v3 = [a1[4] connectionProvider];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__MTAlarmManager_updateAlarm___block_invoke_2;
  v6[3] = &unk_1E59179E0;
  id v7 = a1[5];
  id v8 = a1[6];
  id v4 = objc_msgSend(a1[6], "errorOnlyCompletionHandlerAdapter", v6[0], 3221225472, __30__MTAlarmManager_updateAlarm___block_invoke_2, &unk_1E59179E0);
  [v3 performRemoteBlock:v6 withErrorHandler:v4];

  objc_msgSend(*((id *)a1[4] + 3), "logAlarmUpdated:", objc_msgSend(a1[5], "isSleepAlarm"));
  id v5 = +[MTAlarmManager assistantSyncNotificationName];
  notify_post((const char *)[v5 cStringUsingEncoding:4]);
}

void __30__MTAlarmManager_updateAlarm___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTAlarmManager - Updating Alarm", v7, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) errorOnlyCompletionHandlerAdapter];
  [v3 updateAlarm:v5 withCompletion:v6];
}

- (id)removeAlarm:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 alarmIDString];
    *(_DWORD *)buf = 138543618;
    long long v18 = self;
    __int16 v19 = 2114;
    uint64_t v20 = v6;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ removeAlarm:%{public}@", buf, 0x16u);
  }
  id v7 = objc_opt_new();
  id v8 = MTNewChildActivityForName(2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__MTAlarmManager_removeAlarm___block_invoke;
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

void __30__MTAlarmManager_removeAlarm___block_invoke(id *a1)
{
  id v2 = [a1[4] cache];
  [v2 markNeedsUpdate];

  id v3 = [a1[4] connectionProvider];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__MTAlarmManager_removeAlarm___block_invoke_2;
  v6[3] = &unk_1E59179E0;
  id v7 = a1[5];
  id v8 = a1[6];
  id v4 = objc_msgSend(a1[6], "errorOnlyCompletionHandlerAdapter", v6[0], 3221225472, __30__MTAlarmManager_removeAlarm___block_invoke_2, &unk_1E59179E0);
  [v3 performRemoteBlock:v6 withErrorHandler:v4];

  objc_msgSend(*((id *)a1[4] + 3), "logAlarmDeleted:", objc_msgSend(a1[5], "isSleepAlarm"));
  id v5 = +[MTAlarmManager assistantSyncNotificationName];
  notify_post((const char *)[v5 cStringUsingEncoding:4]);
}

void __30__MTAlarmManager_removeAlarm___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTAlarmManager - Removing Alarm", v7, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) errorOnlyCompletionHandlerAdapter];
  [v3 removeAlarm:v5 withCompletion:v6];
}

- (id)snoozeAlarmWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTAlarmManager *)self _alarmWithIDStringAsync:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__MTAlarmManager_snoozeAlarmWithIdentifier___block_invoke;
  v9[3] = &unk_1E5917A08;
  void v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 flatMap:v9];

  return v7;
}

uint64_t __44__MTAlarmManager_snoozeAlarmWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if ([a2 isSleepAlarm]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  return [v2 snoozeAlarmWithIdentifier:v3 snoozeAction:v4];
}

- (id)snoozeAlarmWithIdentifier:(id)a3 snoozeAction:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = MTLogForCategory(3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = self;
    __int16 v21 = 2114;
    id v22 = v6;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ snoozeAlarmWithIdentifier:%{public}@", buf, 0x16u);
  }

  id v8 = objc_opt_new();
  id v9 = MTNewChildActivityForName(4);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__MTAlarmManager_snoozeAlarmWithIdentifier_snoozeAction___block_invoke;
  v15[3] = &unk_1E5917A58;
  void v15[4] = self;
  id v16 = v6;
  unint64_t v18 = a4;
  id v10 = v8;
  id v17 = v10;
  id v11 = v6;
  os_activity_apply(v9, v15);

  id v12 = v17;
  id v13 = v10;

  return v13;
}

void __57__MTAlarmManager_snoozeAlarmWithIdentifier_snoozeAction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cache];
  [v2 markNeedsUpdate];

  uint64_t v3 = [*(id *)(a1 + 32) connectionProvider];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__MTAlarmManager_snoozeAlarmWithIdentifier_snoozeAction___block_invoke_2;
  v8[3] = &unk_1E5917A30;
  id v4 = *(id *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v9 = v4;
  uint64_t v11 = v5;
  id v10 = v6;
  id v7 = [*(id *)(a1 + 48) errorOnlyCompletionHandlerAdapter];
  [v3 performRemoteBlock:v8 withErrorHandler:v7];

  [*(id *)(*(void *)(a1 + 32) + 24) logAlarmSnoozeAction:*(void *)(a1 + 56)];
}

void __57__MTAlarmManager_snoozeAlarmWithIdentifier_snoozeAction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTAlarmManager - Snoozing Alarm", v8, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) errorOnlyCompletionHandlerAdapter];
  [v3 snoozeAlarmWithIdentifier:v6 snoozeAction:v5 withCompletion:v7];
}

- (id)dismissAlarmWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTAlarmManager *)self _alarmWithIDStringAsync:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__MTAlarmManager_dismissAlarmWithIdentifier___block_invoke;
  v9[3] = &unk_1E5917A08;
  void v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 flatMap:v9];

  return v7;
}

uint64_t __45__MTAlarmManager_dismissAlarmWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if ([a2 isSleepAlarm]) {
    uint64_t v4 = 5;
  }
  else {
    uint64_t v4 = 0;
  }
  return [v2 dismissAlarmWithIdentifier:v3 dismissAction:v4];
}

- (id)dismissAlarmWithIdentifier:(id)a3 dismissAction:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = MTLogForCategory(3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = MTDismissAlarmActionDescription(a4);
    *(_DWORD *)buf = 138543874;
    __int16 v21 = self;
    __int16 v22 = 2114;
    id v23 = v6;
    __int16 v24 = 2114;
    id v25 = v8;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissAlarmWithIdentifier:%{public}@ (%{public}@)", buf, 0x20u);
  }
  id v9 = objc_opt_new();
  id v10 = MTNewChildActivityForName(3);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__MTAlarmManager_dismissAlarmWithIdentifier_dismissAction___block_invoke;
  v16[3] = &unk_1E5917A58;
  v16[4] = self;
  id v17 = v6;
  unint64_t v19 = a4;
  id v11 = v9;
  id v18 = v11;
  id v12 = v6;
  os_activity_apply(v10, v16);

  id v13 = v18;
  id v14 = v11;

  return v14;
}

void __59__MTAlarmManager_dismissAlarmWithIdentifier_dismissAction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cache];
  [v2 markNeedsUpdate];

  uint64_t v3 = [*(id *)(a1 + 32) connectionProvider];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__MTAlarmManager_dismissAlarmWithIdentifier_dismissAction___block_invoke_2;
  v8[3] = &unk_1E5917A30;
  id v4 = *(id *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v9 = v4;
  uint64_t v11 = v5;
  id v10 = v6;
  id v7 = [*(id *)(a1 + 48) errorOnlyCompletionHandlerAdapter];
  [v3 performRemoteBlock:v8 withErrorHandler:v7];

  [*(id *)(*(void *)(a1 + 32) + 24) logAlarmDismissAction:*(void *)(a1 + 56)];
}

void __59__MTAlarmManager_dismissAlarmWithIdentifier_dismissAction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTAlarmManager - Dismissing Alarm", v8, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) errorOnlyCompletionHandlerAdapter];
  [v3 dismissAlarmWithIdentifier:v6 dismissAction:v5 withCompletion:v7];
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

- (MTAlarmCache)cache
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

- (id)updateSleepAlarms
{
  id v3 = objc_opt_new();
  id v4 = MTNewChildActivityForName(1);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__MTAlarmManager_Sleep__updateSleepAlarms__block_invoke;
  v9[3] = &unk_1E5915000;
  void v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  os_activity_apply(v4, v9);

  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

void __42__MTAlarmManager_Sleep__updateSleepAlarms__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connectionProvider];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__MTAlarmManager_Sleep__updateSleepAlarms__block_invoke_2;
  v4[3] = &unk_1E59179B8;
  id v5 = *(id *)(a1 + 40);
  id v3 = [*(id *)(a1 + 40) errorOnlyCompletionHandlerAdapter];
  [v2 performRemoteBlock:v4 withErrorHandler:v3];
}

void __42__MTAlarmManager_Sleep__updateSleepAlarms__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTAlarmManager - Refreshing Sleep Alarms", v6, 2u);
  }

  id v5 = [*(id *)(a1 + 32) errorOnlyCompletionHandlerAdapter];
  [v3 updateSleepAlarmsWithCompletion:v5];
}

- (id)resetSleepAlarmSnoozeState
{
  id v3 = objc_opt_new();
  id v4 = MTNewChildActivityForName(1);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__MTAlarmManager_Sleep__resetSleepAlarmSnoozeState__block_invoke;
  v9[3] = &unk_1E5915000;
  void v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  os_activity_apply(v4, v9);

  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

void __51__MTAlarmManager_Sleep__resetSleepAlarmSnoozeState__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connectionProvider];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__MTAlarmManager_Sleep__resetSleepAlarmSnoozeState__block_invoke_2;
  v4[3] = &unk_1E59179B8;
  id v5 = *(id *)(a1 + 40);
  id v3 = [*(id *)(a1 + 40) errorOnlyCompletionHandlerAdapter];
  [v2 performRemoteBlock:v4 withErrorHandler:v3];
}

void __51__MTAlarmManager_Sleep__resetSleepAlarmSnoozeState__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTAlarmManager - Resetting Sleep Alarms Snooze State", v6, 2u);
  }

  id v5 = [*(id *)(a1 + 32) errorOnlyCompletionHandlerAdapter];
  [v3 resetSleepAlarmSnoozeStateWithCompletion:v5];
}

- (id)nextExpectedRefreshDate
{
  id v3 = [(MTAlarmManager *)self nextWidgetAlarmInThreshold];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] now];
  }
  else
  {
    id v5 = [(MTAlarmManager *)self nextFutureAlarmDate];
    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      id v4 = [v6 dateByAddingUnit:32 value:-20 toDate:v5 options:0];
    }
    else
    {
      id v4 = 0;
    }
  }
  return v4;
}

- (id)nextWidgetAlarmInThreshold
{
  return [(MTAlarmManager *)self nextAlarmInHoursThreshold:20];
}

- (id)nextAlarmInHoursThreshold:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = [v5 dateByAddingUnit:32 value:a3 toDate:v6 options:0];

  id v8 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  id v10 = (void *)[v8 initWithStartDate:v9 endDate:v7];

  uint64_t v11 = [(MTAlarmManager *)self nextAlarmsInRangeSync:v10 maxCount:1 includeSleepAlarm:1];
  id v12 = [v11 firstObject];

  return v12;
}

- (id)nextFutureAlarmDate
{
  id v2 = [(MTAlarmManager *)self nextAlarmInHoursThreshold:168];
  id v3 = [v2 nextFireDate];

  return v3;
}

void __27__MTAlarmManager_reconnect__block_invoke_52_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "%{public}@ error while reconnecting: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
@interface MTStopwatchManager
+ (void)warmUp;
- (MTMetrics)metrics;
- (MTStopwatchManager)init;
- (MTStopwatchManager)initWithConnectionProvider:(id)a3 metrics:(id)a4;
- (MTStopwatchManager)initWithConnectionProvider:(id)a3 metrics:(id)a4 notificationCenter:(id)a5;
- (MTStopwatchManager)initWithMetrics:(id)a3;
- (MTStopwatchManager)initWithoutXpc:(BOOL)a3;
- (MTStopwatchManagerExportedObject)exportedObject;
- (MTXPCConnectionProvider)connectionProvider;
- (NSNotificationCenter)notificationCenter;
- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4;
- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4 notificationCenter:(id)a5;
- (id)createStopwatch:(id)a3;
- (id)didAddLap:(id)a3 forStopwatch:(id)a4 sender:(id)a5;
- (id)didClearAllLapsForStopwatch:(id)a3 sender:(id)a4;
- (id)didLapLapTimerForStopwatch:(id)a3 sender:(id)a4;
- (id)didPauseLapTimerForStopwatch:(id)a3 sender:(id)a4;
- (id)didResetLapTimerForStopwatch:(id)a3 sender:(id)a4;
- (id)didResumeLapTimerForStopwatch:(id)a3 sender:(id)a4;
- (id)didStartLapTimerForStopwatch:(id)a3 sender:(id)a4;
- (id)getStopwatches;
- (id)removeStopwatch:(id)a3;
- (id)updateStopwatch:(id)a3;
- (void)dealloc;
- (void)reconnect;
- (void)setExportedObject:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setNotificationCenter:(id)a3;
@end

@implementation MTStopwatchManager

- (MTStopwatchManager)init
{
  v3 = objc_alloc_init(MTMetrics);
  v4 = [(MTStopwatchManager *)self initWithMetrics:v3];

  return v4;
}

- (MTStopwatchManager)initWithMetrics:(id)a3
{
  return (MTStopwatchManager *)[(MTStopwatchManager *)self _initWithConnectionProvidingBlock:&__block_literal_global_9 metrics:a3];
}

- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28EB8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 defaultCenter];
  id v10 = [(MTStopwatchManager *)self _initWithConnectionProvidingBlock:v8 metrics:v7 notificationCenter:v9];

  return v10;
}

- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4 notificationCenter:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, MTStopwatchManager *))a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MTStopwatchManager;
  v11 = [(MTStopwatchManager *)&v18 init];
  if (v11)
  {
    v12 = MTLogForCategory(5);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl(&dword_19CC95000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing...", buf, 0xCu);
    }

    objc_storeStrong((id *)&v11->_notificationCenter, a5);
    v13 = [[MTStopwatchManagerExportedObject alloc] initWithStopwatchManager:v11];
    exportedObject = v11->_exportedObject;
    v11->_exportedObject = v13;

    objc_storeStrong((id *)&v11->_metrics, a4);
    uint64_t v15 = v8[2](v8, v11);
    connectionProvider = v11->_connectionProvider;
    v11->_connectionProvider = (MTXPCConnectionProvider *)v15;
  }
  return v11;
}

id __38__MTStopwatchManager_initWithMetrics___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = MTStopwatchServerInterface();
  v4 = [v2 exportedObject];
  v5 = MTStopwatchClientInterface();
  v6 = +[MTXPCConnectionInfo infoForMachServiceName:@"com.apple.MobileTimer.stopwatchserver" remoteObjectInterface:v3 exportedObject:v4 exportedObjectInterface:v5 lifecycleNotification:@"com.apple.MTStopwatchServer.wakeup" requiredEntitlement:0 options:4096];

  objc_initWeak(&location, v2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__MTStopwatchManager_initWithMetrics___block_invoke_2;
  v9[3] = &unk_1E5915428;
  objc_copyWeak(&v10, &location);
  id v7 = +[MTXPCConnectionProvider providerWithConnectionInfo:v6 reconnectHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

- (MTStopwatchManagerExportedObject)exportedObject
{
  return self->_exportedObject;
}

+ (void)warmUp
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = a1;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ warming...", (uint8_t *)&v6, 0xCu);
  }

  id v4 = MTStopwatchServerInterface();
  id v5 = MTStopwatchClientInterface();
}

void __38__MTStopwatchManager_initWithMetrics___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reconnect];
}

- (MTStopwatchManager)initWithConnectionProvider:(id)a3 metrics:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__MTStopwatchManager_initWithConnectionProvider_metrics___block_invoke;
  v10[3] = &unk_1E5915450;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = [(MTStopwatchManager *)self _initWithConnectionProvidingBlock:v10 metrics:a4];

  return v8;
}

id __57__MTStopwatchManager_initWithConnectionProvider_metrics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (MTStopwatchManager)initWithConnectionProvider:(id)a3 metrics:(id)a4 notificationCenter:(id)a5
{
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__MTStopwatchManager_initWithConnectionProvider_metrics_notificationCenter___block_invoke;
  v12[3] = &unk_1E5915450;
  id v13 = v8;
  id v9 = v8;
  id v10 = [(MTStopwatchManager *)self _initWithConnectionProvidingBlock:v12 metrics:a4 notificationCenter:a5];

  return v10;
}

id __76__MTStopwatchManager_initWithConnectionProvider_metrics_notificationCenter___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (MTStopwatchManager)initWithoutXpc:(BOOL)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v5 = [(MTStopwatchManager *)self initWithConnectionProvider:0 metrics:0 notificationCenter:v4];

  return v5;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v6 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing...", buf, 0xCu);
  }

  [(MTXPCConnectionProvider *)self->_connectionProvider invalidate];
  v4.receiver = self;
  v4.super_class = (Class)MTStopwatchManager;
  [(MTStopwatchManager *)&v4 dealloc];
}

- (void)reconnect
{
  id v2 = [(MTStopwatchManager *)self connectionProvider];
  [v2 performRemoteBlock:&__block_literal_global_53 withErrorHandler:0];
}

uint64_t __31__MTStopwatchManager_reconnect__block_invoke(uint64_t a1, void *a2)
{
  return [a2 checkIn];
}

- (id)createStopwatch:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MTLogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    v19 = self;
    __int16 v20 = 2114;
    uint64_t v21 = v6;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ createStopwatch:%{public}@", buf, 0x16u);
  }
  uint64_t v7 = objc_opt_new();
  id v8 = [(MTStopwatchManager *)self connectionProvider];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  id v16 = v4;
  id v9 = v7;
  id v17 = v9;
  id v10 = v4;
  id v11 = objc_msgSend(v9, "errorOnlyCompletionHandlerAdapter", v15, 3221225472, __38__MTStopwatchManager_createStopwatch___block_invoke, &unk_1E5915498);
  [v8 performRemoteBlock:&v15 withErrorHandler:v11];

  v12 = v17;
  id v13 = v9;

  return v13;
}

void __38__MTStopwatchManager_createStopwatch___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - Adding Stopwatch", v7, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) errorOnlyCompletionHandlerAdapter];
  [v3 createStopwatch:v5 withCompletion:v6];
}

- (id)updateStopwatch:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    v19 = self;
    __int16 v20 = 2114;
    uint64_t v21 = v6;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ updateStopwatch: %{public}@", buf, 0x16u);
  }
  uint64_t v7 = objc_opt_new();
  id v8 = [(MTStopwatchManager *)self connectionProvider];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  id v16 = v4;
  id v9 = v7;
  id v17 = v9;
  id v10 = v4;
  id v11 = objc_msgSend(v9, "errorOnlyCompletionHandlerAdapter", v15, 3221225472, __38__MTStopwatchManager_updateStopwatch___block_invoke, &unk_1E5915498);
  [v8 performRemoteBlock:&v15 withErrorHandler:v11];

  v12 = v17;
  id v13 = v9;

  return v13;
}

void __38__MTStopwatchManager_updateStopwatch___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - Updating Stopwatch", v7, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) errorOnlyCompletionHandlerAdapter];
  [v3 updateStopwatch:v5 withCompletion:v6];
}

- (id)removeStopwatch:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    v19 = self;
    __int16 v20 = 2114;
    uint64_t v21 = v6;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ removeStopwatch: %{public}@", buf, 0x16u);
  }
  uint64_t v7 = objc_opt_new();
  id v8 = [(MTStopwatchManager *)self connectionProvider];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  id v16 = v4;
  id v9 = v7;
  id v17 = v9;
  id v10 = v4;
  id v11 = objc_msgSend(v9, "errorOnlyCompletionHandlerAdapter", v15, 3221225472, __38__MTStopwatchManager_removeStopwatch___block_invoke, &unk_1E5915498);
  [v8 performRemoteBlock:&v15 withErrorHandler:v11];

  v12 = v17;
  id v13 = v9;

  return v13;
}

void __38__MTStopwatchManager_removeStopwatch___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - Deleting Stopwatch", v7, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) errorOnlyCompletionHandlerAdapter];
  [v3 deleteStopwatch:v5 withCompletion:v6];
}

- (id)getStopwatches
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = MTLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ getStopwatches", buf, 0xCu);
  }

  id v4 = objc_opt_new();
  uint64_t v5 = [(MTStopwatchManager *)self connectionProvider];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__MTStopwatchManager_getStopwatches__block_invoke;
  v9[3] = &unk_1E59154E8;
  id v6 = v4;
  id v10 = v6;
  uint64_t v7 = [v6 errorOnlyCompletionHandlerAdapter];
  [v5 performRemoteBlock:v9 withErrorHandler:v7];

  return v6;
}

void __36__MTStopwatchManager_getStopwatches__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - getting stopwatches", buf, 2u);
  }

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__MTStopwatchManager_getStopwatches__block_invoke_55;
  v5[3] = &unk_1E59154C0;
  id v6 = *(id *)(a1 + 32);
  [v3 getStopwatchesWithCompletion:v5];
}

uint64_t __36__MTStopwatchManager_getStopwatches__block_invoke_55(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v3, "finishWithError:");
  }
  else {
    return [v3 finishWithResult:a2];
  }
}

- (id)didAddLap:(id)a3 forStopwatch:(id)a4 sender:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = MTLogForCategory(5);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v9 identifier];
    *(_DWORD *)buf = 138543618;
    v38 = self;
    __int16 v39 = 2114;
    v40 = v12;
    _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ addLap for: %{public}@", buf, 0x16u);
  }
  uint64_t v13 = objc_opt_new();
  objc_initWeak((id *)buf, self);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __52__MTStopwatchManager_didAddLap_forStopwatch_sender___block_invoke;
  v31[3] = &unk_1E5915510;
  id v14 = v13;
  id v32 = v14;
  id v15 = v10;
  id v33 = v15;
  objc_copyWeak(&v36, (id *)buf);
  id v16 = v8;
  id v34 = v16;
  id v17 = v9;
  id v35 = v17;
  objc_super v18 = (void *)MEMORY[0x19F3A0FB0](v31);
  v19 = [(MTStopwatchManager *)self connectionProvider];
  uint64_t v27 = MEMORY[0x1E4F143A8];
  id v20 = v16;
  id v28 = v20;
  id v21 = v17;
  id v29 = v21;
  id v22 = v18;
  id v30 = v22;
  v23 = objc_msgSend(v14, "errorOnlyCompletionHandlerAdapter", v27, 3221225472, __52__MTStopwatchManager_didAddLap_forStopwatch_sender___block_invoke_2, &unk_1E5915538);
  [v19 performRemoteBlock:&v27 withErrorHandler:v23];

  v24 = v30;
  id v25 = v14;

  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)buf);

  return v25;
}

void __52__MTStopwatchManager_didAddLap_forStopwatch_sender___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = NAEmptyResult();
  [v3 finishWithResult:v5 error:v4];

  id v6 = [*(id *)(a1 + 40) sourceIdentifier];

  if (!v4 && v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    if (WeakRetained)
    {
      id v9 = WeakRetained;
      id v8 = [WeakRetained exportedObject];
      [v8 didAddLap:*(void *)(a1 + 48) forStopwatch:*(void *)(a1 + 56) source:*(void *)(a1 + 40)];

      id WeakRetained = v9;
    }
  }
}

void __52__MTStopwatchManager_didAddLap_forStopwatch_sender___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - adding lap for stopwatch", v5, 2u);
  }

  [v3 didAddLap:a1[4] forStopwatch:a1[5] withCompletion:a1[6]];
}

- (id)didClearAllLapsForStopwatch:(id)a3 sender:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = MTLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 identifier];
    *(_DWORD *)buf = 138543618;
    v31 = self;
    __int16 v32 = 2114;
    id v33 = v9;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ didClearAllLapsForStopwatch for: %{public}@", buf, 0x16u);
  }
  id v10 = objc_opt_new();
  objc_initWeak((id *)buf, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __57__MTStopwatchManager_didClearAllLapsForStopwatch_sender___block_invoke;
  v25[3] = &unk_1E5915560;
  id v11 = v10;
  id v26 = v11;
  id v12 = v7;
  id v27 = v12;
  objc_copyWeak(&v29, (id *)buf);
  id v13 = v6;
  id v28 = v13;
  id v14 = (void *)MEMORY[0x19F3A0FB0](v25);
  id v15 = [(MTStopwatchManager *)self connectionProvider];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  id v16 = v13;
  id v23 = v16;
  id v17 = v14;
  id v24 = v17;
  objc_super v18 = objc_msgSend(v11, "errorOnlyCompletionHandlerAdapter", v22, 3221225472, __57__MTStopwatchManager_didClearAllLapsForStopwatch_sender___block_invoke_2, &unk_1E5915588);
  [v15 performRemoteBlock:&v22 withErrorHandler:v18];

  v19 = v24;
  id v20 = v11;

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);

  return v20;
}

void __57__MTStopwatchManager_didClearAllLapsForStopwatch_sender___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = NAEmptyResult();
  [v3 finishWithResult:v5 error:v4];

  id v6 = [*(id *)(a1 + 40) sourceIdentifier];

  if (!v4 && v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      id v9 = WeakRetained;
      id v8 = [WeakRetained exportedObject];
      [v8 didClearAllLapsForStopwatch:*(void *)(a1 + 48) source:*(void *)(a1 + 40)];

      id WeakRetained = v9;
    }
  }
}

void __57__MTStopwatchManager_didClearAllLapsForStopwatch_sender___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - didClearAllLapsForStopwatch", v5, 2u);
  }

  [v3 didClearAllLapsForStopwatch:*(void *)(a1 + 32) withCompletion:*(void *)(a1 + 40)];
}

- (id)didStartLapTimerForStopwatch:(id)a3 sender:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = MTLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 identifier];
    *(_DWORD *)buf = 138543618;
    v31 = self;
    __int16 v32 = 2114;
    id v33 = v9;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ didStartLapTimerForStopwatch for: %{public}@", buf, 0x16u);
  }
  id v10 = objc_opt_new();
  objc_initWeak((id *)buf, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __58__MTStopwatchManager_didStartLapTimerForStopwatch_sender___block_invoke;
  v25[3] = &unk_1E5915560;
  id v11 = v10;
  id v26 = v11;
  id v12 = v7;
  id v27 = v12;
  objc_copyWeak(&v29, (id *)buf);
  id v13 = v6;
  id v28 = v13;
  id v14 = (void *)MEMORY[0x19F3A0FB0](v25);
  id v15 = [(MTStopwatchManager *)self connectionProvider];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  id v16 = v13;
  id v23 = v16;
  id v17 = v14;
  id v24 = v17;
  objc_super v18 = objc_msgSend(v11, "errorOnlyCompletionHandlerAdapter", v22, 3221225472, __58__MTStopwatchManager_didStartLapTimerForStopwatch_sender___block_invoke_2, &unk_1E5915588);
  [v15 performRemoteBlock:&v22 withErrorHandler:v18];

  v19 = v24;
  id v20 = v11;

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);

  return v20;
}

void __58__MTStopwatchManager_didStartLapTimerForStopwatch_sender___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = NAEmptyResult();
  [v3 finishWithResult:v5 error:v4];

  id v6 = [*(id *)(a1 + 40) sourceIdentifier];

  if (!v4 && v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      id v9 = WeakRetained;
      id v8 = [WeakRetained exportedObject];
      [v8 didStartLapTimerForStopwatch:*(void *)(a1 + 48) source:*(void *)(a1 + 40)];

      id WeakRetained = v9;
    }
  }
}

void __58__MTStopwatchManager_didStartLapTimerForStopwatch_sender___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - didStartLapTimerForStopwatch", v5, 2u);
  }

  [v3 didStartLapTimerForStopwatch:*(void *)(a1 + 32) withCompletion:*(void *)(a1 + 40)];
}

- (id)didPauseLapTimerForStopwatch:(id)a3 sender:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = MTLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 identifier];
    *(_DWORD *)buf = 138543618;
    v31 = self;
    __int16 v32 = 2114;
    id v33 = v9;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ didPauseLapTimerForStopwatch for: %{public}@", buf, 0x16u);
  }
  id v10 = objc_opt_new();
  objc_initWeak((id *)buf, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __58__MTStopwatchManager_didPauseLapTimerForStopwatch_sender___block_invoke;
  v25[3] = &unk_1E5915560;
  id v11 = v10;
  id v26 = v11;
  id v12 = v7;
  id v27 = v12;
  objc_copyWeak(&v29, (id *)buf);
  id v13 = v6;
  id v28 = v13;
  id v14 = (void *)MEMORY[0x19F3A0FB0](v25);
  id v15 = [(MTStopwatchManager *)self connectionProvider];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  id v16 = v13;
  id v23 = v16;
  id v17 = v14;
  id v24 = v17;
  objc_super v18 = objc_msgSend(v11, "errorOnlyCompletionHandlerAdapter", v22, 3221225472, __58__MTStopwatchManager_didPauseLapTimerForStopwatch_sender___block_invoke_2, &unk_1E5915588);
  [v15 performRemoteBlock:&v22 withErrorHandler:v18];

  v19 = v24;
  id v20 = v11;

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);

  return v20;
}

void __58__MTStopwatchManager_didPauseLapTimerForStopwatch_sender___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = NAEmptyResult();
  [v3 finishWithResult:v5 error:v4];

  id v6 = [*(id *)(a1 + 40) sourceIdentifier];

  if (!v4 && v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      id v9 = WeakRetained;
      id v8 = [WeakRetained exportedObject];
      [v8 didPauseLapTimerForStopwatch:*(void *)(a1 + 48) source:*(void *)(a1 + 40)];

      id WeakRetained = v9;
    }
  }
}

void __58__MTStopwatchManager_didPauseLapTimerForStopwatch_sender___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - didPauseLapTimerForStopwatch", v5, 2u);
  }

  [v3 didPauseLapTimerForStopwatch:*(void *)(a1 + 32) withCompletion:*(void *)(a1 + 40)];
}

- (id)didLapLapTimerForStopwatch:(id)a3 sender:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = MTLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 identifier];
    *(_DWORD *)buf = 138543618;
    v31 = self;
    __int16 v32 = 2114;
    id v33 = v9;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ didLapLapTimerForStopwatch for: %{public}@", buf, 0x16u);
  }
  id v10 = objc_opt_new();
  objc_initWeak((id *)buf, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __56__MTStopwatchManager_didLapLapTimerForStopwatch_sender___block_invoke;
  v25[3] = &unk_1E5915560;
  id v11 = v10;
  id v26 = v11;
  id v12 = v7;
  id v27 = v12;
  objc_copyWeak(&v29, (id *)buf);
  id v13 = v6;
  id v28 = v13;
  id v14 = (void *)MEMORY[0x19F3A0FB0](v25);
  id v15 = [(MTStopwatchManager *)self connectionProvider];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  id v16 = v13;
  id v23 = v16;
  id v17 = v14;
  id v24 = v17;
  objc_super v18 = objc_msgSend(v11, "errorOnlyCompletionHandlerAdapter", v22, 3221225472, __56__MTStopwatchManager_didLapLapTimerForStopwatch_sender___block_invoke_2, &unk_1E5915588);
  [v15 performRemoteBlock:&v22 withErrorHandler:v18];

  v19 = v24;
  id v20 = v11;

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);

  return v20;
}

void __56__MTStopwatchManager_didLapLapTimerForStopwatch_sender___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = NAEmptyResult();
  [v3 finishWithResult:v5 error:v4];

  id v6 = [*(id *)(a1 + 40) sourceIdentifier];

  if (!v4 && v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      id v9 = WeakRetained;
      id v8 = [WeakRetained exportedObject];
      [v8 didLapLapTimerForStopwatch:*(void *)(a1 + 48) source:*(void *)(a1 + 40)];

      id WeakRetained = v9;
    }
  }
}

void __56__MTStopwatchManager_didLapLapTimerForStopwatch_sender___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - didLapLapTimerForStopwatch", v5, 2u);
  }

  [v3 didLapLapTimerForStopwatch:*(void *)(a1 + 32) withCompletion:*(void *)(a1 + 40)];
}

- (id)didResetLapTimerForStopwatch:(id)a3 sender:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = MTLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 identifier];
    *(_DWORD *)buf = 138543618;
    v31 = self;
    __int16 v32 = 2114;
    id v33 = v9;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ didResetLapTimerForStopwatch for: %{public}@", buf, 0x16u);
  }
  id v10 = objc_opt_new();
  objc_initWeak((id *)buf, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __58__MTStopwatchManager_didResetLapTimerForStopwatch_sender___block_invoke;
  v25[3] = &unk_1E5915560;
  id v11 = v10;
  id v26 = v11;
  id v12 = v7;
  id v27 = v12;
  objc_copyWeak(&v29, (id *)buf);
  id v13 = v6;
  id v28 = v13;
  id v14 = (void *)MEMORY[0x19F3A0FB0](v25);
  id v15 = [(MTStopwatchManager *)self connectionProvider];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  id v16 = v13;
  id v23 = v16;
  id v17 = v14;
  id v24 = v17;
  objc_super v18 = objc_msgSend(v11, "errorOnlyCompletionHandlerAdapter", v22, 3221225472, __58__MTStopwatchManager_didResetLapTimerForStopwatch_sender___block_invoke_2, &unk_1E5915588);
  [v15 performRemoteBlock:&v22 withErrorHandler:v18];

  v19 = v24;
  id v20 = v11;

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);

  return v20;
}

void __58__MTStopwatchManager_didResetLapTimerForStopwatch_sender___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = NAEmptyResult();
  [v3 finishWithResult:v5 error:v4];

  id v6 = [*(id *)(a1 + 40) sourceIdentifier];

  if (!v4 && v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      id v9 = WeakRetained;
      id v8 = [WeakRetained exportedObject];
      [v8 didResetLapTimerForStopwatch:*(void *)(a1 + 48) source:*(void *)(a1 + 40)];

      id WeakRetained = v9;
    }
  }
}

void __58__MTStopwatchManager_didResetLapTimerForStopwatch_sender___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - didResetLapTimerForStopwatch", v5, 2u);
  }

  [v3 didResetLapTimerForStopwatch:*(void *)(a1 + 32) withCompletion:*(void *)(a1 + 40)];
}

- (id)didResumeLapTimerForStopwatch:(id)a3 sender:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = MTLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 identifier];
    *(_DWORD *)buf = 138543618;
    v31 = self;
    __int16 v32 = 2114;
    id v33 = v9;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ didResumeLapTimerForStopwatch for: %{public}@", buf, 0x16u);
  }
  id v10 = objc_opt_new();
  objc_initWeak((id *)buf, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __59__MTStopwatchManager_didResumeLapTimerForStopwatch_sender___block_invoke;
  v25[3] = &unk_1E5915560;
  id v11 = v10;
  id v26 = v11;
  id v12 = v7;
  id v27 = v12;
  objc_copyWeak(&v29, (id *)buf);
  id v13 = v6;
  id v28 = v13;
  id v14 = (void *)MEMORY[0x19F3A0FB0](v25);
  id v15 = [(MTStopwatchManager *)self connectionProvider];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  id v16 = v13;
  id v23 = v16;
  id v17 = v14;
  id v24 = v17;
  objc_super v18 = objc_msgSend(v11, "errorOnlyCompletionHandlerAdapter", v22, 3221225472, __59__MTStopwatchManager_didResumeLapTimerForStopwatch_sender___block_invoke_2, &unk_1E5915588);
  [v15 performRemoteBlock:&v22 withErrorHandler:v18];

  v19 = v24;
  id v20 = v11;

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);

  return v20;
}

void __59__MTStopwatchManager_didResumeLapTimerForStopwatch_sender___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = NAEmptyResult();
  [v3 finishWithResult:v5 error:v4];

  id v6 = [*(id *)(a1 + 40) sourceIdentifier];

  if (!v4 && v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      id v9 = WeakRetained;
      id v8 = [WeakRetained exportedObject];
      [v8 didResumeLapTimerForStopwatch:*(void *)(a1 + 48) source:*(void *)(a1 + 40)];

      id WeakRetained = v9;
    }
  }
}

void __59__MTStopwatchManager_didResumeLapTimerForStopwatch_sender___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "MTStopwatchManager - didResumeLapTimerForStopwatch", v5, 2u);
  }

  [v3 didResumeLapTimerForStopwatch:*(void *)(a1 + 32) withCompletion:*(void *)(a1 + 40)];
}

- (void)setExportedObject:(id)a3
{
}

- (MTXPCConnectionProvider)connectionProvider
{
  return self->_connectionProvider;
}

- (MTMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
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
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_exportedObject, 0);
}

@end
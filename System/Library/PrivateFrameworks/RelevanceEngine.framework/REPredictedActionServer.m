@interface REPredictedActionServer
+ (id)sharedInstance;
- (REPredictedActionServer)init;
- (void)_accessOrEnqueueDataRequest:(id)a3 error:(id)a4;
- (void)_clearConnection;
- (void)_finishProcessingData;
- (void)_invalidateConnection;
- (void)_notifyObservers;
- (void)_queue_fetchPredicitions;
- (void)_queue_setupConnection;
- (void)_requestPredictions:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)fetchFirstPerformedActionDate:(id)a3;
- (void)fetchPerformedTodayCountForActionWithBundleIdentifer:(id)a3 actionIdentifier:(unint64_t)a4 completion:(id)a5;
- (void)fetchPredictedActions:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation REPredictedActionServer

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_23);
  }
  v2 = (void *)sharedInstance_Server;
  return v2;
}

uint64_t __41__REPredictedActionServer_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(REPredictedActionServer);
  uint64_t v1 = sharedInstance_Server;
  sharedInstance_Server = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (REPredictedActionServer)init
{
  v30.receiver = self;
  v30.super_class = (Class)REPredictedActionServer;
  v2 = [(REPredictedActionServer *)&v30 init];
  v3 = v2;
  if (v2)
  {
    predictions = v2->_predictions;
    v5 = (NSArray *)MEMORY[0x263EFFA68];
    v2->_predictions = (NSArray *)MEMORY[0x263EFFA68];

    counts = v3->_counts;
    v3->_counts = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.RelevanceEngine.REPredictedActionServer", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    v3->_fetchingData = 0;
    uint64_t v9 = [MEMORY[0x263EFF980] array];
    fetchCompletionBlocks = v3->_fetchCompletionBlocks;
    v3->_fetchCompletionBlocks = (NSMutableArray *)v9;

    v11 = objc_alloc_init(REObserverStore);
    observers = v3->_observers;
    v3->_observers = v11;

    objc_initWeak(&location, v3);
    v13 = v3->_queue;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __31__REPredictedActionServer_init__block_invoke;
    v27[3] = &unk_2644BC638;
    objc_copyWeak(&v28, &location);
    uint64_t v14 = +[REUpNextScheduler schedulerWithQueue:v13 delay:v27 updateBlock:1.0];
    scheduler = v3->_scheduler;
    v3->_scheduler = (REUpNextScheduler *)v14;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)REHandlePredictedActionsUpdated, @"com.apple.relevanceengine.predictedactionsupdated", 0, CFNotificationSuspensionBehaviorCoalesce);
    v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v3 selector:sel__requestPredictions_ name:@"REShowRecentDeveloperDonationsChangedNotification" object:0];

    v18 = [MEMORY[0x263F08A00] defaultCenter];
    v19 = soft_RESignificantLocationUpdateNotification();
    [v18 addObserver:v3 selector:sel__requestPredictions_ name:v19 object:0];

    v20 = [MEMORY[0x263F08A00] defaultCenter];
    v21 = RESignificantTimeChangeNotification();
    [v20 addObserver:v3 selector:sel__requestPredictions_ name:v21 object:0];

    v22 = [MEMORY[0x263F08A00] defaultCenter];
    [v22 addObserver:v3 selector:sel__requestPredictions_ name:@"REDeviceLockStateChangedNotification" object:0];

    v23 = v3->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __31__REPredictedActionServer_init__block_invoke_2;
    block[3] = &unk_2644BC660;
    v26 = v3;
    dispatch_async(v23, block);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __31__REPredictedActionServer_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_fetchPredicitions");
}

uint64_t __31__REPredictedActionServer_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_fetchPredicitions");
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.relevanceengine.predictedactionsupdated", 0);
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:@"REShowRecentDeveloperDonationsChangedNotification" object:0];

  v5 = [MEMORY[0x263F08A00] defaultCenter];
  v6 = soft_RESignificantLocationUpdateNotification();
  [v5 removeObserver:self name:v6 object:0];

  dispatch_queue_t v7 = [MEMORY[0x263F08A00] defaultCenter];
  v8 = RESignificantTimeChangeNotification();
  [v7 removeObserver:self name:v8 object:0];

  uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 removeObserver:self name:@"REDeviceLockStateChangedNotification" object:0];

  v10.receiver = self;
  v10.super_class = (Class)REPredictedActionServer;
  [(REPredictedActionServer *)&v10 dealloc];
}

- (void)addObserver:(id)a3
{
  observers = self->_observers;
  id v4 = a3;
  [(REObserverStore *)observers addObserver:v4];
  [v4 predictedActionsDidUpdate];
}

- (void)removeObserver:(id)a3
{
}

- (void)fetchPredictedActions:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__REPredictedActionServer_fetchPredictedActions___block_invoke;
    v8[3] = &unk_2644BE248;
    id v9 = v4;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __49__REPredictedActionServer_fetchPredictedActions___block_invoke_2;
    v6[3] = &unk_2644BCBC0;
    id v7 = v9;
    [(REPredictedActionServer *)self _accessOrEnqueueDataRequest:v8 error:v6];
  }
}

uint64_t __49__REPredictedActionServer_fetchPredictedActions___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49__REPredictedActionServer_fetchPredictedActions___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchFirstPerformedActionDate:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __57__REPredictedActionServer_fetchFirstPerformedActionDate___block_invoke;
    v8[3] = &unk_2644BE248;
    id v9 = v4;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __57__REPredictedActionServer_fetchFirstPerformedActionDate___block_invoke_2;
    v6[3] = &unk_2644BCBC0;
    id v7 = v9;
    [(REPredictedActionServer *)self _accessOrEnqueueDataRequest:v8 error:v6];
  }
}

uint64_t __57__REPredictedActionServer_fetchFirstPerformedActionDate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__REPredictedActionServer_fetchFirstPerformedActionDate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_accessOrEnqueueDataRequest:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__REPredictedActionServer__accessOrEnqueueDataRequest_error___block_invoke;
  block[3] = &unk_2644BE298;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __61__REPredictedActionServer__accessOrEnqueueDataRequest_error___block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[56])
  {
    objc_initWeak(&location, v2);
    v3 = *(void **)(*(void *)(a1 + 32) + 72);
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    v8 = __61__REPredictedActionServer__accessOrEnqueueDataRequest_error___block_invoke_2;
    id v9 = &unk_2644BE270;
    objc_copyWeak(&v12, &location);
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    id v4 = (void *)MEMORY[0x223C31700](&v6);
    objc_msgSend(v3, "addObject:", v4, v6, v7, v8, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
}

void __61__REPredictedActionServer__accessOrEnqueueDataRequest_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)fetchPerformedTodayCountForActionWithBundleIdentifer:(id)a3 actionIdentifier:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    queue = self->_queue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __108__REPredictedActionServer_fetchPerformedTodayCountForActionWithBundleIdentifer_actionIdentifier_completion___block_invoke;
    v11[3] = &unk_2644BDDD8;
    v11[4] = self;
    id v12 = v8;
    unint64_t v14 = a4;
    id v13 = v9;
    dispatch_async(queue, v11);
  }
}

void __108__REPredictedActionServer_fetchPerformedTodayCountForActionWithBundleIdentifer_actionIdentifier_completion___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  v3 = (void *)v2[1];
  if (!v3)
  {
    objc_msgSend(v2, "_queue_setupConnection");
    v3 = *(void **)(a1[4] + 8);
  }
  id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_14];
  [v4 fetchPerformedTodayCountForActionWithBundleIdentifer:a1[5] actionIdentifier:a1[7] completion:a1[6]];
}

void __108__REPredictedActionServer_fetchPerformedTodayCountForActionWithBundleIdentifer_actionIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = RELogForDomain(12);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 localizedDescription];
    int v5 = 136315138;
    uint64_t v6 = [v4 UTF8String];
    _os_log_impl(&dword_21E6E6000, v3, OS_LOG_TYPE_DEFAULT, "Failed to get server proxy: %s", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_requestPredictions:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    int v5 = RELogForDomain(12);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [v4 name];
      int v12 = 138543362;
      id v13 = v6;
      _os_log_impl(&dword_21E6E6000, v5, OS_LOG_TYPE_INFO, "Received %{public}@ notification that will trigger a prediction fetch from relevanced.", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v7 = [v4 name];
  char v8 = [v7 isEqualToString:@"com.apple.relevanceengine.predictedactionsupdated"];

  id v9 = [v4 name];
  char v10 = [v9 isEqualToString:@"REShowRecentDeveloperDonationsChangedNotification"];

  [(NSDate *)self->_lastFetchedDate timeIntervalSinceNow];
  if (v11 < 0.0) {
    double v11 = -v11;
  }
  if ((v8 & 1) != 0 || (v10 & 1) != 0 || v11 > 1800.0) {
    [(REUpNextScheduler *)self->_scheduler schedule];
  }
}

- (void)_queue_fetchPredicitions
{
  if (self->_fetchingData)
  {
    objc_initWeak(&location, self);
    fetchCompletionBlocks = self->_fetchCompletionBlocks;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke;
    v24[3] = &unk_2644BC638;
    id v4 = &v25;
    objc_copyWeak(&v25, &location);
    int v5 = (void *)MEMORY[0x223C31700](v24);
    [(NSMutableArray *)fetchCompletionBlocks addObject:v5];
  }
  else
  {
    self->_fetchingData = 1;
    uint64_t v6 = [MEMORY[0x263EFF910] date];
    lastFetchedDate = self->_lastFetchedDate;
    self->_lastFetchedDate = v6;

    if (!self->_connection) {
      [(REPredictedActionServer *)self _queue_setupConnection];
    }
    objc_initWeak(&location, self);
    connection = self->_connection;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_16;
    v22[3] = &unk_2644BE2C0;
    id v4 = &v23;
    objc_copyWeak(&v23, &location);
    id v9 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v22];
    char v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_17;
    v19[3] = &unk_2644BE2E8;
    objc_copyWeak(&v21, &location);
    double v11 = v10;
    v20 = v11;
    [v9 requestPredictedActionsWithCompletion:v19];
    dispatch_group_enter(v11);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_25;
    v16[3] = &unk_2644BE310;
    objc_copyWeak(&v18, &location);
    int v12 = v11;
    v17 = v12;
    [v9 fetchFirstPerformedActionDate:v16];
    queue = self->_queue;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_28;
    v14[3] = &unk_2644BC638;
    objc_copyWeak(&v15, &location);
    dispatch_group_notify(v12, queue, v14);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v21);
  }
  objc_destroyWeak(v4);
  objc_destroyWeak(&location);
}

void __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke(uint64_t a1)
{
  id v2 = RELogForDomain(12);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21E6E6000, v2, OS_LOG_TYPE_INFO, "Enqueue prediction fetch since we were already fetching data.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _requestPredictions:0];
}

void __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[6];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_2;
    v7[3] = &unk_2644BC688;
    id v8 = v3;
    id v9 = v5;
    dispatch_async(v6, v7);
  }
}

uint64_t __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = RELogForDomain(12);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) localizedDescription];
    int v10 = 136315138;
    uint64_t v11 = [v3 UTF8String];
    _os_log_impl(&dword_21E6E6000, v2, OS_LOG_TYPE_DEFAULT, "Failed to get server proxy: %s", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = *(void **)(v4 + 24);
  uint64_t v6 = MEMORY[0x263EFFA68];
  *(void *)(v4 + 24) = MEMORY[0x263EFFA68];

  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = v6;

  [*(id *)(a1 + 40) _finishProcessingData];
  return [*(id *)(a1 + 40) _notifyObservers];
}

void __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained[6];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_2_18;
    v10[3] = &unk_2644BD040;
    id v11 = v5;
    uint64_t v12 = v8;
    id v13 = v6;
    id v14 = *(id *)(a1 + 32);
    dispatch_async(v9, v10);
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_2_18(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = RELogForDomain(12);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) valueForKeyPath:@"bundleIdentifier"];
    uint64_t v4 = [v3 componentsJoinedByString:@", "];
    int v11 = 138543362;
    uint64_t v12 = v4;
    _os_log_impl(&dword_21E6E6000, v2, OS_LOG_TYPE_INFO, "Received requested predictions from daemon: %{public}@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v5 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "re_arrayMappedWithArray:", *(void *)(a1 + 32));
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v5;

  uint64_t v8 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:*(void *)(a1 + 48) copyItems:1];
  uint64_t v9 = *(void *)(a1 + 40);
  int v10 = *(void **)(v9 + 32);
  *(void *)(v9 + 32) = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_25(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[6];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_2_26;
    block[3] = &unk_2644BDBF0;
    id v8 = v3;
    uint64_t v9 = v5;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(v6, block);
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_2_26(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = RELogForDomain(12);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_21E6E6000, v2, OS_LOG_TYPE_INFO, "Received first perfomed action date from daemon: (%@)", (uint8_t *)&v4, 0xCu);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 40) + 40), *(id *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __51__REPredictedActionServer__queue_fetchPredicitions__block_invoke_28(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _finishProcessingData];
    [v2 _notifyObservers];
    id WeakRetained = v2;
  }
}

- (void)_notifyObservers
{
}

uint64_t __43__REPredictedActionServer__notifyObservers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 predictedActionsDidUpdate];
}

- (void)_finishProcessingData
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  self->_fetchingData = 0;
  uint64_t v3 = (void *)[(NSMutableArray *)self->_fetchCompletionBlocks copy];
  [(NSMutableArray *)self->_fetchCompletionBlocks removeAllObjects];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_queue_setupConnection
{
  uint64_t v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.relevanceengine.predictedactionserver" options:4096];
  connection = self->_connection;
  self->_connection = v3;

  uint64_t v5 = self->_connection;
  uint64_t v6 = REPredictionServerInterface();
  [(NSXPCConnection *)v5 setRemoteObjectInterface:v6];

  uint64_t v7 = self->_connection;
  uint64_t v8 = REPredictionClientInterface();
  [(NSXPCConnection *)v7 setExportedInterface:v8];

  [(NSXPCConnection *)self->_connection setExportedObject:self];
  objc_initWeak(&location, self);
  long long v9 = self->_connection;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__REPredictedActionServer__queue_setupConnection__block_invoke;
  v13[3] = &unk_2644BC638;
  objc_copyWeak(&v14, &location);
  [(NSXPCConnection *)v9 setInterruptionHandler:v13];
  long long v10 = self->_connection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__REPredictedActionServer__queue_setupConnection__block_invoke_33;
  v11[3] = &unk_2644BC638;
  objc_copyWeak(&v12, &location);
  [(NSXPCConnection *)v10 setInvalidationHandler:v11];
  [(NSXPCConnection *)self->_connection resume];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __49__REPredictedActionServer__queue_setupConnection__block_invoke(uint64_t a1)
{
  id v2 = RELogForDomain(12);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21E6E6000, v2, OS_LOG_TYPE_DEFAULT, "REPredictedActionServer XPC connection interrupted.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _clearConnection];
}

void __49__REPredictedActionServer__queue_setupConnection__block_invoke_33(uint64_t a1)
{
  id v2 = RELogForDomain(12);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 0;
    _os_log_impl(&dword_21E6E6000, v2, OS_LOG_TYPE_DEFAULT, "REPredictedActionServer XPC connection invalidated.", (uint8_t *)v5, 2u);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[1] setExportedObject:0];
  }
}

- (void)_clearConnection
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__REPredictedActionServer__clearConnection__block_invoke;
  block[3] = &unk_2644BC660;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __43__REPredictedActionServer__clearConnection__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateConnection];
  id v2 = *(void **)(a1 + 32);
  return [v2 _finishProcessingData];
}

- (void)_invalidateConnection
{
  [(NSXPCConnection *)self->_connection setExportedObject:0];
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_fetchCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_lastFetchedDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_firstPerformedDate, 0);
  objc_storeStrong((id *)&self->_counts, 0);
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
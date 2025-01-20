@interface WFServiceReachabilityObserver
+ (id)sharedObserver;
- (BOOL)isServiceAvailable;
- (BOOL)removeBlockObserverWithHandle:(id)a3;
- (BOOL)removeObserver:(id)a3;
- (NSHashTable)observerObjects;
- (NSMutableDictionary)blockObserversForUUID;
- (NWPathEvaluator)serviceReachabilityEvaluator;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)observerQueue;
- (WFServiceReachabilityObserver)init;
- (id)_init;
- (id)addBlockObserver:(id)a3;
- (int64_t)reachability;
- (void)_deliverReachabilityUpdate:(int64_t)a3;
- (void)_setupReachability;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeAllObservers;
- (void)setBlockObserversForUUID:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setObserverObjects:(id)a3;
- (void)setObserverQueue:(id)a3;
- (void)setReachability:(int64_t)a3;
- (void)setServiceReachabilityEvaluator:(id)a3;
@end

@implementation WFServiceReachabilityObserver

+ (id)sharedObserver
{
  if (sharedObserver_onceToken_0 != -1) {
    dispatch_once(&sharedObserver_onceToken_0, &__block_literal_global_10);
  }
  v2 = (void *)sharedObserver_defaultObserver_0;
  return v2;
}

uint64_t __47__WFServiceReachabilityObserver_sharedObserver__block_invoke()
{
  sharedObserver_defaultObserver_0 = [[WFServiceReachabilityObserver alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (WFServiceReachabilityObserver)init
{
  return 0;
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)WFServiceReachabilityObserver;
  v2 = [(WFServiceReachabilityObserver *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.WeatherFoundation.reachability.observerQueue", MEMORY[0x263EF83A8]);
    [(WFServiceReachabilityObserver *)v2 setObserverQueue:v3];

    v4 = objc_opt_new();
    [(WFServiceReachabilityObserver *)v2 setBlockObserversForUUID:v4];

    v5 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [(WFServiceReachabilityObserver *)v2 setObserverObjects:v5];

    [(WFServiceReachabilityObserver *)v2 _setupReachability];
  }
  return v2;
}

- (void)dealloc
{
  [(WFServiceReachabilityObserver *)self removeAllObservers];
  dispatch_queue_t v3 = [(WFServiceReachabilityObserver *)self observerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__WFServiceReachabilityObserver_dealloc__block_invoke;
  block[3] = &unk_2644305E8;
  block[4] = self;
  dispatch_barrier_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)WFServiceReachabilityObserver;
  [(WFServiceReachabilityObserver *)&v4 dealloc];
}

void __40__WFServiceReachabilityObserver_dealloc__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serviceReachabilityEvaluator];
  [v2 removeObserver:*(void *)(a1 + 32) forKeyPath:@"path.status"];
}

- (OS_dispatch_queue)callbackQueue
{
  p_callbackQueue = &self->_callbackQueue;
  callbackQueue = self->_callbackQueue;
  if (!callbackQueue)
  {
    objc_storeStrong((id *)p_callbackQueue, MEMORY[0x263EF83A0]);
    callbackQueue = *p_callbackQueue;
  }
  return callbackQueue;
}

- (int64_t)reachability
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  dispatch_queue_t v3 = [(WFServiceReachabilityObserver *)self observerQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__WFServiceReachabilityObserver_reachability__block_invoke;
  v6[3] = &unk_2644307A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __45__WFServiceReachabilityObserver_reachability__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8);
  return result;
}

- (BOOL)isServiceAvailable
{
  return [(WFServiceReachabilityObserver *)self reachability] == 1;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, v4);
    v5 = [(WFServiceReachabilityObserver *)self observerObjects];
    v6 = [(WFServiceReachabilityObserver *)self observerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__WFServiceReachabilityObserver_addObserver___block_invoke;
    block[3] = &unk_264431560;
    id v9 = v5;
    id v7 = v5;
    objc_copyWeak(&v10, &location);
    dispatch_barrier_async(v6, block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __45__WFServiceReachabilityObserver_addObserver___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 addObject:WeakRetained];
}

- (BOOL)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, v4);
    v5 = [(WFServiceReachabilityObserver *)self observerObjects];
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    v6 = [(WFServiceReachabilityObserver *)self observerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__WFServiceReachabilityObserver_removeObserver___block_invoke;
    block[3] = &unk_2644317A0;
    v16 = &v18;
    id v7 = v5;
    id v15 = v7;
    objc_copyWeak(&v17, &location);
    dispatch_sync(v6, block);

    if (*((unsigned char *)v19 + 24))
    {
      v8 = [(WFServiceReachabilityObserver *)self observerQueue];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __48__WFServiceReachabilityObserver_removeObserver___block_invoke_2;
      v11[3] = &unk_264431560;
      id v12 = v7;
      objc_copyWeak(&v13, &location);
      dispatch_barrier_async(v8, v11);

      objc_destroyWeak(&v13);
      BOOL v9 = *((unsigned char *)v19 + 24) != 0;
    }
    else
    {
      BOOL v9 = 0;
    }
    objc_destroyWeak(&v17);

    _Block_object_dispose(&v18, 8);
    objc_destroyWeak(&location);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void __48__WFServiceReachabilityObserver_removeObserver___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 containsObject:WeakRetained];
}

void __48__WFServiceReachabilityObserver_removeObserver___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 removeObject:WeakRetained];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  if ([v10 isEqualToString:@"path"])
  {
    id v13 = [v12 path];

    uint64_t v14 = [v13 status];
    [(WFServiceReachabilityObserver *)self _deliverReachabilityUpdate:(v14 & 0xFFFFFFFFFFFFFFFDLL) == 1];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)WFServiceReachabilityObserver;
    [(WFServiceReachabilityObserver *)&v15 observeValueForKeyPath:v10 ofObject:v12 change:v11 context:a6];
  }
}

- (id)addBlockObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(WFServiceReachabilityObserver *)self blockObserversForUUID];
    v6 = [MEMORY[0x263F08C38] UUID];
    id v7 = [(WFServiceReachabilityObserver *)self observerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__WFServiceReachabilityObserver_addBlockObserver___block_invoke;
    block[3] = &unk_2644317C8;
    id v14 = v5;
    id v16 = v4;
    id v8 = v6;
    id v15 = v8;
    id v9 = v5;
    dispatch_barrier_async(v7, block);

    id v10 = v15;
    id v11 = v8;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __50__WFServiceReachabilityObserver_addBlockObserver___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id)[*(id *)(a1 + 48) copy];
  [v2 setObject:v3 forKey:*(void *)(a1 + 40)];
}

- (BOOL)removeBlockObserverWithHandle:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(WFServiceReachabilityObserver *)self blockObserversForUUID];
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    v6 = [(WFServiceReachabilityObserver *)self observerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__WFServiceReachabilityObserver_removeBlockObserverWithHandle___block_invoke;
    block[3] = &unk_2644317F0;
    uint64_t v18 = &v19;
    id v7 = v5;
    id v16 = v7;
    id v8 = v4;
    id v17 = v8;
    dispatch_sync(v6, block);

    if (*((unsigned char *)v20 + 24))
    {
      id v9 = [(WFServiceReachabilityObserver *)self observerQueue];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __63__WFServiceReachabilityObserver_removeBlockObserverWithHandle___block_invoke_2;
      v12[3] = &unk_264431680;
      id v13 = v7;
      id v14 = v8;
      dispatch_barrier_async(v9, v12);

      BOOL v10 = *((unsigned char *)v20 + 24) != 0;
    }
    else
    {
      BOOL v10 = 0;
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

uint64_t __63__WFServiceReachabilityObserver_removeBlockObserverWithHandle___block_invoke(uint64_t a1)
{
  uint64_t result = CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 32), *(const void **)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result != 0;
  return result;
}

uint64_t __63__WFServiceReachabilityObserver_removeBlockObserverWithHandle___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)_setupReachability
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__1;
  BOOL v10 = __Block_byref_object_dispose__1;
  id v11 = [(WFServiceReachabilityObserver *)self serviceReachabilityEvaluator];
  if (!v7[5])
  {
    id v3 = [WFReachabilityConfigurationRequest alloc];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __51__WFServiceReachabilityObserver__setupReachability__block_invoke;
    v5[3] = &unk_264431818;
    v5[4] = &v6;
    id v4 = [(WFReachabilityConfigurationRequest *)v3 initWithResultHandler:v5];
    [(WFTask *)v4 executeSynchronously];
    [(WFServiceReachabilityObserver *)self setServiceReachabilityEvaluator:v7[5]];
    [(id)v7[5] addObserver:self forKeyPath:@"path" options:5 context:0];
    -[WFServiceReachabilityObserver _deliverReachabilityUpdate:](self, "_deliverReachabilityUpdate:", objc_msgSend((id)v7[5], "wf_isReachable"));
  }
  _Block_object_dispose(&v6, 8);
}

void __51__WFServiceReachabilityObserver__setupReachability__block_invoke(uint64_t a1, void *a2)
{
}

- (void)_deliverReachabilityUpdate:(int64_t)a3
{
  v5 = [(WFServiceReachabilityObserver *)self blockObserversForUUID];
  uint64_t v6 = [(WFServiceReachabilityObserver *)self observerObjects];
  id v7 = [(WFServiceReachabilityObserver *)self callbackQueue];
  uint64_t v8 = [(WFServiceReachabilityObserver *)self observerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__WFServiceReachabilityObserver__deliverReachabilityUpdate___block_invoke;
  block[3] = &unk_264431890;
  id v15 = v7;
  int64_t v16 = a3;
  void block[4] = self;
  id v13 = v6;
  id v14 = v5;
  id v9 = v7;
  id v10 = v5;
  id v11 = v6;
  dispatch_barrier_async(v8, block);
}

void __60__WFServiceReachabilityObserver__deliverReachabilityUpdate___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 8) != *(void *)(a1 + 64))
  {
    id v2 = WFLogForCategory(8uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      if (*(void *)(a1 + 64) == 1) {
        id v3 = @"UP";
      }
      else {
        id v3 = @"DOWN";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v3;
      _os_log_impl(&dword_21C988000, v2, OS_LOG_TYPE_INFO, "Network state changed: %@", buf, 0xCu);
    }

    *(void *)(*(void *)(a1 + 32) + 8) = *(void *)(a1 + 64);
    id v4 = [*(id *)(a1 + 40) objectEnumerator];
    v5 = [v4 allObjects];

    uint64_t v6 = [*(id *)(a1 + 48) allValues];
    id v7 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__WFServiceReachabilityObserver__deliverReachabilityUpdate___block_invoke_21;
    block[3] = &unk_264431890;
    id v13 = v6;
    id v8 = *(id *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    id v14 = v8;
    id v15 = v5;
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = v9;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v7, block);
  }
}

void __60__WFServiceReachabilityObserver__deliverReachabilityUpdate___block_invoke_21(uint64_t a1)
{
  size_t v2 = [*(id *)(a1 + 32) count];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__WFServiceReachabilityObserver__deliverReachabilityUpdate___block_invoke_2;
  block[3] = &unk_264431840;
  id v3 = *(NSObject **)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 64);
  id v16 = v4;
  uint64_t v17 = v5;
  dispatch_apply(v2, v3, block);
  size_t v6 = [*(id *)(a1 + 48) count];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__WFServiceReachabilityObserver__deliverReachabilityUpdate___block_invoke_3;
  v11[3] = &unk_264431868;
  id v7 = *(NSObject **)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 64);
  id v12 = v8;
  uint64_t v13 = v9;
  uint64_t v14 = v10;
  dispatch_apply(v6, v7, v11);
}

void __60__WFServiceReachabilityObserver__deliverReachabilityUpdate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  v3[2](v3, *(void *)(a1 + 40));
}

void __60__WFServiceReachabilityObserver__deliverReachabilityUpdate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectAtIndex:a2];
  [v3 serviceConnectivityObserver:*(void *)(a1 + 40) hasUpdatedReachability:*(void *)(a1 + 48)];
}

- (void)removeAllObservers
{
  id v3 = [(WFServiceReachabilityObserver *)self blockObserversForUUID];
  id v4 = [(WFServiceReachabilityObserver *)self observerObjects];
  uint64_t v5 = [(WFServiceReachabilityObserver *)self observerQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__WFServiceReachabilityObserver_removeAllObservers__block_invoke;
  v8[3] = &unk_264431680;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_barrier_async(v5, v8);
}

uint64_t __51__WFServiceReachabilityObserver_removeAllObservers__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeAllObjects];
  size_t v2 = *(void **)(a1 + 40);
  return [v2 removeAllObjects];
}

- (void)setReachability:(int64_t)a3
{
  self->_reachability = a3;
}

- (OS_dispatch_queue)observerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setObserverQueue:(id)a3
{
}

- (NSMutableDictionary)blockObserversForUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBlockObserversForUUID:(id)a3
{
}

- (NSHashTable)observerObjects
{
  return (NSHashTable *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObserverObjects:(id)a3
{
}

- (void)setCallbackQueue:(id)a3
{
}

- (NWPathEvaluator)serviceReachabilityEvaluator
{
  return (NWPathEvaluator *)objc_getProperty(self, a2, 48, 1);
}

- (void)setServiceReachabilityEvaluator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceReachabilityEvaluator, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_observerObjects, 0);
  objc_storeStrong((id *)&self->_blockObserversForUUID, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
}

@end
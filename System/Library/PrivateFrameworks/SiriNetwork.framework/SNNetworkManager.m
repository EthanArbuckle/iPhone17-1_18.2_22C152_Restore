@interface SNNetworkManager
+ (id)sharedInstance;
+ (void)acquireDormancySuspendAssertion:(const void *)a3;
+ (void)releaseDormancySuspendAssertion:(const void *)a3;
- (SNNetworkManagerInternal)underlyingNetworkManager;
- (id)_init;
- (int64_t)networkQuality:(int64_t)a3;
- (void)acquireWiFiAssertion:(int64_t)a3;
- (void)addObserver:(id)a3;
- (void)forceFastDormancy;
- (void)getLinkRecommendation:(BOOL)a3 recommendation:(id)a4;
- (void)getLinkRecommendationMetrics:(id)a3;
- (void)networkManagerLostNonWWANConnectivity:(id)a3;
- (void)networkManagerNetworkUnreachable:(id)a3;
- (void)networkManagerNonWWANDidBecomeAvailable:(id)a3;
- (void)registerClient;
- (void)releaseWiFiAssertion;
- (void)removeObserver:(id)a3;
- (void)resetLinkRecommendationInfo;
- (void)setUnderlyingNetworkManager:(id)a3;
- (void)startMonitoringNetworkForHost:(id)a3;
- (void)stopMonitoringNetwork;
- (void)unregisterClient;
- (void)updateNetworkPerformanceFeed;
@end

@implementation SNNetworkManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_sSharedInstance_0;

  return v2;
}

void __34__SNNetworkManager_sharedInstance__block_invoke()
{
  id v0 = [[SNNetworkManager alloc] _init];
  v1 = (void *)sharedInstance_sSharedInstance_0;
  sharedInstance_sSharedInstance_0 = (uint64_t)v0;
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)SNNetworkManager;
  v2 = [(SNNetworkManager *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("SNNetworkManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:5 capacity:1];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    uint64_t v7 = +[SNNetworkManagerInternal shared];
    underlyingNetworkManager = v2->_underlyingNetworkManager;
    v2->_underlyingNetworkManager = (SNNetworkManagerInternal *)v7;
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__SNNetworkManager_addObserver___block_invoke;
  block[3] = &unk_26550B650;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __32__SNNetworkManager_addObserver___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[1] addObject:*(void *)(a1 + 32)];
  objc_msgSend(WeakRetained[3], "addObserver:");
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__SNNetworkManager_removeObserver___block_invoke;
  block[3] = &unk_26550B650;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __35__SNNetworkManager_removeObserver___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[1] removeObject:*(void *)(a1 + 32)];
  if (![WeakRetained[1] count]) {
    objc_msgSend(WeakRetained[3], "removeObserver:");
  }
}

- (void)startMonitoringNetworkForHost:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SNNetworkManager_startMonitoringNetworkForHost___block_invoke;
  block[3] = &unk_26550B650;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __50__SNNetworkManager_startMonitoringNetworkForHost___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[3] startMonitoringNetwork:*(void *)(a1 + 32)];
}

- (void)stopMonitoringNetwork
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__SNNetworkManager_stopMonitoringNetwork__block_invoke;
  v4[3] = &unk_26550B678;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __41__SNNetworkManager_stopMonitoringNetwork__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[3] stopMonitoringNetwork];
}

- (void)acquireWiFiAssertion:(int64_t)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SNNetworkManager_acquireWiFiAssertion___block_invoke;
  block[3] = &unk_26550B6A0;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __41__SNNetworkManager_acquireWiFiAssertion___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[3] acquireWiFiAssertionWithWifiAssertionTypeRawValue:*(void *)(a1 + 40)];
}

- (void)releaseWiFiAssertion
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__SNNetworkManager_releaseWiFiAssertion__block_invoke;
  v4[3] = &unk_26550B678;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __40__SNNetworkManager_releaseWiFiAssertion__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[3] releaseWiFiAssertion];
}

- (void)forceFastDormancy
{
}

+ (void)acquireDormancySuspendAssertion:(const void *)a3
{
}

+ (void)releaseDormancySuspendAssertion:(const void *)a3
{
}

- (void)registerClient
{
}

- (void)unregisterClient
{
}

- (void)resetLinkRecommendationInfo
{
}

- (void)getLinkRecommendation:(BOOL)a3 recommendation:(id)a4
{
}

- (void)getLinkRecommendationMetrics:(id)a3
{
}

- (void)updateNetworkPerformanceFeed
{
}

- (int64_t)networkQuality:(int64_t)a3
{
  return [(SNNetworkManagerInternal *)self->_underlyingNetworkManager networkQualityWithNetworkType:a3];
}

- (void)networkManagerLostNonWWANConnectivity:(id)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__SNNetworkManager_networkManagerLostNonWWANConnectivity___block_invoke;
  block[3] = &unk_26550B650;
  objc_copyWeak(&v6, &location);
  void block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__SNNetworkManager_networkManagerLostNonWWANConnectivity___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = WeakRetained[1];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "networkManagerLostNonWWANConnectivity:", *(void *)(a1 + 32), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)networkManagerNetworkUnreachable:(id)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SNNetworkManager_networkManagerNetworkUnreachable___block_invoke;
  block[3] = &unk_26550B650;
  objc_copyWeak(&v6, &location);
  void block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __53__SNNetworkManager_networkManagerNetworkUnreachable___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = WeakRetained[1];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "networkManagerNetworkUnreachable:", *(void *)(a1 + 32), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)networkManagerNonWWANDidBecomeAvailable:(id)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__SNNetworkManager_networkManagerNonWWANDidBecomeAvailable___block_invoke;
  block[3] = &unk_26550B650;
  objc_copyWeak(&v6, &location);
  void block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __60__SNNetworkManager_networkManagerNonWWANDidBecomeAvailable___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = WeakRetained[1];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "networkManagerNonWWANDidBecomeAvailable:", *(void *)(a1 + 32), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (SNNetworkManagerInternal)underlyingNetworkManager
{
  return self->_underlyingNetworkManager;
}

- (void)setUnderlyingNetworkManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingNetworkManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end
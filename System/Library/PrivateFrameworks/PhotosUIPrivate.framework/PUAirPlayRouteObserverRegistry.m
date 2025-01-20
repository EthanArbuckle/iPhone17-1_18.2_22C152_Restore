@interface PUAirPlayRouteObserverRegistry
- (AVOutputDeviceDiscoverySession)_discoverySession;
- (BOOL)_isDiscoveryAllowed;
- (NSDate)lastKnownRouteAvailabilityDate;
- (NSHashTable)_routeObservers;
- (OS_dispatch_queue)_discoverySessionIsolationQueue;
- (PUAirPlayRouteObserverRegistry)init;
- (PUAirPlayRouteObserverRegistryDelegate)delegate;
- (unint64_t)lastKnownRouteAvailability;
- (unint64_t)routeAvailability;
- (void)_appEnteredBackground:(id)a3;
- (void)_appEnteringForeground:(id)a3;
- (void)_availableOutputDevicesDidChange:(id)a3;
- (void)_discoverySessionIsolationQueue_updateRouteAvailability;
- (void)_setDiscoveryAllowed:(BOOL)a3;
- (void)_setDiscoverySession:(id)a3;
- (void)_setDiscoverySessionIsolationQueue:(id)a3;
- (void)_setRouteAvailability:(unint64_t)a3;
- (void)_setRouteObservers:(id)a3;
- (void)_updateAllObservers;
- (void)_updateDiscoverySession;
- (void)_updateObserver:(id)a3;
- (void)addRouteObserver:(id)a3;
- (void)dealloc;
- (void)removeRouteObserver:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastKnownRouteAvailability:(unint64_t)a3;
- (void)setLastKnownRouteAvailabilityDate:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation PUAirPlayRouteObserverRegistry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownRouteAvailabilityDate, 0);
  objc_storeStrong((id *)&self->__discoverySessionIsolationQueue, 0);
  objc_storeStrong((id *)&self->__routeObservers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->__discoverySession, 0);
}

- (void)setLastKnownRouteAvailabilityDate:(id)a3
{
}

- (NSDate)lastKnownRouteAvailabilityDate
{
  return self->_lastKnownRouteAvailabilityDate;
}

- (void)setLastKnownRouteAvailability:(unint64_t)a3
{
  self->_lastKnownRouteAvailability = a3;
}

- (unint64_t)lastKnownRouteAvailability
{
  return self->_lastKnownRouteAvailability;
}

- (void)_setDiscoveryAllowed:(BOOL)a3
{
  self->__discoveryAllowed = a3;
}

- (BOOL)_isDiscoveryAllowed
{
  return self->__discoveryAllowed;
}

- (void)_setDiscoverySessionIsolationQueue:(id)a3
{
}

- (OS_dispatch_queue)_discoverySessionIsolationQueue
{
  return self->__discoverySessionIsolationQueue;
}

- (void)_setRouteObservers:(id)a3
{
}

- (NSHashTable)_routeObservers
{
  return self->__routeObservers;
}

- (unint64_t)routeAvailability
{
  return self->_routeAvailability;
}

- (void)setDelegate:(id)a3
{
}

- (PUAirPlayRouteObserverRegistryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUAirPlayRouteObserverRegistryDelegate *)WeakRetained;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if ([a4 isEqualToString:@"routeAvailability"])
  {
    v5 = [(PUAirPlayRouteObserverRegistry *)self _discoverySessionIsolationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__PUAirPlayRouteObserverRegistry_settings_changedValueForKey___block_invoke;
    block[3] = &unk_1E5F2ED10;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

uint64_t __62__PUAirPlayRouteObserverRegistry_settings_changedValueForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_discoverySessionIsolationQueue_updateRouteAvailability");
}

- (void)_appEnteringForeground:(id)a3
{
  [(PUAirPlayRouteObserverRegistry *)self _setDiscoveryAllowed:1];
  [(PUAirPlayRouteObserverRegistry *)self _updateDiscoverySession];
}

- (void)_appEnteredBackground:(id)a3
{
  [(PUAirPlayRouteObserverRegistry *)self _setDiscoveryAllowed:0];
  [(PUAirPlayRouteObserverRegistry *)self _updateDiscoverySession];
}

- (void)_availableOutputDevicesDidChange:(id)a3
{
  id v5 = a3;
  v6 = [(PUAirPlayRouteObserverRegistry *)self _discoverySessionIsolationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PUAirPlayRouteObserverRegistry__availableOutputDevicesDidChange___block_invoke;
  block[3] = &unk_1E5F2D2C8;
  id v9 = v5;
  v10 = self;
  SEL v11 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __67__PUAirPlayRouteObserverRegistry__availableOutputDevicesDidChange___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) object];
  v3 = [*(id *)(a1 + 40) _discoverySession];

  if (v2 != v3)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 40), @"PUAirPlayRouteObserverRegistry.m", 245, @"New discovery session, who dis?" object file lineNumber description];
  }
  v4 = *(void **)(a1 + 40);
  return objc_msgSend(v4, "_discoverySessionIsolationQueue_updateRouteAvailability");
}

- (void)_discoverySessionIsolationQueue_updateRouteAvailability
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 2;
  v3 = +[PUAirPlaySettings sharedInstance];
  uint64_t v4 = [v3 routeAvailabilityOverride];

  if (v4)
  {
    if (v4 == 1)
    {
      id v5 = v19;
      uint64_t v6 = 1;
      goto LABEL_9;
    }
    if (v4 == 2)
    {
      id v5 = v19;
      uint64_t v6 = 2;
LABEL_9:
      v5[3] = v6;
    }
  }
  else
  {
    id v7 = [(PUAirPlayRouteObserverRegistry *)self _discoverySession];
    uint64_t v8 = objc_msgSend(v7, "_pu_routeAvailability");
    v19[3] = v8;

    id v9 = PLAirPlayGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = v19[3];
      if (v10 > 2) {
        SEL v11 = 0;
      }
      else {
        SEL v11 = off_1E5F22F88[v10];
      }
      *(_DWORD *)buf = 138412290;
      v23 = v11;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEFAULT, "Device route availability: %@", buf, 0xCu);
    }

    if (v19[3])
    {
      [(PUAirPlayRouteObserverRegistry *)self setLastKnownRouteAvailability:"setLastKnownRouteAvailability:"];
      v12 = [MEMORY[0x1E4F1C9C8] date];
      [(PUAirPlayRouteObserverRegistry *)self setLastKnownRouteAvailabilityDate:v12];
    }
    else
    {
      v13 = [(PUAirPlayRouteObserverRegistry *)self lastKnownRouteAvailabilityDate];
      [v13 timeIntervalSinceNow];
      double v15 = v14;

      if (v15 <= 0.0 && v15 >= -15.0)
      {
        unint64_t v16 = [(PUAirPlayRouteObserverRegistry *)self lastKnownRouteAvailability];
        v19[3] = v16;
      }
    }
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __89__PUAirPlayRouteObserverRegistry__discoverySessionIsolationQueue_updateRouteAvailability__block_invoke;
  v17[3] = &unk_1E5F2E200;
  v17[4] = self;
  v17[5] = &v18;
  dispatch_async(MEMORY[0x1E4F14428], v17);
  _Block_object_dispose(&v18, 8);
}

uint64_t __89__PUAirPlayRouteObserverRegistry__discoverySessionIsolationQueue_updateRouteAvailability__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setRouteAvailability:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

- (void)_updateDiscoverySession
{
  v3 = [(PUAirPlayRouteObserverRegistry *)self _routeObservers];
  if ([v3 count]) {
    BOOL v4 = [(PUAirPlayRouteObserverRegistry *)self _isDiscoveryAllowed];
  }
  else {
    BOOL v4 = 0;
  }

  id v5 = [(PUAirPlayRouteObserverRegistry *)self _discoverySessionIsolationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__PUAirPlayRouteObserverRegistry__updateDiscoverySession__block_invoke;
  v6[3] = &unk_1E5F2E120;
  v6[4] = self;
  BOOL v7 = v4;
  dispatch_async(v5, v6);
}

void __57__PUAirPlayRouteObserverRegistry__updateDiscoverySession__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _discoverySession];
  v3 = (void *)v2;
  if (*(unsigned char *)(a1 + 40)) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F165E8]) initWithDeviceFeatures:2];
    [*(id *)(a1 + 32) _setDiscoverySession:v3];
  }
  if (v3)
  {
    unint64_t v5 = [v3 discoveryMode];
    id v6 = (id)*MEMORY[0x1E4F15F60];
    if (!*(unsigned char *)(a1 + 40) || v5 == 1)
    {
      if (*(unsigned char *)(a1 + 40) || !v5) {
        goto LABEL_15;
      }
      BOOL v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 removeObserver:*(void *)(a1 + 32) name:v6 object:v3];
      unint64_t v5 = 0;
    }
    else
    {
      BOOL v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 addObserver:*(void *)(a1 + 32) selector:sel__availableOutputDevicesDidChange_ name:v6 object:v3];
      unint64_t v5 = 1;
    }

LABEL_15:
    [v3 setDiscoveryMode:v5];
    uint64_t v8 = PLAirPlayGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v5 > 3) {
        id v9 = 0;
      }
      else {
        id v9 = off_1E5F22F68[v5];
      }
      int v10 = 138412546;
      SEL v11 = v9;
      __int16 v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "Set discovery mode to %@ on session %@", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_discoverySessionIsolationQueue_updateRouteAvailability");
  }
}

- (AVOutputDeviceDiscoverySession)_discoverySession
{
  BOOL v4 = [MEMORY[0x1E4F29060] currentThread];
  int v5 = [v4 isMainThread];

  if (v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PUAirPlayRouteObserverRegistry.m" lineNumber:170 description:@"_discoverySession may only be accessed on background queue"];
  }
  discoverySession = self->__discoverySession;
  return discoverySession;
}

- (void)_setDiscoverySession:(id)a3
{
  __int16 v12 = (AVOutputDeviceDiscoverySession *)a3;
  id v6 = [MEMORY[0x1E4F29060] currentThread];
  int v7 = [v6 isMainThread];

  if (v7)
  {
    SEL v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PUAirPlayRouteObserverRegistry.m" lineNumber:160 description:@"_discoverySession may only be accessed on background queue"];
  }
  discoverySession = self->__discoverySession;
  p_discoverySession = &self->__discoverySession;
  int v10 = v12;
  if (discoverySession != v12)
  {
    objc_storeStrong((id *)p_discoverySession, a3);
    int v10 = v12;
  }
}

- (void)_setRouteAvailability:(unint64_t)a3
{
  if (self->_routeAvailability != a3)
  {
    self->_routeAvailability = a3;
    [(PUAirPlayRouteObserverRegistry *)self _updateAllObservers];
  }
}

- (void)_updateAllObservers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(PUAirPlayRouteObserverRegistry *)self _routeObservers];
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
        [(PUAirPlayRouteObserverRegistry *)self _updateObserver:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_updateObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PUAirPlayRouteObserverRegistry *)self delegate];
  [v5 airPlayRouteObserverRegistryRouteAvailabilityChanged:self forRouteObserver:v4];
}

- (void)removeRouteObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PUAirPlayRouteObserverRegistry *)self _routeObservers];
  [v5 removeObject:v4];

  [(PUAirPlayRouteObserverRegistry *)self _updateDiscoverySession];
}

- (void)addRouteObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PUAirPlayRouteObserverRegistry *)self _routeObservers];
  [v5 addObject:v4];

  [(PUAirPlayRouteObserverRegistry *)self _updateDiscoverySession];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PUAirPlayRouteObserverRegistry;
  [(PUAirPlayRouteObserverRegistry *)&v4 dealloc];
}

- (PUAirPlayRouteObserverRegistry)init
{
  v11.receiver = self;
  v11.super_class = (Class)PUAirPlayRouteObserverRegistry;
  uint64_t v2 = [(PUAirPlayRouteObserverRegistry *)&v11 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    [(PUAirPlayRouteObserverRegistry *)v2 _setRouteObservers:v3];
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.photos.PHAirPlayRouteAvailability", 0);
    [(PUAirPlayRouteObserverRegistry *)v2 _setDiscoverySessionIsolationQueue:v4];
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__appEnteredBackground_ name:*MEMORY[0x1E4FB2640] object:0];

    uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel__appEnteringForeground_ name:*MEMORY[0x1E4FB2730] object:0];

    v2->__discoveryAllowed = 1;
    uint64_t v7 = [MEMORY[0x1E4F905E0] sharedScheduler];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__PUAirPlayRouteObserverRegistry_init__block_invoke;
    v9[3] = &unk_1E5F2ED10;
    long long v10 = v2;
    [v7 scheduleMainQueueTask:v9];
  }
  return v2;
}

void __38__PUAirPlayRouteObserverRegistry_init__block_invoke(uint64_t a1)
{
  id v2 = +[PUAirPlaySettings sharedInstance];
  [v2 addKeyObserver:*(void *)(a1 + 32)];
}

@end
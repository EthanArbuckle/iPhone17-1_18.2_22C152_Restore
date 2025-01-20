@interface PLForegroundMonitor
+ (NSArray)bundleIdentifiersToMonitorForSystemLibrary;
+ (PLForegroundMonitor)sharedInstance;
- (PLForegroundMonitor)init;
- (id)startMonitoringBundleIdentifiers:(id)a3 block:(id)a4;
- (void)_handleApplicationStateMonitorNotificationWithUserInfo:(id)a3 applicationStateMonitorUUID:(id)a4;
- (void)_locked_applicationDidMoveToBackground:(id)a3;
- (void)_locked_applicationDidMoveToForeground:(id)a3;
- (void)_startMonitoringBundleIdentifiers:(id)a3;
- (void)_stopMonitoring;
- (void)_updateMonitoring;
- (void)stopMonitoring:(id)a3;
@end

@implementation PLForegroundMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationStateMonitorUUID, 0);
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_monitoredBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_foregroundBundleIDs, 0);
}

- (void)_handleApplicationStateMonitorNotificationWithUserInfo:(id)a3 applicationStateMonitorUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  objc_copyWeak(&v10, &location);
  id v8 = v7;
  id v9 = v6;
  pl_dispatch_async();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __106__PLForegroundMonitor__handleApplicationStateMonitorNotificationWithUserInfo_applicationStateMonitorUUID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained
    && *(void *)(*(void *)(a1 + 32) + 48)
    && objc_msgSend(*(id *)(a1 + 40), "isEqual:"))
  {
    v3 = [*(id *)(a1 + 48) objectForKey:*MEMORY[0x1E4F4E230]];
    if (v3)
    {
      v4 = [*(id *)(a1 + 48) objectForKey:*MEMORY[0x1E4F4E248]];
      int v5 = [v4 intValue];

      if (v5 == 8) {
        objc_msgSend(WeakRetained, "_locked_applicationDidMoveToForeground:", v3);
      }
      else {
        objc_msgSend(WeakRetained, "_locked_applicationDidMoveToBackground:", v3);
      }
    }
    else
    {
      id v6 = PLBackendGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Monitor sent a notification with a nil bundle identifier", v7, 2u);
      }
    }
  }
}

- (void)_locked_applicationDidMoveToBackground:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSMutableSet *)self->_foregroundBundleIDs containsObject:v4])
  {
    int v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v4;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "%@ moved to background", buf, 0xCu);
    }

    [(NSMutableSet *)self->_foregroundBundleIDs removeObject:v4];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = self->_clients;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "bundleIdentifiers", (void)v17);
          int v14 = [v13 containsObject:v4];

          if (v14)
          {
            ++v9;
            v15 = [v12 block];
            ((void (**)(void, id, void))v15)[2](v15, v4, 0);
          }
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }

    v16 = PLBackendGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      id v22 = v9;
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "Notified %lu clients that %@ is in background", buf, 0x16u);
    }
  }
}

- (void)_locked_applicationDidMoveToForeground:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (([(NSMutableSet *)self->_foregroundBundleIDs containsObject:v4] & 1) == 0)
  {
    int v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v4;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "%@ moved to foreground", buf, 0xCu);
    }

    [(NSMutableSet *)self->_foregroundBundleIDs addObject:v4];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = self->_clients;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "bundleIdentifiers", (void)v17);
          int v14 = [v13 containsObject:v4];

          if (v14)
          {
            ++v9;
            v15 = [v12 block];
            ((void (**)(void, id, uint64_t))v15)[2](v15, v4, 1);
          }
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }

    v16 = PLBackendGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      id v22 = v9;
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "Notified %lu clients that %@ is in foreground", buf, 0x16u);
    }
  }
}

- (void)stopMonitoring:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  pl_dispatch_async();
}

uint64_t __38__PLForegroundMonitor_stopMonitoring___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateMonitoring];
}

- (id)startMonitoringBundleIdentifiers:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [_PLForegroundMonitorClient alloc];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v6];

  id v9 = [(_PLForegroundMonitorClient *)v7 initWithBundleIdentifiers:v8 block:v5];
  v12 = v9;
  pl_dispatch_async();
  uint64_t v10 = v12;

  return v10;
}

void __62__PLForegroundMonitor_startMonitoringBundleIdentifiers_block___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateMonitoring];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "bundleIdentifiers", (void)v11);
        int v9 = [v8 containsObject:v7];

        if (v9)
        {
          uint64_t v10 = [*(id *)(a1 + 40) block];
          v10[2](v10, v7, 1);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)_updateMonitoring
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = self->_clients;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "bundleIdentifiers", (void)v10);
        [v3 unionSet:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  if (!self->_monitoredBundleIdentifiers || (objc_msgSend(v3, "isEqual:") & 1) == 0)
  {
    if (objc_msgSend(v3, "count", (void)v10)) {
      [(PLForegroundMonitor *)self _startMonitoringBundleIdentifiers:v3];
    }
    else {
      [(PLForegroundMonitor *)self _stopMonitoring];
    }
  }
}

- (void)_startMonitoringBundleIdentifiers:(id)a3
{
  id v4 = a3;
  [(PLForegroundMonitor *)self _stopMonitoring];
  id v5 = objc_alloc(MEMORY[0x1E4F4E278]);
  uint64_t v6 = [v4 allObjects];
  uint64_t v7 = (BKSApplicationStateMonitor *)[v5 initWithBundleIDs:v6 states:*MEMORY[0x1E4F4E220]];
  applicationStateMonitor = self->_applicationStateMonitor;
  self->_applicationStateMonitor = v7;

  int v9 = [MEMORY[0x1E4F29128] UUID];
  objc_storeStrong((id *)&self->_applicationStateMonitorUUID, v9);
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__PLForegroundMonitor__startMonitoringBundleIdentifiers___block_invoke;
  v13[3] = &unk_1E5865F58;
  objc_copyWeak(&v15, &location);
  id v10 = v9;
  id v14 = v10;
  [(BKSApplicationStateMonitor *)self->_applicationStateMonitor setHandler:v13];
  long long v11 = (NSSet *)[v4 copy];
  monitoredBundleIdentifiers = self->_monitoredBundleIdentifiers;
  self->_monitoredBundleIdentifiers = v11;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __57__PLForegroundMonitor__startMonitoringBundleIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _handleApplicationStateMonitorNotificationWithUserInfo:v4 applicationStateMonitorUUID:*(void *)(a1 + 32)];
}

- (void)_stopMonitoring
{
  applicationStateMonitor = self->_applicationStateMonitor;
  if (applicationStateMonitor)
  {
    [(BKSApplicationStateMonitor *)applicationStateMonitor invalidate];
    id v4 = self->_applicationStateMonitor;
    self->_applicationStateMonitor = 0;

    applicationStateMonitorUUID = self->_applicationStateMonitorUUID;
    self->_applicationStateMonitorUUID = 0;
  }
  monitoredBundleIdentifiers = self->_monitoredBundleIdentifiers;
  self->_monitoredBundleIdentifiers = 0;
}

- (PLForegroundMonitor)init
{
  v10.receiver = self;
  v10.super_class = (Class)PLForegroundMonitor;
  id v2 = [(PLForegroundMonitor *)&v10 init];
  if (v2)
  {
    id v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    foregroundBundleIDs = v2->_foregroundBundleIDs;
    v2->_foregroundBundleIDs = v3;

    uint64_t v5 = pl_dispatch_queue_create_with_fallback_qos();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    clients = v2->_clients;
    v2->_clients = v7;
  }
  return v2;
}

+ (NSArray)bundleIdentifiersToMonitorForSystemLibrary
{
  return (NSArray *)&unk_1EEBF17F0;
}

+ (PLForegroundMonitor)sharedInstance
{
  if (sharedInstance_onceToken_18946 != -1) {
    dispatch_once(&sharedInstance_onceToken_18946, &__block_literal_global_18947);
  }
  id v2 = (void *)sharedInstance_sharedInstance;
  return (PLForegroundMonitor *)v2;
}

void __37__PLForegroundMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PLForegroundMonitor);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;
}

@end
@interface SearchUIScreenTimeManager
+ (id)sharedInstance;
- (DMFApplicationPolicyMonitor)monitor;
- (NSCache)possiblyCorrectCache;
- (OS_dispatch_queue)serialQueue;
- (SearchUIScreenTimeManager)init;
- (id)getCachedObjectIfAvailableForKey:(id)a3;
- (id)itemsToBatchPreFetchForRowModel:(id)a3;
- (void)computeObjectsForKeys:(id)a3 completionHandler:(id)a4;
- (void)setMonitor:(id)a3;
- (void)setPossiblyCorrectCache:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation SearchUIScreenTimeManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_39);
  }
  v2 = (void *)sharedInstance_screenTimeManager;
  return v2;
}

- (NSCache)possiblyCorrectCache
{
  return (NSCache *)objc_getProperty(self, a2, 40, 1);
}

- (DMFApplicationPolicyMonitor)monitor
{
  return (DMFApplicationPolicyMonitor *)objc_getProperty(self, a2, 24, 1);
}

uint64_t __43__SearchUIScreenTimeManager_sharedInstance__block_invoke()
{
  sharedInstance_screenTimeManager = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (SearchUIScreenTimeManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)SearchUIScreenTimeManager;
  v2 = [(TLKAsyncCache *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("screenTimeFetchingQueue", v3);
    [(SearchUIScreenTimeManager *)v2 setSerialQueue:v4];

    v5 = objc_opt_new();
    [(SearchUIScreenTimeManager *)v2 setPossiblyCorrectCache:v5];

    v6 = [(SearchUIScreenTimeManager *)v2 serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__SearchUIScreenTimeManager_init__block_invoke;
    block[3] = &unk_1E6E72730;
    v9 = v2;
    dispatch_async(v6, block);
  }
  return v2;
}

- (OS_dispatch_queue)serialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSerialQueue:(id)a3
{
}

- (void)setPossiblyCorrectCache:(id)a3
{
}

void __33__SearchUIScreenTimeManager_init__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = objc_alloc(MEMORY[0x1E4F5F3A0]);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  v6 = __33__SearchUIScreenTimeManager_init__block_invoke_2;
  v7 = &unk_1E6E742B0;
  objc_copyWeak(&v8, &location);
  v3 = (void *)[v2 initWithPolicyChangeHandler:&v4];
  objc_msgSend(*(id *)(a1 + 32), "setMonitor:", v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)setMonitor:(id)a3
{
}

void __33__SearchUIScreenTimeManager_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained clear];
  v1 = [WeakRetained possiblyCorrectCache];
  [v1 removeAllObjects];

  +[SearchUIUtilities dispatchMainIfNecessary:&__block_literal_global_13];
}

void __33__SearchUIScreenTimeManager_init__block_invoke_3()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"SearchUIScreenTimeChangeNotification" object:0];
}

- (id)getCachedObjectIfAvailableForKey:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SearchUIScreenTimeManager;
  uint64_t v5 = [(TLKAsyncCache *)&v25 getCachedObjectIfAvailableForKey:v4];
  v6 = v5;
  if (!v4 || v5)
  {
    id v12 = v5;
  }
  else
  {
    dispatch_time_t v7 = dispatch_time(0, 10000000);
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __62__SearchUIScreenTimeManager_getCachedObjectIfAvailableForKey___block_invoke;
    v22 = &unk_1E6E72620;
    v23 = self;
    id v8 = v4;
    id v24 = v8;
    dispatch_after(v7, MEMORY[0x1E4F14428], &v19);
    v9 = [(SearchUIScreenTimeManager *)self possiblyCorrectCache];
    objc_super v10 = [v9 objectForKey:v8];

    if (v10)
    {
      id v11 = v10;
    }
    else
    {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v8 allowPlaceholder:1 error:0];
      v14 = [v13 compatibilityObject];
      BOOL v15 = [v14 deviceManagementPolicy] != 0;

      v16 = [(SearchUIScreenTimeManager *)self possiblyCorrectCache];
      v17 = [NSNumber numberWithBool:v15];
      [v16 setObject:v17 forKey:v8];

      id v11 = [NSNumber numberWithBool:v15];
    }
    id v12 = v11;
  }
  return v12;
}

uint64_t __62__SearchUIScreenTimeManager_getCachedObjectIfAvailableForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) getObjectForKey:*(void *)(a1 + 40) completionHandler:&__block_literal_global_19_0];
}

- (void)computeObjectsForKeys:(id)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (+[SearchUIUtilities appIsValidForBundleIdentifier:v14])
        {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  BOOL v15 = [(SearchUIScreenTimeManager *)self monitor];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69__SearchUIScreenTimeManager_computeObjectsForKeys_completionHandler___block_invoke;
  v18[3] = &unk_1E6E742F8;
  id v19 = v9;
  id v20 = v7;
  id v16 = v7;
  id v17 = v9;
  [v15 requestPoliciesForBundleIdentifiers:v8 completionHandler:v18];
}

void __69__SearchUIScreenTimeManager_computeObjectsForKeys_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(v3, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        uint64_t v11 = (void *)v10;
        if (v10) {
          uint64_t v12 = (void *)v10;
        }
        else {
          uint64_t v12 = &unk_1F404B088;
        }
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)itemsToBatchPreFetchForRowModel:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = objc_msgSend(v3, "results", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (![v10 isLocalApplicationResult]
          || ([v10 renderHorizontallyWithOtherResultsInCategory] & 1) == 0)
        {
          uint64_t v11 = [v10 applicationBundleIdentifier];
          uint64_t v12 = [v10 sectionBundleIdentifier];
          if (v11) {
            [v4 addObject:v11];
          }
          if (v12) {
            [v4 addObject:v12];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possiblyCorrectCache, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
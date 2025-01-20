@interface RELocationAuthorizationStatusCache
- (id)_init;
- (int)_cachedStatusForBundleIdentifier:(id)a3;
- (int)cachedAuthorizationStatusForBundleIdentifier:(id)a3 invalidationUpdateQueue:(id)a4 withCallback:(id)a5;
- (void)_q_queue_queryStatusFromCLForBundleIdentifier:(id)a3;
- (void)_s_queue_addCallbackInfo:(id)a3 forBundleIdentifier:(id)a4;
- (void)_s_queue_scheduleUpdatedStatusForBundleIdentifier:(id)a3;
- (void)_s_queue_updateCacheFromCLWithStatus:(int)a3 forBundleIdentifier:(id)a4;
@end

@implementation RELocationAuthorizationStatusCache

- (id)_init
{
  v16.receiver = self;
  v16.super_class = (Class)RELocationAuthorizationStatusCache;
  v2 = [(RESingleton *)&v16 _init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    v4 = (void *)v2[1];
    v2[1] = v3;

    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v6 = (void *)v2[2];
    v2[2] = v5;

    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    v8 = (void *)v2[3];
    v2[3] = v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.relevanceengine.scheduleCLAuth", 0);
    v10 = (void *)v2[4];
    v2[4] = v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.relevanceengine.queryCLAuth", 0);
    v12 = (void *)v2[5];
    v2[5] = v11;

    id v13 = objc_alloc_init(MEMORY[0x263F08958]);
    v14 = (void *)v2[6];
    v2[6] = v13;
  }
  return v2;
}

- (int)cachedAuthorizationStatusForBundleIdentifier:(id)a3 invalidationUpdateQueue:(id)a4 withCallback:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [(RELocationAuthorizationStatusCache *)self _cachedStatusForBundleIdentifier:v8];
  v12 = objc_alloc_init(_RECallbackAndPreviousStatus);
  [(_RECallbackAndPreviousStatus *)v12 setStatus:v11];
  [(_RECallbackAndPreviousStatus *)v12 setInvalidationCallback:v9];

  [(_RECallbackAndPreviousStatus *)v12 setQueue:v10];
  schedulingQueue = self->_schedulingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __120__RELocationAuthorizationStatusCache_cachedAuthorizationStatusForBundleIdentifier_invalidationUpdateQueue_withCallback___block_invoke;
  block[3] = &unk_2644BDBF0;
  block[4] = self;
  v18 = v12;
  id v19 = v8;
  id v14 = v8;
  v15 = v12;
  dispatch_async(schedulingQueue, block);

  return v11;
}

uint64_t __120__RELocationAuthorizationStatusCache_cachedAuthorizationStatusForBundleIdentifier_invalidationUpdateQueue_withCallback___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_s_queue_addCallbackInfo:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  return objc_msgSend(v2, "_s_queue_scheduleUpdatedStatusForBundleIdentifier:", v3);
}

- (int)_cachedStatusForBundleIdentifier:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_bundleToStatusCacheLock lock];
  id v5 = [(NSMutableDictionary *)self->_bundleToStatusCache objectForKeyedSubscript:v4];
  v6 = v5;
  if (v5)
  {
    int v7 = [v5 intValue];
  }
  else
  {
    [(NSMutableDictionary *)self->_bundleToStatusCache setObject:&unk_26CFCD380 forKeyedSubscript:v4];
    int v7 = 0;
  }
  [(NSLock *)self->_bundleToStatusCacheLock unlock];

  return v7;
}

- (void)_s_queue_addCallbackInfo:(id)a3 forBundleIdentifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  int v7 = [(NSMutableDictionary *)self->_bundleToCallbackBlocks objectForKeyedSubscript:v6];
  if (!v7)
  {
    int v7 = [MEMORY[0x263EFF980] array];
    [(NSMutableDictionary *)self->_bundleToCallbackBlocks setObject:v7 forKeyedSubscript:v6];
  }
  [v7 addObject:v8];
}

- (void)_s_queue_scheduleUpdatedStatusForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (([(NSMutableSet *)self->_bundlesAwaitingQuery containsObject:v4] & 1) == 0)
  {
    dispatch_time_t v5 = dispatch_time(0, 1000000000);
    queryQueue = self->_queryQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __88__RELocationAuthorizationStatusCache__s_queue_scheduleUpdatedStatusForBundleIdentifier___block_invoke;
    v7[3] = &unk_2644BC688;
    v7[4] = self;
    id v8 = v4;
    dispatch_after(v5, queryQueue, v7);
  }
}

uint64_t __88__RELocationAuthorizationStatusCache__s_queue_scheduleUpdatedStatusForBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_q_queue_queryStatusFromCLForBundleIdentifier:", *(void *)(a1 + 40));
}

- (void)_q_queue_queryStatusFromCLForBundleIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x263F00A60] authorizationStatusForBundleIdentifier:v4];
  schedulingQueue = self->_schedulingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__RELocationAuthorizationStatusCache__q_queue_queryStatusFromCLForBundleIdentifier___block_invoke;
  block[3] = &unk_2644BF078;
  int v10 = v5;
  block[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(schedulingQueue, block);
}

uint64_t __84__RELocationAuthorizationStatusCache__q_queue_queryStatusFromCLForBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_s_queue_updateCacheFromCLWithStatus:forBundleIdentifier:", *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
}

- (void)_s_queue_updateCacheFromCLWithStatus:(int)a3 forBundleIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [(NSLock *)self->_bundleToStatusCacheLock lock];
  id v7 = [NSNumber numberWithInt:v4];
  [(NSMutableDictionary *)self->_bundleToStatusCache setObject:v7 forKeyedSubscript:v6];

  [(NSLock *)self->_bundleToStatusCacheLock unlock];
  v15 = self;
  objc_super v16 = v6;
  id v8 = [(NSMutableDictionary *)self->_bundleToCallbackBlocks objectForKeyedSubscript:v6];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v13 status] != v4)
        {
          id v14 = [v13 queue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __95__RELocationAuthorizationStatusCache__s_queue_updateCacheFromCLWithStatus_forBundleIdentifier___block_invoke;
          block[3] = &unk_2644BF0A0;
          block[4] = v13;
          int v18 = v4;
          dispatch_async(v14, block);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
  [(NSMutableDictionary *)v15->_bundleToCallbackBlocks removeObjectForKey:v16];
  [(NSMutableSet *)v15->_bundlesAwaitingQuery removeObject:v16];
}

void __95__RELocationAuthorizationStatusCache__s_queue_updateCacheFromCLWithStatus_forBundleIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) invalidationCallback];
  v2[2](v2, *(unsigned int *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleToStatusCacheLock, 0);
  objc_storeStrong((id *)&self->_queryQueue, 0);
  objc_storeStrong((id *)&self->_schedulingQueue, 0);
  objc_storeStrong((id *)&self->_bundlesAwaitingQuery, 0);
  objc_storeStrong((id *)&self->_bundleToCallbackBlocks, 0);
  objc_storeStrong((id *)&self->_bundleToStatusCache, 0);
}

@end
@interface TPSTargetingCache
- (NSMutableDictionary)cacheResultDictionary;
- (OS_dispatch_queue)syncQueue;
- (TPSTargetingCache)init;
- (int64_t)cacheResultForIdentifier:(id)a3;
- (void)addCacheResult:(int64_t)a3 forIdentifier:(id)a4;
- (void)reset;
- (void)setCacheResultDictionary:(id)a3;
- (void)setSyncQueue:(id)a3;
@end

@implementation TPSTargetingCache

- (int64_t)cacheResultForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = -1;
  if ([v4 length])
  {
    v5 = [(TPSTargetingCache *)self syncQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__TPSTargetingCache_cacheResultForIdentifier___block_invoke;
    block[3] = &unk_1E6E6C5A0;
    block[4] = self;
    id v9 = v4;
    v10 = &v11;
    dispatch_sync(v5, block);
  }
  int64_t v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)addCacheResult:(int64_t)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  if ([v6 length])
  {
    v7 = [(TPSTargetingCache *)self syncQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__TPSTargetingCache_addCacheResult_forIdentifier___block_invoke;
    block[3] = &unk_1E6E6C5C8;
    v10 = self;
    int64_t v11 = a3;
    id v9 = v6;
    dispatch_async(v7, block);
  }
}

void __50__TPSTargetingCache_addCacheResult_forIdentifier___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __50__TPSTargetingCache_addCacheResult_forIdentifier___block_invoke_cold_1(a1, v2);
  }

  v3 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  id v4 = [*(id *)(a1 + 40) cacheResultDictionary];
  [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 32)];
}

void __46__TPSTargetingCache_cacheResultForIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cacheResultDictionary];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3 && [v3 integerValue] != -1) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 integerValue];
  }
}

- (NSMutableDictionary)cacheResultDictionary
{
  return self->_cacheResultDictionary;
}

- (TPSTargetingCache)init
{
  v9.receiver = self;
  v9.super_class = (Class)TPSTargetingCache;
  v2 = [(TPSTargetingCache *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cacheResultDictionary = v2->_cacheResultDictionary;
    v2->_cacheResultDictionary = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.tips.targetingCache.sync", v5);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);

  objc_storeStrong((id *)&self->_cacheResultDictionary, 0);
}

- (void)reset
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__TPSTargetingCache_reset__block_invoke;
  block[3] = &unk_1E6E6B0A8;
  void block[4] = self;
  dispatch_sync(syncQueue, block);
}

void __26__TPSTargetingCache_reset__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __26__TPSTargetingCache_reset__block_invoke_cold_1(v2);
  }

  uint64_t v3 = [*(id *)(a1 + 32) cacheResultDictionary];
  [v3 removeAllObjects];
}

- (void)setCacheResultDictionary:(id)a3
{
}

- (void)setSyncQueue:(id)a3
{
}

void __50__TPSTargetingCache_addCacheResult_forIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_1E4492000, a2, OS_LOG_TYPE_DEBUG, "Adding targeting result to cache for precondition (%@): %ld", (uint8_t *)&v4, 0x16u);
}

void __26__TPSTargetingCache_reset__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E4492000, log, OS_LOG_TYPE_DEBUG, "Removing all targeting cache entries...", v1, 2u);
}

@end
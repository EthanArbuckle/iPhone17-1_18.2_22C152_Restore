@interface VSShortTermCache
+ (id)sharedInstance;
- (NSCache)cache;
- (NSMutableDictionary)cacheTimer;
- (VSShortTermCache)init;
- (id)objectForKey:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setCache:(id)a3;
- (void)setCacheTimer:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4 timeToLive:(double)a5;
- (void)timeToLiveTimerFired:(id)a3;
@end

@implementation VSShortTermCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheTimer, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)setCacheTimer:(id)a3
{
}

- (NSMutableDictionary)cacheTimer
{
  return self->_cacheTimer;
}

- (void)setCache:(id)a3
{
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)removeAllObjects
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(VSShortTermCache *)self cacheTimer];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  v8 = [(VSShortTermCache *)self cacheTimer];
  [v8 removeAllObjects];

  v9 = [(VSShortTermCache *)self cache];
  [v9 removeAllObjects];

  v10 = VSGetLogDefault();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_226CB1000, v10, OS_LOG_TYPE_INFO, "Removed short term cache for all keys", v11, 2u);
  }
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VSShortTermCache *)self cache];
  uint64_t v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)removeObjectForKey:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(VSShortTermCache *)self cache];
  [v5 removeObjectForKey:v4];

  uint64_t v6 = [(VSShortTermCache *)self cacheTimer];
  uint64_t v7 = [v6 objectForKey:v4];

  [v7 invalidate];
  v8 = [(VSShortTermCache *)self cacheTimer];
  [v8 removeObjectForKey:v4];

  v9 = VSGetLogDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_226CB1000, v9, OS_LOG_TYPE_INFO, "Removed short term cache for key:'%@'", (uint8_t *)&v10, 0xCu);
  }
}

- (void)timeToLiveTimerFired:(id)a3
{
  id v5 = a3;
  id v4 = [v5 userInfo];
  [(VSShortTermCache *)self removeObjectForKey:v4];

  [v5 invalidate];
}

- (void)setObject:(id)a3 forKey:(id)a4 timeToLive:(double)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v10 = [(VSShortTermCache *)self cacheTimer];
  id v11 = [v10 objectForKey:v9];
  [v11 invalidate];

  uint64_t v12 = [MEMORY[0x263EFFA20] timerWithTimeInterval:self target:sel_timeToLiveTimerFired_ selector:v9 userInfo:0 repeats:a5];
  long long v13 = [(VSShortTermCache *)self cache];
  [v13 setObject:v8 forKey:v9];

  long long v14 = [(VSShortTermCache *)self cacheTimer];
  [v14 setObject:v12 forKey:v9];

  long long v15 = VSGetLogDefault();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412546;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_226CB1000, v15, OS_LOG_TYPE_INFO, "Added short term cache:%@ for key:'%@'", (uint8_t *)&v17, 0x16u);
  }

  v16 = [MEMORY[0x263EFF9F0] mainRunLoop];
  [v16 addTimer:v12 forMode:*MEMORY[0x263EFF478]];
}

- (VSShortTermCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)VSShortTermCache;
  v2 = [(VSShortTermCache *)&v8 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    cache = v2->_cache;
    v2->_cache = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cacheTimer = v2->_cacheTimer;
    v2->_cacheTimer = v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2268);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

uint64_t __34__VSShortTermCache_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance = objc_alloc_init(VSShortTermCache);
  return MEMORY[0x270F9A758]();
}

@end
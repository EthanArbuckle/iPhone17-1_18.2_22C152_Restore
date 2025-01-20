@interface WFWeatherStoreCache
+ (BOOL)removeObjectsFromCache:(id)a3 passingTest:(id)a4;
+ (id)createCacheIfNecessary:(id)a3 error:(id *)a4;
+ (id)wf_mainDomains;
- (BOOL)_concurrentQueue_barrier_loadDomain:(id)a3;
- (BOOL)_loadDomain:(id)a3;
- (NSMutableDictionary)cacheForDomain;
- (NSMutableSet)dirtyCacheDomains;
- (NSTimer)cacheStoreTimer;
- (NSURL)URL;
- (OS_dispatch_queue)cacheConcurrentQueue;
- (WFWeatherStoreCache)init;
- (WFWeatherStoreCache)initWithURL:(id)a3;
- (id)_dirtyCacheDomains;
- (id)_loadedCacheDomains;
- (id)cachedObjectWithinDomain:(id)a3 forKey:(id)a4;
- (id)cachedObjectWithinDomain:(id)a3 forKey:(id)a4 staleness:(unint64_t)a5;
- (void)_concurrentQueue_barrier_deleteOldDataFromCache;
- (void)_concurrentQueue_barrier_deleteOldDataFromCache:(id)a3 allowedStaleness:(unint64_t)a4;
- (void)_concurrentQueue_barrier_removeObjectWithinDomain:(id)a3 forKey:(id)a4;
- (void)_concurrentQueue_barrier_shrinkDomain:(id)a3;
- (void)_concurrentQueue_barrier_writeCacheDictionaryToFile;
- (void)_ensureDomainIsLoaded:(id)a3;
- (void)_markDomainDirty:(id)a3;
- (void)_shrinkDomain:(id)a3;
- (void)_startCacheStoreTimer;
- (void)_stopCacheStoreTimer;
- (void)cache:(id)a3 withinDomain:(id)a4 date:(id)a5 forKey:(id)a6 expiration:(id)a7 synchronous:(BOOL)a8;
- (void)cache:(id)a3 withinDomain:(id)a4 forKey:(id)a5;
- (void)cache:(id)a3 withinDomain:(id)a4 forKey:(id)a5 expiration:(id)a6;
- (void)dealloc;
- (void)deleteOldDataFromCache:(id)a3 allowedStaleness:(unint64_t)a4;
- (void)executeTransaction:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectWithinDomain:(id)a3 forKey:(id)a4;
- (void)setCacheConcurrentQueue:(id)a3;
- (void)setCacheForDomain:(id)a3;
- (void)setCacheStoreTimer:(id)a3;
- (void)setDirtyCacheDomains:(id)a3;
- (void)setURL:(id)a3;
- (void)writeCacheDictionaryToFile;
@end

@implementation WFWeatherStoreCache

+ (id)wf_mainDomains
{
  if (wf_mainDomains_onceToken != -1) {
    dispatch_once(&wf_mainDomains_onceToken, &__block_literal_global_32);
  }
  v2 = (void *)wf_mainDomains_mainDomains;
  return v2;
}

void __37__WFWeatherStoreCache_wf_mainDomains__block_invoke()
{
  v4[3] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"almanac_data";
  v4[1] = @"forecasts";
  v4[2] = @"historical_data";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:3];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)wf_mainDomains_mainDomains;
  wf_mainDomains_mainDomains = v2;
}

+ (id)createCacheIfNecessary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = WFLogForCategory(5uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[WFWeatherStoreCache createCacheIfNecessary:error:].cold.7();
  }

  if (v5)
  {
    if (objc_msgSend(v5, "wf_isInMemoryAddress"))
    {
      v7 = WFLogForCategory(5uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        +[WFWeatherStoreCache createCacheIfNecessary:error:](v7);
      }

      v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithURL:v5];
      goto LABEL_34;
    }
    v10 = [MEMORY[0x263F08850] defaultManager];
    id v25 = 0;
    char v11 = [v10 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v25];
    id v12 = v25;

    if ((v11 & 1) == 0)
    {
      v13 = WFLogForCategory(5uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[WFWeatherStoreCache createCacheIfNecessary:error:].cold.6();
      }

      if (a4) {
        *a4 = v12;
      }
    }
    id v24 = 0;
    char v14 = [v5 checkResourceIsReachableAndReturnError:&v24];
    id v15 = v24;
    if (v14)
    {
      v16 = [MEMORY[0x263F08850] defaultManager];
      v17 = [v5 path];
      char v18 = [v16 isWritableFileAtPath:v17];

      v19 = WFLogForCategory(5uLL);
      v20 = v19;
      if (v18)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          +[WFWeatherStoreCache createCacheIfNecessary:error:]();
        }

        v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithURL:v5];
        goto LABEL_33;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        +[WFWeatherStoreCache createCacheIfNecessary:error:].cold.4();
      }

      if (a4)
      {
        id v22 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:513 userInfo:0];
        goto LABEL_31;
      }
    }
    else
    {
      v21 = WFLogForCategory(5uLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[WFWeatherStoreCache createCacheIfNecessary:error:].cold.5();
      }

      if (a4)
      {
        id v22 = v15;
LABEL_31:
        v8 = 0;
        *a4 = v22;
LABEL_33:

        goto LABEL_34;
      }
    }
    v8 = 0;
    goto LABEL_33;
  }
  if (a4)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:513 userInfo:0];
  }
  v9 = WFLogForCategory(5uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[WFWeatherStoreCache createCacheIfNecessary:error:](v9);
  }

  v8 = 0;
LABEL_34:

  return v8;
}

- (WFWeatherStoreCache)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Please use designated initializer initWithURL:" userInfo:0];
  objc_exception_throw(v2);
}

- (WFWeatherStoreCache)initWithURL:(id)a3
{
  id v5 = a3;
  if (!v5 || (v6 = v5, ([v5 isFileURL] & 1) == 0) && (objc_msgSend(v6, "wf_isInMemoryAddress") & 1) == 0)
  {
    id v24 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"URL was invalid" userInfo:0];
    objc_exception_throw(v24);
  }
  if ((objc_msgSend(v6, "wf_isInMemoryAddress") & 1) == 0)
  {
    id v26 = 0;
    char v8 = [v6 checkResourceIsReachableAndReturnError:&v26];
    id v7 = v26;
    if (v8)
    {
      v9 = [MEMORY[0x263F08850] defaultManager];
      v10 = [v6 path];
      char v11 = [v9 isWritableFileAtPath:v10];

      if (v11) {
        goto LABEL_8;
      }
      id v22 = WFLogForCategory(5uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[WFWeatherStoreCache initWithURL:]();
      }
    }
    else
    {
      id v22 = WFLogForCategory(5uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[WFWeatherStoreCache initWithURL:]();
      }
    }

    v21 = 0;
    goto LABEL_16;
  }
  id v7 = 0;
LABEL_8:
  v25.receiver = self;
  v25.super_class = (Class)WFWeatherStoreCache;
  id v12 = [(WFWeatherStoreCache *)&v25 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_URL, a3);
    char v14 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.WeatherFoundation.cacheReadWriteQueue", v14);
    cacheConcurrentQueue = v13->_cacheConcurrentQueue;
    v13->_cacheConcurrentQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = objc_opt_new();
    cacheForDomain = v13->_cacheForDomain;
    v13->_cacheForDomain = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_opt_new();
    dirtyCacheDomains = v13->_dirtyCacheDomains;
    v13->_dirtyCacheDomains = (NSMutableSet *)v19;

    [(WFWeatherStoreCache *)v13 _startCacheStoreTimer];
  }
  self = v13;
  v21 = self;
LABEL_16:

  return v21;
}

- (void)dealloc
{
  [(WFWeatherStoreCache *)self _stopCacheStoreTimer];
  v3.receiver = self;
  v3.super_class = (Class)WFWeatherStoreCache;
  [(WFWeatherStoreCache *)&v3 dealloc];
}

- (void)_startCacheStoreTimer
{
  [(WFWeatherStoreCache *)self _stopCacheStoreTimer];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__WFWeatherStoreCache__startCacheStoreTimer__block_invoke;
  block[3] = &unk_2644305E8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __44__WFWeatherStoreCache__startCacheStoreTimer__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:sel_writeCacheDictionaryToFile selector:0 userInfo:1 repeats:20.0];
  [*(id *)(a1 + 32) setCacheStoreTimer:v2];

  id v3 = [*(id *)(a1 + 32) cacheStoreTimer];
  [v3 setTolerance:5.0];
}

- (void)_stopCacheStoreTimer
{
  if (self->_cacheStoreTimer)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__WFWeatherStoreCache__stopCacheStoreTimer__block_invoke;
    block[3] = &unk_2644305E8;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __43__WFWeatherStoreCache__stopCacheStoreTimer__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cacheStoreTimer];
  [v2 invalidate];

  id v3 = *(void **)(a1 + 32);
  return [v3 setCacheStoreTimer:0];
}

- (void)deleteOldDataFromCache:(id)a3 allowedStaleness:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    objc_initWeak(&location, self);
    id v7 = [(WFWeatherStoreCache *)self cacheConcurrentQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __63__WFWeatherStoreCache_deleteOldDataFromCache_allowedStaleness___block_invoke;
    v8[3] = &unk_264430610;
    objc_copyWeak(v10, &location);
    id v9 = v6;
    v10[1] = (id)a4;
    dispatch_barrier_sync(v7, v8);

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }
}

void __63__WFWeatherStoreCache_deleteOldDataFromCache_allowedStaleness___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_concurrentQueue_barrier_deleteOldDataFromCache:allowedStaleness:", *(void *)(a1 + 32), *(void *)(a1 + 48));
}

- (void)writeCacheDictionaryToFile
{
  id v3 = WFLogForCategory(5uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C988000, v3, OS_LOG_TYPE_INFO, "write cache to file", buf, 2u);
  }

  v4 = [(WFWeatherStoreCache *)self cacheConcurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__WFWeatherStoreCache_writeCacheDictionaryToFile__block_invoke;
  block[3] = &unk_2644305E8;
  block[4] = self;
  dispatch_barrier_sync(v4, block);
}

uint64_t __49__WFWeatherStoreCache_writeCacheDictionaryToFile__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_concurrentQueue_barrier_writeCacheDictionaryToFile");
}

- (void)_concurrentQueue_barrier_writeCacheDictionaryToFile
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C988000, v0, v1, "Synchronizing Cache to disk @ %@", v2, v3, v4, v5, v6);
}

void __74__WFWeatherStoreCache__concurrentQueue_barrier_writeCacheDictionaryToFile__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v3];
  uint64_t v5 = [*(id *)(a1 + 32) URLByAppendingPathComponent:v3];
  uint8_t v6 = [v5 URLByAppendingPathExtension:@"plist"];

  id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
  id v12 = 0;
  char v8 = [v7 writeToURL:v6 options:1 error:&v12];
  id v9 = v12;
  v10 = WFLogForCategory(5uLL);
  char v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __74__WFWeatherStoreCache__concurrentQueue_barrier_writeCacheDictionaryToFile__block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __74__WFWeatherStoreCache__concurrentQueue_barrier_writeCacheDictionaryToFile__block_invoke_cold_2();
  }
}

+ (BOOL)removeObjectsFromCache:(id)a3 passingTest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKey:@"values"];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  id v22 = __58__WFWeatherStoreCache_removeObjectsFromCache_passingTest___block_invoke;
  v23 = &unk_264430660;
  id v25 = v6;
  id v8 = v5;
  id v24 = v8;
  id v9 = v6;
  v10 = [v7 keysOfEntriesPassingTest:&v20];

  uint64_t v11 = objc_msgSend(v10, "count", v20, v21, v22, v23);
  if (v11)
  {
    id v12 = WFLogForCategory(5uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      +[WFWeatherStoreCache removeObjectsFromCache:passingTest:]();
    }

    v13 = [v8 objectForKeyedSubscript:@"values"];
    char v14 = [v10 allObjects];
    [v13 removeObjectsForKeys:v14];

    dispatch_queue_t v15 = [v8 objectForKeyedSubscript:@"dates"];
    v16 = [v10 allObjects];
    [v15 removeObjectsForKeys:v16];

    uint64_t v17 = [v8 objectForKeyedSubscript:@"WFWeatherStoreCacheRecordExpirationDate"];
    char v18 = [v10 allObjects];
    [v17 removeObjectsForKeys:v18];
  }
  return v11 != 0;
}

uint64_t __58__WFWeatherStoreCache_removeObjectsFromCache_passingTest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 conformsToProtocol:&unk_26CD66978])
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"dates"];
    id v9 = [v8 objectForKeyedSubscript:v5];
    uint64_t v10 = (*(uint64_t (**)(uint64_t, id, void *, id))(v7 + 16))(v7, v5, v9, v6);
  }
  else
  {
    uint64_t v11 = WFLogForCategory(5uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __58__WFWeatherStoreCache_removeObjectsFromCache_passingTest___block_invoke_cold_1();
    }

    uint64_t v10 = 1;
  }

  return v10;
}

- (id)cachedObjectWithinDomain:(id)a3 forKey:(id)a4
{
  return [(WFWeatherStoreCache *)self cachedObjectWithinDomain:a3 forKey:a4 staleness:0x7FFFFFFFFFFFFFFFLL];
}

- (id)cachedObjectWithinDomain:(id)a3 forKey:(id)a4 staleness:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  id v39 = 0;
  [(WFWeatherStoreCache *)self _ensureDomainIsLoaded:v8];
  uint64_t v10 = self->_cacheForDomain;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v11 = [(WFWeatherStoreCache *)self cacheConcurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__WFWeatherStoreCache_cachedObjectWithinDomain_forKey_staleness___block_invoke;
  block[3] = &unk_264430688;
  id v12 = v10;
  id v24 = v12;
  id v13 = v8;
  id v25 = v13;
  v27 = &v34;
  id v14 = v9;
  id v26 = v14;
  v28 = &v30;
  unint64_t v29 = a5;
  dispatch_sync(v11, block);

  if (*((unsigned char *)v31 + 24))
  {
    objc_initWeak(&location, self);
    dispatch_queue_t v15 = [(WFWeatherStoreCache *)self cacheConcurrentQueue];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __65__WFWeatherStoreCache_cachedObjectWithinDomain_forKey_staleness___block_invoke_67;
    v18[3] = &unk_2644306B0;
    objc_copyWeak(&v21, &location);
    id v19 = v13;
    id v20 = v14;
    dispatch_barrier_async(v15, v18);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  id v16 = (id)v35[5];

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v16;
}

void __65__WFWeatherStoreCache_cachedObjectWithinDomain_forKey_staleness___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"dates"];

  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:*v2];
  id v6 = [v5 objectForKeyedSubscript:@"WFWeatherStoreCacheRecordExpirationDate"];

  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:*v2];
  id v8 = [v7 objectForKeyedSubscript:@"values"];

  id v9 = (uint64_t *)(a1 + 48);
  uint64_t v10 = [v8 objectForKeyedSubscript:*(void *)(a1 + 48)];
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  id v13 = [v6 objectForKeyedSubscript:*(void *)(a1 + 48)];
  if (v13)
  {
    id v14 = [MEMORY[0x263EFF910] date];
    uint64_t v15 = [v13 compare:v14];

    if (v15 == -1)
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = 0;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      char v18 = WFLogForCategory(5uLL);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v28 = *v9;
        uint64_t v29 = *v2;
        id v26 = [MEMORY[0x263EFF910] date];
        [v26 timeIntervalSinceDate:v13];
        *(_DWORD *)buf = 138412802;
        uint64_t v31 = v28;
        __int16 v32 = 2112;
        uint64_t v33 = v29;
        __int16 v34 = 2048;
        uint64_t v35 = v27;
        _os_log_debug_impl(&dword_21C988000, v18, OS_LOG_TYPE_DEBUG, "Removing Stale Cache @ key %@ / domain %@.  Expired approx %f seconds ago.", buf, 0x20u);
      }
    }
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    if (*(void *)(a1 + 72) == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_14;
    }
    id v19 = [v4 objectForKeyedSubscript:*(void *)(a1 + 48)];
    unint64_t v20 = *(void *)(a1 + 72);
    [v19 timeIntervalSinceNow];
    if (!v19 || !v20 || (double v22 = v21 / 60.0, v22 < 0.0) && -v22 >= (double)v20)
    {
      uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
      id v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = 0;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }

    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
LABEL_14:
      id v25 = WFLogForCategory(5uLL);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        __65__WFWeatherStoreCache_cachedObjectWithinDomain_forKey_staleness___block_invoke_cold_1(v9, v2, v25);
      }
    }
  }
}

void __65__WFWeatherStoreCache_cachedObjectWithinDomain_forKey_staleness___block_invoke_67(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_concurrentQueue_barrier_removeObjectWithinDomain:forKey:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)cache:(id)a3 withinDomain:(id)a4 forKey:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = WFLogForCategory(5uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_21C988000, v11, OS_LOG_TYPE_INFO, "caching weather objects", v13, 2u);
  }

  id v12 = [MEMORY[0x263EFF910] date];
  [(WFWeatherStoreCache *)self cache:v10 withinDomain:v9 date:v12 forKey:v8 expiration:0 synchronous:0];
}

- (void)cache:(id)a3 withinDomain:(id)a4 forKey:(id)a5 expiration:(id)a6
{
  id v10 = (void *)MEMORY[0x263EFF910];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v10 date];
  [(WFWeatherStoreCache *)self cache:v14 withinDomain:v13 date:v15 forKey:v12 expiration:v11 synchronous:0];
}

- (void)cache:(id)a3 withinDomain:(id)a4 date:(id)a5 forKey:(id)a6 expiration:(id)a7 synchronous:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (!v16)
  {
    id v29 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Cannot cache w/o date" userInfo:0];
    objc_exception_throw(v29);
  }
  id v19 = v18;
  if (v18
    && ([MEMORY[0x263EFF910] date],
        unint64_t v20 = objc_claimAutoreleasedReturnValue(),
        uint64_t v21 = [v19 compare:v20],
        v20,
        v21 == -1))
  {
    id v25 = WFLogForCategory(5uLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v39 = v17;
      __int16 v40 = 2112;
      id v41 = v15;
      __int16 v42 = 2112;
      v43 = v19;
      _os_log_debug_impl(&dword_21C988000, v25, OS_LOG_TYPE_DEBUG, "Unable to cache key '%@' within domain '%@':  Expiration date '%@' is already expired.", buf, 0x20u);
    }
  }
  else
  {
    [(WFWeatherStoreCache *)self _ensureDomainIsLoaded:v15];
    double v22 = [(WFWeatherStoreCache *)self dirtyCacheDomains];
    uint64_t v23 = [(WFWeatherStoreCache *)self cacheForDomain];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __77__WFWeatherStoreCache_cache_withinDomain_date_forKey_expiration_synchronous___block_invoke;
    v30[3] = &unk_2644306D8;
    id v31 = v23;
    id v32 = v15;
    id v33 = v19;
    id v34 = v17;
    id v35 = v16;
    id v36 = v14;
    id v37 = v22;
    id v24 = v22;
    id v25 = v23;
    id v26 = (void *)MEMORY[0x21D4B3DE0](v30);
    uint64_t v27 = [(WFWeatherStoreCache *)self cacheConcurrentQueue];
    uint64_t v28 = v27;
    if (v8) {
      dispatch_barrier_sync(v27, v26);
    }
    else {
      dispatch_barrier_async(v27, v26);
    }
  }
}

void __77__WFWeatherStoreCache_cache_withinDomain_date_forKey_expiration_synchronous___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 40;
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"values"];
  id v5 = [v3 objectForKeyedSubscript:@"dates"];
  id v6 = [v3 objectForKeyedSubscript:@"WFWeatherStoreCacheRecordExpirationDate"];
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v2 + 8);
  if (v8) {
    [v6 setObject:v8 forKeyedSubscript:*(void *)(a1 + 56)];
  }
  [v5 setObject:*(void *)(a1 + 64) forKeyedSubscript:*(void *)(a1 + 56)];
  [v4 setObject:*(void *)(a1 + 72) forKeyedSubscript:*(void *)(a1 + 56)];
  id v9 = WFLogForCategory(5uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = *(void *)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v19 = *(void *)(a1 + 40);
    int v20 = 138412802;
    uint64_t v21 = v17;
    __int16 v22 = 2112;
    uint64_t v23 = v19;
    __int16 v24 = 2112;
    uint64_t v25 = v18;
    _os_log_debug_impl(&dword_21C988000, v9, OS_LOG_TYPE_DEBUG, "Successfully cached key '%@' within domain '%@'.  Expires %@", (uint8_t *)&v20, 0x20u);
  }

  id v10 = WFLogForCategory(5uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __77__WFWeatherStoreCache_cache_withinDomain_date_forKey_expiration_synchronous___block_invoke_cold_1(v2, v10, v11, v12, v13, v14, v15, v16);
  }

  [*(id *)(a1 + 80) addObject:*(void *)(a1 + 40)];
}

- (void)removeObjectWithinDomain:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(WFWeatherStoreCache *)self _ensureDomainIsLoaded:v6];
  objc_initWeak(&location, self);
  cacheConcurrentQueue = self->_cacheConcurrentQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__WFWeatherStoreCache_removeObjectWithinDomain_forKey___block_invoke;
  v11[3] = &unk_2644306B0;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_sync(cacheConcurrentQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__WFWeatherStoreCache_removeObjectWithinDomain_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_concurrentQueue_barrier_removeObjectWithinDomain:forKey:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)removeAllObjects
{
  id v3 = [(WFWeatherStoreCache *)self cacheConcurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__WFWeatherStoreCache_removeAllObjects__block_invoke;
  block[3] = &unk_2644305E8;
  void block[4] = self;
  dispatch_barrier_async(v3, block);
}

uint64_t __39__WFWeatherStoreCache_removeAllObjects__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cacheForDomain];
  [v2 removeAllObjects];

  id v3 = [*(id *)(a1 + 32) dirtyCacheDomains];
  [v3 removeAllObjects];

  uint64_t v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "_concurrentQueue_barrier_writeCacheDictionaryToFile");
}

- (void)executeTransaction:(id)a3
{
  (*((void (**)(id, WFWeatherStoreCache *))a3 + 2))(a3, self);
  uint64_t v4 = WFLogForCategory(5uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[WFWeatherStoreCache executeTransaction:](v4);
  }

  [(WFWeatherStoreCache *)self writeCacheDictionaryToFile];
}

- (void)_shrinkDomain:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    id v5 = [(WFWeatherStoreCache *)self cacheConcurrentQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__WFWeatherStoreCache__shrinkDomain___block_invoke;
    block[3] = &unk_264430700;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_barrier_sync(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __37__WFWeatherStoreCache__shrinkDomain___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_concurrentQueue_barrier_shrinkDomain:", *(void *)(a1 + 32));
}

- (void)_concurrentQueue_barrier_shrinkDomain:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(WFWeatherStoreCache *)self cacheForDomain];
    id v6 = [v5 objectForKeyedSubscript:v4];

    id v7 = [v6 objectForKeyedSubscript:@"values"];
    id v8 = [v6 objectForKeyedSubscript:@"dates"];
    unint64_t v9 = [v7 count];
    id v10 = WFLogForCategory(5uLL);
    uint64_t v11 = v10;
    if (v9 > 0x1F3)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[WFWeatherStoreCache _concurrentQueue_barrier_shrinkDomain:](v7, v11);
      }

      id v12 = (void *)MEMORY[0x263EFF980];
      id v13 = [v8 allValues];
      uint64_t v11 = [v12 arrayWithArray:v13];

      [v11 sortUsingSelector:sel_compare_];
      id v14 = [v11 objectAtIndexedSubscript:[v11 count] - 250];
      uint64_t v15 = objc_opt_class();
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __61__WFWeatherStoreCache__concurrentQueue_barrier_shrinkDomain___block_invoke;
      v18[3] = &unk_264430728;
      id v16 = v14;
      id v19 = v16;
      if ([v15 removeObjectsFromCache:v6 passingTest:v18])
      {
        uint64_t v17 = WFLogForCategory(5uLL);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[WFWeatherStoreCache _concurrentQueue_barrier_shrinkDomain:]();
        }

        [(NSMutableSet *)self->_dirtyCacheDomains addObject:v4];
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[WFWeatherStoreCache _concurrentQueue_barrier_shrinkDomain:]();
    }
  }
}

BOOL __61__WFWeatherStoreCache__concurrentQueue_barrier_shrinkDomain___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:*(void *)(a1 + 32)] == -1;
}

- (BOOL)_loadDomain:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  objc_initWeak(&location, self);
  id v5 = [(WFWeatherStoreCache *)self cacheConcurrentQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__WFWeatherStoreCache__loadDomain___block_invoke;
  v8[3] = &unk_264430750;
  id v10 = &v13;
  objc_copyWeak(&v11, &location);
  id v9 = v4;
  id v6 = v4;
  dispatch_barrier_sync(v5, v8);

  LOBYTE(v5) = *((unsigned char *)v14 + 24);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v13, 8);
  return (char)v5;
}

void __35__WFWeatherStoreCache__loadDomain___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(WeakRetained, "_concurrentQueue_barrier_loadDomain:", *(void *)(a1 + 32));
}

- (BOOL)_concurrentQueue_barrier_loadDomain:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(WFWeatherStoreCache *)self URL];
    id v6 = [v5 URLByAppendingPathComponent:v4];
    id v7 = [v6 URLByAppendingPathExtension:@"plist"];
    id v8 = [v7 path];

    id v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v8];
    if (v9)
    {
      id v10 = WFLogForCategory(5uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[WFWeatherStoreCache _concurrentQueue_barrier_loadDomain:].cold.5();
      }

      if (_concurrentQueue_barrier_loadDomain__onceToken != -1) {
        dispatch_once(&_concurrentQueue_barrier_loadDomain__onceToken, &__block_literal_global_77);
      }
      id v25 = 0;
      id v11 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:_concurrentQueue_barrier_loadDomain__CacheClasses fromData:v9 error:&v25];
      id v12 = v25;
      uint64_t v13 = v12;
      if (v11 || !v12)
      {

        if (v11)
        {
          uint64_t v23 = [v11 objectForKeyedSubscript:@"Version"];
          uint64_t v24 = [v23 unsignedIntegerValue];

          if (v24 == 18)
          {
            BOOL v20 = 0;
LABEL_16:
            uint64_t v21 = [(WFWeatherStoreCache *)self cacheForDomain];
            [v21 setObject:v11 forKeyedSubscript:v4];

            goto LABEL_20;
          }
        }
LABEL_13:
        uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];

        [v15 setObject:&unk_26CD649B8 forKeyedSubscript:@"Version"];
        char v16 = objc_opt_new();
        [v15 setObject:v16 forKeyedSubscript:@"values"];

        uint64_t v17 = objc_opt_new();
        [v15 setObject:v17 forKeyedSubscript:@"dates"];

        uint64_t v18 = objc_opt_new();
        [v15 setObject:v18 forKeyedSubscript:@"WFWeatherStoreCacheRecordExpirationDate"];

        id v19 = WFLogForCategory(5uLL);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[WFWeatherStoreCache _concurrentQueue_barrier_loadDomain:]();
        }

        BOOL v20 = 1;
        id v11 = v15;
        goto LABEL_16;
      }
      id v14 = WFLogForCategory(7uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[WFWeatherStoreCache _concurrentQueue_barrier_loadDomain:]();
      }
    }
    id v11 = 0;
    goto LABEL_13;
  }
  id v11 = WFLogForCategory(5uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[WFWeatherStoreCache _concurrentQueue_barrier_loadDomain:]();
  }
  BOOL v20 = 0;
LABEL_20:

  return v20;
}

uint64_t __59__WFWeatherStoreCache__concurrentQueue_barrier_loadDomain___block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  _concurrentQueue_barrier_loadDomain__CacheClasses = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, objc_opt_class(), 0);
  return MEMORY[0x270F9A758]();
}

- (void)_markDomainDirty:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x3032000000;
    v9[3] = __Block_byref_object_copy_;
    v9[4] = __Block_byref_object_dispose_;
    id v10 = [(WFWeatherStoreCache *)self dirtyCacheDomains];
    cacheConcurrentQueue = self->_cacheConcurrentQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__WFWeatherStoreCache__markDomainDirty___block_invoke;
    v6[3] = &unk_264430778;
    id v7 = v4;
    id v8 = v9;
    dispatch_barrier_async(cacheConcurrentQueue, v6);

    _Block_object_dispose(v9, 8);
  }
}

uint64_t __40__WFWeatherStoreCache__markDomainDirty___block_invoke(uint64_t a1)
{
  uint64_t v2 = WFLogForCategory(5uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __40__WFWeatherStoreCache__markDomainDirty___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:*(void *)(a1 + 32)];
}

- (id)_loadedCacheDomains
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(WFWeatherStoreCache *)self cacheConcurrentQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__WFWeatherStoreCache__loadedCacheDomains__block_invoke;
  v6[3] = &unk_2644307A0;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__WFWeatherStoreCache__loadedCacheDomains__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) cacheForDomain];
  uint64_t v2 = [v5 allKeys];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_dirtyCacheDomains
{
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy_;
  v13[4] = __Block_byref_object_dispose_;
  id v14 = [(WFWeatherStoreCache *)self dirtyCacheDomains];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(WFWeatherStoreCache *)self cacheConcurrentQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__WFWeatherStoreCache__dirtyCacheDomains__block_invoke;
  v6[3] = &unk_2644307C8;
  void v6[4] = &v7;
  v6[5] = v13;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(v13, 8);
  return v4;
}

uint64_t __41__WFWeatherStoreCache__dirtyCacheDomains__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) allObjects];
  return MEMORY[0x270F9A758]();
}

- (void)_ensureDomainIsLoaded:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWeatherStoreCache *)self _loadedCacheDomains];
  if ([v5 containsObject:v4])
  {
    uint64_t v6 = WFLogForCategory(5uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[WFWeatherStoreCache _ensureDomainIsLoaded:]();
    }
  }
  else
  {
    [(WFWeatherStoreCache *)self _loadDomain:v4];
  }
}

- (void)_concurrentQueue_barrier_deleteOldDataFromCache
{
  [(WFWeatherStoreCache *)self _concurrentQueue_barrier_deleteOldDataFromCache:@"forecasts" allowedStaleness:720];
  [(WFWeatherStoreCache *)self _concurrentQueue_barrier_deleteOldDataFromCache:@"almanac_data" allowedStaleness:2628000];
  [(WFWeatherStoreCache *)self _concurrentQueue_barrier_deleteOldDataFromCache:@"historical_data" allowedStaleness:26280000];
  objc_initWeak(&location, self);
  uint64_t v3 = [(NSMutableDictionary *)self->_cacheForDomain allKeys];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __70__WFWeatherStoreCache__concurrentQueue_barrier_deleteOldDataFromCache__block_invoke;
  v4[3] = &unk_2644307F0;
  objc_copyWeak(&v5, &location);
  [v3 enumerateObjectsUsingBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __70__WFWeatherStoreCache__concurrentQueue_barrier_deleteOldDataFromCache__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_concurrentQueue_barrier_shrinkDomain:", v3);
}

- (void)_concurrentQueue_barrier_deleteOldDataFromCache:(id)a3 allowedStaleness:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(WFWeatherStoreCache *)self cacheForDomain];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  uint64_t v9 = objc_opt_class();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__WFWeatherStoreCache__concurrentQueue_barrier_deleteOldDataFromCache_allowedStaleness___block_invoke;
  v12[3] = &__block_descriptor_40_e34_B32__0_8__NSDate_16___NSCoding__24l;
  v12[4] = a4;
  LODWORD(v7) = [v9 removeObjectsFromCache:v8 passingTest:v12];
  id v10 = WFLogForCategory(5uLL);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v11) {
      -[WFWeatherStoreCache _concurrentQueue_barrier_deleteOldDataFromCache:allowedStaleness:]();
    }

    id v10 = [(WFWeatherStoreCache *)self dirtyCacheDomains];
    [v10 addObject:v6];
  }
  else if (v11)
  {
    -[WFWeatherStoreCache _concurrentQueue_barrier_deleteOldDataFromCache:allowedStaleness:]();
  }
}

BOOL __88__WFWeatherStoreCache__concurrentQueue_barrier_deleteOldDataFromCache_allowedStaleness___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = *(void *)(a1 + 32);
  [a3 timeIntervalSinceNow];
  BOOL result = 1;
  if (a3 && v4)
  {
    double v7 = v5 / 60.0;
    return v7 < 0.0 && -v7 >= (double)v4;
  }
  return result;
}

- (void)_concurrentQueue_barrier_removeObjectWithinDomain:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WFWeatherStoreCache *)self cacheForDomain];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  id v10 = [v9 objectForKeyedSubscript:@"values"];
  BOOL v11 = [v9 objectForKeyedSubscript:@"dates"];
  [v11 removeObjectForKey:v7];
  [v10 removeObjectForKey:v7];
  id v12 = WFLogForCategory(5uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[WFWeatherStoreCache _concurrentQueue_barrier_removeObjectWithinDomain:forKey:]();
  }

  [(NSMutableSet *)self->_dirtyCacheDomains addObject:v6];
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSTimer)cacheStoreTimer
{
  return self->_cacheStoreTimer;
}

- (void)setCacheStoreTimer:(id)a3
{
}

- (OS_dispatch_queue)cacheConcurrentQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCacheConcurrentQueue:(id)a3
{
}

- (NSMutableDictionary)cacheForDomain
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCacheForDomain:(id)a3
{
}

- (NSMutableSet)dirtyCacheDomains
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDirtyCacheDomains:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyCacheDomains, 0);
  objc_storeStrong((id *)&self->_cacheForDomain, 0);
  objc_storeStrong((id *)&self->_cacheConcurrentQueue, 0);
  objc_storeStrong((id *)&self->_cacheStoreTimer, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

+ (void)createCacheIfNecessary:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21C988000, log, OS_LOG_TYPE_ERROR, "Can't create cache with nil URL", v1, 2u);
}

+ (void)createCacheIfNecessary:(os_log_t)log error:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21C988000, log, OS_LOG_TYPE_DEBUG, "Utilizing in-memory cache", v1, 2u);
}

+ (void)createCacheIfNecessary:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C988000, v0, v1, "Utilizing disk cache @ %@", v2, v3, v4, v5, v6);
}

+ (void)createCacheIfNecessary:error:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21C988000, v0, v1, "Cannot write to resources @ %@, aborting cache creation", v2, v3, v4, v5, v6);
}

+ (void)createCacheIfNecessary:error:.cold.5()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_5(&dword_21C988000, v0, v1, "Cannot reach resources @ %@, aborting cache creation: %@");
}

+ (void)createCacheIfNecessary:error:.cold.6()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_5(&dword_21C988000, v0, v1, "Cannot create directory @ %@, aborting cache creation: %@");
}

+ (void)createCacheIfNecessary:error:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C988000, v0, v1, "Creating cache @ %@", v2, v3, v4, v5, v6);
}

- (void)initWithURL:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21C988000, v0, v1, "Cannot write to resources @ %@, aborting cache initialization", v2, v3, v4, v5, v6);
}

- (void)initWithURL:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21C988000, v0, v1, "Unable to initialize cache: %@", v2, v3, v4, v5, v6);
}

void __74__WFWeatherStoreCache__concurrentQueue_barrier_writeCacheDictionaryToFile__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4(&dword_21C988000, v0, v1, "Cache domain '%@' was successfully written to %@");
}

void __74__WFWeatherStoreCache__concurrentQueue_barrier_writeCacheDictionaryToFile__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_5(&dword_21C988000, v0, v1, "Writing cache to \"%@\" failed: %@");
}

+ (void)removeObjectsFromCache:passingTest:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C988000, v0, v1, "Deleting old cached data based on staleness: %@", v2, v3, v4, v5, v6);
}

void __58__WFWeatherStoreCache_removeObjectsFromCache_passingTest___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21C988000, v0, v1, "Found invalid data in the cache, deleting it: %@", v2, v3, v4, v5, v6);
}

void __65__WFWeatherStoreCache_cachedObjectWithinDomain_forKey_staleness___block_invoke_cold_1(void *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_4(&dword_21C988000, (uint64_t)a2, a3, "Successfully retrieved cached value at cache key '%@' within cache domain '%@'", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __77__WFWeatherStoreCache_cache_withinDomain_date_forKey_expiration_synchronous___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)executeTransaction:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21C988000, log, OS_LOG_TYPE_DEBUG, "Executing write transaction...", v1, 2u);
}

- (void)_concurrentQueue_barrier_shrinkDomain:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C988000, v0, v1, "Cache domain '%@' is below the high-water mark. Skipping _shrinkDomain:", v2, v3, v4, v5, v6);
}

- (void)_concurrentQueue_barrier_shrinkDomain:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C988000, v0, v1, "Marking cache domain '%@' as dirty.", v2, v3, v4, v5, v6);
}

- (void)_concurrentQueue_barrier_shrinkDomain:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  [a1 count];
  OUTLINED_FUNCTION_2();
  __int16 v4 = 2048;
  uint64_t v5 = 500;
  _os_log_error_impl(&dword_21C988000, a2, OS_LOG_TYPE_ERROR, "Deleting old cached data based on dictionary size: %lu, max allowed size: %lu", v3, 0x16u);
}

- (void)_concurrentQueue_barrier_loadDomain:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21C988000, v0, v1, "Cache Domain '%@' is invalid.'", v2, v3, v4, v5, v6);
}

- (void)_concurrentQueue_barrier_loadDomain:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C988000, v0, v1, "Generating new domain for %@", v2, v3, v4, v5, v6);
}

- (void)_concurrentQueue_barrier_loadDomain:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21C988000, v0, v1, "Error occured while unarchiving %@", v2, v3, v4, v5, v6);
}

- (void)_concurrentQueue_barrier_loadDomain:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21C988000, v0, v1, "There was an exception while unarchiving the cache dictionary.  This could be caused by a class being present in the archive, but not in the program (such as if it was deleted or renamed).  Since it is a cache we don't care about migrating data so we will just create a new dictionary.  If this exception appears repeatedly, then it may be more concerning, but one-off is fine.  Exception: %@", v2, v3, v4, v5, v6);
}

- (void)_concurrentQueue_barrier_loadDomain:.cold.5()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4(&dword_21C988000, v0, v1, "Loading Cache Domain '%@' @ %@");
}

void __40__WFWeatherStoreCache__markDomainDirty___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_ensureDomainIsLoaded:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C988000, v0, v1, "Cache domain is already loaded: %@", v2, v3, v4, v5, v6);
}

- (void)_concurrentQueue_barrier_deleteOldDataFromCache:allowedStaleness:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C988000, v0, v1, "Deleting old data from Cache Domain '%@' & marking domain as dirty", v2, v3, v4, v5, v6);
}

- (void)_concurrentQueue_barrier_deleteOldDataFromCache:allowedStaleness:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C988000, v0, v1, "Could not delete any old data from Cache Domain '%@'", v2, v3, v4, v5, v6);
}

- (void)_concurrentQueue_barrier_removeObjectWithinDomain:forKey:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4(&dword_21C988000, v0, v1, "Deleting cache key '%@' within domain '%@'.  Domain will be marked as Dirty.");
}

@end
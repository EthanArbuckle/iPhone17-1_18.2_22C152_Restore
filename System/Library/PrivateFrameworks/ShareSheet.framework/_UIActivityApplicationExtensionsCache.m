@interface _UIActivityApplicationExtensionsCache
+ (id)sharedExtensionsCache;
- (NSMutableDictionary)cachedResults;
- (NSMutableDictionary)extensionMatchTokens;
- (OS_dispatch_queue)discoveryQueue;
- (OS_dispatch_queue)primedExtensionsQueue;
- (_UIActivityApplicationExtensionsCache)init;
- (id)_matchingExtensionsCachedResultForKey:(id)a3;
- (id)extensionsResultWithMatchingAttributes:(id)a3;
- (id)reportExtensionsCacheResult;
- (void)_cacheMatchingExtensions:(id)a3 cacheKey:(id)a4 error:(id)a5;
- (void)_cacheMatchingExtensionsResult:(id)a3 cacheKey:(id)a4;
- (void)_startContinuousExtensionDiscoveryForAttributes:(id)a3 cacheKey:(id)a4;
- (void)_startPrecachingContinuousExtensionDiscovery;
- (void)primeExtensionsResultWithMatchingAttributes:(id)a3;
- (void)setCachedResults:(id)a3;
- (void)setDiscoveryQueue:(id)a3;
- (void)setExtensionMatchTokens:(id)a3;
- (void)setPrimedExtensionsQueue:(id)a3;
@end

@implementation _UIActivityApplicationExtensionsCache

+ (id)sharedExtensionsCache
{
  if (sharedExtensionsCache_onceToken != -1) {
    dispatch_once(&sharedExtensionsCache_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)sharedExtensionsCache_extensionsCache;
  return v2;
}

- (_UIActivityApplicationExtensionsCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)_UIActivityApplicationExtensionsCache;
  v2 = [(_UIActivityApplicationExtensionsCache *)&v10 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(_UIActivityApplicationExtensionsCache *)v2 setCachedResults:v3];

    v4 = objc_opt_new();
    [(_UIActivityApplicationExtensionsCache *)v2 setExtensionMatchTokens:v4];

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.SharingUI.ShareSheet.primedExtensions", v5);
    [(_UIActivityApplicationExtensionsCache *)v2 setPrimedExtensionsQueue:v6];

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.SharingUI.ShareSheet.discoveryExtensions", v7);
    [(_UIActivityApplicationExtensionsCache *)v2 setDiscoveryQueue:v8];

    v2->_cacheLock._os_unfair_lock_opaque = 0;
    [(_UIActivityApplicationExtensionsCache *)v2 _startPrecachingContinuousExtensionDiscovery];
  }
  return v2;
}

- (void)_startPrecachingContinuousExtensionDiscovery
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v7 = [&unk_1EF339990 count];
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "ExtensionsCache: processing %lu registrations for continuous discovery precaching", buf, 0xCu);
  }

  v4 = [(_UIActivityApplicationExtensionsCache *)self discoveryQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85___UIActivityApplicationExtensionsCache__startPrecachingContinuousExtensionDiscovery__block_invoke;
  block[3] = &unk_1E5A21900;
  block[4] = self;
  dispatch_async(v4, block);
}

- (id)_matchingExtensionsCachedResultForKey:(id)a3
{
  p_cacheLock = &self->_cacheLock;
  id v5 = a3;
  os_unfair_lock_lock(p_cacheLock);
  dispatch_queue_t v6 = [(_UIActivityApplicationExtensionsCache *)self cachedResults];
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_cacheLock);
  return v7;
}

- (void)_cacheMatchingExtensionsResult:(id)a3 cacheKey:(id)a4
{
  p_cacheLock = &self->_cacheLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_cacheLock);
  v9 = [(_UIActivityApplicationExtensionsCache *)self cachedResults];
  [v9 setObject:v8 forKeyedSubscript:v7];

  os_unfair_lock_unlock(p_cacheLock);
}

- (void)_cacheMatchingExtensions:(id)a3 cacheKey:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v13 = (id)objc_opt_new();
  v11 = (void *)[v10 copy];

  [v13 setExtensions:v11];
  v12 = (void *)[v8 copy];

  [v13 setError:v12];
  [(_UIActivityApplicationExtensionsCache *)self _cacheMatchingExtensionsResult:v13 cacheKey:v9];
}

- (void)_startContinuousExtensionDiscoveryForAttributes:(id)a3 cacheKey:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_UIActivityApplicationExtensionsCache *)self discoveryQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(_UIActivityApplicationExtensionsCache *)self extensionMatchTokens];
  id v10 = [v9 objectForKeyedSubscript:v7];

  v11 = share_sheet_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_1A0AD8000, v11, OS_LOG_TYPE_DEFAULT, "ExtensionsCache: continuous discovery is already running for cache key = [%@]", buf, 0xCu);
    }
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_1A0AD8000, v11, OS_LOG_TYPE_DEFAULT, "ExtensionsCache: start continuous discovery for cache key = [%@]", buf, 0xCu);
    }

    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    id v13 = (void *)MEMORY[0x1E4F28C70];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __98___UIActivityApplicationExtensionsCache__startContinuousExtensionDiscoveryForAttributes_cacheKey___block_invoke;
    v20 = &unk_1E5A21A00;
    id v14 = v7;
    id v21 = v14;
    objc_copyWeak(&v22, (id *)buf);
    v15 = [v13 beginMatchingExtensionsWithAttributes:v6 completion:&v17];
    v16 = [(_UIActivityApplicationExtensionsCache *)self extensionMatchTokens];
    [v16 setObject:v15 forKeyedSubscript:v14];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
}

- (void)primeExtensionsResultWithMatchingAttributes:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _cacheKeyWithMatchingAttributes(v4);
  id v6 = [(_UIActivityApplicationExtensionsCache *)self _matchingExtensionsCachedResultForKey:v5];

  if (v6)
  {
    id v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl(&dword_1A0AD8000, v7, OS_LOG_TYPE_DEFAULT, "ExtensionsCache: found cached result. no priming needed for cache key = [%@]", buf, 0xCu);
    }
  }
  else
  {
    self->_primed = 1;
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    id v8 = [(_UIActivityApplicationExtensionsCache *)self primedExtensionsQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85___UIActivityApplicationExtensionsCache_primeExtensionsResultWithMatchingAttributes___block_invoke;
    block[3] = &unk_1E5A21A50;
    objc_copyWeak(&v12, (id *)buf);
    id v10 = v5;
    id v11 = v4;
    dispatch_async(v8, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

- (id)extensionsResultWithMatchingAttributes:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _cacheKeyWithMatchingAttributes(v4);
  id v6 = [(_UIActivityApplicationExtensionsCache *)self _matchingExtensionsCachedResultForKey:v5];
  if (v6)
  {
    id v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v6 extensions];
      uint64_t v9 = [v8 count];
      id v10 = [v6 error];
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      *(_WORD *)&buf[22] = 2112;
      v43 = v10;
      _os_log_impl(&dword_1A0AD8000, v7, OS_LOG_TYPE_DEFAULT, "ExtensionsCache: found %lu cached extensions for cache key = [%@], error = %@", buf, 0x20u);
    }
    if (self->_primed) {
      ++self->_cacheMisses;
    }
    else {
      ++self->_cacheHits;
    }
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v43 = __Block_byref_object_copy__0;
    v44 = __Block_byref_object_dispose__0;
    id v45 = 0;
    id v11 = [(_UIActivityApplicationExtensionsCache *)self primedExtensionsQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80___UIActivityApplicationExtensionsCache_extensionsResultWithMatchingAttributes___block_invoke;
    block[3] = &unk_1E5A21A78;
    v35 = buf;
    void block[4] = self;
    id v12 = v5;
    id v34 = v12;
    dispatch_sync(v11, block);

    id v13 = *(id *)(*(void *)&buf[8] + 40);
    if (v13)
    {
      id v6 = v13;
      uint64_t v14 = share_sheet_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [v6 extensions];
        uint64_t v16 = [v15 count];
        uint64_t v17 = [v6 error];
        *(_DWORD *)v36 = 134218498;
        uint64_t v37 = v16;
        __int16 v38 = 2112;
        id v39 = v12;
        __int16 v40 = 2112;
        v41 = v17;
        _os_log_impl(&dword_1A0AD8000, v14, OS_LOG_TYPE_DEFAULT, "ExtensionsCache: no cache found but primed %lu extensions ready for cache key = [%@], error = %@", v36, 0x20u);
      }
    }
    else
    {
      uint64_t v18 = [(_UIActivityApplicationExtensionsCache *)self discoveryQueue];
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      v28 = __80___UIActivityApplicationExtensionsCache_extensionsResultWithMatchingAttributes___block_invoke_401;
      v29 = &unk_1E5A21A28;
      v30 = self;
      id v19 = v4;
      id v31 = v19;
      id v20 = v12;
      id v32 = v20;
      dispatch_async(v18, &v26);

      id v6 = _syncGetExtensionsResultWithMatchingAttributes(v19, 0, 0);
      id v21 = share_sheet_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = objc_msgSend(v6, "extensions", v26, v27, v28, v29, v30, v31);
        uint64_t v23 = [v22 count];
        uint64_t v24 = [v6 error];
        *(_DWORD *)v36 = 134218498;
        uint64_t v37 = v23;
        __int16 v38 = 2112;
        id v39 = v20;
        __int16 v40 = 2112;
        v41 = v24;
        _os_log_impl(&dword_1A0AD8000, v21, OS_LOG_TYPE_DEFAULT, "ExtensionsCache: no cache found. got %lu new extensions for cache key = [%@], error = %@", v36, 0x20u);
      }
    }
    ++self->_cacheMisses;

    _Block_object_dispose(buf, 8);
  }
  self->_primed = 0;

  return v6;
}

- (id)reportExtensionsCacheResult
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"extensionsCacheMisses";
  v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_cacheMisses];
  v7[1] = @"extensionsCacheHits";
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_cacheHits];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  self->_cacheMisses = 0;
  self->_cacheHits = 0;
  return v5;
}

- (OS_dispatch_queue)primedExtensionsQueue
{
  return self->_primedExtensionsQueue;
}

- (void)setPrimedExtensionsQueue:(id)a3
{
}

- (OS_dispatch_queue)discoveryQueue
{
  return self->_discoveryQueue;
}

- (void)setDiscoveryQueue:(id)a3
{
}

- (NSMutableDictionary)cachedResults
{
  return self->_cachedResults;
}

- (void)setCachedResults:(id)a3
{
}

- (NSMutableDictionary)extensionMatchTokens
{
  return self->_extensionMatchTokens;
}

- (void)setExtensionMatchTokens:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionMatchTokens, 0);
  objc_storeStrong((id *)&self->_cachedResults, 0);
  objc_storeStrong((id *)&self->_discoveryQueue, 0);
  objc_storeStrong((id *)&self->_primedExtensionsQueue, 0);
}

@end
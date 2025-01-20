@interface UIActivityApplicationExtensionsCache
@end

@implementation UIActivityApplicationExtensionsCache

uint64_t __62___UIActivityApplicationExtensionsCache_sharedExtensionsCache__block_invoke()
{
  v0 = objc_alloc_init(_UIActivityApplicationExtensionsCache);
  uint64_t v1 = sharedExtensionsCache_extensionsCache;
  sharedExtensionsCache_extensionsCache = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __85___UIActivityApplicationExtensionsCache__startPrecachingContinuousExtensionDiscovery__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  v2 = (void (*)(void))getDMPerformMigrationIfNeededSymbolLoc_ptr;
  v17 = getDMPerformMigrationIfNeededSymbolLoc_ptr;
  if (!getDMPerformMigrationIfNeededSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v20 = __getDMPerformMigrationIfNeededSymbolLoc_block_invoke;
    v21 = &unk_1E5A216E8;
    v22 = &v14;
    __getDMPerformMigrationIfNeededSymbolLoc_block_invoke((uint64_t)&buf);
    v2 = (void (*)(void))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v2)
  {
    __85___UIActivityApplicationExtensionsCache__startPrecachingContinuousExtensionDiscovery__block_invoke_cold_1();
    __break(1u);
  }
  v2();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t result = [&unk_1EF339990 countByEnumeratingWithState:&v10 objects:v18 count:16];
  uint64_t v4 = result;
  if (result)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(&unk_1EF339990);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        v8 = _cacheKeyWithMatchingAttributes(v7);
        [*(id *)(a1 + 32) _startContinuousExtensionDiscoveryForAttributes:v7 cacheKey:v8];
        v9 = share_sheet_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v8;
          _os_log_impl(&dword_1A0AD8000, v9, OS_LOG_TYPE_DEFAULT, "ExtensionsCache: registered for cache key = [%@]", (uint8_t *)&buf, 0xCu);
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [&unk_1EF339990 countByEnumeratingWithState:&v10 objects:v18 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

void __98___UIActivityApplicationExtensionsCache__startContinuousExtensionDiscoveryForAttributes_cacheKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = share_sheet_log();
  WeakRetained = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __98___UIActivityApplicationExtensionsCache__startContinuousExtensionDiscoveryForAttributes_cacheKey___block_invoke_cold_1(a1, (uint64_t)v6, WeakRetained);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v5 count];
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 134218242;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_impl(&dword_1A0AD8000, WeakRetained, OS_LOG_TYPE_DEFAULT, "ExtensionsCache: %lu new extensions from NSExtension for cache key = [%@]", (uint8_t *)&v11, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _cacheMatchingExtensions:v5 cacheKey:*(void *)(a1 + 32) error:0];
  }
}

void __85___UIActivityApplicationExtensionsCache_primeExtensionsResultWithMatchingAttributes___block_invoke(id *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained _matchingExtensionsCachedResultForKey:a1[4]];
    if (!v4)
    {
      id v5 = [v3 discoveryQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __85___UIActivityApplicationExtensionsCache_primeExtensionsResultWithMatchingAttributes___block_invoke_2;
      block[3] = &unk_1E5A21A28;
      block[4] = v3;
      id v9 = a1[5];
      id v10 = a1[4];
      dispatch_async(v5, block);

      uint64_t v4 = _syncGetExtensionsResultWithMatchingAttributes(a1[5], 1, v3);
      id v6 = share_sheet_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = a1[4];
        *(_DWORD *)long long buf = 138412290;
        id v12 = v7;
        _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "ExtensionsCache: priming done for cache key = [%@]", buf, 0xCu);
      }

      [v3 _cacheMatchingExtensionsResult:v4 cacheKey:a1[4]];
    }
  }
}

uint64_t __85___UIActivityApplicationExtensionsCache_primeExtensionsResultWithMatchingAttributes___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startContinuousExtensionDiscoveryForAttributes:*(void *)(a1 + 40) cacheKey:*(void *)(a1 + 48)];
}

uint64_t __80___UIActivityApplicationExtensionsCache_extensionsResultWithMatchingAttributes___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _matchingExtensionsCachedResultForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __80___UIActivityApplicationExtensionsCache_extensionsResultWithMatchingAttributes___block_invoke_401(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startContinuousExtensionDiscoveryForAttributes:*(void *)(a1 + 40) cacheKey:*(void *)(a1 + 48)];
}

uint64_t __85___UIActivityApplicationExtensionsCache__startPrecachingContinuousExtensionDiscovery__block_invoke_cold_1()
{
  dlerror();
  int v0 = abort_report_np();
  return __98___UIActivityApplicationExtensionsCache__startContinuousExtensionDiscoveryForAttributes_cacheKey___block_invoke_cold_1(v0, v1, v2);
}

void __98___UIActivityApplicationExtensionsCache__startContinuousExtensionDiscoveryForAttributes_cacheKey___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "ExtensionsCache: continuous extension discovery failed for cacheKey = [%@], error = %@", (uint8_t *)&v4, 0x16u);
}

@end
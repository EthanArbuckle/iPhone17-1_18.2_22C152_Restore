@interface ATXClientModelCacheManager
- (ATXClientModelCacheManager)init;
- (double)cacheAgeForClientModel:(id)a3;
- (id)cacheDirectory;
- (id)cacheFileHandlerForClientModel:(id)a3 guardedData:(id)a4;
- (id)cachedSuggestionsForAllClientModels;
- (id)cachedSuggestionsForClientModel:(id)a3;
- (id)lastCacheUpdateDateForClientModel:(id)a3;
- (void)addCacheHandlersForExistingClientModelCaches;
- (void)addNewCacheHandlerIfNeededGivenExistingCacheHandlersInGuardedData:(id)a3 clientModelId:(id)a4;
- (void)initGuardedData;
- (void)updateCachedSuggestions:(id)a3;
@end

@implementation ATXClientModelCacheManager

- (ATXClientModelCacheManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)ATXClientModelCacheManager;
  v2 = [(ATXClientModelCacheManager *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(ATXClientModelCacheManager *)v2 initGuardedData];
    [(ATXClientModelCacheManager *)v3 addCacheHandlersForExistingClientModelCaches];
  }
  return v3;
}

- (void)initGuardedData
{
  id v5 = (id)objc_opt_new();
  v3 = (_PASLock *)[objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v5];
  clientModelCacheHandlersLock = self->_clientModelCacheHandlersLock;
  self->_clientModelCacheHandlersLock = v3;
}

- (void)addCacheHandlersForExistingClientModelCaches
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(ATXClientModelCacheManager *)self cacheDirectory];
  id v5 = [v3 contentsOfDirectoryAtPath:v4 error:0];

  if (v5)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x1B3E6F520]();
          v12 = +[ATXClientModelCacheFileHandler clientModelIdFromFileName:v10];
          clientModelCacheHandlersLock = self->_clientModelCacheHandlersLock;
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __74__ATXClientModelCacheManager_addCacheHandlersForExistingClientModelCaches__block_invoke;
          v16[3] = &unk_1E5F00A80;
          v16[4] = self;
          id v17 = v12;
          id v14 = v12;
          [(_PASLock *)clientModelCacheHandlersLock runWithLockAcquired:v16];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }
  }
}

void __74__ATXClientModelCacheManager_addCacheHandlersForExistingClientModelCaches__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) addNewCacheHandlerIfNeededGivenExistingCacheHandlersInGuardedData:a2 clientModelId:*(void *)(a1 + 40)];
  v3 = __atxlog_handle_blending();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1AE67F000, v3, OS_LOG_TYPE_DEFAULT, "Blending: Recovered suggestions for Client Model: <<%@>>", (uint8_t *)&v5, 0xCu);
  }
}

- (id)cacheDirectory
{
  return (id)[MEMORY[0x1E4F4B650] clientModelCachesRootDirectory];
}

- (id)cachedSuggestionsForAllClientModels
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  id v12 = (id)objc_opt_new();
  clientModelCacheHandlersLock = self->_clientModelCacheHandlersLock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__ATXClientModelCacheManager_cachedSuggestionsForAllClientModels__block_invoke;
  v6[3] = &unk_1E5F00AA8;
  v6[4] = self;
  v6[5] = &v7;
  [(_PASLock *)clientModelCacheHandlersLock runWithLockAcquired:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __65__ATXClientModelCacheManager_cachedSuggestionsForAllClientModels__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  id v4 = v3[1];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v5 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1B3E6F520]();
        id v12 = [*(id *)(a1 + 32) cachedSuggestionsForClientModel:v10];
        if (v12) {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v12 forKeyedSubscript:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (id)cachedSuggestionsForClientModel:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__0;
  long long v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  clientModelCacheHandlersLock = self->_clientModelCacheHandlersLock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__ATXClientModelCacheManager_cachedSuggestionsForClientModel___block_invoke;
  v9[3] = &unk_1E5F00AD0;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [(_PASLock *)clientModelCacheHandlersLock runWithLockAcquired:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __62__ATXClientModelCacheManager_cachedSuggestionsForClientModel___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = (void *)MEMORY[0x1B3E6F520]();
  id v4 = [*(id *)(a1 + 32) cacheFileHandlerForClientModel:*(void *)(a1 + 40) guardedData:v8];
  uint64_t v5 = [v4 readSuggestionsFromCache];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)lastCacheUpdateDateForClientModel:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__0;
  long long v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  clientModelCacheHandlersLock = self->_clientModelCacheHandlersLock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__ATXClientModelCacheManager_lastCacheUpdateDateForClientModel___block_invoke;
  v9[3] = &unk_1E5F00AD0;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [(_PASLock *)clientModelCacheHandlersLock runWithLockAcquired:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __64__ATXClientModelCacheManager_lastCacheUpdateDateForClientModel___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [*(id *)(a1 + 32) cacheFileHandlerForClientModel:*(void *)(a1 + 40) guardedData:a2];
  id v4 = [v3 cacheFilePath];
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v16 = 0;
  id v6 = [v5 attributesOfItemAtPath:v4 error:&v16];
  id v7 = v16;

  if (v7)
  {
    id v8 = [v7 userInfo];
    uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
    uint64_t v10 = [v9 code];

    v11 = __atxlog_handle_blending();
    uint64_t v12 = v11;
    if (v10 == 2)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v13;
        _os_log_impl(&dword_1AE67F000, v12, OS_LOG_TYPE_DEFAULT, "There is no client model cache file for clientModelId: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      __64__ATXClientModelCacheManager_lastCacheUpdateDateForClientModel___block_invoke_cold_1((uint64_t)v7, v12);
    }
  }
  else
  {
    uint64_t v14 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28310]];
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(NSObject **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

- (double)cacheAgeForClientModel:(id)a3
{
  v3 = [(ATXClientModelCacheManager *)self lastCacheUpdateDateForClientModel:a3];
  id v4 = v3;
  if (v3)
  {
    [v3 timeIntervalSinceNow];
    double v6 = -v5;
  }
  else
  {
    double v6 = -1.0;
  }

  return v6;
}

- (void)updateCachedSuggestions:(id)a3
{
  id v4 = a3;
  clientModelCacheHandlersLock = self->_clientModelCacheHandlersLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__ATXClientModelCacheManager_updateCachedSuggestions___block_invoke;
  v7[3] = &unk_1E5F00A80;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [(_PASLock *)clientModelCacheHandlersLock runWithLockAcquired:v7];
}

void __54__ATXClientModelCacheManager_updateCachedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = a2;
  v3 = [*(id *)(a1 + 32) clientModelId];
  id v4 = [*(id *)(a1 + 40) cacheFileHandlerForClientModel:v3 guardedData:v9];
  uint64_t v5 = [*(id *)(a1 + 32) suggestions];
  if (v5
    && (id v6 = (void *)v5,
        [*(id *)(a1 + 32) suggestions],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v6,
        v8))
  {
    [v4 createCacheFileForClientModelCacheUpdate:*(void *)(a1 + 32)];
  }
  else
  {
    [v4 deleteCachedSuggestionsFile];
    [v9[1] removeObjectForKey:v3];
  }
}

- (id)cacheFileHandlerForClientModel:(id)a3 guardedData:(id)a4
{
  id v7 = *((id *)a4 + 1);
  id v8 = a3;
  [(ATXClientModelCacheManager *)self addNewCacheHandlerIfNeededGivenExistingCacheHandlersInGuardedData:a4 clientModelId:v8];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  return v9;
}

- (void)addNewCacheHandlerIfNeededGivenExistingCacheHandlersInGuardedData:(id)a3 clientModelId:(id)a4
{
  v11 = (id *)a3;
  id v6 = a4;
  id v7 = [v11[1] objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v8 = [ATXClientModelCacheFileHandler alloc];
    uint64_t v9 = [(ATXClientModelCacheManager *)self cacheDirectory];
    uint64_t v10 = [(ATXClientModelCacheFileHandler *)v8 initWithCacheFileBasePath:v9 clientModelId:v6];
    [v11[1] setObject:v10 forKeyedSubscript:v6];
  }
}

- (void).cxx_destruct
{
}

void __64__ATXClientModelCacheManager_lastCacheUpdateDateForClientModel___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_FAULT, "Encountered error getting cache age: %@", (uint8_t *)&v2, 0xCu);
}

@end
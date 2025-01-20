@interface PLGraphCache
- (Class)cachedClassFromLabelID:(id)a3;
- (Class)classFromLabelID:(id)a3 withContext:(id)a4;
- (NSString)logPrefix;
- (PLGraphCache)init;
- (id)_existingLabelWithID:(id)a3 inContext:(id)a4;
- (id)_lock_objectIDForLabelWithCode:(unsigned int)a3 inContext:(id)a4;
- (id)cachedObjectIDForLabelWithCode:(unsigned int)a3;
- (id)labelWithCode:(unsigned int)a3 inContext:(id)a4;
- (id)objectIDForLabelWithCode:(unsigned int)a3 inContext:(id)a4;
- (unint64_t)countOfCachedClasses;
- (unint64_t)countOfCachedObjectIDs;
- (void)_lock_addLabelToCache:(id)a3;
- (void)_lock_clearCache;
- (void)_lock_fetchAndCacheWithLabelCode:(unsigned int)a3 inContext:(id)a4;
- (void)_lock_populateCacheIfNecessaryWithContext:(id)a3;
- (void)_lock_populateCacheWithAllLabelsInContext:(id)a3;
- (void)clearCache;
@end

@implementation PLGraphCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_lock_labelIDsByCode, 0);
  objc_storeStrong((id *)&self->_lock_classesByLabelID, 0);
}

- (NSString)logPrefix
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)_lock_addLabelToCache:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = [v4 objectID];
  lock_labelIDsByCode = self->_lock_labelIDsByCode;
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "code"));
  [(NSMutableDictionary *)lock_labelIDsByCode setObject:v5 forKeyedSubscript:v7];

  v8 = [v4 plsClassName];
  Class v9 = NSClassFromString(v8);

  if (v9)
  {
    if ([(objc_class *)v9 isSubclassOfClass:objc_opt_class()])
    {
      lock_classesByLabelID = self->_lock_classesByLabelID;
      v11 = [v4 objectID];
      [(NSMutableDictionary *)lock_classesByLabelID setObject:v9 forKeyedSubscript:v11];
    }
    else
    {
      v12 = PLBackendGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v13 = [(PLGraphCache *)self logPrefix];
        v14 = [v4 plsClassName];
        int v15 = 138543618;
        v16 = v13;
        __int16 v17 = 2114;
        v18 = v14;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_FAULT, "%{public}@: Class with name: %{public}@ does not inherit from PLGraphNodeContainer.", (uint8_t *)&v15, 0x16u);
      }
    }
  }
}

- (void)_lock_populateCacheWithAllLabelsInContext:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_lock_cacheIsPopulated)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PLGraphCache.m", 197, @"Invalid parameter not satisfying: %@", @"!_lock_cacheIsPopulated" object file lineNumber description];
  }
  v6 = +[PLGraphLabel fetchRequest];
  [v6 setIncludesPendingChanges:0];
  id v25 = 0;
  v7 = [v5 executeFetchRequest:v6 error:&v25];
  id v8 = v25;
  if (v7)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
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
          [(PLGraphCache *)self _lock_addLabelToCache:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v11);
    }

    self->_lock_cacheIsPopulated = 1;
    v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [(PLGraphCache *)self logPrefix];
      uint64_t v16 = [v9 count];
      *(_DWORD *)buf = 138543618;
      v28 = v15;
      __int16 v29 = 2048;
      uint64_t v30 = v16;
      __int16 v17 = "%{public}@: Populated cache with %zu labels";
      v18 = v14;
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_19B3C7000, v18, v19, v17, buf, 0x16u);
    }
  }
  else
  {
    v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = [(PLGraphCache *)self logPrefix];
      *(_DWORD *)buf = 138543618;
      v28 = v15;
      __int16 v29 = 2112;
      uint64_t v30 = (uint64_t)v8;
      __int16 v17 = "%{public}@: Error fetching labels: %@";
      v18 = v14;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
}

- (void)_lock_populateCacheIfNecessaryWithContext:(id)a3
{
  id v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_lock_cacheIsPopulated)
  {
    id v4 = (void *)MEMORY[0x19F38D3B0]();
    [(PLGraphCache *)self _lock_populateCacheWithAllLabelsInContext:v5];
  }
}

- (unint64_t)countOfCachedClasses
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  PLRunWithUnfairLock();
  unint64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __36__PLGraphCache_countOfCachedClasses__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (Class)cachedClassFromLabelID:(id)a3
{
  id v6 = a3;
  id v3 = v6;
  uint64_t v4 = (objc_class *)(id)PLResultWithUnfairLock();

  return v4;
}

uint64_t __39__PLGraphCache_cachedClassFromLabelID___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
}

- (Class)classFromLabelID:(id)a3 withContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PLGraphCache.m", 154, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  v14 = v8;
  int v15 = v7;
  id v9 = v7;
  id v10 = v8;
  uint64_t v11 = (objc_class *)(id)PLResultWithUnfairLock();

  return v11;
}

uint64_t __45__PLGraphCache_classFromLabelID_withContext___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_lock_populateCacheIfNecessaryWithContext:", *(void *)(a1 + 40));
  unint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 objectForKeyedSubscript:v3];
}

- (unint64_t)countOfCachedObjectIDs
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  PLRunWithUnfairLock();
  unint64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __38__PLGraphCache_countOfCachedObjectIDs__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)cachedObjectIDForLabelWithCode:(unsigned int)a3
{
  uint64_t v3 = PLResultWithUnfairLock();
  return v3;
}

id __47__PLGraphCache_cachedObjectIDForLabelWithCode___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  unint64_t v2 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  uint64_t v3 = [v1 objectForKeyedSubscript:v2];

  return v3;
}

- (void)_lock_fetchAndCacheWithLabelCode:(unsigned int)a3 inContext:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  id v7 = a4;
  os_unfair_lock_assert_owner(p_lock);
  id v8 = +[PLGraphLabel fetchLabelWithCode:v4 inContext:v7];

  if (v8)
  {
    [(PLGraphCache *)self _lock_addLabelToCache:v8];
    id v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [(PLGraphCache *)self logPrefix];
      int v11 = 138543874;
      uint64_t v12 = v10;
      __int16 v13 = 1024;
      int v14 = v4;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "%{public}@: Added label with code %u to cache: %@", (uint8_t *)&v11, 0x1Cu);
    }
  }
}

- (id)_lock_objectIDForLabelWithCode:(unsigned int)a3 inContext:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  [(PLGraphCache *)self _lock_populateCacheIfNecessaryWithContext:v6];
  lock_labelIDsByCode = self->_lock_labelIDsByCode;
  id v8 = [NSNumber numberWithUnsignedInt:v4];
  id v9 = [(NSMutableDictionary *)lock_labelIDsByCode objectForKeyedSubscript:v8];

  if (!v9)
  {
    [(PLGraphCache *)self _lock_fetchAndCacheWithLabelCode:v4 inContext:v6];
    id v10 = self->_lock_labelIDsByCode;
    int v11 = [NSNumber numberWithUnsignedInt:v4];
    id v9 = [(NSMutableDictionary *)v10 objectForKeyedSubscript:v11];
  }
  return v9;
}

- (id)objectIDForLabelWithCode:(unsigned int)a3 inContext:(id)a4
{
  id v6 = a4;
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PLGraphCache.m", 98, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  id v7 = v6;
  id v8 = PLResultWithUnfairLock();

  return v8;
}

uint64_t __51__PLGraphCache_objectIDForLabelWithCode_inContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_objectIDForLabelWithCode:inContext:", *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
}

- (id)_existingLabelWithID:(id)a3 inContext:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v12 = 0;
  id v7 = [a4 existingObjectWithID:v6 error:&v12];
  id v8 = v12;
  if (!v7)
  {
    id v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [(PLGraphCache *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      int v14 = v10;
      __int16 v15 = 2114;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Error getting label with ID %{public}@: %@", buf, 0x20u);
    }
  }

  return v7;
}

- (id)labelWithCode:(unsigned int)a3 inContext:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(PLGraphCache *)self objectIDForLabelWithCode:v4 inContext:v6];
  if (v7)
  {
    id v8 = [(PLGraphCache *)self _existingLabelWithID:v7 inContext:v6];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_lock_clearCache
{
  os_unfair_lock_assert_owner(&self->_lock);
  self->_lock_cacheIsPopulated = 0;
  [(NSMutableDictionary *)self->_lock_classesByLabelID removeAllObjects];
  lock_labelIDsByCode = self->_lock_labelIDsByCode;
  [(NSMutableDictionary *)lock_labelIDsByCode removeAllObjects];
}

- (void)clearCache
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLBackendGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [(PLGraphCache *)self logPrefix];
    *(_DWORD *)buf = 138543362;
    id v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "%{public}@: Clearing cache", buf, 0xCu);
  }
  PLRunWithUnfairLock();
}

uint64_t __26__PLGraphCache_clearCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_clearCache");
}

- (PLGraphCache)init
{
  v12.receiver = self;
  v12.super_class = (Class)PLGraphCache;
  unint64_t v2 = [(PLGraphCache *)&v12 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_lock_cacheIsPopulated = 0;
    uint64_t v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lock_classesByLabelID = v3->_lock_classesByLabelID;
    v3->_lock_classesByLabelID = v4;

    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lock_labelIDsByCode = v3->_lock_labelIDsByCode;
    v3->_lock_labelIDsByCode = v6;

    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"PLGraphCache-%p", v3);
    logPrefix = v3->_logPrefix;
    v3->_logPrefix = (NSString *)v8;

    id v10 = v3;
  }

  return v3;
}

@end
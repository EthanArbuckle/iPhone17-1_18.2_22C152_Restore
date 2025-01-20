@interface TRIPruningFactorLevelCache
- (TRIPruningFactorLevelCache)initWithPruningDelaySeconds:(double)a3 loadFactorLevels:(id)a4;
- (id)factorLevelCurrentlyCachedForFactorName:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (void)_populateCacheForRequiredKey:(id)a3 guardedData:(id)a4;
- (void)enumerateFactorLevelsUsingBlock:(id)a3;
- (void)pruneSynchronously;
@end

@implementation TRIPruningFactorLevelCache

void __71__TRIPruningFactorLevelCache__populateCacheForRequiredKey_guardedData___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  v3 = (void *)MEMORY[0x19F3AD060]();
  if ([v12 hasFactor])
  {
    v4 = [v12 factor];
    int v5 = [v4 hasName];

    if (v5)
    {
      v6 = [v12 factor];
      v7 = [v6 name];

      v8 = *(void **)(a1 + 32);
      if (v8 && ([v8 isEqualToString:v7] & 1) != 0
        || (v9 = (void *)(a1 + 40),
            [*(id *)(*(void *)(a1 + 40) + 16) objectForKeyedSubscript:v7],
            v10 = objc_claimAutoreleasedReturnValue(),
            v10,
            v10))
      {
        v9 = (void *)(a1 + 40);
        uint64_t v11 = 16;
      }
      else
      {
        uint64_t v11 = 24;
      }
      [*(id *)(*v9 + v11) setObject:v12 forKeyedSubscript:v7];
    }
  }
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x19F3AD060]();
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__TRIPruningFactorLevelCache_objectForKeyedSubscript___block_invoke;
  v11[3] = &unk_1E596AE00;
  v13 = &v15;
  SEL v14 = a2;
  v11[4] = self;
  id v8 = v5;
  id v12 = v8;
  [(_PASLock *)lock runWithLockAcquired:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

void __62__TRIPruningFactorLevelCache_enumerateFactorLevelsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (!v3[2])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"TRIFactorLevelCaching.m", 164, @"Invalid parameter not satisfying: %@", @"guardedData->requiredLevels" object file lineNumber description];
  }
  id v4 = v3[3];
  id v5 = TRILogCategory_ClientFramework();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      SEL v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138412290;
      v18 = v15;
      _os_log_debug_impl(&dword_19D909000, v6, OS_LOG_TYPE_DEBUG, "%@: allValues prefetch hit", buf, 0xCu);
    }
    goto LABEL_6;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl(&dword_19D909000, v6, OS_LOG_TYPE_INFO, "%@: allValues requires cache reload", buf, 0xCu);
  }
  [*(id *)(a1 + 32) _populateCacheForRequiredKey:0 guardedData:v3];
  if (!v3[3])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"TRIFactorLevelCaching.m", 173, @"Invalid parameter not satisfying: %@", @"guardedData->prefetchedLevels" object file lineNumber description];
LABEL_6:
  }
  id v9 = [v3[2] allValues];
  v10 = [v3[3] allValues];
  uint64_t v11 = [v9 arrayByAddingObjectsFromArray:v10];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

- (void)_populateCacheForRequiredKey:(id)a3 guardedData:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  id v9 = (void *)*((void *)v7 + 3);
  *((void *)v7 + 3) = v8;

  if (*((void *)v7 + 1))
  {
    v10 = (void *)MEMORY[0x19F3AD060]();
    uint64_t v11 = (*(void (**)(void))(*((void *)v7 + 1) + 16))();
    if (v11)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __71__TRIPruningFactorLevelCache__populateCacheForRequiredKey_guardedData___block_invoke;
      v21[3] = &unk_1E596AE78;
      id v22 = v6;
      id v23 = v7;
      [v11 enumerateObjectsUsingBlock:v21];

      uint64_t v12 = v22;
    }
    else
    {
      v13 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        SEL v14 = (objc_class *)objc_opt_class();
        uint64_t v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138412290;
        v25 = v15;
        _os_log_impl(&dword_19D909000, v13, OS_LOG_TYPE_INFO, "%@: dropping loadFactorLevels because it failed", buf, 0xCu);
      }
      uint64_t v12 = (void *)*((void *)v7 + 1);
      *((void *)v7 + 1) = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  v16 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    uint64_t v19 = [v11 count];
    uint64_t v20 = [*((id *)v7 + 3) count];
    *(_DWORD *)buf = 138412802;
    v25 = v18;
    __int16 v26 = 2048;
    uint64_t v27 = v19;
    __int16 v28 = 2048;
    uint64_t v29 = v20;
    _os_log_impl(&dword_19D909000, v16, OS_LOG_TYPE_INFO, "%@: reloaded %tu factor levels (%tu prefetched)", buf, 0x20u);
  }
  if ([*((id *)v7 + 3) count]) {
    [(_PASSimpleCoalescingTimer *)self->_pruningTimer runAfterDelaySeconds:1 coalescingBehavior:self->_pruningDelaySeconds];
  }
}

- (TRIPruningFactorLevelCache)initWithPruningDelaySeconds:(double)a3 loadFactorLevels:(id)a4
{
  id v6 = a4;
  v28.receiver = self;
  v28.super_class = (Class)TRIPruningFactorLevelCache;
  id v7 = [(TRIPruningFactorLevelCache *)&v28 init];
  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = MEMORY[0x19F3AD290](v6);
    v10 = (void *)v8[1];
    v8[1] = v9;

    uint64_t v11 = objc_opt_new();
    uint64_t v12 = (void *)v8[2];
    v8[2] = v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v8];
    lock = v7->_lock;
    v7->_lock = (_PASLock *)v13;

    objc_initWeak(&location, v7);
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __75__TRIPruningFactorLevelCache_initWithPruningDelaySeconds_loadFactorLevels___block_invoke;
    v25 = &unk_1E596ADD8;
    objc_copyWeak(&v26, &location);
    uint64_t v15 = (void *)MEMORY[0x19F3AD290](&v22);
    id v16 = objc_alloc(MEMORY[0x1E4F93B98]);
    uint64_t v17 = dispatch_get_global_queue(9, 0);
    uint64_t v18 = objc_msgSend(v16, "initWithQueue:leewaySeconds:operation:", v17, v15, 1.0, v22, v23, v24, v25);
    pruningTimer = v7->_pruningTimer;
    v7->_pruningTimer = (_PASSimpleCoalescingTimer *)v18;

    double v20 = 0.0;
    if (a3 >= 0.0) {
      double v20 = a3;
    }
    v7->_pruningDelaySeconds = v20;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __62__TRIPruningFactorLevelCache_enumerateFactorLevelsUsingBlock___block_invoke_43(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = (void *)MEMORY[0x19F3AD060]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateFactorLevelsUsingBlock:(id)a3
{
  id v5 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__4;
  id v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__TRIPruningFactorLevelCache_enumerateFactorLevelsUsingBlock___block_invoke;
  v11[3] = &unk_1E596AE28;
  void v11[5] = &v12;
  v11[6] = a2;
  v11[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v11];
  id v7 = (void *)v13[5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__TRIPruningFactorLevelCache_enumerateFactorLevelsUsingBlock___block_invoke_43;
  v9[3] = &unk_1E596AE50;
  id v8 = v5;
  id v10 = v8;
  [v7 enumerateObjectsUsingBlock:v9];

  _Block_object_dispose(&v12, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pruningTimer, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __54__TRIPruningFactorLevelCache_objectForKeyedSubscript___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  id v4 = v3[2];
  if (!v4)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"TRIFactorLevelCaching.m", 115, @"Invalid parameter not satisfying: %@", @"guardedData->requiredLevels" object file lineNumber description];

    id v4 = v3[2];
  }
  uint64_t v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v8 = v3[3];
    if (v8)
    {
      uint64_t v9 = [v8 objectForKeyedSubscript:*(void *)(a1 + 40)];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        uint64_t v12 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          double v20 = (objc_class *)objc_opt_class();
          v21 = NSStringFromClass(v20);
          uint64_t v22 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          id v26 = v21;
          __int16 v27 = 2112;
          uint64_t v28 = v22;
          _os_log_debug_impl(&dword_19D909000, v12, OS_LOG_TYPE_DEBUG, "%@: objectForKeyedSubscript:%@ prefetch hit", buf, 0x16u);
        }
        [v3[3] setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
        [v3[2] setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 40)];
        [*(id *)(*(void *)(a1 + 32) + 16) runAfterDelaySeconds:1 coalescingBehavior:*(double *)(*(void *)(a1 + 32) + 24)];
      }
    }
    else
    {
      uint64_t v13 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = (objc_class *)objc_opt_class();
        uint64_t v15 = NSStringFromClass(v14);
        uint64_t v16 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        id v26 = v15;
        __int16 v27 = 2112;
        uint64_t v28 = v16;
        _os_log_impl(&dword_19D909000, v13, OS_LOG_TYPE_INFO, "%@: objectForKeyedSubscript:%@ requires cache reload", buf, 0x16u);
      }
      [*(id *)(a1 + 32) _populateCacheForRequiredKey:*(void *)(a1 + 40) guardedData:v3];
      if (!v3[3])
      {
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"TRIFactorLevelCaching.m", 149, @"Invalid parameter not satisfying: %@", @"guardedData->prefetchedLevels" object file lineNumber description];
      }
      uint64_t v17 = [v3[2] objectForKeyedSubscript:*(void *)(a1 + 40)];
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
  }
}

void __75__TRIPruningFactorLevelCache_initWithPruningDelaySeconds_loadFactorLevels___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained pruneSynchronously];
}

- (void)pruneSynchronously
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__TRIPruningFactorLevelCache_pruneSynchronously__block_invoke;
  v3[3] = &unk_1E596AEA0;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

void __48__TRIPruningFactorLevelCache_pruneSynchronously__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  v3 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    uint64_t v6 = [v2[3] count];
    uint64_t v7 = [v2[3] count];
    uint64_t v8 = [v2[2] count];
    int v10 = 138412802;
    uint64_t v11 = v5;
    __int16 v12 = 2048;
    uint64_t v13 = v6;
    __int16 v14 = 2048;
    uint64_t v15 = v8 + v7;
    _os_log_impl(&dword_19D909000, v3, OS_LOG_TYPE_INFO, "%@: pruning %tu prefetched factor levels of %tu total", (uint8_t *)&v10, 0x20u);
  }
  id v9 = v2[3];
  v2[3] = 0;
}

- (id)factorLevelCurrentlyCachedForFactorName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__4;
  uint64_t v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__TRIPruningFactorLevelCache_factorLevelCurrentlyCachedForFactorName___block_invoke;
  v9[3] = &unk_1E596AEC8;
  uint64_t v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [(_PASLock *)lock runWithLockAcquired:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __70__TRIPruningFactorLevelCache_factorLevelCurrentlyCachedForFactorName___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9[2] objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v6 = [v9[3] objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

@end
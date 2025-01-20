@interface CLKUIResourceManager
+ (id)sharedInstance;
- (BOOL)ensureMemoryAvailable:(unint64_t)a3;
- (BOOL)memoryIsAvailable:(unint64_t)a3;
- (CLKUIResourceManager)init;
- (id)_fetchOldestAtlas;
- (id)_newAtlasForUuid:(id)a3 nullTexture:(id)a4;
- (id)borrowTextureLoadingQueue;
- (id)delegateForUuid:(id)a3;
- (id)nullAtlas2D;
- (id)nullAtlasCube;
- (id)textureForUuid:(id)a3 delegate:(id)a4 rect:(id)a5 nullTexture:;
- (unint64_t)_computeMemoryAvailable;
- (unint64_t)_memoryLimit;
- (unint64_t)explicitMemoryLimit;
- (void)_purgeAllUnconditionally;
- (void)dealloc;
- (void)notifyAtlas:(id)a3 willChangeToMemoryCost:(unint64_t)a4;
- (void)purge:(id)a3;
- (void)purgeAllUnused;
- (void)returnTextureLoadingQueue:(id)a3;
- (void)setExplicitMemoryLimit:(unint64_t)a3;
- (void)updateTextureStreaming;
@end

@implementation CLKUIResourceManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

uint64_t __38__CLKUIResourceManager_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (CLKUIResourceManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)CLKUIResourceManager;
  v2 = [(CLKUIResourceManager *)&v17 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    atlasesByUuid = v2->_atlasesByUuid;
    v2->_atlasesByUuid = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    providersByKey = v2->_providersByKey;
    v2->_providersByKey = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    recentProvidersForUuid = v2->_recentProvidersForUuid;
    v2->_recentProvidersForUuid = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    textureLoaderQueues = v2->_textureLoaderQueues;
    v2->_textureLoaderQueues = (NSMutableArray *)v9;

    int v11 = CLKRunningInProcess();
    uint64_t v12 = 36700160;
    if (!v11) {
      uint64_t v12 = -1;
    }
    v2->_memoryLimit = v12;
    v2->_explicitMemoryLimit = -1;
    v13 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    lock = v2->_lock;
    v2->_lock = v13;

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v2 selector:sel__purgeAllUnconditionally name:*MEMORY[0x1E4F19628] object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F19628] object:0];

  v4.receiver = self;
  v4.super_class = (Class)CLKUIResourceManager;
  [(CLKUIResourceManager *)&v4 dealloc];
}

- (id)nullAtlas2D
{
  return 0;
}

- (id)nullAtlasCube
{
  return 0;
}

- (id)textureForUuid:(id)a3 delegate:(id)a4 rect:(id)a5 nullTexture:
{
  long long v19 = v5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v10 resourceProviderKey];
  v13 = v12;
  v14 = 0;
  if (v9 && v12)
  {
    v15 = [v12 key];
    [(NSRecursiveLock *)self->_lock lock];
    v16 = [(NSMutableDictionary *)self->_providersByKey objectForKey:v15];
    if (!v16)
    {
      v16 = (void *)[(id)objc_opt_new() initWithDelegate:v10 key:v15];
      [(NSMutableDictionary *)self->_providersByKey setObject:v16 forKeyedSubscript:v15];
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recentProvidersForUuid, "setObject:forKeyedSubscript:", v16, v9, v19);
    [v16 addUuidToHistory:v9];
    id v17 = [(NSMutableDictionary *)self->_atlasesByUuid objectForKeyedSubscript:v9];
    if (!v17)
    {
      id v17 = [(CLKUIResourceManager *)self _newAtlasForUuid:v9 nullTexture:v11];
      [(NSMutableDictionary *)self->_atlasesByUuid setObject:v17 forKeyedSubscript:v9];
    }
    [(NSRecursiveLock *)self->_lock unlock];
    v14 = [[CLKUITexture alloc] initWithAtlas:v17 rect:v20];
  }
  return v14;
}

- (void)purge:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSRecursiveLock *)lock lock];
  id v7 = [(NSMutableDictionary *)self->_atlasesByUuid objectForKeyedSubscript:v5];

  if ([v7 isPurgable])
  {
    v6 = objc_opt_new();
    [v6 addObject:v7];
    [(NSRecursiveLock *)self->_lock unlock];
    [(CLKUIResourceManager *)self _purgeAtlases:v6];
  }
  else
  {
    [(NSRecursiveLock *)self->_lock unlock];
  }
}

- (unint64_t)_memoryLimit
{
  [(NSRecursiveLock *)self->_lock lock];
  unint64_t explicitMemoryLimit = self->_explicitMemoryLimit;
  if (explicitMemoryLimit == -1) {
    unint64_t explicitMemoryLimit = self->_memoryLimit;
  }
  [(NSRecursiveLock *)self->_lock unlock];
  return explicitMemoryLimit;
}

- (unint64_t)_computeMemoryAvailable
{
  [(NSRecursiveLock *)self->_lock lock];
  unint64_t explicitMemoryLimit = self->_explicitMemoryLimit;
  [(NSRecursiveLock *)self->_lock unlock];
  if (explicitMemoryLimit == -1 && !CLKRunningInProcess()) {
    return -1;
  }
  unint64_t v4 = MEMORY[0x1BA98CB70]();
  if (v4 >= 0x500000) {
    return v4 - 5242880;
  }
  else {
    return 0;
  }
}

- (id)_fetchOldestAtlas
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->_lock lock];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = self->_atlasesByUuid;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v17;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        id v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_atlasesByUuid, "objectForKeyedSubscript:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        if ([v10 isPurgable])
        {
          if (v6)
          {
            [v10 boundTime];
            if (v11 < v8)
            {
              double v12 = v11;
              id v13 = v10;

              double v8 = v12;
              id v6 = v13;
            }
          }
          else
          {
            id v6 = v10;
            [v6 boundTime];
            double v8 = v14;
          }
        }
      }
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  [(NSRecursiveLock *)self->_lock unlock];
  return v6;
}

- (id)borrowTextureLoadingQueue
{
  [(NSRecursiveLock *)self->_lock lock];
  if ([(NSMutableArray *)self->_textureLoaderQueues count])
  {
    uint64_t v3 = [(NSMutableArray *)self->_textureLoaderQueues lastObject];
    [(NSMutableArray *)self->_textureLoaderQueues removeLastObject];
  }
  else
  {
    uint64_t v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    uint64_t v3 = dispatch_queue_create("CLKUIMetalTexture queue", v4);
  }
  [(NSRecursiveLock *)self->_lock unlock];
  return v3;
}

- (void)returnTextureLoadingQueue:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSRecursiveLock *)lock lock];
  [(NSMutableArray *)self->_textureLoaderQueues addObject:v5];

  id v6 = self->_lock;
  [(NSRecursiveLock *)v6 unlock];
}

- (BOOL)memoryIsAvailable:(unint64_t)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  unint64_t v5 = [(CLKUIResourceManager *)self _computeMemoryAvailable];
  BOOL v7 = self->_memoryUsed + a3 <= [(CLKUIResourceManager *)self _memoryLimit] && v5 >= a3;
  [(NSRecursiveLock *)self->_lock unlock];
  return v7;
}

- (BOOL)ensureMemoryAvailable:(unint64_t)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->_lock lock];
  unint64_t v5 = [(CLKUIResourceManager *)self _computeMemoryAvailable];
  unint64_t v6 = [(CLKUIResourceManager *)self _memoryLimit];
  if (self->_memoryUsed + a3 <= v6 && v5 >= a3)
  {
LABEL_12:
    [(NSRecursiveLock *)self->_lock unlock];
    return 1;
  }
  unint64_t v8 = v6;
  id v9 = CLKLoggingObjectForDomain();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t memoryUsed = self->_memoryUsed;
    *(_DWORD *)buf = 134218752;
    unint64_t v31 = a3;
    __int16 v32 = 2048;
    unint64_t v33 = v5;
    __int16 v34 = 2048;
    unint64_t v35 = memoryUsed;
    __int16 v36 = 2048;
    unint64_t v37 = v8;
    _os_log_impl(&dword_1B41E7000, v9, OS_LOG_TYPE_DEFAULT, "evications begin (needs %lu bytes, %lu available bytes, %lu memory used, %lu limit)", buf, 0x2Au);
  }

  [(CLKUIResourceManager *)self purgeAllUnused];
  unint64_t v11 = [(CLKUIResourceManager *)self _computeMemoryAvailable];
  unint64_t v12 = v11;
  if (self->_memoryUsed + a3 <= v8 && v11 >= a3)
  {
    id v13 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v14 = self->_memoryUsed;
      *(_DWORD *)buf = 134218240;
      unint64_t v31 = v12;
      __int16 v32 = 2048;
      unint64_t v33 = v14;
      _os_log_impl(&dword_1B41E7000, v13, OS_LOG_TYPE_DEFAULT, "evications end: success (%lu available bytes, %lu memory used)", buf, 0x16u);
    }

    goto LABEL_12;
  }
  long long v16 = objc_opt_new();
  uint64_t v17 = [(CLKUIResourceManager *)self _fetchOldestAtlas];
  if (v17)
  {
    long long v19 = (void *)v17;
    *(void *)&long long v18 = 138412290;
    long long v29 = v18;
    while (1)
    {
      double v20 = CLKLoggingObjectForDomain();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [v19 uuid];
        *(_DWORD *)buf = v29;
        unint64_t v31 = (unint64_t)v21;
        _os_log_impl(&dword_1B41E7000, v20, OS_LOG_TYPE_DEFAULT, "evict uuid %@", buf, 0xCu);
      }
      [v16 addObject:v19];
      [(CLKUIResourceManager *)self _purgeAtlases:v16];
      [v16 removeAllObjects];
      unint64_t v22 = [(CLKUIResourceManager *)self _computeMemoryAvailable];
      unint64_t v12 = v22;
      if (self->_memoryUsed + a3 <= v8 && v22 >= a3) {
        break;
      }
      uint64_t v23 = [(CLKUIResourceManager *)self _fetchOldestAtlas];

      long long v19 = (void *)v23;
      if (!v23) {
        goto LABEL_20;
      }
    }
    v26 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v27 = self->_memoryUsed;
      *(_DWORD *)buf = 134218240;
      unint64_t v31 = v12;
      __int16 v32 = 2048;
      unint64_t v33 = v27;
      _os_log_impl(&dword_1B41E7000, v26, OS_LOG_TYPE_DEFAULT, "evications end: success (%lu available bytes, %lu memory used)", buf, 0x16u);
    }

    [(NSRecursiveLock *)self->_lock unlock];
    BOOL v15 = 1;
  }
  else
  {
LABEL_20:
    v24 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v25 = self->_memoryUsed;
      *(_DWORD *)buf = 134218240;
      unint64_t v31 = v12;
      __int16 v32 = 2048;
      unint64_t v33 = v25;
      _os_log_impl(&dword_1B41E7000, v24, OS_LOG_TYPE_DEFAULT, "evications end: failed (%lu available bytes, %lu memory used)", buf, 0x16u);
    }

    [(NSRecursiveLock *)self->_lock unlock];
    BOOL v15 = 0;
  }

  return v15;
}

- (void)purgeAllUnused
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->_lock lock];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v3 = self->_providersByKey;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        id v10 = [(NSMutableDictionary *)self->_providersByKey objectForKeyedSubscript:v9];
        unint64_t v11 = [v10 delegate];
        if (!v11)
        {
          if (!v6) {
            unint64_t v6 = objc_opt_new();
          }
          [v6 addObject:v9];
        }
      }
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  unint64_t v12 = self->_atlasesByUuid;
  uint64_t v13 = [(NSMutableDictionary *)v12 countByEnumeratingWithState:&v34 objects:v45 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    BOOL v15 = 0;
    long long v16 = 0;
    uint64_t v17 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = *(void *)(*((void *)&v34 + 1) + 8 * j);
        double v20 = [(NSMutableDictionary *)self->_atlasesByUuid objectForKeyedSubscript:v19];
        if (![v20 instanceCount])
        {
          if ([v20 isPurgable])
          {
            if (!v16) {
              long long v16 = objc_opt_new();
            }
            [v16 addObject:v20];
          }
          if (!v15) {
            BOOL v15 = objc_opt_new();
          }
          [v15 addObject:v19];
        }
      }
      uint64_t v14 = [(NSMutableDictionary *)v12 countByEnumeratingWithState:&v34 objects:v45 count:16];
    }
    while (v14);

    if (v16) {
      [(CLKUIResourceManager *)self _purgeAtlases:v16];
    }
    if (v6) {
      goto LABEL_32;
    }
  }
  else
  {

    long long v16 = 0;
    BOOL v15 = 0;
    if (v6) {
LABEL_32:
    }
      [(NSMutableDictionary *)self->_providersByKey removeObjectsForKeys:v6];
  }
  if (v15)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v21 = v15;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v44 count:16];
    if (v22)
    {
      uint64_t v24 = v22;
      uint64_t v25 = *(void *)v31;
      *(void *)&long long v23 = 138412290;
      long long v29 = v23;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v21);
          }
          uint64_t v27 = *(void *)(*((void *)&v30 + 1) + 8 * k);
          v28 = CLKLoggingObjectForDomain();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v29;
            uint64_t v43 = v27;
            _os_log_impl(&dword_1B41E7000, v28, OS_LOG_TYPE_DEFAULT, "discard uuid %@", buf, 0xCu);
          }

          [(NSMutableDictionary *)self->_atlasesByUuid removeObjectForKey:v27];
          [(NSMutableDictionary *)self->_recentProvidersForUuid removeObjectForKey:v27];
        }
        uint64_t v24 = [v21 countByEnumeratingWithState:&v30 objects:v44 count:16];
      }
      while (v24);
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)updateTextureStreaming
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->_lock lock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_atlasesByUuid objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 isPurgable]) {
          [(CLKUIResourceManager *)self _updateTextureStreamingForAtlas:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)notifyAtlas:(id)a3 willChangeToMemoryCost:(unint64_t)a4
{
  locuint64_t k = self->_lock;
  id v7 = a3;
  [(NSRecursiveLock *)lock lock];
  self->_memoryUsed += a4;
  uint64_t v8 = [v7 memoryCost];

  self->_memoryUsed -= v8;
  long long v9 = self->_lock;
  [(NSRecursiveLock *)v9 unlock];
}

- (id)delegateForUuid:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v5 = [(NSMutableDictionary *)self->_recentProvidersForUuid objectForKeyedSubscript:v4];
  if (!v5 || ([v5 delegate], (uint64_t v6 = [(NSRecursiveLock *)self->_lock unlock];
  {
    long long v16 = v5;
    [(NSRecursiveLock *)self->_lock lock];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = self->_providersByKey;
    uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = [(NSMutableDictionary *)self->_providersByKey objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          uint64_t v6 = [v12 delegate];
          if (v6)
          {
            uint64_t v13 = [v12 uuidHistory];
            char v14 = [v13 containsObject:v4];

            if (v14)
            {
              [(NSMutableDictionary *)self->_recentProvidersForUuid setObject:v12 forKeyedSubscript:v4];
              [(NSRecursiveLock *)self->_lock unlock];

              goto LABEL_14;
            }
          }
        }
        uint64_t v9 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    [(NSRecursiveLock *)self->_lock unlock];
    uint64_t v6 = 0;
LABEL_14:
    uint64_t v5 = v16;
  }

  return v6;
}

- (void)_purgeAllUnconditionally
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  [(NSRecursiveLock *)self->_lock lock];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_atlasesByUuid;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_atlasesByUuid, "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * v8), (void)v10);
        if ([v9 isPurgable]) {
          [v3 addObject:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(CLKUIResourceManager *)self _purgeAtlases:v3];
  [(NSRecursiveLock *)self->_lock unlock];
}

- (id)_newAtlasForUuid:(id)a3 nullTexture:(id)a4
{
  return 0;
}

- (unint64_t)explicitMemoryLimit
{
  return self->_explicitMemoryLimit;
}

- (void)setExplicitMemoryLimit:(unint64_t)a3
{
  self->_unint64_t explicitMemoryLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_textureLoaderQueues, 0);
  objc_storeStrong((id *)&self->_providersByKey, 0);
  objc_storeStrong((id *)&self->_atlasesByUuid, 0);
  objc_storeStrong((id *)&self->_recentProvidersForUuid, 0);
}

@end
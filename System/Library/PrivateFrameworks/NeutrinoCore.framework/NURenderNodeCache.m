@interface NURenderNodeCache
+ (NURenderNodeCache)sharedInstance;
- (NURenderNodeCache)init;
- (id)cachedNodeForNode:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)retrieveAndCacheNode:(id)a3;
- (unint64_t)unhitCacheEntriesCount;
- (void)_addNode:(id)a3;
- (void)_mediaServicesWereReset:(id)a3;
- (void)addNode:(id)a3;
- (void)dealloc;
@end

@implementation NURenderNodeCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_mediaServicesWereReset:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [a3 userInfo];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F157A0]];

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_58);
  }
  v5 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    v8 = v4;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "NURenderNodeCache: received AVAssetMediaServicesWereResetNotification. AVObjects are invalid! Error: %{public}@", (uint8_t *)&v7, 0xCu);
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_58);
    }
  }
  v6 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_FAULT))
  {
    int v7 = 138543362;
    v8 = v4;
    _os_log_fault_impl(&dword_1A9892000, v6, OS_LOG_TYPE_FAULT, "AV media services reset: %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (id)debugDescription
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__24240;
  v10 = __Block_byref_object_dispose__24241;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__NURenderNodeCache_debugDescription__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __37__NURenderNodeCache_debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: 0x%p Count: %lu", objc_opt_class(), *(void *)(a1 + 32), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "count")];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendString:@"\n| Node Created   |     Node Hash       |                    Node                  | Hits"];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "count"));
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 16) objectEnumerator];
  uint64_t v7 = [v6 nextObject];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    do
    {
      [v5 addObject:v8];
      uint64_t v9 = [v6 nextObject];

      uint64_t v8 = (void *)v9;
    }
    while (v9);
  }
  v28 = v6;
  v29 = v5;
  [v5 sortedArrayUsingComparator:&__block_literal_global_24246];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v32;
    do
    {
      uint64_t v14 = 0;
      v15 = v12;
      do
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v31 + 1) + 8 * v14);
        v17 = [v16 nodeCreationJobName];
        v18 = [v15 nodeCreationJobName];
        char v19 = [v17 isEqual:v18];

        if ((v19 & 1) == 0)
        {
          v20 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          v21 = [v16 nodeCreationJobName];
          [v20 appendFormat:@"\n\n==== %@ ==============", v21];
        }
        if ([v16 cacheHitsCount])
        {
          objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v16, "cacheHitsCount"));
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = &stru_1F0017700;
        }
        id v23 = [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), v16];
        uint64_t v24 = [v23 cStringUsingEncoding:1];

        v25 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        [v16 nodeCreationTime];
        v27 = NUAbsoluteTimeToString(v26);
        [v25 appendFormat:@"\n(%@) %20lu : %42s Hits:%@", v27, objc_msgSend(v16, "hash"), v24, v22];

        id v12 = v16;
        ++v14;
        v15 = v12;
      }
      while (v11 != v14);
      uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v11);
  }
  else
  {
    id v12 = 0;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendString:@"\n>"];
}

uint64_t __37__NURenderNodeCache_debugDescription__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 nodeCreationJobName];
  uint64_t v7 = [v5 nodeCreationJobName];
  if ([v6 isEqual:v7])
  {
    [v4 nodeCreationTime];
    double v9 = v8;
    [v5 nodeCreationTime];
    double v11 = v10;
    id v12 = [NSNumber numberWithDouble:v9];
    uint64_t v13 = [NSNumber numberWithDouble:v11];
    uint64_t v14 = [v12 compare:v13];
  }
  else
  {
    uint64_t v14 = [v6 compare:v7];
  }

  return v14;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: 0x%p Count: %lu>", objc_opt_class(), self, -[NSHashTable count](self->_cache, "count")];
}

- (unint64_t)unhitCacheEntriesCount
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__NURenderNodeCache_unhitCacheEntriesCount__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __43__NURenderNodeCache_unhitCacheEntriesCount__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectEnumerator];
  uint64_t v2 = [v5 nextObject];
  if (v2)
  {
    unint64_t v3 = (void *)v2;
    do
    {
      if (![v3 cacheHitsCount]) {
        ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      }
      uint64_t v4 = [v5 nextObject];

      unint64_t v3 = (void *)v4;
    }
    while (v4);
  }
}

- (id)retrieveAndCacheNode:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__24240;
  v16 = __Block_byref_object_dispose__24241;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__NURenderNodeCache_retrieveAndCacheNode___block_invoke;
  block[3] = &unk_1E5D959D8;
  id v10 = v4;
  double v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __42__NURenderNodeCache_retrieveAndCacheNode___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) member:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  if (v6)
  {
    uint64_t v7 = [*(id *)(v5 + 40) cacheHitsCount] + 1;
    [v6 setCacheHitsCount:v7];
  }
  else
  {
    [*(id *)(a1 + 32) _addNode:*(void *)(a1 + 40)];
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    objc_storeStrong(v9, v8);
  }
}

- (id)cachedNodeForNode:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__24240;
  v16 = __Block_byref_object_dispose__24241;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__NURenderNodeCache_cachedNodeForNode___block_invoke;
  block[3] = &unk_1E5D959D8;
  id v10 = v4;
  double v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __39__NURenderNodeCache_cachedNodeForNode___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) member:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(*(void *)(a1[6] + 8) + 40);
  uint64_t v6 = [v5 cacheHitsCount] + 1;

  return [v5 setCacheHitsCount:v6];
}

- (void)addNode:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__NURenderNodeCache_addNode___block_invoke;
  v7[3] = &unk_1E5D95E18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __29__NURenderNodeCache_addNode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addNode:*(void *)(a1 + 40)];
}

- (void)_addNode:(id)a3
{
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F157A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)NURenderNodeCache;
  [(NURenderNodeCache *)&v4 dealloc];
}

- (NURenderNodeCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)NURenderNodeCache;
  uint64_t v2 = [(NURenderNodeCache *)&v10 init];
  uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  cache = v2->_cache;
  v2->_cache = (NSHashTable *)v3;

  uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create("NURenderNodeCache", v5);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v6;

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:v2 selector:sel__mediaServicesWereReset_ name:*MEMORY[0x1E4F157A8] object:0];

  return v2;
}

+ (NURenderNodeCache)sharedInstance
{
  uint64_t v2 = +[NUFactory sharedFactory];
  uint64_t v3 = [v2 renderNodeCache];

  return (NURenderNodeCache *)v3;
}

@end
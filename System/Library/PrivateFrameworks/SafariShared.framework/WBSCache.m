@interface WBSCache
- (WBSCache)init;
- (id)objectForKey:(id)a3;
- (void)_recacheObjectForKey:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation WBSCache

- (WBSCache)init
{
  v13.receiver = self;
  v13.super_class = (Class)WBSCache;
  v2 = [(WBSCache *)&v13 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    cache = v2->_cache;
    v2->_cache = v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    weakObjectsTable = v2->_weakObjectsTable;
    v2->_weakObjectsTable = (NSMapTable *)v5;

    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.SafariShared.WBSCache.%p", v2);
    id v7 = objc_claimAutoreleasedReturnValue();
    v8 = (const char *)[v7 UTF8String];
    dispatch_queue_t v9 = dispatch_queue_create(v8, MEMORY[0x1E4F14430]);
    cacheQueue = v2->_cacheQueue;
    v2->_cacheQueue = (OS_dispatch_queue *)v9;

    v11 = v2;
  }

  return v2;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  cacheQueue = self->_cacheQueue;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __25__WBSCache_objectForKey___block_invoke;
  v12 = &unk_1E5C8CD98;
  v15 = &v21;
  objc_super v13 = self;
  id v6 = v4;
  id v14 = v6;
  v16 = &v17;
  dispatch_sync(cacheQueue, &v9);
  if (*((unsigned char *)v18 + 24)) {
    -[WBSCache _recacheObjectForKey:](self, "_recacheObjectForKey:", v6, v9, v10, v11, v12, v13);
  }
  id v7 = (id)v22[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v7;
}

void __25__WBSCache_objectForKey___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
    uint64_t v6 = *(void *)(a1[6] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
  }
}

- (void)_recacheObjectForKey:(id)a3
{
  id v4 = a3;
  cacheQueue = self->_cacheQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__WBSCache__recacheObjectForKey___block_invoke;
  v7[3] = &unk_1E5C8C920;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(cacheQueue, v7);
}

void __33__WBSCache__recacheObjectForKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = v2;
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v2 forKey:*(void *)(a1 + 40)];
    uint64_t v2 = v3;
  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__WBSCache_setObject_forKey___block_invoke;
  block[3] = &unk_1E5C8CD20;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(cacheQueue, block);
}

uint64_t __29__WBSCache_setObject_forKey___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 8) setObject:a1[5] forKey:a1[6]];
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void **)(a1[4] + 16);
  uint64_t v4 = a1[6];
  return [v3 setObject:v2 forKey:v4];
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  cacheQueue = self->_cacheQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__WBSCache_removeObjectForKey___block_invoke;
  v7[3] = &unk_1E5C8C920;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(cacheQueue, v7);
}

uint64_t __31__WBSCache_removeObjectForKey___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v3 removeObjectForKey:v2];
}

- (void)removeAllObjects
{
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__WBSCache_removeAllObjects__block_invoke;
  block[3] = &unk_1E5C8C880;
  block[4] = self;
  dispatch_barrier_async(cacheQueue, block);
}

uint64_t __28__WBSCache_removeAllObjects__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v2 removeAllObjects];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheQueue, 0);
  objc_storeStrong((id *)&self->_weakObjectsTable, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
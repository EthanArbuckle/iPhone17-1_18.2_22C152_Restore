@interface WLKCache
- (WLKCache)init;
- (id)objectForKey:(id)a3;
- (unint64_t)countLimit;
- (void)_onQueueRemoveObjectForKey:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setCountLimit:(unint64_t)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation WLKCache

- (WLKCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)WLKCache;
  v2 = [(WLKCache *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.WatchListKit.WLKCache", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v2->_countLimit = 0;
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    stack = v2->_stack;
    v2->_stack = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    dictionary = v2->_dictionary;
    v2->_dictionary = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (void)setCountLimit:(unint64_t)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __26__WLKCache_setCountLimit___block_invoke;
  v4[3] = &unk_1E620AAF0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(accessQueue, v4);
}

void __26__WLKCache_setCountLimit___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) count];
  unint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = v2 - v3;
  if (v2 > v3)
  {
    uint64_t v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "subarrayWithRange:", 0, v4);
    [*(id *)(*(void *)(a1 + 32) + 24) removeObjectsForKeys:v5];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "removeObjectsInRange:", 0, v4);

    unint64_t v3 = *(void *)(a1 + 40);
  }
  *(void *)(*(void *)(a1 + 32) + 32) = v3;
}

- (unint64_t)countLimit
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22__WLKCache_countLimit__block_invoke;
  v5[3] = &unk_1E620AB18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __22__WLKCache_countLimit__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__WLKCache_objectForKey___block_invoke;
  block[3] = &unk_1E620AB40;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __25__WLKCache_objectForKey___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 24) objectForKey:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    -[WLKCache setObject:forKey:]();
  }
  uint64_t v8 = v7;
  if (!v7) {
    -[WLKCache setObject:forKey:]();
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__WLKCache_setObject_forKey___block_invoke;
  block[3] = &unk_1E620AB68;
  block[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v8;
  dispatch_sync(accessQueue, block);
}

void __29__WLKCache_setObject_forKey___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  char v2 = [v6 isEqual:*(void *)(a1 + 48)];
  if (!v6)
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) count];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v3 != *(void *)(v4 + 32))
    {
LABEL_8:
      [*(id *)(v4 + 16) addObject:*(void *)(a1 + 40)];
      goto LABEL_9;
    }
    uint64_t v5 = [*(id *)(v4 + 16) objectAtIndex:0];
    [*(id *)(a1 + 32) _onQueueRemoveObjectForKey:v5];

LABEL_7:
    uint64_t v4 = *(void *)(a1 + 32);
    goto LABEL_8;
  }
  if (v2) {
    goto LABEL_10;
  }
  if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 16) count] >= 2)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
    goto LABEL_7;
  }
LABEL_9:
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];
LABEL_10:
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__WLKCache_removeObjectForKey___block_invoke;
  v7[3] = &unk_1E6209F68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

uint64_t __31__WLKCache_removeObjectForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueueRemoveObjectForKey:*(void *)(a1 + 40)];
}

- (void)removeAllObjects
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__WLKCache_removeAllObjects__block_invoke;
  block[3] = &unk_1E620A708;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

uint64_t __28__WLKCache_removeAllObjects__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  char v2 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v2 removeAllObjects];
}

- (void)_onQueueRemoveObjectForKey:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  id v4 = [(NSMutableDictionary *)self->_dictionary objectForKey:v5];
  if (v4)
  {
    [(NSMutableArray *)self->_stack removeObject:v5];
    [(NSMutableDictionary *)self->_dictionary removeObjectForKey:v5];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_stack, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)setObject:forKey:.cold.1()
{
  __assert_rtn("-[WLKCache setObject:forKey:]", "WLKCache.m", 70, "obj != nil");
}

- (void)setObject:forKey:.cold.2()
{
  __assert_rtn("-[WLKCache setObject:forKey:]", "WLKCache.m", 71, "key != nil");
}

@end
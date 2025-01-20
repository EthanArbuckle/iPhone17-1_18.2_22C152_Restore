@interface PXThreadSafeDictionary
- (NSMutableDictionary)internalDictionary;
- (OS_dispatch_queue)queue;
- (PXThreadSafeDictionary)init;
- (id)objectForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (id)safeCopy;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)removeObjectsForKeys:(id)a3;
- (void)setInternalDictionary:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setQueue:(id)a3;
@end

@implementation PXThreadSafeDictionary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_internalDictionary, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setInternalDictionary:(id)a3
{
}

- (NSMutableDictionary)internalDictionary
{
  return self->_internalDictionary;
}

- (id)safeCopy
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__246500;
  v11 = __Block_byref_object_dispose__246501;
  id v12 = 0;
  v3 = [(PXThreadSafeDictionary *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__PXThreadSafeDictionary_safeCopy__block_invoke;
  v6[3] = &unk_1E5DD0588;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __34__PXThreadSafeDictionary_safeCopy__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removeAllObjects
{
  uint64_t v3 = [(PXThreadSafeDictionary *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PXThreadSafeDictionary_removeAllObjects__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_barrier_async(v3, block);
}

uint64_t __42__PXThreadSafeDictionary_removeAllObjects__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(PXThreadSafeDictionary *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__PXThreadSafeDictionary_enumerateKeysAndObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E5DD3280;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __60__PXThreadSafeDictionary_enumerateKeysAndObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) enumerateKeysAndObjectsUsingBlock:*(void *)(a1 + 40)];
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__246500;
  v16 = __Block_byref_object_dispose__246501;
  id v17 = 0;
  v5 = [(PXThreadSafeDictionary *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PXThreadSafeDictionary_objectForKey___block_invoke;
  block[3] = &unk_1E5DCCA20;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __39__PXThreadSafeDictionary_objectForKey___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXThreadSafeDictionary *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PXThreadSafeDictionary_setObject_forKey___block_invoke;
  block[3] = &unk_1E5DD0F30;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(v8, block);
}

uint64_t __43__PXThreadSafeDictionary_setObject_forKey___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 8) setObject:a1[5] forKey:a1[6]];
}

- (void)removeObjectsForKeys:(id)a3
{
  id v4 = a3;
  v5 = [(PXThreadSafeDictionary *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__PXThreadSafeDictionary_removeObjectsForKeys___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

uint64_t __47__PXThreadSafeDictionary_removeObjectsForKeys___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectsForKeys:*(void *)(a1 + 40)];
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(PXThreadSafeDictionary *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__PXThreadSafeDictionary_removeObjectForKey___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

uint64_t __45__PXThreadSafeDictionary_removeObjectForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__246500;
  v16 = __Block_byref_object_dispose__246501;
  id v17 = 0;
  v5 = [(PXThreadSafeDictionary *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PXThreadSafeDictionary_objectForKeyedSubscript___block_invoke;
  block[3] = &unk_1E5DCCA20;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __50__PXThreadSafeDictionary_objectForKeyedSubscript___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXThreadSafeDictionary *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PXThreadSafeDictionary_setObject_forKeyedSubscript___block_invoke;
  block[3] = &unk_1E5DD0F30;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(v8, block);
}

uint64_t __54__PXThreadSafeDictionary_setObject_forKeyedSubscript___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 8) setObject:a1[5] forKey:a1[6]];
}

- (PXThreadSafeDictionary)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXThreadSafeDictionary;
  uint64_t v2 = [(PXThreadSafeDictionary *)&v8 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    internalDictionary = v2->_internalDictionary;
    v2->_internalDictionary = v3;

    dispatch_queue_t v5 = dispatch_queue_create("PXThreadSafeDictionary", MEMORY[0x1E4F14430]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

@end
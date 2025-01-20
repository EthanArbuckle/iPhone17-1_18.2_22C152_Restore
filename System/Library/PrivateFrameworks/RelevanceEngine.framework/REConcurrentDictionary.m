@interface REConcurrentDictionary
- (id)copyWithZone:(_NSZone *)a3;
- (id)initStrongToStrongDictionary;
- (id)initWeakToStrongDictionary;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation REConcurrentDictionary

- (id)initWeakToStrongDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)REConcurrentDictionary;
  v2 = [(REConcurrentDictionary *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:16];
    table = v2->_table;
    v2->_table = (NSMapTable *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.RelevanceEngine.REConcurrentDictionary", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_table, 0);
}

- (id)initStrongToStrongDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)REConcurrentDictionary;
  v2 = [(REConcurrentDictionary *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:512 valueOptions:0 capacity:16];
    table = v2->_table;
    v2->_table = (NSMapTable *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.RelevanceEngine.REConcurrentDictionary", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__REConcurrentDictionary_count__block_invoke;
  v5[3] = &unk_2644BD938;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__REConcurrentDictionary_count__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__17;
  v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__REConcurrentDictionary_objectForKey___block_invoke;
  block[3] = &unk_2644BEE08;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __39__REConcurrentDictionary_objectForKey___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__REConcurrentDictionary_removeObjectForKey___block_invoke;
  v7[3] = &unk_2644BC688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __45__REConcurrentDictionary_removeObjectForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__REConcurrentDictionary_setObject_forKey___block_invoke;
  block[3] = &unk_2644BDBF0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __43__REConcurrentDictionary_setObject_forKey___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void **)(a1[5] + 8);
  if (v2) {
    return [v3 setObject:v2 forKey:a1[6]];
  }
  else {
    return [v3 removeObjectForKey:a1[6]];
  }
}

- (void)removeAllObjects
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__REConcurrentDictionary_removeAllObjects__block_invoke;
  block[3] = &unk_2644BC660;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __42__REConcurrentDictionary_removeAllObjects__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initStrongToStrongDictionary");
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__REConcurrentDictionary_copyWithZone___block_invoke;
  v9[3] = &unk_2644BC688;
  id v6 = v4;
  id v10 = v6;
  v11 = self;
  dispatch_sync(queue, v9);
  id v7 = v6;

  return v7;
}

uint64_t __39__REConcurrentDictionary_copyWithZone___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 8) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 8);
  *(void *)(v3 + 8) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

@end
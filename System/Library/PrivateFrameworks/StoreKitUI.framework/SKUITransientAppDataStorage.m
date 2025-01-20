@interface SKUITransientAppDataStorage
- (NSMutableDictionary)storage;
- (OS_dispatch_queue)accessQueue;
- (SKUITransientAppDataStorage)init;
- (id)getDataForKey:(id)a3;
- (id)keyAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)setData:(id)a3 forKey:(id)a4;
- (void)clear;
- (void)init;
- (void)removeDataForKey:(id)a3;
- (void)setAccessQueue:(id)a3;
- (void)setStorage:(id)a3;
@end

@implementation SKUITransientAppDataStorage

- (SKUITransientAppDataStorage)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUITransientAppDataStorage init]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUITransientAppDataStorage;
  v3 = [(SKUITransientAppDataStorage *)&v7 init];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("SKUITransientAppDataStorage.accessQueue", MEMORY[0x1E4F14430]);
    [(SKUITransientAppDataStorage *)v3 setAccessQueue:v4];

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(SKUITransientAppDataStorage *)v3 setStorage:v5];
  }
  return v3;
}

- (unint64_t)count
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(SKUITransientAppDataStorage *)self accessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__SKUITransientAppDataStorage_count__block_invoke;
  v6[3] = &unk_1E6422538;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __36__SKUITransientAppDataStorage_count__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) storage];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (id)keyAtIndex:(unint64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  id v5 = [(SKUITransientAppDataStorage *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SKUITransientAppDataStorage_keyAtIndex___block_invoke;
  block[3] = &unk_1E6422560;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __42__SKUITransientAppDataStorage_keyAtIndex___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) storage];
  id v2 = [v6 allKeys];
  uint64_t v3 = [v2 objectAtIndexedSubscript:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)getDataForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  id v5 = [(SKUITransientAppDataStorage *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SKUITransientAppDataStorage_getDataForKey___block_invoke;
  block[3] = &unk_1E6422588;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __45__SKUITransientAppDataStorage_getDataForKey___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) storage];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)setData:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SKUITransientAppDataStorage *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SKUITransientAppDataStorage_setData_forKey___block_invoke;
  block[3] = &unk_1E64225B0;
  id v13 = v6;
  uint64_t v14 = self;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_sync(v8, block);

  return 0;
}

void __46__SKUITransientAppDataStorage_setData_forKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) storage];
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = v3;
  if (v2) {
    [v3 setObject:v2 forKeyedSubscript:v4];
  }
  else {
    [v3 removeObjectForKey:v4];
  }
}

- (void)removeDataForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUITransientAppDataStorage *)self accessQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SKUITransientAppDataStorage_removeDataForKey___block_invoke;
  v7[3] = &unk_1E6421FF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

void __48__SKUITransientAppDataStorage_removeDataForKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) storage];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)clear
{
  uint64_t v3 = [(SKUITransientAppDataStorage *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SKUITransientAppDataStorage_clear__block_invoke;
  block[3] = &unk_1E6422020;
  void block[4] = self;
  dispatch_barrier_sync(v3, block);
}

void __36__SKUITransientAppDataStorage_clear__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) storage];
  [v1 removeAllObjects];
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  id v1 = "-[SKUITransientAppDataStorage init]";
}

@end
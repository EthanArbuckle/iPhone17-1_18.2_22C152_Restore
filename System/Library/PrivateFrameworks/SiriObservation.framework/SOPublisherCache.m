@interface SOPublisherCache
+ (SOPublisherCache)sharedInstance;
- (SOPublisherCache)init;
- (id)publisherForSnapshotType:(Class)a3;
- (void)removePublisherForSnapshotType:(Class)a3;
- (void)setPublisher:(id)a3 forSnapshotType:(Class)a4;
@end

@implementation SOPublisherCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)removePublisherForSnapshotType:(Class)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__SOPublisherCache_removePublisherForSnapshotType___block_invoke;
  v4[3] = &unk_264487290;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __51__SOPublisherCache_removePublisherForSnapshotType___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)setPublisher:(id)a3 forSnapshotType:(Class)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SOPublisherCache_setPublisher_forSnapshotType___block_invoke;
  block[3] = &unk_264487268;
  block[4] = self;
  id v10 = v6;
  Class v11 = a4;
  id v8 = v6;
  dispatch_sync(queue, block);
}

uint64_t __49__SOPublisherCache_setPublisher_forSnapshotType___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 8) setObject:a1[5] forKey:a1[6]];
}

- (id)publisherForSnapshotType:(Class)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  Class v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SOPublisherCache_publisherForSnapshotType___block_invoke;
  block[3] = &unk_264487240;
  block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __45__SOPublisherCache_publisherForSnapshotType___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [*(id *)(a1[4] + 8) objectForKey:a1[6]];
  return MEMORY[0x270F9A758]();
}

- (SOPublisherCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)SOPublisherCache;
  v2 = [(SOPublisherCache *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cache = v2->_cache;
    v2->_cache = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("SOPublisherCache", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    id v8 = objc_opt_new();
    [(SOPublisherCache *)v2 setPublisher:v8 forSnapshotType:objc_opt_class()];
  }
  return v2;
}

+ (SOPublisherCache)sharedInstance
{
  if (sharedInstance_token != -1) {
    dispatch_once(&sharedInstance_token, &__block_literal_global_1132);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return (SOPublisherCache *)v2;
}

uint64_t __34__SOPublisherCache_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(SOPublisherCache);
  return MEMORY[0x270F9A758]();
}

@end
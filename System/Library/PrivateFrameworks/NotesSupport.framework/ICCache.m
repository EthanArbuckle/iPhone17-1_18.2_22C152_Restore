@interface ICCache
+ (id)cacheCollection;
+ (void)purgeAllCaches;
- (ICCache)init;
- (NSMutableSet)mutableKeys;
- (NSSet)allKeys;
- (OS_dispatch_queue)mutableKeysAccessQueue;
- (OS_dispatch_source)memoryWarningEventSource;
- (void)dealloc;
- (void)registerForMemoryWarnings;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)removeObjectsWithKeyContainingString:(id)a3;
- (void)setMemoryWarningEventSource:(id)a3;
- (void)setMutableKeys:(id)a3;
- (void)setMutableKeysAccessQueue:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4 cost:(unint64_t)a5;
- (void)unregisterForMemoryWarnings;
@end

@implementation ICCache

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICCache;
  [(ICCache *)&v11 setObject:a3 forKey:v6];
  v7 = [(ICCache *)self mutableKeysAccessQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __28__ICCache_setObject_forKey___block_invoke;
  v9[3] = &unk_2640CD448;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, v9);
}

- (OS_dispatch_queue)mutableKeysAccessQueue
{
  return self->_mutableKeysAccessQueue;
}

- (void)setObject:(id)a3 forKey:(id)a4 cost:(unint64_t)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICCache;
  [(ICCache *)&v13 setObject:a3 forKey:v8 cost:a5];
  v9 = [(ICCache *)self mutableKeysAccessQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __33__ICCache_setObject_forKey_cost___block_invoke;
  v11[3] = &unk_2640CD448;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_sync(v9, v11);
}

- (ICCache)init
{
  v11.receiver = self;
  v11.super_class = (Class)ICCache;
  v2 = [(ICCache *)&v11 init];
  v3 = v2;
  if (v2)
  {
    [(ICCache *)v2 registerForMemoryWarnings];
    v4 = [(id)objc_opt_class() cacheCollection];
    [v4 addPointer:v3];

    uint64_t v5 = [MEMORY[0x263EFF9C0] set];
    mutableKeys = v3->_mutableKeys;
    v3->_mutableKeys = (NSMutableSet *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.notes.iccache", v7);
    mutableKeysAccessQueue = v3->_mutableKeysAccessQueue;
    v3->_mutableKeysAccessQueue = (OS_dispatch_queue *)v8;
  }
  return v3;
}

- (void)registerForMemoryWarnings
{
  dispatch_source_t v3 = dispatch_source_create(MEMORY[0x263EF83D8], 0, 6uLL, MEMORY[0x263EF83A0]);
  [(ICCache *)self setMemoryWarningEventSource:v3];

  objc_initWeak(&location, self);
  v4 = [(ICCache *)self memoryWarningEventSource];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  dispatch_queue_t v8 = __36__ICCache_registerForMemoryWarnings__block_invoke;
  v9 = &unk_2640CD4C0;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v4, &v6);

  uint64_t v5 = [(ICCache *)self memoryWarningEventSource];
  dispatch_resume(v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (OS_dispatch_source)memoryWarningEventSource
{
  return self->_memoryWarningEventSource;
}

- (void)setMemoryWarningEventSource:(id)a3
{
}

+ (id)cacheCollection
{
  if (cacheCollection_onceToken != -1) {
    dispatch_once(&cacheCollection_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)cacheCollection_sCacheCollection;
  return v2;
}

void __28__ICCache_setObject_forKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mutableKeys];
  objc_msgSend(v2, "ic_addNonNilObject:", *(void *)(a1 + 40));
}

void __33__ICCache_setObject_forKey_cost___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mutableKeys];
  objc_msgSend(v2, "ic_addNonNilObject:", *(void *)(a1 + 40));
}

- (NSMutableSet)mutableKeys
{
  return self->_mutableKeys;
}

uint64_t __26__ICCache_cacheCollection__block_invoke()
{
  cacheCollection_sCacheCollection = [MEMORY[0x263F08A88] weakObjectsPointerArray];
  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  [(ICCache *)self unregisterForMemoryWarnings];
  v3.receiver = self;
  v3.super_class = (Class)ICCache;
  [(ICCache *)&v3 dealloc];
}

void __36__ICCache_registerForMemoryWarnings__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained receivedMemoryWarning];
}

- (void)unregisterForMemoryWarnings
{
  objc_super v3 = [(ICCache *)self memoryWarningEventSource];

  if (v3)
  {
    v4 = [(ICCache *)self memoryWarningEventSource];
    dispatch_source_cancel(v4);
  }
}

+ (void)purgeAllCaches
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = +[ICCache cacheCollection];
  objc_super v3 = [v2 allObjects];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) removeAllObjects];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICCache;
  [(ICCache *)&v9 removeObjectForKey:v4];
  uint64_t v5 = [(ICCache *)self mutableKeysAccessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__ICCache_removeObjectForKey___block_invoke;
  v7[3] = &unk_2640CD448;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __30__ICCache_removeObjectForKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mutableKeys];
  objc_msgSend(v2, "ic_removeNonNilObject:", *(void *)(a1 + 40));
}

- (void)removeAllObjects
{
  v5.receiver = self;
  v5.super_class = (Class)ICCache;
  [(ICCache *)&v5 removeAllObjects];
  objc_super v3 = [(ICCache *)self mutableKeysAccessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__ICCache_removeAllObjects__block_invoke;
  block[3] = &unk_2640CD3A8;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __27__ICCache_removeAllObjects__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) mutableKeys];
  [v1 removeAllObjects];
}

- (NSSet)allKeys
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__1;
  long long v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  objc_super v3 = [(ICCache *)self mutableKeysAccessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __18__ICCache_allKeys__block_invoke;
  v6[3] = &unk_2640CD2F8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __18__ICCache_allKeys__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) mutableKeys];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removeObjectsWithKeyContainingString:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(ICCache *)self allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (v4)
        {
          long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v10 containsString:v4]) {
            [(ICCache *)self removeObjectForKey:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setMutableKeys:(id)a3
{
}

- (void)setMutableKeysAccessQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableKeysAccessQueue, 0);
  objc_storeStrong((id *)&self->_mutableKeys, 0);
  objc_storeStrong((id *)&self->_memoryWarningEventSource, 0);
}

@end
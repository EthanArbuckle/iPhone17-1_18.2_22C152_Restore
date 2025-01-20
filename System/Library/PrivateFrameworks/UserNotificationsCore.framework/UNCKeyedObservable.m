@interface UNCKeyedObservable
- (UNCKeyedObservable)initWithQueue:(id)a3 callOutQueue:(id)a4;
- (id)_observersForKey:(id)a3;
- (void)_callOutQueue_notifyObserversKey:(id)a3 usingBlock:(id)a4;
- (void)_queue_addObserver:(id)a3 forKey:(id)a4;
- (void)_queue_removeObserver:(id)a3 forKey:(id)a4;
- (void)addObserver:(id)a3 forKey:(id)a4;
- (void)notifyObserversKey:(id)a3 usingBlock:(id)a4;
- (void)removeObserver:(id)a3 forKey:(id)a4;
@end

@implementation UNCKeyedObservable

- (UNCKeyedObservable)initWithQueue:(id)a3 callOutQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UNCKeyedObservable;
  v9 = [(UNCKeyedObservable *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_callOutQueue, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    observersByKey = v10->_observersByKey;
    v10->_observersByKey = v11;
  }
  return v10;
}

- (void)addObserver:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__UNCKeyedObservable_addObserver_forKey___block_invoke;
  block[3] = &unk_2655676D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __41__UNCKeyedObservable_addObserver_forKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addObserver:forKey:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_queue_addObserver:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v8 && v6)
  {
    id v7 = [(NSMutableDictionary *)self->_observersByKey objectForKey:v6];
    if (!v7)
    {
      id v7 = [MEMORY[0x263EFF980] array];
      [(NSMutableDictionary *)self->_observersByKey setObject:v7 forKey:v6];
    }
    [v7 removeObject:v8];
    [v7 addObject:v8];
  }
}

- (void)removeObserver:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__UNCKeyedObservable_removeObserver_forKey___block_invoke;
  block[3] = &unk_2655676D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __44__UNCKeyedObservable_removeObserver_forKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeObserver:forKey:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_queue_removeObserver:(id)a3 forKey:(id)a4
{
  queue = self->_queue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  id v9 = [(NSMutableDictionary *)self->_observersByKey objectForKey:v7];

  [v9 removeObject:v8];
}

- (void)notifyObserversKey:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  callOutQueue = self->_callOutQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__UNCKeyedObservable_notifyObserversKey_usingBlock___block_invoke;
  block[3] = &unk_265567AE0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(callOutQueue, block);
}

void __52__UNCKeyedObservable_notifyObserversKey_usingBlock___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__UNCKeyedObservable_notifyObserversKey_usingBlock___block_invoke_2;
  v3[3] = &unk_265567AB8;
  id v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_callOutQueue_notifyObserversKey:usingBlock:", v2, v3);
}

uint64_t __52__UNCKeyedObservable_notifyObserversKey_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_callOutQueue_notifyObserversKey:(id)a3 usingBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callOutQueue);
  id v8 = [(UNCKeyedObservable *)self _observersForKey:v6];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        v7[2](v7, *(void *)(*((void *)&v13 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (id)_observersForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__4;
  long long v16 = __Block_byref_object_dispose__4;
  id v17 = [MEMORY[0x263EFF8C0] array];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__UNCKeyedObservable__observersForKey___block_invoke;
  block[3] = &unk_265567700;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __39__UNCKeyedObservable__observersForKey___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
  v3 = [*(id *)(a1[4] + 24) objectForKey:@"*"];
  uint64_t v4 = [v2 arrayByAddingObjectsFromArray:v3];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = *(void **)(*(void *)(a1[6] + 8) + 40);
  id v11 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  uint64_t v8 = [v7 arrayByAddingObjectsFromArray:v11];
  uint64_t v9 = *(void *)(a1[6] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersByKey, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end
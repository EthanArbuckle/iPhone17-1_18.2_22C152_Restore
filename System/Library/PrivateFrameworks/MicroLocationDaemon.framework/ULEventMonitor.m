@interface ULEventMonitor
- (NSMutableDictionary)observersMap;
- (OS_dispatch_queue)queue;
- (ULEventMonitor)init;
- (id)latestEventAfterAddingObserverForEventName:(id)a3;
- (unint64_t)getNumberOfObserversForEventName:(id)a3;
- (void)addObserver:(id)a3 selector:(SEL)a4 eventName:(id)a5;
- (void)dealloc;
- (void)postEvent:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeObserver:(id)a3 fromEventName:(id)a4;
- (void)setObserversMap:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation ULEventMonitor

void __28__ULEventMonitor_postEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 observer];
  uint64_t v4 = [v3 selector];

  [v5 performSelector:v4 withObject:*(void *)(a1 + 32)];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)postEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(ULEventMonitor *)self observersMap];
  v7 = [v4 name];
  v8 = [v6 objectForKeyedSubscript:v7];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __28__ULEventMonitor_postEvent___block_invoke;
  v10[3] = &unk_2653F97A8;
  id v11 = v4;
  id v9 = v4;
  [v8 enumerateObjectsUsingBlock:v10];
}

- (NSMutableDictionary)observersMap
{
  return self->_observersMap;
}

- (ULEventMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)ULEventMonitor;
  v2 = [(ULEventMonitor *)&v7 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.milod.ULEventMonitor", v3);
    [(ULEventMonitor *)v2 setQueue:v4];

    id v5 = [MEMORY[0x263EFF9A0] dictionary];
    [(ULEventMonitor *)v2 setObserversMap:v5];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(ULEventMonitor *)self observersMap];
  dispatch_queue_t v4 = [v3 allKeys];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        [(ULEventMonitor *)self stopMonitoring:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)ULEventMonitor;
  [(ULEventMonitor *)&v9 dealloc];
}

- (void)addObserver:(id)a3 selector:(SEL)a4 eventName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v10 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_not_V2(v10);

  long long v11 = [(ULEventMonitor *)self queue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __49__ULEventMonitor_addObserver_selector_eventName___block_invoke;
  v14[3] = &unk_2653F9708;
  id v15 = v8;
  v16 = self;
  id v17 = v9;
  SEL v18 = a4;
  id v12 = v9;
  id v13 = v8;
  dispatch_sync(v11, v14);
}

void __49__ULEventMonitor_addObserver_selector_eventName___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v2 = [[ULObserverRecord alloc] initWithObserver:*(void *)(a1 + 32) selector:*(void *)(a1 + 56)];
  id v3 = [*(id *)(a1 + 40) observersMap];
  dispatch_queue_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 48)];

  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  if (v4)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __49__ULEventMonitor_addObserver_selector_eventName___block_invoke_2;
    v15[3] = &unk_2653F96E0;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 56);
    id v17 = &v19;
    uint64_t v18 = v6;
    id v16 = v5;
    [v4 enumerateObjectsUsingBlock:v15];
    if (!*((unsigned char *)v20 + 24)) {
      [v4 addObject:v2];
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263EFF980] arrayWithObject:v2];
    id v8 = [*(id *)(a1 + 40) observersMap];
    [v8 setObject:v7 forKeyedSubscript:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) startMonitoring:*(void *)(a1 + 48)];
  }
  if (!*((unsigned char *)v20 + 24))
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_33);
    }
    id v9 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = *(void *)(a1 + 48);
      id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "getNumberOfObserversForEventName:", v12));
      *(_DWORD *)buf = 138412802;
      id v24 = v11;
      __int16 v25 = 2112;
      uint64_t v26 = v12;
      __int16 v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_25631F000, v9, OS_LOG_TYPE_DEFAULT, "Adding observer: %@, eventName: %@, numberOfObservers: %@", buf, 0x20u);
    }
    v14 = [*(id *)(a1 + 40) latestEventAfterAddingObserverForEventName:*(void *)(a1 + 48)];
    if (v14) {
      [*(id *)(a1 + 40) postEvent:v14];
    }
  }
  _Block_object_dispose(&v19, 8);
}

void __49__ULEventMonitor_addObserver_selector_eventName___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  uint64_t v6 = [v10 observer];
  uint64_t v7 = v6;
  if (v6 == (void *)a1[4])
  {
    uint64_t v8 = [v10 selector];
    uint64_t v9 = a1[6];

    if (v8 == v9)
    {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v6 = [(ULEventMonitor *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__ULEventMonitor_removeObserver___block_invoke;
  v8[3] = &unk_2653F9228;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __33__ULEventMonitor_removeObserver___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observersMap];
  id v3 = [v2 allKeys];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__ULEventMonitor_removeObserver___block_invoke_2;
  v5[3] = &unk_2653F9758;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 enumerateObjectsUsingBlock:v5];
}

void __33__ULEventMonitor_removeObserver___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) observersMap];
  id v5 = [v4 objectForKeyedSubscript:v3];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33__ULEventMonitor_removeObserver___block_invoke_3;
  v9[3] = &unk_2653F9730;
  id v10 = *(id *)(a1 + 40);
  id v11 = v5;
  uint64_t v6 = *(void *)(a1 + 32);
  id v12 = v3;
  uint64_t v13 = v6;
  id v7 = v3;
  id v8 = v5;
  [v8 enumerateObjectsUsingBlock:v9];
}

void __33__ULEventMonitor_removeObserver___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = [v6 observer];
  id v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    [*(id *)(a1 + 40) removeObject:v6];
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_33);
    }
    id v9 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      uint64_t v13 = *(void *)(a1 + 48);
      v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
      int v16 = 138412802;
      id v17 = v12;
      __int16 v18 = 2112;
      uint64_t v19 = v13;
      __int16 v20 = 2112;
      uint64_t v21 = v14;
      _os_log_impl(&dword_25631F000, v10, OS_LOG_TYPE_DEFAULT, "Removing observer: %@, eventName: %@, numberOfObservers: %@", (uint8_t *)&v16, 0x20u);
    }
    if (![*(id *)(a1 + 40) count])
    {
      [*(id *)(a1 + 56) stopMonitoring:*(void *)(a1 + 48)];
      id v15 = [*(id *)(a1 + 56) observersMap];
      [v15 removeObjectForKey:*(void *)(a1 + 48)];
    }
    *a4 = 1;
  }
}

- (void)removeObserver:(id)a3 fromEventName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_not_V2(v8);

  id v9 = [(ULEventMonitor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__ULEventMonitor_removeObserver_fromEventName___block_invoke;
  block[3] = &unk_2653F9040;
  block[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_sync(v9, block);
}

void __47__ULEventMonitor_removeObserver_fromEventName___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__6;
  uint64_t v22 = __Block_byref_object_dispose__6;
  v2 = [*(id *)(a1 + 32) observersMap];
  id v23 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v3 = (void *)v19[5];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__ULEventMonitor_removeObserver_fromEventName___block_invoke_30;
  v10[3] = &unk_2653F9780;
  id v11 = *(id *)(a1 + 48);
  id v12 = &v18;
  id v13 = &v14;
  [v3 enumerateObjectsUsingBlock:v10];
  if (*((unsigned char *)v15 + 24))
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_33);
    }
    id v4 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "getNumberOfObserversForEventName:", v7));
      *(_DWORD *)buf = 138412802;
      id v25 = v6;
      __int16 v26 = 2112;
      uint64_t v27 = v7;
      __int16 v28 = 2112;
      uint64_t v29 = v8;
      _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_DEFAULT, "Removing observer: %@, eventName: %@, numberOfObservers: %@", buf, 0x20u);
    }
    if (![(id)v19[5] count])
    {
      [*(id *)(a1 + 32) stopMonitoring:*(void *)(a1 + 40)];
      id v9 = [*(id *)(a1 + 32) observersMap];
      [v9 removeObjectForKey:*(void *)(a1 + 40)];
    }
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

void __47__ULEventMonitor_removeObserver_fromEventName___block_invoke_30(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 observer];
  id v8 = (void *)a1[4];

  if (v7 == v8)
  {
    [*(id *)(*(void *)(a1[5] + 8) + 40) removeObjectAtIndex:a3];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (unint64_t)getNumberOfObserversForEventName:(id)a3
{
  id v4 = a3;
  id v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(ULEventMonitor *)self observersMap];
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  unint64_t v8 = [v7 count];
  return v8;
}

- (id)latestEventAfterAddingObserverForEventName:(id)a3
{
  return 0;
}

- (void)setQueue:(id)a3
{
}

- (void)setObserversMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
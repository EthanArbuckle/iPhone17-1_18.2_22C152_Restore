@interface MNObserverHashTable
- (BOOL)hasObservers;
- (MNObserverHashTable)initWithProtocol:(id)a3;
- (OS_dispatch_queue)callbackQueue;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (unint64_t)count;
- (void)forwardInvocation:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation MNObserverHashTable

void __41__MNObserverHashTable_forwardInvocation___block_invoke_9(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) selector];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(*(id *)(a1 + 32), "invokeWithTarget:", v7, (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __40__MNObserverHashTable_registerObserver___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (void *)WeakRetained[2];
    if (!v4)
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
      uint64_t v6 = (void *)v3[2];
      v3[2] = v5;

      uint64_t v4 = (void *)v3[2];
    }
    [v4 addObject:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      long long v9 = "-[MNObserverHashTable registerObserver:]_block_invoke";
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "strongSelf went away in %s", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_copyWeak(&v6, &location);
  id v5 = v4;
  geo_isolate_sync();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__0;
  v16[4] = __Block_byref_object_dispose__0;
  id v17 = 0;
  objc_initWeak(&location, self);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  long long v11 = __41__MNObserverHashTable_forwardInvocation___block_invoke;
  v12 = &unk_1E60F6438;
  objc_copyWeak(&v14, &location);
  uint64_t v13 = v16;
  geo_isolate_sync();
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [v4 retainArguments];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__MNObserverHashTable_forwardInvocation___block_invoke_9;
  v6[3] = &unk_1E60F6488;
  id v5 = v4;
  id v7 = v5;
  int v8 = v16;
  MNRunAsynchronouslyOnMainThread(v6);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(v16, 8);
}

- (MNObserverHashTable)initWithProtocol:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MNObserverHashTable;
  id v6 = [(MNObserverHashTable *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_protocol, a3);
    uint64_t v8 = geo_isolater_create();
    observerLock = v7->_observerLock;
    v7->_observerLock = (geo_isolater *)v8;

    uint64_t v10 = v7;
  }

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  objc_method_description MethodDescription = protocol_getMethodDescription(self->_protocol, a3, 0, 1);
  types = MethodDescription.types;
  if (MethodDescription.name
    || (objc_method_description v7 = protocol_getMethodDescription(self->_protocol, a3, 1, 1), types = v7.types, v7.name))
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:types];
  }
  else
  {
    [(MNObserverHashTable *)self doesNotRecognizeSelector:a3];
    uint64_t v8 = 0;
  }
  return v8;
}

void __41__MNObserverHashTable_forwardInvocation___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained[2] allObjects];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    objc_method_description v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[MNObserverHashTable forwardInvocation:]_block_invoke";
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "strongSelf went away in %s", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  objc_method_description v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  objc_initWeak(&location, self);
  objc_copyWeak(&v4, &location);
  geo_isolate_sync();
  unint64_t v2 = v7[3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v6, 8);
  return v2;
}

void __28__MNObserverHashTable_count__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained[2] setRepresentation];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 count];
  }
  else
  {
    uint64_t v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      objc_method_description v7 = "-[MNObserverHashTable count]_block_invoke";
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "strongSelf went away in %s", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BOOL)hasObservers
{
  return [(MNObserverHashTable *)self count] != 0;
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_copyWeak(&v6, &location);
  id v5 = v4;
  geo_isolate_sync();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __42__MNObserverHashTable_unregisterObserver___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[2] removeObject:*(void *)(a1 + 32)];
  }
  else
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      id v6 = "-[MNObserverHashTable unregisterObserver:]_block_invoke";
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "strongSelf went away in %s", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (id)description
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  objc_initWeak(&location, self);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __34__MNObserverHashTable_description__block_invoke;
  v16 = &unk_1E60F6438;
  objc_copyWeak(&v18, &location);
  id v17 = &v20;
  geo_isolate_sync();
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"MNObserverHashTable observers count: %d", -[MNObserverHashTable count](self, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = (id)v21[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"\n\t%@ (%p)", objc_opt_class(), *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v26 count:16];
    }
    while (v5);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v20, 8);

  return v3;
}

void __34__MNObserverHashTable_description__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained[2] allObjects];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      long long v9 = "-[MNObserverHashTable description]_block_invoke";
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "strongSelf went away in %s", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_observerLock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

@end
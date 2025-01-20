@interface FCKeyedOperationQueue
- (BOOL)isSuspended;
- (FCKeyedOperationQueue)init;
- (FCKeyedOperationQueue)initWithDelegate:(id)a3 maxConcurrentOperationCount:(int64_t)a4;
- (FCKeyedOperationQueueDelegate)delegate;
- (NSOrderedSet)keyQueue;
- (OS_dispatch_queue)executionQueue;
- (OS_os_log)log;
- (void)_enqueueOperationIfNeeded;
- (void)notifyWhenAllOperationsAreFinishedUsingBlock:(id)a3;
- (void)setExecutionQueue:(id)a3;
- (void)setKeyQueue:(id)a3;
- (void)setLog:(id)a3;
- (void)setSuspended:(BOOL)a3;
@end

@implementation FCKeyedOperationQueue

- (void)_enqueueOperationIfNeeded
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [MEMORY[0x1E4F29060] isMainThread];
    if ([(id)a1 isSuspended])
    {
      v2 = [(id)a1 log];

      if (!v2) {
        return;
      }
      v3 = [(id)a1 log];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEFAULT, "KOQ will not revisit queue because it's currently suspended", buf, 2u);
      }
      goto LABEL_42;
    }
    v3 = *(id *)(a1 + 48);
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 56);
    v6 = [(id)a1 log];

    if (v6)
    {
      v7 = [(id)a1 log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v43 = v3;
        _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "KOQ will revisit queue, executing=%{public}@", buf, 0xCu);
      }
    }
    uint64_t v8 = [v3 count];
    if (v5 == -1) {
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v9 = v5;
    }
    if (v8 >= v9)
    {
      v16 = [(id)a1 log];

      if (!v16)
      {
LABEL_41:

LABEL_42:
        return;
      }
      v17 = [(id)a1 log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v43 = v5;
        _os_log_impl(&dword_1A460D000, v17, OS_LOG_TYPE_DEFAULT, "KOQ is already executing as many operations as it can, max=%lu", buf, 0xCu);
      }
LABEL_40:

      goto LABEL_41;
    }
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __50__FCKeyedOperationQueue__enqueueOperationIfNeeded__block_invoke;
    v40[3] = &unk_1E5B5AD18;
    v10 = v3;
    v41 = v10;
    uint64_t v11 = [v4 indexOfObjectPassingTest:v40];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      v13 = 0;
    }
    else
    {
      v13 = [v4 objectAtIndexedSubscript:v11];
      id v18 = objc_loadWeakRetained((id *)(a1 + 16));
      id WeakRetained = v18;
      if (v13 && v18)
      {
        [v10 addObject:v13];
        id v19 = *(id *)(a1 + 64);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 72));
        v20 = objc_alloc_init(FCKeyedOperation);
        v21 = [(id)a1 log];
        if (v20) {
          objc_storeStrong((id *)&v20->_log, v21);
        }

        uint64_t v29 = MEMORY[0x1E4F143A8];
        uint64_t v30 = 3221225472;
        v31 = __50__FCKeyedOperationQueue__enqueueOperationIfNeeded__block_invoke_2;
        v32 = &unk_1E5B4CEF0;
        v33 = v20;
        uint64_t v34 = a1;
        id WeakRetained = WeakRetained;
        id v35 = WeakRetained;
        v13 = v13;
        v36 = v13;
        id v37 = v4;
        v38 = v10;
        v15 = v19;
        v39 = v15;
        v22 = v20;
        v23 = (void (**)(void))_Block_copy(&v29);
        v24 = objc_msgSend((id)a1, "executionQueue", v29, v30, v31, v32);

        v25 = [(id)a1 log];

        if (v24)
        {
          if (v25)
          {
            v26 = [(id)a1 log];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v43 = v13;
              _os_log_impl(&dword_1A460D000, v26, OS_LOG_TYPE_DEFAULT, "KOQ will execute next operation on execution queue, key=%{public}@", buf, 0xCu);
            }
          }
          v27 = [(id)a1 executionQueue];
          dispatch_async(v27, v23);
        }
        else
        {
          if (v25)
          {
            v28 = [(id)a1 log];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v43 = v13;
              _os_log_impl(&dword_1A460D000, v28, OS_LOG_TYPE_DEFAULT, "KOQ will execute next operation, key=%{public}@", buf, 0xCu);
            }
          }
          v23[2](v23);
        }
        [v15 setObject:v22 forKeyedSubscript:v13];
        -[FCKeyedOperationQueue _enqueueOperationIfNeeded](a1);

        goto LABEL_38;
      }
    }
    v14 = [(id)a1 log];

    if (!v14)
    {
LABEL_39:

      v17 = v41;
      goto LABEL_40;
    }
    v15 = [(id)a1 log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v15, OS_LOG_TYPE_DEFAULT, "KOQ found no keys that need to be executed", buf, 2u);
    }
LABEL_38:

    goto LABEL_39;
  }
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void)setSuspended:(BOOL)a3
{
  [MEMORY[0x1E4F29060] isMainThread];
  self->_suspended = a3;
  -[FCKeyedOperationQueue _enqueueOperationIfNeeded]((uint64_t)self);
}

uint64_t __50__FCKeyedOperationQueue__enqueueOperationIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (void)setExecutionQueue:(id)a3
{
}

- (FCKeyedOperationQueue)initWithDelegate:(id)a3 maxConcurrentOperationCount:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "delegate");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCKeyedOperationQueue initWithDelegate:maxConcurrentOperationCount:]";
    __int16 v22 = 2080;
    v23 = "FCKeyedOperationQueue.m";
    __int16 v24 = 1024;
    int v25 = 45;
    __int16 v26 = 2114;
    v27 = v18;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v19.receiver = self;
  v19.super_class = (Class)FCKeyedOperationQueue;
  v7 = [(FCKeyedOperationQueue *)&v19 init];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    uint64_t v9 = objc_opt_new();
    keysForExecutingOperations = v8->_keysForExecutingOperations;
    v8->_keysForExecutingOperations = (NSMutableSet *)v9;

    v8->_maxConcurrentOperationCount = a4;
    uint64_t v11 = objc_opt_new();
    mutableKeyQueue = v8->_mutableKeyQueue;
    v8->_mutableKeyQueue = (NSMutableOrderedSet *)v11;

    uint64_t v13 = objc_opt_new();
    cancelHandlersByKey = v8->_cancelHandlersByKey;
    v8->_cancelHandlersByKey = (NSMutableDictionary *)v13;

    dispatch_group_t v15 = dispatch_group_create();
    operationExecutionGroup = v8->_operationExecutionGroup;
    v8->_operationExecutionGroup = (OS_dispatch_group *)v15;
  }
  return v8;
}

void __50__FCKeyedOperationQueue__enqueueOperationIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(void **)(a1 + 56);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__FCKeyedOperationQueue__enqueueOperationIfNeeded__block_invoke_3;
  v15[3] = &unk_1E5B5AD40;
  id v16 = *(id *)(a1 + 64);
  id v17 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 72);
  id v6 = *(id *)(a1 + 80);
  uint64_t v7 = *(void *)(a1 + 40);
  id v19 = v6;
  uint64_t v20 = v7;
  id v8 = v3;
  id v9 = v4;
  id v10 = v5;
  uint64_t v11 = v15;
  if (v2)
  {
    if (*(unsigned char *)(v2 + 8))
    {
      v12 = *(NSObject **)(v2 + 24);
      if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v10;
        _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "KOQ will not execute operation because it's been cancelled, key=%{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      uint64_t v13 = [v9 keyedOperationQueue:v8 performAsyncOperationForKey:v10 completion:v11];
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      __int16 v22 = __60__FCKeyedOperation_executeForQueue_delegate_key_completion___block_invoke;
      v23 = &unk_1E5B4BE70;
      uint64_t v24 = v2;
      id v25 = v13;
      id v14 = v13;
      FCPerformBlockOnMainThread(&buf);
    }
  }
}

- (void)setKeyQueue:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  if (self)
  {
    id v6 = self->_mutableKeyQueue;
    [(NSMutableOrderedSet *)v6 removeAllObjects];
    uint64_t v7 = [v5 array];

    [(NSMutableOrderedSet *)v6 addObjectsFromArray:v7];
    [MEMORY[0x1E4F29060] isMainThread];
    id v8 = self->_mutableKeyQueue;
    id v9 = self->_cancelHandlersByKey;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = (void *)[(NSMutableSet *)self->_keysForExecutingOperations copy];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          if (([(NSMutableOrderedSet *)v8 containsObject:v15] & 1) == 0)
          {
            id v16 = [(NSMutableDictionary *)v9 objectForKeyedSubscript:v15];
            id v17 = v16;
            if (v16) {
              [v16 cancel];
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }
  }
  else
  {
    [0 removeAllObjects];
    id v18 = [v5 array];

    [0 addObjectsFromArray:v18];
  }
  -[FCKeyedOperationQueue _enqueueOperationIfNeeded]((uint64_t)self);
}

- (FCKeyedOperationQueue)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)long long buf = 136315906;
    id v8 = "-[FCKeyedOperationQueue init]";
    __int16 v9 = 2080;
    id v10 = "FCKeyedOperationQueue.m";
    __int16 v11 = 1024;
    int v12 = 40;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCKeyedOperationQueue init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NSOrderedSet)keyQueue
{
  [MEMORY[0x1E4F29060] isMainThread];
  v3 = (void *)MEMORY[0x1E4F1CAA0];
  if (self) {
    mutableKeyQueue = self->_mutableKeyQueue;
  }
  else {
    mutableKeyQueue = 0;
  }
  return (NSOrderedSet *)[v3 orderedSetWithOrderedSet:mutableKeyQueue];
}

- (void)notifyWhenAllOperationsAreFinishedUsingBlock:(id)a3
{
  if (self) {
    self = (FCKeyedOperationQueue *)self->_operationExecutionGroup;
  }
  dispatch_group_notify(&self->super, MEMORY[0x1E4F14428], a3);
}

void __50__FCKeyedOperationQueue__enqueueOperationIfNeeded__block_invoke_3(uint64_t a1, char a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__FCKeyedOperationQueue__enqueueOperationIfNeeded__block_invoke_4;
  v5[3] = &unk_1E5B4E508;
  char v11 = a2;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  id v9 = v3;
  uint64_t v10 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __50__FCKeyedOperationQueue__enqueueOperationIfNeeded__block_invoke_4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 72)) {
    [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 48) removeObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 56) removeObjectForKey:*(void *)(a1 + 40)];
  -[FCKeyedOperationQueue _enqueueOperationIfNeeded](*(void *)(a1 + 64));
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2) {
    id v3 = *(NSObject **)(v2 + 72);
  }
  else {
    id v3 = 0;
  }
  dispatch_group_leave(v3);
}

- (FCKeyedOperationQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FCKeyedOperationQueueDelegate *)WeakRetained;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationExecutionGroup, 0);
  objc_storeStrong((id *)&self->_cancelHandlersByKey, 0);
  objc_storeStrong((id *)&self->_keysForExecutingOperations, 0);
  objc_storeStrong((id *)&self->_mutableKeyQueue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
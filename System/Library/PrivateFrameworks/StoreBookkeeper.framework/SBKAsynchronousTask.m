@interface SBKAsynchronousTask
- (MSVTaskAssertion)taskAssertion;
- (NSError)error;
- (NSMutableArray)completions;
- (SBKAsynchronousTask)initWithHandlerQueue:(id)a3 timeout:(double)a4 debugDescription:(id)a5;
- (id)debugDescription;
- (id)description;
- (id)expirationHandler;
- (id)finishedHandler;
- (id)result;
- (int)cancelType;
- (void)_invalidateAssertion:(BOOL)a3;
- (void)_invalidateTimer;
- (void)_onQueueFireExpirationHandlerIfNecesary;
- (void)addTaskCompletionBlock:(id)a3;
- (void)beginTaskOperation;
- (void)dealloc;
- (void)endTaskOperation;
- (void)finishTaskOperationWithResult:(id)a3 error:(id)a4;
- (void)invalidate;
- (void)invokeTaskCompletionBlocksWithBlock:(id)a3;
- (void)setCancelType:(int)a3;
- (void)setCompletions:(id)a3;
- (void)setError:(id)a3;
- (void)setExpirationHandler:(id)a3;
- (void)setFinishedHandler:(id)a3;
- (void)setResult:(id)a3;
- (void)setTaskAssertion:(id)a3;
@end

@implementation SBKAsynchronousTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_taskAssertion, 0);
  objc_storeStrong(&self->_finishedHandler, 0);
  objc_storeStrong(&self->_expirationHandler, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_debugDescription, 0);
}

- (void)setCompletions:(id)a3
{
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (void)setTaskAssertion:(id)a3
{
}

- (MSVTaskAssertion)taskAssertion
{
  return self->_taskAssertion;
}

- (void)invokeTaskCompletionBlocksWithBlock:(id)a3
{
  id v4 = a3;
  v5 = [(SBKAsynchronousTask *)self completions];
  v6 = (void *)[v5 copy];

  [(SBKAsynchronousTask *)self setCompletions:0];
  v7 = [(SBKAsynchronousTask *)self result];
  v8 = [(SBKAsynchronousTask *)self error];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SBKAsynchronousTask_invokeTaskCompletionBlocksWithBlock___block_invoke;
  block[3] = &unk_2648AF7F8;
  block[4] = self;
  block[5] = v22;
  dispatch_sync(queue, block);
  dispatch_group_t v10 = dispatch_group_create();
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__SBKAsynchronousTask_invokeTaskCompletionBlocksWithBlock___block_invoke_2;
  v16[3] = &unk_2648AF820;
  v11 = v10;
  v17 = v11;
  id v12 = v4;
  id v20 = v12;
  id v13 = v7;
  id v18 = v13;
  id v14 = v8;
  id v19 = v14;
  [v6 enumerateObjectsUsingBlock:v16];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__SBKAsynchronousTask_invokeTaskCompletionBlocksWithBlock___block_invoke_4;
  v15[3] = &unk_2648AF7F8;
  v15[4] = self;
  v15[5] = v22;
  dispatch_group_notify(v11, MEMORY[0x263EF83A0], v15);

  _Block_object_dispose(v22, 8);
}

uint64_t __59__SBKAsynchronousTask_invokeTaskCompletionBlocksWithBlock___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 40))
  {
    *(unsigned char *)(v1 + 40) = 1;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

void __59__SBKAsynchronousTask_invokeTaskCompletionBlocksWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SBKAsynchronousTask_invokeTaskCompletionBlocksWithBlock___block_invoke_3;
  block[3] = &unk_2648AF970;
  id v11 = *(id *)(a1 + 56);
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __59__SBKAsynchronousTask_invokeTaskCompletionBlocksWithBlock___block_invoke_4(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return [*(id *)(result + 32) _invalidateAssertion:1];
  }
  return result;
}

void __59__SBKAsynchronousTask_invokeTaskCompletionBlocksWithBlock___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  v2 = *(NSObject **)(a1 + 56);
  dispatch_group_leave(v2);
}

- (void)addTaskCompletionBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    v6 = (void *)MEMORY[0x230F4DE10]();
    id v9 = (id)[v6 copy];

    id v7 = [(SBKAsynchronousTask *)self completions];
    id v8 = (void *)MEMORY[0x230F4DE10](v9);
    [v7 addObject:v8];
  }
}

- (void)invalidate
{
  [(SBKAsynchronousTask *)self _invalidateTimer];
  [(SBKAsynchronousTask *)self setExpirationHandler:0];
  [(SBKAsynchronousTask *)self setFinishedHandler:0];
  [(SBKAsynchronousTask *)self _invalidateAssertion:0];
}

- (void)_invalidateAssertion:(BOOL)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__7;
  id v11 = __Block_byref_object_dispose__8;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SBKAsynchronousTask__invalidateAssertion___block_invoke;
  block[3] = &unk_2648AF7D0;
  BOOL v6 = a3;
  void block[4] = self;
  block[5] = &v7;
  dispatch_sync(queue, block);
  id v4 = (void *)v8[5];
  if (v4) {
    [v4 invalidate];
  }
  _Block_object_dispose(&v7, 8);
}

void __44__SBKAsynchronousTask__invalidateAssertion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 40) || *(unsigned char *)(a1 + 48))
  {
    *(unsigned char *)(v2 + 40) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 96));
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 96);
    *(void *)(v3 + 96) = 0;
  }
}

- (void)endTaskOperation
{
  [(SBKAsynchronousTask *)self finishTaskOperationWithResult:0 error:0];
  [(SBKAsynchronousTask *)self invalidate];
}

- (void)finishTaskOperationWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SBKAsynchronousTask *)self setResult:v6];
  [(SBKAsynchronousTask *)self setError:v7];
  [(SBKAsynchronousTask *)self setExpirationHandler:0];
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SBKAsynchronousTask_finishTaskOperationWithResult_error___block_invoke;
  block[3] = &unk_2648AF7A8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(handlerQueue, block);
}

void __59__SBKAsynchronousTask_finishTaskOperationWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) finishedHandler];
  if (v2)
  {
    uint64_t v3 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      int v7 = 138412802;
      uint64_t v8 = v4;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl(&dword_22B807000, v3, OS_LOG_TYPE_DEFAULT, "Invoking completion handler for %@, result = %@, error = %@", (uint8_t *)&v7, 0x20u);
    }

    v2[2](v2);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)beginTaskOperation
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = self;
    _os_log_impl(&dword_22B807000, v4, OS_LOG_TYPE_DEFAULT, "beginTaskOperation %@", buf, 0xCu);
  }

  uint64_t v5 = [(SBKAsynchronousTask *)self finishedHandler];
  if (!v5
    || (uint64_t v6 = (void *)v5,
        [(SBKAsynchronousTask *)self expirationHandler],
        int v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBKAsynchronousTask.m" lineNumber:201 description:@"must have a finish and expiration handler specified"];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SBKAsynchronousTask_beginTaskOperation__block_invoke;
  block[3] = &unk_2648AF920;
  void block[4] = self;
  dispatch_sync(queue, block);
}

void __41__SBKAsynchronousTask_beginTaskOperation__block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x263F54F50]) initWithName:@"SBKAsynchronousTask" pid:getpid() subsystem:@"com.apple.amp.StoreBookkeeper" reason:2 flags:1];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 96);
  *(void *)(v3 + 96) = v2;

  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 96);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__SBKAsynchronousTask_beginTaskOperation__block_invoke_2;
  v10[3] = &unk_2648AF780;
  objc_copyWeak(&v11, &location);
  [v5 setInvalidationHandler:v10];
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (v6)
  {
    dispatch_suspend(v6);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(NSObject **)(v7 + 32);
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(*(double *)(v7 + 48) * 1000000000.0));
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 32));
  }
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __41__SBKAsynchronousTask_beginTaskOperation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateTimer];
  [WeakRetained setCancelType:1];
}

- (NSError)error
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_time_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __28__SBKAsynchronousTask_error__block_invoke;
  v5[3] = &unk_2648AF7F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

void __28__SBKAsynchronousTask_error__block_invoke(uint64_t a1)
{
}

- (void)setError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__SBKAsynchronousTask_setError___block_invoke;
  v7[3] = &unk_2648AF8A8;
  id v8 = v4;
  dispatch_time_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __32__SBKAsynchronousTask_setError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = *(void **)(v2 + 72);
  id v3 = (id *)(v2 + 72);
  if (v1 != v4) {
    objc_storeStrong(v3, v1);
  }
}

- (id)result
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_time_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__SBKAsynchronousTask_result__block_invoke;
  v5[3] = &unk_2648AF7F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __29__SBKAsynchronousTask_result__block_invoke(uint64_t a1)
{
}

- (void)setResult:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__SBKAsynchronousTask_setResult___block_invoke;
  v7[3] = &unk_2648AF8A8;
  id v8 = v4;
  dispatch_time_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __33__SBKAsynchronousTask_setResult___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = *(void **)(v2 + 64);
  id v3 = (id *)(v2 + 64);
  if (v1 != v4) {
    objc_storeStrong(v3, v1);
  }
}

- (int)cancelType
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__SBKAsynchronousTask_cancelType__block_invoke;
  v5[3] = &unk_2648AF7F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__SBKAsynchronousTask_cancelType__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 56) != 0;
  return result;
}

- (void)setCancelType:(int)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__SBKAsynchronousTask_setCancelType___block_invoke;
  v4[3] = &unk_2648AF758;
  int v5 = a3;
  v4[4] = self;
  dispatch_sync(queue, v4);
}

uint64_t __37__SBKAsynchronousTask_setCancelType___block_invoke(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(_DWORD *)(v2 + 56))
  {
    *(_DWORD *)(v2 + 56) = v1;
    result = *(void *)(result + 32);
    if (*(_DWORD *)(result + 56)) {
      return [(id)result _onQueueFireExpirationHandlerIfNecesary];
    }
  }
  return result;
}

- (void)_onQueueFireExpirationHandlerIfNecesary
{
  int v3 = (void *)MEMORY[0x230F4DE10](self->_expirationHandler, a2);
  if (v3)
  {
    id expirationHandler = self->_expirationHandler;
    self->_id expirationHandler = 0;

    int cancelType = self->_cancelType;
    handlerQueue = self->_handlerQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__SBKAsynchronousTask__onQueueFireExpirationHandlerIfNecesary__block_invoke;
    block[3] = &unk_2648AF730;
    void block[4] = self;
    int v9 = cancelType;
    id v8 = v3;
    dispatch_async(handlerQueue, block);
  }
}

uint64_t __62__SBKAsynchronousTask__onQueueFireExpirationHandlerIfNecesary__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(_DWORD *)(a1 + 48);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v4;
    _os_log_impl(&dword_22B807000, v2, OS_LOG_TYPE_DEFAULT, "Invoking expiration handler for %@, with int cancelType = %d", (uint8_t *)&v6, 0x12u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)finishedHandler
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__1688;
  uint64_t v10 = __Block_byref_object_dispose__1689;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__SBKAsynchronousTask_finishedHandler__block_invoke;
  v5[3] = &unk_2648AF7F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  uint64_t v3 = (void *)MEMORY[0x230F4DE10](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __38__SBKAsynchronousTask_finishedHandler__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 88) copy];
  return MEMORY[0x270F9A758]();
}

- (void)setFinishedHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__SBKAsynchronousTask_setFinishedHandler___block_invoke;
  v7[3] = &unk_2648AF858;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void *__42__SBKAsynchronousTask_setFinishedHandler___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 40);
  if (result != *(void **)(*(void *)(a1 + 32) + 88))
  {
    *(void *)(*(void *)(a1 + 32) + 88) = [result copy];
    return (void *)MEMORY[0x270F9A758]();
  }
  return result;
}

- (id)expirationHandler
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__1688;
  uint64_t v10 = __Block_byref_object_dispose__1689;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__SBKAsynchronousTask_expirationHandler__block_invoke;
  v5[3] = &unk_2648AF7F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  uint64_t v3 = (void *)MEMORY[0x230F4DE10](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __40__SBKAsynchronousTask_expirationHandler__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 80) copy];
  return MEMORY[0x270F9A758]();
}

- (void)setExpirationHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__SBKAsynchronousTask_setExpirationHandler___block_invoke;
  v7[3] = &unk_2648AF858;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void *__44__SBKAsynchronousTask_setExpirationHandler___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 40);
  if (result != *(void **)(*(void *)(a1 + 32) + 80))
  {
    *(void *)(*(void *)(a1 + 32) + 80) = [result copy];
    return (void *)MEMORY[0x270F9A758]();
  }
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SBKAsynchronousTask;
  id v4 = [(SBKAsynchronousTask *)&v8 description];
  int v5 = [(SBKAsynchronousTask *)self debugDescription];
  id v6 = [v3 stringWithFormat:@"%@ '%@'", v4, v5];

  return v6;
}

- (void)_invalidateTimer
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__SBKAsynchronousTask__invalidateTimer__block_invoke;
  block[3] = &unk_2648AF920;
  void block[4] = self;
  dispatch_sync(queue, block);
}

void __39__SBKAsynchronousTask__invalidateTimer__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0;
  }
}

- (void)dealloc
{
  [(SBKAsynchronousTask *)self _invalidateTimer];
  [(SBKAsynchronousTask *)self setResult:0];
  [(SBKAsynchronousTask *)self setError:0];
  [(SBKAsynchronousTask *)self setFinishedHandler:0];
  [(SBKAsynchronousTask *)self setExpirationHandler:0];
  handlerQueue = self->_handlerQueue;
  if (handlerQueue)
  {
    self->_handlerQueue = 0;
  }
  queue = self->_queue;
  if (queue)
  {
    self->_queue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SBKAsynchronousTask;
  [(SBKAsynchronousTask *)&v5 dealloc];
}

- (id)debugDescription
{
  return self->_debugDescription;
}

- (SBKAsynchronousTask)initWithHandlerQueue:(id)a3 timeout:(double)a4 debugDescription:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SBKAsynchronousTask;
  id v11 = [(SBKAsynchronousTask *)&v23 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_handlerQueue, a3);
    dispatch_queue_t v13 = dispatch_queue_create(0, 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    v12->_timeout = a4;
    v15 = [MEMORY[0x263EFF980] array];
    [(SBKAsynchronousTask *)v12 setCompletions:v15];

    objc_storeStrong((id *)&v12->_debugDescription, a5);
    v16 = dispatch_queue_create(0, 0);
    dispatch_source_t v17 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v16);
    timeoutTimer = v12->_timeoutTimer;
    v12->_timeoutTimer = (OS_dispatch_source *)v17;

    dispatch_source_set_timer((dispatch_source_t)v12->_timeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    id v19 = v12->_timeoutTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __69__SBKAsynchronousTask_initWithHandlerQueue_timeout_debugDescription___block_invoke;
    handler[3] = &unk_2648AF920;
    v22 = v12;
    dispatch_source_set_event_handler(v19, handler);
    dispatch_resume((dispatch_object_t)v12->_timeoutTimer);
  }
  return v12;
}

uint64_t __69__SBKAsynchronousTask_initWithHandlerQueue_timeout_debugDescription___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_22B807000, v2, OS_LOG_TYPE_ERROR, "[SBKAsynchronousTask] WARNING: task timed out: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) _invalidateTimer];
  [*(id *)(a1 + 32) _invalidateAssertion:1];
  return [*(id *)(a1 + 32) setCancelType:2];
}

@end
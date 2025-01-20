@interface PPNotificationHandler
- (NSString)name;
- (PPNotificationHandler)initWithName:(id)a3 waitSeconds:(double)a4;
- (double)waitSeconds;
- (id)description;
- (void)_delayedExecutionAfterSeconds:(double)a3;
- (void)_executeBlocksWithGuardedData:(id)a3;
- (void)addObserverBlock:(id)a3 forLifetimeOfObject:(id)a4;
- (void)fireWithObjects:(id)a3;
- (void)setName:(id)a3;
- (void)setWaitSeconds:(double)a3;
- (void)waitOnQueueToDrain;
@end

@implementation PPNotificationHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_waiterQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setWaitSeconds:(double)a3
{
  self->_waitSeconds = a3;
}

- (double)waitSeconds
{
  return self->_waitSeconds;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PPNotificationHandler: %@>", self->_name];
  return v2;
}

- (void)addObserverBlock:(id)a3 forLifetimeOfObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__PPNotificationHandler_addObserverBlock_forLifetimeOfObject___block_invoke;
  v11[3] = &unk_1E550F130;
  id v12 = v7;
  id v13 = v6;
  id v9 = v7;
  id v10 = v6;
  [(_PASLock *)lock runWithLockAcquired:v11];
}

void __62__PPNotificationHandler_addObserverBlock_forLifetimeOfObject___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a2 + 24);
  id v5 = (id)[*(id *)(a1 + 40) copy];
  v4 = (void *)MEMORY[0x192F975A0]();
  [v3 setObject:v4 forKey:*(void *)(a1 + 32)];
}

- (void)fireWithObjects:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__PPNotificationHandler_fireWithObjects___block_invoke;
  v7[3] = &unk_1E550F108;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __41__PPNotificationHandler_fireWithObjects___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(v3[4], "addObjectsFromArray:");
    id v5 = pp_default_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = *(void *)(a1 + 40);
      uint64_t v20 = [*(id *)(a1 + 32) count];
      uint64_t v21 = [v4[4] count];
      int v22 = 138412802;
      uint64_t v23 = v19;
      __int16 v24 = 2048;
      uint64_t v25 = v20;
      __int16 v26 = 2048;
      uint64_t v27 = v21;
      _os_log_debug_impl(&dword_18CAA6000, v5, OS_LOG_TYPE_DEBUG, "%@ added %tu objects. Queue now has %tu.", (uint8_t *)&v22, 0x20u);
    }
  }
  id v6 = pp_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    int v22 = 138412290;
    uint64_t v23 = v7;
    _os_log_impl(&dword_18CAA6000, v6, OS_LOG_TYPE_DEFAULT, "%@ is trying to fire", (uint8_t *)&v22, 0xCu);
  }

  if (*((unsigned char *)v4 + 8))
  {
    id v8 = pp_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v22 = 138412290;
      uint64_t v23 = v9;
      _os_log_impl(&dword_18CAA6000, v8, OS_LOG_TYPE_DEFAULT, "%@ delayedFiringInProgress was YES so doing nothing", (uint8_t *)&v22, 0xCu);
    }
  }
  else
  {
    id v10 = objc_opt_new();
    [v10 timeIntervalSince1970];
    double v12 = v11;

    double v13 = v12 - *((double *)v4 + 2);
    double v14 = *(double *)(*(void *)(a1 + 40) + 24);
    v15 = pp_default_log_handle();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v13 >= v14)
    {
      if (v16)
      {
        uint64_t v18 = *(void *)(a1 + 40);
        int v22 = 138412290;
        uint64_t v23 = v18;
        _os_log_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEFAULT, "%@ is firing immediately", (uint8_t *)&v22, 0xCu);
      }

      [*(id *)(a1 + 40) _executeBlocksWithGuardedData:v4];
    }
    else
    {
      if (v16)
      {
        uint64_t v17 = *(void *)(a1 + 40);
        int v22 = 138412290;
        uint64_t v23 = v17;
        _os_log_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEFAULT, "%@ waitSeconds has not elapsed, scheduling delayed execution", (uint8_t *)&v22, 0xCu);
      }

      *((unsigned char *)v4 + 8) = 1;
      [*(id *)(a1 + 40) _delayedExecutionAfterSeconds:*(double *)(*(void *)(a1 + 40) + 24) - v13];
    }
  }
}

- (void)_delayedExecutionAfterSeconds:(double)a3
{
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4F93B18];
  waiterQueue = self->_waiterQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PPNotificationHandler__delayedExecutionAfterSeconds___block_invoke;
  v7[3] = &unk_1E550F488;
  objc_copyWeak(&v8, &location);
  [v5 runAsyncOnQueue:waiterQueue afterDelaySeconds:v7 block:a3];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __55__PPNotificationHandler__delayedExecutionAfterSeconds___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((void *)WeakRetained + 1);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __55__PPNotificationHandler__delayedExecutionAfterSeconds___block_invoke_2;
    v4[3] = &unk_1E550F0E0;
    v4[4] = v2;
    [v3 runWithLockAcquired:v4];
  }
}

void __55__PPNotificationHandler__delayedExecutionAfterSeconds___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  id v4 = pp_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_18CAA6000, v4, OS_LOG_TYPE_DEFAULT, "%@ is done waiting to fire", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) _executeBlocksWithGuardedData:v3];
  v3[8] = 0;
}

- (void)_executeBlocksWithGuardedData:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  uint64_t v5 = (void *)MEMORY[0x192F97350]();
  int v6 = [v4[3] objectEnumerator];
  uint64_t v7 = [v6 allObjects];

  uint64_t v8 = pp_default_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = [v7 count];
    uint64_t v23 = [v4[4] count];
    *(_DWORD *)buf = 138412802;
    v30 = self;
    __int16 v31 = 2048;
    uint64_t v32 = v22;
    __int16 v33 = 2048;
    uint64_t v34 = v23;
    _os_log_debug_impl(&dword_18CAA6000, v8, OS_LOG_TYPE_DEBUG, "%@ is executing %tu blocks for %tu objects", buf, 0x20u);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x192F97350](v10);
        BOOL v16 = objc_msgSend(v4[4], "allObjects", (void)v24);
        (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v16);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      uint64_t v11 = v10;
    }
    while (v10);
  }

  uint64_t v17 = objc_opt_new();
  id v18 = v4[4];
  v4[4] = (id)v17;

  uint64_t v19 = pp_default_log_handle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v30 = self;
    _os_log_debug_impl(&dword_18CAA6000, v19, OS_LOG_TYPE_DEBUG, "%@ reset object buffer to an empty set", buf, 0xCu);
  }

  uint64_t v20 = objc_opt_new();
  [v20 timeIntervalSince1970];
  v4[2] = v21;
}

- (PPNotificationHandler)initWithName:(id)a3 waitSeconds:(double)a4
{
  id v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PPNotificationHandler;
  uint64_t v8 = [(PPNotificationHandler *)&v20 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    double v10 = 0.0;
    if (a4 >= 0.0) {
      double v10 = a4;
    }
    v9->_waitSeconds = v10;
    uint64_t v11 = (void *)MEMORY[0x1E4F93B18];
    id v12 = (id) [[NSString alloc] initWithFormat:@"PPNotificationHandler.%@.waiterQueue", v7];
    uint64_t v13 = objc_msgSend(v11, "autoreleasingSerialQueueWithLabel:qosClass:", objc_msgSend(v12, "UTF8String"), 9);
    waiterQueue = v9->_waiterQueue;
    v9->_waiterQueue = (OS_dispatch_queue *)v13;

    id v15 = objc_alloc(MEMORY[0x1E4F93B70]);
    BOOL v16 = objc_opt_new();
    uint64_t v17 = [v15 initWithGuardedData:v16];
    lock = v9->_lock;
    v9->_lock = (_PASLock *)v17;
  }
  return v9;
}

- (void)waitOnQueueToDrain
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  char v3 = 10;
  while (*((unsigned char *)v8 + 24))
  {
    if (!v3)
    {
      id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"PPNotificationHandlerWaitOnQueueToDrainTimeout" reason:@"PPNotificationHandler waitOnQueueToDrain timeout" userInfo:0];
      objc_exception_throw(v5);
    }
    usleep(0x186A0u);
    --v3;
    lock = self->_lock;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__PPNotificationHandler_TestHelpers__waitOnQueueToDrain__block_invoke;
    v6[3] = &unk_1E550F3B8;
    v6[4] = &v7;
    [(_PASLock *)lock runWithLockAcquired:v6];
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __56__PPNotificationHandler_TestHelpers__waitOnQueueToDrain__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 8);
  return result;
}

@end
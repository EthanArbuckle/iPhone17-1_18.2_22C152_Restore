@interface NPKWorkQueue
- (BOOL)performingWork;
- (BOOL)takeOutTransactions;
- (NPKWorkQueue)init;
- (NPKWorkQueue)initWithQueue:(id)a3;
- (NPKWorkQueue)initWithQueue:(id)a3 takeOutTransactions:(BOOL)a4;
- (NSMutableArray)remainingWork;
- (NSString)workQueueName;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)queue;
- (void)_onQueue_doWorkIfNecessary;
- (void)dealloc;
- (void)flush;
- (void)performWork:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setPerformingWork:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setRemainingWork:(id)a3;
- (void)setTakeOutTransactions:(BOOL)a3;
- (void)setWorkQueueName:(id)a3;
@end

@implementation NPKWorkQueue

- (NPKWorkQueue)init
{
  return [(NPKWorkQueue *)self initWithQueue:0];
}

- (NPKWorkQueue)initWithQueue:(id)a3
{
  return [(NPKWorkQueue *)self initWithQueue:a3 takeOutTransactions:0];
}

- (NPKWorkQueue)initWithQueue:(id)a3 takeOutTransactions:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NPKWorkQueue;
  v7 = [(NPKWorkQueue *)&v11 init];
  if (v7)
  {
    dispatch_queue_t v8 = dispatch_queue_create(0, 0);
    [(NPKWorkQueue *)v7 setQueue:v8];

    v9 = [MEMORY[0x263EFF980] array];
    [(NPKWorkQueue *)v7 setRemainingWork:v9];

    [(NPKWorkQueue *)v7 setCallbackQueue:v6];
    [(NPKWorkQueue *)v7 setTakeOutTransactions:v4];
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_remainingWork count])
  {
    v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        workQueueName = self->_workQueueName;
        uint64_t v7 = [(NSMutableArray *)self->_remainingWork count];
        *(_DWORD *)buf = 134218498;
        v10 = self;
        __int16 v11 = 2112;
        v12 = workQueueName;
        __int16 v13 = 2048;
        uint64_t v14 = v7;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: deallocating NPKWorkQueueItem:%p, %@ has %lu remaining work items.", buf, 0x20u);
      }
    }
    [(NSMutableArray *)self->_remainingWork enumerateObjectsUsingBlock:&__block_literal_global_22];
  }
  v8.receiver = self;
  v8.super_class = (Class)NPKWorkQueue;
  [(NPKWorkQueue *)&v8 dealloc];
}

void __23__NPKWorkQueue_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 transaction];
  [v2 invalidate];
}

- (void)_onQueue_doWorkIfNecessary
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (![(NPKWorkQueue *)self performingWork])
  {
    v3 = [(NPKWorkQueue *)self remainingWork];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      [(NPKWorkQueue *)self setPerformingWork:1];
      v5 = [(NPKWorkQueue *)self remainingWork];
      id v6 = [v5 firstObject];

      uint64_t v7 = [(NPKWorkQueue *)self remainingWork];
      [v7 removeObjectAtIndex:0];

      objc_super v8 = [v6 workBlock];
      v9 = [v6 transaction];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __42__NPKWorkQueue__onQueue_doWorkIfNecessary__block_invoke;
      v21[3] = &unk_2644D2E08;
      v21[4] = self;
      id v10 = v9;
      id v22 = v10;
      __int16 v11 = (void *)MEMORY[0x223C37380](v21);
      v12 = pk_Payment_log();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

      if (v13)
      {
        uint64_t v14 = pk_Payment_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [(NPKWorkQueue *)self workQueueName];
          *(_DWORD *)buf = 138412290;
          v24 = v15;
          _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Work queue %@: starting next work block", buf, 0xCu);
        }
      }
      v16 = [(NPKWorkQueue *)self callbackQueue];

      if (v16)
      {
        v17 = [(NPKWorkQueue *)self callbackQueue];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __42__NPKWorkQueue__onQueue_doWorkIfNecessary__block_invoke_6;
        v18[3] = &unk_2644D6100;
        v19 = v8;
        id v20 = v11;
        dispatch_async(v17, v18);
      }
      else
      {
        ((void (**)(void, void *))v8)[2](v8, v11);
      }
    }
  }
}

void __42__NPKWorkQueue__onQueue_doWorkIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    uint64_t v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [*(id *)(a1 + 32) workQueueName];
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Work queue %@: ended work block", buf, 0xCu);
    }
  }
  if (*(void *)(a1 + 40))
  {
    id v6 = pk_General_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      objc_super v8 = pk_General_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: ending XPC transaction for work", buf, 2u);
      }
    }
    [*(id *)(a1 + 40) invalidate];
  }
  v9 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__NPKWorkQueue__onQueue_doWorkIfNecessary__block_invoke_3;
  block[3] = &unk_2644D2910;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v9, block);
}

uint64_t __42__NPKWorkQueue__onQueue_doWorkIfNecessary__block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) performingWork] & 1) == 0)
  {
    id v2 = pk_General_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      uint64_t v4 = pk_General_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136446722;
        BOOL v7 = "-[NPKWorkQueue _onQueue_doWorkIfNecessary]_block_invoke";
        __int16 v8 = 2082;
        v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKWorkQueue.m";
        __int16 v10 = 2048;
        uint64_t v11 = 77;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: NPKWorkQueue was performing work, but somehow self.performingWork was NO)", (uint8_t *)&v6, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  [*(id *)(a1 + 32) setPerformingWork:0];
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_doWorkIfNecessary");
}

uint64_t __42__NPKWorkQueue__onQueue_doWorkIfNecessary__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)performWork:(id)a3
{
  id v4 = a3;
  if ([(NPKWorkQueue *)self takeOutTransactions])
  {
    v5 = pk_General_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      BOOL v7 = pk_General_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: taking out XPC transaction for work", buf, 2u);
      }
    }
    __int16 v8 = [NSString stringWithFormat:@"Work queue: %@ Item transaction", self->_workQueueName];
    v9 = +[NPKOSTransaction transactionWithName:v8];
  }
  else
  {
    v9 = 0;
  }
  __int16 v10 = [(NPKWorkQueue *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__NPKWorkQueue_performWork___block_invoke;
  block[3] = &unk_2644D3388;
  block[4] = self;
  id v14 = v9;
  id v15 = v4;
  id v11 = v4;
  id v12 = v9;
  dispatch_async(v10, block);
}

uint64_t __28__NPKWorkQueue_performWork___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remainingWork];
  BOOL v3 = +[NPKWorkQueueItem itemWithTransaction:*(void *)(a1 + 40) work:*(void *)(a1 + 48)];
  [v2 addObject:v3];

  id v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "_onQueue_doWorkIfNecessary");
}

- (void)flush
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      workQueueName = self->_workQueueName;
      *(_DWORD *)buf = 138412546;
      __int16 v10 = self;
      __int16 v11 = 2112;
      id v12 = workQueueName;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Work queue %@, %@: Requested to flush pending works", buf, 0x16u);
    }
  }
  BOOL v7 = [(NPKWorkQueue *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __21__NPKWorkQueue_flush__block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(v7, block);
}

void __21__NPKWorkQueue_flush__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) remainingWork];
  [v2 removeAllObjects];

  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(v6 + 16);
      int v8 = 138412546;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Work queue %@, %@: Flushed pending works", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (NSString)workQueueName
{
  return self->_workQueueName;
}

- (void)setWorkQueueName:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)remainingWork
{
  return self->_remainingWork;
}

- (void)setRemainingWork:(id)a3
{
}

- (BOOL)performingWork
{
  return self->_performingWork;
}

- (void)setPerformingWork:(BOOL)a3
{
  self->_performingWork = a3;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  self->_callbackQueue = (OS_dispatch_queue *)a3;
}

- (BOOL)takeOutTransactions
{
  return self->_takeOutTransactions;
}

- (void)setTakeOutTransactions:(BOOL)a3
{
  self->_takeOutTransactions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingWork, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_workQueueName, 0);
}

@end
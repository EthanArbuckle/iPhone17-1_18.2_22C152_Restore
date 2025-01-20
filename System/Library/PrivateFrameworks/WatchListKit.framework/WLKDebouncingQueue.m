@interface WLKDebouncingQueue
- (NSOperationQueue)queue;
- (WLKDebouncingQueue)init;
- (unsigned)delay;
- (void)addOperationWithBlock:(id)a3;
- (void)setDelay:(unsigned int)a3;
- (void)setQueue:(id)a3;
@end

@implementation WLKDebouncingQueue

- (WLKDebouncingQueue)init
{
  v9.receiver = self;
  v9.super_class = (Class)WLKDebouncingQueue;
  v2 = [(WLKDebouncingQueue *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_delay = 250000;
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    queue = v3->_queue;
    v3->_queue = v4;

    [(NSOperationQueue *)v3->_queue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v3->_queue setQualityOfService:-1];
    v6 = v3->_queue;
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"WLKDebouncingQueue-%p", v3);
    [(NSOperationQueue *)v6 setName:v7];
  }
  return v3;
}

- (void)addOperationWithBlock:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[WLKDebouncingQueue addOperationWithBlock:]();
  }
  v5 = v4;
  v6 = [(WLKDebouncingQueue *)self queue];
  [v6 cancelAllOperations];

  id v7 = objc_alloc_init(MEMORY[0x1E4F28B48]);
  objc_initWeak(&location, v7);
  objc_initWeak(&from, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__WLKDebouncingQueue_addOperationWithBlock___block_invoke;
  v10[3] = &unk_1E620A2E8;
  objc_copyWeak(&v12, &from);
  objc_copyWeak(&v13, &location);
  id v8 = v5;
  id v11 = v8;
  [v7 addExecutionBlock:v10];
  objc_super v9 = [(WLKDebouncingQueue *)self queue];
  [v9 addOperation:v7];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __44__WLKDebouncingQueue_addOperationWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    usleep([WeakRetained delay]);
    id v4 = objc_loadWeakRetained((id *)(a1 + 48));
    int v5 = [v4 isCancelled];

    v6 = WLKSystemLogObject();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        id v8 = objc_loadWeakRetained((id *)(a1 + 48));
        int v10 = 138412290;
        id v11 = v8;
        _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKDebouncingQueue - Debouncing op. %@", (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      if (v7)
      {
        id v9 = objc_loadWeakRetained((id *)(a1 + 48));
        int v10 = 138412290;
        id v11 = v9;
        _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKDebouncingQueue - Running op. %@", (uint8_t *)&v10, 0xCu);
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (unsigned)delay
{
  return self->_delay;
}

- (void)setDelay:(unsigned int)a3
{
  self->_delay = a3;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)addOperationWithBlock:.cold.1()
{
  __assert_rtn("-[WLKDebouncingQueue addOperationWithBlock:]", "WLKDebouncingQueue.m", 38, "block != nil");
}

@end
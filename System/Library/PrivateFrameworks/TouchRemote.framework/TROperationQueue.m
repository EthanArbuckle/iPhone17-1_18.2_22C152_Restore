@interface TROperationQueue
- (BOOL)isCancelled;
- (OS_dispatch_queue)cancellationQ;
- (TROperationQueue)init;
- (void)addOperation:(id)a3;
- (void)addOperationWithBlock:(id)a3;
- (void)addOperations:(id)a3 waitUntilFinished:(BOOL)a4;
- (void)invalidate;
- (void)setCancellationQ:(id)a3;
- (void)setCancelled:(BOOL)a3;
@end

@implementation TROperationQueue

- (TROperationQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)TROperationQueue;
  v2 = [(TROperationQueue *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.TROperationQueue.cancellationQ", MEMORY[0x263EF83A8]);
    cancellationQ = v2->_cancellationQ;
    v2->_cancellationQ = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)invalidate
{
  [(TROperationQueue *)self cancelAllOperations];
  cancellationQ = self->_cancellationQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__TROperationQueue_invalidate__block_invoke;
  block[3] = &unk_264220858;
  block[4] = self;
  dispatch_barrier_async(cancellationQ, block);
}

uint64_t __30__TROperationQueue_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCancelled:1];
  v2 = *(void **)(a1 + 32);
  return [v2 cancelAllOperations];
}

- (void)addOperation:(id)a3
{
  id v4 = a3;
  cancellationQ = self->_cancellationQ;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__TROperationQueue_addOperation___block_invoke;
  v7[3] = &unk_264220880;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(cancellationQ, v7);
}

id __33__TROperationQueue_addOperation___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isCancelled]) {
    [*(id *)(a1 + 40) cancel];
  }
  uint64_t v2 = *(void *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)TROperationQueue;
  return objc_msgSendSuper2(&v4, sel_addOperation_, v2);
}

- (void)addOperationWithBlock:(id)a3
{
  id v4 = a3;
  cancellationQ = self->_cancellationQ;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__TROperationQueue_addOperationWithBlock___block_invoke;
  v7[3] = &unk_2642208A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(cancellationQ, v7);
}

uint64_t __42__TROperationQueue_addOperationWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)TROperationQueue;
  objc_msgSendSuper2(&v4, sel_addOperationWithBlock_, v2);
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if (result) {
    return [*(id *)(a1 + 32) cancelAllOperations];
  }
  return result;
}

- (void)addOperations:(id)a3 waitUntilFinished:(BOOL)a4
{
  id v6 = a3;
  cancellationQ = self->_cancellationQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__TROperationQueue_addOperations_waitUntilFinished___block_invoke;
  block[3] = &unk_2642208D0;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_sync(cancellationQ, block);
}

id __52__TROperationQueue_addOperations_waitUntilFinished___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isCancelled])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v2 = *(id *)(a1 + 40);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v12;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v6++) cancel];
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 48);
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)TROperationQueue;
  return objc_msgSendSuper2(&v10, sel_addOperations_waitUntilFinished_, v7, v8);
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (OS_dispatch_queue)cancellationQ
{
  return self->_cancellationQ;
}

- (void)setCancellationQ:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface SSVOperation
- (BOOL)success;
- (NSError)error;
- (SSVOperation)init;
- (void)addChildRequest:(id)a3;
- (void)cancel;
- (void)dispatchAsync:(id)a3;
- (void)dispatchSync:(id)a3;
- (void)removeChildRequest:(id)a3;
- (void)runChildOperation:(id)a3;
- (void)setError:(id)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation SSVOperation

- (SSVOperation)init
{
  v9.receiver = self;
  v9.super_class = (Class)SSVOperation;
  v2 = [(SSVOperation *)&v9 init];
  if (v2)
  {
    id v3 = (id) [[NSString alloc] initWithFormat:@"com.apple.StoreServices.%@.%p", objc_opt_class(), v2];
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    v6 = v2->_serialQueue;
    v7 = dispatch_get_global_queue(0, 0);
    dispatch_set_target_queue(v6, v7);
  }
  return v2;
}

- (void)addChildRequest:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__SSVOperation_addChildRequest___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

uint64_t __32__SSVOperation_addChildRequest___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 256);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 256);
    *(void *)(v4 + 256) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 256);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

- (void)dispatchAsync:(id)a3
{
}

- (void)dispatchSync:(id)a3
{
}

- (void)removeChildRequest:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__SSVOperation_removeChildRequest___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

uint64_t __35__SSVOperation_removeChildRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 256) removeObjectIdenticalTo:*(void *)(a1 + 40)];
}

- (void)runChildOperation:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SSVOperation_runChildOperation___block_invoke;
  block[3] = &unk_1E5BA7018;
  block[4] = self;
  id v6 = v4;
  id v12 = v6;
  dispatch_async(serialQueue, block);
  [v6 main];

  v7 = self->_serialQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__SSVOperation_runChildOperation___block_invoke_2;
  v9[3] = &unk_1E5BA7018;
  v9[4] = self;
  id v8 = v6;
  id v10 = v8;
  dispatch_async(v7, v9);
}

void __34__SSVOperation_runChildOperation___block_invoke(uint64_t a1)
{
}

void __34__SSVOperation_runChildOperation___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(v1 + 248);
  if (v3 == v2)
  {
    *(void *)(v1 + 248) = 0;
  }
}

- (void)cancel
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__39;
  v24 = __Block_byref_object_dispose__39;
  id v25 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__39;
  serialQueue = self->_serialQueue;
  v18 = __Block_byref_object_dispose__39;
  id v19 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__SSVOperation_cancel__block_invoke;
  block[3] = &unk_1E5BABDB0;
  block[4] = self;
  void block[5] = &v20;
  block[6] = &v14;
  dispatch_sync(serialQueue, block);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = (id)v15[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) cancel];
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v26 count:16];
    }
    while (v5);
  }

  [(id)v21[5] cancel];
  v8.receiver = self;
  v8.super_class = (Class)SSVOperation;
  [(SSVOperation *)&v8 cancel];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
}

void __22__SSVOperation_cancel__block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 248));
  uint64_t v2 = [*(id *)(a1[4] + 256) copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[4];
  uint64_t v6 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = 0;

  uint64_t v7 = a1[4];
  objc_super v8 = *(void **)(v7 + 256);
  *(void *)(v7 + 256) = 0;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_childRequests, 0);
  objc_storeStrong((id *)&self->_childOperation, 0);
}

@end
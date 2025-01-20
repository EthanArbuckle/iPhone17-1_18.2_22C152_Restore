@interface SSObserver
+ (id)observerWithResultBlock:(id)a3;
+ (id)observerWithResultBlock:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5;
- (id)completionBlock;
- (id)failureBlock;
- (id)resultBlock;
- (void)_sendCompletionUsingQueue:(id)a3;
- (void)_sendFailure:(id)a3 usingQueue:(id)a4;
- (void)_sendResult:(id)a3 usingQueue:(id)a4;
- (void)setCompletionBlock:(id)a3;
- (void)setFailureBlock:(id)a3;
- (void)setResultBlock:(id)a3;
@end

@implementation SSObserver

+ (id)observerWithResultBlock:(id)a3
{
  return (id)[a1 observerWithResultBlock:a3 completionBlock:0 failureBlock:0];
}

+ (id)observerWithResultBlock:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init((Class)objc_opt_class());
  objc_sync_enter(v10);
  [v10 setCompletionBlock:v8];
  [v10 setFailureBlock:v9];
  [v10 setResultBlock:v7];
  objc_sync_exit(v10);

  return v10;
}

- (void)_sendCompletionUsingQueue:(id)a3
{
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(SSObserver *)v5 completionBlock];
  objc_sync_exit(v5);

  if (v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__SSObserver__sendCompletionUsingQueue___block_invoke;
    block[3] = &unk_1E5BA8EC0;
    id v8 = v6;
    dispatch_async(v4, block);
  }
}

uint64_t __40__SSObserver__sendCompletionUsingQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_sendFailure:(id)a3 usingQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SSObserver.m", 64, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  id v9 = self;
  objc_sync_enter(v9);
  id v10 = [(SSObserver *)v9 failureBlock];
  objc_sync_exit(v9);

  if (v10)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__SSObserver__sendFailure_usingQueue___block_invoke;
    block[3] = &unk_1E5BA7328;
    id v14 = v10;
    id v13 = v7;
    dispatch_async(v8, block);
  }
}

uint64_t __38__SSObserver__sendFailure_usingQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_sendResult:(id)a3 usingQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SSObserver.m", 81, @"Invalid parameter not satisfying: %@", @"result" object file lineNumber description];
  }
  id v9 = self;
  objc_sync_enter(v9);
  id v10 = [(SSObserver *)v9 resultBlock];
  objc_sync_exit(v9);

  if (v10)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__SSObserver__sendResult_usingQueue___block_invoke;
    block[3] = &unk_1E5BA7328;
    id v14 = v10;
    id v13 = v7;
    dispatch_async(v8, block);
  }
}

uint64_t __37__SSObserver__sendResult_usingQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)failureBlock
{
  return self->_failureBlock;
}

- (void)setFailureBlock:(id)a3
{
}

- (id)resultBlock
{
  return self->_resultBlock;
}

- (void)setResultBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultBlock, 0);
  objc_storeStrong(&self->_failureBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
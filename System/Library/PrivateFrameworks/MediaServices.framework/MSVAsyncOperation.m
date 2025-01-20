@interface MSVAsyncOperation
- (BOOL)_isExecuting;
- (BOOL)_isFinished;
- (BOOL)isAsynchronous;
- (BOOL)isConcurrent;
- (MSVAsyncOperation)init;
- (NSError)error;
- (OS_dispatch_queue)accessQueue;
- (void)_setExecuting:(BOOL)a3;
- (void)_setFinished:(BOOL)a3;
- (void)finish;
- (void)finishWithError:(id)a3;
- (void)setError:(id)a3;
- (void)start;
@end

@implementation MSVAsyncOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)_setFinished:(BOOL)a3
{
  v5 = [(MSVAsyncOperation *)self accessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__MSVAsyncOperation__setFinished___block_invoke;
  v6[3] = &unk_1E5ADA078;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

uint64_t __34__MSVAsyncOperation__setFinished___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 249) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)_isFinished
{
  v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(MSVAsyncOperation *)self accessQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__MSVAsyncOperation__isFinished__block_invoke;
  v5[3] = &unk_1E5ADAAC8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __32__MSVAsyncOperation__isFinished__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 249);
  return result;
}

- (void)_setExecuting:(BOOL)a3
{
  v5 = [(MSVAsyncOperation *)self accessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__MSVAsyncOperation__setExecuting___block_invoke;
  v6[3] = &unk_1E5ADA078;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

uint64_t __35__MSVAsyncOperation__setExecuting___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 248) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)_isExecuting
{
  v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(MSVAsyncOperation *)self accessQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__MSVAsyncOperation__isExecuting__block_invoke;
  v5[3] = &unk_1E5ADAAC8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __33__MSVAsyncOperation__isExecuting__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 248);
  return result;
}

- (void)setError:(id)a3
{
  id v4 = a3;
  v5 = [(MSVAsyncOperation *)self accessQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__MSVAsyncOperation_setError___block_invoke;
  v7[3] = &unk_1E5ADAA78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __30__MSVAsyncOperation_setError___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 256) = [*(id *)(a1 + 40) copy];
  return MEMORY[0x1F41817F8]();
}

- (NSError)error
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3124;
  v11 = __Block_byref_object_dispose__3125;
  id v12 = 0;
  v3 = [(MSVAsyncOperation *)self accessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__MSVAsyncOperation_error__block_invoke;
  v6[3] = &unk_1E5ADAAC8;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSError *)v4;
}

uint64_t __26__MSVAsyncOperation_error__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 256) copy];
  return MEMORY[0x1F41817F8]();
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_error);
  [(MSVAsyncOperation *)self willChangeValueForKey:v5];

  id v6 = NSStringFromSelector(sel_isFinished);
  [(MSVAsyncOperation *)self willChangeValueForKey:v6];

  uint64_t v7 = NSStringFromSelector(sel_isExecuting);
  [(MSVAsyncOperation *)self willChangeValueForKey:v7];

  [(MSVAsyncOperation *)self setError:v4];
  [(MSVAsyncOperation *)self _setExecuting:0];
  [(MSVAsyncOperation *)self _setFinished:1];
  id v8 = NSStringFromSelector(sel_error);
  [(MSVAsyncOperation *)self didChangeValueForKey:v8];

  uint64_t v9 = NSStringFromSelector(sel_isFinished);
  [(MSVAsyncOperation *)self didChangeValueForKey:v9];

  NSStringFromSelector(sel_isExecuting);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(MSVAsyncOperation *)self didChangeValueForKey:v10];
}

- (void)finish
{
}

- (void)start
{
  v3 = NSStringFromSelector(sel_isExecuting);
  [(MSVAsyncOperation *)self willChangeValueForKey:v3];

  [(MSVAsyncOperation *)self _setExecuting:1];
  id v4 = NSStringFromSelector(sel_isExecuting);
  [(MSVAsyncOperation *)self didChangeValueForKey:v4];

  [(MSVAsyncOperation *)self execute];
}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (MSVAsyncOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSVAsyncOperation;
  v2 = [(MSVAsyncOperation *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mediaservices.MSVAsyncOperation.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end
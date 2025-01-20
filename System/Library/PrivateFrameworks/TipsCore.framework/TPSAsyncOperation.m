@interface TPSAsyncOperation
- (BOOL)isAsynchronous;
- (BOOL)isCancelled;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (NSError)error;
- (TPSAsyncOperation)init;
- (id)preCompletionBlock;
- (void)cancel;
- (void)finishWithError:(id)a3;
- (void)lockExec:(id)a3;
- (void)setError:(id)a3;
- (void)setPreCompletionBlock:(id)a3;
- (void)start;
@end

@implementation TPSAsyncOperation

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_preCompletionBlock, 0);
}

- (void)cancel
{
  [(TPSAsyncOperation *)self willChangeValueForKey:@"isFinished"];
  [(TPSAsyncOperation *)self willChangeValueForKey:@"isExecuting"];
  [(TPSAsyncOperation *)self willChangeValueForKey:@"isCancelled"];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__TPSAsyncOperation_cancel__block_invoke;
  v3[3] = &unk_1E5906740;
  v3[4] = self;
  [(TPSAsyncOperation *)self lockExec:v3];
  [(TPSAsyncOperation *)self didChangeValueForKey:@"isCancelled"];
  [(TPSAsyncOperation *)self didChangeValueForKey:@"isExecuting"];
  [(TPSAsyncOperation *)self didChangeValueForKey:@"isFinished"];
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(TPSAsyncOperation *)self preCompletionBlock];

  if (v5)
  {
    v6 = [(TPSAsyncOperation *)self preCompletionBlock];
    v6[2]();
  }
  [(TPSAsyncOperation *)self willChangeValueForKey:@"isFinished"];
  [(TPSAsyncOperation *)self willChangeValueForKey:@"isExecuting"];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __37__TPSAsyncOperation_finishWithError___block_invoke;
  v11 = &unk_1E5906790;
  v12 = self;
  id v13 = v4;
  id v7 = v4;
  [(TPSAsyncOperation *)self lockExec:&v8];
  [(TPSAsyncOperation *)self didChangeValueForKey:@"isExecuting", v8, v9, v10, v11, v12];
  [(TPSAsyncOperation *)self didChangeValueForKey:@"isFinished"];
}

- (void)start
{
  if ([(TPSAsyncOperation *)self isCancelled])
  {
    [(TPSAsyncOperation *)self finishWithError:0];
  }
  else
  {
    [(TPSAsyncOperation *)self willChangeValueForKey:@"isExecuting"];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __26__TPSAsyncOperation_start__block_invoke;
    v3[3] = &unk_1E5906740;
    v3[4] = self;
    [(TPSAsyncOperation *)self lockExec:v3];
    [(TPSAsyncOperation *)self didChangeValueForKey:@"isExecuting"];
    [(TPSAsyncOperation *)self main];
  }
}

- (BOOL)isCancelled
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__TPSAsyncOperation_isCancelled__block_invoke;
  v4[3] = &unk_1E5906768;
  v4[4] = self;
  v4[5] = &v5;
  [(TPSAsyncOperation *)self lockExec:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isFinished
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__TPSAsyncOperation_isFinished__block_invoke;
  v4[3] = &unk_1E5906768;
  v4[4] = self;
  v4[5] = &v5;
  [(TPSAsyncOperation *)self lockExec:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isExecuting
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__TPSAsyncOperation_isExecuting__block_invoke;
  v4[3] = &unk_1E5906768;
  v4[4] = self;
  v4[5] = &v5;
  [(TPSAsyncOperation *)self lockExec:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)lockExec:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

uint64_t __32__TPSAsyncOperation_isExecuting__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 252);
  return result;
}

uint64_t __31__TPSAsyncOperation_isFinished__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 253);
  return result;
}

uint64_t __32__TPSAsyncOperation_isCancelled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 254);
  return result;
}

- (TPSAsyncOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)TPSAsyncOperation;
  result = [(TPSAsyncOperation *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

uint64_t __26__TPSAsyncOperation_start__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 252) = 1;
  return result;
}

void __37__TPSAsyncOperation_finishWithError___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 252) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 253) = 1;
}

- (id)preCompletionBlock
{
  return self->_preCompletionBlock;
}

uint64_t __27__TPSAsyncOperation_cancel__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 252) = 0;
  *(unsigned char *)(*(void *)(result + 32) + 253) = 1;
  *(unsigned char *)(*(void *)(result + 32) + 254) = 1;
  return result;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)setPreCompletionBlock:(id)a3
{
}

- (void)setError:(id)a3
{
}

@end
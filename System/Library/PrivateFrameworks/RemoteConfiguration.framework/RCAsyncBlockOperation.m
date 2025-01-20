@interface RCAsyncBlockOperation
+ (id)asyncBlockOperationWithBlock:(id)a3;
+ (id)asyncBlockOperationWithMainThreadBlock:(id)a3;
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (RCAsyncBlockOperation)init;
- (RCAsyncBlockOperation)initWithBlock:(id)a3;
- (id)block;
- (void)start;
@end

@implementation RCAsyncBlockOperation

+ (id)asyncBlockOperationWithBlock:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBlock:v3];

  return v4;
}

+ (id)asyncBlockOperationWithMainThreadBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__RCAsyncBlockOperation_asyncBlockOperationWithMainThreadBlock___block_invoke;
  v8[3] = &unk_1E5B76980;
  id v9 = v4;
  id v5 = v4;
  v6 = [a1 asyncBlockOperationWithBlock:v8];

  return v6;
}

void __64__RCAsyncBlockOperation_asyncBlockOperationWithMainThreadBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__RCAsyncBlockOperation_asyncBlockOperationWithMainThreadBlock___block_invoke_2;
  v5[3] = &unk_1E5B765F0;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  RCPerformBlockOnMainThread(v5);
}

uint64_t __64__RCAsyncBlockOperation_asyncBlockOperationWithMainThreadBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (RCAsyncBlockOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[RCAsyncBlockOperation init]";
    __int16 v9 = 2080;
    v10 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Utilities/RCAsyncBlockOperation.m";
    __int16 v11 = 1024;
    int v12 = 38;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[RCAsyncBlockOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (RCAsyncBlockOperation)initWithBlock:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCAsyncBlockOperation initWithBlock:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)RCAsyncBlockOperation;
  id v5 = [(RCAsyncBlockOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)start
{
  if ([(RCAsyncBlockOperation *)self isCancelled])
  {
    [(RCAsyncBlockOperation *)self willChangeValueForKey:@"isFinished"];
    self->_finished = 1;
    [(RCAsyncBlockOperation *)self didChangeValueForKey:@"isFinished"];
  }
  else
  {
    [(RCAsyncBlockOperation *)self willChangeValueForKey:@"isExecuting"];
    self->_executing = 1;
    id v3 = (void *)MEMORY[0x1A6261E80]([(RCAsyncBlockOperation *)self didChangeValueForKey:@"isExecuting"]);
    id v4 = [(RCAsyncBlockOperation *)self block];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __30__RCAsyncBlockOperation_start__block_invoke;
    v5[3] = &unk_1E5B76100;
    void v5[4] = self;
    ((void (**)(void, void *))v4)[2](v4, v5);
  }
}

uint64_t __30__RCAsyncBlockOperation_start__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"isExecuting"];
  *(unsigned char *)(*(void *)(a1 + 32) + 248) = 0;
  [*(id *)(a1 + 32) didChangeValueForKey:@"isExecuting"];
  [*(id *)(a1 + 32) willChangeValueForKey:@"isFinished"];
  *(unsigned char *)(*(void *)(a1 + 32) + 249) = 1;
  v2 = *(void **)(a1 + 32);

  return [v2 didChangeValueForKey:@"isFinished"];
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
}

- (void)initWithBlock:.cold.1()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "block");
  *(_DWORD *)buf = 136315906;
  v2 = "-[RCAsyncBlockOperation initWithBlock:]";
  __int16 v3 = 2080;
  id v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Utilities/RCAsyncBlockOperation.m";
  __int16 v5 = 1024;
  int v6 = 43;
  __int16 v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);
}

@end
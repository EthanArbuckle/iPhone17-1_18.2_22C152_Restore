@interface FCAsyncBlockOperation
+ (id)asyncBlockOperationWithBlock:(id)a3;
+ (id)asyncBlockOperationWithMainThreadBlock:(id)a3;
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (FCAsyncBlockOperation)init;
- (FCAsyncBlockOperation)initWithBlock:(id)a3;
- (id)block;
- (void)start;
@end

@implementation FCAsyncBlockOperation

- (BOOL)isExecuting
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_executing);
  return v2 & 1;
}

- (BOOL)isFinished
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_finished);
  return v2 & 1;
}

- (void).cxx_destruct
{
}

uint64_t __30__FCAsyncBlockOperation_start__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"isExecuting"];
  atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 248));
  [*(id *)(a1 + 32) didChangeValueForKey:@"isExecuting"];
  [*(id *)(a1 + 32) willChangeValueForKey:@"isFinished"];
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 249));
  unsigned __int8 v2 = *(void **)(a1 + 32);
  return [v2 didChangeValueForKey:@"isFinished"];
}

+ (id)asyncBlockOperationWithBlock:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBlock:v3];

  return v4;
}

- (FCAsyncBlockOperation)initWithBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "block");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCAsyncBlockOperation initWithBlock:]";
    __int16 v13 = 2080;
    v14 = "FCAsyncBlockOperation.m";
    __int16 v15 = 1024;
    int v16 = 45;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v10.receiver = self;
  v10.super_class = (Class)FCAsyncBlockOperation;
  v5 = [(FCAsyncBlockOperation *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

- (void)start
{
  if ([(FCAsyncBlockOperation *)self isCancelled])
  {
    [(FCAsyncBlockOperation *)self willChangeValueForKey:@"isFinished"];
    atomic_store(1u, (unsigned __int8 *)&self->_finished);
    [(FCAsyncBlockOperation *)self didChangeValueForKey:@"isFinished"];
  }
  else
  {
    [(FCAsyncBlockOperation *)self willChangeValueForKey:@"isExecuting"];
    atomic_store(1u, (unsigned __int8 *)&self->_executing);
    id v3 = (void *)MEMORY[0x1A6260FD0]([(FCAsyncBlockOperation *)self didChangeValueForKey:@"isExecuting"]);
    id v4 = [(FCAsyncBlockOperation *)self block];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __30__FCAsyncBlockOperation_start__block_invoke;
    v5[3] = &unk_1E5B4C018;
    v5[4] = self;
    ((void (**)(void, void *))v4)[2](v4, v5);
  }
}

- (id)block
{
  return self->_block;
}

+ (id)asyncBlockOperationWithMainThreadBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__FCAsyncBlockOperation_asyncBlockOperationWithMainThreadBlock___block_invoke;
  v8[3] = &unk_1E5B4F168;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [a1 asyncBlockOperationWithBlock:v8];

  return v6;
}

void __64__FCAsyncBlockOperation_asyncBlockOperationWithMainThreadBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__FCAsyncBlockOperation_asyncBlockOperationWithMainThreadBlock___block_invoke_2;
  v5[3] = &unk_1E5B4E128;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  FCPerformBlockOnMainThread(v5);
}

uint64_t __64__FCAsyncBlockOperation_asyncBlockOperationWithMainThreadBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (FCAsyncBlockOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    unsigned __int8 v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCAsyncBlockOperation init]";
    __int16 v9 = 2080;
    objc_super v10 = "FCAsyncBlockOperation.m";
    __int16 v11 = 1024;
    int v12 = 40;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCAsyncBlockOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)isAsynchronous
{
  return 1;
}

@end
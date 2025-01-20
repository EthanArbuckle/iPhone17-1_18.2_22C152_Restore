@interface RCAsyncOnceOperation
- (BOOL)finished;
- (BOOL)finishedExecuting;
- (BOOL)finishedExecutingWithFailure;
- (BOOL)succeeded;
- (OS_dispatch_group)activeGroup;
- (RCAsyncOnceOperation)initWithBlock:(id)a3;
- (RCAsyncOnceOperation)initWithTarget:(id)a3 selector:(SEL)a4;
- (RCMutexLock)lock;
- (RCOperationCanceling)activeOperation;
- (id)executeWithCompletionHandler:(id)a3;
- (id)workBlock;
- (int64_t)relativePriority;
- (unint64_t)interest;
- (void)setActiveGroup:(id)a3;
- (void)setActiveOperation:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setInterest:(unint64_t)a3;
- (void)setLock:(id)a3;
- (void)setRelativePriority:(int64_t)a3;
- (void)setSucceeded:(BOOL)a3;
- (void)setWorkBlock:(id)a3;
@end

@implementation RCAsyncOnceOperation

- (RCAsyncOnceOperation)initWithBlock:(id)a3
{
  id v4 = a3;
  v5 = [(RCAsyncOnceOperation *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id workBlock = v5->_workBlock;
    v5->_id workBlock = (id)v6;

    v8 = objc_alloc_init(RCMutexLock);
    lock = v5->_lock;
    v5->_lock = v8;
  }
  return v5;
}

- (RCAsyncOnceOperation)initWithTarget:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  objc_initWeak(&location, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__RCAsyncOnceOperation_initWithTarget_selector___block_invoke;
  v10[3] = &unk_1E5B761C8;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a4;
  v7 = (void *)MEMORY[0x1A6262080](v10);
  v8 = [(RCAsyncOnceOperation *)self initWithBlock:v7];

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

  return v8;
}

id __48__RCAsyncOnceOperation_initWithTarget_selector___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = ((void (*)(id, void, void (**)(id, void)))[WeakRetained methodForSelector:*(void *)(a1 + 40)])(WeakRetained, *(void *)(a1 + 40), v3);
  }
  else
  {
    v3[2](v3, 0);
    id v6 = 0;
  }

  return v6;
}

- (id)executeWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(RCMutexLock *)self->_lock lock];
  if ([(RCAsyncOnceOperation *)self finished])
  {
    [(RCMutexLock *)self->_lock unlock];
    v5 = 0;
  }
  else
  {
    if (![(RCAsyncOnceOperation *)self interest])
    {
      id v6 = [(RCAsyncOnceOperation *)self activeGroup];

      if (v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[RCAsyncOnceOperation executeWithCompletionHandler:]();
      }
      v7 = [(RCAsyncOnceOperation *)self activeOperation];

      if (v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[RCAsyncOnceOperation executeWithCompletionHandler:]();
      }
      v8 = dispatch_group_create();
      dispatch_group_enter(v8);
      [(RCAsyncOnceOperation *)self setActiveGroup:v8];
      v9 = [(RCAsyncOnceOperation *)self workBlock];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __53__RCAsyncOnceOperation_executeWithCompletionHandler___block_invoke;
      v18[3] = &unk_1E5B761F0;
      v18[4] = self;
      v19 = v8;
      v10 = (void (*)(void *, void *))v9[2];
      v11 = v8;
      v12 = v10(v9, v18);
      [(RCAsyncOnceOperation *)self setActiveOperation:v12];

      int64_t v13 = [(RCAsyncOnceOperation *)self relativePriority];
      v14 = [(RCAsyncOnceOperation *)self activeOperation];
      [v14 setRelativePriority:v13];
    }
    [(RCAsyncOnceOperation *)self setInterest:[(RCAsyncOnceOperation *)self interest] + 1];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__RCAsyncOnceOperation_executeWithCompletionHandler___block_invoke_2;
    v17[3] = &unk_1E5B76100;
    v17[4] = self;
    v5 = +[RCCancelHandler cancelHandlerWithBlock:v17];
    v15 = [(RCAsyncOnceOperation *)self activeGroup];
    [(RCMutexLock *)self->_lock unlock];
    if (v15)
    {
      dispatch_group_notify(v15, MEMORY[0x1E4F14428], v4);

      goto LABEL_14;
    }
  }
  v4[2](v4);
LABEL_14:

  return v5;
}

void __53__RCAsyncOnceOperation_executeWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 56) lock];
  id v4 = [*(id *)(a1 + 32) activeGroup];
  v5 = *(void **)(a1 + 40);

  if (v4 == v5)
  {
    [*(id *)(a1 + 32) setFinished:1];
    [*(id *)(a1 + 32) setSucceeded:a2];
    [*(id *)(a1 + 32) setInterest:0];
    [*(id *)(a1 + 32) setActiveGroup:0];
    [*(id *)(a1 + 32) setActiveOperation:0];
    [*(id *)(a1 + 32) setWorkBlock:0];
  }
  [*(id *)(*(void *)(a1 + 32) + 56) unlock];
  id v6 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v6);
}

uint64_t __53__RCAsyncOnceOperation_executeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) lock];
  objc_msgSend(*(id *)(a1 + 32), "setInterest:", objc_msgSend(*(id *)(a1 + 32), "interest") - 1);
  if (![*(id *)(a1 + 32) interest])
  {
    [*(id *)(a1 + 32) setActiveGroup:0];
    v2 = [*(id *)(a1 + 32) activeOperation];
    [v2 cancel];

    [*(id *)(a1 + 32) setActiveOperation:0];
  }
  v3 = *(void **)(*(void *)(a1 + 32) + 56);

  return [v3 unlock];
}

- (BOOL)finishedExecuting
{
  [(RCMutexLock *)self->_lock lock];
  BOOL v3 = [(RCAsyncOnceOperation *)self finished];
  [(RCMutexLock *)self->_lock unlock];
  return v3;
}

- (BOOL)finishedExecutingWithFailure
{
  [(RCMutexLock *)self->_lock lock];
  if ([(RCAsyncOnceOperation *)self finished]) {
    BOOL v3 = ![(RCAsyncOnceOperation *)self succeeded];
  }
  else {
    LOBYTE(v3) = 0;
  }
  [(RCMutexLock *)self->_lock unlock];
  return v3;
}

- (void)setRelativePriority:(int64_t)a3
{
  [(RCMutexLock *)self->_lock lock];
  self->_relativePriority = a3;
  v5 = [(RCAsyncOnceOperation *)self activeOperation];
  [v5 setRelativePriority:a3];

  lock = self->_lock;

  [(RCMutexLock *)lock unlock];
}

- (id)workBlock
{
  return self->_workBlock;
}

- (void)setWorkBlock:(id)a3
{
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (void)setSucceeded:(BOOL)a3
{
  self->_succeeded = a3;
}

- (unint64_t)interest
{
  return self->_interest;
}

- (void)setInterest:(unint64_t)a3
{
  self->_interest = a3;
}

- (OS_dispatch_group)activeGroup
{
  return self->_activeGroup;
}

- (void)setActiveGroup:(id)a3
{
}

- (RCOperationCanceling)activeOperation
{
  return self->_activeOperation;
}

- (void)setActiveOperation:(id)a3
{
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (RCMutexLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_activeOperation, 0);
  objc_storeStrong((id *)&self->_activeGroup, 0);

  objc_storeStrong(&self->_workBlock, 0);
}

- (void)executeWithCompletionHandler:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[[NSString alloc] initWithFormat:@"already have an active operation"];
  int v1 = 136315906;
  v2 = "-[RCAsyncOnceOperation executeWithCompletionHandler:]";
  __int16 v3 = 2080;
  id v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Operations/RCOnce.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

- (void)executeWithCompletionHandler:.cold.2()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[[NSString alloc] initWithFormat:@"already have an active group"];
  int v1 = 136315906;
  v2 = "-[RCAsyncOnceOperation executeWithCompletionHandler:]";
  __int16 v3 = 2080;
  id v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Operations/RCOnce.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

@end
@interface RCBoostableOperationThrottler
- (BOOL)suspended;
- (BOOL)workPending;
- (OS_dispatch_queue)serialWorkQueue;
- (RCBoostableOperationThrottler)init;
- (RCBoostableOperationThrottler)initWithDelegate:(id)a3;
- (RCOperationThrottlerDelegate)delegate;
- (RCUnfairLock)workPendingLock;
- (void)setDelegate:(id)a3;
- (void)setSerialWorkQueue:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setWorkPending:(BOOL)a3;
- (void)suspended;
- (void)tickle;
- (void)tickleWithCompletion:(id)a3;
- (void)tickleWithQualityOfService:(int64_t)a3;
- (void)tickleWithQualityOfService:(int64_t)a3 completion:(id)a4;
@end

@implementation RCBoostableOperationThrottler

- (RCBoostableOperationThrottler)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[RCBoostableOperationThrottler init]";
    __int16 v9 = 2080;
    v10 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Operations/RCOperationThrottler.m";
    __int16 v11 = 1024;
    int v12 = 267;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[RCBoostableOperationThrottler init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (RCBoostableOperationThrottler)initWithDelegate:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCBoostableOperationThrottler initWithDelegate:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)RCBoostableOperationThrottler;
  v5 = [(RCBoostableOperationThrottler *)&v13 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = [[RCUnfairLock alloc] initWithOptions:1];
    workPendingLock = v6->_workPendingLock;
    v6->_workPendingLock = v7;

    __int16 v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("RCBoostableOperationThrottler.serial", v9);
    serialWorkQueue = v6->_serialWorkQueue;
    v6->_serialWorkQueue = (OS_dispatch_queue *)v10;
  }
  return v6;
}

- (void)tickleWithQualityOfService:(int64_t)a3
{
}

- (void)tickleWithQualityOfService:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [(RCBoostableOperationThrottler *)self workPendingLock];
  [v7 lock];

  if ([(RCBoostableOperationThrottler *)self workPending])
  {
    v8 = [(RCBoostableOperationThrottler *)self workPendingLock];
    [v8 unlock];
  }
  else
  {
    [(RCBoostableOperationThrottler *)self setWorkPending:1];
    __int16 v9 = [(RCBoostableOperationThrottler *)self workPendingLock];
    [v9 unlock];

    dispatch_queue_t v10 = [(RCBoostableOperationThrottler *)self delegate];
    objc_initWeak(&location, v10);

    __int16 v11 = [(RCBoostableOperationThrottler *)self serialWorkQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __71__RCBoostableOperationThrottler_tickleWithQualityOfService_completion___block_invoke;
    v15[3] = &unk_1E5B76A48;
    v15[4] = self;
    objc_copyWeak(&v16, &location);
    RCDispatchAsyncWithQualityOfService(v11, a3, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  int v12 = [(RCBoostableOperationThrottler *)self serialWorkQueue];
  objc_super v13 = v12;
  if (v6) {
    v14 = v6;
  }
  else {
    v14 = &__block_literal_global_1;
  }
  RCDispatchAsyncWithQualityOfService(v12, a3, v14);
}

void __71__RCBoostableOperationThrottler_tickleWithQualityOfService_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) workPendingLock];
  [v2 lock];

  [*(id *)(a1 + 32) setWorkPending:0];
  v3 = [*(id *)(a1 + 32) workPendingLock];
  [v3 unlock];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__RCBoostableOperationThrottler_tickleWithQualityOfService_completion___block_invoke_2;
  v5[3] = &unk_1E5B76A20;
  v5[4] = *(void *)(a1 + 32);
  RCPerformIfNonNil(WeakRetained, v5);
}

void __71__RCBoostableOperationThrottler_tickleWithQualityOfService_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v3 operationThrottlerPerformOperation:*(void *)(a1 + 32)];
  }
  else if (objc_opt_respondsToSelector())
  {
    id v4 = [*(id *)(a1 + 32) serialWorkQueue];
    dispatch_suspend(v4);

    objc_msgSend(v3, "operationThrottler:performAsyncOperationWithCompletion:");
  }
}

void __71__RCBoostableOperationThrottler_tickleWithQualityOfService_completion___block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) serialWorkQueue];
  dispatch_resume(v1);
}

- (void)tickle
{
}

- (void)tickleWithCompletion:(id)a3
{
}

- (BOOL)suspended
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCBoostableOperationThrottler suspended]();
  }
  return 0;
}

- (void)setSuspended:(BOOL)a3
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCBoostableOperationThrottler setSuspended:]();
  }
}

- (RCOperationThrottlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCOperationThrottlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)serialWorkQueue
{
  return self->_serialWorkQueue;
}

- (void)setSerialWorkQueue:(id)a3
{
}

- (BOOL)workPending
{
  return self->_workPending;
}

- (void)setWorkPending:(BOOL)a3
{
  self->_workPending = a3;
}

- (RCUnfairLock)workPendingLock
{
  return self->_workPendingLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workPendingLock, 0);
  objc_storeStrong((id *)&self->_serialWorkQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"delegate != nil", v6, 2u);
}

- (void)suspended
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[[NSString alloc] initWithFormat:@"suspending a boostable operation throttler is not yet supported"];
  int v1 = 136315906;
  int v2 = "-[RCBoostableOperationThrottler suspended]";
  __int16 v3 = 2080;
  int v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Operations/RCOperationThrottler.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

- (void)setSuspended:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[[NSString alloc] initWithFormat:@"suspending a boostable operation throttler is not yet supported"];
  int v1 = 136315906;
  int v2 = "-[RCBoostableOperationThrottler setSuspended:]";
  __int16 v3 = 2080;
  int v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Operations/RCOperationThrottler.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

@end
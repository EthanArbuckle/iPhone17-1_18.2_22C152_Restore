@interface RCTimedOperationThrottler
- (BOOL)suspended;
- (RCOperationThrottler)operationThrottler;
- (RCOperationThrottlerDelegate)delegate;
- (RCTimedOperationThrottler)init;
- (RCTimedOperationThrottler)initWithDelegate:(id)a3;
- (double)cooldownTime;
- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4;
- (void)setCooldownTime:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setOperationThrottler:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)tickle;
- (void)tickleWithCompletion:(id)a3;
@end

@implementation RCTimedOperationThrottler

- (void)setCooldownTime:(double)a3
{
  self->_cooldownTime = a3;
}

- (RCTimedOperationThrottler)initWithDelegate:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCTimedOperationThrottler initWithDelegate:]();
  }
  v10.receiver = self;
  v10.super_class = (Class)RCTimedOperationThrottler;
  v5 = [(RCTimedOperationThrottler *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = [[RCOperationThrottler alloc] initWithDelegate:v6];
    operationThrottler = v6->_operationThrottler;
    v6->_operationThrottler = v7;
  }
  return v6;
}

- (RCTimedOperationThrottler)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[RCTimedOperationThrottler init]";
    __int16 v9 = 2080;
    objc_super v10 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Operations/RCOperationThrottler.m";
    __int16 v11 = 1024;
    int v12 = 188;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[RCTimedOperationThrottler init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)tickle
{
  id v2 = [(RCTimedOperationThrottler *)self operationThrottler];
  [v2 tickle];
}

- (void)tickleWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(RCTimedOperationThrottler *)self operationThrottler];
  [v5 tickleWithCompletion:v4];
}

- (BOOL)suspended
{
  id v2 = [(RCTimedOperationThrottler *)self operationThrottler];
  char v3 = [v2 suspended];

  return v3;
}

- (void)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(RCTimedOperationThrottler *)self operationThrottler];
  [v4 setSuspended:v3];
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  id v5 = a4;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  __int16 v11 = __84__RCTimedOperationThrottler_operationThrottler_performAsyncOperationWithCompletion___block_invoke;
  int v12 = &unk_1E5B75FF8;
  __int16 v13 = self;
  id v6 = v5;
  id v14 = v6;
  v7 = (void (**)(void))MEMORY[0x1A6262080](&v9);
  v8 = [(RCTimedOperationThrottler *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v8 operationThrottlerPerformOperation:self];
LABEL_5:
    v7[2](v7);
    goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_5;
  }
  [v8 operationThrottler:self performAsyncOperationWithCompletion:v7];
LABEL_6:
}

void __84__RCTimedOperationThrottler_operationThrottler_performAsyncOperationWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cooldownTime];
  dispatch_time_t v3 = dispatch_time(0, (uint64_t)(v2 * 1000000000.0));
  id v4 = RCDispatchQueueForQualityOfService(9);
  dispatch_after(v3, v4, *(dispatch_block_t *)(a1 + 40));
}

- (double)cooldownTime
{
  return self->_cooldownTime;
}

- (RCOperationThrottler)operationThrottler
{
  return self->_operationThrottler;
}

- (void)setOperationThrottler:(id)a3
{
}

- (RCOperationThrottlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCOperationThrottlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_operationThrottler, 0);
}

- (void)initWithDelegate:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"delegate", v6, 2u);
}

@end
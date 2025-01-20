@interface FCTimedOperationThrottler
- (BOOL)suspended;
- (FCOperationThrottler)operationThrottler;
- (FCOperationThrottlerDelegate)delegate;
- (FCTimedOperationThrottler)init;
- (FCTimedOperationThrottler)initWithDelegate:(id)a3;
- (double)cooldownTime;
- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4;
- (void)setCooldownTime:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setOperationThrottler:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)tickle;
- (void)tickleWithCompletion:(id)a3;
@end

@implementation FCTimedOperationThrottler

- (void)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(FCTimedOperationThrottler *)self operationThrottler];
  [v4 setSuspended:v3];
}

- (FCOperationThrottler)operationThrottler
{
  return self->_operationThrottler;
}

- (void)setCooldownTime:(double)a3
{
  self->_cooldownTime = a3;
}

- (FCTimedOperationThrottler)initWithDelegate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "delegate");
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCTimedOperationThrottler initWithDelegate:]";
    __int16 v14 = 2080;
    v15 = "FCOperationThrottler.m";
    __int16 v16 = 1024;
    int v17 = 194;
    __int16 v18 = 2114;
    v19 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v11.receiver = self;
  v11.super_class = (Class)FCTimedOperationThrottler;
  v5 = [(FCTimedOperationThrottler *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = [[FCOperationThrottler alloc] initWithDelegate:v6];
    operationThrottler = v6->_operationThrottler;
    v6->_operationThrottler = v7;
  }
  return v6;
}

- (void)tickle
{
  id v2 = [(FCTimedOperationThrottler *)self operationThrottler];
  [v2 tickle];
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  id v5 = a4;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  objc_super v11 = __84__FCTimedOperationThrottler_operationThrottler_performAsyncOperationWithCompletion___block_invoke;
  v12 = &unk_1E5B4CC80;
  v13 = self;
  id v6 = v5;
  id v14 = v6;
  v7 = (void (**)(void))_Block_copy(&v9);
  v8 = [(FCTimedOperationThrottler *)self delegate];
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

void __84__FCTimedOperationThrottler_operationThrottler_performAsyncOperationWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cooldownTime];
  dispatch_time_t v3 = dispatch_time(0, (uint64_t)(v2 * 1000000000.0));
  id v4 = dispatch_get_global_queue(9, 0);
  dispatch_after(v3, v4, *(dispatch_block_t *)(a1 + 40));
}

- (FCOperationThrottlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FCOperationThrottlerDelegate *)WeakRetained;
}

- (double)cooldownTime
{
  return self->_cooldownTime;
}

- (FCTimedOperationThrottler)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    double v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCTimedOperationThrottler init]";
    __int16 v9 = 2080;
    uint64_t v10 = "FCOperationThrottler.m";
    __int16 v11 = 1024;
    int v12 = 189;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  dispatch_time_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCTimedOperationThrottler init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)tickleWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FCTimedOperationThrottler *)self operationThrottler];
  [v5 tickleWithCompletion:v4];
}

- (BOOL)suspended
{
  double v2 = [(FCTimedOperationThrottler *)self operationThrottler];
  char v3 = [v2 suspended];

  return v3;
}

- (void)setOperationThrottler:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_operationThrottler, 0);
}

@end
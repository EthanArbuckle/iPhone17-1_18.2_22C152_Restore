@interface SCKTimedOperationThrottler
- (BOOL)suspended;
- (SCKOperationThrottler)operationThrottler;
- (SCKOperationThrottlerDelegate)delegate;
- (SCKTimedOperationThrottler)initWithDelegate:(id)a3;
- (double)cooldownTime;
- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4;
- (void)setCooldownTime:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setOperationThrottler:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)tickle;
- (void)tickleWithCompletion:(id)a3;
@end

@implementation SCKTimedOperationThrottler

- (SCKTimedOperationThrottler)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SCKTimedOperationThrottler;
  v5 = [(SCKTimedOperationThrottler *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = [[SCKOperationThrottler alloc] initWithDelegate:v6];
    operationThrottler = v6->_operationThrottler;
    v6->_operationThrottler = v7;
  }
  return v6;
}

- (void)tickle
{
  id v2 = [(SCKTimedOperationThrottler *)self operationThrottler];
  [v2 tickle];
}

- (void)tickleWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SCKTimedOperationThrottler *)self operationThrottler];
  [v5 tickleWithCompletion:v4];
}

- (BOOL)suspended
{
  id v2 = [(SCKTimedOperationThrottler *)self operationThrottler];
  char v3 = [v2 suspended];

  return v3;
}

- (void)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SCKTimedOperationThrottler *)self operationThrottler];
  [v4 setSuspended:v3];
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  id v5 = a4;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __85__SCKTimedOperationThrottler_operationThrottler_performAsyncOperationWithCompletion___block_invoke;
  v12 = &unk_26467D620;
  v13 = self;
  id v6 = v5;
  id v14 = v6;
  v7 = (void (**)(void))MEMORY[0x223CABDA0](&v9);
  v8 = [(SCKTimedOperationThrottler *)self delegate];
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

void __85__SCKTimedOperationThrottler_operationThrottler_performAsyncOperationWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cooldownTime];
  dispatch_time_t v3 = dispatch_time(0, (uint64_t)(v2 * 1000000000.0));
  id v4 = dispatch_get_global_queue(9, 0);
  dispatch_after(v3, v4, *(dispatch_block_t *)(a1 + 40));
}

- (double)cooldownTime
{
  return self->_cooldownTime;
}

- (void)setCooldownTime:(double)a3
{
  self->_cooldownTime = a3;
}

- (SCKOperationThrottler)operationThrottler
{
  return self->_operationThrottler;
}

- (void)setOperationThrottler:(id)a3
{
}

- (SCKOperationThrottlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCKOperationThrottlerDelegate *)WeakRetained;
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
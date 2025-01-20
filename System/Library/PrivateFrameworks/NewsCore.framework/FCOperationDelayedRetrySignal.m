@interface FCOperationDelayedRetrySignal
- (FCOperationDelayedRetrySignal)initWithDelay:(double)a3;
- (NSString)description;
- (void)onQueue:(id)a3 signal:(id)a4;
@end

@implementation FCOperationDelayedRetrySignal

- (FCOperationDelayedRetrySignal)initWithDelay:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FCOperationDelayedRetrySignal;
  v4 = [(FCOperationDelayedRetrySignal *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_delay = a3;
    v4->_signalTime = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  }
  return v5;
}

- (void)onQueue:(id)a3 signal:(id)a4
{
  id v6 = a4;
  dispatch_time_t signalTime = self->_signalTime;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__FCOperationDelayedRetrySignal_onQueue_signal___block_invoke;
  block[3] = &unk_1E5B4CA88;
  id v10 = v6;
  id v8 = v6;
  dispatch_after(signalTime, (dispatch_queue_t)a3, block);
}

uint64_t __48__FCOperationDelayedRetrySignal_onQueue_signal___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"{%p delay=%.2f}", self, *(void *)&self->_delay];
}

@end
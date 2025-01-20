@interface FCOperationImmediateRetrySignal
- (NSString)description;
- (void)onQueue:(id)a3 signal:(id)a4;
@end

@implementation FCOperationImmediateRetrySignal

- (void)onQueue:(id)a3 signal:(id)a4
{
  id v5 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__FCOperationImmediateRetrySignal_onQueue_signal___block_invoke;
  block[3] = &unk_1E5B4CA88;
  id v8 = v5;
  id v6 = v5;
  dispatch_async((dispatch_queue_t)a3, block);
}

uint64_t __50__FCOperationImmediateRetrySignal_onQueue_signal___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"{%p immediate}", self);
}

@end
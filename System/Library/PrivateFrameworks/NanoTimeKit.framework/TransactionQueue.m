@interface TransactionQueue
@end

@implementation TransactionQueue

void ___TransactionQueue_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.nanotimekit.daemon-transaction-queue", 0);
  v1 = (void *)_TransactionQueue___queue;
  _TransactionQueue___queue = (uint64_t)v0;
}

@end
@interface TransactionQueue
@end

@implementation TransactionQueue

uint64_t ___TransactionQueue_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.PrototypeTools.transaction-queue", 0);
  uint64_t v1 = _TransactionQueue___queue;
  _TransactionQueue___queue = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
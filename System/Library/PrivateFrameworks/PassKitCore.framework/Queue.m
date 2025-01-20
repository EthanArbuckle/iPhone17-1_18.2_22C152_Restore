@interface Queue
@end

@implementation Queue

void ___Queue_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("user-notification-queue", 0);
  v1 = (void *)_MergedGlobals_283;
  _MergedGlobals_283 = (uint64_t)v0;
}

@end
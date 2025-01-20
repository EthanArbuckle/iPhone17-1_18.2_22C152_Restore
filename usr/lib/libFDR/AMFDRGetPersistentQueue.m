@interface AMFDRGetPersistentQueue
@end

@implementation AMFDRGetPersistentQueue

dispatch_queue_t ___AMFDRGetPersistentQueue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.libFDR.persistent", 0);
  _AMFDRGetPersistentQueue_queue = (uint64_t)result;
  return result;
}

@end
@interface RECreateSharedQueueAttr
@end

@implementation RECreateSharedQueueAttr

uint64_t ___RECreateSharedQueueAttr_block_invoke()
{
  _RECreateSharedQueueAttr_SharedQueue = (uint64_t)dispatch_queue_create("com.apple.RelevanceEngine.SharedQueue", 0);
  return MEMORY[0x270F9A758]();
}

@end
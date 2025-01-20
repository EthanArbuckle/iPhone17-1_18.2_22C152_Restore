@interface SharedCacheQueue
@end

@implementation SharedCacheQueue

void ___SharedCacheQueue_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("passd_cache_queue", 0);
  v1 = (void *)qword_1EB4029B0;
  qword_1EB4029B0 = (uint64_t)v0;
}

@end
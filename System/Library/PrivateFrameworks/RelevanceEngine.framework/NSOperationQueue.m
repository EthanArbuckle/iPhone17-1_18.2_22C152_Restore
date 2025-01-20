@interface NSOperationQueue
@end

@implementation NSOperationQueue

void __75__NSOperationQueue_RelevanceEngineUtilities__re_sharedSerialOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A48]);
  v1 = (void *)re_sharedSerialOperationQueue_queue;
  re_sharedSerialOperationQueue_queue = (uint64_t)v0;

  [(id)re_sharedSerialOperationQueue_queue setName:@"com.apple.relevanceengine.shared.utility.operation-queue"];
  [(id)re_sharedSerialOperationQueue_queue setMaxConcurrentOperationCount:1];
  [(id)re_sharedSerialOperationQueue_queue setQualityOfService:17];
  v2 = (void *)re_sharedSerialOperationQueue_queue;
  RESharedSerialDispatchQueue();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setUnderlyingQueue:v3];
}

@end
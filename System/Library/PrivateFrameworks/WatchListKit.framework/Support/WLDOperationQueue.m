@interface WLDOperationQueue
@end

@implementation WLDOperationQueue

void __WLDOperationQueue_block_invoke(id a1)
{
  id v1 = objc_alloc_init((Class)NSOperationQueue);
  v2 = (void *)WLDOperationQueue___opQueue;
  WLDOperationQueue___opQueue = (uint64_t)v1;

  [(id)WLDOperationQueue___opQueue setMaxConcurrentOperationCount:1];
  v3 = (void *)WLDOperationQueue___opQueue;
  WLDDispatchQueue();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setUnderlyingQueue:v4];
}

@end
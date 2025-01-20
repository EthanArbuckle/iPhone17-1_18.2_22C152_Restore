@interface NSOperationQueue
@end

@implementation NSOperationQueue

uint64_t __49__NSOperationQueue_WLKAdditions__wlkDefaultQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)wlkDefaultQueue___wlkDefaultQueue;
  wlkDefaultQueue___wlkDefaultQueue = (uint64_t)v0;

  [(id)wlkDefaultQueue___wlkDefaultQueue setName:@"com.apple.WatchListKit.defaultqueue"];
  v2 = (void *)wlkDefaultQueue___wlkDefaultQueue;

  return [v2 setMaxConcurrentOperationCount:1];
}

uint64_t __59__NSOperationQueue_WLKAdditions__wlkDefaultConcurrentQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)wlkDefaultConcurrentQueue___wlkDefaultConQueue;
  wlkDefaultConcurrentQueue___wlkDefaultConQueue = (uint64_t)v0;

  [(id)wlkDefaultConcurrentQueue___wlkDefaultConQueue setName:@"com.apple.WatchListKit.defaultconcurrentqueue"];
  v2 = (void *)wlkDefaultConcurrentQueue___wlkDefaultConQueue;

  return [v2 setMaxConcurrentOperationCount:10];
}

@end
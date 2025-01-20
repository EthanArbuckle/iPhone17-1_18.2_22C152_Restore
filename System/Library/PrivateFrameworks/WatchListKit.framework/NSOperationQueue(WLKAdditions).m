@interface NSOperationQueue(WLKAdditions)
+ (id)wlkDefaultConcurrentQueue;
+ (id)wlkDefaultQueue;
@end

@implementation NSOperationQueue(WLKAdditions)

+ (id)wlkDefaultConcurrentQueue
{
  if (wlkDefaultConcurrentQueue___once != -1) {
    dispatch_once(&wlkDefaultConcurrentQueue___once, &__block_literal_global_3_2);
  }
  v0 = (void *)wlkDefaultConcurrentQueue___wlkDefaultConQueue;

  return v0;
}

+ (id)wlkDefaultQueue
{
  if (wlkDefaultQueue___once != -1) {
    dispatch_once(&wlkDefaultQueue___once, &__block_literal_global_44);
  }
  v0 = (void *)wlkDefaultQueue___wlkDefaultQueue;

  return v0;
}

@end
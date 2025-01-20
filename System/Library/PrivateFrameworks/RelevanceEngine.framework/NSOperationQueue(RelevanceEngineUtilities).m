@interface NSOperationQueue(RelevanceEngineUtilities)
+ (id)re_sharedSerialOperationQueue;
@end

@implementation NSOperationQueue(RelevanceEngineUtilities)

+ (id)re_sharedSerialOperationQueue
{
  if (re_sharedSerialOperationQueue_onceToken != -1) {
    dispatch_once(&re_sharedSerialOperationQueue_onceToken, &__block_literal_global_13_0);
  }
  v0 = (void *)re_sharedSerialOperationQueue_queue;
  return v0;
}

@end
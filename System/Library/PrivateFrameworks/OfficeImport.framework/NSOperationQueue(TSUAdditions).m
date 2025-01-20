@interface NSOperationQueue(TSUAdditions)
+ (id)tsu_newSerialOperationQueueWithName:()TSUAdditions;
- (uint64_t)tsu_isCurrentQueue;
- (void)tsu_performBlock:()TSUAdditions;
@end

@implementation NSOperationQueue(TSUAdditions)

+ (id)tsu_newSerialOperationQueueWithName:()TSUAdditions
{
  id v4 = objc_alloc_init(MEMORY[0x263F08A48]);
  [v4 setName:a3];
  [v4 setMaxConcurrentOperationCount:1];
  v5 = dispatch_queue_create((const char *)[a3 UTF8String], 0);
  dispatch_queue_set_specific(v5, (const void *)TSUOperationQueueUtilityQueueSpecific, v5, 0);
  [v4 setUnderlyingQueue:v5];

  return v4;
}

- (uint64_t)tsu_isCurrentQueue
{
  if ((void *)[MEMORY[0x263F08A48] currentQueue] == a1) {
    return 1;
  }
  uint64_t result = [a1 underlyingQueue];
  if (result) {
    return dispatch_get_specific((const void *)TSUOperationQueueUtilityQueueSpecific) == (void *)result;
  }
  return result;
}

- (void)tsu_performBlock:()TSUAdditions
{
  if (a3)
  {
    id v4 = result;
    if (objc_msgSend(result, "tsu_isCurrentQueue"))
    {
      v5 = *(uint64_t (**)(uint64_t))(a3 + 16);
      return (void *)v5(a3);
    }
    else
    {
      return (void *)[v4 addOperationWithBlock:a3];
    }
  }
  return result;
}

@end
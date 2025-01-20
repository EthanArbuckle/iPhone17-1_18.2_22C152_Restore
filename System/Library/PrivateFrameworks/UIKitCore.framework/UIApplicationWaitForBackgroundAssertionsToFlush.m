@interface UIApplicationWaitForBackgroundAssertionsToFlush
@end

@implementation UIApplicationWaitForBackgroundAssertionsToFlush

void ___UIApplicationWaitForBackgroundAssertionsToFlush_block_invoke(uint64_t a1)
{
  id v5 = [(id)qword_1EB260A58 allObjects];
  uint64_t v2 = [v5 firstObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end
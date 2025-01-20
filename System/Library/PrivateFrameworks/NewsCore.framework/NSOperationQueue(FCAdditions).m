@interface NSOperationQueue(FCAdditions)
+ (id)fc_prewarmQueue;
+ (id)fc_sharedConcurrentQueue;
+ (id)fc_sharedSerialQueue;
+ (id)fc_throttledCKRequestOperationQueue;
- (void)fc_addMainThreadOperationWithBlock:()FCAdditions;
@end

@implementation NSOperationQueue(FCAdditions)

+ (id)fc_sharedConcurrentQueue
{
  if (qword_1EB5D1BE8 != -1) {
    dispatch_once(&qword_1EB5D1BE8, &__block_literal_global_191);
  }
  v0 = (void *)_MergedGlobals_227;
  return v0;
}

+ (id)fc_sharedSerialQueue
{
  if (qword_1EB5D1BF8 != -1) {
    dispatch_once(&qword_1EB5D1BF8, &__block_literal_global_3_2);
  }
  v0 = (void *)qword_1EB5D1BF0;
  return v0;
}

+ (id)fc_prewarmQueue
{
  if (qword_1EB5D1C08 != -1) {
    dispatch_once(&qword_1EB5D1C08, &__block_literal_global_8_4);
  }
  v0 = (void *)qword_1EB5D1C00;
  return v0;
}

+ (id)fc_throttledCKRequestOperationQueue
{
  if (qword_1EB5D1C18 != -1) {
    dispatch_once(&qword_1EB5D1C18, &__block_literal_global_13_4);
  }
  v0 = (void *)qword_1EB5D1C10;
  return v0;
}

- (void)fc_addMainThreadOperationWithBlock:()FCAdditions
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__NSOperationQueue_FCAdditions__fc_addMainThreadOperationWithBlock___block_invoke;
  v6[3] = &unk_1E5B4F168;
  id v7 = v4;
  id v5 = v4;
  objc_msgSend(a1, "fc_addAsyncOperationWithBlock:", v6);
}

@end
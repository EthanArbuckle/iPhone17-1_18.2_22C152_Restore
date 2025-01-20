@interface NSOperationQueue(FCAsyncBlockAdditions)
- (void)fc_addAsyncOperationWithBlock:()FCAsyncBlockAdditions;
@end

@implementation NSOperationQueue(FCAsyncBlockAdditions)

- (void)fc_addAsyncOperationWithBlock:()FCAsyncBlockAdditions
{
  +[FCAsyncBlockOperation asyncBlockOperationWithBlock:](FCAsyncBlockOperation, "asyncBlockOperationWithBlock:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 addOperation:v2];
}

@end
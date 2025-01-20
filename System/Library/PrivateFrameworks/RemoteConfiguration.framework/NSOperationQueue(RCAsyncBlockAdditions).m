@interface NSOperationQueue(RCAsyncBlockAdditions)
- (void)rc_addAsyncOperationWithBlock:()RCAsyncBlockAdditions;
@end

@implementation NSOperationQueue(RCAsyncBlockAdditions)

- (void)rc_addAsyncOperationWithBlock:()RCAsyncBlockAdditions
{
  +[RCAsyncBlockOperation asyncBlockOperationWithBlock:](RCAsyncBlockOperation, "asyncBlockOperationWithBlock:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 addOperation:v2];
}

@end
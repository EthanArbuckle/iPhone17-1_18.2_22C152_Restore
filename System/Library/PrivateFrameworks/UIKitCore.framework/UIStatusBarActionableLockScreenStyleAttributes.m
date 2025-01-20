@interface UIStatusBarActionableLockScreenStyleAttributes
- (BOOL)shouldProduceReturnEvent;
@end

@implementation UIStatusBarActionableLockScreenStyleAttributes

- (BOOL)shouldProduceReturnEvent
{
  return 1;
}

@end
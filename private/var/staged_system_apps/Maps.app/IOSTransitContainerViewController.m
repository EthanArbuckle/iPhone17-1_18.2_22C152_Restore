@interface IOSTransitContainerViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)allowsDisplayOnLockScreen;
@end

@implementation IOSTransitContainerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)allowsDisplayOnLockScreen
{
  return 1;
}

@end
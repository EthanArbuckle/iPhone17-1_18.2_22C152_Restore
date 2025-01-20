@interface SBPreviewFloatingDockViewController
- (BOOL)_canShowWhileLocked;
@end

@implementation SBPreviewFloatingDockViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
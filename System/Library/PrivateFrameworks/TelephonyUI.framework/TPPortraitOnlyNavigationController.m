@interface TPPortraitOnlyNavigationController
- (BOOL)shouldAutorotate;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (unint64_t)supportedInterfaceOrientations;
@end

@implementation TPPortraitOnlyNavigationController

- (BOOL)shouldAutorotate
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return a3 == 1;
}

@end
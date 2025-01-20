@interface PRPosterRootViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAutorotate;
- (unint64_t)supportedInterfaceOrientations;
@end

@implementation PRPosterRootViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

@end
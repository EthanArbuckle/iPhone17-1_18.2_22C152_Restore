@interface SBAlertItemRootViewController
- (BOOL)shouldAutorotate;
- (unint64_t)supportedInterfaceOrientations;
@end

@implementation SBAlertItemRootViewController

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

@end
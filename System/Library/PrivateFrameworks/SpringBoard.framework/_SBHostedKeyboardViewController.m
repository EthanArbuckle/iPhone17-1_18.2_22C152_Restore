@interface _SBHostedKeyboardViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAutorotate;
- (unint64_t)supportedInterfaceOrientations;
@end

@implementation _SBHostedKeyboardViewController

- (BOOL)shouldAutorotate
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
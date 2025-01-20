@interface PKPortraitNavigationController
- (BOOL)_canShowWhileLocked;
- (unint64_t)supportedInterfaceOrientations;
@end

@implementation PKPortraitNavigationController

- (BOOL)_canShowWhileLocked
{
  uint64_t v3 = objc_opt_class();

  return [(PKPortraitNavigationController *)self isMemberOfClass:v3];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

@end
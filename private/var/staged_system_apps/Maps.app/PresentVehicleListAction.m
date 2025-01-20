@interface PresentVehicleListAction
- (BOOL)forceEndNavigation;
- (BOOL)isCompatibleWithNavigation;
- (BOOL)isCompatibleWithRestorationTask;
- (BOOL)shouldResetUI;
@end

@implementation PresentVehicleListAction

- (BOOL)isCompatibleWithNavigation
{
  return 0;
}

- (BOOL)shouldResetUI
{
  return 1;
}

- (BOOL)forceEndNavigation
{
  return 1;
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

@end
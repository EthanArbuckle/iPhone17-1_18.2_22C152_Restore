@interface PresentNavShareETAAction
- (BOOL)forceEndNavigation;
- (BOOL)isCompatibleWithNavigation;
- (BOOL)shouldResetUI;
- (int)analyticsLaunchActionType;
@end

@implementation PresentNavShareETAAction

- (BOOL)isCompatibleWithNavigation
{
  return 1;
}

- (BOOL)forceEndNavigation
{
  return 0;
}

- (BOOL)shouldResetUI
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 17;
}

@end
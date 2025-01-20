@interface ShowCarDestinationsAction
- (BOOL)forceEndNavigation;
- (BOOL)isCompatibleWithNavigation;
- (BOOL)isCompatibleWithRestorationTask;
- (int)analyticsLaunchActionType;
@end

@implementation ShowCarDestinationsAction

- (BOOL)isCompatibleWithNavigation
{
  return 0;
}

- (BOOL)forceEndNavigation
{
  return 0;
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 2;
}

@end
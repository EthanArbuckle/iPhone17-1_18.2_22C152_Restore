@interface ResetAction
- (BOOL)forceEndNavigation;
- (BOOL)isTestingAction;
- (int)analyticsLaunchActionType;
@end

@implementation ResetAction

- (BOOL)isTestingAction
{
  return 1;
}

- (BOOL)forceEndNavigation
{
  return 1;
}

- (int)analyticsLaunchActionType
{
  return 24;
}

@end
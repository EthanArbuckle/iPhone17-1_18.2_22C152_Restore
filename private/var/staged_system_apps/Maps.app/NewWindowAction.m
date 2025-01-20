@interface NewWindowAction
- (BOOL)shouldResetUI;
- (int)analyticsLaunchActionType;
@end

@implementation NewWindowAction

- (BOOL)shouldResetUI
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 36;
}

@end
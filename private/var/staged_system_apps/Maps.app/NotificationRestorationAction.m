@interface NotificationRestorationAction
- (NotificationRestorationAction)init;
- (int)analyticsLaunchActionType;
@end

@implementation NotificationRestorationAction

- (NotificationRestorationAction)init
{
  v5.receiver = self;
  v5.super_class = (Class)NotificationRestorationAction;
  v2 = [(RestorationAction *)&v5 init];
  v3 = v2;
  if (v2) {
    [(RestorationAction *)v2 setSource:0];
  }
  return v3;
}

- (int)analyticsLaunchActionType
{
  return 12;
}

@end
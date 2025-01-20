@interface MTNotificationTestActionFactory
+ (id)notificationTestActionsViewController;
+ (void)runDefaultAction;
+ (void)runOldestNotificationAction;
+ (void)runRandomNotificationAction;
- (_TtC8Podcasts31MTNotificationTestActionFactory)init;
@end

@implementation MTNotificationTestActionFactory

+ (void)runDefaultAction
{
  sub_1003D6168();
  sub_1002FD3C4(0xD00000000000001ELL, 0x80000001004E2880);

  swift_bridgeObjectRelease();
}

+ (id)notificationTestActionsViewController
{
  v2 = sub_1003D6168();
  id v3 = objc_allocWithZone((Class)type metadata accessor for MTTestActionListViewController());
  id v4 = MTTestActionListViewController.init(title:tests:)(0x6163696669746F4ELL, 0xED0000736E6F6974, (unint64_t)v2);

  return v4;
}

+ (void)runOldestNotificationAction
{
}

+ (void)runRandomNotificationAction
{
}

- (_TtC8Podcasts31MTNotificationTestActionFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MTNotificationTestActionFactory();
  return [(MTNotificationTestActionFactory *)&v3 init];
}

@end
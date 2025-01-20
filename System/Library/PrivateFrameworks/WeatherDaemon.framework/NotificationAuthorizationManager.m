@interface NotificationAuthorizationManager
- (_TtC8weatherd32NotificationAuthorizationManager)init;
- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4;
@end

@implementation NotificationAuthorizationManager

- (_TtC8weatherd32NotificationAuthorizationManager)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8weatherd32NotificationAuthorizationManager_notificationCenter);
}

- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10000FBD0((uint64_t)v8, v7);
}

@end
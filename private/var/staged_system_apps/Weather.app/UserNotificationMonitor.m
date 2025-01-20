@interface UserNotificationMonitor
- (_TtC7Weather23UserNotificationMonitor)init;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation UserNotificationMonitor

- (_TtC7Weather23UserNotificationMonitor)init
{
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7Weather23UserNotificationMonitor_userNotificationCenter));

  swift_release();
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  UserNotificationMonitor.userNotificationCenter(_:openSettingsFor:)((UNUserNotificationCenter)v8, v10);
}

@end
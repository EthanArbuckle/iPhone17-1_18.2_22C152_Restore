@interface SettingsCenterListener
- (_TtC21UserNotificationsCore22SettingsCenterListener)init;
- (void)userNotificationSettingsCenter:(id)a3 didUpdateNotificationSourceIdentifiers:(id)a4;
@end

@implementation SettingsCenterListener

- (void)userNotificationSettingsCenter:(id)a3 didUpdateNotificationSourceIdentifiers:(id)a4
{
  sub_260A84FA0();
  id v6 = a3;
  v7 = self;
  sub_26094C8A4(v6);

  swift_bridgeObjectRelease();
}

- (_TtC21UserNotificationsCore22SettingsCenterListener)init
{
  result = (_TtC21UserNotificationsCore22SettingsCenterListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
@interface FMConditionProvider
- (_TtC6FindMy19FMConditionProvider)init;
- (void)accountChangedNotificationReceivedWithNotification:(id)a3;
- (void)airplaneModeChanged;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)checkNetworkState;
- (void)refreshRestrictions;
@end

@implementation FMConditionProvider

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001F298(v4);
}

- (void)checkNetworkState
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy19FMConditionProvider_networkMonitor);
  id v4 = self;
  unsigned __int8 v3 = [v2 isNetworkUp];
  *((unsigned char *)&v4->super.isa + OBJC_IVAR____TtC6FindMy19FMConditionProvider_isNetworkUp) = v3;
  sub_100026A68();
}

- (_TtC6FindMy19FMConditionProvider)init
{
  return (_TtC6FindMy19FMConditionProvider *)sub_100021444();
}

- (void)refreshRestrictions
{
  v2 = self;
  sub_10000C75C();
}

- (void)accountChangedNotificationReceivedWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100423608(v4);
}

- (void)airplaneModeChanged
{
  v2 = self;
  sub_100423ED4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6FindMy19FMConditionProvider_notificationSettingsObserver));
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end
@interface RemoteNotificationsProperties.DeviceObserver
- (_TtCC21UserNotificationsCore29RemoteNotificationsProperties14DeviceObserver)init;
- (void)dealloc;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
@end

@implementation RemoteNotificationsProperties.DeviceObserver

- (void)dealloc
{
  v2 = self;
  sub_260A18A14();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCC21UserNotificationsCore29RemoteNotificationsProperties14DeviceObserver_delegate);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC21UserNotificationsCore29RemoteNotificationsProperties14DeviceObserver_queue);
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  if (a4) {
    sub_260A84D70();
  }
  id v6 = a3;
  v7 = self;
  sub_260A1B880("IDS devices changed. Refreshing state.");

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  if (a4) {
    sub_260A84FA0();
  }
  id v6 = a3;
  v7 = self;
  sub_260A1B880("IDS account changed. Refreshing state.");

  swift_bridgeObjectRelease();
}

- (_TtCC21UserNotificationsCore29RemoteNotificationsProperties14DeviceObserver)init
{
  result = (_TtCC21UserNotificationsCore29RemoteNotificationsProperties14DeviceObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
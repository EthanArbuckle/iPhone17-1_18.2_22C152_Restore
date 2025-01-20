@interface IDSSyncService
- (_TtC17SessionSyncEngine14IDSSyncService)init;
- (void)dealloc;
- (void)pairedDeviceStateChangedWithNotification:(id)a3;
@end

@implementation IDSSyncService

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6 = (int *)((char *)v4 + OBJC_IVAR____TtC17SessionSyncEngine14IDSSyncService_pairedDeviceNotificationToken);
  swift_beginAccess();
  notify_cancel(*v6);
  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for IDSSyncService();
  [(IDSSyncService *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC17SessionSyncEngine14IDSSyncService)init
{
  result = (_TtC17SessionSyncEngine14IDSSyncService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)pairedDeviceStateChangedWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1C7B53450((uint64_t)&unk_1F223AE10, (uint64_t)sub_1C7B536EC, (uint64_t)&block_descriptor_49);
}

@end
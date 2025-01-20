@interface SDAirDropBonjourBrowser
- (_TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser)init;
- (void)wirelessBluetoothStateChangedWithNotification:(id)a3;
@end

@implementation SDAirDropBonjourBrowser

- (void)wirelessBluetoothStateChangedWithNotification:(id)a3
{
  uint64_t v4 = sub_10000A844(&qword_10096C920);
  __chkstk_darwin(v4 - 8);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Notification();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
  uint64_t v12 = qword_100969B90;
  v13 = self;
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v14 = static AirDropActor.shared;
  uint64_t v15 = sub_1004D1860((unint64_t *)&qword_1009744A0, (void (*)(uint64_t))type metadata accessor for AirDropActor);
  v16 = (void *)swift_allocObject();
  v16[2] = v14;
  v16[3] = v15;
  v16[4] = v13;
  swift_retain();
  sub_10028CFA8((uint64_t)v6, (uint64_t)&unk_100976778, (uint64_t)v16);

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser)init
{
  result = (_TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_deviceStatus));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_bleController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_notificationCenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_browserQueue));
  sub_100261080((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_delegate);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

@end
@interface ICAppIntentsInteractionController
- (ICWindow)window;
- (_TtC11MobileNotes33ICAppIntentsInteractionController)init;
- (void)rootViewControllerDidChange:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation ICAppIntentsInteractionController

- (void)setWindow:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_10000DF24();
}

- (void)rootViewControllerDidChange:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10001172C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC11MobileNotes33ICAppIntentsInteractionController)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = self;
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    sub_100157C5C((unint64_t)&_swiftEmptyArrayStorage);
  }
  else {
    uint64_t v5 = (objc_class *)&_swiftEmptySetSingleton;
  }
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC11MobileNotes33ICAppIntentsInteractionController_interactions) = v5;
  swift_unknownObjectWeakInit();

  v7.receiver = v4;
  v7.super_class = ObjectType;
  return [(ICAppIntentsInteractionController *)&v7 init];
}

- (ICWindow)window
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (ICWindow *)Strong;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
}

@end
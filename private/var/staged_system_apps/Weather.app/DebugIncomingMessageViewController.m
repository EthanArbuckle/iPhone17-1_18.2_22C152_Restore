@interface DebugIncomingMessageViewController
- (_TtC7Weather34DebugIncomingMessageViewController)initWithCoder:(id)a3;
- (_TtC7Weather34DebugIncomingMessageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Weather34DebugIncomingMessageViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation DebugIncomingMessageViewController

- (_TtC7Weather34DebugIncomingMessageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003F9EF0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1003F9FBC();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  int64_t v8 = sub_1003FA2B4((uint64_t)v7, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  double v12 = sub_1003FA360();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  double v12 = (void *)sub_1003FA4A8(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_1003FA8E4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t))sub_1003FA858);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_1003FA8E4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t))sub_1003FA8A4);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1003FA940();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC7Weather34DebugIncomingMessageViewController)initWithStyle:(int64_t)a3
{
}

- (_TtC7Weather34DebugIncomingMessageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_1003FBCB0();
}

- (void).cxx_destruct
{
  swift_release();
  type metadata accessor for IncomingMessageEntity();
  sub_100162880();
  sub_100162F0C();
  v3();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Weather34DebugIncomingMessageViewController____lazy_storage___dateFormatter));
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Weather34DebugIncomingMessageViewController_mapView);
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  id v8 = sub_1003FBF14((uint64_t)v7, (uint64_t)a4);

  swift_unknownObjectRelease();

  return v8;
}

@end
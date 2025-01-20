@interface FMItemEmailViewController
- (_TtC6FindMy25FMItemEmailViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC6FindMy25FMItemEmailViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)handleUsePhoneNumberAction;
- (void)nextActionWithSender:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FMItemEmailViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100389204(a3);
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
  id v12 = sub_100389388(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)nextActionWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10038A330();
}

- (void)handleUsePhoneNumberAction
{
  v2 = self;
  v3 = (_TtC6FindMy25FMItemEmailViewController *)[(FMItemEmailViewController *)v2 parentViewController];
  if (v3)
  {
    v5 = v3;
    self;
    if (swift_dynamicCastObjCClass()) {
      sub_1001394D4(0, 0);
    }

    id v4 = v5;
  }
  else
  {
    id v4 = v2;
  }
}

- (_TtC6FindMy25FMItemEmailViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    return (_TtC6FindMy25FMItemEmailViewController *)sub_100389BAC(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  return (_TtC6FindMy25FMItemEmailViewController *)sub_100389BAC(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC6FindMy25FMItemEmailViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = a5;
  return (_TtC6FindMy25FMItemEmailViewController *)sub_100389DB0(v9, v11, (uint64_t)a4, v13, a5, a6);
}

- (void).cxx_destruct
{
  sub_100072358((uint64_t)self + OBJC_IVAR____TtC6FindMy25FMItemEmailViewController_item);

  swift_bridgeObjectRelease();
}

@end
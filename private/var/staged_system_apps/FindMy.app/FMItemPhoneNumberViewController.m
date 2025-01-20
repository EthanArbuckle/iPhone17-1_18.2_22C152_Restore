@interface FMItemPhoneNumberViewController
- (_TtC6FindMy31FMItemPhoneNumberViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC6FindMy31FMItemPhoneNumberViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)handleUseEmailAction;
- (void)nextActionWithSender:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FMItemPhoneNumberViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100384224(a3);
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
  id v12 = sub_100384460(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)nextActionWithSender:(id)a3
{
  id v4 = a3;
  v11 = self;
  id v5 = sub_10041DC64();
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = v5;
  id v7 = [v5 text];

  if (!v7) {
    goto LABEL_5;
  }
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  LOBYTE(v8) = sub_100119D00(v8, v10);
  swift_bridgeObjectRelease();
  if (v8) {
    sub_1003848F8();
  }
  else {
LABEL_5:
  }
    sub_10041DDB8();
}

- (void)handleUseEmailAction
{
  v2 = self;
  v3 = (_TtC6FindMy31FMItemPhoneNumberViewController *)[(FMItemPhoneNumberViewController *)v2 parentViewController];
  if (v3)
  {
    id v5 = v3;
    self;
    if (swift_dynamicCastObjCClass()) {
      sub_100138EF8(1, 0, 0);
    }

    id v4 = v5;
  }
  else
  {
    id v4 = v2;
  }
}

- (_TtC6FindMy31FMItemPhoneNumberViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
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
    return (_TtC6FindMy31FMItemPhoneNumberViewController *)sub_100384D88(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  return (_TtC6FindMy31FMItemPhoneNumberViewController *)sub_100384D88(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC6FindMy31FMItemPhoneNumberViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v10;
  }
  uint64_t v11 = &self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy31FMItemPhoneNumberViewController_item];
  uint64_t v12 = type metadata accessor for FMIPItem();
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  id v13 = a5;
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (a4)
  {
    NSString v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v15 = 0;
  }
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for FMItemPhoneNumberViewController();
  uint64_t v16 = [(FMPhoneNumberViewController *)&v18 initWithTitle:v14 detailText:v15 icon:v13 contentLayout:a6];

  return v16;
}

- (void).cxx_destruct
{
}

@end
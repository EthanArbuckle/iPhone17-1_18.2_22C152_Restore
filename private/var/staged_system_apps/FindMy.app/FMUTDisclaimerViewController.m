@interface FMUTDisclaimerViewController
- (_TtC6FindMy28FMUTDisclaimerViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC6FindMy28FMUTDisclaimerViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)continue;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FMUTDisclaimerViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(FMUTDisclaimerViewController *)&v7 viewWillAppear:v3];
  id v5 = [v4 parentViewController];
  if (v5)
  {
    v6 = v5;
    self;
    if (swift_dynamicCastObjCClass()) {
      sub_100139154();
    }
  }
  else
  {
    v6 = v4;
  }
}

- (void)continue
{
  v2 = self;
  BOOL v3 = (_TtC6FindMy28FMUTDisclaimerViewController *)[(FMUTDisclaimerViewController *)v2 parentViewController];
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

- (_TtC6FindMy28FMUTDisclaimerViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
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
    return (_TtC6FindMy28FMUTDisclaimerViewController *)sub_1002898BC(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  return (_TtC6FindMy28FMUTDisclaimerViewController *)sub_1002898BC(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC6FindMy28FMUTDisclaimerViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  ObjectType = (objc_class *)swift_getObjectType();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v11;
  }
  id v12 = a5;
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (a4)
  {
    NSString v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v14 = 0;
  }
  v17.receiver = self;
  v17.super_class = ObjectType;
  uint64_t v15 = [(FMUTDisclaimerViewController *)&v17 initWithTitle:v13 detailText:v14 icon:v12 contentLayout:a6];

  return v15;
}

@end
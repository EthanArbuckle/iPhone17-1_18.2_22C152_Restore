@interface SystemPaperWelcomeViewController
- (_TtC11MobileNotes32SystemPaperWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC11MobileNotes32SystemPaperWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)dismiss:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SystemPaperWelcomeViewController

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = v8.receiver;
  [(SystemPaperWelcomeViewController *)&v8 viewDidAppear:v3];
  id v5 = [self standardUserDefaults];
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  NSString v7 = String._bridgeToObjectiveC()();
  [v5 setObject:isa forKey:v7];
}

- (void)dismiss:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
    id v5 = self;
  }
  -[SystemPaperWelcomeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, v6, v7);

  sub_100015BE0((uint64_t)&v6);
}

- (_TtC11MobileNotes32SystemPaperWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
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
    return (_TtC11MobileNotes32SystemPaperWelcomeViewController *)sub_1003FDADC(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  return (_TtC11MobileNotes32SystemPaperWelcomeViewController *)sub_1003FDADC(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC11MobileNotes32SystemPaperWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
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
  uint64_t v15 = [(SystemPaperWelcomeViewController *)&v17 initWithTitle:v13 detailText:v14 icon:v12 contentLayout:a6];

  return v15;
}

@end
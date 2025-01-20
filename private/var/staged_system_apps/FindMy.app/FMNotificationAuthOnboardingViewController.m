@interface FMNotificationAuthOnboardingViewController
- (NSArray)keyCommands;
- (_TtC6FindMy42FMNotificationAuthOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC6FindMy42FMNotificationAuthOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)ignore;
- (void)returnPressed;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FMNotificationAuthOnboardingViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(FMNotificationAuthOnboardingViewController *)&v7 viewWillAppear:v3];
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

- (NSArray)keyCommands
{
  sub_10005D034(&qword_1006AF2D0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10055BD30;
  id v4 = self;
  NSString v5 = String._bridgeToObjectiveC()();
  id v6 = [self keyCommandWithInput:v5 modifierFlags:0 action:"returnPressed"];

  *(void *)(v3 + 32) = v6;
  specialized Array._endMutation()();

  sub_100006060(0, (unint64_t *)&unk_1006B4560);
  v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v7.super.isa;
}

- (void)returnPressed
{
  v2 = self;
  sub_100148EDC();
}

- (void)ignore
{
  v2 = self;
  sub_1001490E8();
}

- (_TtC6FindMy42FMNotificationAuthOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
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
    return (_TtC6FindMy42FMNotificationAuthOnboardingViewController *)sub_100149228(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  return (_TtC6FindMy42FMNotificationAuthOnboardingViewController *)sub_100149228(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC6FindMy42FMNotificationAuthOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
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
  return (_TtC6FindMy42FMNotificationAuthOnboardingViewController *)sub_100149508(v9, v11, (uint64_t)a4, v13, a5, a6);
}

- (void).cxx_destruct
{
  swift_release();

  uint64_t v3 = &self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy42FMNotificationAuthOnboardingViewController_delegate];

  sub_100068760((uint64_t)v3);
}

@end
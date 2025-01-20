@interface FMDeviceActionsViewController
- (_TtC6FindMy29FMDeviceActionsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC6FindMy29FMDeviceActionsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)cancelActionWithSender:(id)a3;
- (void)performAction;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMDeviceActionsViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMDeviceActionsViewController();
  v2 = v4.receiver;
  id v3 = [(FMDeviceActionsViewController *)&v4 viewDidLoad];
  (*(void (**)(id))((swift_isaMask & *v2) + 0x160))(v3);
  sub_1003C6B74();
  [*(id *)((char *)v2 + OBJC_IVAR____TtC6FindMy29FMDeviceActionsViewController_performButton) addTarget:v2 action:@"performAction" forControlEvents:64];
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4 = self;
  sub_1003C8CBC(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4 = self;
  sub_1003C9364(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003C7324();
}

- (void)performAction
{
  v2 = self;
  sub_1003C7614();
}

- (void)cancelActionWithSender:(id)a3
{
  v8[4] = State.rawValue.getter;
  v8[5] = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_10003C410;
  v8[3] = &unk_100638840;
  v5 = _Block_copy(v8);
  id v6 = a3;
  v7 = self;
  [(FMDeviceActionsViewController *)v7 dismissViewControllerAnimated:1 completion:v5];
  _Block_release(v5);
}

- (_TtC6FindMy29FMDeviceActionsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
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
    return (_TtC6FindMy29FMDeviceActionsViewController *)sub_1003C9FBC(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  return (_TtC6FindMy29FMDeviceActionsViewController *)sub_1003C9FBC(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC6FindMy29FMDeviceActionsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
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
  return (_TtC6FindMy29FMDeviceActionsViewController *)sub_1003CA334(v9, v11, (uint64_t)a4, v13, a5, a6);
}

- (void).cxx_destruct
{
  swift_release();
  sub_100003F10((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy29FMDeviceActionsViewController_device], &qword_1006B2AF0);
  sub_100003F10((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy29FMDeviceActionsViewController_primaryItemPart], (uint64_t *)&unk_1006AFE30);
  id v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy29FMDeviceActionsViewController_style];

  swift_release();
}

@end
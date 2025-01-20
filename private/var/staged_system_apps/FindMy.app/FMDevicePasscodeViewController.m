@interface FMDevicePasscodeViewController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (_TtC6FindMy30FMDevicePasscodeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC6FindMy30FMDevicePasscodeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)cancelActionWithSender:(id)a3;
- (void)nextActionWithSender:(id)a3;
- (void)passcodeEntryViewTapped;
- (void)textChangedWithSender:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation FMDevicePasscodeViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMDevicePasscodeViewController();
  id v2 = v3.receiver;
  [(FMDevicePasscodeViewController *)&v3 viewDidLoad];
  sub_1002C66D8();
  sub_1002C6AF0();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMDevicePasscodeViewController();
  id v4 = v5.receiver;
  [(FMDevicePasscodeViewController *)&v5 viewWillAppear:v3];
  sub_1002C86B0();
  sub_1002C89B0();
  sub_1002C6FB0();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMDevicePasscodeViewController();
  id v4 = (char *)v5.receiver;
  [(FMDevicePasscodeViewController *)&v5 viewDidAppear:v3];
  [*(id *)&v4[OBJC_IVAR____TtC6FindMy30FMDevicePasscodeViewController_hiddenPasscodeTextField] becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy30FMDevicePasscodeViewController_hiddenPasscodeTextField];
  objc_super v5 = self;
  [v4 resignFirstResponder];
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for FMDevicePasscodeViewController();
  [(FMDevicePasscodeViewController *)&v6 viewWillDisappear:v3];
  sub_1002C72E4();
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMDevicePasscodeViewController();
  id v2 = v3.receiver;
  [(FMDevicePasscodeViewController *)&v3 viewWillLayoutSubviews];
  sub_1002C7FDC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_1002C74D0((uint64_t)a3);
}

- (void)textChangedWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1002CB2FC();
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_1002CB540(location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)passcodeEntryViewTapped
{
}

- (void)nextActionWithSender:(id)a3
{
  if (*(void *)&self->mediator[OBJC_IVAR____TtC6FindMy30FMDevicePasscodeViewController_firstPasscode])
  {
    swift_bridgeObjectRetain();
    id v5 = a3;
    objc_super v6 = self;
    sub_1002CAD7C();

    swift_bridgeObjectRelease();
  }
}

- (void)cancelActionWithSender:(id)a3
{
  id v4 = a3;
  v8 = self;
  id v5 = [(FMDevicePasscodeViewController *)v8 navigationController];
  if (v5)
  {
    objc_super v6 = v5;
    aBlock[4] = State.rawValue.getter;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10003C410;
    aBlock[3] = &unk_100631400;
    v7 = _Block_copy(aBlock);
    [v6 dismissViewControllerAnimated:1 completion:v7];
    _Block_release(v7);
  }
  else
  {
  }
}

- (_TtC6FindMy30FMDevicePasscodeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
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
    return (_TtC6FindMy30FMDevicePasscodeViewController *)sub_1002C9DC0(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  return (_TtC6FindMy30FMDevicePasscodeViewController *)sub_1002C9DC0(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC6FindMy30FMDevicePasscodeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
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
  return (_TtC6FindMy30FMDevicePasscodeViewController *)sub_1002CA2B8(v9, v11, (uint64_t)a4, v13, a5, a6);
}

- (void).cxx_destruct
{
  swift_release();
  sub_100003F10((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy30FMDevicePasscodeViewController_device], &qword_1006B2AF0);
  sub_100003F10((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy30FMDevicePasscodeViewController_primaryItemPart], (uint64_t *)&unk_1006AFE30);

  objc_super v3 = &self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy30FMDevicePasscodeViewController_numbersCharacterSet];
  uint64_t v4 = type metadata accessor for CharacterSet();
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end
@interface TTRITemplateSharingConfigurationViewController
- (BOOL)canBecomeFirstResponder;
- (NSUndoManager)undoManager;
- (_TtC9Reminders46TTRITemplateSharingConfigurationViewController)initWithCoder:(id)a3;
- (_TtC9Reminders46TTRITemplateSharingConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapCancel:(id)a3;
- (void)didTapCommit:(id)a3;
- (void)didTapShowPreview:(id)a3;
- (void)loadView;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation TTRITemplateSharingConfigurationViewController

- (_TtC9Reminders46TTRITemplateSharingConfigurationViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002603EC();
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                  + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController_localUndoManager));
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)loadView
{
  v2 = self;
  sub_10025D9B4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10025DAE0();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10025E608(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = v8.receiver;
  [(TTRITemplateSharingConfigurationViewController *)&v8 viewDidAppear:v3];
  id v5 = [v4 view];
  if (v5)
  {
    v6 = v5;
    v7 = (void *)UIView.firstResponderDescendant.getter();

    if (!v7) {
      [v4 becomeFirstResponder];
    }
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(TTRITemplateSharingConfigurationViewController *)&v5 viewWillDisappear:v3];
  UIViewController.endFirstResponderEditing()();
  [v4 resignFirstResponder];
  TTRKeyboardAvoidance<>.stopAvoidingKeyboard()();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_10025E8D8();
}

- (void)didTapCancel:(id)a3
{
  uint64_t v5 = sub_10003B754(&qword_10079AF90);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    objc_super v8 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
    v9 = self;
  }
  uint64_t v10 = *(uint64_t *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController_presenter);
  if (qword_1007851D8 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  sub_100018BF8(v11, (uint64_t)qword_100788648);
  sub_10003D820((uint64_t)_swiftEmptyArrayStorage);
  sub_10001A078();
  swift_bridgeObjectRelease();
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  type metadata accessor for MainActor();
  swift_retain();
  uint64_t v13 = static MainActor.shared.getter();
  v14 = (void *)swift_allocObject();
  v14[2] = v13;
  v14[3] = &protocol witness table for MainActor;
  v14[4] = v10;
  sub_1000286A4((uint64_t)v7, (uint64_t)&unk_100793D48, (uint64_t)v14);

  swift_release();
  sub_10003B6F8((uint64_t)v15, &qword_100788D60);
}

- (void)didTapCommit:(id)a3
{
  uint64_t v5 = sub_10003B754(&qword_10079AF90);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    objc_super v8 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
    v9 = self;
  }
  UIViewController.endFirstResponderEditing()();
  uint64_t v10 = *(uint64_t *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController_presenter);
  if (qword_1007851D8 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  sub_100018BF8(v11, (uint64_t)qword_100788648);
  sub_10003D820((uint64_t)_swiftEmptyArrayStorage);
  sub_10001A078();
  swift_bridgeObjectRelease();
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  type metadata accessor for MainActor();
  swift_retain();
  uint64_t v13 = static MainActor.shared.getter();
  v14 = (void *)swift_allocObject();
  v14[2] = v13;
  v14[3] = &protocol witness table for MainActor;
  v14[4] = v10;
  sub_1000286A4((uint64_t)v7, (uint64_t)&unk_100793D40, (uint64_t)v14);

  swift_release();
  sub_10003B6F8((uint64_t)v15, &qword_100788D60);
}

- (void)didTapShowPreview:(id)a3
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
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_100074248();

  sub_10003B6F8((uint64_t)v6, &qword_100788D60);
}

- (_TtC9Reminders46TTRITemplateSharingConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9Reminders46TTRITemplateSharingConfigurationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController_localUndoManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController_cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController_commitButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders46TTRITemplateSharingConfigurationViewController_tableDataController));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v4 = qword_1007851D8;
  id v5 = a3;
  v7 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100018BF8(v6, (uint64_t)qword_100788648);
  sub_10003D820((uint64_t)_swiftEmptyArrayStorage);
  sub_10001A078();
  swift_bridgeObjectRelease();
  sub_1000747D8(1);
}

@end
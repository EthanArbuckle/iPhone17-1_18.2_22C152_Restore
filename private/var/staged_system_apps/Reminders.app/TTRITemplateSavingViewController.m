@interface TTRITemplateSavingViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (NSUndoManager)undoManager;
- (_TtC9Reminders32TTRITemplateSavingViewController)initWithCoder:(id)a3;
- (_TtC9Reminders32TTRITemplateSavingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapCancel:(id)a3;
- (void)didTapCommit:(id)a3;
- (void)loadView;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation TTRITemplateSavingViewController

- (_TtC9Reminders32TTRITemplateSavingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003393E4();
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                  + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController_localUndoManager));
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)loadView
{
  v2 = self;
  sub_10033743C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100337568();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100337BC0(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = v8.receiver;
  [(TTRITemplateSavingViewController *)&v8 viewDidAppear:v3];
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
  [(TTRITemplateSavingViewController *)&v5 viewWillDisappear:v3];
  UIViewController.endFirstResponderEditing()();
  [v4 resignFirstResponder];
  TTRKeyboardAvoidance<>.stopAvoidingKeyboard()();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_100337E18();
}

- (void)didTapCancel:(id)a3
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
    memset(v8, 0, sizeof(v8));
    objc_super v5 = self;
  }
  v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController_cancelButton);
  if (v6)
  {
    id v7 = v6;
    sub_1002D1B70((uint64_t)v7);

    sub_10003D3BC((uint64_t)v8);
  }
  else
  {
    __break(1u);
  }
}

- (void)didTapCommit:(id)a3
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
    objc_super v5 = self;
  }
  UIViewController.endFirstResponderEditing()();
  sub_1002D21C4();

  sub_10003D3BC((uint64_t)v6);
}

- (_TtC9Reminders32TTRITemplateSavingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9Reminders32TTRITemplateSavingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController_localUndoManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController_cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController_commitButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController_tableDataController));
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  char v6 = sub_1002D146C();

  return (v6 & 1) == 0;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9Reminders32TTRITemplateSavingViewController_cancelButton);
  if (v3)
  {
    id v5 = a3;
    char v6 = self;
    id v7 = v3;
    sub_1002D1B70((uint64_t)v7);
  }
  else
  {
    __break(1u);
  }
}

@end
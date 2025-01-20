@interface TTRISmartListFilterEditorViewController
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (_TtC9Reminders39TTRISmartListFilterEditorViewController)initWithCoder:(id)a3;
- (_TtC9Reminders39TTRISmartListFilterEditorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancelButtonAction:(id)a3;
- (void)doneButtonAction:(id)a3;
- (void)loadView;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TTRISmartListFilterEditorViewController

- (_TtC9Reminders39TTRISmartListFilterEditorViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100245824();
}

- (void)loadView
{
  id v3 = objc_allocWithZone((Class)UITableView);
  v4 = self;
  id v5 = [v3 initWithFrame:2 style:0.0, 0.0, 0.0, 0.0];
  [v5 setEstimatedRowHeight:UITableViewAutomaticDimension];
  [v5 setEstimatedSectionHeaderHeight:UITableViewAutomaticDimension];
  [v5 setEstimatedSectionHeaderHeight:UITableViewAutomaticDimension];
  [(TTRISmartListFilterEditorViewController *)v4 setView:v5];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100236E58();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(TTRISmartListFilterEditorViewController *)&v7 viewWillAppear:v3];
  if ([v4 view])
  {
    self;
    uint64_t v5 = swift_dynamicCastObjCClassUnconditional();
    v6[3] = sub_1000368FC(0, (unint64_t *)&qword_10078E3B0);
    v6[4] = &protocol witness table for UITableView;
    v6[0] = v5;
    UIViewController.deselectRowsAlongsideTransition(for:animated:)();
    sub_100038CD8((uint64_t)v6);
    TTRKeyboardAvoidance<>.startAvoidingKeyboard()();
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(TTRISmartListFilterEditorViewController *)&v5 viewDidAppear:v3];
  [v4 becomeFirstResponder];
  *((unsigned char *)v4
  + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController_ttrAccessibilityShouldAnnounceOptionChanges) = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_1002373A4(a3);
}

- (void)cancelButtonAction:(id)a3
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
  sub_100242984();

  sub_10003B6F8((uint64_t)v6, &qword_100788D60);
}

- (void)doneButtonAction:(id)a3
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
  sub_1003A33C0();

  sub_10003B6F8((uint64_t)v6, &qword_100788D60);
}

- (_TtC9Reminders39TTRISmartListFilterEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9Reminders39TTRISmartListFilterEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController_tableDataController));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4 = self;
  objc_super v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController_presenter);
  uint64_t v6 = v5[13];
  uint64_t v7 = v5[14];
  sub_100038D28(v5 + 10, v6);
  v8 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 24);
  id v9 = a3;
  v10 = v4;
  LOBYTE(v4) = v8(v6, v7);

  return (v4 & 1) == 0;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_100242984();
}

@end
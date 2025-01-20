@interface TTRIReminderDetailViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (NSUndoManager)undoManager;
- (UITableView)tableView;
- (_TtC15RemindersUICore32TTRIReminderDetailViewController)initWithCoder:(id)a3;
- (_TtC15RemindersUICore32TTRIReminderDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4;
- (void)didTapCancel:(id)a3;
- (void)didTapCommit:(id)a3;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)setTableView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation TTRIReminderDetailViewController

- (_TtC15RemindersUICore32TTRIReminderDetailViewController)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore32TTRIReminderDetailViewController *)sub_1B95F0008(a3);
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                  + OBJC_IVAR____TtC15RemindersUICore32TTRIReminderDetailViewController_localUndoManager));
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B95F0508();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1B95F0E48(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v3 = self;
  sub_1B95FEBDC();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1B95F21A8(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1B95F2334();
}

- (UITableView)tableView
{
  v2 = (void *)MEMORY[0x1BA9DB180]((char *)self + OBJC_IVAR____TtC15RemindersUICore32TTRIReminderDetailViewController_tableView, a2);

  return (UITableView *)v2;
}

- (void)setTableView:(id)a3
{
}

- (void)didTapCancel:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1B9970200();
  swift_unknownObjectRelease();
  sub_1B960A394(1);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (void)didTapCommit:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1B9970200();
  swift_unknownObjectRelease();
  id v5 = [(TTRIReminderDetailViewController *)v4 viewIfLoaded];
  if (v5)
  {
    v6 = v5;
    v7 = (void *)UIView.firstResponderDescendant.getter();

    if (v7)
    {
      objc_msgSend(v7, sel_resignFirstResponder);
    }
  }
  sub_1B960A7B4(1);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v8);
}

- (_TtC15RemindersUICore32TTRIReminderDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15RemindersUICore32TTRIReminderDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_1B90CCA68((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore32TTRIReminderDetailViewController_viewModel, &qword_1E9F036F8);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore32TTRIReminderDetailViewController_tableDataController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore32TTRIReminderDetailViewController_localUndoManager));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore32TTRIReminderDetailViewController_cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore32TTRIReminderDetailViewController_commitButton));
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
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
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1B9600BC8(v7);
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  char v6 = sub_1B9609E18();

  return (v6 & 1) == 0;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = (_TtC15RemindersUICore32TTRIReminderDetailViewController *)a3;
  uint64_t v8 = self;
  id v5 = [(TTRIReminderDetailViewController *)v8 viewIfLoaded];
  if (v5)
  {
    char v6 = v5;
    id v7 = (_TtC15RemindersUICore32TTRIReminderDetailViewController *)UIView.firstResponderDescendant.getter();

    if (v7)
    {
      [(TTRIReminderDetailViewController *)v7 resignFirstResponder];

      id v4 = v8;
      uint64_t v8 = v7;
    }
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

@end
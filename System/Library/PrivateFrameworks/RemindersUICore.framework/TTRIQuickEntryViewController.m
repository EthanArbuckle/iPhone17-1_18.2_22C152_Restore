@interface TTRIQuickEntryViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (NSUndoManager)undoManager;
- (UIBarButtonItem)cancelButton;
- (UIBarButtonItem)commitButton;
- (UITableView)tableView;
- (_TtC15RemindersUICore28TTRIQuickEntryViewController)initWithCoder:(id)a3;
- (_TtC15RemindersUICore28TTRIQuickEntryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapCancel:(id)a3;
- (void)didTapCommit:(id)a3;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setCommitButton:(id)a3;
- (void)setTableView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation TTRIQuickEntryViewController

- (_TtC15RemindersUICore28TTRIQuickEntryViewController)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore28TTRIQuickEntryViewController *)sub_1B9435DB4(a3);
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                  + OBJC_IVAR____TtC15RemindersUICore28TTRIQuickEntryViewController_localUndoManager));
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B94360CC();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1B9437A44(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v3 = self;
  sub_1B943C50C();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1B9437EB8(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1B9437FD8();
}

- (UITableView)tableView
{
  v2 = (void *)MEMORY[0x1BA9DB180]((char *)self + OBJC_IVAR____TtC15RemindersUICore28TTRIQuickEntryViewController_tableView, a2);

  return (UITableView *)v2;
}

- (void)setTableView:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  v2 = (void *)MEMORY[0x1BA9DB180]((char *)self + OBJC_IVAR____TtC15RemindersUICore28TTRIQuickEntryViewController_cancelButton, a2);

  return (UIBarButtonItem *)v2;
}

- (void)setCancelButton:(id)a3
{
}

- (UIBarButtonItem)commitButton
{
  v2 = (void *)MEMORY[0x1BA9DB180]((char *)self + OBJC_IVAR____TtC15RemindersUICore28TTRIQuickEntryViewController_commitButton, a2);

  return (UIBarButtonItem *)v2;
}

- (void)setCommitButton:(id)a3
{
}

- (void)didTapCancel:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1B9970200();
  swift_unknownObjectRelease();
  sub_1B942B65C(1);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (void)didTapCommit:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1B9970200();
  swift_unknownObjectRelease();
  id v5 = [(TTRIQuickEntryViewController *)v4 viewIfLoaded];
  if (v5)
  {
    v6 = v5;
    v7 = (void *)UIView.firstResponderDescendant.getter();

    if (v7)
    {
      objc_msgSend(v7, sel_resignFirstResponder);
    }
  }
  sub_1B942BDB8(1);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v8);
}

- (_TtC15RemindersUICore28TTRIQuickEntryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15RemindersUICore28TTRIQuickEntryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore28TTRIQuickEntryViewController_tableDataController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore28TTRIQuickEntryViewController_localUndoManager));
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
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC15RemindersUICore28TTRIQuickEntryViewController_presenter);
  uint64_t v6 = *(void *)(v5 + OBJC_IVAR____TtC15RemindersUICore23TTRIQuickEntryPresenter_interactor + 8);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 80);
  id v9 = a3;
  v10 = self;
  if (v8(ObjectType, v6) & 1) != 0 || (sub_1B942B29C(v5))
  {

    char v11 = 0;
  }
  else
  {
    char v12 = sub_1B942B47C(v5);

    char v11 = v12 ^ 1;
  }
  return v11 & 1;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = (_TtC15RemindersUICore28TTRIQuickEntryViewController *)a3;
  uint64_t v8 = self;
  id v5 = [(TTRIQuickEntryViewController *)v8 viewIfLoaded];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = (_TtC15RemindersUICore28TTRIQuickEntryViewController *)UIView.firstResponderDescendant.getter();

    if (v7)
    {
      [(TTRIQuickEntryViewController *)v7 resignFirstResponder];

      id v4 = v8;
      uint64_t v8 = v7;
    }
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

@end
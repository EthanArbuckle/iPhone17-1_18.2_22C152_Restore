@interface FolderComposerBaseViewController
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (_TtC11MobileNotes32FolderComposerBaseViewController)initWithCoder:(id)a3;
- (_TtC11MobileNotes32FolderComposerBaseViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)cancelActionWithSender:(id)a3;
- (void)doneActionWithSender:(id)a3;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation FolderComposerBaseViewController

- (void)cancelActionWithSender:(id)a3
{
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v6 = a3;
  v7 = self;
  sub_1004BCF4C((uint64_t)v6, v7, v5);

  swift_release();
}

- (void)doneActionWithSender:(id)a3
{
  v4 = (_TtC11MobileNotes32FolderComposerBaseViewController *)a3;
  v7 = self;
  uint64_t v5 = (_TtC11MobileNotes32FolderComposerBaseViewController *)[(FolderComposerBaseViewController *)v7 navigationController];
  if (v5)
  {
    id v6 = v5;
    [(FolderComposerBaseViewController *)v5 dismissViewControllerAnimated:1 completion:0];

    v4 = v7;
    v7 = v6;
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FolderComposerBaseViewController();
  id v4 = v8.receiver;
  id v5 = a3;
  [(FolderComposerBaseViewController *)&v8 willMoveToParentViewController:v5];
  if (v5)
  {
    id v6 = [v5 presentationController];
    if (v6)
    {
      id v7 = v6;
      [v6 setDelegate:v4];

      id v5 = v4;
      id v4 = v7;
    }
  }
}

- (_TtC11MobileNotes32FolderComposerBaseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC11MobileNotes32FolderComposerBaseViewController *)sub_1004BCBCC(v5, v7, a4);
}

- (_TtC11MobileNotes32FolderComposerBaseViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32FolderComposerBaseViewController_initialFilterSelection) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32FolderComposerBaseViewController____lazy_storage___cancelBarButtonItem) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32FolderComposerBaseViewController____lazy_storage___doneBarButtonItem) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FolderComposerBaseViewController();
  return [(FolderComposerBaseViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes32FolderComposerBaseViewController_initialFilterSelection));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes32FolderComposerBaseViewController____lazy_storage___cancelBarButtonItem));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes32FolderComposerBaseViewController____lazy_storage___doneBarButtonItem);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return 2;
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  v3 = self;
  id v4 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x98);
  id v5 = a3;
  uint64_t v6 = v3;
  LOBYTE(v3) = v4();

  return (v3 & 1) == 0;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_1004BC840();
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1004BCF4C((uint64_t)v6, v5, v7);

  swift_release();
}

@end
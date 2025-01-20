@interface TTRIRootViewController
- (BOOL)canBecomeFirstResponder;
- (NSUndoManager)undoManager;
- (_TtC9Reminders22TTRIRootViewController)initWithCoder:(id)a3;
- (_TtC9Reminders22TTRIRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9Reminders22TTRIRootViewController)initWithStyle:(int64_t)a3;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)splitViewControllerDidCollapse:(id)a3;
- (void)splitViewControllerDidExpand:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TTRIRootViewController

- (void)splitViewControllerDidCollapse:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100016630(v4);
}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  int64_t v8 = sub_100012054(v6, a4);

  return v8;
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_10001AAA8(v8);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (_TtC9Reminders22TTRIRootViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders22TTRIRootViewController_pendingNavigateToRootPromise) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders22TTRIRootViewController_activityItemsConfigurationProviding) = 0;
  id v4 = a3;

  result = (_TtC9Reminders22TTRIRootViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue((*(id **)((char *)&self->super.super.super.super.isa
                                                                    + OBJC_IVAR____TtC9Reminders22TTRIRootViewController_presenter))[16]);
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    id v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    id v7 = self;
  }
  sub_1002D2F78((uint64_t)a3, (uint64_t)v16, &v17);

  sub_10003B6F8((uint64_t)v16, &qword_100788D60);
  uint64_t v8 = v18;
  if (v18)
  {
    v9 = sub_100038D28(&v17, v18);
    uint64_t v10 = *(void *)(v8 - 8);
    double v11 = __chkstk_darwin(v9);
    v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v10 + 16))(v13, v11);
    v14 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
    sub_100038CD8((uint64_t)&v17);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (_TtC9Reminders22TTRIRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9Reminders22TTRIRootViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9Reminders22TTRIRootViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC9Reminders22TTRIRootViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders22TTRIRootViewController_mainNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders22TTRIRootViewController_detailNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders22TTRIRootViewController_ttrMainViewController));
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders22TTRIRootViewController_activityItemsConfigurationProviding);
}

- (void)splitViewControllerDidExpand:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002D37B8(v4);
}

@end
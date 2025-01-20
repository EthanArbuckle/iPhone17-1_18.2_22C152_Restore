@interface TTRIDebugMenuViewController
- (UITableView)tableView;
- (_TtC9Reminders27TTRIDebugMenuViewController)initWithCoder:(id)a3;
- (_TtC9Reminders27TTRIDebugMenuViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapDone:(id)a3;
- (void)setTableView:(id)a3;
- (void)viewDidLoad;
@end

@implementation TTRIDebugMenuViewController

- (_TtC9Reminders27TTRIDebugMenuViewController)initWithCoder:(id)a3
{
  return (_TtC9Reminders27TTRIDebugMenuViewController *)sub_100110B80(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100110CE4();
}

- (UITableView)tableView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITableView *)Strong;
}

- (void)setTableView:(id)a3
{
}

- (void)didTapDone:(id)a3
{
  sub_100038D28(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC9Reminders27TTRIDebugMenuViewController_eventHandler)+ 6, (*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC9Reminders27TTRIDebugMenuViewController_eventHandler))[9]);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v8 = (id)Strong;
    id v6 = a3;
    v7 = self;
    [v8 dismissViewControllerAnimated:1 completion:0];
  }
}

- (_TtC9Reminders27TTRIDebugMenuViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9Reminders27TTRIDebugMenuViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders27TTRIDebugMenuViewController_tableDataController));
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

@end
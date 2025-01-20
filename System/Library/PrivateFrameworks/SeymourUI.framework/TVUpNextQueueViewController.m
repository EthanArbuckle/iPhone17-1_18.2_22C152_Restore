@interface TVUpNextQueueViewController
- (_TtC9SeymourUI27TVUpNextQueueViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI27TVUpNextQueueViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation TVUpNextQueueViewController

- (void)viewDidLoad
{
  v2 = self;
  TVUpNextQueueViewController.viewDidLoad()();
}

- (_TtC9SeymourUI27TVUpNextQueueViewController)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC9SeymourUI27TVUpNextQueueViewController_layout);
  _OWORD *v4 = xmmword_23A813480;
  v4[1] = xmmword_23A813490;
  id v5 = a3;

  result = (_TtC9SeymourUI27TVUpNextQueueViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI27TVUpNextQueueViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI27TVUpNextQueueViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TVUpNextQueueViewController_listViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27TVUpNextQueueViewController_focusedWorkoutController));

  swift_release();
}

@end
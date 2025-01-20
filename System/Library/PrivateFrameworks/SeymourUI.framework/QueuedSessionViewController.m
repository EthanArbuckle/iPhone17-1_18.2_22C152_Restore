@interface QueuedSessionViewController
- (_TtC9SeymourUI27QueuedSessionViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI27QueuedSessionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)viewDidLoad;
@end

@implementation QueuedSessionViewController

- (unint64_t)supportedInterfaceOrientations
{
  if (*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI27QueuedSessionViewController_platform) == 1) {
    return 30;
  }
  else {
    return 24;
  }
}

- (_TtC9SeymourUI27QueuedSessionViewController)initWithCoder:(id)a3
{
  result = (_TtC9SeymourUI27QueuedSessionViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(QueuedSessionViewController *)&v3 viewDidLoad];
  sub_23A2FAAF4();
}

- (_TtC9SeymourUI27QueuedSessionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI27QueuedSessionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end
@interface WorkoutHostingRemoteViewController
- (_TtC12WorkoutKitUI34WorkoutHostingRemoteViewController)initWithCoder:(id)a3;
- (_TtC12WorkoutKitUI34WorkoutHostingRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation WorkoutHostingRemoteViewController

- (_TtC12WorkoutKitUI34WorkoutHostingRemoteViewController)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_dismissCompletion);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_presentedRemoteViewController) = 0;
  id v5 = a3;

  result = (_TtC12WorkoutKitUI34WorkoutHostingRemoteViewController *)sub_2619EE820();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2619ECAE4();
}

- (_TtC12WorkoutKitUI34WorkoutHostingRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12WorkoutKitUI34WorkoutHostingRemoteViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_workout;
  uint64_t v4 = sub_2619EE7D0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_2619EC4B8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_dismissCompletion));
  id v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_presentedRemoteViewController);
}

@end
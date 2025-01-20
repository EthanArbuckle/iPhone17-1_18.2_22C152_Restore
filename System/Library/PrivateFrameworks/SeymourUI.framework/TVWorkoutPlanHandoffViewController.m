@interface TVWorkoutPlanHandoffViewController
- (_TtC9SeymourUI34TVWorkoutPlanHandoffViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI34TVWorkoutPlanHandoffViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVWorkoutPlanHandoffViewController

- (_TtC9SeymourUI34TVWorkoutPlanHandoffViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC9SeymourUI34TVWorkoutPlanHandoffViewController_handoffView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for TVWorkoutPlanHandoffView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC9SeymourUI34TVWorkoutPlanHandoffViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A78A260();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_23A78A3DC(a3);
}

- (_TtC9SeymourUI34TVWorkoutPlanHandoffViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI34TVWorkoutPlanHandoffViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TVWorkoutPlanHandoffViewController_handoffView));
}

@end
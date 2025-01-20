@interface TVQueueFocusedWorkoutViewController
- (_TtC9SeymourUI35TVQueueFocusedWorkoutViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI35TVQueueFocusedWorkoutViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation TVQueueFocusedWorkoutViewController

- (_TtC9SeymourUI35TVQueueFocusedWorkoutViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A29B5A8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A299660();
}

- (_TtC9SeymourUI35TVQueueFocusedWorkoutViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI35TVQueueFocusedWorkoutViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35TVQueueFocusedWorkoutViewController_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35TVQueueFocusedWorkoutViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35TVQueueFocusedWorkoutViewController_summaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35TVQueueFocusedWorkoutViewController_leftDescriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35TVQueueFocusedWorkoutViewController_rightDescriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35TVQueueFocusedWorkoutViewController_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35TVQueueFocusedWorkoutViewController_emptyStateView));

  swift_release();
}

@end
@interface WorkoutCountdownView
- (_TtC9SeymourUI20WorkoutCountdownView)initWithCoder:(id)a3;
- (_TtC9SeymourUI20WorkoutCountdownView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WorkoutCountdownView

- (_TtC9SeymourUI20WorkoutCountdownView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239E1B8D4();
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for WorkoutCountdownView();
  [(WorkoutCountdownView *)&v2 layoutSubviews];
}

- (_TtC9SeymourUI20WorkoutCountdownView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI20WorkoutCountdownView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI20WorkoutCountdownView_onCountdownStep));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI20WorkoutCountdownView_onCountdownWindUp));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI20WorkoutCountdownView_onCountdownFadeOut));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI20WorkoutCountdownView_onCountdownCompleted));

  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI20WorkoutCountdownView_countdownRingView);
}

@end
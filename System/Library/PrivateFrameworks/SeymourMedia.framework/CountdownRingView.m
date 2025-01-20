@interface CountdownRingView
- (_TtC12SeymourMedia17CountdownRingView)initWithCoder:(id)a3;
- (_TtC12SeymourMedia17CountdownRingView)initWithFrame:(CGRect)a3;
- (void)countdownAnimator:(id)a3 performingAnimation:(id)a4 withDuration:(double)a5;
- (void)countdownAnimatorDidFinishAnimating:(id)a3;
@end

@implementation CountdownRingView

- (_TtC12SeymourMedia17CountdownRingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22626D8F4();
}

- (_TtC12SeymourMedia17CountdownRingView)initWithFrame:(CGRect)a3
{
  result = (_TtC12SeymourMedia17CountdownRingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2261B43A8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12SeymourMedia17CountdownRingView_onCountdownStep));
  sub_2261B43A8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12SeymourMedia17CountdownRingView_onCountdownWindUp));
  sub_2261B43A8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12SeymourMedia17CountdownRingView_onCountdownFadeOut));
  sub_2261B43A8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12SeymourMedia17CountdownRingView_onCountdownCompleted));

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12SeymourMedia17CountdownRingView_countdownView);
}

- (void)countdownAnimatorDidFinishAnimating:(id)a3
{
  v5 = (void (**)(uint64_t))((char *)self
                                     + OBJC_IVAR____TtC12SeymourMedia17CountdownRingView_onCountdownCompleted);
  swift_beginAccess();
  v6 = *v5;
  if (*v5)
  {
    id v7 = a3;
    v8 = self;
    uint64_t v9 = sub_2261CE27C((uint64_t)v6);
    v6(v9);
    sub_2261B43A8((uint64_t)v6);
  }
}

- (void)countdownAnimator:(id)a3 performingAnimation:(id)a4 withDuration:(double)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  v8 = self;
  sub_22626D9E8(a4);

  swift_unknownObjectRelease();
}

@end
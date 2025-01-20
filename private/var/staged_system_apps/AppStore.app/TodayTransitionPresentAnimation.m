@interface TodayTransitionPresentAnimation
- (_TtC8AppStore31TodayTransitionPresentAnimation)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation TodayTransitionPresentAnimation

- (double)transitionDuration:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  swift_unknownObjectRetain_n();
  v5 = self;
  id v6 = [a3 containerView];
  id v7 = [v6 traitCollection];

  LOBYTE(v6) = UITraitCollection.isSizeClassCompact.getter();
  swift_unknownObjectRelease_n();

  double result = 0.61;
  if (v6) {
    return 0.62;
  }
  return result;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_100621728(0);
  if (*((unsigned char *)&v5->super.super.isa
       + OBJC_IVAR____TtC8AppStore31TodayTransitionPresentAnimation_shouldUseReducedMotionTransition) == 1)
  {
    sub_1001FBD34(a3);
  }
  else
  {
    sub_1001FB8F8(a3);
    if ((*((unsigned char *)&v5->super.super.isa
          + OBJC_IVAR____TtC8AppStore31TodayTransitionPresentAnimation_shouldAnimateTabBar) & 1) != 0)
      sub_1001FB744(a3);
  }
  swift_unknownObjectRelease();
}

- (_TtC8AppStore31TodayTransitionPresentAnimation)init
{
  double result = (_TtC8AppStore31TodayTransitionPresentAnimation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
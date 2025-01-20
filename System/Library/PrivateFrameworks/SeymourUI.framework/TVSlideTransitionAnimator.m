@interface TVSlideTransitionAnimator
- (_TtC9SeymourUI25TVSlideTransitionAnimator)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation TVSlideTransitionAnimator

- (_TtC9SeymourUI25TVSlideTransitionAnimator)init
{
  v2 = (char *)self + OBJC_IVAR____TtC9SeymourUI25TVSlideTransitionAnimator_configuration;
  *(_OWORD *)v2 = xmmword_23A82BCC0;
  *((_OWORD *)v2 + 1) = xmmword_23A82BCD0;
  *((void *)v2 + 4) = 0x4056800000000000;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TVSlideTransitionAnimator();
  return [(TVSlideTransitionAnimator *)&v4 init];
}

- (double)transitionDuration:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  v3 = self;
  double v4 = 0.0;
  if (objc_msgSend((id)swift_unknownObjectRetain(), sel_isAnimated)) {
    double v4 = *(double *)((char *)&v3->super.isa + OBJC_IVAR____TtC9SeymourUI25TVSlideTransitionAnimator_configuration);
  }
  swift_unknownObjectRelease();

  return v4;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_23A2992A0(a3);
  swift_unknownObjectRelease();
}

@end
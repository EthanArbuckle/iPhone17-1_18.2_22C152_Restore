@interface SearchUIBasicAnimationSettings
- (CABasicAnimation)coreAnimation;
- (UIViewPropertyAnimator)propertyAnimator;
- (_TtC8SearchUI30SearchUIBasicAnimationSettings)init;
- (double)delay;
- (double)duration;
- (void)setDelay:(double)a3;
- (void)setDuration:(double)a3;
@end

@implementation SearchUIBasicAnimationSettings

- (double)duration
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_duration);
  swift_beginAccess();
  return *v2;
}

- (void)setDuration:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_duration);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)delay
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_delay);
  swift_beginAccess();
  return *v2;
}

- (void)setDelay:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_delay);
  swift_beginAccess();
  double *v4 = a3;
}

- (CABasicAnimation)coreAnimation
{
  id v3 = objc_allocWithZone(MEMORY[0x1E4F39B48]);
  v4 = self;
  id v5 = objc_msgSend(v3, sel_init);
  v6 = (double *)((char *)v4 + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_duration);
  swift_beginAccess();
  objc_msgSend(v5, sel_setDuration_, *v6);

  return (CABasicAnimation *)v5;
}

- (UIViewPropertyAnimator)propertyAnimator
{
  id v3 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_duration);
  swift_beginAccess();
  double v4 = *v3;
  id v5 = objc_allocWithZone(MEMORY[0x1E4FB1698]);
  v6 = self;
  id v7 = objc_msgSend(v5, sel_initWithAnimationCurve_, 0);
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1ED8]), sel_initWithDuration_timingParameters_, v7, v4);

  return (UIViewPropertyAnimator *)v8;
}

- (_TtC8SearchUI30SearchUIBasicAnimationSettings)init
{
  result = (_TtC8SearchUI30SearchUIBasicAnimationSettings *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
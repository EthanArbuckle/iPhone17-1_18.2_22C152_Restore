@interface SearchUISpringAnimationSettings
+ (_TtC8SearchUI31SearchUISpringAnimationSettings)buttonIconAppear;
+ (_TtC8SearchUI31SearchUISpringAnimationSettings)buttonSelection;
+ (_TtC8SearchUI31SearchUISpringAnimationSettings)buttonSelectionCancel;
- (CABasicAnimation)coreAnimation;
- (UIViewPropertyAnimator)propertyAnimator;
- (_TtC8SearchUI31SearchUISpringAnimationSettings)init;
- (double)bounce;
- (double)delay;
- (double)perceptualDuration;
- (void)setBounce:(double)a3;
- (void)setDelay:(double)a3;
- (void)setPerceptualDuration:(double)a3;
@end

@implementation SearchUISpringAnimationSettings

+ (_TtC8SearchUI31SearchUISpringAnimationSettings)buttonSelection
{
  v2 = (objc_class *)type metadata accessor for SearchUISpringAnimationSettings();
  v3 = (char *)objc_allocWithZone(v2);
  *(void *)&v3[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay] = 0;
  *(void *)&v3[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce] = 0x3FD78D4FDF3B645ALL;
  *(void *)&v3[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration] = 0x3FD96F0068DB8BACLL;
  v6.receiver = v3;
  v6.super_class = v2;
  id v4 = objc_msgSendSuper2(&v6, sel_init);
  return (_TtC8SearchUI31SearchUISpringAnimationSettings *)v4;
}

+ (_TtC8SearchUI31SearchUISpringAnimationSettings)buttonSelectionCancel
{
  v2 = (objc_class *)type metadata accessor for SearchUISpringAnimationSettings();
  v3 = (char *)objc_allocWithZone(v2);
  *(void *)&v3[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay] = 0;
  *(void *)&v3[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce] = 0x3FD78D4FDF3B645ALL;
  *(void *)&v3[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration] = 0x3FE06A7EF9DB22D1;
  v6.receiver = v3;
  v6.super_class = v2;
  id v4 = objc_msgSendSuper2(&v6, sel_init);
  return (_TtC8SearchUI31SearchUISpringAnimationSettings *)v4;
}

+ (_TtC8SearchUI31SearchUISpringAnimationSettings)buttonIconAppear
{
  v2 = (objc_class *)type metadata accessor for SearchUISpringAnimationSettings();
  v3 = (char *)objc_allocWithZone(v2);
  *(void *)&v3[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay] = 0;
  *(void *)&v3[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce] = 0x3FDC6F694467381DLL;
  *(void *)&v3[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration] = 0x3FDE147AE147AE14;
  v6.receiver = v3;
  v6.super_class = v2;
  id v4 = objc_msgSendSuper2(&v6, sel_init);
  return (_TtC8SearchUI31SearchUISpringAnimationSettings *)v4;
}

- (double)bounce
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce);
  swift_beginAccess();
  return *v2;
}

- (void)setBounce:(double)a3
{
  id v4 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce);
  swift_beginAccess();
  *id v4 = a3;
}

- (double)perceptualDuration
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration);
  swift_beginAccess();
  return *v2;
}

- (void)setPerceptualDuration:(double)a3
{
  id v4 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration);
  swift_beginAccess();
  *id v4 = a3;
}

- (double)delay
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay);
  swift_beginAccess();
  return *v2;
}

- (void)setDelay:(double)a3
{
  id v4 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay);
  swift_beginAccess();
  *id v4 = a3;
}

- (CABasicAnimation)coreAnimation
{
  v3 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration);
  swift_beginAccess();
  double v4 = *v3;
  v5 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce);
  swift_beginAccess();
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F39C90]), sel_initWithPerceptualDuration_bounce_, v4, *v5);
  return (CABasicAnimation *)v6;
}

- (UIViewPropertyAnimator)propertyAnimator
{
  v3 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration);
  swift_beginAccess();
  double v4 = *v3;
  v5 = (double *)((char *)self + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce);
  swift_beginAccess();
  double v6 = *v5;
  id v7 = objc_allocWithZone(MEMORY[0x1E4FB1C58]);
  v8 = self;
  id v9 = objc_msgSend(v7, sel_initWithDuration_bounce_, v4, v6);
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1ED8]), sel_initWithDuration_timingParameters_, v9, 0.0);

  return (UIViewPropertyAnimator *)v10;
}

- (_TtC8SearchUI31SearchUISpringAnimationSettings)init
{
  result = (_TtC8SearchUI31SearchUISpringAnimationSettings *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
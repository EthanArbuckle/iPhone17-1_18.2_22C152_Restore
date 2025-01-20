@interface BouncyToRectAnimation
- (_TtC8AppStore21BouncyToRectAnimation)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation BouncyToRectAnimation

- (double)transitionDuration:(id)a3
{
  return 0.7;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v9 = self;
  sub_100621728(0);
  sub_10049986C(a3);
  if (*((unsigned char *)&v9->super.super.isa + OBJC_IVAR____TtC8AppStore21BouncyToRectAnimation_shouldAnimateTabBar) == 1
    && (v5 = (_TtC8AppStore21BouncyToRectAnimation *)[a3 viewControllerForKey:UITransitionContextToViewControllerKey]) != 0)
  {
    v6 = v5;
    self;
    v7 = (void *)swift_dynamicCastObjCClass();
    if (v7) {
      sub_1004A7F8C(v7, a3, 0);
    }
    swift_unknownObjectRelease();

    v8 = v6;
  }
  else
  {
    swift_unknownObjectRelease();
    v8 = v9;
  }
}

- (_TtC8AppStore21BouncyToRectAnimation)init
{
  result = (_TtC8AppStore21BouncyToRectAnimation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
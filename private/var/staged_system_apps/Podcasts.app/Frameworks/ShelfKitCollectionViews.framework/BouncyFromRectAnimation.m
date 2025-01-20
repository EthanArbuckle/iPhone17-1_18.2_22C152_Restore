@interface BouncyFromRectAnimation
- (_TtC23ShelfKitCollectionViews23BouncyFromRectAnimation)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation BouncyFromRectAnimation

- (double)transitionDuration:(id)a3
{
  return 0.7;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_16701C(a3);
  sub_166B0C(a3);
  swift_unknownObjectRelease();
}

- (_TtC23ShelfKitCollectionViews23BouncyFromRectAnimation)init
{
  result = (_TtC23ShelfKitCollectionViews23BouncyFromRectAnimation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
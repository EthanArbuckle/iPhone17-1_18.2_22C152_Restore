@interface StaticTransitionAnimator
- (_TtC23ShelfKitCollectionViews24StaticTransitionAnimator)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation StaticTransitionAnimator

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_26ED54(a3);
  swift_unknownObjectRelease();
}

- (_TtC23ShelfKitCollectionViews24StaticTransitionAnimator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StaticTransitionAnimator();
  return [(StaticTransitionAnimator *)&v3 init];
}

@end
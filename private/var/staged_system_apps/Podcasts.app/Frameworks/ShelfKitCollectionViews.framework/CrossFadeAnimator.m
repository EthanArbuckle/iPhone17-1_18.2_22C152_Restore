@interface CrossFadeAnimator
- (_TtC23ShelfKitCollectionViews17CrossFadeAnimator)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation CrossFadeAnimator

- (double)transitionDuration:(id)a3
{
  return 0.1;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1F597C(a3);
  swift_unknownObjectRelease();
}

- (_TtC23ShelfKitCollectionViews17CrossFadeAnimator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CrossFadeAnimator();
  return [(CrossFadeAnimator *)&v3 init];
}

@end
@interface CardPresentationAnimator
- (_TtC23ShelfKitCollectionViews24CardPresentationAnimator)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation CardPresentationAnimator

- (double)transitionDuration:(id)a3
{
  return 0.25;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_123CC0(a3);
  swift_unknownObjectRelease();
}

- (_TtC23ShelfKitCollectionViews24CardPresentationAnimator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CardPresentationAnimator();
  return [(CardPresentationAnimator *)&v3 init];
}

@end
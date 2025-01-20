@interface CardDismissalAnimator
- (_TtC23ShelfKitCollectionViews21CardDismissalAnimator)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation CardDismissalAnimator

- (double)transitionDuration:(id)a3
{
  return 0.15;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1D4850(a3);
  swift_unknownObjectRelease();
}

- (_TtC23ShelfKitCollectionViews21CardDismissalAnimator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CardDismissalAnimator();
  return [(CardDismissalAnimator *)&v3 init];
}

@end
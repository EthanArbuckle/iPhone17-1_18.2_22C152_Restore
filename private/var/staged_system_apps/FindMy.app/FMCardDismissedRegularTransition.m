@interface FMCardDismissedRegularTransition
- (_TtC6FindMy32FMCardDismissedRegularTransition)init;
- (void)animateTransition:(id)a3;
@end

@implementation FMCardDismissedRegularTransition

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1004162C4(a3);
  swift_unknownObjectRelease();
}

- (_TtC6FindMy32FMCardDismissedRegularTransition)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMCardDismissedRegularTransition();
  return [(FMCardTransition *)&v3 init];
}

@end
@interface FMCardPresentedRegularTransition
- (_TtC6FindMy32FMCardPresentedRegularTransition)init;
- (void)animateTransition:(id)a3;
@end

@implementation FMCardPresentedRegularTransition

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1002771D4(a3);
  swift_unknownObjectRelease();
}

- (_TtC6FindMy32FMCardPresentedRegularTransition)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMCardPresentedRegularTransition();
  return [(FMCardTransition *)&v3 init];
}

@end
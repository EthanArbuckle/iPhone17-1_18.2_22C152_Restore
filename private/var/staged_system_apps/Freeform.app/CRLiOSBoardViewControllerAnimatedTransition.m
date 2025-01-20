@interface CRLiOSBoardViewControllerAnimatedTransition
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation CRLiOSBoardViewControllerAnimatedTransition

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_100750108(a3);
  swift_unknownObjectRelease();
}

- (double)transitionDuration:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC8Freeform40CRLBoardViewControllerAnimatedTransition_animationGroup);
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_1006C9400(v4);
  swift_unknownObjectRelease();

  return v6;
}

@end
@interface ExpandedContentAnimator
- (_TtC8BookEPUB23ExpandedContentAnimator)init;
- (double)duration;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation ExpandedContentAnimator

- (double)duration
{
  return 0.4;
}

- (_TtC8BookEPUB23ExpandedContentAnimator)init
{
  result = (_TtC8BookEPUB23ExpandedContentAnimator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB23ExpandedContentAnimator_viewForAnimation));

  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8BookEPUB23ExpandedContentAnimator_landingShimView);
}

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  ExpandedContentAnimator.animateTransition(using:)(a3);
  swift_unknownObjectRelease();
}

@end
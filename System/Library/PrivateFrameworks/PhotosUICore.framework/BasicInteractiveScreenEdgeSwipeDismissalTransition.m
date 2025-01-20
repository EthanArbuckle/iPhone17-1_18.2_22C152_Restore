@interface BasicInteractiveScreenEdgeSwipeDismissalTransition
- (_TtC12PhotosUICore50BasicInteractiveScreenEdgeSwipeDismissalTransition)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation BasicInteractiveScreenEdgeSwipeDismissalTransition

- (double)transitionDuration:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AB234E4C();
}

- (void)animateTransition:(id)a3
{
}

- (_TtC12PhotosUICore50BasicInteractiveScreenEdgeSwipeDismissalTransition)init
{
  result = (_TtC12PhotosUICore50BasicInteractiveScreenEdgeSwipeDismissalTransition *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore50BasicInteractiveScreenEdgeSwipeDismissalTransition_interactiveTransition));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore50BasicInteractiveScreenEdgeSwipeDismissalTransition_slideTransition));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12PhotosUICore50BasicInteractiveScreenEdgeSwipeDismissalTransition_foregroundView);
}

@end
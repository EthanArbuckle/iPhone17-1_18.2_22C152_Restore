@interface BasicInteractiveSwipeDownTransition
- (_TtC12PhotosUICore35BasicInteractiveSwipeDownTransition)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation BasicInteractiveSwipeDownTransition

- (double)transitionDuration:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AB2348AC();
}

- (void)animateTransition:(id)a3
{
}

- (_TtC12PhotosUICore35BasicInteractiveSwipeDownTransition)init
{
  result = (_TtC12PhotosUICore35BasicInteractiveSwipeDownTransition *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore35BasicInteractiveSwipeDownTransition_grabAffordanceView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore35BasicInteractiveSwipeDownTransition_interactiveTransition));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12PhotosUICore35BasicInteractiveSwipeDownTransition_slideTransition);
}

@end
@interface PhotosSlideTransition
- (_TtC18PhotosUIFoundation21PhotosSlideTransition)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation PhotosSlideTransition

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_259D1F6E8(a3);
  swift_unknownObjectRelease();
}

- (_TtC18PhotosUIFoundation21PhotosSlideTransition)init
{
}

@end
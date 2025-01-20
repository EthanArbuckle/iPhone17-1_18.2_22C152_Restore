@interface TVSlideTransitionAnimationCoordinator
- (_TtC9SeymourUI37TVSlideTransitionAnimationCoordinator)init;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
@end

@implementation TVSlideTransitionAnimationCoordinator

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10 = objc_allocWithZone((Class)type metadata accessor for TVSlideTransitionAnimator());
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  id v15 = objc_msgSend(v10, sel_init);

  return v15;
}

- (_TtC9SeymourUI37TVSlideTransitionAnimationCoordinator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TVSlideTransitionAnimationCoordinator();
  return [(TVSlideTransitionAnimationCoordinator *)&v3 init];
}

@end
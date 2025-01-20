@interface PopTransitionDelegate
- (_TtC9SeymourUI21PopTransitionDelegate)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
@end

@implementation PopTransitionDelegate

- (id)animationControllerForDismissedController:(id)a3
{
  v5 = (objc_class *)type metadata accessor for PopTransitionAnimator();
  v6 = objc_allocWithZone(v5);
  *(void *)&v6[OBJC_IVAR____TtC9SeymourUI21PopTransitionAnimator_scale] = 0x3FEC28F5C28F5C29;
  v6[OBJC_IVAR____TtC9SeymourUI21PopTransitionAnimator_isPresenting] = 0;
  v11.receiver = v6;
  v11.super_class = v5;
  id v7 = a3;
  v8 = self;
  v9 = [(PopTransitionDelegate *)&v11 init];

  return v9;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  v9 = (objc_class *)type metadata accessor for PopTransitionAnimator();
  v10 = objc_allocWithZone(v9);
  *(void *)&v10[OBJC_IVAR____TtC9SeymourUI21PopTransitionAnimator_scale] = 0x3FEC28F5C28F5C29;
  v10[OBJC_IVAR____TtC9SeymourUI21PopTransitionAnimator_isPresenting] = 1;
  v17.receiver = v10;
  v17.super_class = v9;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = self;
  v15 = [(PopTransitionDelegate *)&v17 init];

  return v15;
}

- (_TtC9SeymourUI21PopTransitionDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PopTransitionDelegate();
  return [(PopTransitionDelegate *)&v3 init];
}

@end
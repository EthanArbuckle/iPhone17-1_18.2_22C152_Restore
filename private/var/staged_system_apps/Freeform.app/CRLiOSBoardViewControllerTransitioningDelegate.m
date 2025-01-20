@interface CRLiOSBoardViewControllerTransitioningDelegate
- (_TtC8Freeform46CRLiOSBoardViewControllerTransitioningDelegate)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
@end

@implementation CRLiOSBoardViewControllerTransitioningDelegate

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_1005FB458(v8, v9);

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1005FBFC8(v4);
  v7 = v6;

  return v7;
}

- (_TtC8Freeform46CRLiOSBoardViewControllerTransitioningDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLiOSBoardViewControllerTransitioningDelegate();
  return [(CRLiOSBoardViewControllerTransitioningDelegate *)&v3 init];
}

@end
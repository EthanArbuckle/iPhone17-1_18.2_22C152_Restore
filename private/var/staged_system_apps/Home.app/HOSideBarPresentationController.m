@interface HOSideBarPresentationController
- (CGRect)frameOfPresentedViewInContainerView;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (void)containerViewWillLayoutSubviews;
@end

@implementation HOSideBarPresentationController

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  objc_opt_class();
  v5 = [(HOSideBarPresentationController *)self presentingViewController];
  v6 = [v5 viewControllers];
  v7 = [v6 objectAtIndexedSubscript:0];
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  v10 = [v9 view];
  [v10 frame];
  double v12 = v11;
  v13 = [v9 view];

  [v13 frame];
  double v15 = v14;

  double v16 = v12;
  double v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)containerViewWillLayoutSubviews
{
  [(HOSideBarPresentationController *)self frameOfPresentedViewInContainerView];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(HOSideBarPresentationController *)self presentedView];
  [v11 setFrame:v4, v6, v8, v10];
}

- (CGRect)frameOfPresentedViewInContainerView
{
  CGFloat y = CGPointZero.y;
  double v4 = [(HOSideBarPresentationController *)self presentedViewController];
  double v5 = [(HOSideBarPresentationController *)self containerView];
  [v5 bounds];
  -[HOSideBarPresentationController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v4, v6, v7);
  double v9 = v8;
  double v11 = v10;

  double x = CGPointZero.x;
  double v13 = y;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.CGFloat y = v13;
  result.origin.double x = x;
  return result;
}

@end
@interface PREditorRemoteViewPresentationController
- (CGRect)frameOfPresentedViewInContainerView;
- (void)containerViewDidLayoutSubviews;
@end

@implementation PREditorRemoteViewPresentationController

- (CGRect)frameOfPresentedViewInContainerView
{
  v3 = [(PREditorRemoteViewPresentationController *)self presentedViewController];
  [v3 preferredContentSize];
  if (v5 >= 50.0) {
    double v6 = v5;
  }
  else {
    double v6 = 50.0;
  }
  if (v4 >= 400.0) {
    double v7 = v4;
  }
  else {
    double v7 = 400.0;
  }
  v8 = [(PREditorRemoteViewPresentationController *)self presentingViewController];
  v9 = [v8 view];
  [v9 bounds];
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  CGFloat v14 = CGRectGetMidX(v20) + v7 * -0.5;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGFloat v15 = CGRectGetMaxY(v21) - v6;

  double v16 = v14;
  double v17 = v15;
  double v18 = v7;
  double v19 = v6;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (void)containerViewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PREditorRemoteViewPresentationController;
  [(PREditorRemoteViewPresentationController *)&v4 containerViewDidLayoutSubviews];
  v3 = [(PREditorRemoteViewPresentationController *)self presentedView];
  [(PREditorRemoteViewPresentationController *)self frameOfPresentedViewInContainerView];
  objc_msgSend(v3, "setFrame:");
}

@end
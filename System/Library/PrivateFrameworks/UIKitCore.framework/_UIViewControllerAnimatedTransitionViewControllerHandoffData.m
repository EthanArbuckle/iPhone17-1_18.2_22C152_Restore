@interface _UIViewControllerAnimatedTransitionViewControllerHandoffData
- (CGRect)frame;
- (CGRect)targetFrame;
- (UIView)containerView;
- (UIView)snapshot;
- (UIViewController)viewController;
- (_UIViewControllerAnimatedTransitionViewControllerHandoffData)initWithViewController:(id)a3 containerView:(id)a4 snapshot:(id)a5 frame:(CGRect)a6 targetFrame:(CGRect)a7 dimmingAmount:(double)a8 targetDimmingAmount:(double)a9;
- (double)dimmingAmount;
- (double)targetDimmingAmount;
- (void)setContainerView:(id)a3;
@end

@implementation _UIViewControllerAnimatedTransitionViewControllerHandoffData

- (_UIViewControllerAnimatedTransitionViewControllerHandoffData)initWithViewController:(id)a3 containerView:(id)a4 snapshot:(id)a5 frame:(CGRect)a6 targetFrame:(CGRect)a7 dimmingAmount:(double)a8 targetDimmingAmount:(double)a9
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  CGFloat v13 = a6.size.height;
  CGFloat v14 = a6.size.width;
  CGFloat v15 = a6.origin.y;
  CGFloat v16 = a6.origin.x;
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  v26.receiver = self;
  v26.super_class = (Class)_UIViewControllerAnimatedTransitionViewControllerHandoffData;
  v23 = [(_UIViewControllerAnimatedTransitionViewControllerHandoffData *)&v26 init];
  v24 = v23;
  if (v23)
  {
    objc_storeWeak((id *)&v23->_viewController, v20);
    objc_storeStrong((id *)&v24->_containerView, a4);
    objc_storeStrong((id *)&v24->_snapshot, a5);
    v24->_frame.origin.CGFloat x = v16;
    v24->_frame.origin.CGFloat y = v15;
    v24->_frame.size.CGFloat width = v14;
    v24->_frame.size.CGFloat height = v13;
    v24->_targetFrame.origin.CGFloat x = x;
    v24->_targetFrame.origin.CGFloat y = y;
    v24->_targetFrame.size.CGFloat width = width;
    v24->_targetFrame.size.CGFloat height = height;
    v24->_dimmingAmount = a8;
    v24->_targetDimmingAmount = a9;
  }

  return v24;
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (UIViewController *)WeakRetained;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIView)snapshot
{
  return self->_snapshot;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)targetFrame
{
  double x = self->_targetFrame.origin.x;
  double y = self->_targetFrame.origin.y;
  double width = self->_targetFrame.size.width;
  double height = self->_targetFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)dimmingAmount
{
  return self->_dimmingAmount;
}

- (double)targetDimmingAmount
{
  return self->_targetDimmingAmount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_destroyWeak((id *)&self->_viewController);
}

@end
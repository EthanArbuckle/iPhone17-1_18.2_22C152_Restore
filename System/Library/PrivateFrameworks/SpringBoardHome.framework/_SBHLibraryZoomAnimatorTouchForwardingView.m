@interface _SBHLibraryZoomAnimatorTouchForwardingView
- (UIView)touchForwardingTargetView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setTouchForwardingTargetView:(id)a3;
@end

@implementation _SBHLibraryZoomAnimatorTouchForwardingView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(_SBHLibraryZoomAnimatorTouchForwardingView *)self touchForwardingTargetView];
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = objc_msgSend(v8, "hitTest:withEvent:", v7, x, y);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_SBHLibraryZoomAnimatorTouchForwardingView;
    uint64_t v10 = -[_SBHLibraryZoomAnimatorTouchForwardingView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
  }
  v11 = (void *)v10;

  return v11;
}

- (UIView)touchForwardingTargetView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchForwardingTargetView);
  return (UIView *)WeakRetained;
}

- (void)setTouchForwardingTargetView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
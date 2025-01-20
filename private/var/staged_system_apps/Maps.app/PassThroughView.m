@interface PassThroughView
- (BOOL)_isTransparentFocusRegion;
- (PassThroughViewDelegate)delegate;
- (UIView)targetView;
- (void)didMoveToSuperview;
- (void)setDelegate:(id)a3;
- (void)setTargetView:(id)a3;
@end

@implementation PassThroughView

- (void)setDelegate:(id)a3
{
}

- (void)didMoveToSuperview
{
  v3 = [(PassThroughView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v6 = [(PassThroughView *)self delegate];
    v5 = [(PassThroughView *)self superview];
    [v6 passThroughView:self didMoveToView:v5];
  }
}

- (PassThroughViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PassThroughViewDelegate *)WeakRetained;
}

- (BOOL)_isTransparentFocusRegion
{
  return 1;
}

- (UIView)targetView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);

  return (UIView *)WeakRetained;
}

- (void)setTargetView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_targetView);
}

@end
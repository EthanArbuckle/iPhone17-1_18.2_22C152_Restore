@interface _MFStackContainerView
- (UIEdgeInsets)layoutInsets;
- (_MFStackContainerViewDelegate)delegate;
- (void)didMoveToWindow;
- (void)setDelegate:(id)a3;
- (void)setLayoutInsets:(UIEdgeInsets)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _MFStackContainerView

- (void)setDelegate:(id)a3
{
}

- (void)willMoveToWindow:(id)a3
{
  if (a3)
  {
    id v4 = [(_MFStackContainerView *)self delegate];
    [v4 stackContainerViewWillBecomeVisible:self];
  }
}

- (void)didMoveToWindow
{
  v3 = [(_MFStackContainerView *)self window];

  if (!v3)
  {
    id v4 = [(_MFStackContainerView *)self delegate];
    [v4 stackContainerViewDidBecomeInvisible:self];
  }
}

- (_MFStackContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_MFStackContainerViewDelegate *)WeakRetained;
}

- (UIEdgeInsets)layoutInsets
{
  double top = self->_layoutInsets.top;
  double left = self->_layoutInsets.left;
  double bottom = self->_layoutInsets.bottom;
  double right = self->_layoutInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setLayoutInsets:(UIEdgeInsets)a3
{
  self->_layoutInsets = a3;
}

- (void).cxx_destruct
{
}

@end
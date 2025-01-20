@interface _UISearchBarContainerView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5;
- (void)_uncontainerSubview:(id)a3;
- (void)enforceSubviewAtBottomIfNecessary;
- (void)safeAreaInsetsDidChange;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation _UISearchBarContainerView

- (void)safeAreaInsetsDidChange
{
  if (self->_shouldSendContainerSafeAreaInsetsDidChange) {
    [(UIView *)self->_subview _containerSafeAreaInsetsDidChange:self];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UISearchBarContainerView;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_UISearchBarContainerView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    v7 = 0;
  }
  else {
    v7 = v5;
  }

  return v7;
}

- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5
{
  v8 = (UIView *)a3;
  v11.receiver = self;
  v11.super_class = (Class)_UISearchBarContainerView;
  [(UIView *)&v11 _addSubview:v8 positioned:a4 relativeTo:a5];
  char v9 = objc_opt_respondsToSelector();
  self->_shouldSendContainerSafeAreaInsetsDidChange = v9 & 1;
  if (v9) {
    [(UIView *)v8 _containerSafeAreaInsetsDidChange:self];
  }
  self->_resizingMask = [(UIView *)v8 autoresizingMask];
  [(UIView *)v8 setAutoresizingMask:10];
  subview = self->_subview;
  self->_subview = v8;
}

- (void)_uncontainerSubview:(id)a3
{
  if (self->_subview == a3)
  {
    [a3 setAutoresizingMask:self->_resizingMask];
    subview = self->_subview;
    self->_subview = 0;
  }
}

- (void)enforceSubviewAtBottomIfNecessary
{
  [(UIView *)self->_subview frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIView *)self bounds];
  double MaxY = CGRectGetMaxY(v16);
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  double v12 = CGRectGetMaxY(v17);
  if (MaxY != v12)
  {
    double v13 = MaxY - v12;
    if (v13 != 0.0)
    {
      subview = self->_subview;
      -[UIView setFrame:](subview, "setFrame:", v4, v6 + v13, v8, v10);
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UISearchBarContainerView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UISearchBarContainerView *)self enforceSubviewAtBottomIfNecessary];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UISearchBarContainerView;
  -[UIView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UISearchBarContainerView *)self enforceSubviewAtBottomIfNecessary];
}

- (void).cxx_destruct
{
}

@end
@interface _UIIndexBarStaticScrollAccessory
- (BOOL)overlay;
- (BOOL)showIndexBar;
- (UIIndexBarAccessoryView)indexBarView;
- (UIScrollView)scrollView;
- (int64_t)desiredAccessoryEdge;
- (int64_t)edge;
- (void)layoutSubviews;
- (void)setEdge:(int64_t)a3;
- (void)setScrollView:(id)a3;
- (void)setShowIndexBar:(BOOL)a3;
- (void)update;
@end

@implementation _UIIndexBarStaticScrollAccessory

- (void)setShowIndexBar:(BOOL)a3
{
  if (self->_showIndexBar != a3)
  {
    BOOL v3 = a3;
    self->_showIndexBar = a3;
    -[_UIStaticScrollBar setShouldInsetButtonsForIndex:](self, "setShouldInsetButtonsForIndex:");
    if (v3)
    {
      id v14 = 0;
      id v15 = 0;
      v5 = [(UIView *)self traitCollection];
      +[UIIndexBarView makeIndexBarView:&v15 containerView:&v14 forTraits:v5];
      v6 = (UIIndexBarAccessoryView *)v15;
      v7 = (UIView *)v14;

      indexBarView = self->_indexBarView;
      self->_indexBarView = v6;
      v9 = v6;

      containerView = self->_containerView;
      self->_containerView = v7;
      v11 = v7;

      [(UIView *)self addSubview:self->_containerView];
    }
    else
    {
      [(UIView *)self->_containerView removeFromSuperview];
      v12 = self->_indexBarView;
      self->_indexBarView = 0;

      v13 = self->_containerView;
      self->_containerView = 0;
    }
  }
}

- (void)update
{
  v3.receiver = self;
  v3.super_class = (Class)_UIIndexBarStaticScrollAccessory;
  [(_UIStaticScrollBar *)&v3 update];
  [(UIIndexBarAccessoryView *)self->_indexBarView update];
}

- (int64_t)desiredAccessoryEdge
{
  if ([(UIView *)self _shouldReverseLayoutDirection]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIIndexBarStaticScrollAccessory;
  return [(_UIStaticScrollBar *)&v4 desiredAccessoryEdge];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)_UIIndexBarStaticScrollAccessory;
  [(_UIStaticScrollBar *)&v11 layoutSubviews];
  objc_super v3 = [(_UIStaticScrollBar *)self downButton];
  [v3 frame];
  double MinY = CGRectGetMinY(v12);
  v5 = [(_UIStaticScrollBar *)self upButton];
  [v5 frame];
  double v6 = MinY - CGRectGetMaxY(v13);

  if (v6 <= 0.0) {
    double v6 = 64.0;
  }
  [(_UIStaticScrollBar *)self centeringBounds];
  -[UIView setFrame:](self->_containerView, "setFrame:", round(v8 + (v7 - v7) * 0.5), round(v10 + (v9 - v6) * 0.5));
}

- (int64_t)edge
{
  return self->_edge;
}

- (void)setEdge:(int64_t)a3
{
  self->_edge = a3;
}

- (BOOL)overlay
{
  return self->_overlay;
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (UIScrollView *)WeakRetained;
}

- (void)setScrollView:(id)a3
{
}

- (BOOL)showIndexBar
{
  return self->_showIndexBar;
}

- (UIIndexBarAccessoryView)indexBarView
{
  return self->_indexBarView;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollView);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_indexBarView, 0);
}

@end
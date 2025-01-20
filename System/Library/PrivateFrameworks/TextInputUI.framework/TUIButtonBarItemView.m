@interface TUIButtonBarItemView
- (BOOL)_isPad;
- (BOOL)isCollapsedItem;
- (UIBarButtonItem)associatedItem;
- (UIBarButtonItemGroup)associatedGroup;
- (UIView)contentView;
- (UIView)customView;
- (_UIButtonBarButton)barButtonView;
- (void)layoutSubviews;
- (void)setAssociatedGroup:(id)a3;
- (void)setAssociatedItem:(id)a3;
- (void)setBarButtonView:(id)a3;
- (void)setCollapsedItem:(BOOL)a3;
- (void)setCustomView:(id)a3;
@end

@implementation TUIButtonBarItemView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_barButtonView, 0);
  objc_storeStrong((id *)&self->_associatedGroup, 0);
  objc_storeStrong((id *)&self->_associatedItem, 0);
}

- (UIView)customView
{
  return self->_customView;
}

- (_UIButtonBarButton)barButtonView
{
  return self->_barButtonView;
}

- (void)setAssociatedGroup:(id)a3
{
}

- (UIBarButtonItemGroup)associatedGroup
{
  return self->_associatedGroup;
}

- (void)setAssociatedItem:(id)a3
{
}

- (UIBarButtonItem)associatedItem
{
  return self->_associatedItem;
}

- (void)setCollapsedItem:(BOOL)a3
{
  self->_collapsedItem = a3;
}

- (BOOL)isCollapsedItem
{
  return self->_collapsedItem;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)TUIButtonBarItemView;
  [(TUIButtonBarItemView *)&v16 layoutSubviews];
  [(TUIButtonBarItemView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (![(TUIButtonBarItemView *)self _isPad])
  {
    UIRectInsetEdges();
    double v4 = v11;
    double v6 = v12;
    double v8 = v13;
    double v10 = v14;
  }
  v15 = [(TUIButtonBarItemView *)self contentView];
  objc_msgSend(v15, "setFrame:", v4, v6, v8, v10);
}

- (BOOL)_isPad
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return [MEMORY[0x1E4FB1900] isFloating] ^ 1;
  }
  else {
    return 0;
  }
}

- (void)setBarButtonView:(id)a3
{
  id v5 = a3;
  [(_UIButtonBarButton *)self->_barButtonView removeFromSuperview];
  objc_storeStrong((id *)&self->_barButtonView, a3);
  if (self->_barButtonView)
  {
    -[TUIButtonBarItemView addSubview:](self, "addSubview:");
    [(UIView *)self->_customView setHidden:1];
    [(_UIButtonBarButton *)self->_barButtonView setHidden:0];
  }
}

- (void)setCustomView:(id)a3
{
  id v7 = a3;
  p_customView = &self->_customView;
  double v6 = [(UIView *)self->_customView superview];

  if (v6 == self) {
    [(UIView *)*p_customView removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_customView, a3);
  if (*p_customView)
  {
    [(UIView *)*p_customView setTranslatesAutoresizingMaskIntoConstraints:1];
    [(TUIButtonBarItemView *)self addSubview:*p_customView];
    [(_UIButtonBarButton *)self->_barButtonView setHidden:1];
  }
}

- (UIView)contentView
{
  customView = self->_customView;
  if (!customView) {
    customView = self->_barButtonView;
  }
  id v3 = customView;
  return (UIView *)v3;
}

@end
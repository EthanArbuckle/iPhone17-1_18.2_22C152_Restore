@interface SUUIScrollingTabBarBackgroundView
- (BOOL)showsBackdrop;
- (BOOL)showsBottomHairline;
- (BOOL)showsTopHairline;
- (BOOL)usesOpaqueColorForTopHairline;
- (NSString)backdropBarGroupName;
- (void)_updateTopHairlineColor;
- (void)layoutSubviews;
- (void)setBackdropBarGroupName:(id)a3;
- (void)setShowsBackdrop:(BOOL)a3;
- (void)setShowsBottomHairline:(BOOL)a3;
- (void)setShowsTopHairline:(BOOL)a3;
- (void)setUsesOpaqueColorForTopHairline:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SUUIScrollingTabBarBackgroundView

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)SUUIScrollingTabBarBackgroundView;
  [(SUUIScrollingTabBarBackgroundView *)&v22 layoutSubviews];
  [(SUUIScrollingTabBarBackgroundView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(SUUIScrollingTabBarBackgroundView *)self traitCollection];
  [v11 displayScale];
  double v13 = v12;

  if (v13 < 0.00000011920929)
  {
    v14 = [MEMORY[0x263F82B60] mainScreen];
    [v14 scale];
    double v13 = v15;
  }
  backdropView = self->_backdropView;
  if (backdropView) {
    -[_UIBackdropView setFrame:](backdropView, "setFrame:", v4, v6, v8, v10);
  }
  double v17 = 1.0 / v13;
  if (self->_topHairlineView)
  {
    v23.origin.x = v4;
    v23.origin.y = v6;
    v23.size.width = v8;
    v23.size.height = v10;
    double MinX = CGRectGetMinX(v23);
    v24.origin.x = v4;
    v24.origin.y = v6;
    v24.size.width = v8;
    v24.size.height = v10;
    CGFloat v19 = CGRectGetMinY(v24) - v17;
    v25.origin.x = v4;
    v25.origin.y = v6;
    v25.size.width = v8;
    v25.size.height = v10;
    -[UIView setFrame:](self->_topHairlineView, "setFrame:", MinX, v19, CGRectGetWidth(v25), v17);
  }
  if (self->_bottomHairlineView)
  {
    v26.origin.x = v4;
    v26.origin.y = v6;
    v26.size.width = v8;
    v26.size.height = v10;
    double v20 = CGRectGetMinX(v26);
    v27.origin.x = v4;
    v27.origin.y = v6;
    v27.size.width = v8;
    v27.size.height = v10;
    CGFloat v21 = CGRectGetMaxY(v27) - v17;
    v28.origin.x = v4;
    v28.origin.y = v6;
    v28.size.width = v8;
    v28.size.height = v10;
    -[UIView setFrame:](self->_bottomHairlineView, "setFrame:", v20, v21, CGRectGetWidth(v28), v17);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SUUIScrollingTabBarBackgroundView;
  id v4 = a3;
  [(SUUIScrollingTabBarBackgroundView *)&v10 traitCollectionDidChange:v4];
  objc_msgSend(v4, "displayScale", v10.receiver, v10.super_class);
  double v6 = v5;

  double v7 = [(SUUIScrollingTabBarBackgroundView *)self traitCollection];
  [v7 displayScale];
  double v9 = vabdd_f64(v6, v8);

  if (v9 > 0.00000011920929) {
    [(SUUIScrollingTabBarBackgroundView *)self setNeedsLayout];
  }
}

- (void)setBackdropBarGroupName:(id)a3
{
  backdropView = (_UIBackdropView *)a3;
  double v5 = backdropView;
  if ((_UIBackdropView *)self->_backdropBarGroupName != backdropView)
  {
    double v8 = backdropView;
    double v6 = (NSString *)[(_UIBackdropView *)backdropView copy];
    backdropBarGroupName = self->_backdropBarGroupName;
    self->_backdropBarGroupName = v6;

    double v5 = v8;
    backdropView = self->_backdropView;
    if (backdropView)
    {
      backdropView = (_UIBackdropView *)[(_UIBackdropView *)backdropView setGroupName:v8];
      double v5 = v8;
    }
  }
  MEMORY[0x270F9A758](backdropView, v5);
}

- (void)setShowsBackdrop:(BOOL)a3
{
  if (self->_showsBackdrop != a3)
  {
    self->_showsBackdrop = a3;
    if (a3)
    {
      if (self->_backdropView)
      {
        BOOL v4 = 0;
      }
      else
      {
        id v5 = objc_alloc(MEMORY[0x263F82EB8]);
        [(SUUIScrollingTabBarBackgroundView *)self bounds];
        double v6 = (_UIBackdropView *)objc_msgSend(v5, "initWithFrame:privateStyle:", 2010);
        backdropView = self->_backdropView;
        self->_backdropView = v6;

        [(_UIBackdropView *)self->_backdropView setUserInteractionEnabled:0];
        if (self->_backdropBarGroupName) {
          -[_UIBackdropView setGroupName:](self->_backdropView, "setGroupName:");
        }
        [(SUUIScrollingTabBarBackgroundView *)self insertSubview:self->_backdropView atIndex:0];
        [(SUUIScrollingTabBarBackgroundView *)self setNeedsLayout];
        BOOL v4 = !self->_showsBackdrop;
      }
    }
    else
    {
      BOOL v4 = 1;
    }
    double v8 = self->_backdropView;
    [(_UIBackdropView *)v8 setHidden:v4];
  }
}

- (void)setShowsBottomHairline:(BOOL)a3
{
  if (self->_showsBottomHairline != a3)
  {
    self->_showsBottomHairline = a3;
    if (a3)
    {
      if (self->_bottomHairlineView)
      {
        BOOL v4 = 0;
      }
      else
      {
        id v5 = objc_alloc(MEMORY[0x263F82E00]);
        double v6 = (UIView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        bottomHairlineView = self->_bottomHairlineView;
        self->_bottomHairlineView = v6;

        double v8 = self->_bottomHairlineView;
        double v9 = [MEMORY[0x263F825C8] _barHairlineShadowColor];
        [(UIView *)v8 setBackgroundColor:v9];

        [(UIView *)self->_bottomHairlineView setUserInteractionEnabled:0];
        [(SUUIScrollingTabBarBackgroundView *)self addSubview:self->_bottomHairlineView];
        [(SUUIScrollingTabBarBackgroundView *)self setNeedsLayout];
        BOOL v4 = !self->_showsBottomHairline;
      }
    }
    else
    {
      BOOL v4 = 1;
    }
    objc_super v10 = self->_bottomHairlineView;
    [(UIView *)v10 setHidden:v4];
  }
}

- (void)setShowsTopHairline:(BOOL)a3
{
  if (self->_showsTopHairline != a3)
  {
    self->_showsTopHairline = a3;
    if (a3)
    {
      if (self->_topHairlineView)
      {
        BOOL v4 = 0;
      }
      else
      {
        id v5 = objc_alloc(MEMORY[0x263F82E00]);
        double v6 = (UIView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        topHairlineView = self->_topHairlineView;
        self->_topHairlineView = v6;

        [(UIView *)self->_topHairlineView setUserInteractionEnabled:0];
        [(SUUIScrollingTabBarBackgroundView *)self _updateTopHairlineColor];
        [(SUUIScrollingTabBarBackgroundView *)self addSubview:self->_topHairlineView];
        [(SUUIScrollingTabBarBackgroundView *)self setNeedsLayout];
        BOOL v4 = !self->_showsTopHairline;
      }
    }
    else
    {
      BOOL v4 = 1;
    }
    double v8 = self->_topHairlineView;
    [(UIView *)v8 setHidden:v4];
  }
}

- (void)setUsesOpaqueColorForTopHairline:(BOOL)a3
{
  if (self->_usesOpaqueColorForTopHairline != a3)
  {
    self->_usesOpaqueColorForTopHairline = a3;
    [(SUUIScrollingTabBarBackgroundView *)self _updateTopHairlineColor];
  }
}

- (void)_updateTopHairlineColor
{
  if (self->_usesOpaqueColorForTopHairline) {
    [MEMORY[0x263F825C8] colorWithWhite:0.615686275 alpha:1.0];
  }
  else {
  id v3 = [MEMORY[0x263F825C8] _barHairlineShadowColor];
  }
  [(UIView *)self->_topHairlineView setBackgroundColor:v3];
}

- (NSString)backdropBarGroupName
{
  return self->_backdropBarGroupName;
}

- (BOOL)showsBackdrop
{
  return self->_showsBackdrop;
}

- (BOOL)showsBottomHairline
{
  return self->_showsBottomHairline;
}

- (BOOL)showsTopHairline
{
  return self->_showsTopHairline;
}

- (BOOL)usesOpaqueColorForTopHairline
{
  return self->_usesOpaqueColorForTopHairline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropBarGroupName, 0);
  objc_storeStrong((id *)&self->_topHairlineView, 0);
  objc_storeStrong((id *)&self->_bottomHairlineView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
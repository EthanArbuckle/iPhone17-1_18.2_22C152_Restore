@interface SKUIScrollingTabBarBackgroundView
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

@implementation SKUIScrollingTabBarBackgroundView

- (void)layoutSubviews
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIScrollingTabBarBackgroundView layoutSubviews]";
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SKUIScrollingTabBarBackgroundView;
  id v4 = a3;
  [(SKUIScrollingTabBarBackgroundView *)&v10 traitCollectionDidChange:v4];
  objc_msgSend(v4, "displayScale", v10.receiver, v10.super_class);
  double v6 = v5;

  v7 = [(SKUIScrollingTabBarBackgroundView *)self traitCollection];
  [v7 displayScale];
  double v9 = vabdd_f64(v6, v8);

  if (v9 > 0.00000011920929) {
    [(SKUIScrollingTabBarBackgroundView *)self setNeedsLayout];
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

  MEMORY[0x1F41817F8](backdropView, v5);
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
        id v5 = objc_alloc(MEMORY[0x1E4FB1FE0]);
        [(SKUIScrollingTabBarBackgroundView *)self bounds];
        double v6 = (_UIBackdropView *)objc_msgSend(v5, "initWithFrame:privateStyle:", 2010);
        backdropView = self->_backdropView;
        self->_backdropView = v6;

        [(_UIBackdropView *)self->_backdropView setUserInteractionEnabled:0];
        if (self->_backdropBarGroupName) {
          -[_UIBackdropView setGroupName:](self->_backdropView, "setGroupName:");
        }
        [(SKUIScrollingTabBarBackgroundView *)self insertSubview:self->_backdropView atIndex:0];
        [(SKUIScrollingTabBarBackgroundView *)self setNeedsLayout];
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
        id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
        double v6 = (UIView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        bottomHairlineView = self->_bottomHairlineView;
        self->_bottomHairlineView = v6;

        double v8 = self->_bottomHairlineView;
        double v9 = [MEMORY[0x1E4FB1618] _barHairlineShadowColor];
        [(UIView *)v8 setBackgroundColor:v9];

        [(UIView *)self->_bottomHairlineView setUserInteractionEnabled:0];
        [(SKUIScrollingTabBarBackgroundView *)self addSubview:self->_bottomHairlineView];
        [(SKUIScrollingTabBarBackgroundView *)self setNeedsLayout];
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
        id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
        double v6 = (UIView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        topHairlineView = self->_topHairlineView;
        self->_topHairlineView = v6;

        [(UIView *)self->_topHairlineView setUserInteractionEnabled:0];
        [(SKUIScrollingTabBarBackgroundView *)self _updateTopHairlineColor];
        [(SKUIScrollingTabBarBackgroundView *)self addSubview:self->_topHairlineView];
        [(SKUIScrollingTabBarBackgroundView *)self setNeedsLayout];
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
    [(SKUIScrollingTabBarBackgroundView *)self _updateTopHairlineColor];
  }
}

- (void)_updateTopHairlineColor
{
  if (self->_usesOpaqueColorForTopHairline) {
    [MEMORY[0x1E4FB1618] colorWithWhite:0.615686275 alpha:1.0];
  }
  else {
  id v3 = [MEMORY[0x1E4FB1618] _barHairlineShadowColor];
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
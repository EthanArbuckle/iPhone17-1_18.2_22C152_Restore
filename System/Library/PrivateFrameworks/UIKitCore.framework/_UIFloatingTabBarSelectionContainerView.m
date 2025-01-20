@interface _UIFloatingTabBarSelectionContainerView
- (CGRect)selectionViewFrame;
- (UIView)selectionView;
- (_UIFloatingTabBarSelectionContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setSelectionViewFrame:(CGRect)a3;
@end

@implementation _UIFloatingTabBarSelectionContainerView

- (_UIFloatingTabBarSelectionContainerView)initWithFrame:(CGRect)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)_UIFloatingTabBarSelectionContainerView;
  v3 = -[UIView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 traitCollection];
    v6 = _UIFloatingTabBarGetPlatformMetrics([v5 userInterfaceIdiom]);

    v7 = [UIView alloc];
    v8 = -[UIView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v9 = *MEMORY[0x1E4F39EA8];
    v10 = [(UIView *)v8 layer];
    [v10 setCornerCurve:v9];

    v11 = [(UIView *)v8 layer];
    [v11 setAllowsEdgeAntialiasing:1];

    v12 = [(UIView *)v8 layer];
    [v12 setShadowPathIsBounds:1];

    v13 = [v6 selectionBackgroundColor];
    [(UIView *)v8 setBackgroundColor:v13];

    [(UIView *)v8 setHidden:1];
    v14 = [v6 selectionShadow];
    [v14 applyToView:v8];

    [(UIView *)v4 addSubview:v8];
    selectionView = v4->_selectionView;
    v4->_selectionView = v8;
    v16 = v8;

    v24[0] = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    id v18 = [(UIView *)v4 registerForTraitChanges:v17 withHandler:&__block_literal_global_473];

    uint64_t v23 = objc_opt_class();
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];

    id v20 = [(UIView *)v4 registerForTraitChanges:v19 withHandler:&__block_literal_global_5_7];
  }
  return v4;
}

- (void)setSelectionViewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_selectionViewFrame = &self->_selectionViewFrame;
  if (!CGRectEqualToRect(a3, self->_selectionViewFrame))
  {
    p_selectionViewFrame->origin.double x = x;
    p_selectionViewFrame->origin.double y = y;
    p_selectionViewFrame->size.double width = width;
    p_selectionViewFrame->size.double height = height;
    -[UIView setBounds:](self->_selectionView, "setBounds:", 0.0, 0.0, width, height);
    -[UIView setCenter:](self->_selectionView, "setCenter:", x + width * 0.5, y + height * 0.5);
    v14.origin.double x = x;
    v14.origin.double y = y;
    v14.size.double width = width;
    v14.size.double height = height;
    double v9 = CGRectGetHeight(v14);
    v15.origin.double x = x;
    v15.origin.double y = y;
    v15.size.double width = width;
    v15.size.double height = height;
    double v10 = CGRectGetWidth(v15);
    if (v9 < v10) {
      double v10 = v9;
    }
    double v11 = v10 * 0.5;
    selectionView = self->_selectionView;
    [(UIView *)selectionView _setContinuousCornerRadius:v11];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFloatingTabBarSelectionContainerView;
  [(UIView *)&v3 layoutSubviews];
  [(UIView *)self bounds];
  [(UIView *)self _setContinuousCornerRadius:CGRectGetHeight(v4) * 0.5];
}

- (CGRect)selectionViewFrame
{
  double x = self->_selectionViewFrame.origin.x;
  double y = self->_selectionViewFrame.origin.y;
  double width = self->_selectionViewFrame.size.width;
  double height = self->_selectionViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIView)selectionView
{
  return self->_selectionView;
}

- (void).cxx_destruct
{
}

@end
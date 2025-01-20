@interface _TVProductCollectionViewCell
- (BOOL)canBecomeFocused;
- (BOOL)isShowingTitleView;
- (UIEdgeInsets)margins;
- (UIEdgeInsets)partialMargins;
- (UIViewController)viewController;
- (id)preferredFocusEnvironments;
- (id)titleView;
- (void)disableMargins;
- (void)enableWithMargins:(UIEdgeInsets)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setMargins:(UIEdgeInsets)a3;
- (void)setPartialMargins:(UIEdgeInsets)a3;
- (void)setTitleView:(id)a3 margins:(UIEdgeInsets)a4 show:(BOOL)a5;
- (void)setViewController:(id)a3;
- (void)showTitleView:(BOOL)a3;
@end

@implementation _TVProductCollectionViewCell

- (id)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3 margins:(UIEdgeInsets)a4 show:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  v12 = (UIView *)a3;
  p_titleView = &self->_titleView;
  titleView = self->_titleView;
  v16 = v12;
  if (titleView != v12)
  {
    [(UIView *)titleView removeFromSuperview];
    objc_storeStrong((id *)&self->_titleView, a3);
    if (*p_titleView)
    {
      -[_TVProductCollectionViewCell addSubview:](self, "addSubview:");
      double v15 = 0.0;
      if (v5) {
        double v15 = 1.0;
      }
      [(UIView *)*p_titleView setAlpha:v15];
      self->_activeMargins.CGFloat top = top;
      self->_activeMargins.CGFloat left = left;
      self->_activeMargins.CGFloat bottom = bottom;
      self->_activeMargins.CGFloat right = right;
    }
  }
  [(_TVProductCollectionViewCell *)self setNeedsLayout];
}

- (void)showTitleView:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIView *)self->_titleView alpha];
  double v6 = 0.0;
  if (v3) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  if (self->_titleView) {
    BOOL v8 = v5 == v7;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    v10 = [WeakRetained view];
    [v10 frame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    if (v7 != 0.0) {
      double v6 = self->_activeMargins.top + 70.0 + self->_activeMargins.bottom;
    }
    double v17 = 0.2;
    if (v3) {
      double v17 = 0.3;
    }
    double v18 = 0.12;
    if (!v3) {
      double v18 = 0.0;
    }
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __46___TVProductCollectionViewCell_showTitleView___block_invoke;
    v21[3] = &unk_264BA6A60;
    v21[4] = self;
    *(double *)&v21[5] = v7;
    [MEMORY[0x263F1CB60] animateWithDuration:2084 delay:v21 options:0 animations:v17 completion:v18];
    id v19 = objc_loadWeakRetained((id *)&self->_viewController);
    v20 = [v19 view];
    objc_msgSend(v20, "setFrame:", v12, v6, v14, v16);
  }
}

- (BOOL)isShowingTitleView
{
  [(UIView *)self->_titleView alpha];
  return v2 > 0.0;
}

- (void)enableWithMargins:(UIEdgeInsets)a3
{
  self->_activeMargins = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  id v4 = [WeakRetained view];

  [v4 frame];
  objc_msgSend(v4, "setFrame:");
}

- (void)disableMargins
{
  long long v2 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
  *(_OWORD *)&self->_activeMargins.CGFloat top = *MEMORY[0x263F1D1C0];
  *(_OWORD *)&self->_activeMargins.CGFloat bottom = v2;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  id v4 = [WeakRetained view];

  [v4 frame];
  objc_msgSend(v4, "setFrame:");
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
  [(_TVProductCollectionViewCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)_TVProductCollectionViewCell;
  [(_TVProductCollectionViewCell *)&v31 layoutSubviews];
  [(_TVProductCollectionViewCell *)self bounds];
  CGFloat v7 = v5;
  CGFloat v8 = v6;
  if (self->_titleView)
  {
    CGFloat v9 = v3;
    CGFloat v10 = v4;
    double v11 = CGRectGetWidth(*(CGRect *)&v3) - self->_activeMargins.left - self->_activeMargins.right;
    double v30 = self->_activeMargins.top + self->_activeMargins.bottom;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[UIView sizeThatFits:](self->_titleView, "sizeThatFits:", v11, 70.0);
      double v14 = v13;
      if (v11 >= v12) {
        double v11 = v12;
      }
    }
    else
    {
      double v14 = 70.0;
    }
    double v26 = 70.0 - v14 + self->_activeMargins.top;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v26 = v26 + 14.0;
    }
    v32.origin.x = v9;
    v32.origin.y = v10;
    v32.size.width = v7;
    v32.size.height = v8;
    -[UIView setFrame:](self->_titleView, "setFrame:", floor((CGRectGetWidth(v32) - v11) * 0.5), v26, v11, v14);
    [(UIView *)self->_titleView alpha];
    if (v27 == 0.0) {
      double v28 = 0.0;
    }
    else {
      double v28 = v30 + 70.0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    v21 = [WeakRetained view];
    v33.origin.x = v9;
    v33.origin.y = v10;
    v33.size.width = v7;
    v33.size.height = v8;
    CGFloat Width = CGRectGetWidth(v33);
    v34.origin.x = v9;
    v34.origin.y = v10;
    v34.size.width = v7;
    v34.size.height = v8;
    double v25 = CGRectGetHeight(v34) + -70.0 - v30;
    double v22 = 0.0;
    v20 = v21;
    double v23 = v28;
    double v24 = Width;
  }
  else
  {
    double v15 = v5 - self->_margins.left - self->_margins.right;
    CGFloat top = self->_activeMargins.top;
    CGFloat left = self->_activeMargins.left;
    double v18 = v6 - self->_margins.top - self->_margins.bottom;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    v20 = [WeakRetained view];
    v21 = v20;
    double v22 = left;
    double v23 = top;
    double v24 = v15;
    double v25 = v18;
  }
  objc_msgSend(v20, "setFrame:", v22, v23, v24, v25);
}

- (void)prepareForReuse
{
  v8.receiver = self;
  v8.super_class = (Class)_TVProductCollectionViewCell;
  [(_TVProductCollectionViewCell *)&v8 prepareForReuse];
  [(_TVProductCollectionViewCell *)self setViewController:0];
  [(UIView *)self->_titleView removeFromSuperview];
  titleView = self->_titleView;
  self->_titleView = 0;

  long long v4 = *MEMORY[0x263F1D1C0];
  long long v5 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
  *(_OWORD *)&self->_margins.CGFloat top = *MEMORY[0x263F1D1C0];
  *(_OWORD *)&self->_margins.CGFloat bottom = v5;
  *(_OWORD *)&self->_partialMargins.CGFloat top = v4;
  *(_OWORD *)&self->_partialMargins.CGFloat bottom = v5;
  *(_OWORD *)&self->_activeMargins.CGFloat top = v4;
  *(_OWORD *)&self->_activeMargins.CGFloat bottom = v5;
  self->_marginActive = 0;
  double v6 = [(_TVProductCollectionViewCell *)self contentView];
  CGFloat v7 = [v6 subviews];
  [v7 makeObjectsPerformSelector:sel_removeFromSuperview];
}

- (BOOL)canBecomeFocused
{
  CGFloat v3 = [MEMORY[0x263F1C920] mainScreen];
  long long v4 = [v3 focusedView];

  if ([(_TVProductCollectionViewCell *)self containsView:v4])
  {
    char v5 = 0;
  }
  else
  {
    double v6 = [(_TVProductCollectionViewCell *)self viewController];
    CGFloat v7 = [v6 view];
    char v5 = [v7 canBecomeFocused];
  }
  return v5;
}

- (id)preferredFocusEnvironments
{
  v8[1] = *MEMORY[0x263EF8340];
  [(_TVProductCollectionViewCell *)self layoutBelowIfNeeded];
  p_viewController = &self->_viewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_viewController);
    v8[0] = v5;
    double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  else
  {
    double v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (UIViewController *)WeakRetained;
}

- (UIEdgeInsets)partialMargins
{
  double top = self->_partialMargins.top;
  double left = self->_partialMargins.left;
  double bottom = self->_partialMargins.bottom;
  double right = self->_partialMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPartialMargins:(UIEdgeInsets)a3
{
  self->_partialMargins = a3;
}

- (UIEdgeInsets)margins
{
  double top = self->_margins.top;
  double left = self->_margins.left;
  double bottom = self->_margins.bottom;
  double right = self->_margins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
@interface _TVRelatedContentShelfView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)relatedView;
- (UIView)shelfView;
- (_TVRelatedContentShelfView)initWithFrame:(CGRect)a3;
- (double)relatedHeight;
- (id)preferredFocusEnvironments;
- (void)_layoutRelatedView;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setRelatedHeight:(double)a3;
- (void)setRelatedView:(id)a3;
- (void)setShelfView:(id)a3;
@end

@implementation _TVRelatedContentShelfView

- (_TVRelatedContentShelfView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_TVRelatedContentShelfView;
  v3 = -[_TVRelatedContentShelfView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [_TVRelatedWrappingView alloc];
    uint64_t v5 = -[_TVFocusRedirectView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    relatedWrappingView = v3->_relatedWrappingView;
    v3->_relatedWrappingView = (_TVRelatedWrappingView *)v5;

    [(_TVRelatedContentShelfView *)v3 addSubview:v3->_relatedWrappingView];
  }
  return v3;
}

- (void)setShelfView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shelfView);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_shelfView);
    [v5 removeFromSuperview];

    id v6 = objc_storeWeak((id *)&self->_shelfView, obj);
    if (obj)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_shelfView);
      [(_TVRelatedContentShelfView *)self addSubview:v7];
    }
  }
  [(_TVRelatedContentShelfView *)self setNeedsLayout];
}

- (void)setRelatedView:(id)a3
{
  id v5 = (UIView *)a3;
  if (self->_relatedView != v5)
  {
    v15 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [(UIView *)v15 containerGuide];
      [v6 setEnabled:0];
    }
    objc_storeStrong((id *)&self->_relatedView, a3);
    if (self->_relatedView)
    {
      [(_TVRelatedContentShelfView *)self bounds];
      double v8 = v7;
      double v10 = v9;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_shelfView);
      [WeakRetained bounds];
      double v13 = v12;

      if (v8 <= 0.0 || v10 <= 0.0 || v13 <= 0.0) {
        [(_TVRelatedContentShelfView *)self setNeedsLayout];
      }
      else {
        [(_TVRelatedContentShelfView *)self _layoutRelatedView];
      }
    }
    else
    {
      v14 = [(_TVRelatedWrappingView *)self->_relatedWrappingView relatedView];
      [v14 removeFromSuperview];

      [(_TVRelatedWrappingView *)self->_relatedWrappingView setRelatedView:0];
    }
    id v5 = v15;
  }
}

- (id)preferredFocusEnvironments
{
  v6[1] = *MEMORY[0x263EF8340];
  lastFocusedView = self->_lastFocusedView;
  if (lastFocusedView)
  {
    id WeakRetained = lastFocusedView;
LABEL_4:
    v6[0] = WeakRetained;
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

    goto LABEL_5;
  }
  id WeakRetained = (UIView *)objc_loadWeakRetained((id *)&self->_shelfView);
  if (WeakRetained) {
    goto LABEL_4;
  }
  v4 = 0;
LABEL_5:
  return v4;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5 = objc_msgSend(MEMORY[0x263F1C920], "mainScreen", a3, a4);
  id v14 = [v5 focusedView];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_shelfView);
  if (WeakRetained)
  {
    double v7 = WeakRetained;
    id v8 = objc_loadWeakRetained((id *)&self->_shelfView);
    int v9 = [v8 isDescendantOfView:v14];

    if (v9)
    {
      double v10 = (UIView *)objc_loadWeakRetained((id *)&self->_shelfView);
      lastFocusedView = self->_lastFocusedView;
      self->_lastFocusedView = v10;
LABEL_7:

      goto LABEL_8;
    }
  }
  relatedView = self->_relatedView;
  if (relatedView && [(UIView *)relatedView isDescendantOfView:v14])
  {
    double v13 = self->_relatedView;
    lastFocusedView = self->_lastFocusedView;
    self->_lastFocusedView = v13;
    goto LABEL_7;
  }
LABEL_8:
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)_TVRelatedContentShelfView;
  [(_TVRelatedContentShelfView *)&v15 layoutSubviews];
  [(_TVRelatedContentShelfView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shelfView);
  objc_msgSend(WeakRetained, "sizeThatFits:", v4, v6);
  double v9 = v8;
  double v11 = v10;

  id v12 = objc_loadWeakRetained((id *)&self->_shelfView);
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, v9, v11);

  relatedView = self->_relatedView;
  if (relatedView)
  {
    id v14 = [(UIView *)relatedView superview];

    if (!v14) {
      [(_TVRelatedContentShelfView *)self _layoutRelatedView];
    }
  }
}

- (void)_layoutRelatedView
{
  [(_TVRelatedContentShelfView *)self bounds];
  CGFloat v39 = v4;
  CGFloat v40 = v3;
  CGFloat v37 = v6;
  CGFloat v38 = v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shelfView);
  [WeakRetained bounds];
  double v9 = v8;

  double v10 = [(_TVRelatedWrappingView *)self->_relatedWrappingView relatedView];
  [(_TVRelatedWrappingView *)self->_relatedWrappingView setRelatedView:self->_relatedView];
  double v11 = [(_TVFocusRedirectView *)self->_relatedWrappingView containerGuide];
  [v11 setEnabled:1];

  [(_TVRelatedWrappingView *)self->_relatedWrappingView addSubview:self->_relatedView];
  if (v10)
  {
    [(UIView *)self->_relatedView setAlpha:0.0];
    id v12 = (void *)MEMORY[0x263F1CB60];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __48___TVRelatedContentShelfView__layoutRelatedView__block_invoke;
    v43[3] = &unk_264BA64A0;
    id v44 = v10;
    v45 = self;
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __48___TVRelatedContentShelfView__layoutRelatedView__block_invoke_2;
    v41[3] = &unk_264BA6D78;
    id v42 = v44;
    [v12 animateWithDuration:5244932 delay:v43 options:v41 animations:0.3 completion:0.0];
  }
  [(UIView *)self->_relatedView tv_itemWidth];
  double v14 = v13;
  [(UIView *)self->_relatedView tv_maxHeight];
  double v16 = v15;
  [(UIView *)self->_relatedView tv_margin];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  uint64_t v35 = v23;
  uint64_t v24 = MEMORY[0x263F001A8];
  double v25 = *MEMORY[0x263F001A8];
  double v26 = v9 + v17;
  v46.origin.y = v39;
  v46.origin.x = v40;
  v46.size.height = v37;
  v46.size.width = v38;
  double Width = CGRectGetWidth(v46);
  double v28 = fmin(v16, self->_relatedHeight - v22 - v18);
  if (v16 <= 0.0) {
    double v29 = self->_relatedHeight - v22 - v18;
  }
  else {
    double v29 = v28;
  }
  -[_TVRelatedWrappingView setFrame:](self->_relatedWrappingView, "setFrame:", v25, v26, Width, v29, v35);
  uint64_t v30 = [(_TVRelatedContentShelfView *)self effectiveUserInterfaceLayoutDirection];
  if (v14 == 0.0)
  {
    v47.origin.x = v25;
    v47.origin.y = v26;
    v47.size.width = Width;
    v47.size.height = v29;
    double v14 = CGRectGetWidth(v47) - v20 - v36;
  }
  double v31 = *(double *)(v24 + 8);
  if (v30 == 1)
  {
    v48.origin.y = v39;
    v48.origin.x = v40;
    v48.size.height = v37;
    v48.size.width = v38;
    double v32 = CGRectGetWidth(v48);
    v49.origin.x = v25;
    v49.origin.y = v31;
    v49.size.width = v14;
    v49.size.height = v29;
    double v20 = v32 - CGRectGetWidth(v49) - v36;
  }
  -[UIView setFrame:](self->_relatedView, "setFrame:", v20, v31, v14, v29);
  v50.origin.x = v25;
  v50.origin.y = v26;
  v50.size.width = Width;
  v50.size.height = v29;
  double v33 = CGRectGetWidth(v50);
  v34 = [(_TVFocusRedirectView *)self->_relatedWrappingView containerGuide];
  objc_msgSend(v34, "_setManualLayoutFrame:", 0.0, v31, v33, v29);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shelfView);
  objc_msgSend(WeakRetained, "sizeThatFits:", width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v10 + self->_relatedHeight;
  double v12 = v8;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (UIView)shelfView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shelfView);
  return (UIView *)WeakRetained;
}

- (UIView)relatedView
{
  return self->_relatedView;
}

- (double)relatedHeight
{
  return self->_relatedHeight;
}

- (void)setRelatedHeight:(double)a3
{
  self->_relatedHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedView, 0);
  objc_destroyWeak((id *)&self->_shelfView);
  objc_storeStrong((id *)&self->_relatedWrappingView, 0);
  objc_storeStrong((id *)&self->_lastFocusedView, 0);
}

@end
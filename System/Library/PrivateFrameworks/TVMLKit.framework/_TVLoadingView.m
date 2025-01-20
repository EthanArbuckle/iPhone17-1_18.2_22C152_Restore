@interface _TVLoadingView
- (BOOL)canBecomeFocused;
- (BOOL)shouldShowSpinner;
- (UIActivityIndicatorView)spinnerView;
- (UIView)labelContainer;
- (UIView)loadingTitleLabel;
- (UIView)spinnerContainer;
- (_TVImageView)backgroundImageView;
- (_TVLoadingView)initWithFrame:(CGRect)a3;
- (void)_showSpinner;
- (void)layoutSubviews;
- (void)setLoadingTitleLabel:(id)a3;
- (void)setShouldShowSpinner:(BOOL)a3;
@end

@implementation _TVLoadingView

- (_TVLoadingView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_TVLoadingView;
  v3 = -[_TVLoadingView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_shouldShowSpinner = 1;
    v5 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
    [(_TVLoadingView *)v4 addSubview:v5];
    objc_storeWeak((id *)&v4->_spinnerView, v5);
    objc_storeWeak((id *)&v4->_spinnerContainer, v5);
    [v5 setAlpha:0.0];
    v6 = [v5 layer];
    [v6 setAllowsGroupOpacity:0];

    v7 = [v5 layer];
    [v7 setAllowsGroupOpacity:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)_TVLoadingView;
  [(_TVLoadingView *)&v29 layoutSubviews];
  [(_TVLoadingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(_TVLoadingView *)self backgroundImageView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [MEMORY[0x263F1C3D8] defaultSizeForStyle:100];
  v12 = [(_TVLoadingView *)self spinnerContainer];
  UIRectCenteredIntegralRect();
  objc_msgSend(v12, "setFrame:");

  v13 = [(_TVLoadingView *)self labelContainer];
  [v13 sizeToFit];

  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  CGFloat v14 = CGRectGetWidth(v30) + -40.0;
  v15 = [(_TVLoadingView *)self labelContainer];
  objc_msgSend(v15, "sizeThatFits:", v14, 0.0);
  double v17 = v16;

  v18 = [(_TVLoadingView *)self spinnerContainer];
  [v18 frame];
  CGRectGetMaxY(v31);

  UIRectCenteredIntegralRect();
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v17 + v25 + 10.0;
  v27 = [(_TVLoadingView *)self labelContainer];
  objc_msgSend(v27, "setFrame:", v20, v26, v22, v24);

  v28 = [(_TVLoadingView *)self labelContainer];
  [v28 setAutoresizingMask:37];
}

- (void)setLoadingTitleLabel:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_loadingTitleLabel);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_loadingTitleLabel);
    [v5 removeFromSuperview];

    [(_TVLoadingView *)self addSubview:obj];
    objc_storeWeak((id *)&self->_labelContainer, obj);
    objc_storeWeak((id *)&self->_loadingTitleLabel, obj);
    [(_TVLoadingView *)self setNeedsLayout];
  }
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)_showSpinner
{
  id v10 = [(_TVLoadingView *)self spinnerView];
  double v3 = [v10 window];
  if (v3)
  {
    BOOL shouldShowSpinner = self->_shouldShowSpinner;

    if (shouldShowSpinner)
    {
      id v5 = [(_TVLoadingView *)self loadingTitleLabel];
      double v6 = [(_TVLoadingView *)self spinnerView];
      double v7 = (void *)MEMORY[0x263F1CB60];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __30___TVLoadingView__showSpinner__block_invoke;
      v11[3] = &unk_264BA64A0;
      id v12 = v5;
      id v13 = v6;
      id v8 = v6;
      id v9 = v5;
      [v7 animateWithDuration:v11 animations:0.4];
    }
  }
  else
  {
  }
}

- (_TVImageView)backgroundImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundImageView);
  return (_TVImageView *)WeakRetained;
}

- (UIView)loadingTitleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_loadingTitleLabel);
  return (UIView *)WeakRetained;
}

- (UIActivityIndicatorView)spinnerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_spinnerView);
  return (UIActivityIndicatorView *)WeakRetained;
}

- (BOOL)shouldShowSpinner
{
  return self->_shouldShowSpinner;
}

- (void)setShouldShowSpinner:(BOOL)a3
{
  self->_BOOL shouldShowSpinner = a3;
}

- (UIView)spinnerContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_spinnerContainer);
  return (UIView *)WeakRetained;
}

- (UIView)labelContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelContainer);
  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_labelContainer);
  objc_destroyWeak((id *)&self->_spinnerContainer);
  objc_destroyWeak((id *)&self->_spinnerView);
  objc_destroyWeak((id *)&self->_loadingTitleLabel);
  objc_destroyWeak((id *)&self->_backgroundImageView);
}

@end
@interface NCDimmableView
- (CGSize)contentSizeForSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3;
- (NCDimmableView)initWithFrame:(CGRect)a3;
- (NCNotificationListStackBackgroundDimmingView)backgroundDimmingView;
- (PLContentSizeManaging)contentView;
- (UIView)viewToFadeWhenDimming;
- (id)_effectiveContentView;
- (void)configureStackDimmingForTransform:(CGAffineTransform *)a3;
- (void)setBackgroundDimmingView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setViewToFadeWhenDimming:(id)a3;
@end

@implementation NCDimmableView

- (void)setBackgroundDimmingView:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundDimmingView, a3);
  long long v4 = *(_OWORD *)&self->_transform.c;
  v5[0] = *(_OWORD *)&self->_transform.a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&self->_transform.tx;
  [(NCDimmableView *)self configureStackDimmingForTransform:v5];
}

- (void)setViewToFadeWhenDimming:(id)a3
{
  objc_storeWeak((id *)&self->_viewToFadeWhenDimming, a3);
  long long v4 = *(_OWORD *)&self->_transform.c;
  v5[0] = *(_OWORD *)&self->_transform.a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&self->_transform.tx;
  [(NCDimmableView *)self configureStackDimmingForTransform:v5];
}

- (NCDimmableView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NCDimmableView;
  v3 = -[NCDimmableView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  long long v4 = v3;
  if (v3)
  {
    [(NCDimmableView *)v3 _setIgnoresLayerTransformForSafeAreaInsets:1];
    uint64_t v5 = MEMORY[0x1E4F1DAB8];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v4->_transform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v4->_transform.c = v6;
    *(_OWORD *)&v4->_transform.tx = *(_OWORD *)(v5 + 32);
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[NCDimmableView contentSizeForSize:](self, "contentSizeForSize:", a3.width, a3.height);

  -[NCDimmableView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:");
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)configureStackDimmingForTransform:(CGAffineTransform *)a3
{
  long long v6 = *(_OWORD *)&a3->c;
  long long v5 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_transform.c = v6;
  *(_OWORD *)&self->_transform.tx = v5;
  v7 = [(NCDimmableView *)self contentView];
  objc_super v8 = v7;
  if (!v7)
  {
    WeakRetained = (NCNotificationListStackDimmingOverlayView *)objc_loadWeakRetained((id *)&self->_backgroundDimmingView);
    v11 = WeakRetained;
    if (a3->a <= 0.94) {
      double v13 = dbl_1D7D95CC0[a3->a < 0.94];
    }
    else {
      double v13 = 0.0;
    }
    *(double *)&uint64_t v34 = 1.0;
    v14 = [(NCNotificationListStackDimmingOverlayView *)WeakRetained backgroundColor];

    double v15 = 1.0;
    if (v14)
    {
      v16 = [(NCNotificationListStackDimmingOverlayView *)v11 backgroundColor];
      [v16 getWhite:0 alpha:&v34];

      double v15 = *(double *)&v34;
    }
    double v17 = v13 * (1.0 - v15);
    long long v18 = *(_OWORD *)&a3->c;
    long long v35 = *(_OWORD *)&a3->a;
    long long v36 = v18;
    long long v37 = *(_OWORD *)&a3->tx;
    [(NCNotificationListStackDimmingOverlayView *)v11 configureStackDimmingForTransform:&v35];
    if (v17 > 0.0 && !self->_stackDimmingOverlayView)
    {
      v19 = [NCNotificationListStackDimmingOverlayView alloc];
      [(NCDimmableView *)self bounds];
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      v28 = [(NCDimmableView *)self _effectiveContentView];
      [v28 _continuousCornerRadius];
      v30 = -[NCNotificationListStackDimmingOverlayView initWithFrame:cornerRadius:](v19, "initWithFrame:cornerRadius:", v21, v23, v25, v27, v29);
      stackDimmingOverlayView = self->_stackDimmingOverlayView;
      self->_stackDimmingOverlayView = v30;

      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __52__NCDimmableView_configureStackDimmingForTransform___block_invoke;
      v33[3] = &unk_1E6A91BB0;
      v33[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v33];
    }
    [(NCNotificationListStackDimmingOverlayView *)self->_stackDimmingOverlayView setAlpha:v17];
    v32 = [(NCDimmableView *)self viewToFadeWhenDimming];
    objc_msgSend(v32, "setAlpha:", fmax(v13 * -2.0 + 1.0, 0.0));

    goto LABEL_13;
  }
  long long v9 = *(_OWORD *)&a3->c;
  long long v35 = *(_OWORD *)&a3->a;
  long long v36 = v9;
  long long v37 = *(_OWORD *)&a3->tx;
  [v7 configureStackDimmingForTransform:&v35];
  v10 = self->_stackDimmingOverlayView;
  if (v10)
  {
    [(NCNotificationListStackDimmingOverlayView *)v10 removeFromSuperview];
    v11 = self->_stackDimmingOverlayView;
    self->_stackDimmingOverlayView = 0;
LABEL_13:
  }
}

uint64_t __52__NCDimmableView_configureStackDimmingForTransform___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 408)];
}

- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  long long v5 = [(NCDimmableView *)self _effectiveContentView];
  objc_msgSend(v5, "sizeThatFitsContentWithSize:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)contentSizeForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (width > 0.0 && height > 0.0)
  {
    -[NCDimmableView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:", width, 0.0);
    double v6 = (double)((int)(height - v7) & ~((int)(height - v7) >> 31));
    double v5 = width;
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (id)_effectiveContentView
{
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  double v4 = WeakRetained;
  if (!WeakRetained) {
    WeakRetained = self;
  }
  id v5 = WeakRetained;

  return v5;
}

- (PLContentSizeManaging)contentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);

  return (PLContentSizeManaging *)WeakRetained;
}

- (void)setContentView:(id)a3
{
}

- (UIView)viewToFadeWhenDimming
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewToFadeWhenDimming);

  return (UIView *)WeakRetained;
}

- (NCNotificationListStackBackgroundDimmingView)backgroundDimmingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundDimmingView);

  return (NCNotificationListStackBackgroundDimmingView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundDimmingView);
  objc_destroyWeak((id *)&self->_viewToFadeWhenDimming);
  objc_destroyWeak((id *)&self->_contentView);

  objc_storeStrong((id *)&self->_stackDimmingOverlayView, 0);
}

@end
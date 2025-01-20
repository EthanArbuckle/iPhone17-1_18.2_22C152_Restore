@interface SFFaviconView
- (CGSize)intrinsicContentSize;
- (SFFaviconView)initWithFrame:(CGRect)a3;
- (UIColor)themeColor;
- (UIImage)icon;
- (UIImageSymbolConfiguration)preferredSymbolConfiguration;
- (double)trailingInset;
- (id)_determineIconBackingColorAndInsets:(UIEdgeInsets *)a3;
- (id)trailingInsetChangeHandler;
- (int64_t)iconContentMode;
- (void)_updateIconBackingColorAndInset;
- (void)layoutSubviews;
- (void)setIcon:(id)a3;
- (void)setIconContentMode:(int64_t)a3;
- (void)setPreferredSymbolConfiguration:(id)a3;
- (void)setThemeColor:(id)a3;
- (void)setTrailingInset:(double)a3;
- (void)setTrailingInsetChangeHandler:(id)a3;
@end

@implementation SFFaviconView

- (UIImage)icon
{
  return self->_icon;
}

- (double)trailingInset
{
  return self->_trailingInset;
}

- (void)setIconContentMode:(int64_t)a3
{
}

- (void)setIcon:(id)a3
{
  id v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_icon, a3);
    [(UIImageView *)self->_imageView setImage:v5];
    [(SFFaviconView *)self _updateIconBackingColorAndInset];
  }
}

- (void)setPreferredSymbolConfiguration:(id)a3
{
}

- (void)setThemeColor:(id)a3
{
  id v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_themeColor, a3);
    [(SFFaviconView *)self _updateIconBackingColorAndInset];
  }
}

- (void)setTrailingInsetChangeHandler:(id)a3
{
}

- (SFFaviconView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFFaviconView;
  v3 = -[SFFaviconView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    [(SFFaviconView *)v3 addSubview:v3->_imageView];
    [(SFFaviconView *)v3 _setContinuousCornerRadius:3.0];
    v6 = v3;
  }

  return v3;
}

- (CGSize)intrinsicContentSize
{
  [(UIImageView *)self->_imageView intrinsicContentSize];
  double v4 = v3 + 2.0;
  [(UIImageView *)self->_imageView intrinsicContentSize];
  double v6 = v5 + 2.0;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFFaviconView;
  [(SFFaviconView *)&v3 layoutSubviews];
  [(SFFaviconView *)self bounds];
  CGRect v5 = CGRectInset(v4, 1.0, 1.0);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

- (void)_updateIconBackingColorAndInset
{
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v3 = [(SFFaviconView *)self _determineIconBackingColorAndInsets:&v17];
  CGRect v4 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __48__SFFaviconView__updateIconBackingColorAndInset__block_invoke;
  v14 = &unk_1E54E9A60;
  v15 = self;
  id v16 = v3;
  id v5 = v3;
  [v4 performWithoutAnimation:&v11];
  [(UIImage *)self->_icon size];
  double v7 = v6;
  BOOL v8 = [(UIView *)self _sf_usesLeftToRightLayout];
  double v9 = fmax(v7 - *((double *)&v18 + 1), 0.0);
  if (v8) {
    double v10 = v9;
  }
  else {
    double v10 = *((double *)&v17 + 1);
  }
  [(UIImageView *)self->_imageView bounds];
  [(SFFaviconView *)self setTrailingInset:v10 * (CGRectGetWidth(v19) / v7)];
}

- (void)setTrailingInset:(double)a3
{
  if (self->_trailingInset != a3)
  {
    self->_trailingInset = a3;
    trailingInsetChangeHandler = (void (**)(void))self->_trailingInsetChangeHandler;
    if (trailingInsetChangeHandler) {
      trailingInsetChangeHandler[2]();
    }
  }
}

- (id)_determineIconBackingColorAndInsets:(UIEdgeInsets *)a3
{
  if (a3)
  {
    [(UIImage *)self->_icon size];
    a3->top = 0.0;
    a3->left = 0.0;
    a3->bottom = v6;
    a3->right = v5;
  }
  if ([(UIImage *)self->_icon isSymbolImage]
    || [(UIImage *)self->_icon sf_isMonogram]
    || [(UIImage *)self->_icon renderingMode] == UIImageRenderingModeAlwaysTemplate)
  {
    id v7 = 0;
    goto LABEL_7;
  }
  double v9 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_colorNamed:", @"FaviconBackingColor");
  double v21 = 0.0;
  uint64_t v22 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  double v10 = [MEMORY[0x1E4F98E78] keyColorForIcon:self->_icon allowAllColors:1 confidence:&v22 nonTransparentConfidence:&v21 insets:&v19];
  uint64_t v11 = v10;
  if (v10 && self->_themeColor)
  {
    objc_msgSend(v10, "safari_contrastRatioWithColor:");
    double v13 = v12;
    objc_msgSend(v11, "safari_contrastRatioWithColor:", v9);
    if (v13 < 2.5 && v14 > 1.01 && v21 > 0.5) {
      goto LABEL_21;
    }
LABEL_23:
    id v7 = 0;
    if (a3)
    {
      long long v18 = v20;
      *(_OWORD *)&a3->top = v19;
      *(_OWORD *)&a3->bottom = v18;
    }
    goto LABEL_25;
  }
  id v16 = [(SFFaviconView *)self traitCollection];
  if ([v16 userInterfaceStyle] != 2)
  {

    goto LABEL_23;
  }
  BOOL v17 = [(UIImage *)self->_icon sf_shouldApplyBackingForDarkBackdrop];

  if (!v17) {
    goto LABEL_23;
  }
LABEL_21:
  id v7 = v9;
LABEL_25:

LABEL_7:

  return v7;
}

uint64_t __48__SFFaviconView__updateIconBackingColorAndInset__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = v2 != 0;
  double v4 = 0.0;
  if (v2) {
    double v4 = 2.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 408) _setContinuousCornerRadius:v4];
  CGFloat v5 = *(void **)(*(void *)(a1 + 32) + 408);

  return [v5 setClipsToBounds:v3];
}

- (int64_t)iconContentMode
{
  return [(UIImageView *)self->_imageView contentMode];
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return [(UIImageView *)self->_imageView preferredSymbolConfiguration];
}

- (UIColor)themeColor
{
  return self->_themeColor;
}

- (id)trailingInsetChangeHandler
{
  return self->_trailingInsetChangeHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_trailingInsetChangeHandler, 0);
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_storeStrong((id *)&self->_icon, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
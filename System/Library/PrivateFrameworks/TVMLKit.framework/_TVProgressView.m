@interface _TVProgressView
- (BOOL)shouldProgressBarUseRoundCorner;
- (BOOL)useMaterial;
- (UIColor)completeTintColor;
- (UIColor)gradientEndColor;
- (UIColor)gradientStartColor;
- (UIColor)progressTintColor;
- (UIEdgeInsets)padding;
- (UIImageView)shadowImageView;
- (UIVisualEffectView)materialView;
- (_TVProgressView)initWithFrame:(CGRect)a3;
- (double)cornerRadius;
- (double)progress;
- (id)_maskImageForProgressBar;
- (int64_t)style;
- (void)_updateForStyleChange;
- (void)layoutSubviews;
- (void)setCompleteTintColor:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setGradientEndColor:(id)a3;
- (void)setGradientStartColor:(id)a3;
- (void)setMaterialView:(id)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setProgress:(double)a3;
- (void)setProgressTintColor:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setShadowImageView:(id)a3;
- (void)setShouldProgressBarUseRoundCorner:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setUseMaterial:(BOOL)a3;
@end

@implementation _TVProgressView

- (_TVProgressView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)_TVProgressView;
  v3 = -[_TVProgressView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] clearColor];
    [(_TVProgressView *)v3 setBackgroundColor:v4];

    [(_TVProgressView *)v3 setClipsToBounds:0];
    v3->_cornerRadius = 3.0;
    uint64_t v5 = [MEMORY[0x263F1C550] colorWithWhite:0.2 alpha:0.9];
    completeTintColor = v3->_completeTintColor;
    v3->_completeTintColor = (UIColor *)v5;

    uint64_t v7 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:1.0];
    progressTintColor = v3->_progressTintColor;
    v3->_progressTintColor = (UIColor *)v7;

    long long v9 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
    *(_OWORD *)&v3->_padding.top = *MEMORY[0x263F1D1C0];
    *(_OWORD *)&v3->_padding.bottom = v9;
    v3->_shouldProgressBarUseRoundCorner = 0;
    v10 = [_TVProgressBarView alloc];
    [(_TVProgressView *)v3 bounds];
    uint64_t v11 = -[_TVProgressBarView initWithFrame:](v10, "initWithFrame:");
    progressBarView = v3->_progressBarView;
    v3->_progressBarView = (_TVProgressBarView *)v11;

    v13 = v3->_progressBarView;
    v14 = [MEMORY[0x263F1C550] clearColor];
    [(_TVProgressBarView *)v13 setBackgroundColor:v14];

    [(_TVProgressBarView *)v3->_progressBarView setAutoresizingMask:18];
    [(_TVProgressBarView *)v3->_progressBarView setCornerRadius:v3->_cornerRadius];
    [(_TVProgressBarView *)v3->_progressBarView setCompleteTintColor:v3->_completeTintColor];
    [(_TVProgressBarView *)v3->_progressBarView setProgressTintColor:v3->_progressTintColor];
    -[_TVProgressBarView setPadding:](v3->_progressBarView, "setPadding:", v3->_padding.top, v3->_padding.left, v3->_padding.bottom, v3->_padding.right);
    [(_TVProgressBarView *)v3->_progressBarView setShouldProgressBarUseRoundCorner:v3->_shouldProgressBarUseRoundCorner];
    [(_TVProgressView *)v3 addSubview:v3->_progressBarView];
    id v15 = objc_alloc(MEMORY[0x263F1CB98]);
    v16 = +[_TVProgressBarBlurEffect effectWithStyle:4004];
    uint64_t v17 = [v15 initWithEffect:v16];
    materialView = v3->_materialView;
    v3->_materialView = (UIVisualEffectView *)v17;

    [(_TVProgressView *)v3 _updateForStyleChange];
  }
  return v3;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)_TVProgressView;
  [(_TVProgressView *)&v15 layoutSubviews];
  [(_TVProgressView *)self bounds];
  if (!CGRectEqualToRect(v16, *MEMORY[0x263F001A8]))
  {
    [(_TVProgressView *)self bounds];
    double v4 = v3 + -6.0;
    double v6 = v5 + -2.0;
    double v8 = v7 + 12.0;
    double v10 = v9 + 10.0;
    uint64_t v11 = [(_TVProgressView *)self shadowImageView];
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

    if ([(_TVProgressView *)self useMaterial])
    {
      materialView = self->_materialView;
      [(_TVProgressView *)self bounds];
      CGRect v18 = CGRectInset(v17, -20.0, -20.0);
      -[UIVisualEffectView setFrame:](materialView, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
      v13 = self->_materialView;
      v14 = [(_TVProgressView *)self _maskImageForProgressBar];
      [(UIVisualEffectView *)v13 _setMaskImage:v14];
    }
  }
}

- (void)setCompleteTintColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_completeTintColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_completeTintColor, a3);
    [(_TVProgressBarView *)self->_progressBarView setCompleteTintColor:v5];
  }
}

- (void)setCornerRadius:(double)a3
{
  if (vabdd_f64(self->_cornerRadius, a3) > 0.00000011920929)
  {
    self->_cornerRadius = a3;
    -[_TVProgressBarView setCornerRadius:](self->_progressBarView, "setCornerRadius:");
  }
}

- (void)setProgress:(double)a3
{
  if (vabdd_f64(self->_progress, a3) > 0.00000011920929)
  {
    self->_progress = a3;
    -[_TVProgressBarView setProgress:](self->_progressBarView, "setProgress:");
  }
}

- (void)setProgressTintColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_progressTintColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_progressTintColor, a3);
    [(_TVProgressBarView *)self->_progressBarView setProgressTintColor:v5];
  }
}

- (void)setGradientStartColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_gradientStartColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_gradientStartColor, a3);
    [(_TVProgressBarView *)self->_progressBarView setGradientStartColor:v5];
  }
}

- (void)setGradientEndColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_gradientEndColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_gradientEndColor, a3);
    [(_TVProgressBarView *)self->_progressBarView setGradientEndColor:v5];
  }
}

- (void)setPadding:(UIEdgeInsets)a3
{
  if (a3.left != self->_padding.left
    || a3.top != self->_padding.top
    || a3.right != self->_padding.right
    || a3.bottom != self->_padding.bottom)
  {
    self->_padding = a3;
    -[_TVProgressBarView setPadding:](self->_progressBarView, "setPadding:");
  }
}

- (void)setShouldProgressBarUseRoundCorner:(BOOL)a3
{
  if (self->_shouldProgressBarUseRoundCorner != a3)
  {
    self->_shouldProgressBarUseRoundCorner = a3;
    -[_TVProgressBarView setShouldProgressBarUseRoundCorner:](self->_progressBarView, "setShouldProgressBarUseRoundCorner:");
    [(_TVProgressView *)self setNeedsLayout];
    [(_TVProgressView *)self setNeedsDisplay];
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  double v6 = [(_TVProgressView *)self layer];
  [v6 setAllowsEdgeAntialiasing:v4];

  id v7 = [(_TVProgressBarView *)self->_progressBarView layer];
  [v7 setAllowsEdgeAntialiasing:v4];
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(_TVProgressView *)self _updateForStyleChange];
  }
}

- (void)setUseMaterial:(BOOL)a3
{
  if (self->_useMaterial != a3)
  {
    self->_useMaterial = a3;
    -[_TVProgressBarView setUseMaterial:](self->_progressBarView, "setUseMaterial:");
    if (self->_useMaterial) {
      [(_TVProgressView *)self insertSubview:self->_materialView belowSubview:self->_progressBarView];
    }
    else {
      [(UIVisualEffectView *)self->_materialView removeFromSuperview];
    }
    [(_TVProgressView *)self setNeedsLayout];
    [(_TVProgressView *)self setNeedsDisplay];
  }
}

- (void)setMaterialView:(id)a3
{
  id v5 = (UIVisualEffectView *)a3;
  p_materialView = &self->_materialView;
  materialView = self->_materialView;
  if (materialView != v5)
  {
    double v8 = v5;
    [(UIVisualEffectView *)materialView removeFromSuperview];
    objc_storeStrong((id *)&self->_materialView, a3);
    if ([(_TVProgressView *)self useMaterial]
      && ([(UIVisualEffectView *)*p_materialView isDescendantOfView:self] & 1) == 0)
    {
      [(_TVProgressView *)self insertSubview:*p_materialView belowSubview:self->_progressBarView];
    }
    [(_TVProgressView *)self setNeedsLayout];
    materialView = (UIVisualEffectView *)[(_TVProgressView *)self setNeedsDisplay];
    id v5 = v8;
  }
  MEMORY[0x270F9A758](materialView, v5);
}

- (id)_maskImageForProgressBar
{
  double v3 = objc_opt_new();
  BOOL v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 scale];
  objc_msgSend(v3, "setScale:");

  [v3 setOpaque:0];
  id v5 = objc_alloc(MEMORY[0x263F1C680]);
  [(UIVisualEffectView *)self->_materialView bounds];
  double v8 = objc_msgSend(v5, "initWithSize:format:", v3, v6, v7);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43___TVProgressView__maskImageForProgressBar__block_invoke;
  v11[3] = &unk_264BA7790;
  v11[4] = self;
  double v9 = [v8 imageWithActions:v11];

  return v9;
}

- (void)_updateForStyleChange
{
  int64_t style = self->_style;
  shadowImageView = self->_shadowImageView;
  if (style)
  {
    if (!shadowImageView) {
      return;
    }
    [(UIImageView *)shadowImageView removeFromSuperview];
    id v5 = self->_shadowImageView;
    self->_shadowImageView = 0;
  }
  else
  {
    if (shadowImageView) {
      return;
    }
    double v6 = (void *)MEMORY[0x263F1C6B0];
    double v7 = +[TVMLUtilities TVMLKitBundle];
    double v8 = [v6 imageNamed:@"tvprogressview-shadow" inBundle:v7];
    objc_msgSend(v8, "resizableImageWithCapInsets:", 7.0, 11.0, 7.0, 11.0);
    uint64_t v11 = (UIImageView *)objc_claimAutoreleasedReturnValue();

    double v9 = (UIImageView *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v11];
    double v10 = self->_shadowImageView;
    self->_shadowImageView = v9;

    [(_TVProgressView *)self insertSubview:self->_shadowImageView atIndex:0];
    id v5 = v11;
  }
}

- (int64_t)style
{
  return self->_style;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)progress
{
  return self->_progress;
}

- (UIColor)progressTintColor
{
  return self->_progressTintColor;
}

- (UIColor)gradientStartColor
{
  return self->_gradientStartColor;
}

- (UIColor)gradientEndColor
{
  return self->_gradientEndColor;
}

- (UIColor)completeTintColor
{
  return self->_completeTintColor;
}

- (BOOL)useMaterial
{
  return self->_useMaterial;
}

- (BOOL)shouldProgressBarUseRoundCorner
{
  return self->_shouldProgressBarUseRoundCorner;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIVisualEffectView)materialView
{
  return self->_materialView;
}

- (UIImageView)shadowImageView
{
  return self->_shadowImageView;
}

- (void)setShadowImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowImageView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_completeTintColor, 0);
  objc_storeStrong((id *)&self->_gradientEndColor, 0);
  objc_storeStrong((id *)&self->_gradientStartColor, 0);
  objc_storeStrong((id *)&self->_progressTintColor, 0);
  objc_storeStrong((id *)&self->_progressBarView, 0);
}

@end
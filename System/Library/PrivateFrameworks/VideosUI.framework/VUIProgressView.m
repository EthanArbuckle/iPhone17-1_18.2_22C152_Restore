@interface VUIProgressView
- (BOOL)shouldProgressBarUseRoundCorner;
- (BOOL)useMaterial;
- (BOOL)useVisualEffectForMaterial;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)completeTintColor;
- (UIColor)gradientEndColor;
- (UIColor)gradientStartColor;
- (UIColor)progressTintColor;
- (UIEdgeInsets)padding;
- (UIImageView)shadowImageView;
- (UIView)materialView;
- (VUIProgressView)initWithFrame:(CGRect)a3;
- (double)cornerRadius;
- (double)height;
- (double)progress;
- (id)_maskImageForProgressBar;
- (unint64_t)style;
- (void)_layoutMaterialView;
- (void)_updateForStyleChange;
- (void)layoutSubviews;
- (void)setCompleteTintColor:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setGradientEndColor:(id)a3;
- (void)setGradientStartColor:(id)a3;
- (void)setHeight:(double)a3;
- (void)setMaterialView:(id)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setProgress:(double)a3;
- (void)setProgressTintColor:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setShadowImageView:(id)a3;
- (void)setShouldProgressBarUseRoundCorner:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setUseMaterial:(BOOL)a3;
- (void)setUseVisualEffectForMaterial:(BOOL)a3;
@end

@implementation VUIProgressView

- (VUIProgressView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)VUIProgressView;
  v3 = -[VUIProgressView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [v3 setBackgroundColor:v4];

    [v3 setClipsToBounds:0];
    *((void *)v3 + 55) = 0x4000000000000000;
    *((void *)v3 + 54) = 0x4008000000000000;
    uint64_t v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.2 alpha:0.9];
    v6 = (void *)*((void *)v3 + 60);
    *((void *)v3 + 60) = v5;

    uint64_t v7 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
    v8 = (void *)*((void *)v3 + 57);
    *((void *)v3 + 57) = v7;

    long long v9 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)(v3 + 504) = *MEMORY[0x1E4FB2848];
    *(_OWORD *)(v3 + 520) = v9;
    v3[418] = 0;
    v3[417] = 0;
    v3[416] = 1;
    v10 = [VUIProgressBarView alloc];
    [v3 bounds];
    uint64_t v11 = -[VUIProgressBarView initWithFrame:](v10, "initWithFrame:");
    v12 = (void *)*((void *)v3 + 51);
    *((void *)v3 + 51) = v11;

    v13 = (void *)*((void *)v3 + 51);
    v14 = [MEMORY[0x1E4FB1618] clearColor];
    [v13 setBackgroundColor:v14];

    [*((id *)v3 + 51) setAutoresizingMask:18];
    [*((id *)v3 + 51) setCornerRadius:*((double *)v3 + 54)];
    [*((id *)v3 + 51) setCompleteTintColor:*((void *)v3 + 60)];
    [*((id *)v3 + 51) setProgressTintColor:*((void *)v3 + 57)];
    objc_msgSend(*((id *)v3 + 51), "setPadding:", *((double *)v3 + 63), *((double *)v3 + 64), *((double *)v3 + 65), *((double *)v3 + 66));
    [*((id *)v3 + 51) setShouldProgressBarUseRoundCorner:v3[418]];
    [v3 addSubview:*((void *)v3 + 51)];
    [v3 _updateForStyleChange];
  }
  return (VUIProgressView *)v3;
}

- (void)layoutSubviews
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)VUIProgressView;
  [(VUIProgressView *)&v25 layoutSubviews];
  [(VUIProgressView *)self bounds];
  if (!CGRectEqualToRect(v28, *MEMORY[0x1E4F1DB28]))
  {
    [(VUIProgressView *)self bounds];
    double v4 = v3 + -6.0;
    double v6 = v5 + -2.0;
    double v8 = v7 + 12.0;
    double v10 = v9 + 10.0;
    uint64_t v11 = [(VUIProgressView *)self shadowImageView];
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

    if (self->_materialView)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      materialView = self->_materialView;
      if (isKindOfClass)
      {
        v14 = [(VUIProgressView *)self _maskImageForProgressBar];
        [(UIView *)materialView _setMaskImage:v14];
      }
      else
      {
        v14 = [(UIView *)materialView layer];
        [(VUIProgressView *)self bounds];
        objc_msgSend(v14, "setFrame:");
        v15 = [v14 sublayers];
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v22;
          do
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v22 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = *(void **)(*((void *)&v21 + 1) + 8 * v19);
              [(VUIProgressView *)self bounds];
              objc_msgSend(v20, "setFrame:");
              ++v19;
            }
            while (v17 != v19);
            uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v26 count:16];
          }
          while (v17);
        }
      }
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(VUIProgressView *)self height];
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)setCompleteTintColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_completeTintColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_completeTintColor, a3);
    [(VUIProgressBarView *)self->_progressBarView setCompleteTintColor:v5];
  }
}

- (void)setCornerRadius:(double)a3
{
  if (vabdd_f64(self->_cornerRadius, a3) > 0.00000011920929)
  {
    self->_cornerRadius = a3;
    -[VUIProgressBarView setCornerRadius:](self->_progressBarView, "setCornerRadius:");
  }
}

- (void)setProgress:(double)a3
{
  if (vabdd_f64(self->_progress, a3) > 0.00000011920929)
  {
    self->_progress = a3;
    -[VUIProgressBarView setProgress:](self->_progressBarView, "setProgress:");
  }
}

- (void)setProgressTintColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_progressTintColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_progressTintColor, a3);
    [(VUIProgressBarView *)self->_progressBarView setProgressTintColor:v5];
  }
}

- (void)setGradientStartColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_gradientStartColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_gradientStartColor, a3);
    [(VUIProgressBarView *)self->_progressBarView setGradientStartColor:v5];
  }
}

- (void)setGradientEndColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_gradientEndColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_gradientEndColor, a3);
    [(VUIProgressBarView *)self->_progressBarView setGradientEndColor:v5];
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
    -[VUIProgressBarView setPadding:](self->_progressBarView, "setPadding:");
  }
}

- (void)setShouldProgressBarUseRoundCorner:(BOOL)a3
{
  if (self->_shouldProgressBarUseRoundCorner != a3)
  {
    self->_shouldProgressBarUseRoundCorner = a3;
    -[VUIProgressBarView setShouldProgressBarUseRoundCorner:](self->_progressBarView, "setShouldProgressBarUseRoundCorner:");
    [(VUIProgressView *)self setNeedsLayout];
    [(VUIProgressView *)self setNeedsDisplay];
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  double v6 = [(VUIProgressView *)self layer];
  [v6 setAllowsEdgeAntialiasing:v4];

  id v7 = [(VUIProgressBarView *)self->_progressBarView layer];
  [v7 setAllowsEdgeAntialiasing:v4];
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(VUIProgressView *)self _updateForStyleChange];
  }
}

- (void)setUseMaterial:(BOOL)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (self->_useMaterial != a3)
  {
    self->_useMaterial = a3;
    -[VUIProgressBarView setUseMaterial:](self->_progressBarView, "setUseMaterial:");
    if (!self->_useMaterial)
    {
      [(UIView *)self->_materialView removeFromSuperview];
LABEL_14:
      [(VUIProgressView *)self setNeedsLayout];
      [(VUIProgressView *)self setNeedsDisplay];
      return;
    }
    if (self->_materialView)
    {
      if (!self->_useVisualEffectForMaterial) {
        goto LABEL_7;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (self->_useVisualEffectForMaterial)
        {
LABEL_11:
          [(VUIProgressView *)self _layoutMaterialView];
          goto LABEL_14;
        }
LABEL_7:
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_8;
        }
        goto LABEL_11;
      }
    }
LABEL_8:
    if (self->_useVisualEffectForMaterial)
    {
      id v4 = objc_alloc(MEMORY[0x1E4FB1F00]);
      id v5 = +[VUIProgressBarBlurEffect effectWithStyle:4004];
      id v6 = (id)[v4 initWithEffect:v5];
    }
    else
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      id v5 = objc_alloc_init(MEMORY[0x1E4F39B40]);
      id v7 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.25];
      objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));
      [v5 setMasksToBounds:1];
      [v5 setCornerRadius:self->_cornerRadius];
      double v8 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
      v11[0] = v8;
      double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      [v5 setFilters:v9];
      double v10 = [v6 layer];
      [v10 addSublayer:v5];
    }
    [(VUIProgressView *)self bounds];
    CGRect v13 = CGRectInset(v12, -20.0, -20.0);
    objc_msgSend(v6, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
    [v6 setAutoresizingMask:18];
    [(VUIProgressView *)self setMaterialView:v6];

    goto LABEL_14;
  }
}

- (void)setMaterialView:(id)a3
{
  id v5 = (UIView *)a3;
  materialView = self->_materialView;
  if (materialView != v5)
  {
    id v7 = v5;
    [(UIView *)materialView removeFromSuperview];
    objc_storeStrong((id *)&self->_materialView, a3);
    [(VUIProgressView *)self _layoutMaterialView];
    id v5 = v7;
  }
}

- (void)_layoutMaterialView
{
  if (self->_useMaterial)
  {
    materialView = self->_materialView;
    if (materialView)
    {
      [(VUIProgressView *)self bounds];
      CGRect v6 = CGRectInset(v5, -20.0, -20.0);
      -[UIView setFrame:](materialView, "setFrame:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);
      [(UIView *)self->_materialView setAutoresizingMask:18];
      if (![(UIView *)self->_materialView isDescendantOfView:self]) {
        [(VUIProgressView *)self insertSubview:self->_materialView belowSubview:self->_progressBarView];
      }
    }
  }
  [(VUIProgressView *)self setNeedsLayout];
  [(VUIProgressView *)self setNeedsDisplay];
}

- (id)_maskImageForProgressBar
{
  [(UIView *)self->_materialView bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  id v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 scale];
  CGFloat v9 = v8;
  v17.CGFloat width = v4;
  v17.height = v6;
  UIGraphicsBeginImageContextWithOptions(v17, 0, v9);

  double v10 = [MEMORY[0x1E4FB1618] blackColor];
  [v10 setFill];

  uint64_t v11 = (void *)MEMORY[0x1E4FB14C0];
  materialView = self->_materialView;
  [(VUIProgressView *)self bounds];
  -[UIView convertRect:fromView:](materialView, "convertRect:fromView:", self);
  CGRect v13 = objc_msgSend(v11, "bezierPathWithRoundedRect:cornerRadius:");
  [v13 fill];

  v14 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v14;
}

- (void)_updateForStyleChange
{
  unint64_t style = self->_style;
  shadowImageView = self->_shadowImageView;
  if (style)
  {
    if (!shadowImageView) {
      return;
    }
    [(UIImageView *)shadowImageView removeFromSuperview];
    double v5 = self->_shadowImageView;
    self->_shadowImageView = 0;
  }
  else
  {
    if (shadowImageView) {
      return;
    }
    CGFloat v6 = (void *)MEMORY[0x1E4FB1818];
    id v7 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
    double v8 = [v6 imageNamed:@"ProgressBarShadow" inBundle:v7];
    objc_msgSend(v8, "resizableImageWithCapInsets:", 7.0, 11.0, 7.0, 11.0);
    uint64_t v11 = (UIImageView *)objc_claimAutoreleasedReturnValue();

    CGFloat v9 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v11];
    double v10 = self->_shadowImageView;
    self->_shadowImageView = v9;

    [(VUIProgressView *)self insertSubview:self->_shadowImageView atIndex:0];
    double v5 = v11;
  }
}

- (unint64_t)style
{
  return self->_style;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
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

- (BOOL)useVisualEffectForMaterial
{
  return self->_useVisualEffectForMaterial;
}

- (void)setUseVisualEffectForMaterial:(BOOL)a3
{
  self->_useVisualEffectForMaterial = a3;
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

- (UIImageView)shadowImageView
{
  return self->_shadowImageView;
}

- (void)setShadowImageView:(id)a3
{
}

- (UIView)materialView
{
  return self->_materialView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_shadowImageView, 0);
  objc_storeStrong((id *)&self->_completeTintColor, 0);
  objc_storeStrong((id *)&self->_gradientEndColor, 0);
  objc_storeStrong((id *)&self->_gradientStartColor, 0);
  objc_storeStrong((id *)&self->_progressTintColor, 0);
  objc_storeStrong((id *)&self->_progressBarView, 0);
}

@end
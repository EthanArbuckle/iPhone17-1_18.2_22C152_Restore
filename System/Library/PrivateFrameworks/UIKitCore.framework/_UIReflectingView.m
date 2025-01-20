@interface _UIReflectingView
- (UIView)containerView;
- (_UIReflectingView)initWithFrame:(CGRect)a3;
- (double)reflectionAlpha;
- (double)reflectionFraction;
- (id)_gradientLayer;
- (void)_updateGradientColors;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setReflectionAlpha:(double)a3;
- (void)setReflectionFraction:(double)a3;
@end

@implementation _UIReflectingView

- (id)_gradientLayer
{
  return [(UIView *)self->_gradientView layer];
}

- (_UIReflectingView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)_UIReflectingView;
  v3 = -[UIView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setClipsToBounds:0];
    v5 = [_UIReflectingContainerView alloc];
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v10 = -[UIView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    containerView = v4->_containerView;
    v4->_containerView = (UIView *)v10;

    [(UIView *)v4->_containerView setClipsToBounds:0];
    v12 = [(UIView *)v4->_containerView layer];
    [v12 setInstanceCount:2];

    v13 = -[UIView initWithFrame:]([_UIReflectingGradientView alloc], "initWithFrame:", v6, v7, v8, v9);
    gradientView = v4->_gradientView;
    v4->_gradientView = &v13->super;

    v15 = [(_UIReflectingView *)v4 _gradientLayer];
    objc_msgSend(v15, "setEndPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

    [(UIView *)v4->_gradientView setUserInteractionEnabled:0];
    [(UIView *)v4 addSubview:v4->_containerView];
    [(UIView *)v4 addSubview:v4->_gradientView];
    [(_UIReflectingView *)v4 setReflectionAlpha:0.5];
    [(_UIReflectingView *)v4 setReflectionFraction:0.5];
    [(_UIReflectingView *)v4 setBackgroundColor:0];
    [(UIView *)v4 setNeedsLayout];
    [(UIView *)v4 layoutIfNeeded];
  }
  return v4;
}

- (void)_updateGradientColors
{
  v3 = [(UIView *)self backgroundColor];

  if (v3)
  {
    v4 = [(UIView *)self backgroundColor];
    v5 = [(UIView *)self backgroundColor];
    [(_UIReflectingView *)self reflectionAlpha];
    double v7 = [v5 colorWithAlphaComponent:1.0 - v6];
  }
  else
  {
    v4 = +[UIColor whiteColor];
    [(_UIReflectingView *)self reflectionAlpha];
    double v7 = +[UIColor colorWithWhite:1.0 alpha:v8];
  }
  double v9 = [(_UIReflectingView *)self _gradientLayer];
  uint64_t v10 = (void *)MEMORY[0x1E4F1C978];
  id v14 = v4;
  uint64_t v11 = [v14 CGColor];
  id v12 = v7;
  v13 = objc_msgSend(v10, "arrayWithObjects:", v11, objc_msgSend(v12, "CGColor"), 0);
  [v9 setColors:v13];
}

- (double)reflectionAlpha
{
  return self->_reflectionAlpha;
}

- (void)setReflectionAlpha:(double)a3
{
  if (a3 > 1.0 || a3 < 0.0)
  {
    v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    double v7 = (objc_class *)objc_opt_class();
    double v8 = NSStringFromClass(v7);
    [v5 raise:v6, @"%@'s reflectionAlpha value must be between 0 and 1", v8 format];
  }
  self->_reflectionAlpha = a3;
  [(_UIReflectingView *)self _updateGradientColors];
}

- (double)reflectionFraction
{
  v2 = [(_UIReflectingView *)self _gradientLayer];
  [v2 startPoint];
  double v4 = v3;

  return v4;
}

- (void)setReflectionFraction:(double)a3
{
  if (a3 > 1.0 || a3 < 0.0)
  {
    v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    double v7 = (objc_class *)objc_opt_class();
    double v8 = NSStringFromClass(v7);
    [v5 raise:v6, @"%@'s reflectionFraction value must be between 0 and 1", v8 format];
  }
  id v9 = [(_UIReflectingView *)self _gradientLayer];
  objc_msgSend(v9, "setStartPoint:", 0.0, a3);
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIReflectingView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UIView *)self setNeedsLayout];
  [(UIView *)self layoutIfNeeded];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)_UIReflectingView;
  [(UIView *)&v13 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_containerView, "setFrame:");
  [(UIView *)self bounds];
  double v8 = v7;
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_gradientView, "setFrame:", v8, v6 + v9, v4, v6);
  uint64_t v10 = [(UIView *)self->_containerView layer];
  CATransform3DMakeTranslation(&v11, 0.0, v6, 0.0);
  CATransform3DScale(&v12, &v11, 1.0, -1.0, 1.0);
  [v10 setInstanceTransform:&v12];
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    [v4 alphaComponent];
    if (v6 < 1.0)
    {
      double v7 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v8 = *MEMORY[0x1E4F1C3C8];
      double v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      [v7 raise:v8, @"%@ doesn't support non-opaque background colors.", v10 format];
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)_UIReflectingView;
  [(UIView *)&v13 setBackgroundColor:v5];
  if (v5) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = *MEMORY[0x1E4F3A098];
  }
  [(UIView *)self setOpaque:v5 != 0];
  [(UIView *)self->_containerView setOpaque:v5 != 0];
  [(UIView *)self->_gradientView setOpaque:0];
  CATransform3D v12 = [(_UIReflectingView *)self _gradientLayer];
  [v12 setCompositingFilter:v11];

  [(_UIReflectingView *)self _updateGradientColors];
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
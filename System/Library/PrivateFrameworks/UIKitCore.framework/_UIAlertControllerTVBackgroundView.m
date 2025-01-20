@interface _UIAlertControllerTVBackgroundView
+ (CGSize)backgroundInsetAmount;
- (BOOL)isHighlighted;
- (BOOL)isPressed;
- (BOOL)shouldShowShadow;
- (BOOL)shouldUseTintColorAsBackgroundColor;
- (CGSize)_shadowOffset;
- (UIView)backgroundView;
- (_UIAlertControllerTVBackgroundView)initWithFrame:(CGRect)a3;
- (_UIFloatingShadowView)shadowView;
- (double)_alphaForHighlighted:(BOOL)a3 pressed:(BOOL)a4;
- (double)_shadowOpacity;
- (double)_shadowRadius;
- (double)alphaForState:(unint64_t)a3;
- (id)_displayedBackgroundColor;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_updateBackgroundColor;
- (void)layoutSubviews;
- (void)setAlpha:(double)a3 forState:(unint64_t)a4;
- (void)setBackgroundView:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsHighlighted:(BOOL)a3;
- (void)setIsPressed:(BOOL)a3;
- (void)setPressed:(BOOL)a3;
- (void)setRoundedCornerPosition:(unint64_t)a3;
- (void)setShadowView:(id)a3;
- (void)setShouldShowShadow:(BOOL)a3;
- (void)setShouldUseTintColorAsBackgroundColor:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation _UIAlertControllerTVBackgroundView

+ (CGSize)backgroundInsetAmount
{
  double v2 = 30.0;
  double v3 = 7.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (_UIAlertControllerTVBackgroundView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_UIAlertControllerTVBackgroundView;
  double v3 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_isHighlighted = 0;
    v3->_isPressed = 0;
    v5 = [UIView alloc];
    [(UIView *)v4 bounds];
    uint64_t v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (UIView *)v6;

    [(UIView *)v4 addSubview:v4->_backgroundView];
    v8 = [_UIFloatingShadowView alloc];
    [(UIView *)v4 bounds];
    uint64_t v9 = -[_UIFloatingShadowView initWithFrame:](v8, "initWithFrame:");
    shadowView = v4->_shadowView;
    v4->_shadowView = (_UIFloatingShadowView *)v9;

    [(_UIFloatingShadowView *)v4->_shadowView setShadowExpansion:5.0];
    [(UIView *)v4 insertSubview:v4->_shadowView atIndex:0];
    [(_UIAlertControllerTVBackgroundView *)v4 setAlpha:0 forState:0.1];
    [(_UIAlertControllerTVBackgroundView *)v4 setAlpha:4 forState:0.8];
    [(_UIAlertControllerTVBackgroundView *)v4 setAlpha:1 forState:0.8];
  }
  return v4;
}

- (void)layoutSubviews
{
  backgroundView = self->_backgroundView;
  [(UIView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(id)objc_opt_class() backgroundInsetAmount];
  CGFloat v13 = v12;
  [(id)objc_opt_class() backgroundInsetAmount];
  CGFloat v15 = v14;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  CGRect v20 = CGRectInset(v19, v13, v15);
  -[UIView setFrame:](backgroundView, "setFrame:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
  v16 = self->_backgroundView;
  [(_UIAlertControllerTVBackgroundView *)self _alphaForHighlighted:self->_isHighlighted pressed:self->_isPressed];
  -[UIView setAlpha:](v16, "setAlpha:");
  shadowView = self->_shadowView;
  [(UIView *)self bounds];
  -[UIView setFrame:](shadowView, "setFrame:");
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UIAlertControllerTVBackgroundView;
  [(UIView *)&v3 tintColorDidChange];
  if (self->_shouldUseTintColorAsBackgroundColor) {
    [(_UIAlertControllerTVBackgroundView *)self _updateBackgroundColor];
  }
}

- (void)_updateBackgroundColor
{
  backgroundView = self->_backgroundView;
  id v3 = [(UIView *)self tintColor];
  [(UIView *)backgroundView setBackgroundColor:v3];
}

- (void)setShouldUseTintColorAsBackgroundColor:(BOOL)a3
{
  if (self->_shouldUseTintColorAsBackgroundColor != a3)
  {
    if (a3) {
      [(_UIAlertControllerTVBackgroundView *)self _updateBackgroundColor];
    }
    else {
      [(UIView *)self->_backgroundView setBackgroundColor:0];
    }
    self->_shouldUseTintColorAsBackgroundColor = a3;
  }
}

- (void)setAlpha:(double)a3 forState:(unint64_t)a4
{
  double v5 = a3;
  alphas = self->_alphas;
  if (!alphas)
  {
    double v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    CGFloat v9 = self->_alphas;
    self->_alphas = v8;

    alphas = self->_alphas;
  }
  *(float *)&a3 = v5;
  id v11 = [NSNumber numberWithFloat:a3];
  double v10 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)alphas setObject:v11 forKey:v10];
}

- (double)alphaForState:(unint64_t)a3
{
  alphas = self->_alphas;
  double v4 = [NSNumber numberWithInteger:a3];
  double v5 = [(NSMutableDictionary *)alphas objectForKey:v4];
  [v5 floatValue];
  double v7 = v6;

  return v7;
}

- (void)setCornerRadius:(double)a3
{
  double v5 = [(UIView *)self->_backgroundView layer];
  [v5 setCornerRadius:a3];

  shadowView = self->_shadowView;
  [(_UIFloatingShadowView *)shadowView setCornerRadius:a3];
}

- (void)_setContinuousCornerRadius:(double)a3
{
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:");
  shadowView = self->_shadowView;
  [(UIView *)shadowView _setContinuousCornerRadius:a3];
}

- (void)setRoundedCornerPosition:(unint64_t)a3
{
  double v5 = [(UIView *)self->_backgroundView layer];
  [v5 setMaskedCorners:a3];

  id v6 = [(UIView *)self->_shadowView layer];
  [v6 setMaskedCorners:a3];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL isHighlighted = self->_isHighlighted;
  if (isHighlighted != a3)
  {
    BOOL v4 = a3;
    [(_UIAlertControllerTVBackgroundView *)self _alphaForHighlighted:isHighlighted pressed:self->_isPressed];
    double v7 = v6;
    [(_UIAlertControllerTVBackgroundView *)self _alphaForHighlighted:v4 pressed:self->_isPressed];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53___UIAlertControllerTVBackgroundView_setHighlighted___block_invoke;
    aBlock[3] = &unk_1E52E8040;
    aBlock[4] = self;
    aBlock[5] = v8;
    BOOL v14 = v4;
    CGFloat v9 = (void (**)(void))_Block_copy(aBlock);
    if (+[UIView areAnimationsEnabled])
    {
      if (v4) {
        double v10 = 0.1;
      }
      else {
        double v10 = 0.2;
      }
      [(UIView *)self->_backgroundView setAlpha:v7];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __53___UIAlertControllerTVBackgroundView_setHighlighted___block_invoke_2;
      v11[3] = &unk_1E52DA040;
      double v12 = v9;
      +[UIView animateWithDuration:v11 animations:v10];
    }
    else
    {
      v9[2](v9);
    }
    self->_BOOL isHighlighted = v4;
  }
}

- (void)setPressed:(BOOL)a3
{
  BOOL isPressed = self->_isPressed;
  if (isPressed != a3)
  {
    BOOL v4 = a3;
    [(_UIAlertControllerTVBackgroundView *)self _alphaForHighlighted:self->_isHighlighted pressed:isPressed];
    double v7 = v6;
    [(_UIAlertControllerTVBackgroundView *)self _alphaForHighlighted:self->_isHighlighted pressed:v4];
    uint64_t v9 = v8;
    [(_UIAlertControllerTVBackgroundView *)self _shadowOpacity];
    double v11 = v10;
    [(_UIAlertControllerTVBackgroundView *)self _shadowOffset];
    double v13 = v12;
    double v15 = v14;
    [(_UIAlertControllerTVBackgroundView *)self _shadowRadius];
    if (v4) {
      double v17 = 0.1;
    }
    else {
      double v17 = v11;
    }
    if (v4) {
      double v18 = v15;
    }
    else {
      double v18 = 5.0;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __49___UIAlertControllerTVBackgroundView_setPressed___block_invoke;
    aBlock[3] = &unk_1E53058A0;
    double v19 = 0.0;
    if (v4)
    {
      double v20 = 5.0;
    }
    else
    {
      double v19 = v13;
      double v20 = v15;
    }
    if (v4) {
      double v21 = v16;
    }
    else {
      double v21 = 5.0;
    }
    aBlock[4] = self;
    aBlock[5] = v9;
    *(double *)&void aBlock[6] = v17;
    if (v4) {
      double v16 = 5.0;
    }
    *(double *)&aBlock[7] = v19;
    *(double *)&aBlock[8] = v20;
    *(double *)&aBlock[9] = v16;
    v22 = (void (**)(void))_Block_copy(aBlock);
    if (+[UIView areAnimationsEnabled])
    {
      if (!v4) {
        double v11 = 0.1;
      }
      [(UIView *)self->_backgroundView setAlpha:v7];
      [(UIView *)self->_shadowView setAlpha:v11];
      if (self->_shouldShowShadow)
      {
        [(_UIFloatingShadowView *)self->_shadowView setShadowVerticalOffset:v18];
        [(_UIFloatingShadowView *)self->_shadowView setShadowRadius:v21];
      }
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __49___UIAlertControllerTVBackgroundView_setPressed___block_invoke_2;
      v23[3] = &unk_1E52DA040;
      v24 = v22;
      +[UIView animateWithDuration:v23 animations:0.1];
    }
    else
    {
      v22[2](v22);
    }
    self->_BOOL isPressed = v4;
  }
}

- (void)setShouldShowShadow:(BOOL)a3
{
  if (self->_shouldShowShadow != a3)
  {
    shadowView = self->_shadowView;
    double v6 = 0.0;
    if (a3) {
      [(_UIAlertControllerTVBackgroundView *)self _shadowOpacity];
    }
    [(_UIFloatingShadowView *)shadowView setShadowOpacity:v6];
    self->_shouldShowShadow = a3;
  }
}

- (double)_alphaForHighlighted:(BOOL)a3 pressed:(BOOL)a4
{
  if (a4) {
    *(void *)&a3 = 4;
  }
  else {
    *(void *)&a3 = a3;
  }
  [(_UIAlertControllerTVBackgroundView *)self alphaForState:a3];
  return result;
}

- (id)_displayedBackgroundColor
{
  return [(UIView *)self->_backgroundView backgroundColor];
}

- (CGSize)_shadowOffset
{
  double v2 = 0.0;
  double v3 = 20.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)_shadowOpacity
{
  return 0.3;
}

- (double)_shadowRadius
{
  return 15.0;
}

- (BOOL)shouldUseTintColorAsBackgroundColor
{
  return self->_shouldUseTintColorAsBackgroundColor;
}

- (_UIFloatingShadowView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (BOOL)isHighlighted
{
  return self->_isHighlighted;
}

- (void)setIsHighlighted:(BOOL)a3
{
  self->_BOOL isHighlighted = a3;
}

- (BOOL)isPressed
{
  return self->_isPressed;
}

- (void)setIsPressed:(BOOL)a3
{
  self->_BOOL isPressed = a3;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (BOOL)shouldShowShadow
{
  return self->_shouldShowShadow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_alphas, 0);
}

@end
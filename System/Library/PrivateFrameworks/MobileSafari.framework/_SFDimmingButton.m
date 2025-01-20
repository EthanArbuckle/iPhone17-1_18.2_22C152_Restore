@interface _SFDimmingButton
- (BOOL)alwaysUsesUIMenuOrdering;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSNumber)tapTargetSideMargin;
- (NSValue)tapTargetSideMargins;
- (UIColor)dimmableBackgroundColor;
- (double)highlightAnimationDuration;
- (double)highlightedImageAlpha;
- (double)normalImageAlpha;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)_updateBackgroundColor;
- (void)_updateImageAlpha;
- (void)layoutSubviews;
- (void)setAlwaysUsesUIMenuOrdering:(BOOL)a3;
- (void)setDimmableBackgroundColor:(id)a3;
- (void)setHighlightAnimationDuration:(double)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedImageAlpha:(double)a3;
- (void)setNormalImageAlpha:(double)a3;
- (void)setTapTargetSideMargin:(id)a3;
- (void)setTapTargetSideMargins:(id)a3;
@end

@implementation _SFDimmingButton

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_SFDimmingButton;
  [(_SFDimmingButton *)&v3 layoutSubviews];
  [(_SFDimmingButton *)self _updateImageAlpha];
}

- (void)_updateImageAlpha
{
  p_highlightedImageAlpha = &self->_highlightedImageAlpha;
  if (self->_highlightedImageAlpha != 0.0 || self->_normalImageAlpha != 0.0)
  {
    id v4 = [(_SFDimmingButton *)self imageView];
    if (([(_SFDimmingButton *)self isHighlighted] & 1) == 0) {
      p_highlightedImageAlpha = &self->_normalImageAlpha;
    }
    [v4 setAlpha:*p_highlightedImageAlpha];
  }
}

- (void)setTapTargetSideMargins:(id)a3
{
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(_SFDimmingButton *)self isHighlighted];
  v8.receiver = self;
  v8.super_class = (Class)_SFDimmingButton;
  [(_SFDimmingButton *)&v8 setHighlighted:v3];
  if (v5 != v3)
  {
    double highlightAnimationDuration = 0.0;
    if (!v3) {
      double highlightAnimationDuration = self->_highlightAnimationDuration;
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35___SFDimmingButton_setHighlighted___block_invoke;
    v7[3] = &unk_1E54E9858;
    v7[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:50659328 delay:v7 options:0 animations:highlightAnimationDuration completion:0.0];
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (!self->_tapTargetSideMargins)
  {
    v26 = self;
    v23 = &v26;
LABEL_10:
    v23[1] = (_SFDimmingButton *)_SFDimmingButton;
    unsigned __int8 v22 = objc_msgSendSuper2((objc_super *)v23, sel_pointInside_withEvent_, v7, x, y, v25);
    goto LABEL_11;
  }
  [(_SFDimmingButton *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(NSValue *)self->_tapTargetSideMargins CGPointValue];
  double v18 = (44.0 - v13) * -0.5;
  if (v13 >= 44.0) {
    double v18 = 0.0;
  }
  double v19 = v18 - v16;
  double v20 = (44.0 - v15) * -0.5;
  if (v15 >= 44.0) {
    double v20 = 0.0;
  }
  CGFloat v21 = v20 - v17;
  v28.origin.double x = v9;
  v28.origin.double y = v11;
  v28.size.width = v13;
  v28.size.height = v15;
  CGRect v29 = CGRectInset(v28, v19, v21);
  v27.double x = x;
  v27.double y = y;
  if (!CGRectContainsPoint(v29, v27))
  {
    v25 = self;
    v23 = &v25;
    goto LABEL_10;
  }
  unsigned __int8 v22 = 1;
LABEL_11:

  return v22;
}

- (void)setNormalImageAlpha:(double)a3
{
  self->_normalImageAlpha = a3;
  [(_SFDimmingButton *)self _updateImageAlpha];
}

- (void)setHighlightedImageAlpha:(double)a3
{
  self->_highlightedImageAlpha = a3;
  [(_SFDimmingButton *)self _updateImageAlpha];
}

- (void)setDimmableBackgroundColor:(id)a3
{
  id v7 = (UIColor *)a3;
  if (self->_dimmableBackgroundColor != v7)
  {
    objc_storeStrong((id *)&self->_dimmableBackgroundColor, a3);
    int v5 = [(UIColor *)v7 sf_darkenedColor];
    cachedDimmedBackgroundColor = self->_cachedDimmedBackgroundColor;
    self->_cachedDimmedBackgroundColor = v5;

    [(_SFDimmingButton *)self _updateBackgroundColor];
  }
}

- (void)_updateBackgroundColor
{
  p_dimmableBackgroundColor = &self->_dimmableBackgroundColor;
  if (self->_dimmableBackgroundColor)
  {
    if ([(_SFDimmingButton *)self isHighlighted]) {
      p_dimmableBackgroundColor = &self->_cachedDimmedBackgroundColor;
    }
    id v4 = *p_dimmableBackgroundColor;
    [(_SFDimmingButton *)self setBackgroundColor:v4];
  }
}

- (void)setTapTargetSideMargin:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E4F29238];
    [v4 floatValue];
    double v8 = v7;
    [v5 floatValue];
    *(double *)CGFloat v11 = v8;
    *(double *)&v11[1] = v9;
    double v10 = [v6 valueWithBytes:v11 objCType:"{CGPoint=dd}"];
    [(_SFDimmingButton *)self setTapTargetSideMargins:v10];
  }
  else
  {
    [(_SFDimmingButton *)self setTapTargetSideMargins:0];
  }
}

- (NSNumber)tapTargetSideMargin
{
  tapTargetSideMargins = self->_tapTargetSideMargins;
  if (tapTargetSideMargins)
  {
    BOOL v3 = NSNumber;
    [tapTargetSideMargins CGPointValue];
    tapTargetSideMargins = objc_msgSend(v3, "numberWithDouble:");
  }

  return (NSNumber *)tapTargetSideMargins;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_SFDimmingButton;
  int v5 = -[_SFDimmingButton contextMenuInteraction:configurationForMenuAtLocation:](&v8, sel_contextMenuInteraction_configurationForMenuAtLocation_, a3, a4.x, a4.y);
  v6 = v5;
  if (self->_alwaysUsesUIMenuOrdering) {
    [v5 setPreferredMenuElementOrder:2];
  }

  return v6;
}

- (double)normalImageAlpha
{
  return self->_normalImageAlpha;
}

- (double)highlightedImageAlpha
{
  return self->_highlightedImageAlpha;
}

- (double)highlightAnimationDuration
{
  return self->_highlightAnimationDuration;
}

- (void)setHighlightAnimationDuration:(double)a3
{
  self->_double highlightAnimationDuration = a3;
}

- (UIColor)dimmableBackgroundColor
{
  return self->_dimmableBackgroundColor;
}

- (NSValue)tapTargetSideMargins
{
  return self->_tapTargetSideMargins;
}

- (BOOL)alwaysUsesUIMenuOrdering
{
  return self->_alwaysUsesUIMenuOrdering;
}

- (void)setAlwaysUsesUIMenuOrdering:(BOOL)a3
{
  self->_alwaysUsesUIMenuOrdering = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapTargetSideMargins, 0);
  objc_storeStrong((id *)&self->_dimmableBackgroundColor, 0);

  objc_storeStrong((id *)&self->_cachedDimmedBackgroundColor, 0);
}

@end
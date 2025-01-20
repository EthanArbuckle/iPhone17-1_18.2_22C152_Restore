@interface BKToolbarButton
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)_isModernButton;
- (CGRect)popoverPresentationRect;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)popoverPresentationEdgeInsets;
- (double)height;
- (double)miniHeight;
- (unint64_t)popoverArrowDirections;
- (void)setHeight:(double)a3;
- (void)setMiniHeight:(double)a3;
- (void)setPopoverPresentationEdgeInsets:(UIEdgeInsets)a3;
- (void)setTitle:(id)a3 forState:(unint64_t)a4 allowAnimation:(BOOL)a5;
@end

@implementation BKToolbarButton

- (CGSize)sizeThatFits:(CGSize)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BKToolbarButton;
  -[BKToolbarButton sizeThatFits:](&v11, "sizeThatFits:", a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  if (self->_inMiniBar) {
    [(BKToolbarButton *)self miniHeight];
  }
  else {
    [(BKToolbarButton *)self height];
  }
  if (v7 >= v8) {
    double v9 = v7;
  }
  else {
    double v9 = v8;
  }
  double v10 = v5;
  result.height = v9;
  result.width = v10;
  return result;
}

- (BOOL)_isModernButton
{
  return 1;
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4 allowAnimation:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  BOOL v9 = +[UIView areAnimationsEnabled];
  +[UIView setAnimationsEnabled:v5];
  [(BKToolbarButton *)self setTitle:v8 forState:a4];

  [(BKToolbarButton *)self layoutIfNeeded];

  +[UIView setAnimationsEnabled:v9];
}

- (unint64_t)popoverArrowDirections
{
  return 3;
}

- (CGRect)popoverPresentationRect
{
  v3 = [(BKToolbarButton *)self imageView];
  [v3 frame];
  double top = self->_popoverPresentationEdgeInsets.top;
  double left = self->_popoverPresentationEdgeInsets.left;
  double v7 = v6 + left;
  double v9 = v8 + top;
  double v11 = v10 - (left + self->_popoverPresentationEdgeInsets.right);
  double v13 = v12 - (top + self->_popoverPresentationEdgeInsets.bottom);

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 0;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (double)miniHeight
{
  return self->_miniHeight;
}

- (void)setMiniHeight:(double)a3
{
  self->_miniHeight = a3;
}

- (UIEdgeInsets)popoverPresentationEdgeInsets
{
  double top = self->_popoverPresentationEdgeInsets.top;
  double left = self->_popoverPresentationEdgeInsets.left;
  double bottom = self->_popoverPresentationEdgeInsets.bottom;
  double right = self->_popoverPresentationEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPopoverPresentationEdgeInsets:(UIEdgeInsets)a3
{
  self->_popoverPresentationEdgeInsets = a3;
}

@end
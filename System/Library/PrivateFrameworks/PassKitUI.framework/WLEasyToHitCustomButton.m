@interface WLEasyToHitCustomButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UIEdgeInsets)margins;
- (WLEasyToHitCustomButton)initWithMargins:(UIEdgeInsets)a3;
- (void)setMargins:(UIEdgeInsets)a3;
@end

@implementation WLEasyToHitCustomButton

- (WLEasyToHitCustomButton)initWithMargins:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v10.receiver = self;
  v10.super_class = (Class)WLEasyToHitCustomButton;
  v7 = -[WLEasyToHitCustomButton initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = v7;
  if (v7) {
    -[WLEasyToHitCustomButton setMargins:](v7, "setMargins:", top, left, bottom, right);
  }
  return v8;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(WLEasyToHitCustomButton *)self bounds];
  [(WLEasyToHitCustomButton *)self margins];
  UIRectInset();
  CGFloat v11 = x;
  CGFloat v12 = y;

  return CGRectContainsPoint(*(CGRect *)&v7, *(CGPoint *)&v11);
}

- (UIEdgeInsets)margins
{
  double top = self->_margins.top;
  double left = self->_margins.left;
  double bottom = self->_margins.bottom;
  double right = self->_margins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

@end
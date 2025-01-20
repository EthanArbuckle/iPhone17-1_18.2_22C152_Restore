@interface UIKeyboardFloatingTransitionState
- (CGAffineTransform)finalInputViewTransform;
- (CGAffineTransform)initialInputViewTransform;
- (CGPoint)scale;
- (CGRect)inputViewFrame;
- (CGRect)platterViewFrame;
- (UIColor)borderColor;
- (UIEdgeInsets)platterInsets;
- (UIView)inputView;
- (double)borderWidth;
- (double)cornerRadius;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setFinalInputViewTransform:(CGAffineTransform *)a3;
- (void)setInitialInputViewTransform:(CGAffineTransform *)a3;
- (void)setInputView:(id)a3;
- (void)setInputViewFrame:(CGRect)a3;
- (void)setPlatterInsets:(UIEdgeInsets)a3;
- (void)setPlatterViewFrame:(CGRect)a3;
- (void)setScale:(CGPoint)a3;
@end

@implementation UIKeyboardFloatingTransitionState

- (UIView)inputView
{
  return self->_inputView;
}

- (void)setInputView:(id)a3
{
}

- (CGRect)inputViewFrame
{
  double x = self->_inputViewFrame.origin.x;
  double y = self->_inputViewFrame.origin.y;
  double width = self->_inputViewFrame.size.width;
  double height = self->_inputViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInputViewFrame:(CGRect)a3
{
  self->_inputViewFrame = a3;
}

- (CGRect)platterViewFrame
{
  double x = self->_platterViewFrame.origin.x;
  double y = self->_platterViewFrame.origin.y;
  double width = self->_platterViewFrame.size.width;
  double height = self->_platterViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPlatterViewFrame:(CGRect)a3
{
  self->_platterViewFrame = a3;
}

- (UIEdgeInsets)platterInsets
{
  double top = self->_platterInsets.top;
  double left = self->_platterInsets.left;
  double bottom = self->_platterInsets.bottom;
  double right = self->_platterInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPlatterInsets:(UIEdgeInsets)a3
{
  self->_platterInsets = a3;
}

- (CGPoint)scale
{
  double x = self->_scale.x;
  double y = self->_scale.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setScale:(CGPoint)a3
{
  self->_scale = a3;
}

- (CGAffineTransform)initialInputViewTransform
{
  long long v3 = *(_OWORD *)&self[3].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[3].ty;
  return self;
}

- (void)setInitialInputViewTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_initialInputViewTransform.tdouble x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_initialInputViewTransform.c = v4;
  *(_OWORD *)&self->_initialInputViewTransform.a = v3;
}

- (CGAffineTransform)finalInputViewTransform
{
  long long v3 = *(_OWORD *)&self[4].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[4].ty;
  return self;
}

- (void)setFinalInputViewTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_finalInputViewTransform.tdouble x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_finalInputViewTransform.c = v4;
  *(_OWORD *)&self->_finalInputViewTransform.a = v3;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
}

@end
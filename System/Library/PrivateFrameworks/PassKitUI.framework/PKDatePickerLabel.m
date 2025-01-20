@interface PKDatePickerLabel
- (UIEdgeInsets)contentInset;
- (void)drawTextInRect:(CGRect)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation PKDatePickerLabel

- (void)drawTextInRect:(CGRect)a3
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  CGFloat v5 = a3.size.width - (left + self->_contentInset.right);
  CGFloat v6 = a3.size.height - (top + self->_contentInset.bottom);
  v7.receiver = self;
  v7.super_class = (Class)PKDatePickerLabel;
  -[PKDatePickerLabel drawTextInRect:](&v7, sel_drawTextInRect_, a3.origin.x + left, a3.origin.y + top, v5, v6);
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

@end
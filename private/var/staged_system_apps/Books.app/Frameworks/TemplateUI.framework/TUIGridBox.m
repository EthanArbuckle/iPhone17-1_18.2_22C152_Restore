@interface TUIGridBox
- (Class)layoutClass;
- (UIEdgeInsets)insets;
- (double)spacing;
- (unint64_t)columns;
- (void)setColumns:(unint64_t)a3;
- (void)setInsets:(UIEdgeInsets)a3;
- (void)setSpacing:(double)a3;
@end

@implementation TUIGridBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

- (unint64_t)columns
{
  return self->_columns;
}

- (void)setColumns:(unint64_t)a3
{
  self->_columns = a3;
}

- (double)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

@end
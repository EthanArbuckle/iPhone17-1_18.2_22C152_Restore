@interface _TVStarBar
- (NSAttributedString)countStr;
- (UIEdgeInsets)barMargin;
- (double)barWidth;
- (double)height;
- (double)value;
- (unint64_t)numStars;
- (void)setBarMargin:(UIEdgeInsets)a3;
- (void)setBarWidth:(double)a3;
- (void)setCountStr:(id)a3;
- (void)setHeight:(double)a3;
- (void)setNumStars:(unint64_t)a3;
- (void)setValue:(double)a3;
@end

@implementation _TVStarBar

- (unint64_t)numStars
{
  return self->_numStars;
}

- (void)setNumStars:(unint64_t)a3
{
  self->_numStars = a3;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (NSAttributedString)countStr
{
  return self->_countStr;
}

- (void)setCountStr:(id)a3
{
}

- (double)barWidth
{
  return self->_barWidth;
}

- (void)setBarWidth:(double)a3
{
  self->_barWidth = a3;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (UIEdgeInsets)barMargin
{
  double top = self->_barMargin.top;
  double left = self->_barMargin.left;
  double bottom = self->_barMargin.bottom;
  double right = self->_barMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBarMargin:(UIEdgeInsets)a3
{
  self->_barMargin = a3;
}

- (void).cxx_destruct
{
}

@end
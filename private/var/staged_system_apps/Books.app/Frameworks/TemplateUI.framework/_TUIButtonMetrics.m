@interface _TUIButtonMetrics
- (UIEdgeInsets)alignmentRectInsets;
- (_TUIButtonMetrics)initWithHeight:(double)a3 widthPadding:(double)a4 alignmentRectInsets:(UIEdgeInsets)a5;
- (double)contentHeight;
- (double)contentWidthPadding;
- (double)height;
- (double)widthPadding;
@end

@implementation _TUIButtonMetrics

- (_TUIButtonMetrics)initWithHeight:(double)a3 widthPadding:(double)a4 alignmentRectInsets:(UIEdgeInsets)a5
{
  CGFloat right = a5.right;
  CGFloat bottom = a5.bottom;
  CGFloat left = a5.left;
  CGFloat top = a5.top;
  v12.receiver = self;
  v12.super_class = (Class)_TUIButtonMetrics;
  result = [(_TUIButtonMetrics *)&v12 init];
  if (result)
  {
    result->_height = a3;
    result->_widthPadding = a4;
    result->_alignmentRectInsets.CGFloat top = top;
    result->_alignmentRectInsets.CGFloat left = left;
    result->_alignmentRectInsets.CGFloat bottom = bottom;
    result->_alignmentRectInsets.CGFloat right = right;
  }
  return result;
}

- (double)contentHeight
{
  return self->_height - self->_alignmentRectInsets.top - self->_alignmentRectInsets.bottom;
}

- (double)contentWidthPadding
{
  return self->_widthPadding - self->_alignmentRectInsets.left - self->_alignmentRectInsets.right;
}

- (double)height
{
  return self->_height;
}

- (double)widthPadding
{
  return self->_widthPadding;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top = self->_alignmentRectInsets.top;
  double left = self->_alignmentRectInsets.left;
  double bottom = self->_alignmentRectInsets.bottom;
  double right = self->_alignmentRectInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

@end
@interface _UITextFieldPaddedMetricsProvider
- (BOOL)canIntrinsicHeightExceedContentHeight;
- (BOOL)shouldExtendCaretHeight;
- (CGRect)contentFrameForBounds:(CGRect)a3;
- (CGSize)intrinsicSizeForContentSize:(CGSize)a3;
- (UIEdgeInsets)padding;
- (_UITextFieldPaddedMetricsProvider)init;
- (_UITextFieldPaddedMetricsProvider)initWithPerEdgePadding:(UIEdgeInsets)a3;
- (_UITextFieldPaddedMetricsProvider)initWithSymmetricalPadding:(CGSize)a3;
- (double)minimumIntrinsicHeight;
- (double)naturalHeight;
- (void)setCanIntrinsicHeightExceedContentHeight:(BOOL)a3;
- (void)setMinimumIntrinsicHeight:(double)a3;
- (void)setPadding:(UIEdgeInsets)a3;
@end

@implementation _UITextFieldPaddedMetricsProvider

- (CGRect)contentFrameForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    double top = self->_padding.top;
    double left = self->_padding.left;
    double v10 = width - left - self->_padding.right;
    double v11 = v10 * 0.5;
    if (v10 >= 0.0) {
      double v11 = 0.0;
    }
    double width = fmax(v10, 0.0);
    double v12 = height - top - self->_padding.bottom;
    double v13 = v12 * 0.5;
    if (v12 >= 0.0) {
      double v13 = 0.0;
    }
    double height = fmax(v12, 0.0);
    double x = x + left + v11;
    double y = y + top + v13;
  }
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGSize)intrinsicSizeForContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(_UITextFieldPaddedMetricsProvider *)self minimumIntrinsicHeight];
  if (v6 > 0.0)
  {
    int v7 = dyld_program_sdk_at_least();
    [(_UITextFieldPaddedMetricsProvider *)self minimumIntrinsicHeight];
    double v9 = fmax(height, v8);
    if (v7) {
      double height = v9;
    }
    else {
      double height = v8;
    }
  }
  double v10 = width - (-self->_padding.right - self->_padding.left);
  double v11 = height - (-self->_padding.bottom - self->_padding.top);
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (double)minimumIntrinsicHeight
{
  return self->_minimumIntrinsicHeight;
}

- (BOOL)shouldExtendCaretHeight
{
  return 1;
}

- (void)setMinimumIntrinsicHeight:(double)a3
{
  self->_minimumIntrinsicHeight = a3;
}

- (_UITextFieldPaddedMetricsProvider)initWithSymmetricalPadding:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)_UITextFieldPaddedMetricsProvider;
  CGSize result = [(_UITextFieldPaddedMetricsProvider *)&v6 init];
  if (result)
  {
    result->_padding.double top = height;
    result->_padding.double left = width;
    result->_padding.bottom = height;
    result->_padding.right = width;
  }
  return result;
}

- (_UITextFieldPaddedMetricsProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UITextFieldPaddedMetricsProvider;
  CGSize result = [(_UITextFieldPaddedMetricsProvider *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_padding.bottom = 0u;
    *(_OWORD *)&result->_padding.double top = 0u;
  }
  return result;
}

- (_UITextFieldPaddedMetricsProvider)initWithPerEdgePadding:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  v8.receiver = self;
  v8.super_class = (Class)_UITextFieldPaddedMetricsProvider;
  CGSize result = [(_UITextFieldPaddedMetricsProvider *)&v8 init];
  if (result)
  {
    result->_padding.CGFloat top = top;
    result->_padding.CGFloat left = left;
    result->_padding.CGFloat bottom = bottom;
    result->_padding.CGFloat right = right;
  }
  return result;
}

- (double)naturalHeight
{
  return -1.0;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (BOOL)canIntrinsicHeightExceedContentHeight
{
  return self->_canIntrinsicHeightExceedContentHeight;
}

- (void)setCanIntrinsicHeightExceedContentHeight:(BOOL)a3
{
  self->_canIntrinsicHeightExceedContentHeight = a3;
}

@end
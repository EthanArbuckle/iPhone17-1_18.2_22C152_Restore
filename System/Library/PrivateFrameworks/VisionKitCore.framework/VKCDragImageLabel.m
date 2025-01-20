@interface VKCDragImageLabel
- (CGSize)intrinsicContentSize;
- (UIEdgeInsets)customEdgeInsets;
- (void)drawTextInRect:(CGRect)a3;
- (void)setCustomEdgeInsets:(UIEdgeInsets)a3;
@end

@implementation VKCDragImageLabel

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(VKCDragImageLabel *)self customEdgeInsets];
  v12.receiver = self;
  v12.super_class = (Class)VKCDragImageLabel;
  -[VKCDragImageLabel drawTextInRect:](&v12, sel_drawTextInRect_, x + v11, y + v8, width - (v11 + v9), height - (v8 + v10));
}

- (CGSize)intrinsicContentSize
{
  v14.receiver = self;
  v14.super_class = (Class)VKCDragImageLabel;
  [(VKCDragImageLabel *)&v14 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  [(VKCDragImageLabel *)self customEdgeInsets];
  double v9 = v4 + v7 + v8;
  double v12 = v6 + v10 + v11;
  double v13 = v9;
  result.double height = v12;
  result.double width = v13;
  return result;
}

- (UIEdgeInsets)customEdgeInsets
{
  double top = self->_customEdgeInsets.top;
  double left = self->_customEdgeInsets.left;
  double bottom = self->_customEdgeInsets.bottom;
  double right = self->_customEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCustomEdgeInsets:(UIEdgeInsets)a3
{
  self->_customEdgeInsets = a3;
}

@end
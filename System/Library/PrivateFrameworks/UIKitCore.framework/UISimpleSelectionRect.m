@interface UISimpleSelectionRect
+ (id)rectWithCGRect:(CGRect)a3;
- (CGRect)rect;
- (void)setRect:(CGRect)a3;
@end

@implementation UISimpleSelectionRect

+ (id)rectWithCGRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = objc_alloc_init(UISimpleSelectionRect);
  -[UISimpleSelectionRect setRect:](v7, "setRect:", x, y, width, height);
  return v7;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

@end
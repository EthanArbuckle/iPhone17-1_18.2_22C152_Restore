@interface ICTextSelectionRect
- (CGRect)rect;
- (void)setRect:(CGRect)a3;
@end

@implementation ICTextSelectionRect

- (CGRect)rect
{
  double x = self->rect.origin.x;
  double y = self->rect.origin.y;
  double width = self->rect.size.width;
  double height = self->rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->rect = a3;
}

@end
@interface WTTextSelectionRect
+ (id)rectWithRect:(CGRect)a3;
- (CGRect)rect;
- (id)description;
@end

@implementation WTTextSelectionRect

+ (id)rectWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = objc_alloc_init(WTTextSelectionRect);
  v7->_rect.origin.CGFloat x = x;
  v7->_rect.origin.CGFloat y = y;
  v7->_rect.size.CGFloat width = width;
  v7->_rect.size.CGFloat height = height;

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

- (id)description
{
  v3 = NSString;
  v4 = NSStringFromCGRect(self->_rect);
  v5 = [v3 stringWithFormat:@"<%p>: %@", self, v4];

  return v5;
}

@end
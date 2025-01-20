@interface TUIHoverRegion
- (CGRect)bounds;
- (TUIHoverRegion)initWithBounds:(CGRect)a3;
@end

@implementation TUIHoverRegion

- (TUIHoverRegion)initWithBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)TUIHoverRegion;
  result = [(TUIHoverRegion *)&v8 init];
  if (result)
  {
    result->_bounds.origin.CGFloat x = x;
    result->_bounds.origin.CGFloat y = y;
    result->_bounds.size.CGFloat width = width;
    result->_bounds.size.CGFloat height = height;
  }
  return result;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end
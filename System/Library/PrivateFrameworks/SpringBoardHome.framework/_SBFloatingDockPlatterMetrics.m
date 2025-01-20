@interface _SBFloatingDockPlatterMetrics
- (CGRect)bounds;
- (_SBFloatingDockPlatterMetrics)initWithBounds:(CGRect)a3 continuousCornerRadius:(double)a4 shadowRadius:(double)a5 shadowYOffset:(double)a6;
- (double)continuousCornerRadius;
- (double)shadowRadius;
- (double)shadowYOffset;
@end

@implementation _SBFloatingDockPlatterMetrics

- (_SBFloatingDockPlatterMetrics)initWithBounds:(CGRect)a3 continuousCornerRadius:(double)a4 shadowRadius:(double)a5 shadowYOffset:(double)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)_SBFloatingDockPlatterMetrics;
  result = [(_SBFloatingDockPlatterMetrics *)&v14 init];
  if (result)
  {
    result->_bounds.origin.CGFloat y = y;
    result->_bounds.size.CGFloat width = width;
    result->_bounds.size.CGFloat height = height;
    result->_continuousCornerRadius = a4;
    result->_shadowRadius = a5;
    result->_shadowYOffset = a6;
    result->_bounds.origin.CGFloat x = x;
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

- (double)continuousCornerRadius
{
  return self->_continuousCornerRadius;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (double)shadowYOffset
{
  return self->_shadowYOffset;
}

@end
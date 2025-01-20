@interface _UIHitTestContext
+ (id)contextWithPoint:(CGPoint)a3 radius:(double)a4;
- (CGPoint)point;
- (_UIHitTestContext)initWithPoint:(CGPoint)a3 radius:(double)a4;
- (double)radius;
@end

@implementation _UIHitTestContext

+ (id)contextWithPoint:(CGPoint)a3 radius:(double)a4
{
  v4 = objc_msgSend(objc_alloc((Class)a1), "initWithPoint:radius:", a3.x, a3.y, a4);
  return v4;
}

- (_UIHitTestContext)initWithPoint:(CGPoint)a3 radius:(double)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)_UIHitTestContext;
  result = [(_UIHitTestContext *)&v8 init];
  if (result)
  {
    result->_point.CGFloat x = x;
    result->_point.CGFloat y = y;
    result->_radius = a4;
  }
  return result;
}

- (CGPoint)point
{
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)radius
{
  return self->_radius;
}

@end
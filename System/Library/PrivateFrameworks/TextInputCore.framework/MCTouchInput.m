@interface MCTouchInput
- (BOOL)canComposeNew:(id)a3;
- (CGPoint)touchPoint;
- (MCTouchInput)initWithTouchPoint:(CGPoint)a3 radius:(double)a4 timestamp:(double)a5;
- (double)radius;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)shortDescriptionWithLeadingString:(id)a3;
@end

@implementation MCTouchInput

- (double)timestamp
{
  return self->_timestamp;
}

- (double)radius
{
  return self->_radius;
}

- (CGPoint)touchPoint
{
  double x = self->_touchPoint.x;
  double y = self->_touchPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)shortDescriptionWithLeadingString:(id)a3
{
  v4 = NSString;
  [(MCTouchInput *)self touchPoint];
  uint64_t v6 = v5;
  [(MCTouchInput *)self touchPoint];
  return (id)[v4 stringWithFormat:@"(%.2f, %.2f)", v6, v7];
}

- (id)description
{
  v3 = NSString;
  [(MCTouchInput *)self touchPoint];
  v4 = NSStringFromPoint(v11);
  [(MCTouchInput *)self radius];
  uint64_t v6 = v5;
  [(MCTouchInput *)self timestamp];
  v8 = [v3 stringWithFormat:@"point=%@, radius=%lf, timestamp=%lf", v4, v6, v7];

  return v8;
}

- (BOOL)canComposeNew:(id)a3
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MCTouchInput;
  id result = [(MCKeyboardInput *)&v5 copyWithZone:a3];
  if (result)
  {
    *((_OWORD *)result + 3) = self->_touchPoint;
    *((void *)result + 4) = *(void *)&self->_radius;
    *((void *)result + 5) = *(void *)&self->_timestamp;
  }
  return result;
}

- (MCTouchInput)initWithTouchPoint:(CGPoint)a3 radius:(double)a4 timestamp:(double)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)MCTouchInput;
  id result = [(MCKeyboardInput *)&v10 init];
  if (result)
  {
    result->_touchPoint.CGFloat x = x;
    result->_touchPoint.CGFloat y = y;
    result->_radius = a4;
    result->_timestamp = a5;
  }
  return result;
}

@end
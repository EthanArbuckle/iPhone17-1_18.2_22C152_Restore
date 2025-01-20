@interface SUUICircleRepellor
- (CGPoint)center;
- (PKPhysicsBody)physicsBody;
- (double)bufferSize;
- (double)radius;
- (id)description;
- (void)setBufferSize:(double)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setPhysicsBody:(id)a3;
- (void)setRadius:(double)a3;
@end

@implementation SUUICircleRepellor

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)SUUICircleRepellor;
  v4 = [(SUUICircleRepellor *)&v9 description];
  physicsBody = self->_physicsBody;
  v6 = NSStringFromCGPoint(self->_center);
  v7 = [v3 stringWithFormat:@"%@: Body: %@, Center: %@, Radius: %.2f", v4, physicsBody, v6, *(void *)&self->_radius];

  return v7;
}

- (double)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(double)a3
{
  self->_bufferSize = a3;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (PKPhysicsBody)physicsBody
{
  return self->_physicsBody;
}

- (void)setPhysicsBody:(id)a3
{
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (void).cxx_destruct
{
}

@end
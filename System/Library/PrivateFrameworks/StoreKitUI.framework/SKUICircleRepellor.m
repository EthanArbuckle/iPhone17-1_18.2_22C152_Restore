@interface SKUICircleRepellor
- (CGPoint)center;
- (PKPhysicsBody)physicsBody;
- (double)bufferSize;
- (double)radius;
- (id)description;
- (void)description;
- (void)setBufferSize:(double)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setPhysicsBody:(id)a3;
- (void)setRadius:(double)a3;
@end

@implementation SKUICircleRepellor

- (id)description
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICircleRepellor description]();
  }
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)SKUICircleRepellor;
  v4 = [(SKUICircleRepellor *)&v9 description];
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

- (void)description
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICircleRepellor description]";
}

@end
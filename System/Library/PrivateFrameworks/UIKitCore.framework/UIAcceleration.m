@interface UIAcceleration
- (NSTimeInterval)timestamp;
- (UIAccelerationValue)x;
- (UIAccelerationValue)y;
- (UIAccelerationValue)z;
- (id)description;
- (void)setTimestamp:(double)a3;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
- (void)setZ:(double)a3;
@end

@implementation UIAcceleration

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: 0x%p; %g, %g, %g at %g>",
               objc_opt_class(),
               self,
               *(void *)&self->_x,
               *(void *)&self->_y,
               *(void *)&self->_z,
               *(void *)&self->_timestamp);
}

- (NSTimeInterval)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (UIAccelerationValue)x
{
  return self->_x;
}

- (void)setX:(double)a3
{
  self->_x = a3;
}

- (UIAccelerationValue)y
{
  return self->_y;
}

- (void)setY:(double)a3
{
  self->_y = a3;
}

- (UIAccelerationValue)z
{
  return self->_z;
}

- (void)setZ:(double)a3
{
  self->_z = a3;
}

@end
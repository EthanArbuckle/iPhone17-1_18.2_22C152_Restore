@interface _UIKBHandwritingInputSpeedModelPoint
- (CGPoint)location;
- (double)timestamp;
- (id)description;
- (void)setLocation:(CGPoint)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation _UIKBHandwritingInputSpeedModelPoint

- (id)description
{
  return (id)[NSString stringWithFormat:@"(%f, %f) ts=%f", *(void *)&self->_location.x, *(void *)&self->_location.y, *(void *)&self->_timestamp];
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end
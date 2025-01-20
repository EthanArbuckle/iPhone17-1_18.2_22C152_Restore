@interface FaceDetectionBuffer
- (CGRect)getRectPtr;
- (CGRect)rect;
- (unsigned)confidence;
- (unsigned)roll;
- (unsigned)yaw;
- (void)setConfidence:(unsigned __int16)a3;
- (void)setGetRectPtr:(CGRect *)a3;
- (void)setRect:(CGRect)a3;
- (void)setRoll:(unsigned __int16)a3;
- (void)setYaw:(unsigned __int16)a3;
@end

@implementation FaceDetectionBuffer

- (CGRect)getRectPtr
{
  return &self->_rect;
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

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (void)setGetRectPtr:(CGRect *)a3
{
  self->_getRectPtr = a3;
}

- (unsigned)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(unsigned __int16)a3
{
  self->_confidence = a3;
}

- (unsigned)roll
{
  return self->_roll;
}

- (void)setRoll:(unsigned __int16)a3
{
  self->_roll = a3;
}

- (unsigned)yaw
{
  return self->_yaw;
}

- (void)setYaw:(unsigned __int16)a3
{
  self->_yaw = a3;
}

@end
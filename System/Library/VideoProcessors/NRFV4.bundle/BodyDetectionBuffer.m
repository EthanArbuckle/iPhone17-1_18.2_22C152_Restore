@interface BodyDetectionBuffer
- (CGRect)getRectPtr;
- (CGRect)rect;
- (unsigned)confidence;
- (void)setConfidence:(unsigned __int16)a3;
- (void)setGetRectPtr:(CGRect *)a3;
- (void)setRect:(CGRect)a3;
@end

@implementation BodyDetectionBuffer

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

@end
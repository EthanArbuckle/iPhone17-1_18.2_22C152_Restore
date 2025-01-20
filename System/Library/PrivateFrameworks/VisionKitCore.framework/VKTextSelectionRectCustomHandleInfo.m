@interface VKTextSelectionRectCustomHandleInfo
- (CGPoint)bottomLeft;
- (CGPoint)bottomRight;
- (CGPoint)topLeft;
- (CGPoint)topRight;
- (void)setBottomLeft:(CGPoint)a3;
- (void)setBottomRight:(CGPoint)a3;
- (void)setTopLeft:(CGPoint)a3;
- (void)setTopRight:(CGPoint)a3;
@end

@implementation VKTextSelectionRectCustomHandleInfo

- (CGPoint)bottomLeft
{
  double x = self->_bottomLeft.x;
  double y = self->_bottomLeft.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBottomLeft:(CGPoint)a3
{
  self->_bottomLeft = a3;
}

- (CGPoint)topLeft
{
  double x = self->_topLeft.x;
  double y = self->_topLeft.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTopLeft:(CGPoint)a3
{
  self->_topLeft = a3;
}

- (CGPoint)bottomRight
{
  double x = self->_bottomRight.x;
  double y = self->_bottomRight.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBottomRight:(CGPoint)a3
{
  self->_bottomRight = a3;
}

- (CGPoint)topRight
{
  double x = self->_topRight.x;
  double y = self->_topRight.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTopRight:(CGPoint)a3
{
  self->_topRight = a3;
}

@end
@interface TSWPBeginMagnificationUserInfo
- (BOOL)animated;
- (CGPoint)magnificationPoint;
- (CGPoint)offset;
- (TSWPRep)target;
- (void)setAnimated:(BOOL)a3;
- (void)setMagnificationPoint:(CGPoint)a3;
- (void)setOffset:(CGPoint)a3;
- (void)setTarget:(id)a3;
@end

@implementation TSWPBeginMagnificationUserInfo

- (TSWPRep)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  self->_target = (TSWPRep *)a3;
}

- (CGPoint)magnificationPoint
{
  double x = self->_magnificationPoint.x;
  double y = self->_magnificationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMagnificationPoint:(CGPoint)a3
{
  self->_magnificationPoint = a3;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

@end
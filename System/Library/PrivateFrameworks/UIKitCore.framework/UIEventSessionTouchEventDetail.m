@interface UIEventSessionTouchEventDetail
- (CGPoint)lastLocation;
- (UIEventSessionTouchEventDetail)init;
- (double)dragDistanceSquared;
- (int64_t)tapDragState;
- (int64_t)upDownState;
- (int64_t)windowSection;
- (void)setDragDistanceSquared:(double)a3;
- (void)setLastLocation:(CGPoint)a3;
- (void)setTapDragState:(int64_t)a3;
- (void)setUpDownState:(int64_t)a3;
- (void)setWindowSection:(int64_t)a3;
@end

@implementation UIEventSessionTouchEventDetail

- (UIEventSessionTouchEventDetail)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIEventSessionTouchEventDetail;
  result = [(UIEventSessionTouchEventDetail *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_windowSection = 0u;
    *(_OWORD *)&result->_upDownState = 0u;
  }
  return result;
}

- (int64_t)upDownState
{
  return self->_upDownState;
}

- (void)setUpDownState:(int64_t)a3
{
  self->_upDownState = a3;
}

- (int64_t)tapDragState
{
  return self->_tapDragState;
}

- (void)setTapDragState:(int64_t)a3
{
  self->_tapDragState = a3;
}

- (int64_t)windowSection
{
  return self->_windowSection;
}

- (void)setWindowSection:(int64_t)a3
{
  self->_windowSection = a3;
}

- (double)dragDistanceSquared
{
  return self->_dragDistanceSquared;
}

- (void)setDragDistanceSquared:(double)a3
{
  self->_dragDistanceSquared = a3;
}

- (CGPoint)lastLocation
{
  double x = self->_lastLocation.x;
  double y = self->_lastLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastLocation:(CGPoint)a3
{
  self->_lastLocation = a3;
}

@end
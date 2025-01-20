@interface TVRUITouchEvent
- (CGPoint)digitizerLocation;
- (TVRUITouchEvent)initWithTimestamp:(double)a3 touchPhase:(int64_t)a4 fingerIndex:(int64_t)a5 digitizerLocation:(CGPoint)a6;
- (double)timestamp;
- (int64_t)fingerIndex;
- (int64_t)touchPhase;
@end

@implementation TVRUITouchEvent

- (TVRUITouchEvent)initWithTimestamp:(double)a3 touchPhase:(int64_t)a4 fingerIndex:(int64_t)a5 digitizerLocation:(CGPoint)a6
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  v12.receiver = self;
  v12.super_class = (Class)TVRUITouchEvent;
  result = [(TVRUITouchEvent *)&v12 init];
  if (result)
  {
    result->_timestamp = a3;
    result->_touchPhase = a4;
    result->_fingerIndeCGFloat x = a5;
    result->_digitizerLocation.CGFloat x = x;
    result->_digitizerLocation.CGFloat y = y;
  }
  return result;
}

- (CGPoint)digitizerLocation
{
  double x = self->_digitizerLocation.x;
  double y = self->_digitizerLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)touchPhase
{
  return self->_touchPhase;
}

- (int64_t)fingerIndex
{
  return self->_fingerIndex;
}

@end
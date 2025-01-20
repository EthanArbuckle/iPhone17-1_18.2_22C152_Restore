@interface _TVRUITouch
- (_TVRUITouch)initWithTimestamp:(double)a3 touchPhase:(int64_t)a4 fingerIndex:(int64_t)a5;
- (double)timestamp;
- (int64_t)fingerIndex;
- (int64_t)phase;
@end

@implementation _TVRUITouch

- (_TVRUITouch)initWithTimestamp:(double)a3 touchPhase:(int64_t)a4 fingerIndex:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)_TVRUITouch;
  result = [(_TVRUITouch *)&v9 init];
  if (result)
  {
    result->_timestamp = a3;
    result->_phase = a4;
    result->_fingerIndex = a5;
  }
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)phase
{
  return self->_phase;
}

- (int64_t)fingerIndex
{
  return self->_fingerIndex;
}

@end
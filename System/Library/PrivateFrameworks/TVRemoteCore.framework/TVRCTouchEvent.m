@interface TVRCTouchEvent
+ (BOOL)supportsSecureCoding;
- (CGPoint)digitizerLocation;
- (TVRCTouchEvent)initWithCoder:(id)a3;
- (double)timestamp;
- (id)_initWithTimestamp:(double)a3 finger:(int64_t)a4 phase:(int64_t)a5 digitizerLocation:(CGPoint)a6;
- (id)description;
- (int64_t)finger;
- (int64_t)phase;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TVRCTouchEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCTouchEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TVRCTouchEvent;
  v5 = [(TVRCTouchEvent *)&v10 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_timestamp = v6;
    v5->_finger = [v4 decodeIntegerForKey:@"finger"];
    v5->_phase = [v4 decodeIntegerForKey:@"phase"];
    [v4 decodeDoubleForKey:@"digitizerLocation.x"];
    v5->_digitizerLocation.x = v7;
    [v4 decodeDoubleForKey:@"digitizerLocation.y"];
    v5->_digitizerLocation.y = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeDouble:@"timestamp" forKey:timestamp];
  [v5 encodeInteger:self->_finger forKey:@"finger"];
  [v5 encodeInteger:self->_phase forKey:@"phase"];
  [v5 encodeDouble:@"digitizerLocation.x" forKey:self->_digitizerLocation.x];
  [v5 encodeDouble:@"digitizerLocation.y" forKey:self->_digitizerLocation.y];
}

- (id)_initWithTimestamp:(double)a3 finger:(int64_t)a4 phase:(int64_t)a5 digitizerLocation:(CGPoint)a6
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  v12.receiver = self;
  v12.super_class = (Class)TVRCTouchEvent;
  id result = [(TVRCTouchEvent *)&v12 init];
  if (result)
  {
    *((double *)result + 1) = a3;
    *((void *)result + 2) = a4;
    *((void *)result + 3) = a5;
    *((CGFloat *)result + 4) = x;
    *((CGFloat *)result + 5) = y;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t phase = self->_phase;
  if (phase > 5) {
    double v6 = @"Undefined";
  }
  else {
    double v6 = off_2647B0190[phase];
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@ %p; finger=%d; phase=%@; location={%g, %g}>",
               v4,
               self,
               self->_finger,
               v6,
               *(void *)&self->_digitizerLocation.x,
               *(void *)&self->_digitizerLocation.y);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)finger
{
  return self->_finger;
}

- (int64_t)phase
{
  return self->_phase;
}

- (CGPoint)digitizerLocation
{
  double x = self->_digitizerLocation.x;
  double y = self->_digitizerLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end
@interface MRMotion
- (MRMotion)initWithKey:(id)a3 value:(double)a4 duration:(double)a5 easeIn:(double)a6 easeOut:(double)a7;
- (NSString)key;
- (double)duration;
- (double)easeIn;
- (double)easeOut;
- (double)startTime;
- (double)startValue;
- (double)value;
- (double)valueAtTime:(double)a3;
- (void)dealloc;
- (void)setStartTime:(double)a3;
- (void)setStartValue:(double)a3;
@end

@implementation MRMotion

- (MRMotion)initWithKey:(id)a3 value:(double)a4 duration:(double)a5 easeIn:(double)a6 easeOut:(double)a7
{
  v14.receiver = self;
  v14.super_class = (Class)MRMotion;
  v12 = [(MRMotion *)&v14 init];
  if (v12)
  {
    v12->_key = (NSString *)a3;
    v12->_value = a4;
    v12->_startTime = -1.0;
    v12->_duration = a5;
    v12->_easeIn = a6;
    v12->_easeOut = a7;
  }
  return v12;
}

- (void)dealloc
{
  self->_key = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRMotion;
  [(MRMotion *)&v3 dealloc];
}

- (double)valueAtTime:(double)a3
{
  double startTime = self->_startTime;
  double v5 = 0.0;
  if (startTime < a3)
  {
    double duration = self->_duration;
    double v5 = 1.0;
    if (startTime + duration > a3) {
      double v5 = (a3 - startTime) / duration;
    }
  }
  return self->_startValue
       + Spline1(v5, 0.0, self->_easeIn, self->_easeOut + 1.0, 1.0, 0.0, 0.0, 1.0, 1.0)
       * (self->_value - self->_startValue);
}

- (NSString)key
{
  return self->_key;
}

- (double)startValue
{
  return self->_startValue;
}

- (void)setStartValue:(double)a3
{
  self->_startValue = a3;
}

- (double)value
{
  return self->_value;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_double startTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (double)easeIn
{
  return self->_easeIn;
}

- (double)easeOut
{
  return self->_easeOut;
}

@end
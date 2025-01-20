@interface ULHomeSlamTimer
- (NSDate)startTime;
- (ULHomeSlamTimer)initWithTimeout:(double)a3 andStartTime:(id)a4;
- (double)timeoutSeconds;
- (id)checkTimeoutAtDate:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setTimeoutSeconds:(double)a3;
@end

@implementation ULHomeSlamTimer

- (ULHomeSlamTimer)initWithTimeout:(double)a3 andStartTime:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ULHomeSlamTimer;
  v7 = [(ULHomeSlamTimer *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(ULHomeSlamTimer *)v7 setTimeoutSeconds:a3];
    [(ULHomeSlamTimer *)v8 setStartTime:v6];
  }

  return v8;
}

- (id)checkTimeoutAtDate:(id)a3
{
  id v4 = a3;
  v5 = [(ULHomeSlamTimer *)self startTime];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  [(ULHomeSlamTimer *)self timeoutSeconds];
  double v9 = v8;

  if (v7 <= v9)
  {
    v11 = 0;
  }
  else
  {
    objc_super v10 = [(ULHomeSlamTimer *)self startTime];
    [(ULHomeSlamTimer *)self timeoutSeconds];
    v11 = objc_msgSend(v10, "dateByAddingTimeInterval:");
  }
  return v11;
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
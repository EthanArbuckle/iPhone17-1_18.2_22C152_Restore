@interface PRUISDefaultSessionReconnectPolicy
- (PRUISDefaultSessionReconnectPolicy)init;
- (double)sessionReconnectDelay;
- (void)sessionDidDisconnect;
@end

@implementation PRUISDefaultSessionReconnectPolicy

- (PRUISDefaultSessionReconnectPolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)PRUISDefaultSessionReconnectPolicy;
  result = [(PRUISDefaultSessionReconnectPolicy *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_intervalMovingAverage = xmmword_25A06D6B0;
  }
  return result;
}

- (void)sessionDidDisconnect
{
  objc_super v3 = [MEMORY[0x263EFF910] now];
  v4 = v3;
  if (self->_lastDisconnect)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    double intervalMovingAverage = self->_intervalMovingAverage;
    if (intervalMovingAverage != 0.0) {
      double v5 = intervalMovingAverage * (1.0 - self->_alpha) + self->_alpha * v5;
    }
    self->_double intervalMovingAverage = v5;
  }
  lastDisconnect = self->_lastDisconnect;
  self->_lastDisconnect = v4;
}

- (double)sessionReconnectDelay
{
  return fmin(fmax(log(10.0 / self->_intervalMovingAverage) * 0.05, 0.0), 0.1);
}

- (void).cxx_destruct
{
}

@end
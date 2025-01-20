@interface TUIImpressionConfiguration
- (TUIImpressionConfiguration)init;
- (double)minUpdateInterval;
- (double)timingThreshold;
- (void)setMinUpdateInterval:(double)a3;
- (void)setTimingThreshold:(double)a3;
@end

@implementation TUIImpressionConfiguration

- (TUIImpressionConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUIImpressionConfiguration;
  result = [(TUIImpressionConfiguration *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_minUpdateInterval = xmmword_242B60;
  }
  return result;
}

- (double)minUpdateInterval
{
  return self->_minUpdateInterval;
}

- (void)setMinUpdateInterval:(double)a3
{
  self->_minUpdateInterval = a3;
}

- (double)timingThreshold
{
  return self->_timingThreshold;
}

- (void)setTimingThreshold:(double)a3
{
  self->_timingThreshold = a3;
}

@end
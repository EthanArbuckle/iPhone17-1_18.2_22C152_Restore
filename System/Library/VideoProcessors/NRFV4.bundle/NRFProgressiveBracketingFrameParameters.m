@interface NRFProgressiveBracketingFrameParameters
- (NRFProgressiveBracketingFrameParameters)initWithIntegrationTime:(double)a3 gain:(float)a4 AGC:(int)a5;
- (double)integrationTime;
- (float)gain;
- (int)AGC;
- (void)setAGC:(int)a3;
@end

@implementation NRFProgressiveBracketingFrameParameters

- (NRFProgressiveBracketingFrameParameters)initWithIntegrationTime:(double)a3 gain:(float)a4 AGC:(int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)NRFProgressiveBracketingFrameParameters;
  result = [(NRFProgressiveBracketingFrameParameters *)&v9 init];
  if (result)
  {
    result->_integrationTime = a3;
    result->_gain = a4;
    result->_AGC = a5;
  }
  return result;
}

- (double)integrationTime
{
  return self->_integrationTime;
}

- (float)gain
{
  return self->_gain;
}

- (int)AGC
{
  return self->_AGC;
}

- (void)setAGC:(int)a3
{
  self->_AGC = a3;
}

@end
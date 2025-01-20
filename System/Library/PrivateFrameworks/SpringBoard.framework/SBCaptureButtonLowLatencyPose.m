@interface SBCaptureButtonLowLatencyPose
- (SBCaptureButtonLowLatencyPose)initWithTimeSinceLastStationary:(double)a3 timeSinceLastNonStationary:(double)a4;
- (double)timeSinceLastNonStationary;
- (double)timeSinceLastStationary;
@end

@implementation SBCaptureButtonLowLatencyPose

- (SBCaptureButtonLowLatencyPose)initWithTimeSinceLastStationary:(double)a3 timeSinceLastNonStationary:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBCaptureButtonLowLatencyPose;
  result = [(SBCaptureButtonLowLatencyPose *)&v7 init];
  if (result)
  {
    result->_timeSinceLastStationary = a3;
    result->_timeSinceLastNonStationary = a4;
  }
  return result;
}

- (double)timeSinceLastStationary
{
  return self->_timeSinceLastStationary;
}

- (double)timeSinceLastNonStationary
{
  return self->_timeSinceLastNonStationary;
}

@end
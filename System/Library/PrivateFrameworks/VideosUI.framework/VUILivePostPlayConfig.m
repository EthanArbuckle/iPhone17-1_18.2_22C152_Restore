@interface VUILivePostPlayConfig
- (VUILivePostPlayConfig)init;
- (double)clockScorePollingInterval;
- (double)dismissPlaybackDelay;
- (void)setClockScorePollingInterval:(double)a3;
- (void)setDismissPlaybackDelay:(double)a3;
@end

@implementation VUILivePostPlayConfig

- (VUILivePostPlayConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUILivePostPlayConfig;
  result = [(VUILivePostPlayConfig *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_clockScorePollingInterval = xmmword_1E38FE030;
  }
  return result;
}

- (double)clockScorePollingInterval
{
  return self->_clockScorePollingInterval;
}

- (void)setClockScorePollingInterval:(double)a3
{
  self->_clockScorePollingInterval = a3;
}

- (double)dismissPlaybackDelay
{
  return self->_dismissPlaybackDelay;
}

- (void)setDismissPlaybackDelay:(double)a3
{
  self->_dismissPlaybackDelay = a3;
}

@end
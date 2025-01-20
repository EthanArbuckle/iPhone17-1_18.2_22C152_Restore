@interface _TVRCRMSNowPlayingState
+ (id)nowPlayingStateFromInfo:(id)a3;
- (NSDate)lastReportedTimestamp;
- (double)duration;
- (double)lastReportedPlaybackPosition;
- (double)playbackRate;
- (void)setDuration:(double)a3;
- (void)setLastReportedPlaybackPosition:(double)a3;
- (void)setLastReportedTimestamp:(id)a3;
- (void)setPlaybackRate:(double)a3;
@end

@implementation _TVRCRMSNowPlayingState

+ (id)nowPlayingStateFromInfo:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_TVRCRMSNowPlayingState);
  [v3 totalDuration];
  double v6 = v5 / 1000.0;
  [v3 timeRemaining];
  double v8 = v6 - v7 / 1000.0;
  v9 = (void *)MEMORY[0x263EFF910];
  [v3 timestamp];
  v10 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v11 = [v3 playbackState];

  if (v11 == 4) {
    double v12 = 1.0;
  }
  else {
    double v12 = 0.0;
  }
  [(_TVRCRMSNowPlayingState *)v4 setDuration:v6];
  [(_TVRCRMSNowPlayingState *)v4 setPlaybackRate:v12];
  [(_TVRCRMSNowPlayingState *)v4 setLastReportedTimestamp:v10];
  [(_TVRCRMSNowPlayingState *)v4 setLastReportedPlaybackPosition:v8];

  return v4;
}

- (double)playbackRate
{
  return self->_playbackRate;
}

- (void)setPlaybackRate:(double)a3
{
  self->_playbackRate = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSDate)lastReportedTimestamp
{
  return self->_lastReportedTimestamp;
}

- (void)setLastReportedTimestamp:(id)a3
{
}

- (double)lastReportedPlaybackPosition
{
  return self->_lastReportedPlaybackPosition;
}

- (void)setLastReportedPlaybackPosition:(double)a3
{
  self->_lastReportedPlaybackPosition = a3;
}

- (void).cxx_destruct
{
}

@end
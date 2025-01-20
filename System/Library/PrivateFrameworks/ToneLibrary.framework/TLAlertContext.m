@interface TLAlertContext
- (BOOL)isBeingInterrupted;
- (NSDate)playbackStartDate;
- (OS_dispatch_source)timeoutTimerSource;
- (int64_t)playbackBackEnd;
- (void)setBeingInterrupted:(BOOL)a3;
- (void)setPlaybackBackEnd:(int64_t)a3;
- (void)setPlaybackStartDate:(id)a3;
- (void)setTimeoutTimerSource:(id)a3;
@end

@implementation TLAlertContext

- (int64_t)playbackBackEnd
{
  return self->_playbackBackEnd;
}

- (void)setPlaybackBackEnd:(int64_t)a3
{
  self->_playbackBackEnd = a3;
}

- (NSDate)playbackStartDate
{
  return self->_playbackStartDate;
}

- (void)setPlaybackStartDate:(id)a3
{
}

- (OS_dispatch_source)timeoutTimerSource
{
  return self->_timeoutTimerSource;
}

- (void)setTimeoutTimerSource:(id)a3
{
}

- (BOOL)isBeingInterrupted
{
  return self->_beingInterrupted;
}

- (void)setBeingInterrupted:(BOOL)a3
{
  self->_beingInterrupted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimerSource, 0);

  objc_storeStrong((id *)&self->_playbackStartDate, 0);
}

@end
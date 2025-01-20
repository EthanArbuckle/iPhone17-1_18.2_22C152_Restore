@interface SXMediaEngageCompleteEvent
- (double)mediaDuration;
- (double)mediaFrameRate;
- (double)mediaTimePlayed;
- (void)setMediaDuration:(double)a3;
- (void)setMediaFrameRate:(double)a3;
- (void)setMediaTimePlayed:(double)a3;
@end

@implementation SXMediaEngageCompleteEvent

- (double)mediaFrameRate
{
  return self->_mediaFrameRate;
}

- (void)setMediaFrameRate:(double)a3
{
  self->_mediaFrameRate = a3;
}

- (double)mediaDuration
{
  return self->_mediaDuration;
}

- (void)setMediaDuration:(double)a3
{
  self->_mediaDuration = a3;
}

- (double)mediaTimePlayed
{
  return self->_mediaTimePlayed;
}

- (void)setMediaTimePlayed:(double)a3
{
  self->_mediaTimePlayed = a3;
}

@end
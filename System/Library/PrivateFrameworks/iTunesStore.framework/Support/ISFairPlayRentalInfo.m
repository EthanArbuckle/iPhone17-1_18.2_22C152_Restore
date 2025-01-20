@interface ISFairPlayRentalInfo
- (unsigned)playbackDuration;
- (unsigned)playbackStartTime;
- (unsigned)rentalDuration;
- (unsigned)rentalStartTime;
- (void)setPlaybackDuration:(unsigned int)a3;
- (void)setPlaybackStartTime:(unsigned int)a3;
- (void)setRentalDuration:(unsigned int)a3;
- (void)setRentalStartTime:(unsigned int)a3;
@end

@implementation ISFairPlayRentalInfo

- (unsigned)playbackDuration
{
  return self->_playbackDuration;
}

- (void)setPlaybackDuration:(unsigned int)a3
{
  self->_playbackDuration = a3;
}

- (unsigned)playbackStartTime
{
  return self->_playbackStartTime;
}

- (void)setPlaybackStartTime:(unsigned int)a3
{
  self->_playbackStartTime = a3;
}

- (unsigned)rentalDuration
{
  return self->_rentalDuration;
}

- (void)setRentalDuration:(unsigned int)a3
{
  self->_rentalDuration = a3;
}

- (unsigned)rentalStartTime
{
  return self->_rentalStartTime;
}

- (void)setRentalStartTime:(unsigned int)a3
{
  self->_rentalStartTime = a3;
}

@end
@interface OADWavAudioFile
- (BOOL)hasDuration;
- (BOOL)isAudioOnly;
- (float)duration;
- (void)setDuration:(float)a3;
- (void)setHasDuration:(BOOL)a3;
@end

@implementation OADWavAudioFile

- (BOOL)isAudioOnly
{
  return 1;
}

- (float)duration
{
  return *(float *)(&self->super.super.loop + 3);
}

- (void)setDuration:(float)a3
{
  *(float *)(&self->super.super.loop + 3) = a3;
}

- (BOOL)hasDuration
{
  return LOBYTE(self->mDuration);
}

- (void)setHasDuration:(BOOL)a3
{
  LOBYTE(self->mDuration) = a3;
}

@end
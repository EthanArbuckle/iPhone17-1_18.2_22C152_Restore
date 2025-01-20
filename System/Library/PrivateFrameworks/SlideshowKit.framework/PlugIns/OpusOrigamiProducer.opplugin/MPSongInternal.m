@interface MPSongInternal
- (BOOL)assetLogging;
- (double)audioVolume;
- (double)duration;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (double)startTime;
- (void)setAssetLogging:(BOOL)a3;
- (void)setAudioVolume:(double)a3;
- (void)setDuration:(double)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setStartTime:(double)a3;
@end

@implementation MPSongInternal

- (double)duration
{
  return self->duration;
}

- (void)setDuration:(double)a3
{
  self->duration = a3;
}

- (double)startTime
{
  return self->startTime;
}

- (void)setStartTime:(double)a3
{
  self->startTime = a3;
}

- (double)audioVolume
{
  return self->audioVolume;
}

- (void)setAudioVolume:(double)a3
{
  self->audioVolume = a3;
}

- (double)fadeInDuration
{
  return self->fadeInDuration;
}

- (void)setFadeInDuration:(double)a3
{
  self->fadeInDuration = a3;
}

- (double)fadeOutDuration
{
  return self->fadeOutDuration;
}

- (void)setFadeOutDuration:(double)a3
{
  self->fadeOutDuration = a3;
}

- (BOOL)assetLogging
{
  return self->assetLogging;
}

- (void)setAssetLogging:(BOOL)a3
{
  self->assetLogging = a3;
}

@end
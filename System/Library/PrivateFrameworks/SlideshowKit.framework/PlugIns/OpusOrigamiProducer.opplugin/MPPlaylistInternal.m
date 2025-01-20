@interface MPPlaylistInternal
- (double)duckInDuration;
- (double)duckLevel;
- (double)duckOutDuration;
- (double)duration;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (void)setDuckInDuration:(double)a3;
- (void)setDuckLevel:(double)a3;
- (void)setDuckOutDuration:(double)a3;
- (void)setDuration:(double)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
@end

@implementation MPPlaylistInternal

- (double)duration
{
  return self->duration;
}

- (void)setDuration:(double)a3
{
  self->duration = a3;
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

- (double)duckInDuration
{
  return self->duckInDuration;
}

- (void)setDuckInDuration:(double)a3
{
  self->duckInDuration = a3;
}

- (double)duckOutDuration
{
  return self->duckOutDuration;
}

- (void)setDuckOutDuration:(double)a3
{
  self->duckOutDuration = a3;
}

- (double)duckLevel
{
  return self->duckLevel;
}

- (void)setDuckLevel:(double)a3
{
  self->duckLevel = a3;
}

@end
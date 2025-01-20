@interface CLKUIRenderFrequencyLink
- (BOOL)isPaused;
- (CLKUIRenderFrequencyLink)init;
- (unint64_t)preferredFramesPerSecond;
- (void)setPaused:(BOOL)a3;
- (void)setPreferredFramesPerSecond:(unint64_t)a3;
@end

@implementation CLKUIRenderFrequencyLink

- (CLKUIRenderFrequencyLink)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLKUIRenderFrequencyLink;
  result = [(CLKUIRenderFrequencyLink *)&v3 init];
  if (result)
  {
    result->_paused = 1;
    result->_preferredFramesPerSecond = 0;
  }
  return result;
}

- (unint64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (void)setPreferredFramesPerSecond:(unint64_t)a3
{
  self->_preferredFramesPerSecond = a3;
  [(CLKUIRenderFrequencyLink *)self updateCoordinator];
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
  [(CLKUIRenderFrequencyLink *)self updateCoordinator];
}

@end
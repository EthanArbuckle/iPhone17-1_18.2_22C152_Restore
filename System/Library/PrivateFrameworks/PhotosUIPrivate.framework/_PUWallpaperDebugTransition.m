@interface _PUWallpaperDebugTransition
- (NSObject)animationSettings;
- (double)px_duration;
- (void)setAnimationSettings:(id)a3;
- (void)setPx_duration:(double)a3;
@end

@implementation _PUWallpaperDebugTransition

- (void).cxx_destruct
{
}

- (void)setPx_duration:(double)a3
{
  self->_px_duration = a3;
}

- (double)px_duration
{
  return self->_px_duration;
}

- (void)setAnimationSettings:(id)a3
{
}

- (NSObject)animationSettings
{
  return self->_animationSettings;
}

@end
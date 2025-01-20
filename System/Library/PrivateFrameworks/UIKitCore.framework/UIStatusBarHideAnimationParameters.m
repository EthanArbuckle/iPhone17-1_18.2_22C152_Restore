@interface UIStatusBarHideAnimationParameters
- (BOOL)shouldAnimate;
- (UIStatusBarHideAnimationParameters)initWithDefaultParameters;
- (double)additionalSlideHeight;
- (int)hideAnimation;
- (void)setAdditionalSlideHeight:(double)a3;
- (void)setHideAnimation:(int)a3;
@end

@implementation UIStatusBarHideAnimationParameters

- (void)setHideAnimation:(int)a3
{
  self->_hideAnimation = a3;
}

- (int)hideAnimation
{
  return self->_hideAnimation;
}

- (BOOL)shouldAnimate
{
  if (!self->_hideAnimation) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarHideAnimationParameters;
  return [(UIStatusBarAnimationParameters *)&v3 shouldAnimate];
}

- (UIStatusBarHideAnimationParameters)initWithDefaultParameters
{
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarHideAnimationParameters;
  result = [(UIStatusBarAnimationParameters *)&v3 initWithDefaultParameters];
  if (result)
  {
    result->_hideAnimation = 1;
    result->super._duration = 0.35;
  }
  return result;
}

- (double)additionalSlideHeight
{
  return self->_additionalSlideHeight;
}

- (void)setAdditionalSlideHeight:(double)a3
{
  self->_additionalSlideHeight = a3;
}

@end
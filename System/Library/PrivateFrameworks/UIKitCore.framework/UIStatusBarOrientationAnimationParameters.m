@interface UIStatusBarOrientationAnimationParameters
- (BOOL)shouldAnimate;
- (UIStatusBarOrientationAnimationParameters)initWithDefaultParameters;
- (int)orientationAnimation;
- (void)setOrientationAnimation:(int)a3;
@end

@implementation UIStatusBarOrientationAnimationParameters

- (UIStatusBarOrientationAnimationParameters)initWithDefaultParameters
{
  v6.receiver = self;
  v6.super_class = (Class)UIStatusBarOrientationAnimationParameters;
  v2 = [(UIStatusBarAnimationParameters *)&v6 initWithDefaultParameters];
  v3 = v2;
  if (v2)
  {
    v2->_orientationAnimation = 2;
    [(id)UIApp statusBarOrientationAnimationDuration];
    v3->super._duration = v4;
  }
  return v3;
}

- (BOOL)shouldAnimate
{
  if (!self->_orientationAnimation) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarOrientationAnimationParameters;
  return [(UIStatusBarAnimationParameters *)&v3 shouldAnimate];
}

- (int)orientationAnimation
{
  return self->_orientationAnimation;
}

- (void)setOrientationAnimation:(int)a3
{
  self->_orientationAnimation = a3;
}

@end
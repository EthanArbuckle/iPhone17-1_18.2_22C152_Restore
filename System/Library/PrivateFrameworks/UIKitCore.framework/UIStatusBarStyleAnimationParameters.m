@interface UIStatusBarStyleAnimationParameters
- (BOOL)shouldAnimate;
- (UIStatusBarStyleAnimationParameters)initWithDefaultParameters;
- (int)styleAnimation;
- (void)setStyleAnimation:(int)a3;
@end

@implementation UIStatusBarStyleAnimationParameters

- (BOOL)shouldAnimate
{
  if (!self->_styleAnimation) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarStyleAnimationParameters;
  return [(UIStatusBarAnimationParameters *)&v3 shouldAnimate];
}

- (UIStatusBarStyleAnimationParameters)initWithDefaultParameters
{
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarStyleAnimationParameters;
  result = [(UIStatusBarAnimationParameters *)&v3 initWithDefaultParameters];
  if (result)
  {
    result->_styleAnimation = 1;
    result->super._duration = 0.35;
  }
  return result;
}

- (void)setStyleAnimation:(int)a3
{
  self->_styleAnimation = 1;
}

- (int)styleAnimation
{
  return self->_styleAnimation;
}

@end
@interface NSWritingToolsAnimationParameters
- (NSWritingToolsAnimationParameters)initWithDelay:(double)a3 duration:(double)a4;
- (double)delay;
- (double)duration;
- (id)alongsideAnimation;
- (id)alongsideCompletion;
- (void)setAlongsideAnimation:(id)a3;
- (void)setAlongsideCompletion:(id)a3;
@end

@implementation NSWritingToolsAnimationParameters

- (NSWritingToolsAnimationParameters)initWithDelay:(double)a3 duration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NSWritingToolsAnimationParameters;
  result = [(NSWritingToolsAnimationParameters *)&v7 init];
  if (result)
  {
    result->_delay = a3;
    result->_duration = a4;
  }
  return result;
}

- (double)delay
{
  return self->_delay;
}

- (double)duration
{
  return self->_duration;
}

- (id)alongsideAnimation
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setAlongsideAnimation:(id)a3
{
}

- (id)alongsideCompletion
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setAlongsideCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_alongsideCompletion, 0);

  objc_storeStrong(&self->_alongsideAnimation, 0);
}

@end
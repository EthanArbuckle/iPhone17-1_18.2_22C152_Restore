@interface SiriSharedUIAnimationContext
- (CAMediaTimingFunction)timingFunction;
- (double)animationDuration;
- (unint64_t)animationOptions;
- (void)setAnimationDuration:(double)a3;
- (void)setAnimationOptions:(unint64_t)a3;
- (void)setTimingFunction:(id)a3;
@end

@implementation SiriSharedUIAnimationContext

- (unint64_t)animationOptions
{
  return self->_animationOptions;
}

- (void)setAnimationOptions:(unint64_t)a3
{
  self->_animationOptions = a3;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
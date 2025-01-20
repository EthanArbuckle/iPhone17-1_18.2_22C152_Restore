@interface SBIconAnimationContext
- (double)delay;
- (double)fraction;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)setDelay:(double)a3;
- (void)setFraction:(double)a3;
@end

@implementation SBIconAnimationContext

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (double)fraction
{
  return self->_fraction;
}

- (void)setFraction:(double)a3
{
  self->_fraction = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
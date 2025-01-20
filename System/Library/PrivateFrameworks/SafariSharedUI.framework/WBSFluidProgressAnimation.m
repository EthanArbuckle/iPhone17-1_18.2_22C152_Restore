@interface WBSFluidProgressAnimation
- (CAMediaTimingFunction)timingFunction;
- (double)animationDuration;
- (double)destinationPosition;
- (double)initialPosition;
- (void)setAnimationDuration:(double)a3;
- (void)setDestinationPosition:(double)a3;
- (void)setInitialPosition:(double)a3;
- (void)setTimingFunction:(id)a3;
@end

@implementation WBSFluidProgressAnimation

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
}

- (double)initialPosition
{
  return self->_initialPosition;
}

- (void)setInitialPosition:(double)a3
{
  self->_initialPosition = a3;
}

- (double)destinationPosition
{
  return self->_destinationPosition;
}

- (void)setDestinationPosition:(double)a3
{
  self->_destinationPosition = a3;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (void).cxx_destruct
{
}

@end
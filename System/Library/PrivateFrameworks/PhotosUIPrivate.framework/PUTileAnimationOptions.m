@interface PUTileAnimationOptions
- (BOOL)isSynchronizedWithTransition;
- (BOOL)shouldFadeOutSnapshotAfterCompletionGroup;
- (OS_dispatch_group)completionGroup;
- (PUDisplayVelocity)initialVelocity;
- (double)delay;
- (double)duration;
- (double)springDampingRatio;
- (double)springMass;
- (double)springStiffness;
- (id)customViewAnimatorBlock;
- (int64_t)kind;
- (int64_t)springNumberOfOscillations;
- (unsigned)highFrameRateReason;
- (void)setCompletionGroup:(id)a3;
- (void)setCustomViewAnimatorBlock:(id)a3;
- (void)setDelay:(double)a3;
- (void)setDuration:(double)a3;
- (void)setHighFrameRateReason:(unsigned int)a3;
- (void)setInitialVelocity:(PUDisplayVelocity)a3;
- (void)setKind:(int64_t)a3;
- (void)setShouldFadeOutSnapshotAfterCompletionGroup:(BOOL)a3;
- (void)setSpringDampingRatio:(double)a3;
- (void)setSpringMass:(double)a3;
- (void)setSpringNumberOfOscillations:(int64_t)a3;
- (void)setSpringStiffness:(double)a3;
- (void)setSynchronizedWithTransition:(BOOL)a3;
@end

@implementation PUTileAnimationOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionGroup, 0);
  objc_storeStrong(&self->_customViewAnimatorBlock, 0);
}

- (void)setSynchronizedWithTransition:(BOOL)a3
{
  self->_synchronizedWithTransition = a3;
}

- (BOOL)isSynchronizedWithTransition
{
  return self->_synchronizedWithTransition;
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  self->_highFrameRateReason = a3;
}

- (unsigned)highFrameRateReason
{
  return self->_highFrameRateReason;
}

- (void)setShouldFadeOutSnapshotAfterCompletionGroup:(BOOL)a3
{
  self->_shouldFadeOutSnapshotAfterCompletionGroup = a3;
}

- (BOOL)shouldFadeOutSnapshotAfterCompletionGroup
{
  return self->_shouldFadeOutSnapshotAfterCompletionGroup;
}

- (void)setCompletionGroup:(id)a3
{
}

- (OS_dispatch_group)completionGroup
{
  return self->_completionGroup;
}

- (void)setCustomViewAnimatorBlock:(id)a3
{
}

- (id)customViewAnimatorBlock
{
  return self->_customViewAnimatorBlock;
}

- (void)setInitialVelocity:(PUDisplayVelocity)a3
{
  self->_initialVelocity = a3;
}

- (PUDisplayVelocity)initialVelocity
{
  double x = self->_initialVelocity.x;
  double y = self->_initialVelocity.y;
  double scale = self->_initialVelocity.scale;
  double rotation = self->_initialVelocity.rotation;
  result.double rotation = rotation;
  result.double scale = scale;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSpringNumberOfOscillations:(int64_t)a3
{
  self->_springNumberOfOscillations = a3;
}

- (int64_t)springNumberOfOscillations
{
  return self->_springNumberOfOscillations;
}

- (void)setSpringStiffness:(double)a3
{
  self->_springStiffness = a3;
}

- (double)springStiffness
{
  return self->_springStiffness;
}

- (void)setSpringMass:(double)a3
{
  self->_springMass = a3;
}

- (double)springMass
{
  return self->_springMass;
}

- (void)setSpringDampingRatio:(double)a3
{
  self->_springDampingRatio = a3;
}

- (double)springDampingRatio
{
  return self->_springDampingRatio;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDelay:(double)a3
{
  self->_deladouble y = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (int64_t)kind
{
  return self->_kind;
}

@end
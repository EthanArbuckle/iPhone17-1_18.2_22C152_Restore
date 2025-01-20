@interface _UIDynamicItemObservingBehavior
- (BOOL)enabled;
- (CGVector)targetVelocity;
- (double)completionHandlerInvocationDelay;
- (id)completionHandler;
- (int64_t)frameCount;
- (void)cancel;
- (void)setCompletionHandler:(id)a3;
- (void)setCompletionHandlerInvocationDelay:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFrameCount:(int64_t)a3;
- (void)setTargetVelocity:(CGVector)a3;
- (void)willMoveToAnimator:(id)a3;
@end

@implementation _UIDynamicItemObservingBehavior

- (void)willMoveToAnimator:(id)a3
{
  id v4 = a3;
  [(_UIDynamicItemObservingBehavior *)self setEnabled:1];
  [(_UIDynamicItemObservingBehavior *)self setFrameCount:0];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54___UIDynamicItemObservingBehavior_willMoveToAnimator___block_invoke;
  v5[3] = &unk_1E52DC308;
  objc_copyWeak(&v6, &location);
  [(UIDynamicBehavior *)self setAction:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)cancel
{
}

- (CGVector)targetVelocity
{
  double dx = self->_targetVelocity.dx;
  double dy = self->_targetVelocity.dy;
  result.double dy = dy;
  result.double dx = dx;
  return result;
}

- (void)setTargetVelocity:(CGVector)a3
{
  self->_targetVelocity = a3;
}

- (double)completionHandlerInvocationDelay
{
  return self->_completionHandlerInvocationDelay;
}

- (void)setCompletionHandlerInvocationDelay:(double)a3
{
  self->_completionHandlerInvocationDelay = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (int64_t)frameCount
{
  return self->_frameCount;
}

- (void)setFrameCount:(int64_t)a3
{
  self->_frameCount = a3;
}

- (void).cxx_destruct
{
}

@end
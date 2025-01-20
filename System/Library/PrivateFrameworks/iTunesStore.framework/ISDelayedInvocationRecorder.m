@interface ISDelayedInvocationRecorder
- (double)delayInterval;
- (void)invokeInvocation:(id)a3;
- (void)setDelayInterval:(double)a3;
@end

@implementation ISDelayedInvocationRecorder

- (void)invokeInvocation:(id)a3
{
  [a3 retainArguments];
  double delayInterval = self->_delayInterval;

  [a3 performSelector:sel_invoke withObject:0 afterDelay:delayInterval];
}

- (double)delayInterval
{
  return self->_delayInterval;
}

- (void)setDelayInterval:(double)a3
{
  self->_double delayInterval = a3;
}

@end
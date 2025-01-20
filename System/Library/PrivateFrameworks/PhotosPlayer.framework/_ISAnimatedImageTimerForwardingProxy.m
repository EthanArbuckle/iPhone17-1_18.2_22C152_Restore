@interface _ISAnimatedImageTimerForwardingProxy
- (ISAnimatedImageTimer)_forwardingTarget;
- (void)_displayLinkFire:(id)a3;
- (void)_setForwardingTarget:(id)a3;
@end

@implementation _ISAnimatedImageTimerForwardingProxy

- (void).cxx_destruct
{
}

- (void)_setForwardingTarget:(id)a3
{
}

- (ISAnimatedImageTimer)_forwardingTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__forwardingTarget);

  return (ISAnimatedImageTimer *)WeakRetained;
}

- (void)_displayLinkFire:(id)a3
{
  p_forwardingTarget = &self->__forwardingTarget;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_forwardingTarget);
  [WeakRetained _animationTimerFired:v4];
}

@end
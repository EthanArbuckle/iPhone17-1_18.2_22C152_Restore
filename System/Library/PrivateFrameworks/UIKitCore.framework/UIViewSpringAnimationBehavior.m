@interface UIViewSpringAnimationBehavior
+ (UIViewSpringAnimationBehavior)behaviorWithDampingRatio:(double)a3 response:(double)a4;
- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4;
- (UIViewSpringAnimationBehavior)init;
- (double)dampingRatio;
- (double)inertialProjectionDeceleration;
- (double)inertialTargetSmoothing;
- (double)response;
- (void)setDampingRatio:(double)a3;
- (void)setDampingRatio:(double)a3 response:(double)a4;
- (void)setInertialProjectionDeceleration:(double)a3;
- (void)setInertialTargetSmoothing:(double)a3;
- (void)setResponse:(double)a3;
- (void)setTrackingDampingRatio:(double)a3 response:(double)a4 dampingRatioSmoothing:(double)a5 responseSmoothing:(double)a6;
@end

@implementation UIViewSpringAnimationBehavior

- (double)response
{
  return self->_response;
}

- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4
{
  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  if (a5 == 1)
  {
    if (!a4)
    {
      *(_WORD *)&retstr->var2 = 257;
      *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->var6;
    }
    *(_OWORD *)&retstr->var6 = *(_OWORD *)&self->var4;
    p_var1 = &self->var1;
  }
  else
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var6;
    retstr->var6 = 0.0;
    retstr->var7 = 0.0;
    if (a4 != 1) {
      return self;
    }
    p_var1 = &self->var8;
    retstr = ($6E732EA7D3E0C9EC9CEEF7385E7E4683 *)((char *)retstr + 56);
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)p_var1;
  return self;
}

+ (UIViewSpringAnimationBehavior)behaviorWithDampingRatio:(double)a3 response:(double)a4
{
  v6 = objc_opt_new();
  [v6 setDampingRatio:a3 response:a4];
  return (UIViewSpringAnimationBehavior *)v6;
}

- (void)setDampingRatio:(double)a3 response:(double)a4
{
  self->_dampingRatio = a3;
  self->_response = a4;
}

- (UIViewSpringAnimationBehavior)init
{
  v8.receiver = self;
  v8.super_class = (Class)UIViewSpringAnimationBehavior;
  result = [(UIViewSpringAnimationBehavior *)&v8 init];
  if (result)
  {
    *(_OWORD *)&result->_trackingDampingRatio = xmmword_186B9E0C0;
    *(_OWORD *)&result->_dampingRatio = xmmword_186B9E0D0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_dampingRatioSmoothing = _Q0;
    *(_OWORD *)&result->_inertialTargetSmoothing = xmmword_186B9E0E0;
  }
  return result;
}

- (void)setTrackingDampingRatio:(double)a3 response:(double)a4 dampingRatioSmoothing:(double)a5 responseSmoothing:(double)a6
{
  self->_trackingDampingRatio = a3;
  self->_trackingResponse = a4;
  self->_dampingRatioSmoothing = a5;
  self->_responseSmoothing = a6;
}

- (double)dampingRatio
{
  return self->_dampingRatio;
}

- (void)setDampingRatio:(double)a3
{
  self->_dampingRatio = a3;
}

- (void)setResponse:(double)a3
{
  self->_response = a3;
}

- (double)inertialTargetSmoothing
{
  return self->_inertialTargetSmoothing;
}

- (void)setInertialTargetSmoothing:(double)a3
{
  self->_inertialTargetSmoothing = a3;
}

- (double)inertialProjectionDeceleration
{
  return self->_inertialProjectionDeceleration;
}

- (void)setInertialProjectionDeceleration:(double)a3
{
  self->_inertialProjectionDeceleration = a3;
}

@end
@interface UIResponseFactorViewSpringAnimationBehavior
- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4;
- (UIResponseFactorViewSpringAnimationBehavior)initWithWrapedBehavior:(id)a3 responseFactor:(double)a4;
- (UIViewSpringAnimationBehaviorDescribing)wrappedBehavior;
- (double)responseFactor;
- (void)setResponseFactor:(double)a3;
- (void)setWrappedBehavior:(id)a3;
@end

@implementation UIResponseFactorViewSpringAnimationBehavior

- (UIResponseFactorViewSpringAnimationBehavior)initWithWrapedBehavior:(id)a3 responseFactor:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIResponseFactorViewSpringAnimationBehavior;
  v8 = [(UIResponseFactorViewSpringAnimationBehavior *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_wrappedBehavior, a3);
    v9->_responseFactor = a4;
  }

  return v9;
}

- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v9 = [(UIResponseFactorViewSpringAnimationBehavior *)self wrappedBehavior];
  v10 = v9;
  if (v9)
  {
    [v9 parametersForTransitionFromState:v6 toState:v5];
  }
  else
  {
    *(_OWORD *)&retstr->var7 = 0u;
    *(_OWORD *)&retstr->var9 = 0u;
    *(_OWORD *)&retstr->var2 = 0u;
    *(_OWORD *)&retstr->var5 = 0u;
    *(_OWORD *)&retstr->var0 = 0u;
  }

  result = ($6E732EA7D3E0C9EC9CEEF7385E7E4683 *)[(UIResponseFactorViewSpringAnimationBehavior *)self responseFactor];
  retstr->var1 = v12 * retstr->var1;
  return result;
}

- (UIViewSpringAnimationBehaviorDescribing)wrappedBehavior
{
  return self->_wrappedBehavior;
}

- (void)setWrappedBehavior:(id)a3
{
}

- (double)responseFactor
{
  return self->_responseFactor;
}

- (void)setResponseFactor:(double)a3
{
  self->_responseFactor = a3;
}

- (void).cxx_destruct
{
}

@end
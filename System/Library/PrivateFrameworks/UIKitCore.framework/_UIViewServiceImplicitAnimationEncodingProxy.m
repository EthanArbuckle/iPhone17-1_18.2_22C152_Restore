@interface _UIViewServiceImplicitAnimationEncodingProxy
+ (id)proxyEncodingAnimationsForTarget:(id)a3 controlMessageTarget:(id)a4;
- (void)forwardInvocation:(id)a3;
@end

@implementation _UIViewServiceImplicitAnimationEncodingProxy

+ (id)proxyEncodingAnimationsForTarget:(id)a3 controlMessageTarget:(id)a4
{
  id v6 = a4;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS____UIViewServiceImplicitAnimationEncodingProxy;
  v7 = objc_msgSendSuper2(&v10, sel_proxyWithTarget_, a3);
  v8 = (void *)v7[2];
  v7[2] = v6;

  return v7;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if (pthread_main_np() == 1)
  {
    v5 = +[UIView _currentAnimationAttributes];
    if (v5)
    {
      id controlMessageTarget = self->_controlMessageTarget;
      if (controlMessageTarget)
      {
        v7 = NSStringFromSelector((SEL)[v4 selector]);
        objc_msgSend(controlMessageTarget, "__animateNextInvocationOfSelector:withAnimationAttributes:animationsEnabled:", v7, v5, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
      }
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)_UIViewServiceImplicitAnimationEncodingProxy;
  [(_UITargetedProxy *)&v8 forwardInvocation:v4];
}

- (void).cxx_destruct
{
}

@end
@interface _UIViewServiceImplicitAnimationDecodingProxy
+ (id)proxyDecodingAnimationsForTarget:(id)a3;
- (void)__animateNextInvocationOfSelector:(id)a3 withAnimationAttributes:(id)a4 animationsEnabled:(BOOL)a5;
- (void)forwardInvocation:(id)a3;
@end

@implementation _UIViewServiceImplicitAnimationDecodingProxy

+ (id)proxyDecodingAnimationsForTarget:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS____UIViewServiceImplicitAnimationDecodingProxy;
  v3 = objc_msgSendSuper2(&v5, sel_proxyWithTarget_, a3);
  return v3;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if ((SEL)[v4 selector] == self->_implicitAnimationSelector && (objc_super v5 = self->_animationAttributes) != 0)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66___UIViewServiceImplicitAnimationDecodingProxy_forwardInvocation___block_invoke;
    v8[3] = &unk_1E52D9F98;
    id v9 = v4;
    v10 = self;
    +[UIView _animateWithAttributes:v5 animations:v8 completion:0];
    self->_implicitAnimationSelector = 0;
    animationAttributes = self->_animationAttributes;
    self->_animationAttributes = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIViewServiceImplicitAnimationDecodingProxy;
    [(_UITargetedProxy *)&v7 forwardInvocation:v4];
  }
}

- (void)__animateNextInvocationOfSelector:(id)a3 withAnimationAttributes:(id)a4 animationsEnabled:(BOOL)a5
{
  objc_storeStrong((id *)&self->_animationAttributes, a4);
  v8 = (NSString *)a3;
  self->_animationsEnabled = a5;
  p_implicitAnimationSelector = &self->_implicitAnimationSelector;
  SEL v10 = NSSelectorFromString(v8);

  if (v10) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  SEL *p_implicitAnimationSelector = v11;
}

- (void).cxx_destruct
{
}

@end
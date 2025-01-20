@interface SFTransitionCoordinatorBasicAnimation
- (void)initWithAnimations:(void *)a1;
- (void)invokeInContext:(id)a3;
@end

@implementation SFTransitionCoordinatorBasicAnimation

- (void)initWithAnimations:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)SFTransitionCoordinatorBasicAnimation;
  id v2 = a2;
  v3 = objc_msgSendSuper2(&v7, sel_init);
  v4 = _Block_copy(v2);

  v5 = (void *)v3[1];
  v3[1] = v4;

  return v3;
}

- (void)invokeInContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
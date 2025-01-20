@interface _UISimpleTransitioningDelegate
- (BOOL)_navigationControllerShouldCrossFadeNavigationBar:(id)a3;
- (BOOL)_suppressCrossFadeNavigationBarAnimation;
- (_UISimpleTransitioningDelegate)initWithAnimator:(id)a3;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (void)_setSuppressCrossFadeNavigationBarAnimation:(BOOL)a3;
@end

@implementation _UISimpleTransitioningDelegate

- (_UISimpleTransitioningDelegate)initWithAnimator:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UISimpleTransitioningDelegate;
  v6 = [(_UISimpleTransitioningDelegate *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_animator, a3);
    v8 = v7;
  }

  return v7;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  if (a4 == 1)
  {
    v7 = self->_animator;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)_navigationControllerShouldCrossFadeNavigationBar:(id)a3
{
  return !self->__suppressCrossFadeNavigationBarAnimation;
}

- (BOOL)_suppressCrossFadeNavigationBarAnimation
{
  return self->__suppressCrossFadeNavigationBarAnimation;
}

- (void)_setSuppressCrossFadeNavigationBarAnimation:(BOOL)a3
{
  self->__suppressCrossFadeNavigationBarAnimation = a3;
}

- (void).cxx_destruct
{
}

@end
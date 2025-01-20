@interface _UIViewControllerImmediateAnimationTransitionCoordinator
- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4;
- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5;
- (BOOL)initiallyInteractive;
- (BOOL)isAnimated;
- (BOOL)isCancelled;
- (BOOL)isInteractive;
- (BOOL)isInterruptible;
- (CGAffineTransform)targetTransform;
- (UIView)containerView;
- (_UIViewControllerImmediateAnimationTransitionCoordinator)initWithContainerView:(id)a3;
- (double)completionVelocity;
- (double)percentComplete;
- (double)transitionDuration;
- (id)viewControllerForKey:(id)a3;
- (id)viewForKey:(id)a3;
- (int64_t)completionCurve;
- (int64_t)presentationStyle;
- (void)setContainerView:(id)a3;
@end

@implementation _UIViewControllerImmediateAnimationTransitionCoordinator

- (void).cxx_destruct
{
}

- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, _UIViewControllerImmediateAnimationTransitionCoordinator *))a4;
  v10 = (void (**)(id, _UIViewControllerImmediateAnimationTransitionCoordinator *))a5;
  if (v9) {
    v9[2](v9, self);
  }
  if (v10) {
    v10[2](v10, self);
  }

  return 1;
}

- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  return [(_UIViewControllerImmediateAnimationTransitionCoordinator *)self animateAlongsideTransitionInView:0 animation:a3 completion:a4];
}

- (_UIViewControllerImmediateAnimationTransitionCoordinator)initWithContainerView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIViewControllerImmediateAnimationTransitionCoordinator;
  v5 = [(_UIViewControllerImmediateAnimationTransitionCoordinator *)&v9 init];
  if (v5)
  {
    if (v4) {
      v6 = (UIView *)v4;
    }
    else {
      v6 = objc_alloc_init(UIView);
    }
    containerView = v5->_containerView;
    v5->_containerView = v6;
  }
  return v5;
}

- (BOOL)isInteractive
{
  return 0;
}

- (BOOL)isCancelled
{
  return 0;
}

- (BOOL)isAnimated
{
  return 0;
}

- (int64_t)presentationStyle
{
  return -1;
}

- (BOOL)initiallyInteractive
{
  return 0;
}

- (BOOL)isInterruptible
{
  return 0;
}

- (double)transitionDuration
{
  return 0.0;
}

- (double)percentComplete
{
  return 1.0;
}

- (double)completionVelocity
{
  return 0.0;
}

- (int64_t)completionCurve
{
  return 0;
}

- (id)viewControllerForKey:(id)a3
{
  return 0;
}

- (id)viewForKey:(id)a3
{
  return 0;
}

- (CGAffineTransform)targetTransform
{
  uint64_t v3 = MEMORY[0x1E4F1DAB8];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

@end
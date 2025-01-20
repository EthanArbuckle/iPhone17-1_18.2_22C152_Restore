@interface _UIAnimationCoordinator
- (CGRect)endFrame;
- (CGRect)startFrame;
- (NSMutableDictionary)stash;
- (UIView)containerView;
- (UIViewController)viewController;
- (_UIViewControllerOneToOneTransitionContext)transitionContext;
- (double)duration;
- (double)transitionDuration:(id)a3;
- (id)animator;
- (id)completion;
- (id)preperation;
- (void)_updateTransitionContext;
- (void)animate;
- (void)animateInteractively;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)cancelInteractiveAnimation;
- (void)dealloc;
- (void)finishInteractiveAnimation;
- (void)setAnimator:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEndFrame:(CGRect)a3;
- (void)setPreperation:(id)a3;
- (void)setStartFrame:(CGRect)a3;
- (void)setViewController:(id)a3;
- (void)updateInteractiveProgress:(double)a3;
@end

@implementation _UIAnimationCoordinator

- (_UIViewControllerOneToOneTransitionContext)transitionContext
{
  transitionContext = self->_transitionContext;
  if (!transitionContext)
  {
    v4 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
    v5 = self->_transitionContext;
    self->_transitionContext = v4;

    transitionContext = self->_transitionContext;
  }
  return transitionContext;
}

- (void)dealloc
{
  transitionContext = self->_transitionContext;
  if (transitionContext)
  {
    [(_UIViewControllerTransitionContext *)transitionContext _setInteractor:0];
    [(_UIViewControllerTransitionContext *)self->_transitionContext _setAnimator:0];
    v4 = self->_transitionContext;
    self->_transitionContext = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_UIAnimationCoordinator;
  [(_UIAnimationCoordinator *)&v5 dealloc];
}

- (void)setDuration:(double)a3
{
  if (self->_duration != a3)
  {
    self->_duration = a3;
    -[_UIViewControllerTransitionContext _setDuration:](self->_transitionContext, "_setDuration:");
  }
}

- (NSMutableDictionary)stash
{
  stash = self->_stash;
  if (!stash)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_super v5 = self->_stash;
    self->_stash = v4;

    stash = self->_stash;
  }
  return stash;
}

- (void)setContainerView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  if (self->_containerView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_containerView, a3);
    [(_UIViewControllerTransitionContext *)self->_transitionContext _setContainerView:self->_containerView];
    objc_super v5 = v6;
  }
}

- (void)setViewController:(id)a3
{
  objc_super v5 = (UIViewController *)a3;
  if (self->_viewController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_viewController, a3);
    [(_UIViewControllerOneToOneTransitionContext *)self->_transitionContext _setFromViewController:self->_viewController];
    objc_super v5 = v6;
  }
}

- (void)setStartFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_startFrame))
  {
    self->_startFrame.origin.double x = x;
    self->_startFrame.origin.double y = y;
    self->_startFrame.size.double width = width;
    self->_startFrame.size.double height = height;
    -[_UIViewControllerOneToOneTransitionContext _setToStartFrame:](self->_transitionContext, "_setToStartFrame:", x, y, width, height);
    transitionContext = self->_transitionContext;
    double v9 = self->_startFrame.origin.x;
    double v10 = self->_startFrame.origin.y;
    double v11 = self->_startFrame.size.width;
    double v12 = self->_startFrame.size.height;
    -[_UIViewControllerOneToOneTransitionContext _setFromStartFrame:](transitionContext, "_setFromStartFrame:", v9, v10, v11, v12);
  }
}

- (void)setEndFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_endFrame))
  {
    self->_endFrame.origin.double x = x;
    self->_endFrame.origin.double y = y;
    self->_endFrame.size.double width = width;
    self->_endFrame.size.double height = height;
    -[_UIViewControllerOneToOneTransitionContext _setToEndFrame:](self->_transitionContext, "_setToEndFrame:", x, y, width, height);
    transitionContext = self->_transitionContext;
    double v9 = self->_endFrame.origin.x;
    double v10 = self->_endFrame.origin.y;
    double v11 = self->_endFrame.size.width;
    double v12 = self->_endFrame.size.height;
    -[_UIViewControllerOneToOneTransitionContext _setFromEndFrame:](transitionContext, "_setFromEndFrame:", v9, v10, v11, v12);
  }
}

- (void)_updateTransitionContext
{
  v3 = [(_UIAnimationCoordinator *)self transitionContext];
  BOOL v4 = self->_duration > 0.0 && self->_animator != 0;
  id v5 = v3;
  [v3 _setIsAnimated:v4];
  [v5 _setFromViewController:self->_viewController];
  [v5 _setToViewController:0];
  [v5 _setContainerView:self->_containerView];
  objc_msgSend(v5, "_setToStartFrame:", self->_startFrame.origin.x, self->_startFrame.origin.y, self->_startFrame.size.width, self->_startFrame.size.height);
  objc_msgSend(v5, "_setFromStartFrame:", self->_startFrame.origin.x, self->_startFrame.origin.y, self->_startFrame.size.width, self->_startFrame.size.height);
  objc_msgSend(v5, "_setToEndFrame:", self->_endFrame.origin.x, self->_endFrame.origin.y, self->_endFrame.size.width, self->_endFrame.size.height);
  objc_msgSend(v5, "_setFromEndFrame:", self->_endFrame.origin.x, self->_endFrame.origin.y, self->_endFrame.size.width, self->_endFrame.size.height);
  [v5 _setAnimator:self];
}

- (void)animate
{
  [(_UIAnimationCoordinator *)self _updateTransitionContext];
  if (self->_preperation)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __34___UIAnimationCoordinator_animate__block_invoke;
    v3[3] = &unk_1E52D9F70;
    v3[4] = self;
    +[UIView performWithoutAnimation:v3];
  }
  [(_UIAnimationCoordinator *)self animateTransition:self->_transitionContext];
}

- (void)animateInteractively
{
  [(_UIAnimationCoordinator *)self _updateTransitionContext];
  v3 = objc_alloc_init(UIPercentDrivenInteractiveTransition);
  interactiveTransition = self->_interactiveTransition;
  self->_interactiveTransition = v3;

  [(UIPercentDrivenInteractiveTransition *)self->_interactiveTransition startInteractiveTransition:self->_transitionContext];
  [(_UIViewControllerTransitionContext *)self->_transitionContext _setInteractor:self->_interactiveTransition];
  [(_UIViewControllerTransitionContext *)self->_transitionContext _setTransitionIsInFlight:1];
  [(_UIViewControllerTransitionContext *)self->_transitionContext _setInteractiveUpdateHandler:&__block_literal_global_146];
  if (self->_preperation)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __47___UIAnimationCoordinator_animateInteractively__block_invoke_2;
    v5[3] = &unk_1E52D9F70;
    v5[4] = self;
    +[UIView performWithoutAnimation:v5];
  }
}

- (void)updateInteractiveProgress:(double)a3
{
  interactiveTransition = self->_interactiveTransition;
  if (!interactiveTransition)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"_UIAnimationCoordinator.m" lineNumber:151 description:@"Trying to update an interactive transition that was not started interactively"];

    interactiveTransition = self->_interactiveTransition;
  }
  double v5 = 0.0;
  if (a3 >= 0.0)
  {
    double v5 = a3;
    if (a3 >= 1.0) {
      double v5 = nextafter(1.0, -1.0);
    }
  }
  [(UIPercentDrivenInteractiveTransition *)interactiveTransition updateInteractiveTransition:v5];
}

- (void)cancelInteractiveAnimation
{
  interactiveTransition = self->_interactiveTransition;
  if (!interactiveTransition)
  {
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"_UIAnimationCoordinator.m" lineNumber:157 description:@"Trying to cancel an interactive transition that was not started interactively"];

    interactiveTransition = self->_interactiveTransition;
  }
  [(UIPercentDrivenInteractiveTransition *)interactiveTransition cancelInteractiveTransition];
}

- (void)finishInteractiveAnimation
{
  interactiveTransition = self->_interactiveTransition;
  if (!interactiveTransition)
  {
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"_UIAnimationCoordinator.m" lineNumber:163 description:@"Trying to finish an interactive transition that was not started interactively"];

    interactiveTransition = self->_interactiveTransition;
  }
  [(UIPercentDrivenInteractiveTransition *)interactiveTransition finishInteractiveTransition];
}

- (double)transitionDuration:(id)a3
{
  return self->_duration;
}

- (void)animateTransition:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45___UIAnimationCoordinator_animateTransition___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  BOOL v4 = (void (**)(void))_Block_copy(aBlock);
  if ([(_UIViewControllerTransitionContext *)self->_transitionContext isAnimated])
  {
    if (self->_interactiveTransition)
    {
      double v5 = [(UIView *)self->_containerView window];
    }
    else
    {
      double v5 = 0;
    }
    [v5 beginDisablingInterfaceAutorotation];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __45___UIAnimationCoordinator_animateTransition___block_invoke_2;
    v17[3] = &unk_1E52D9F70;
    v17[4] = self;
    v7 = _Block_copy(v17);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __45___UIAnimationCoordinator_animateTransition___block_invoke_3;
    v14 = &unk_1E52E45A0;
    id v8 = v5;
    id v15 = v8;
    v16 = v4;
    double v9 = _Block_copy(&v11);
    double duration = self->_duration;
    if (self->_interactiveTransition) {
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 196608, v7, v9, duration, 0.0, v11, v12, v13, v14, v15);
    }
    else {
      +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v7, v9, duration, 0.0, 1.0, 0.0, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    animator = (void (**)(id, _UIAnimationCoordinator *))self->_animator;
    if (animator) {
      animator[2](animator, self);
    }
    [(_UIViewControllerTransitionContext *)self->_transitionContext __runAlongsideAnimations];
    v4[2](v4);
  }
}

- (void)animationEnded:(BOOL)a3
{
  completion = (void (**)(id, _UIAnimationCoordinator *))self->_completion;
  if (completion) {
    completion[2](completion, self);
  }
}

- (double)duration
{
  return self->_duration;
}

- (id)preperation
{
  return self->_preperation;
}

- (void)setPreperation:(id)a3
{
}

- (id)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (CGRect)startFrame
{
  double x = self->_startFrame.origin.x;
  double y = self->_startFrame.origin.y;
  double width = self->_startFrame.size.width;
  double height = self->_startFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)endFrame
{
  double x = self->_endFrame.origin.x;
  double y = self->_endFrame.origin.y;
  double width = self->_endFrame.size.width;
  double height = self->_endFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_animator, 0);
  objc_storeStrong(&self->_preperation, 0);
  objc_storeStrong((id *)&self->_interactiveTransition, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_stash, 0);
}

@end
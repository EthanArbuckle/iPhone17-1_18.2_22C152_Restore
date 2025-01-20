@interface SBUIAnimationControllerAnimator
- (SBUIAnimationController)animationController;
- (SBUIAnimationControllerAnimator)init;
- (SBUIAnimationControllerAnimator)initWithAnimationController:(id)a3;
- (double)transitionDuration:(id)a3;
- (id)transitionAnimationFactory:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation SBUIAnimationControllerAnimator

- (void).cxx_destruct
{
}

- (SBUIAnimationControllerAnimator)initWithAnimationController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBUIAnimationControllerAnimator;
  v5 = [(SBUIAnimationControllerAnimator *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_animationController, v4);
  }

  return v6;
}

- (void)animateTransition:(id)a3
{
  id v3 = [(SBUIAnimationControllerAnimator *)self animationController];
  [v3 _startAnimation];
}

- (id)transitionAnimationFactory:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F4F898];
  id v4 = [(SBUIAnimationControllerAnimator *)self animationController];
  v5 = [v4 animationSettings];
  v6 = [v3 factoryWithSettings:v5];

  return v6;
}

- (SBUIAnimationController)animationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationController);
  return (SBUIAnimationController *)WeakRetained;
}

- (SBUIAnimationControllerAnimator)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBUIAnimationControllerAnimator.m" lineNumber:18 description:@"use the designated initializer"];

  return [(SBUIAnimationControllerAnimator *)self initWithAnimationController:0];
}

- (double)transitionDuration:(id)a3
{
  id v3 = [(SBUIAnimationControllerAnimator *)self animationController];
  id v4 = [v3 animationSettings];
  [v4 duration];
  double v6 = v5;

  return v6;
}

@end
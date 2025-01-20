@interface SBFluidSwitcherAnimationController
- (BOOL)isFluidSwitcherAnimationController;
- (SBFluidSwitcherAnimationController)initWithWorkspaceTransitionRequest:(id)a3 animationSettings:(id)a4 animationBlock:(id)a5;
- (id)animationCompletion;
- (void)animationControllerDidFinishAnimation:(id)a3;
- (void)setAnimationCompletion:(id)a3;
@end

@implementation SBFluidSwitcherAnimationController

- (void).cxx_destruct
{
}

- (SBFluidSwitcherAnimationController)initWithWorkspaceTransitionRequest:(id)a3 animationSettings:(id)a4 animationBlock:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)SBFluidSwitcherAnimationController;
  v5 = [(SBUIBlockAnimationController *)&v8 initWithWorkspaceTransitionRequest:a3 animationSettings:a4 animationBlock:a5];
  v6 = v5;
  if (v5) {
    [(SBUIAnimationController *)v5 addObserver:v5];
  }
  return v6;
}

- (void)animationControllerDidFinishAnimation:(id)a3
{
  v4 = (SBFluidSwitcherAnimationController *)a3;
  if (v4 == self)
  {
    animationCompletion = (void (**)(id, void))v4->_animationCompletion;
    if (animationCompletion)
    {
      v7 = v4;
      animationCompletion[2](animationCompletion, [(SBFluidSwitcherAnimationController *)v4 isInterrupted] ^ 1);
      id v6 = v7->_animationCompletion;
      v7->_animationCompletion = 0;

      v4 = v7;
    }
  }
}

- (BOOL)isFluidSwitcherAnimationController
{
  return 1;
}

- (id)animationCompletion
{
  return self->_animationCompletion;
}

- (void)setAnimationCompletion:(id)a3
{
}

@end
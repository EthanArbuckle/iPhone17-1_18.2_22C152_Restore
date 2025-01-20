@interface SBRotateHomeScreenWorkspaceTransaction
- (void)begin;
@end

@implementation SBRotateHomeScreenWorkspaceTransaction

- (void)begin
{
  v3 = [SBDismissOverlaysAnimationController alloc];
  v4 = [(SBWorkspaceTransaction *)self transitionRequest];
  v5 = [(SBDismissOverlaysAnimationController *)v3 initWithTransitionContextProvider:v4 options:-109];
  animationController = self->_animationController;
  self->_animationController = v5;

  [(SBUIAnimationController *)self->_animationController addObserver:self];
  [(SBRotateHomeScreenWorkspaceTransaction *)self addChildTransaction:self->_animationController];
  v7.receiver = self;
  v7.super_class = (Class)SBRotateHomeScreenWorkspaceTransaction;
  [(SBRotateHomeScreenWorkspaceTransaction *)&v7 begin];
}

- (void).cxx_destruct
{
}

@end
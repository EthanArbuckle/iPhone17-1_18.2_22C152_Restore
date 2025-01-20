@interface SBWaitForSceneLayoutTransitionTransaction
- (SBWaitForSceneLayoutTransitionTransaction)initWithSceneLayoutTransitionCoordinator:(id)a3;
- (void)_begin;
- (void)dealloc;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
@end

@implementation SBWaitForSceneLayoutTransitionTransaction

- (SBWaitForSceneLayoutTransitionTransaction)initWithSceneLayoutTransitionCoordinator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBWaitForSceneLayoutTransitionTransaction;
  v6 = [(SBTransaction *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transitionCoordinator, a3);
    [(SBLayoutStateTransitionCoordinator *)v7->_transitionCoordinator addObserver:v7];
  }

  return v7;
}

- (void)dealloc
{
  [(SBLayoutStateTransitionCoordinator *)self->_transitionCoordinator removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBWaitForSceneLayoutTransitionTransaction;
  [(SBWaitForSceneLayoutTransitionTransaction *)&v3 dealloc];
}

- (void)_begin
{
  v3.receiver = self;
  v3.super_class = (Class)SBWaitForSceneLayoutTransitionTransaction;
  [(SBWaitForSceneLayoutTransitionTransaction *)&v3 _begin];
  if (![(SBLayoutStateTransitionCoordinator *)self->_transitionCoordinator isTransitioning]) {
    [(SBWaitForSceneLayoutTransitionTransaction *)self addMilestone:@"SBWaitForSceneLayoutTransitionToBeginMilestone"];
  }
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
}

- (void).cxx_destruct
{
}

@end
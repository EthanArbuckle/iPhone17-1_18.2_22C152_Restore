@interface SBContinuousExposeStripRevealGestureWorkspaceTransaction
- (BOOL)_canBeInterrupted;
- (int64_t)_gestureType;
- (void)handleTransitionRequestForGestureComplete:(id)a3 fromGestureManager:(id)a4;
@end

@implementation SBContinuousExposeStripRevealGestureWorkspaceTransaction

- (int64_t)_gestureType
{
  return 10;
}

- (void)handleTransitionRequestForGestureComplete:(id)a3 fromGestureManager:(id)a4
{
  self->_completedGestureWithTransitionRequest = 1;
  v4.receiver = self;
  v4.super_class = (Class)SBContinuousExposeStripRevealGestureWorkspaceTransaction;
  [(SBFluidSwitcherGestureWorkspaceTransaction *)&v4 handleTransitionRequestForGestureComplete:a3 fromGestureManager:a4];
}

- (BOOL)_canBeInterrupted
{
  if (!self->_completedGestureWithTransitionRequest) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)SBContinuousExposeStripRevealGestureWorkspaceTransaction;
  return [(SBFluidSwitcherGestureWorkspaceTransaction *)&v3 _canBeInterrupted];
}

@end
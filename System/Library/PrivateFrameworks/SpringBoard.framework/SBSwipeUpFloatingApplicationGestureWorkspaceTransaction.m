@interface SBSwipeUpFloatingApplicationGestureWorkspaceTransaction
- (id)selectedAppLayoutForGestureRecognizer:(id)a3;
- (int64_t)_gestureType;
@end

@implementation SBSwipeUpFloatingApplicationGestureWorkspaceTransaction

- (int64_t)_gestureType
{
  return 3;
}

- (id)selectedAppLayoutForGestureRecognizer:(id)a3
{
  v3 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherViewController];
  v4 = [v3 appLayouts];
  v5 = [v4 firstObject];

  return v5;
}

@end
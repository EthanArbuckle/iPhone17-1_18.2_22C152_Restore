@interface SBSceneResizeFluidGestureWorkspaceTransaction
- (id)layoutState;
- (id)selectedAppLayout;
- (int64_t)_gestureType;
- (void)_willAddChildTransaction:(id)a3;
@end

@implementation SBSceneResizeFluidGestureWorkspaceTransaction

- (int64_t)_gestureType
{
  return 7;
}

- (id)layoutState
{
  v2 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherViewController];
  v3 = [v2 layoutContext];
  v4 = [v3 layoutState];

  return v4;
}

- (id)selectedAppLayout
{
  v2 = [(SBSceneResizeFluidGestureWorkspaceTransaction *)self layoutState];
  v3 = [v2 appLayout];

  return v3;
}

- (void)_willAddChildTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    [v8 addObserver:self];
    [v8 setOptions:2];
  }
  v9.receiver = self;
  v9.super_class = (Class)SBSceneResizeFluidGestureWorkspaceTransaction;
  [(SBSceneResizeFluidGestureWorkspaceTransaction *)&v9 _willAddChildTransaction:v6];
}

@end
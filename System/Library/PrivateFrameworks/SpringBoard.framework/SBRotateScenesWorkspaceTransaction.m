@interface SBRotateScenesWorkspaceTransaction
- (BOOL)_shouldResignActiveForAnimation;
- (unint64_t)_concurrentOverlayDismissalOptions;
- (unint64_t)_serialOverlayPreDismissalOptions;
@end

@implementation SBRotateScenesWorkspaceTransaction

- (BOOL)_shouldResignActiveForAnimation
{
  return 0;
}

- (unint64_t)_serialOverlayPreDismissalOptions
{
  return -110;
}

- (unint64_t)_concurrentOverlayDismissalOptions
{
  v3 = [(SBWorkspaceTransaction *)self transitionRequest];
  v4 = [v3 applicationContext];

  v5 = [v4 previousLayoutState];
  uint64_t v6 = [v5 interfaceOrientation];

  v7 = [v4 layoutState];
  uint64_t v8 = [v7 interfaceOrientation];

  if ((unint64_t)(v6 - 3) > 1 || (unint64_t)(v8 - 1) > 1)
  {
    v11.receiver = self;
    v11.super_class = (Class)SBRotateScenesWorkspaceTransaction;
    unint64_t v9 = [(SBAppToAppWorkspaceTransaction *)&v11 _concurrentOverlayDismissalOptions] & 0xFFFFFFFFFFFFFFBELL;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBRotateScenesWorkspaceTransaction;
    unint64_t v9 = [(SBAppToAppWorkspaceTransaction *)&v12 _concurrentOverlayDismissalOptions] | 1;
  }

  return v9;
}

@end
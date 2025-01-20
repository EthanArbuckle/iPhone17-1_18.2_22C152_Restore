@interface SBDeckSwitcherPanGestureWorkspaceTransaction
- (id)selectedAppLayoutForGestureRecognizer:(id)a3;
- (int64_t)_gestureType;
- (void)_begin;
- (void)_beginWithGesture:(id)a3;
- (void)_didComplete;
- (void)_finishWithGesture:(id)a3;
- (void)_removeHysteresisFromTranslation;
@end

@implementation SBDeckSwitcherPanGestureWorkspaceTransaction

- (int64_t)_gestureType
{
  return 1;
}

- (id)selectedAppLayoutForGestureRecognizer:(id)a3
{
  id v4 = a3;
  v5 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherViewController];
  v6 = [v5 contentView];
  v7 = [v5 view];
  v8 = [v5 layoutContext];
  v9 = [v8 layoutState];
  uint64_t v10 = [v9 unlockedEnvironmentMode];

  v11 = [(SBWorkspaceTransaction *)self transitionRequest];
  v12 = [v11 transientOverlayContext];

  v13 = [v5 layoutContext];
  v14 = [v13 activeTransitionContext];

  v15 = [v14 request];
  v16 = [v15 transientOverlayContext];

  if (v12
    && [v12 transitionType] == 1
    && ![(SBFluidSwitcherGestureWorkspaceTransaction *)self hasCompletedAtLeastOneGesture])
  {
    v20 = [v12 transientOverlay];
    v17 = [v5 _appLayoutForWorkspaceTransientOverlay:v20];
    goto LABEL_16;
  }
  if (v10 == 2)
  {
    [v7 bounds];
    UIRectGetCenter();
    v24 = v5;
    goto LABEL_14;
  }
  if (v10 != 1)
  {
LABEL_10:
    v18 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherController];
    uint64_t v19 = [v18 windowManagementStyle];

    if (v19 == 2)
    {
      v20 = [v5 layoutContext];
      v21 = [v20 layoutState];
      v17 = [v21 appLayout];

LABEL_16:
      goto LABEL_17;
    }
    [v4 locationInView:v6];
    [v6 size];
    double v26 = v25 * 0.5;
    [v6 size];
    double v22 = v27 * 0.5;
    v24 = v5;
    double v23 = v26;
LABEL_14:
    v17 = objc_msgSend(v24, "_adjustedAppLayoutForItemContainerAtLocation:environment:", 1, v22, v23);
    goto LABEL_17;
  }
  v17 = 0;
  if (v14 && v16)
  {
    if ([v16 transitionType])
    {
      v17 = 0;
      goto LABEL_17;
    }
    goto LABEL_10;
  }
LABEL_17:

  return v17;
}

- (void)_begin
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "Began bottom edge pan gesture transaction.", v1, 2u);
}

- (void)_didComplete
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "Completed bottom edge pan gesture transaction.", v1, 2u);
}

- (void)_beginWithGesture:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  [(SBDeckSwitcherPanGestureWorkspaceTransaction *)self _removeHysteresisFromTranslation];
  v5 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherViewController];
  uint64_t v6 = objc_opt_class();
  v7 = SBSafeCast(v6, v4);
  [v7 touchedEdges];
  if (v7)
  {
    [v7 _touchInterfaceOrientation];
    uint64_t v8 = _screenRegionGivenInterfaceOrientedRegion();
    v9 = [v5 dataSource];
    uint64_t v10 = [v9 switcherInterfaceOrientationForSwitcherContentController:v5];

    if ((_interfaceOrientedRegionGivenScreenRegion() & 4) == 0)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v17 = (void (*)(void *))__66__SBDeckSwitcherPanGestureWorkspaceTransaction__beginWithGesture___block_invoke;
      v18 = &unk_1E6B08B68;
      uint64_t v20 = v8;
      uint64_t v21 = v10;
      uint64_t v19 = self;
      v11 = v16;
      unint64_t v12 = 0;
      char v22 = 0;
      int v13 = 4;
      do
      {
        if (((1 << v12) & 0x1E) != 0)
        {
          v17(v11);
          if (v22) {
            break;
          }
          --v13;
        }
        if (v12 > 0x3E) {
          break;
        }
        ++v12;
      }
      while (v13 > 0);
    }
  }
  v14 = [(SBDeckSwitcherPanGestureWorkspaceTransaction *)self selectedAppLayoutForGestureRecognizer:v4];
  [(SBFluidSwitcherGestureWorkspaceTransaction *)self setSelectedAppLayout:v14];
  v15.receiver = self;
  v15.super_class = (Class)SBDeckSwitcherPanGestureWorkspaceTransaction;
  [(SBFluidSwitcherGestureWorkspaceTransaction *)&v15 _beginWithGesture:v4];
  kdebug_trace();
}

void __66__SBDeckSwitcherPanGestureWorkspaceTransaction__beginWithGesture___block_invoke(uint64_t a1, uint64_t a2, int a3, unsigned char *a4)
{
  uint64_t v6 = a3;
  if ((_interfaceOrientedRegionGivenScreenRegion() & 4) != 0)
  {
    if (*(void *)(a1 + 48) != v6)
    {
      v7 = [*(id *)(a1 + 32) windowScene];
      uint64_t v8 = [v7 switcherController];

      [v8 _attemptContentViewInterfaceOrientationUpdateForPanGesture:v6];
      [(id)SBApp updateNativeOrientationWithOrientation:v6 logMessage:@"Force updating orientation for deck switcher pan gesture transaction"];
    }
    *a4 = 1;
  }
}

- (void)_finishWithGesture:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  v5.receiver = self;
  v5.super_class = (Class)SBDeckSwitcherPanGestureWorkspaceTransaction;
  [(SBFluidSwitcherGestureWorkspaceTransaction *)&v5 _finishWithGesture:v4];

  kdebug_trace();
}

- (void)_removeHysteresisFromTranslation
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(SBSystemGestureWorkspaceTransaction *)self gestureRecognizer];
  SBSafeCast(v3, v4);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_super v5 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherViewController];
    uint64_t v6 = [v5 view];

    [v12 translationInView:v6];
    double v8 = v7;
    [v12 _hysteresis];
    double v10 = v8 + v9;
    if (v8 + v9 > 0.0) {
      double v10 = 0.0;
    }
    double v11 = fmax(v8 - v9, 0.0);
    if (v8 > 0.0) {
      double v10 = v11;
    }
    objc_msgSend(v12, "setTranslation:inView:", v6, 0.0, v10);
  }
}

@end
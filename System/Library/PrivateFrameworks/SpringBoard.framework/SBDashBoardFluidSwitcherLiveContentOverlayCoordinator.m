@interface SBDashBoardFluidSwitcherLiveContentOverlayCoordinator
- (BOOL)areLiveContentOverlayUpdatesSuspended;
- (BOOL)performSwitcherKeyboardShortcutAction:(int64_t)a3;
- (BOOL)wantsEdgeProtectForHomeGestureForAppLayout:(id)a3;
- (BOOL)wantsHomeAffordanceAutoHideForAppLayout:(id)a3;
- (SBDashBoardFluidSwitcherLiveContentOverlayCoordinator)initWithWindowScene:(id)a3;
- (SBDashBoardFluidSwitcherLiveContentOverlayCoordinatorDataSource)dataSource;
- (SBSwitcherLiveContentOverlayCoordinatorDelegate)delegate;
- (SBWindowScene)sbWindowScene;
- (id)appLayoutForKeyboardFocusedScene;
- (int64_t)containerOrientation;
- (void)appLayoutWillBecomeVisible:(id)a3;
- (void)setContainerOrientation:(int64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLiveContentOverlayUpdatesSuspended:(BOOL)a3;
@end

@implementation SBDashBoardFluidSwitcherLiveContentOverlayCoordinator

- (SBDashBoardFluidSwitcherLiveContentOverlayCoordinator)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDashBoardFluidSwitcherLiveContentOverlayCoordinator;
  v5 = [(SBDashBoardFluidSwitcherLiveContentOverlayCoordinator *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_sbWindowScene, v4);
  }

  return v6;
}

- (id)appLayoutForKeyboardFocusedScene
{
  return 0;
}

- (BOOL)performSwitcherKeyboardShortcutAction:(int64_t)a3
{
  return 0;
}

- (void)appLayoutWillBecomeVisible:(id)a3
{
  id v21 = a3;
  id v4 = [(SBDashBoardFluidSwitcherLiveContentOverlayCoordinator *)self delegate];
  v5 = [(SBDashBoardFluidSwitcherLiveContentOverlayCoordinator *)self dataSource];
  v6 = [v21 itemForLayoutRole:1];
  if ([v6 type] == 7 || !objc_msgSend(v6, "type"))
  {
    objc_super v8 = [v5 liveContentOverlayCoordinator:self hostableEntityForDisplayItem:v6];
    v9 = [SBCaptureExtensionWorkspaceEntity alloc];
    v10 = [v6 bundleIdentifier];
    v11 = [(SBCaptureExtensionWorkspaceEntity *)v9 initWithBundleIdentifier:v10 hostableEntity:v8];

    v12 = [SBSwitcherCaptureExtensionLiveContentOverlay alloc];
    v13 = [(SBCaptureExtensionWorkspaceEntity *)v11 captureExtensionEntity];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
    v7 = [(SBSwitcherCaptureExtensionLiveContentOverlay *)v12 initWithEntity:v13 windowScene:WeakRetained];

    LOBYTE(v20) = 0;
    -[SBSwitcherCaptureExtensionLiveContentOverlay configureWithWorkspaceEntity:referenceFrame:contentOrientation:containerOrientation:layoutRole:sbsDisplayLayoutRole:spaceConfiguration:floatingConfiguration:hasClassicAppOrientationMismatch:sizingPolicy:](v7, "configureWithWorkspaceEntity:referenceFrame:contentOrientation:containerOrientation:layoutRole:sbsDisplayLayoutRole:spaceConfiguration:floatingConfiguration:hasClassicAppOrientationMismatch:sizingPolicy:", v11, 1, 1, 1, 1, 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), 0, v20, 2);
    v15 = [v4 parentViewControllerForContentOverlay];
    v16 = [(SBSwitcherCaptureExtensionLiveContentOverlay *)v7 contentViewController];
    id v17 = (id)[v16 view];
    if (objc_opt_respondsToSelector())
    {
      id v18 = v16;
      v19 = [v5 liveContentOverlayCoordinator:self coverSheetPresenterForDisplayItem:v6];
      [v18 setPresenter:v19];
    }
    [v15 addChildViewController:v16];
    objc_msgSend(v16, "bs_beginAppearanceTransition:animated:", 1, 0);
    [v16 didMoveToParentViewController:v15];
    objc_msgSend(v16, "bs_endAppearanceTransition");
  }
  else
  {
    v7 = 0;
  }
  [v4 addLiveContentOverlay:v7 forAppLayout:v21 animated:0];
}

- (BOOL)wantsEdgeProtectForHomeGestureForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsHomeAffordanceAutoHideForAppLayout:(id)a3
{
  return 0;
}

- (SBWindowScene)sbWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  return (SBWindowScene *)WeakRetained;
}

- (BOOL)areLiveContentOverlayUpdatesSuspended
{
  return self->_liveContentOverlayUpdatesSuspended;
}

- (void)setLiveContentOverlayUpdatesSuspended:(BOOL)a3
{
  self->_liveContentOverlayUpdatesSuspended = a3;
}

- (int64_t)containerOrientation
{
  return self->_containerOrientation;
}

- (void)setContainerOrientation:(int64_t)a3
{
  self->_containerOrientation = a3;
}

- (SBSwitcherLiveContentOverlayCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSwitcherLiveContentOverlayCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBDashBoardFluidSwitcherLiveContentOverlayCoordinatorDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SBDashBoardFluidSwitcherLiveContentOverlayCoordinatorDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_sbWindowScene);
}

@end
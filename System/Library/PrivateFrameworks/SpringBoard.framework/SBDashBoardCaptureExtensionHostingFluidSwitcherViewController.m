@interface SBDashBoardCaptureExtensionHostingFluidSwitcherViewController
- (BOOL)_runTransitionRequest:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)activateDisplayItemFromRequest:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)anyDisplayItemForAppLayoutOverlapsFloatingDock:(id)a3;
- (BOOL)canHostAnApp;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)handleEvent:(id)a3;
- (BOOL)isDismissGestureEnabled;
- (BOOL)isEphemeralSwitcher;
- (BOOL)isHostingAnApp;
- (BOOL)isIconForIconZoomingView:(id)a3 displayedInLocations:(id)a4;
- (BOOL)isSwitcherContentControllerEphemeral:(id)a3;
- (BOOL)isSwitcherForegroundActive;
- (BOOL)needsContentView;
- (BOOL)presentationCancelsTouches;
- (BOOL)shouldMatchMoveIconZoomingView:(id)a3;
- (BOOL)switcherContentControllerControlsHomeScreenContents:(id)a3;
- (BOOL)switcherContentControllerControlsWallpaper:(id)a3;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4;
- (CGRect)iconFrameForAppLayout:(id)a3;
- (CGRect)switcherContentController:(id)a3 frameForItemWithRole:(int64_t)a4 inMainAppLayout:(id)a5 interfaceOrientation:(int64_t)a6;
- (CSHostableEntity)entity;
- (SBDashBoardCaptureExtensionHostingFluidSwitcherViewController)initWithCaptureExtensionEntity:(id)a3 isEphemeralSwitcher:(BOOL)a4;
- (SBDashBoardCaptureExtensionHostingFluidSwitcherViewControllerDelegate)delegate;
- (SBFSwitcherBackdropControlling)switcherBackdropController;
- (SBSwitcherContentViewControlling)contentViewController;
- (double)iconCornerRadiusForAppLayout:(id)a3;
- (double)iconScaleForAppLayout:(id)a3;
- (id)_contentViewControllers;
- (id)_iconViewForAppLayout:(id)a3;
- (id)_workspaceTransitionRequestForSwitcherTransitionRequest:(id)a3 gestureInitiated:(BOOL)a4 isDismissal:(BOOL *)a5;
- (id)acquireSystemApertureSuppressionAssertionForBundleIdentifier:(id)a3 sceneIdentifier:(id)a4;
- (id)appLayoutsForSwitcherContentController:(id)a3;
- (id)homeGestureSettingsForSwitcherContentController:(id)a3;
- (id)hostedAppSceneHandle;
- (id)hostedAppSceneHandles;
- (id)iconGridSizeClassForAppLayout:(id)a3;
- (id)iconLocationForAppLayout:(id)a3;
- (id)iconZoomingViewContainerForIconZoomingView:(id)a3;
- (id)layoutStateForApplicationTransitionContext:(id)a3;
- (id)liveContentOverlayCoordinator:(id)a3 hostableEntityForDisplayItem:(id)a4;
- (id)matchingIconZoomingViewForIconZoomingView:(id)a3;
- (id)previousLayoutStateForApplicationTransitionContext:(id)a3;
- (id)switcherContentController:(id)a3 transitionEventForContext:(id)a4 identifier:(id)a5 phase:(unint64_t)a6 animated:(BOOL)a7;
- (int64_t)_zStackParticipantIdentifier;
- (int64_t)activeInterfaceOrientationForSwitcherContentController:(id)a3;
- (int64_t)nextDisplayItemInteractionTimeForSwitcherContentController:(id)a3;
- (int64_t)presentationPriority;
- (int64_t)switcherInterfaceOrientationForSwitcherContentController:(id)a3;
- (unint64_t)windowManagementStyleForSwitcherContentController:(id)a3;
- (void)_handleBottomEdgeGesture:(id)a3;
- (void)_handleBottomEdgeGestureBegan:(id)a3;
- (void)_handleBottomEdgeGestureChanged:(id)a3;
- (void)_handleBottomEdgeGestureEnded:(id)a3;
- (void)_setupBackdropView;
- (void)_updateHomeGesture;
- (void)_updateHomeGesturePreference;
- (void)_updateModifierTimelinePresence;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)dealloc;
- (void)didTransitionToPresented:(BOOL)a3;
- (void)invalidateZStackParticipantPreferencesWithReason:(id)a3;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setDismissGestureEnabled:(BOOL)a3;
- (void)setSwitcherBackdropController:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)switcherContentController:(id)a3 performTransitionWithRequest:(id)a4 gestureInitiated:(BOOL)a5;
- (void)switcherContentController:(id)a3 setHomeScreenBackdropBlurMaterialRecipeName:(id)a4 withAnimationMode:(int64_t)a5 completion:(id)a6;
- (void)switcherContentController:(id)a3 setHomeScreenBackdropBlurProgress:(double)a4 withAnimationMode:(int64_t)a5 completion:(id)a6;
- (void)switcherContentController:(id)a3 setHomeScreenBackdropBlurType:(int64_t)a4;
- (void)switcherContentController:(id)a3 setHomeScreenScale:(double)a4 withAnimationMode:(int64_t)a5 completion:(id)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
@end

@implementation SBDashBoardCaptureExtensionHostingFluidSwitcherViewController

- (SBDashBoardCaptureExtensionHostingFluidSwitcherViewController)initWithCaptureExtensionEntity:(id)a3 isEphemeralSwitcher:(BOOL)a4
{
  id v7 = a3;
  v8 = [v7 displayItemRepresentation];
  if (v8)
  {
    v24.receiver = self;
    v24.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
    v9 = [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)&v24 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_entity, a3);
      objc_storeStrong((id *)&v10->_displayItem, v8);
      v10->_ephemeralSwitcher = a4;
      v11 = objc_alloc_init(SBMainDisplayLayoutStateManager);
      layoutStateManager = v10->_layoutStateManager;
      v10->_layoutStateManager = &v11->super;

      uint64_t v13 = +[SBMainDisplayLayoutStateManager _initialLayoutStateWithDisplayOrdinal:0 isDisplayExternal:0];
      layoutState = v10->_layoutState;
      v10->_layoutState = (SBLayoutState *)v13;

      v15 = [MEMORY[0x1E4F5E408] rootSettings];
      uint64_t v16 = [v15 cameraExtensionSettings];
      cameraExtensionSettings = v10->_cameraExtensionSettings;
      v10->_cameraExtensionSettings = (CSCameraExtensionSettings *)v16;

      uint64_t v18 = +[SBAppSwitcherDomain rootSettings];
      switcherSettings = v10->_switcherSettings;
      v10->_switcherSettings = (SBAppSwitcherSettings *)v18;

      uint64_t v20 = [(SBAppSwitcherSettings *)v10->_switcherSettings dashboardHomeGestureSettings];
      homeGestureSettings = v10->_homeGestureSettings;
      v10->_homeGestureSettings = (SBHomeGestureSettings *)v20;

      [(PTSettings *)v10->_switcherSettings addKeyObserver:v10];
    }
    self = v10;
    v22 = self;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)dealloc
{
  [(PTSettings *)self->_switcherSettings removeKeyObserver:self];
  [(SBFluidSwitcherViewController *)self->_switcherViewController invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
  [(CSCoverSheetViewControllerBase *)&v3 dealloc];
}

- (BOOL)activateDisplayItemFromRequest:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [v9 applicationContext];
  v11 = [v10 preludeAnimationTokenWrapper];
  v12 = [v11 consumeToken];

  uint64_t v13 = +[SBMainWorkspace sharedInstance];
  v14 = [v13 createRequestWithOptions:0];

  uint64_t v15 = [v9 source];
  [v14 setSource:v15];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __116__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_activateDisplayItemFromRequest_animated_completion___block_invoke;
  v21[3] = &unk_1E6AF5638;
  v21[4] = self;
  id v22 = v12;
  id v16 = v12;
  [v14 modifyApplicationContext:v21];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __116__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_activateDisplayItemFromRequest_animated_completion___block_invoke_2;
  v19[3] = &unk_1E6AF5A50;
  id v20 = v8;
  id v17 = v8;
  LOBYTE(v5) = [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self _runTransitionRequest:v14 animated:v5 completion:v19];

  return v5;
}

void __116__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_activateDisplayItemFromRequest_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [SBCaptureExtensionWorkspaceEntity alloc];
  BOOL v5 = [*(id *)(*(void *)(a1 + 32) + 1048) bundleIdentifier];
  id v7 = [(SBCaptureExtensionWorkspaceEntity *)v4 initWithBundleIdentifier:v5 hostableEntity:*(void *)(*(void *)(a1 + 32) + 1152)];

  v6 = +[SBConsumableTokenWrapper consumableTokenWrapperWithToken:*(void *)(a1 + 40)];
  [v3 setPreludeAnimationTokenWrapper:v6];

  [v3 setActivatingEntity:v7];
  [v3 setDelegate:*(void *)(a1 + 32)];
}

uint64_t __116__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_activateDisplayItemFromRequest_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (BOOL)_runTransitionRequest:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  transitionManager = self->_transitionManager;
  if (transitionManager)
  {
    id v9 = a5;
    [v7 finalize];
    v10 = [v7 applicationContext];
    v11 = [v10 layoutState];
    layoutState = self->_layoutState;
    self->_layoutState = v11;

    [(SBDashBoardCaptureExtensionWorkspaceTransitionManager *)self->_transitionManager interruptCurrentTransitionIfNeeded];
    [(SBDashBoardCaptureExtensionWorkspaceTransitionManager *)self->_transitionManager executeTransitionRequest:v7 completion:v9];
  }
  else
  {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }

  return transitionManager != 0;
}

- (void)setDismissGestureEnabled:(BOOL)a3
{
  if (self->_dismissGestureEnabled != a3)
  {
    self->_dismissGestureEnabled = a3;
    [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self _updateHomeGesturePreference];
    [(CSCoverSheetViewControllerBase *)self rebuildBehavior];
  }
}

- (BOOL)presentationCancelsTouches
{
  return 0;
}

- (void)loadView
{
  v2.receiver = self;
  v2.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
  [(CSCoverSheetViewControllerBase *)&v2 loadView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewWillAppear:a3];
  [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self _updateHomeGesturePreference];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewDidAppear:a3];
  [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self _updateHomeGesturePreference];
  [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self _updateHomeGesture];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewWillDisappear:a3];
  [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self _updateHomeGesturePreference];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewDidDisappear:a3];
  [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self _updateHomeGesturePreference];
  [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self bs_removeChildViewController:self->_switcherViewController];
  [(SBFluidSwitcherViewController *)self->_switcherViewController invalidate];
  switcherViewController = self->_switcherViewController;
  self->_switcherViewController = 0;

  transitionManager = self->_transitionManager;
  self->_transitionManager = 0;
}

- (void)viewIsAppearing:(BOOL)a3
{
  v23.receiver = self;
  v23.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
  [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)&v23 viewIsAppearing:a3];
  if (!self->_switcherViewController)
  {
    objc_super v4 = [(UIViewController *)self _sbWindowScene];
    [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self _updateHomeGesturePreference];
    BOOL v5 = objc_alloc_init(SBDashBoardRootSwitcherModifier);
    objc_super v6 = [[SBDashBoardFluidSwitcherLiveContentOverlayCoordinator alloc] initWithWindowScene:v4];
    [(SBDashBoardFluidSwitcherLiveContentOverlayCoordinator *)v6 setDataSource:self];
    id v7 = [SBDashBoardSecureFluidSwitcherViewController alloc];
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    v10 = [(SBFluidSwitcherViewController *)v7 initWithRootModifier:v5 liveContentOverlayCoordinator:v6 dataSource:self delegate:self debugName:v9];
    switcherViewController = self->_switcherViewController;
    self->_switcherViewController = v10;

    v12 = [[SBDashBoardCaptureExtensionWorkspaceTransitionManager alloc] initWithSwitcherViewController:self->_switcherViewController];
    transitionManager = self->_transitionManager;
    self->_transitionManager = v12;

    v14 = [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self view];
    uint64_t v15 = [(SBDashBoardSecureFluidSwitcherViewController *)self->_switcherViewController view];
    id v16 = self->_switcherViewController;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __81__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_viewIsAppearing___block_invoke;
    v19[3] = &unk_1E6AF8F30;
    id v20 = v15;
    id v21 = v14;
    id v22 = self;
    id v17 = v14;
    id v18 = v15;
    [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self bs_addChildViewController:v16 animated:0 transitionBlock:v19];
    [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self _setupBackdropView];
  }
}

void __81__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_viewIsAppearing___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  objc_super v4 = *(void **)(a1 + 40);
  BOOL v5 = a2;
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");
  [*(id *)(a1 + 32) setAutoresizingMask:18];
  [*(id *)(a1 + 48) _updateModifierTimelinePresence];
  v5[2]();
}

- (void)aggregateBehavior:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
  [(CSCoverSheetViewControllerBase *)&v15 aggregateBehavior:v4];
  [v4 setIdleWarnMode:2];
  [v4 setIdleTimerMode:1];
  [v4 setIdleTimerDuration:13];
  if ([(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self isDismissGestureEnabled])
  {
    [v4 addRestrictedCapabilities:4104];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v5 = [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self _contentViewControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v4 unionBehavior:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)aggregateAppearance:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
  [(CSCoverSheetViewControllerBase *)&v20 aggregateAppearance:v4];
  BOOL v5 = objc_opt_new();
  uint64_t v6 = [v5 priority:40];
  uint64_t v7 = [v6 hidden:1];
  uint64_t v8 = [v7 fakeStatusBar:BSSettingFlagForBool()];
  uint64_t v9 = [v8 fakeStatusBarLevel:&unk_1F3349BF0];

  [v4 addComponent:v9];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self _contentViewControllers];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector()) {
          [v4 unionAppearance:v15];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v12);
  }
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return [a3 type] == 27;
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
  if ([(CSCoverSheetViewControllerBase *)&v8 handleEvent:v4]
    && ([v4 isConsumable] & 1) != 0)
  {
    char v5 = [v4 isConsumable];
  }
  else
  {
    uint64_t v6 = [v4 type];
    if (v6 == 25 || v6 == 27) {
      [(CSCoverSheetViewControllerBase *)self dismiss];
    }
    char v5 = 0;
  }

  return v5;
}

- (int64_t)presentationPriority
{
  return 555;
}

- (void)didTransitionToPresented:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardCaptureExtensionHostingFluidSwitcherViewController;
  -[CSCoverSheetViewControllerBase didTransitionToPresented:](&v6, sel_didTransitionToPresented_);
  if (!a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherBackdropController);
    [WeakRetained setScale:2 behaviorMode:0 completion:1.0];
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6 = a4;
  if ([a3 isEqual:self->_switcherSettings]
    && [v6 isEqualToString:@"showLockedModifierTimeline"])
  {
    [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self _updateModifierTimelinePresence];
  }
}

- (id)liveContentOverlayCoordinator:(id)a3 hostableEntityForDisplayItem:(id)a4
{
  if ([a4 isEqual:self->_displayItem]) {
    char v5 = self->_entity;
  }
  else {
    char v5 = 0;
  }
  return v5;
}

- (void)switcherContentController:(id)a3 performTransitionWithRequest:(id)a4 gestureInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  char v15 = 0;
  uint64_t v10 = [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self _workspaceTransitionRequestForSwitcherTransitionRequest:v9 gestureInitiated:v5 isDismissal:&v15];
  if (v15) {
    [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self setDismissGestureEnabled:0];
  }
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __137__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_switcherContentController_performTransitionWithRequest_gestureInitiated___block_invoke;
  v11[3] = &unk_1E6AFC128;
  char v13 = v15;
  objc_copyWeak(&v12, &location);
  [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self _runTransitionRequest:v10 animated:1 completion:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __137__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_switcherContentController_performTransitionWithRequest_gestureInitiated___block_invoke(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained dismiss];
  }
}

- (BOOL)switcherContentControllerControlsHomeScreenContents:(id)a3
{
  return 1;
}

- (void)switcherContentController:(id)a3 setHomeScreenScale:(double)a4 withAnimationMode:(int64_t)a5 completion:(id)a6
{
  uint64_t v11 = (void (**)(id, uint64_t, void))a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherBackdropController);
  uint64_t v10 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setScale:a5 behaviorMode:v11 completion:a4];
  }
  else if (v11)
  {
    v11[2](v11, 1, 0);
  }
}

- (void)switcherContentController:(id)a3 setHomeScreenBackdropBlurProgress:(double)a4 withAnimationMode:(int64_t)a5 completion:(id)a6
{
  id v12 = a3;
  uint64_t v10 = (void (**)(id, uint64_t, void))a6;
  backdropView = self->_backdropView;
  if (backdropView)
  {
    [(SBHomeScreenBackdropViewBase *)backdropView setBlurProgress:a5 behaviorMode:v10 completion:a4];
  }
  else if (v10)
  {
    v10[2](v10, 1, 0);
  }
}

- (void)switcherContentController:(id)a3 setHomeScreenBackdropBlurType:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 3)
  {
    [(SBHomeScreenBackdropViewBase *)self->_backdropView beginRequiringLiveBackdropViewForReason:@"SBDashBoardCaptureExtensionBackdropRequiringReason"];
LABEL_4:
    [(SBHomeScreenBackdropViewBase *)self->_backdropView beginRequiringBackdropViewForReason:@"SBDashBoardCaptureExtensionBackdropRequiringReason"];
    goto LABEL_6;
  }
  [(SBHomeScreenBackdropViewBase *)self->_backdropView endRequiringLiveBackdropViewForReason:@"SBDashBoardCaptureExtensionBackdropRequiringReason"];
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    goto LABEL_4;
  }
  [(SBHomeScreenBackdropViewBase *)self->_backdropView endRequiringBackdropViewForReason:@"SBDashBoardCaptureExtensionBackdropRequiringReason"];
LABEL_6:
}

- (void)switcherContentController:(id)a3 setHomeScreenBackdropBlurMaterialRecipeName:(id)a4 withAnimationMode:(int64_t)a5 completion:(id)a6
{
  id v9 = a4;
  uint64_t v10 = (void *)MEMORY[0x1E4F42FF0];
  cameraExtensionSettings = self->_cameraExtensionSettings;
  id v12 = a6;
  char v13 = [(CSCameraExtensionSettings *)cameraExtensionSettings coverSheetContentScaleSettings];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __164__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_switcherContentController_setHomeScreenBackdropBlurMaterialRecipeName_withAnimationMode_completion___block_invoke;
  v15[3] = &unk_1E6AF5290;
  v15[4] = self;
  id v16 = v9;
  id v14 = v9;
  objc_msgSend(v10, "sb_animateWithSettings:mode:animations:completion:", v13, a5, v15, v12);
}

void __164__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_switcherContentController_setHomeScreenBackdropBlurMaterialRecipeName_withAnimationMode_completion___block_invoke(uint64_t a1)
{
  objc_super v2 = *(void **)(*(void *)(a1 + 32) + 1112);
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = v4;
    }
    else {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  id v7 = v5;

  id v6 = v7;
  if (v7)
  {
    [v7 setMaterialRecipeName:*(void *)(a1 + 40)];
    id v6 = v7;
  }
}

- (BOOL)switcherContentControllerControlsWallpaper:(id)a3
{
  return 0;
}

- (id)appLayoutsForSwitcherContentController:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = [SBAppLayout alloc];
  BOOL v5 = [NSNumber numberWithInteger:1];
  displayItem = self->_displayItem;
  id v12 = v5;
  v13[0] = displayItem;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v8 = [(SBAppLayout *)v4 initWithItemsForLayoutRoles:v7 configuration:1 environment:1 preferredDisplayOrdinal:0];

  uint64_t v11 = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];

  return v9;
}

- (int64_t)nextDisplayItemInteractionTimeForSwitcherContentController:(id)a3
{
  return 0;
}

- (int64_t)switcherInterfaceOrientationForSwitcherContentController:(id)a3
{
  return [(SBFluidSwitcherViewController *)self->_switcherViewController contentOrientation];
}

- (int64_t)activeInterfaceOrientationForSwitcherContentController:(id)a3
{
  return objc_msgSend((id)SBApp, "activeInterfaceOrientation", a3);
}

- (id)switcherContentController:(id)a3 transitionEventForContext:(id)a4 identifier:(id)a5 phase:(unint64_t)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = objc_opt_class();
  char v13 = [v10 previousLayoutState];
  id v14 = SBSafeCast(v12, v13);

  uint64_t v15 = [v14 unlockedEnvironmentMode];
  uint64_t v16 = objc_opt_class();
  long long v17 = [v10 layoutState];
  long long v18 = SBSafeCast(v16, v17);

  uint64_t v19 = [v18 unlockedEnvironmentMode];
  objc_super v20 = [v14 appLayout];
  id v21 = [v18 appLayout];
  uint64_t v22 = [[SBTransitionSwitcherModifierEvent alloc] initWithTransitionID:v11 phase:a6 animated:v7];

  [(SBTransitionSwitcherModifierEvent *)v22 setFromAppLayout:v20];
  [(SBTransitionSwitcherModifierEvent *)v22 setFromEnvironmentMode:v15];
  -[SBTransitionSwitcherModifierEvent setFromInterfaceOrientation:](v22, "setFromInterfaceOrientation:", [v14 interfaceOrientation]);
  objc_super v23 = [v14 elementWithRole:1];
  -[SBTransitionSwitcherModifierEvent setFromAppLayoutWantsExclusiveForeground:](v22, "setFromAppLayoutWantsExclusiveForeground:", [v23 hasLayoutAttributes:2]);

  [(SBTransitionSwitcherModifierEvent *)v22 setToAppLayout:v21];
  [(SBTransitionSwitcherModifierEvent *)v22 setToEnvironmentMode:v19];
  -[SBTransitionSwitcherModifierEvent setToInterfaceOrientation:](v22, "setToInterfaceOrientation:", [v18 interfaceOrientation]);
  objc_super v24 = [v18 elementWithRole:1];
  -[SBTransitionSwitcherModifierEvent setToAppLayoutWantsExclusiveForeground:](v22, "setToAppLayoutWantsExclusiveForeground:", [v24 hasLayoutAttributes:2]);

  [(SBTransitionSwitcherModifierEvent *)v22 setActivatingAppLayout:v21];
  v25 = [v10 request];
  -[SBTransitionSwitcherModifierEvent setGestureInitiated:](v22, "setGestureInitiated:", [v25 source] == 11);

  v26 = [v10 preludeAnimationTokenWrapper];
  int v27 = [v26 isTokenAvailable];

  if (a6 == 1 && v27)
  {
    v28 = [v10 preludeAnimationTokenWrapper];
    v29 = [v28 consumeToken];

    v30 = +[SBConsumableTokenWrapper consumableTokenWrapperWithToken:v29];
    [(SBTransitionSwitcherModifierEvent *)v22 setZoomFromHardwareButtonPreludeTokenWrapper:v30];
  }
  return v22;
}

- (CGRect)switcherContentController:(id)a3 frameForItemWithRole:(int64_t)a4 inMainAppLayout:(id)a5 interfaceOrientation:(int64_t)a6
{
  id v6 = [(SBDashBoardSecureFluidSwitcherViewController *)self->_switcherViewController view];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)homeGestureSettingsForSwitcherContentController:(id)a3
{
  return self->_homeGestureSettings;
}

- (unint64_t)windowManagementStyleForSwitcherContentController:(id)a3
{
  return 0;
}

- (BOOL)isSwitcherContentControllerEphemeral:(id)a3
{
  return self->_ephemeralSwitcher;
}

- (SBSwitcherContentViewControlling)contentViewController
{
  return (SBSwitcherContentViewControlling *)self->_switcherViewController;
}

- (BOOL)isSwitcherForegroundActive
{
  return [(CSCoverSheetViewControllerBase *)self participantState] == 2;
}

- (id)acquireSystemApertureSuppressionAssertionForBundleIdentifier:(id)a3 sceneIdentifier:(id)a4
{
  return 0;
}

- (CGRect)iconFrameForAppLayout:(id)a3
{
  id v4 = [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self _iconViewForAppLayout:a3];
  if (v4)
  {
    BOOL v5 = [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self view];
    id v6 = [v5 _screen];
    double v7 = [v6 fixedCoordinateSpace];

    [v4 iconImageFrame];
    objc_msgSend(v4, "convertRect:toCoordinateSpace:", v7);
    objc_msgSend(v5, "convertRect:fromCoordinateSpace:", v7);
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB20];
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (double)iconScaleForAppLayout:(id)a3
{
  return 1.0;
}

- (double)iconCornerRadiusForAppLayout:(id)a3
{
  [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self iconFrameForAppLayout:a3];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  BOOL IsNull = CGRectIsNull(v11);
  double result = 0.0;
  if (!IsNull)
  {
    v12.origin.CGFloat x = x;
    v12.origin.CGFloat y = y;
    v12.size.CGFloat width = width;
    v12.size.CGFloat height = height;
    double v9 = CGRectGetWidth(v12);
    v13.origin.CGFloat x = x;
    v13.origin.CGFloat y = y;
    v13.size.CGFloat width = width;
    v13.size.CGFloat height = height;
    double v10 = CGRectGetHeight(v13);
    if (v9 <= v10) {
      double v10 = v9;
    }
    return v10 * 0.5;
  }
  return result;
}

- (BOOL)isIconForIconZoomingView:(id)a3 displayedInLocations:(id)a4
{
  return 0;
}

- (BOOL)shouldMatchMoveIconZoomingView:(id)a3
{
  id v4 = [a3 window];
  BOOL v5 = [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self view];
  id v6 = [v5 window];
  BOOL v7 = v4 == v6;

  return v7;
}

- (id)iconZoomingViewContainerForIconZoomingView:(id)a3
{
  return 0;
}

- (id)matchingIconZoomingViewForIconZoomingView:(id)a3
{
  return (id)[a3 matchingIconZoomingViewOverlay];
}

- (id)iconLocationForAppLayout:(id)a3
{
  return (id)*MEMORY[0x1E4FA66C8];
}

- (id)iconGridSizeClassForAppLayout:(id)a3
{
  return (id)*MEMORY[0x1E4FA6518];
}

- (BOOL)anyDisplayItemForAppLayoutOverlapsFloatingDock:(id)a3
{
  return 0;
}

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  return [(SBLayoutStateManager *)self->_layoutStateManager layoutStateForApplicationTransitionContext:a3];
}

- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4
{
  id v4 = [(UIViewController *)self _sbWindowScene];
  BOOL v5 = [v4 _FBSScene];
  id v6 = [v5 settings];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (id)previousLayoutStateForApplicationTransitionContext:(id)a3
{
  return self->_layoutState;
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 setActivationPolicyForParticipantsBelow:2];
  double v8 = [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self _contentViewControllers];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __101__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_zStackParticipant_updatePreferences___block_invoke;
  v11[3] = &unk_1E6AFC150;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  objc_msgSend(v8, "bs_each:", v11);
}

void __101__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_zStackParticipant_updatePreferences___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 zStackParticipant:*(void *)(a1 + 32) updatePreferences:*(void *)(a1 + 40)];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = [(UIViewController *)self _sbWindowScene];
  BOOL v5 = [v4 zStackResolver];

  BOOL result = [(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture];
  if (!v5) {
    return 0;
  }
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return self->_bottomEdgeRecognizer == a3
      && [(CSCoverSheetViewControllerBase *)self participantState] == 2;
}

- (BOOL)needsContentView
{
  return 1;
}

- (void)invalidateZStackParticipantPreferencesWithReason:(id)a3
{
}

- (BOOL)canHostAnApp
{
  return 1;
}

- (BOOL)isHostingAnApp
{
  objc_super v2 = [(SBLayoutState *)self->_layoutState elements];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)hostedAppSceneHandle
{
  objc_super v2 = [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self hostedAppSceneHandles];
  BOOL v3 = [v2 firstObject];

  return v3;
}

- (id)hostedAppSceneHandles
{
  objc_super v2 = [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self _contentViewControllers];
  BOOL v3 = objc_msgSend(v2, "bs_compactMap:", &__block_literal_global_81);
  id v4 = objc_msgSend(v3, "bs_flatten");

  return v4;
}

id __86__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController_hostedAppSceneHandles__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [v2 hostedAppSceneHandles];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (int64_t)_zStackParticipantIdentifier
{
  return 9;
}

- (void)_updateModifierTimelinePresence
{
  switcherViewController = self->_switcherViewController;
  BOOL v3 = [(SBAppSwitcherSettings *)self->_switcherSettings showLockedModifierTimeline];
  [(SBFluidSwitcherViewController *)switcherViewController setShowModifierTimeline:v3];
}

- (void)_updateHomeGesturePreference
{
  if ([(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self bs_isAppearingOrAppeared]&& SBHomeGestureEnabled()&& self->_dismissGestureEnabled)
  {
    if (self->_zStackParticipant) {
      return;
    }
    double v8 = [(UIViewController *)self _sbWindowScene];
    BOOL v3 = [v8 zStackResolver];
    objc_msgSend(v3, "acquireParticipantWithIdentifier:delegate:", -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController _zStackParticipantIdentifier](self, "_zStackParticipantIdentifier"), self);
    id v4 = (SBFZStackParticipant *)objc_claimAutoreleasedReturnValue();
    zStackParticipant = self->_zStackParticipant;
    self->_zStackParticipant = v4;

    id v6 = (SBFZStackParticipant *)v8;
  }
  else
  {
    id v7 = self->_zStackParticipant;
    if (!v7) {
      return;
    }
    [(SBFZStackParticipant *)v7 invalidate];
    id v6 = self->_zStackParticipant;
    self->_zStackParticipant = 0;
  }
}

- (void)_updateHomeGesture
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Not updating home gesture because no gesture manager is available for SBWindowScene %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_handleBottomEdgeGesture:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 state];
  if ((unint64_t)(v4 - 3) < 3)
  {
    [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self _handleBottomEdgeGestureEnded:v7];
LABEL_8:
    id v6 = v7;
    goto LABEL_9;
  }
  if (v4 == 2)
  {
    [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self _handleBottomEdgeGestureChanged:v7];
    goto LABEL_8;
  }
  BOOL v5 = v4 == 1;
  id v6 = v7;
  if (v5)
  {
    [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self _handleBottomEdgeGestureBegan:v7];
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_handleBottomEdgeGestureBegan:(id)a3
{
  id v4 = a3;
  [(SBDashBoardCaptureExtensionWorkspaceTransitionManager *)self->_transitionManager interruptCurrentTransitionIfNeeded];
  BOOL v5 = [MEMORY[0x1E4F29128] UUID];
  objc_initWeak(&location, self);
  id v6 = [SBFluidSwitcherGesture alloc];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __95__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController__handleBottomEdgeGestureBegan___block_invoke;
  double v14 = &unk_1E6AFC198;
  objc_copyWeak(&v17, &location);
  id v7 = v5;
  id v15 = v7;
  id v8 = v4;
  id v16 = v8;
  id v9 = [(SBFluidSwitcherGesture *)v6 initWithType:1 eventProvider:&v11];
  id v10 = [(SBLayoutState *)self->_layoutState appLayout];
  [(SBFluidSwitcherGesture *)v9 _setSelectedAppLayout:v10];

  objc_storeStrong((id *)&self->_gesture, v9);
  [(SBFluidSwitcherViewController *)self->_switcherViewController handleFluidSwitcherGestureManager:self didBeginGesture:self->_gesture];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

SBGestureSwitcherModifierEvent *__95__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController__handleBottomEdgeGestureBegan___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v3);
  uint64_t v6 = SBGestureModifierPhaseForGestureState([v4 state]);
  id v7 = [SBGestureSwitcherModifierEvent alloc];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [v4 selectedAppLayout];
  uint64_t v10 = [v4 type];

  uint64_t v11 = [(SBGestureSwitcherModifierEvent *)v7 initWithGestureID:v8 selectedAppLayout:v9 gestureType:v10 phase:v6];
  if (WeakRetained)
  {
    uint64_t v12 = [WeakRetained view];
    id v13 = WeakRetained[134];
    [v13 velocityInView:v12];
    -[SBGestureSwitcherModifierEvent setVelocityInContainerView:](v11, "setVelocityInContainerView:");
    [v13 translationInView:v12];
    -[SBGestureSwitcherModifierEvent setTranslationInContainerView:](v11, "setTranslationInContainerView:");
    [v13 _hysteresis];
    -[SBGestureSwitcherModifierEvent setHysteresis:](v11, "setHysteresis:");
    [v13 locationInView:v12];
    -[SBGestureSwitcherModifierEvent setLocationInContainerView:](v11, "setLocationInContainerView:");
    if (objc_opt_respondsToSelector()) {
      [(SBGestureSwitcherModifierEvent *)v11 setTouchHistoryProvider:*(void *)(a1 + 40)];
    }
  }
  return v11;
}

- (void)_handleBottomEdgeGestureChanged:(id)a3
{
  [(SBFluidSwitcherGesture *)self->_gesture _setState:2];
  switcherViewController = self->_switcherViewController;
  gesture = self->_gesture;
  [(SBFluidSwitcherViewController *)switcherViewController handleFluidSwitcherGestureManager:self didUpdateGesture:gesture];
}

- (void)_handleBottomEdgeGestureEnded:(id)a3
{
  [(SBFluidSwitcherGesture *)self->_gesture _setState:3];
  [(SBFluidSwitcherViewController *)self->_switcherViewController handleFluidSwitcherGestureManager:self didEndGesture:self->_gesture];
  gesture = self->_gesture;
  self->_gesture = 0;
}

- (id)_contentViewControllers
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBLayoutState *)self->_layoutState appLayout];
  if (v3)
  {
    id v4 = [(SBFluidSwitcherViewController *)self->_switcherViewController liveContentOverlayForAppLayout:v3];
    if (objc_opt_respondsToSelector())
    {
      BOOL v5 = [v4 contentViewController];

      if (v5)
      {
        v8[0] = v5;
        uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_7:

  return v6;
}

- (id)_iconViewForAppLayout:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v5 = [(CSHostableEntity *)self->_entity applicationBundleIdentifier];
  uint64_t v6 = [WeakRetained dashBoardCaptureExtensionHostingFluidSwitcherViewController:self bestIconViewForApplicationBundleIdentifier:v5];

  return v6;
}

- (void)_setupBackdropView
{
  id v7 = [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)self view];
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    uint64_t v3 = [SBHomeScreenBackdropDarkTintView alloc];
    [v7 bounds];
    id v4 = -[SBHomeScreenBackdropDarkTintView initWithFrame:](v3, "initWithFrame:");
  }
  else
  {
    BOOL v5 = [SBHomeScreenBackdropView alloc];
    [v7 bounds];
    id v4 = -[SBHomeScreenBackdropView initWithFrame:materialRecipe:scaleAdjustment:](v5, "initWithFrame:materialRecipe:scaleAdjustment:", 8, &__block_literal_global_77);
  }
  backdropView = self->_backdropView;
  self->_backdropView = v4;

  [(SBHomeScreenBackdropViewBase *)self->_backdropView setAutoresizingMask:18];
  [(SBHomeScreenBackdropViewBase *)self->_backdropView bs_setHitTestingDisabled:1];
  [v7 insertSubview:self->_backdropView atIndex:0];
}

double __83__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController__setupBackdropView__block_invoke()
{
  v0 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v1 = objc_msgSend(v0, "sbf_animatedBlurRadiusGraphicsQuality");

  double result = 0.3;
  if (v1 >= 41) {
    return 0.5;
  }
  return result;
}

- (id)_workspaceTransitionRequestForSwitcherTransitionRequest:(id)a3 gestureInitiated:(BOOL)a4 isDismissal:(BOOL *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if ([v8 unlockedEnvironmentMode] == 1 || objc_msgSend(v8, "unlockedEnvironmentMode") == 2)
  {
    BOOL v9 = 1;
  }
  else
  {
    uint64_t v10 = [v8 appLayout];
    BOOL v9 = [v10 type] == 1;
  }
  uint64_t v11 = +[SBMainWorkspace sharedInstance];
  uint64_t v12 = [v11 createRequestWithOptions:0];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __150__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController__workspaceTransitionRequestForSwitcherTransitionRequest_gestureInitiated_isDismissal___block_invoke;
  v15[3] = &unk_1E6AF5C08;
  BOOL v16 = v9;
  v15[4] = self;
  [v12 modifyApplicationContext:v15];
  if (v6) {
    uint64_t v13 = 11;
  }
  else {
    uint64_t v13 = 0;
  }
  [v12 setSource:v13];
  if (a5) {
    *a5 = v9;
  }

  return v12;
}

void __150__SBDashBoardCaptureExtensionHostingFluidSwitcherViewController__workspaceTransitionRequestForSwitcherTransitionRequest_gestureInitiated_isDismissal___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v4 = a2;
    BOOL v5 = objc_alloc_init(SBHomeScreenEntity);
  }
  else
  {
    id v6 = a2;
    id v7 = [SBCaptureExtensionWorkspaceEntity alloc];
    id v8 = [*(id *)(*(void *)(a1 + 32) + 1048) bundleIdentifier];
    BOOL v9 = [(SBCaptureExtensionWorkspaceEntity *)v7 initWithBundleIdentifier:v8 hostableEntity:*(void *)(*(void *)(a1 + 32) + 1152)];

    BOOL v5 = (SBHomeScreenEntity *)v9;
  }
  uint64_t v10 = v5;
  [a2 setActivatingEntity:v5];
  [a2 setDelegate:*(void *)(a1 + 32)];
}

- (CSHostableEntity)entity
{
  return self->_entity;
}

- (BOOL)isEphemeralSwitcher
{
  return self->_ephemeralSwitcher;
}

- (BOOL)isDismissGestureEnabled
{
  return self->_dismissGestureEnabled;
}

- (SBDashBoardCaptureExtensionHostingFluidSwitcherViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBDashBoardCaptureExtensionHostingFluidSwitcherViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBFSwitcherBackdropControlling)switcherBackdropController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherBackdropController);
  return (SBFSwitcherBackdropControlling *)WeakRetained;
}

- (void)setSwitcherBackdropController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_switcherBackdropController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_homeGestureSettings, 0);
  objc_storeStrong((id *)&self->_switcherSettings, 0);
  objc_storeStrong((id *)&self->_cameraExtensionSettings, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_transitionManager, 0);
  objc_storeStrong((id *)&self->_layoutStateManager, 0);
  objc_storeStrong((id *)&self->_layoutState, 0);
  objc_storeStrong((id *)&self->_gesture, 0);
  objc_storeStrong((id *)&self->_bottomEdgeRecognizer, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_switcherViewController, 0);
  objc_storeStrong((id *)&self->_displayItem, 0);
}

@end
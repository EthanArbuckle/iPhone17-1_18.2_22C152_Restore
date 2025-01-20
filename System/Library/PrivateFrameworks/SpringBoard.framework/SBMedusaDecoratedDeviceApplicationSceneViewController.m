@interface SBMedusaDecoratedDeviceApplicationSceneViewController
- (BOOL)SB_conformsToMedusaDecoratedDeviceApplicationSceneViewControlling;
- (BOOL)SB_conformsToSceneLayoutMedusaStatusBarAssertionProviding;
- (BOOL)SB_conformsToSceneLayoutStatusBarAssertionProviding;
- (BOOL)_isChamoisWindowingUIEnabled;
- (BOOL)_sceneViewHasMatchMoveAnimation;
- (BOOL)_topAffordanceViewControllerHandleMoveToDisplayAction:(id)a3 transitionSource:(int64_t)a4;
- (BOOL)_wantsTopAffordance;
- (BOOL)applicationSceneViewControllerIsInNonrotatingWindow:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isBlurred;
- (BOOL)isNubViewHidden;
- (BOOL)isNubViewHighlighted;
- (BOOL)sceneRendersAsynchronously;
- (BOOL)sceneResizesHostedContext;
- (CGSize)contentReferenceSize;
- (MTLumaDodgePillSettings)homeGrabberPillSettings;
- (NSString)sceneMinificationFilter;
- (SBApplicationSceneBackgroundView)backgroundView;
- (SBApplicationSceneViewControllingStatusBarDelegate)applicationSceneStatusBarDelegate;
- (SBDeviceApplicationSceneHandle)sceneHandle;
- (SBHomeGrabberView)homeGrabberView;
- (SBMedusaDecoratedDeviceApplicationSceneViewController)initWithCoder:(id)a3;
- (SBMedusaDecoratedDeviceApplicationSceneViewController)initWithDeviceApplicationSceneHandle:(id)a3 layoutRole:(int64_t)a4;
- (SBMedusaDecoratedDeviceApplicationSceneViewController)initWithDeviceApplicationSceneHandle:(id)a3 layoutRole:(int64_t)a4 workspace:(id)a5 setupManager:(id)a6;
- (SBMedusaDecoratedDeviceApplicationSceneViewControllerDelegate)delegate;
- (SBScenePlaceholderContentContext)placeholderContentContext;
- (UIDropInteraction)dropInteraction;
- (UIView)_blurViewContainerView;
- (UIView)customContentView;
- (UIView)sceneContentView;
- (double)blurViewIconScale;
- (double)currentStatusBarHeight;
- (double)darkenViewAlpha;
- (double)statusBarAlpha;
- (id)_blurContentView;
- (id)backgroundActivitiesToSuppress;
- (id)hitTestToTopAffordance:(CGPoint)a3 window:(id)a4;
- (id)newSnapshot;
- (id)newSnapshotView;
- (id)prepareForContentRotation;
- (id)statusBarAssertionWithStatusBarHidden:(BOOL)a3 atLevel:(unint64_t)a4;
- (id)statusBarAssertionWithStatusBarHidden:(BOOL)a3 nubViewHidden:(int64_t)a4 atLevel:(unint64_t)a5;
- (id)topAffordanceView;
- (int64_t)bestHomeAffordanceOrientationForOrientation:(int64_t)a3;
- (int64_t)containerOrientation;
- (int64_t)contentOrientation;
- (int64_t)displayMode;
- (int64_t)floatingConfiguration;
- (int64_t)homeGrabberDisplayMode;
- (int64_t)layoutRole;
- (int64_t)leadingStatusBarStyle;
- (int64_t)overrideStatusBarStyle;
- (int64_t)spaceConfiguration;
- (int64_t)trailingStatusBarStyle;
- (void)_addSceneViewMatchMoveAnimation;
- (void)_beginRequiringSceneViewMatchMoveAnimationForReason:(id)a3;
- (void)_createOrDestroyTopAffordanceViewControllerAnimated:(BOOL)a3;
- (void)_elasticValueViewControllerWillDismiss:(id)a3;
- (void)_elasticValueViewControllerWillPresent:(id)a3;
- (void)_endRequiringSceneViewMatchMoveAnimationForReason:(id)a3;
- (void)_guidedAccessActivationChanged:(id)a3;
- (void)_handleSplitHomeScreenSwitcherKeyShortcut;
- (void)_handleTopAffordanceTapGestureRecognizerAction:(id)a3;
- (void)_medusaCapabilityChanged:(id)a3;
- (void)_modifyApplicationContext:(id)a3 handleActionType:(int64_t)a4 spaceConfiguration:(int64_t)a5 layoutRole:(int64_t)a6 desiredFloatingConfiguration:(int64_t)a7;
- (void)_removeSceneViewMatchMoveAnimation;
- (void)_sendStatusBarScrollToTopActionForGestureRecognizer:(id)a3;
- (void)_setBlurContentView:(id)a3;
- (void)_setTopAffordanceAutoHides:(BOOL)a3;
- (void)_topAffordanceViewController:(id)a3 handleActionType:(int64_t)a4 desiredFloatingConfiguration:(int64_t)a5 transitionSource:(int64_t)a6;
- (void)_topAffordanceViewController:(id)a3 handleActionType:(int64_t)a4 transitionSource:(int64_t)a5;
- (void)_topAffordanceViewControllerHandleCloseAction;
- (void)_updateAsyncRendering;
- (void)_updateCurrentTopAffordanceAlpha;
- (void)_updateTopAffordanceHighlight;
- (void)_windowManagementStyleDidChange:(id)a3;
- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5;
- (void)activeInterfaceOrientationWillChangeToOrientation:(int64_t)a3;
- (void)applicationSceneViewController:(id)a3 statusBarTapped:(id)a4 tapActionType:(int64_t)a5;
- (void)applicationSceneViewControllerDidUpdateHomeAffordanceSupportedOrientations:(id)a3;
- (void)containerContentWrapperInterfaceOrientationChangedTo:(int64_t)a3;
- (void)containerDidUpdateTraitsParticipant:(id)a3;
- (void)dealloc;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4;
- (void)invalidate;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4;
- (void)loadView;
- (void)newSnapshotViewOnQueue:(id)a3 withCompletion:(id)a4;
- (void)performSwitcherKeyboardShortcutAction:(int64_t)a3;
- (void)sceneHandle:(id)a3 didCreateScene:(id)a4;
- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5;
- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4 forPartWithIdentifier:(id)a5;
- (void)setApplicationSceneStatusBarDelegate:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBlurViewIconScale:(double)a3;
- (void)setContentReferenceSize:(CGSize)a3 withContentOrientation:(int64_t)a4 andContainerOrientation:(int64_t)a5;
- (void)setCustomContentView:(id)a3;
- (void)setDarkenViewAlpha:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayMode:(int64_t)a3 animationFactory:(id)a4 completion:(id)a5;
- (void)setDropInteraction:(id)a3;
- (void)setHomeGrabberDisplayMode:(int64_t)a3;
- (void)setHomeGrabberPillSettings:(id)a3;
- (void)setLayoutRole:(int64_t)a3 spaceConfiguration:(int64_t)a4 floatingConfiguration:(int64_t)a5 sizingPolicy:(int64_t)a6;
- (void)setLiveContentBlurEnabled:(BOOL)a3 duration:(double)a4 blurDelay:(double)a5 iconViewScale:(double)a6 began:(id)a7 completion:(id)a8;
- (void)setNubViewHidden:(BOOL)a3;
- (void)setNubViewHighlighted:(BOOL)a3;
- (void)setPlaceholderContentContext:(id)a3;
- (void)setSceneMinificationFilter:(id)a3;
- (void)setSceneRendersAsynchronously:(BOOL)a3;
- (void)setSceneResizesHostedContext:(BOOL)a3;
- (void)statusBarAssertionDidInvalidate:(id)a3;
- (void)topAffordanceViewController:(id)a3 handleActionType:(int64_t)a4;
- (void)topAffordanceViewControllerWillPresentMenu:(id)a3;
- (void)updateTopAffordanceContextMenu;
- (void)updateTopAffordanceOverrideUserInterfaceStyle;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
- (void)willRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 alongsideContainerView:(id)a5 animated:(BOOL)a6;
@end

@implementation SBMedusaDecoratedDeviceApplicationSceneViewController

- (SBMedusaDecoratedDeviceApplicationSceneViewController)initWithDeviceApplicationSceneHandle:(id)a3 layoutRole:(int64_t)a4
{
  id v6 = a3;
  v7 = +[SBWorkspace mainWorkspace];
  v8 = +[SBSetupManager sharedInstance];
  v9 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self initWithDeviceApplicationSceneHandle:v6 layoutRole:a4 workspace:v7 setupManager:v8];

  return v9;
}

- (SBMedusaDecoratedDeviceApplicationSceneViewController)initWithDeviceApplicationSceneHandle:(id)a3 layoutRole:(int64_t)a4 workspace:(id)a5 setupManager:(id)a6
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (([v12 isDeviceApplicationSceneHandle] & 1) == 0)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SBMedusaDecoratedDeviceApplicationSceneViewController.m", 135, @"Scene handle must be a device application scene handle, but was of type: %@", v12 object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)SBMedusaDecoratedDeviceApplicationSceneViewController;
  v15 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)&v25 initWithNibName:0 bundle:0];
  v16 = v15;
  if (v15)
  {
    v15->_layoutRole = a4;
    objc_storeStrong((id *)&v15->_workspace, a5);
    objc_storeStrong((id *)&v16->_setupManager, a6);
    objc_storeStrong((id *)&v16->_deviceApplicationSceneHandle, a3);
    [(SBDeviceApplicationSceneHandle *)v16->_deviceApplicationSceneHandle addObserver:v16];
    v17 = [(SBDeviceApplicationSceneHandle *)v16->_deviceApplicationSceneHandle statusBarStateProvider];
    [v17 addStatusBarObserver:v16];

    v16->_nubViewHidden = 1;
    v16->_nubViewHighlighted = 0;
    v16->_darkenViewAlpha = 0.0;
    uint64_t v18 = [v12 newSceneViewController];
    deviceApplicationSceneViewController = v16->_deviceApplicationSceneViewController;
    v16->_deviceApplicationSceneViewController = (SBDeviceApplicationSceneViewController *)v18;

    [(SBDeviceApplicationSceneViewController *)v16->_deviceApplicationSceneViewController setShouldDrawStatusBarInsideSceneView:1];
    [(SBDeviceApplicationSceneViewController *)v16->_deviceApplicationSceneViewController setDisplayMode:4 animationFactory:0 completion:0];
    [(SBDeviceApplicationSceneViewController *)v16->_deviceApplicationSceneViewController setDelegate:v16];
    uint64_t v20 = +[SBMedusaDomain rootSettings];
    medusaSettings = v16->_medusaSettings;
    v16->_medusaSettings = (SBMedusaSettings *)v20;

    v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:v16 selector:sel__elasticValueViewControllerWillPresent_ name:@"SBElasticValueViewControllerWillPresentNotificationName" object:0];
    [v22 addObserver:v16 selector:sel__elasticValueViewControllerWillDismiss_ name:@"SBElasticValueViewControllerWillDismissNotificationName" object:0];
    [v22 addObserver:v16 selector:sel__guidedAccessActivationChanged_ name:@"SBGuidedAccessActivationChangedNotification" object:0];
    [v22 addObserver:v16 selector:sel__hardwareKeyboardAvailabilityChanged_ name:@"SBHardwareKeyboardAvailabilityChangedNotification" object:0];
    [v22 addObserver:v16 selector:sel__medusaCapabilityChanged_ name:@"SBWorkspaceMedusaCapabilityChangedNotification" object:0];
    [v22 addObserver:v16 selector:sel__windowManagementStyleDidChange_ name:@"SBSwitcherControllerWindowManagementStyleDidChangeNotification" object:0];
    [(id)SBApp addActiveOrientationObserver:v16];
  }
  return v16;
}

- (void)dealloc
{
  [(id)SBApp removeActiveOrientationObserver:self];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(SBDeviceApplicationSceneHandle *)self->_deviceApplicationSceneHandle removeObserver:self];
  v4 = [(SBDeviceApplicationSceneHandle *)self->_deviceApplicationSceneHandle statusBarStateProvider];
  [v4 removeStatusBarObserver:self];

  [(UIApplicationSceneClientSettingsDiffInspector *)self->_applicationSceneClientSettingsDiffInspector removeAllObservers];
  v5.receiver = self;
  v5.super_class = (Class)SBMedusaDecoratedDeviceApplicationSceneViewController;
  [(SBMedusaDecoratedDeviceApplicationSceneViewController *)&v5 dealloc];
}

- (void)invalidate
{
}

- (BOOL)isBlurred
{
  return self->_isBlurred;
}

- (void)setLiveContentBlurEnabled:(BOOL)a3 duration:(double)a4 blurDelay:(double)a5 iconViewScale:(double)a6 began:(id)a7 completion:(id)a8
{
  BOOL v12 = a3;
  id v14 = (void (**)(void))a7;
  id v15 = a8;
  if (v14 && self->_isBlurred != v12) {
    v14[2](v14);
  }
  v16 = [MEMORY[0x1E4F4F898] factoryWithDuration:a4];
  if (v12)
  {
    if (!self->_isBlurred)
    {
      self->_isBlurred = 1;
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke;
      v55[3] = &unk_1E6AF6828;
      v55[4] = self;
      id v56 = v15;
      v17 = (void *)MEMORY[0x1D948C7A0](v55);
      uint64_t v18 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _blurContentView];

      if (v18)
      {
        v19 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _blurContentView];
        objc_msgSend(v19, "bs_setHitTestingDisabled:", 0);

        ++self->_blurViewAnimationCount;
        uint64_t v20 = (void *)MEMORY[0x1E4F4F898];
        id v51 = v17;
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke_3;
        v52[3] = &unk_1E6AF4AC0;
        v52[4] = self;
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke_4;
        v50[3] = &unk_1E6AF5A50;
        id v21 = v17;
        [v20 animateWithFactory:v16 options:4 actions:v52 completion:v50];
      }
      else
      {
        v26 = [(SBApplicationSceneHandle *)self->_deviceApplicationSceneHandle application];
        id v21 = [v26 bundleIdentifier];

        v27 = +[SBIconController sharedInstance];
        v28 = [v27 model];

        v29 = [(SBApplicationSceneHandle *)self->_deviceApplicationSceneHandle application];
        int v30 = [v29 isWebApplication];

        if (v30)
        {
          v31 = [(SBDeviceApplicationSceneHandle *)self->_deviceApplicationSceneHandle sceneIdentifier];
          v32 = +[SBWebApplication _webClipIdentifierFromWebAppIdentifier:v31];

          v33 = [v28 leafIconForIdentifier:v32];
        }
        else
        {
          v33 = [v28 applicationIconForBundleIdentifier:v21];
        }

        v34 = [SBApplicationBlurContentView alloc];
        [(UIView *)self->_blurViewContainerView bounds];
        double v36 = v35;
        double v38 = v37;
        double v40 = v39;
        double v42 = v41;
        v43 = [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController view];
        v44 = -[SBApplicationBlurContentView initWithFrame:bundleIdentifier:icon:targetViewToBlur:initialIconScale:](v34, "initWithFrame:bundleIdentifier:icon:targetViewToBlur:initialIconScale:", v21, v33, v43, v36, v38, v40, v42, a6);

        [(SBApplicationBlurContentView *)v44 setBlurDelay:a5];
        [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _setBlurContentView:v44];
        ++self->_blurViewAnimationCount;
        v45 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _blurContentView];
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke_2;
        v53[3] = &unk_1E6AF5300;
        id v54 = v17;
        id v46 = v17;
        [v45 generateAndAnimateToBlurredSnapshotWithAnimationFactory:v16 completion:v53];
      }
      objc_super v25 = v56;
      goto LABEL_15;
    }
  }
  else if (self->_isBlurred)
  {
    self->_isBlurred = 0;
    v22 = [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController view];
    [v22 setHidden:0];

    ++self->_disableAsyncRenderingCount;
    [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _updateAsyncRendering];
    v23 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _blurContentView];
    objc_msgSend(v23, "bs_setHitTestingDisabled:", 1);

    v24 = (void *)MEMORY[0x1E4F4F898];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke_5;
    v49[3] = &unk_1E6AF4AC0;
    v49[4] = self;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke_6;
    v47[3] = &unk_1E6AF5AA0;
    v47[4] = self;
    id v48 = v15;
    [v24 animateWithFactory:v16 options:4 actions:v49 completion:v47];
    objc_super v25 = v48;
LABEL_15:
  }
}

uint64_t __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 1080);
  BOOL v4 = v3 < 1;
  uint64_t v5 = v3 - 1;
  if (!v4)
  {
    *(void *)(v2 + 1080) = v5;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v2 + 1064) && !*(void *)(v2 + 1080))
  {
    id v6 = [*(id *)(v2 + 1000) view];
    [v6 setHidden:1];

    [*(id *)(a1 + 32) _updateAsyncRendering];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

uint64_t __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _blurContentView];
  [v1 setAlpha:1.0];
}

uint64_t __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _blurContentView];
  [v1 setAlpha:0.0];
}

uint64_t __133__SBMedusaDecoratedDeviceApplicationSceneViewController_setLiveContentBlurEnabled_duration_blurDelay_iconViewScale_began_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 1064))
  {
    [(id)v2 _setBlurContentView:0];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  --*(void *)(v2 + 1104);
  [*(id *)(a1 + 32) _updateAsyncRendering];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (double)blurViewIconScale
{
  uint64_t v2 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _blurContentView];
  [v2 iconViewScale];
  double v4 = v3;

  return v4;
}

- (void)setBlurViewIconScale:(double)a3
{
  id v4 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _blurContentView];
  [v4 setIconViewScale:a3];
}

- (void)performSwitcherKeyboardShortcutAction:(int64_t)a3
{
  double v3 = self;
  switch(a3)
  {
    case 7:
      topAffordanceViewController = self->_topAffordanceViewController;
      if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
        uint64_t v5 = 2;
      }
      else {
        uint64_t v5 = 1;
      }
      goto LABEL_8;
    case 8:
      topAffordanceViewController = self->_topAffordanceViewController;
      if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
        uint64_t v5 = 1;
      }
      else {
        uint64_t v5 = 2;
      }
LABEL_8:
      self = v3;
      id v6 = topAffordanceViewController;
      uint64_t v7 = 5;
      goto LABEL_21;
    case 11:
      id v6 = self->_topAffordanceViewController;
      uint64_t v7 = 1;
      goto LABEL_20;
    case 12:
      [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _handleSplitHomeScreenSwitcherKeyShortcut];
      return;
    case 13:
      v8 = self->_topAffordanceViewController;
      if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
        uint64_t v7 = 4;
      }
      else {
        uint64_t v7 = 3;
      }
      goto LABEL_19;
    case 14:
      v8 = self->_topAffordanceViewController;
      if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
        uint64_t v7 = 3;
      }
      else {
        uint64_t v7 = 4;
      }
LABEL_19:
      self = v3;
      id v6 = v8;
LABEL_20:
      uint64_t v5 = 0;
LABEL_21:
      [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _topAffordanceViewController:v6 handleActionType:v7 desiredFloatingConfiguration:v5 transitionSource:51];
      return;
    case 17:
      v9 = self->_topAffordanceViewController;
      uint64_t v10 = 9;
      goto LABEL_28;
    case 18:
      v9 = self->_topAffordanceViewController;
      uint64_t v10 = 12;
      goto LABEL_28;
    case 19:
      v9 = self->_topAffordanceViewController;
      uint64_t v10 = 13;
      goto LABEL_28;
    case 20:
      v9 = self->_topAffordanceViewController;
      uint64_t v10 = 14;
LABEL_28:
      [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _topAffordanceViewController:v9 handleActionType:v10 transitionSource:51];
      break;
    default:
      return;
  }
}

- (void)setLayoutRole:(int64_t)a3 spaceConfiguration:(int64_t)a4 floatingConfiguration:(int64_t)a5 sizingPolicy:(int64_t)a6
{
  self->_layoutRole = a3;
  self->_spaceConfiguration = a4;
  self->_floatingConfiguration = a5;
  v8 = [(SBDeviceApplicationSceneHandle *)self->_deviceApplicationSceneHandle _windowScene];
  id v15 = [v8 switcherController];

  v9 = [(SBApplicationSceneHandle *)self->_deviceApplicationSceneHandle application];
  uint64_t v10 = [v15 windowManagementStyle];
  v11 = [(SBDeviceApplicationSceneHandle *)self->_deviceApplicationSceneHandle sceneIfExists];
  BOOL v12 = [v11 settings];
  id v13 = objc_msgSend(v12, "sb_displayIdentityForSceneManagers");
  unint64_t v14 = objc_msgSend(v9, "supportedSizingPoliciesForSwitcherWindowManagementStyle:displayIdentity:contentOrientation:containerOrientation:", v10, v13, -[SBDeviceApplicationSceneHandle currentInterfaceOrientation](self->_deviceApplicationSceneHandle, "currentInterfaceOrientation"), objc_msgSend(v15, "interfaceOrientation"));

  self->_isZoomed = SBDisplayItemSizingPolicyAllowingLargestSize(v14) == a6;
  [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _updateTopAffordanceHighlight];
  [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self updateTopAffordanceContextMenu];
}

- (id)hitTestToTopAffordance:(CGPoint)a3 window:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  topAffordanceViewController = self->_topAffordanceViewController;
  id v7 = a4;
  v8 = [(SBTopAffordanceViewController *)topAffordanceViewController dotsView];
  v9 = [v7 screen];
  uint64_t v10 = [v9 fixedCoordinateSpace];

  objc_msgSend(v7, "convertPoint:toCoordinateSpace:", v10, x, y);
  double v12 = v11;
  double v14 = v13;

  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v10, v12, v14);
  id v15 = objc_msgSend(v8, "hitTest:withEvent:", 0);

  return v15;
}

- (void)updateTopAffordanceContextMenu
{
  topAffordanceViewController = self->_topAffordanceViewController;
  int64_t layoutRole = self->_layoutRole;
  int64_t spaceConfiguration = self->_spaceConfiguration;
  int64_t floatingConfiguration = self->_floatingConfiguration;
  int64_t v7 = [(SBDeviceApplicationSceneHandle *)self->_deviceApplicationSceneHandle currentInterfaceOrientation];
  BOOL isZoomed = self->_isZoomed;
  [(SBTopAffordanceViewController *)topAffordanceViewController updateContextMenuWithLayoutRole:layoutRole spaceConfiguration:spaceConfiguration floatingConfiguration:floatingConfiguration interfaceOrientation:v7 isZoomed:isZoomed];
}

- (void)willRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 alongsideContainerView:(id)a5 animated:(BOOL)a6
{
}

- (id)prepareForContentRotation
{
  return [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController prepareForContentRotation];
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4
{
}

- (SBMedusaDecoratedDeviceApplicationSceneViewController)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  id v6 = a3;
  int64_t v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v4 raise:v5, @"%@ does not support unarchiving from a nib.", v8 format];

  v11.receiver = self;
  v11.super_class = (Class)SBMedusaDecoratedDeviceApplicationSceneViewController;
  v9 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)&v11 initWithCoder:v6];

  return v9;
}

- (SBDeviceApplicationSceneHandle)sceneHandle
{
  return self->_deviceApplicationSceneHandle;
}

- (int64_t)displayMode
{
  return [(SBSceneViewController *)self->_deviceApplicationSceneViewController displayMode];
}

- (SBScenePlaceholderContentContext)placeholderContentContext
{
  return [(SBSceneViewController *)self->_deviceApplicationSceneViewController placeholderContentContext];
}

- (void)setPlaceholderContentContext:(id)a3
{
}

- (SBApplicationSceneBackgroundView)backgroundView
{
  return [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController backgroundView];
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)customContentView
{
  return [(SBSceneViewController *)self->_deviceApplicationSceneViewController customContentView];
}

- (void)setCustomContentView:(id)a3
{
}

- (id)newSnapshot
{
  return [(SBSceneViewController *)self->_deviceApplicationSceneViewController newSnapshot];
}

- (id)newSnapshotView
{
  return [(SBSceneViewController *)self->_deviceApplicationSceneViewController newSnapshotView];
}

- (void)newSnapshotViewOnQueue:(id)a3 withCompletion:(id)a4
{
  deviceApplicationSceneViewController = self->_deviceApplicationSceneViewController;
  if (deviceApplicationSceneViewController) {
    [(SBSceneViewController *)deviceApplicationSceneViewController newSnapshotViewOnQueue:a3 withCompletion:a4];
  }
  else {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (CGSize)contentReferenceSize
{
  [(SBSceneViewController *)self->_deviceApplicationSceneViewController contentReferenceSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)contentOrientation
{
  return [(SBSceneViewController *)self->_deviceApplicationSceneViewController contentOrientation];
}

- (int64_t)containerOrientation
{
  return [(SBSceneViewController *)self->_deviceApplicationSceneViewController containerOrientation];
}

- (void)setContentReferenceSize:(CGSize)a3 withContentOrientation:(int64_t)a4 andContainerOrientation:(int64_t)a5
{
  -[SBSceneViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_deviceApplicationSceneViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", a4, a5, a3.width, a3.height);
  id v6 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self view];
  [v6 setNeedsLayout];

  id v7 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self view];
  [v7 layoutIfNeeded];
}

- (void)setDisplayMode:(int64_t)a3 animationFactory:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  deviceApplicationSceneViewController = self->_deviceApplicationSceneViewController;
  if (deviceApplicationSceneViewController)
  {
    objc_initWeak(&location, deviceApplicationSceneViewController);
    double v12 = self->_deviceApplicationSceneViewController;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __100__SBMedusaDecoratedDeviceApplicationSceneViewController_setDisplayMode_animationFactory_completion___block_invoke;
    v13[3] = &unk_1E6B08340;
    v13[4] = self;
    objc_copyWeak(&v15, &location);
    id v14 = v10;
    [(SBDeviceApplicationSceneViewController *)v12 setDisplayMode:a3 animationFactory:v8 completion:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

uint64_t __100__SBMedusaDecoratedDeviceApplicationSceneViewController_setDisplayMode_animationFactory_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) displayMode] != 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained setCustomContentView:0];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)containerContentWrapperInterfaceOrientationChangedTo:(int64_t)a3
{
}

- (SBHomeGrabberView)homeGrabberView
{
  double v2 = [(SBSceneViewController *)self->_deviceApplicationSceneViewController _sceneView];
  double v3 = [v2 homeGrabberView];

  return (SBHomeGrabberView *)v3;
}

- (int64_t)bestHomeAffordanceOrientationForOrientation:(int64_t)a3
{
  return [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController bestHomeAffordanceOrientationForOrientation:a3];
}

- (double)statusBarAlpha
{
  [(SBApplicationSceneViewController *)self->_deviceApplicationSceneViewController statusBarAlpha];
  return result;
}

- (int64_t)overrideStatusBarStyle
{
  return [(SBApplicationSceneViewController *)self->_deviceApplicationSceneViewController overrideStatusBarStyle];
}

- (void)setApplicationSceneStatusBarDelegate:(id)a3
{
}

- (SBApplicationSceneViewControllingStatusBarDelegate)applicationSceneStatusBarDelegate
{
  return [(SBApplicationSceneViewController *)self->_deviceApplicationSceneViewController applicationSceneStatusBarDelegate];
}

- (int64_t)leadingStatusBarStyle
{
  return [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController leadingStatusBarStyle];
}

- (int64_t)trailingStatusBarStyle
{
  return [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController trailingStatusBarStyle];
}

- (id)backgroundActivitiesToSuppress
{
  return [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController backgroundActivitiesToSuppress];
}

- (double)currentStatusBarHeight
{
  [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController currentStatusBarHeight];
  return result;
}

- (UIView)sceneContentView
{
  return [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController sceneContentView];
}

- (void)containerDidUpdateTraitsParticipant:(id)a3
{
}

- (BOOL)SB_conformsToMedusaDecoratedDeviceApplicationSceneViewControlling
{
  return 1;
}

- (BOOL)SB_conformsToSceneLayoutStatusBarAssertionProviding
{
  return 1;
}

- (BOOL)SB_conformsToSceneLayoutMedusaStatusBarAssertionProviding
{
  return 1;
}

- (id)statusBarAssertionWithStatusBarHidden:(BOOL)a3 atLevel:(unint64_t)a4
{
  return [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self statusBarAssertionWithStatusBarHidden:a3 nubViewHidden:0x7FFFFFFFFFFFFFFFLL atLevel:a4];
}

- (id)statusBarAssertionWithStatusBarHidden:(BOOL)a3 nubViewHidden:(int64_t)a4 atLevel:(unint64_t)a5
{
  BOOL v7 = a3;
  if (!self->_statusBarAssertions)
  {
    id v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    statusBarAssertions = self->_statusBarAssertions;
    self->_statusBarAssertions = v9;
  }
  objc_super v11 = [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController statusBarAssertionWithStatusBarHidden:v7 atLevel:a5];
  [v11 setNubViewHidden:a4];
  [v11 addObserver:self];
  [(NSHashTable *)self->_statusBarAssertions addObject:v11];
  [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _updateCurrentTopAffordanceAlpha];
  return v11;
}

- (void)statusBarAssertionDidInvalidate:(id)a3
{
  [(NSHashTable *)self->_statusBarAssertions removeObject:a3];
  [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _updateCurrentTopAffordanceAlpha];
}

- (void)_updateCurrentTopAffordanceAlpha
{
  if ([(NSHashTable *)self->_statusBarAssertions count])
  {
    double v3 = [(NSHashTable *)self->_statusBarAssertions allObjects];
    id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_273];

    uint64_t v5 = [v4 lastObject];
    if ([v5 nubViewHidden] == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t nubViewHidden = self->_nubViewHidden;
    }
    else {
      uint64_t nubViewHidden = BSSettingFlagIsYes();
    }
  }
  else
  {
    uint64_t nubViewHidden = self->_nubViewHidden;
  }
  uint64_t v7 = [MEMORY[0x1E4F42FF0] _isInAnimationBlockWithAnimationsEnabled];
  topAffordanceViewController = self->_topAffordanceViewController;
  [(SBTopAffordanceViewController *)topAffordanceViewController setHidden:nubViewHidden forReason:@"MedusaDecoratedVC" animated:v7];
}

uint64_t __89__SBMedusaDecoratedDeviceApplicationSceneViewController__updateCurrentTopAffordanceAlpha__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(a2, "level"));
  uint64_t v7 = NSNumber;
  uint64_t v8 = [v5 level];

  id v9 = [v7 numberWithUnsignedInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

- (BOOL)isNubViewHidden
{
  return self->_nubViewHidden;
}

- (void)setNubViewHidden:(BOOL)a3
{
  if (self->_nubViewHidden != a3)
  {
    self->_uint64_t nubViewHidden = a3;
    [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _updateCurrentTopAffordanceAlpha];
  }
}

- (BOOL)isNubViewHighlighted
{
  return self->_nubViewHighlighted;
}

- (void)setNubViewHighlighted:(BOOL)a3
{
  if (self->_nubViewHighlighted != a3)
  {
    self->_nubViewHighlighted = a3;
    [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _updateTopAffordanceHighlight];
  }
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController layoutStateTransitionCoordinator:v11 transitionDidBeginWithTransitionContext:v6];
  }
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v6 toLayoutState];
  id v9 = SBSafeCast(v7, v8);

  if (SBSpaceConfigurationIsSplitView([v9 spaceConfiguration])
    && SBFloatingConfigurationIsValid([v9 floatingConfiguration])
    && ((int64_t v10 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self layoutRole], v10 == 1)
     && self->_floatingConfiguration == 1
     || v10 == 2 && self->_floatingConfiguration == 2))
  {
    [(SBTopAffordanceViewController *)self->_topAffordanceViewController setHidden:1 forReason:@"MedusaDecoratedVCHidingForObscuringFloatingApp" animated:1];
    [(SBTopAffordanceViewController *)self->_topAffordanceViewController dismissAnimated:1];
  }
  else
  {
    [(SBTopAffordanceViewController *)self->_topAffordanceViewController setHidden:0 forReason:@"MedusaDecoratedVCHidingForObscuringFloatingApp" animated:1];
  }
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController layoutStateTransitionCoordinator:v7 transitionWillEndWithTransitionContext:v6];
  }
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController layoutStateTransitionCoordinator:v7 transitionDidEndWithTransitionContext:v6];
  }
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  id v5 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self topAffordanceView];
  id v6 = [(SBTopAffordanceViewController *)self->_topAffordanceViewController view];

  if (v5 == v6)
  {
    [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self updateTopAffordanceOverrideUserInterfaceStyle];
  }
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self topAffordanceView];
  double v12 = [(SBTopAffordanceViewController *)self->_topAffordanceViewController view];

  if (v11 == v12 && !self->_applicationSceneClientSettingsDiffInspector)
  {
    double v13 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F42768]);
    applicationSceneClientSettingsDiffInspector = self->_applicationSceneClientSettingsDiffInspector;
    self->_applicationSceneClientSettingsDiffInspector = v13;

    objc_initWeak(&location, self);
    id v15 = self->_applicationSceneClientSettingsDiffInspector;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __119__SBMedusaDecoratedDeviceApplicationSceneViewController_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke;
    v19 = &unk_1E6AF85E0;
    objc_copyWeak(&v20, &location);
    [(UIApplicationSceneClientSettingsDiffInspector *)v15 observeStatusBarStyleWithBlock:&v16];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  -[UIApplicationSceneClientSettingsDiffInspector inspectDiff:withContext:](self->_applicationSceneClientSettingsDiffInspector, "inspectDiff:withContext:", v9, 0, v16, v17, v18, v19);
}

void __119__SBMedusaDecoratedDeviceApplicationSceneViewController_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateTopAffordanceOverrideUserInterfaceStyle];
}

- (void)updateTopAffordanceOverrideUserInterfaceStyle
{
  id v6 = [(SBDeviceApplicationSceneHandle *)self->_deviceApplicationSceneHandle statusBarStateProvider];
  uint64_t v3 = [v6 statusBarStyleForPartWithIdentifier:*MEMORY[0x1E4F441A0]];
  if (v3 == 4) {
    uint64_t v3 = [v6 statusBarStyle];
  }
  topAffordanceViewController = self->_topAffordanceViewController;
  if ((v3 & 0x3F) != 0)
  {
    [(SBTopAffordanceViewController *)topAffordanceViewController setLumaTrackingEnabled:0];
    if (_SBStatusBarColorStyleFromStyle(v3) == 2) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 2;
    }
    [(SBTopAffordanceViewController *)self->_topAffordanceViewController setOverrideUserInterfaceStyle:v5];
  }
  else
  {
    [(SBTopAffordanceViewController *)topAffordanceViewController setLumaTrackingEnabled:1];
  }
}

- (void)topAffordanceViewController:(id)a3 handleActionType:(int64_t)a4
{
  id v6 = a3;
  if ([(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _isChamoisWindowingUIEnabled])
  {
    [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _topAffordanceViewController:v6 handleActionType:a4 transitionSource:50];
  }
  else
  {
    [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _topAffordanceViewController:v6 handleActionType:a4 desiredFloatingConfiguration:0 transitionSource:50];
  }
}

- (void)_topAffordanceViewController:(id)a3 handleActionType:(int64_t)a4 transitionSource:(int64_t)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(SBDeviceApplicationSceneHandle *)self->_deviceApplicationSceneHandle _windowScene];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke;
  v26[3] = &unk_1E6AF5290;
  id v10 = v9;
  id v27 = v10;
  v28 = self;
  id v11 = (void (**)(void))MEMORY[0x1D948C7A0](v26);
  switch(a4)
  {
    case 9:
      if (self->_isZoomed) {
        goto LABEL_13;
      }
      double v12 = SBLogTopAffordance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v30 = 9;
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Dismissing top affordance after context menu item %ld pressed", buf, 0xCu);
      }

      [v8 dismissAnimated:1];
      double v13 = +[SBWorkspace mainWorkspace];
      id v14 = [v10 _fbsDisplayConfiguration];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_63;
      v23[3] = &unk_1E6B02178;
      int64_t v25 = a5;
      v23[4] = self;
      id v24 = v10;
      [v13 requestTransitionWithOptions:0 displayConfiguration:v14 builder:v23 validator:0];

      break;
    case 12:
      id v15 = SBLogTopAffordance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v30 = 12;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Dismissing top affordance after context menu item %ld pressed", buf, 0xCu);
      }

      [v8 dismissAnimated:1];
      uint64_t v16 = +[SBWorkspace mainWorkspace];
      uint64_t v17 = [v10 _fbsDisplayConfiguration];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_67;
      v22[3] = &__block_descriptor_40_e42_v16__0__SBMainWorkspaceTransitionRequest_8l;
      v22[4] = a5;
      [v16 requestTransitionWithOptions:0 displayConfiguration:v17 builder:v22 validator:0];

      break;
    case 13:
      uint64_t v18 = SBLogTopAffordance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v30 = 13;
        _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "Dismissing top affordance after context menu item %ld pressed", buf, 0xCu);
      }

      [v8 dismissAnimated:1];
      v19 = +[SBWorkspace mainWorkspace];
      id v20 = [v10 _fbsDisplayConfiguration];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_71;
      v21[3] = &unk_1E6AFF458;
      v21[4] = self;
      v21[5] = a5;
      [v19 requestTransitionWithOptions:0 displayConfiguration:v20 builder:v21 validator:0];

      break;
    case 14:
      if (![(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _topAffordanceViewControllerHandleMoveToDisplayAction:v8 transitionSource:a5])goto LABEL_13; {
      break;
      }
    case 17:
      [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _topAffordanceViewControllerHandleCloseAction];
      break;
    default:
LABEL_13:
      v11[2](v11);
      break;
  }
}

void __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke(uint64_t a1)
{
  double v2 = +[SBWorkspace mainWorkspace];
  uint64_t v3 = [*(id *)(a1 + 32) _fbsDisplayConfiguration];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_2;
  v4[3] = &unk_1E6AF57E8;
  v4[4] = *(void *)(a1 + 40);
  [v2 requestTransitionWithOptions:0 displayConfiguration:v3 builder:v4 validator:0];
}

void __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:57];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_3;
  v4[3] = &unk_1E6AF57C0;
  v4[4] = *(void *)(a1 + 32);
  [v3 modifyApplicationContext:v4];
}

void __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_4;
  v6[3] = &unk_1E6AF8788;
  id v7 = v3;
  id v4 = v3;
  SBLayoutRoleEnumerateValidRoles(v6);
  uint64_t v5 = objc_msgSend(v4, "entityForLayoutRole:", objc_msgSend(*(id *)(a1 + 32), "layoutRole"));
  [v5 setFlag:1 forActivationSetting:11];
}

void __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = +[SBWorkspaceEntity entity];
  [v3 setEntity:v4 forLayoutRole:a2];
}

void __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_63(void *a1, void *a2)
{
  uint64_t v3 = a1[6];
  id v4 = a2;
  [v4 setSource:v3];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_2_64;
  v6[3] = &unk_1E6AF5638;
  uint64_t v5 = (void *)a1[5];
  void v6[4] = a1[4];
  id v7 = v5;
  [v4 modifyApplicationContext:v6];
}

void __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_2_64(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationSceneHandle:*(void *)(*(void *)(a1 + 32) + 992)];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 992) _windowScene];
  id v6 = [v5 switcherController];
  char v7 = [v6 isAdditiveModelEnabled];

  if ((v7 & 1) == 0)
  {
    v20[0] = v4;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [v3 setEntities:v8 withPolicy:0 centerEntity:0 floatingEntity:0];
  }
  [v3 _setRequestedFrontmostEntity:v4];
  id v9 = *(void **)(*(void *)(a1 + 32) + 992);
  uint64_t v10 = [v9 currentInterfaceOrientation];
  id v11 = [*(id *)(a1 + 40) switcherController];
  unint64_t v12 = objc_msgSend(v9, "_supportedSizingPoliciesForContentOrientation:containerOrientation:", v10, objc_msgSend(v11, "interfaceOrientation"));

  uint64_t v13 = SBDisplayItemSizingPolicyAllowingLargestSize(v12);
  id v14 = [v3 requestedLayoutAttributesForEntity:v4];
  id v15 = [v14 attributesByModifyingSizingPolicy:v13];

  uint64_t v16 = objc_msgSend(v15, "attributesByModifyingAttributedSize:", v19, SBDisplayItemAttributedSizeUnspecified((uint64_t)v19).n128_f64[0]);

  uint64_t v17 = objc_msgSend(v16, "attributesByModifyingAttributedUserSizeBeforeOverlapping:", v18, SBDisplayItemAttributedSizeUnspecified((uint64_t)v18).n128_f64[0]);

  [v3 setRequestedLayoutAttributes:v17 forEntity:v4];
  [v3 setFencesAnimations:1];
}

void __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_67(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setSource:v2];
  [v3 modifyApplicationContext:&__block_literal_global_70_4];
}

uint64_t __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_2_68(uint64_t a1, void *a2)
{
  return [a2 setRequestedPeekConfiguration:2];
}

void __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_71(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 setSource:v3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_2_72;
  v5[3] = &unk_1E6AF57C0;
  v5[4] = *(void *)(a1 + 32);
  [v4 modifyApplicationContext:v5];
}

void __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_2_72(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  uint64_t v9 = 0;
  uint64_t v9 = [*(id *)(a1 + 32) layoutRole];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_3_73;
  v5[3] = &unk_1E6B047E8;
  v5[4] = *(void *)(a1 + 32);
  id v4 = v3;
  id v6 = v4;
  char v7 = v8;
  SBLayoutRoleEnumerateValidRoles(v5);

  _Block_object_dispose(v8, 8);
}

void __120__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_transitionSource___block_invoke_3_73(uint64_t a1, uint64_t a2)
{
  if (a2 != 3 && a2 != 4)
  {
    if ([*(id *)(a1 + 32) layoutRole] <= a2)
    {
      if ([*(id *)(a1 + 32) layoutRole] != a2 && objc_msgSend(*(id *)(a1 + 32), "layoutRole") < a2)
      {
        id v6 = *(void **)(a1 + 40);
        char v7 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:a2];
        [v6 setEntity:v7 forLayoutRole:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];

        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
      }
    }
    else
    {
      uint64_t v5 = *(void **)(a1 + 40);
      id v8 = +[SBWorkspaceEntity entity];
      [v5 setEntity:v8 forLayoutRole:a2];
    }
  }
}

- (void)_topAffordanceViewController:(id)a3 handleActionType:(int64_t)a4 desiredFloatingConfiguration:(int64_t)a5 transitionSource:(int64_t)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self spaceConfiguration];
  int64_t v11 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self layoutRole];
  unint64_t v12 = [(UIViewController *)self _sbWindowScene];
  uint64_t v13 = [v12 _fbsDisplayConfiguration];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke;
  v26[3] = &unk_1E6AF7748;
  int64_t v29 = a6;
  id v14 = v9;
  id v27 = v14;
  id v15 = v13;
  id v28 = v15;
  int64_t v30 = v11;
  uint64_t v16 = (void (**)(void))MEMORY[0x1D948C7A0](v26);
  if (a4 == 1 && v10 == 1 && v11 == 1
    || a4 == 5 && a6 != 51 && v11 == 3
    || (BOOL IsSplitView = SBSpaceConfigurationIsSplitView(v10), a4 == 4) && IsSplitView && v11 == 2
    || (BOOL v18 = SBSpaceConfigurationIsSplitView(v10), a4 == 3) && v18 && v11 == 1)
  {
LABEL_13:
    v16[2](v16);
    goto LABEL_14;
  }
  if (a4 == 17)
  {
    [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _topAffordanceViewControllerHandleCloseAction];
    goto LABEL_14;
  }
  if (a4 == 14)
  {
    if ([(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _topAffordanceViewControllerHandleMoveToDisplayAction:v14 transitionSource:a6])
    {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v19 = SBLogTopAffordance();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v23 = [NSNumber numberWithInteger:a4];
    id v20 = [NSNumber numberWithInteger:v10];
    id v21 = [NSNumber numberWithInteger:v11];
    *(_DWORD *)buf = 138412802;
    v32 = v23;
    __int16 v33 = 2112;
    v34 = v20;
    __int16 v35 = 2112;
    double v36 = v21;
    _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "Top affordance dismiss after button %@ pressed, space configuration: %@, layout role: %@", buf, 0x20u);
  }
  [v14 dismissAnimated:1];
  v22 = +[SBWorkspace mainWorkspace];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke_75;
  v25[3] = &unk_1E6B08390;
  v25[4] = self;
  v25[5] = a6;
  v25[6] = a4;
  v25[7] = a5;
  [v22 requestTransitionWithOptions:0 displayConfiguration:v15 builder:v25 validator:0];

  if (a6 != 51) {
    [v14 _emitAnalyticsEventForMenuInteraction:a4];
  }
LABEL_14:
}

void __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48) != 51) {
    [*(id *)(a1 + 32) _emitAnalyticsEventForMenuInteraction:19];
  }
  uint64_t v2 = +[SBWorkspace mainWorkspace];
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke_2;
  v4[3] = &__block_descriptor_40_e42_v16__0__SBMainWorkspaceTransitionRequest_8l;
  v4[4] = *(void *)(a1 + 56);
  [v2 requestTransitionWithOptions:0 displayConfiguration:v3 builder:v4 validator:0];
}

void __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:57];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke_3;
  v4[3] = &__block_descriptor_40_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
  v4[4] = *(void *)(a1 + 32);
  [v3 modifyApplicationContext:v4];
}

void __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke_4;
  v6[3] = &unk_1E6AF8788;
  id v7 = v3;
  id v4 = v3;
  SBLayoutRoleEnumerateValidRoles(v6);
  uint64_t v5 = [v4 entityForLayoutRole:*(void *)(a1 + 32)];
  [v5 setFlag:1 forActivationSetting:11];
}

void __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = +[SBWorkspaceEntity entity];
  [v3 setEntity:v4 forLayoutRole:a2];
}

void __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke_75(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 setSource:v3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke_2_76;
  v5[3] = &unk_1E6B08368;
  v5[4] = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 48);
  [v4 modifyApplicationContext:v5];
}

void __149__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewController_handleActionType_desiredFloatingConfiguration_transitionSource___block_invoke_2_76(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  objc_msgSend(v3, "_modifyApplicationContext:handleActionType:spaceConfiguration:layoutRole:desiredFloatingConfiguration:", v5, v4, objc_msgSend(v3, "spaceConfiguration"), objc_msgSend(*(id *)(a1 + 32), "layoutRole"), *(void *)(a1 + 48));
}

- (BOOL)_topAffordanceViewControllerHandleMoveToDisplayAction:(id)a3 transitionSource:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(id)SBApp windowSceneManager];
  id v8 = [v7 connectedWindowScenes];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __128__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleMoveToDisplayAction_transitionSource___block_invoke;
  v17[3] = &unk_1E6AFBF38;
  v17[4] = self;
  id v9 = objc_msgSend(v8, "bs_firstObjectPassingTest:", v17);

  if (v9)
  {
    uint64_t v10 = SBLogTopAffordance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = 14;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Dismissing top affordance after context menu item %ld pressed", buf, 0xCu);
    }

    [v6 dismissAnimated:1];
    int64_t v11 = +[SBWorkspace mainWorkspace];
    unint64_t v12 = [v9 _fbsDisplayConfiguration];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __128__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleMoveToDisplayAction_transitionSource___block_invoke_78;
    v14[3] = &unk_1E6B02178;
    int64_t v16 = a4;
    v14[4] = self;
    id v15 = v9;
    [v11 requestTransitionWithOptions:0 displayConfiguration:v12 builder:v14 validator:0];
  }
  return v9 != 0;
}

uint64_t __128__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleMoveToDisplayAction_transitionSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 _sbWindowScene];
  int v5 = [v3 isEqual:v4];

  return v5 ^ 1u;
}

void __128__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleMoveToDisplayAction_transitionSource___block_invoke_78(void *a1, void *a2)
{
  uint64_t v3 = a1[6];
  id v4 = a2;
  [v4 setSource:v3];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __128__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleMoveToDisplayAction_transitionSource___block_invoke_2;
  v6[3] = &unk_1E6AF5638;
  int v5 = (void *)a1[5];
  void v6[4] = a1[4];
  id v7 = v5;
  [v4 modifyApplicationContext:v6];
}

void __128__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleMoveToDisplayAction_transitionSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [SBDeviceApplicationSceneEntity alloc];
  int v5 = [*(id *)(*(void *)(a1 + 32) + 992) application];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 992) sceneIdentifier];
  id v7 = [*(id *)(a1 + 40) sceneManager];
  id v8 = [*(id *)(a1 + 40) _fbsDisplayIdentity];
  id v9 = [(SBDeviceApplicationSceneEntity *)v4 initWithApplication:v5 uniqueIdentifier:v6 sceneHandleProvider:v7 displayIdentity:v8];

  [v3 setRequestedUnlockedEnvironmentMode:3];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __128__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleMoveToDisplayAction_transitionSource___block_invoke_3;
  v12[3] = &unk_1E6B002B8;
  id v13 = v3;
  id v14 = v9;
  uint64_t v10 = v9;
  id v11 = v3;
  SBLayoutRoleEnumerateValidRoles(v12);
}

void __128__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleMoveToDisplayAction_transitionSource___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2 == 1)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(void **)(a1 + 32);
    [v5 setEntity:v4 forLayoutRole:1];
  }
  else
  {
    id v6 = +[SBWorkspaceEntity entity];
    [v3 setEntity:v6 forLayoutRole:a2];
  }
}

- (void)_topAffordanceViewControllerHandleCloseAction
{
  SBApplicationSceneEntityDestructionMakeIntent(1, 1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:self->_deviceApplicationSceneHandle];
  SBWorkspaceDestroyApplicationSceneHandlesWithIntent(v3, v4, &__block_literal_global_83_0);
}

void __102__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleCloseAction__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = SBLogAppSwitcher();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __102__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleCloseAction__block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
}

- (void)_modifyApplicationContext:(id)a3 handleActionType:(int64_t)a4 spaceConfiguration:(int64_t)a5 layoutRole:(int64_t)a6 desiredFloatingConfiguration:(int64_t)a7
{
  id v11 = a3;
  unint64_t v12 = [v11 previousLayoutState];
  uint64_t v13 = objc_opt_class();
  id v14 = SBSafeCast(v13, v12);
  id v15 = v14;
  if (!v14)
  {
    uint64_t v20 = SBLogAppSwitcher();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SBMedusaDecoratedDeviceApplicationSceneViewController _modifyApplicationContext:handleActionType:spaceConfiguration:layoutRole:desiredFloatingConfiguration:](v12, v20);
    }
    goto LABEL_35;
  }
  if (a4 != 5)
  {
    if (a4 != 2)
    {
      if (a4 == 1)
      {
        int64_t v16 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:a6];
        uint64_t v17 = +[SBWorkspaceEntity entity];
        BOOL v18 = +[SBWorkspaceEntity entity];
        if (a6 == 3)
        {
          uint64_t v19 = +[SBWorkspaceEntity entity];

          BOOL v18 = (void *)v19;
        }
        [v11 setRequestedSpaceConfiguration:1];
        [v11 setEntity:v16 forLayoutRole:1];
        [v11 setEntity:v17 forLayoutRole:2];
        [v11 setEntity:v18 forLayoutRole:3];

        goto LABEL_36;
      }
      if ((unint64_t)(a4 - 3) > 1) {
        goto LABEL_36;
      }
      int64_t v25 = +[SBWorkspaceEntity entity];
      v60 = +[SBWorkspaceEntity entity];
      v59 = +[SBWorkspaceEntity entity];
      v26 = +[SBWorkspaceEntity entity];
      if (a6 == 1)
      {
        if (a5 == 1)
        {
          if (a4 == 3) {
            uint64_t v27 = 2;
          }
          else {
            uint64_t v27 = 3;
          }
          [v11 setRequestedPeekConfiguration:v27];
          uint64_t v28 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:1];

          int64_t v29 = +[SBWorkspaceEntity entity];

          uint64_t v30 = 3;
          int64_t v25 = (void *)v28;
          goto LABEL_86;
        }
        uint64_t v30 = [v15 spaceConfiguration];
        if (a4 == 4)
        {
          a6 = 2;
          v49 = v59;
LABEL_88:
          uint64_t v57 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:a6];

          int64_t v29 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:1];

          uint64_t v58 = 2;
          if (v30 != 4) {
            uint64_t v58 = v30;
          }
          if (v30 == 2) {
            uint64_t v30 = 4;
          }
          else {
            uint64_t v30 = v58;
          }
          int64_t v25 = (void *)v57;
          goto LABEL_94;
        }
        [v11 setRequestedPeekConfiguration:2];
      }
      else
      {
        if (a5 != 1 && a6 != 2)
        {
          uint64_t v46 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:a6];
          if (a4 == 3) {
            v47 = v25;
          }
          else {
            v47 = v60;
          }
          if (a4 == 3)
          {
            int64_t v25 = (void *)v46;
            int64_t v29 = v60;
          }
          else
          {
            int64_t v29 = (void *)v46;
          }

          uint64_t v48 = +[SBWorkspaceEntity entity];
          v49 = v59;
          if (a6 == 3) {
            v50 = v59;
          }
          else {
            v50 = v26;
          }
          if (a6 == 3) {
            v49 = (void *)v48;
          }
          else {
            v26 = (void *)v48;
          }

          uint64_t v30 = [v15 spaceConfiguration];
          goto LABEL_94;
        }
        if (a5 == 1)
        {
          int64_t v29 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:a6];
          if (a4 == 3)
          {

            +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:1];
            v29 = int64_t v25 = v29;
          }

          v49 = +[SBWorkspaceEntity entity];
          if (a6 != 3)
          {

            uint64_t v30 = 3;
            v26 = v49;
LABEL_86:
            v49 = v59;
            goto LABEL_94;
          }

          uint64_t v30 = 3;
LABEL_94:
          [v11 setRequestedSpaceConfiguration:v30];
          [v11 setEntity:v25 forLayoutRole:1];
          [v11 setEntity:v29 forLayoutRole:2];
          [v11 setEntity:v49 forLayoutRole:3];
          [v11 setEntity:v26 forLayoutRole:4];

          goto LABEL_36;
        }
        uint64_t v30 = [v15 spaceConfiguration];
        if (a4 == 3 || a6 != 2)
        {
          v49 = v59;
          if (a6 == 2) {
            goto LABEL_88;
          }
          goto LABEL_78;
        }
        [v11 setRequestedPeekConfiguration:3];
        uint64_t v54 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:2];

        int64_t v25 = (void *)v54;
      }
      v49 = v59;
LABEL_78:
      int64_t v29 = +[SBWorkspaceEntity entity];

      goto LABEL_94;
    }
    switch(a6)
    {
      case 1:
        if (a5 == 1) {
          uint64_t v22 = 2;
        }
        else {
          uint64_t v22 = 3;
        }
        [v11 setRequestedSpaceConfiguration:3];
        [v11 setRequestedPeekConfiguration:v22];
        v23 = +[SBWorkspaceEntity entity];
        [v11 setEntity:v23 forLayoutRole:1];

        id v24 = +[SBWorkspaceEntity entity];
        [v11 setEntity:v24 forLayoutRole:2];

        break;
      case 2:
        [v11 setRequestedSpaceConfiguration:3];
        [v11 setRequestedPeekConfiguration:3];
        __int16 v35 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:2];
        [v11 setEntity:v35 forLayoutRole:1];

        double v36 = +[SBWorkspaceEntity entity];
        [v11 setEntity:v36 forLayoutRole:2];

        break;
      case 3:
        v61 = +[SBWorkspaceEntity entity];
        v62 = +[SBWorkspaceEntity entity];
        v43 = +[SBWorkspaceEntity entity];
        if ([v15 floatingConfiguration] == 2)
        {
          v44 = +[SBWorkspaceEntity entity];
          uint64_t v45 = 3;
        }
        else
        {
          v44 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:3];
          uint64_t v45 = 1;
        }

        v53 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:v45];

        [v11 setRequestedSpaceConfiguration:3];
        [v11 setEntity:v44 forLayoutRole:1];
        [v11 setEntity:v53 forLayoutRole:2];
        [v11 setEntity:v43 forLayoutRole:3];

        goto LABEL_36;
      case 4:
        [v11 setRequestedSpaceConfiguration:3];
        id v51 = +[SBWorkspaceEntity entity];
        [v11 setEntity:v51 forLayoutRole:1];

        v52 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:4];
        [v11 setEntity:v52 forLayoutRole:2];

        uint64_t v20 = +[SBWorkspaceEntity entity];
        uint64_t v37 = v11;
        double v38 = v20;
        goto LABEL_34;
      default:
        goto LABEL_36;
    }
    uint64_t v20 = +[SBWorkspaceEntity entity];
    uint64_t v37 = v11;
    double v38 = v20;
LABEL_34:
    [v37 setEntity:v38 forLayoutRole:3];
LABEL_35:

    goto LABEL_36;
  }
  if (a6 == 1)
  {
    if ([v14 spaceConfiguration] == 1)
    {
      if (a7 != 1)
      {
        if (a7 != 2)
        {
          if ([v15 floatingConfiguration] == 1)
          {
            [v11 setRequestedFloatingConfiguration:1];
            goto LABEL_16;
          }
          [v11 setRequestedFloatingConfiguration:2];
        }
        uint64_t v21 = 3;
        goto LABEL_81;
      }
LABEL_16:
      uint64_t v21 = 2;
LABEL_81:
      [v11 setRequestedPeekConfiguration:v21];
      v55 = +[SBWorkspaceEntity entity];
      [v11 setEntity:v55 forLayoutRole:1];

      v32 = +[SBWorkspaceEntity entity];
      __int16 v33 = v11;
      v34 = v32;
      goto LABEL_82;
    }
    [v11 setRequestedFloatingConfiguration:1];
    double v39 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:2];
    [v11 setEntity:v39 forLayoutRole:1];

    double v40 = SBEmptyWorkspaceEntity;
    goto LABEL_43;
  }
  if (a6 != 2)
  {
    if (a6 != 4) {
      goto LABEL_83;
    }
    if (([v14 floatingConfiguration] & 0xFFFFFFFFFFFFFFFDLL) == 1) {
      uint64_t v41 = 1;
    }
    else {
      uint64_t v41 = 2;
    }
    [v11 setRequestedFloatingConfiguration:v41];
    double v42 = +[SBWorkspaceEntity entity];
    [v11 setEntity:v42 forLayoutRole:1];

    double v40 = SBPreviousWorkspaceEntity;
LABEL_43:
    v32 = [(__objc2_class *)v40 entity];
    __int16 v33 = v11;
    v34 = v32;
    goto LABEL_82;
  }
  [v11 setRequestedFloatingConfiguration:2];
  uint64_t v31 = +[SBWorkspaceEntity entity];
  [v11 setEntity:v31 forLayoutRole:1];

  v32 = +[SBWorkspaceEntity entity];
  __int16 v33 = v11;
  v34 = v32;
LABEL_82:
  [v33 setEntity:v34 forLayoutRole:2];

  id v56 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:a6];
  [v11 setEntity:v56 forLayoutRole:3];

LABEL_83:
  if (a7) {
    [v11 setRequestedFloatingConfiguration:a7];
  }
LABEL_36:
}

- (void)topAffordanceViewControllerWillPresentMenu:(id)a3
{
  if (![(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _isChamoisWindowingUIEnabled])
  {
    id v4 = +[SBWorkspace mainWorkspace];
    int v5 = [(UIViewController *)self _sbWindowScene];
    id v6 = [v5 _fbsDisplayConfiguration];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __100__SBMedusaDecoratedDeviceApplicationSceneViewController_topAffordanceViewControllerWillPresentMenu___block_invoke_2;
    v7[3] = &unk_1E6AFBD00;
    v7[4] = self;
    [v4 requestTransitionWithOptions:0 displayConfiguration:v6 builder:&__block_literal_global_85 validator:v7];
  }
}

uint64_t __100__SBMedusaDecoratedDeviceApplicationSceneViewController_topAffordanceViewControllerWillPresentMenu___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) sceneHandle];
  int v5 = [v4 application];
  uint64_t v30 = [v5 bundleIdentifier];

  id v6 = [v4 sceneIdentifier];
  id v7 = [v3 applicationContext];
  id v8 = [v7 previousLayoutState];

  if ([*(id *)(a1 + 32) layoutRole] == 3)
  {
    objc_msgSend(v3, "modifyApplicationContext:", &__block_literal_global_87_1, v30);
    id v9 = [v8 elementWithRole:3];
    uint64_t v10 = [v9 workspaceEntity];
    id v11 = [v10 applicationSceneEntity];
    unint64_t v12 = [v11 sceneHandle];
    uint64_t v13 = [v12 sceneIdentifier];
    uint64_t v14 = [v13 isEqual:v6];

    goto LABEL_13;
  }
  if ([*(id *)(a1 + 32) layoutRole] == 2)
  {
    objc_msgSend(v3, "modifyApplicationContext:", &__block_literal_global_89_0, v30);
    id v15 = v8;
    uint64_t v16 = 2;
LABEL_8:
    BOOL v18 = [v15 elementWithRole:v16];
    uint64_t v19 = [v18 workspaceEntity];
    uint64_t v20 = [v19 applicationSceneEntity];
    uint64_t v21 = [v20 sceneHandle];
    uint64_t v22 = [v21 sceneIdentifier];
    uint64_t v14 = [v22 isEqual:v6];

    goto LABEL_13;
  }
  if ([*(id *)(a1 + 32) layoutRole] == 1)
  {
    uint64_t v17 = objc_msgSend(v8, "elementWithRole:", 2, v30);

    if (v17)
    {
      [v3 modifyApplicationContext:&__block_literal_global_91];
      id v15 = v8;
      uint64_t v16 = 1;
      goto LABEL_8;
    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "layoutRole", v30) == 1
    && ([v8 elementWithRole:2],
        v23 = objc_claimAutoreleasedReturnValue(),
        v23,
        !v23))
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __100__SBMedusaDecoratedDeviceApplicationSceneViewController_topAffordanceViewControllerWillPresentMenu___block_invoke_6;
    v31[3] = &unk_1E6AF57C0;
    id v32 = v30;
    [v3 modifyApplicationContext:v31];
    id v24 = [v8 elementWithRole:1];
    int64_t v25 = [v24 workspaceEntity];
    v26 = [v25 applicationSceneEntity];
    uint64_t v27 = [v26 sceneHandle];
    uint64_t v28 = [v27 sceneIdentifier];
    uint64_t v14 = [v28 isEqual:v6];
  }
  else
  {
    uint64_t v14 = 0;
  }
LABEL_13:

  return v14;
}

uint64_t __100__SBMedusaDecoratedDeviceApplicationSceneViewController_topAffordanceViewControllerWillPresentMenu___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setRequestedWindowPickerRole:3];
}

uint64_t __100__SBMedusaDecoratedDeviceApplicationSceneViewController_topAffordanceViewControllerWillPresentMenu___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setRequestedWindowPickerRole:2];
}

uint64_t __100__SBMedusaDecoratedDeviceApplicationSceneViewController_topAffordanceViewControllerWillPresentMenu___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 setRequestedWindowPickerRole:1];
}

uint64_t __100__SBMedusaDecoratedDeviceApplicationSceneViewController_topAffordanceViewControllerWillPresentMenu___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 setRequestedAppExposeBundleID:*(void *)(a1 + 32)];
}

- (void)activeInterfaceOrientationWillChangeToOrientation:(int64_t)a3
{
}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  if (self->_topAffordanceTapGestureRecognizer == a3
    && ([(SBMedusaDecoratedDeviceApplicationSceneViewController *)self topAffordanceView],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [(SBTopAffordanceViewController *)self->_topAffordanceViewController view],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v7 == v8))
  {
    id v11 = [(SBTopAffordanceViewController *)self->_topAffordanceViewController view];
    [v6 locationInView:v11];
    unint64_t v12 = objc_msgSend(v11, "hitTest:withEvent:", 0);
    BOOL v9 = v12 != 0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4 forPartWithIdentifier:(id)a5
{
  if (objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E4F441A0], a4))
  {
    [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self updateTopAffordanceOverrideUserInterfaceStyle];
  }
}

- (void)viewWillLayoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)SBMedusaDecoratedDeviceApplicationSceneViewController;
  [(SBMedusaDecoratedDeviceApplicationSceneViewController *)&v19 viewWillLayoutSubviews];
  id v3 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  unint64_t v12 = [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController view];
  if ([(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _sceneViewHasMatchMoveAnimation])
  {
    [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self contentReferenceSize];
    [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self contentOrientation];
    SBRectWithSize();
    uint64_t v17 = v12;
  }
  else
  {
    uint64_t v17 = v12;
    double v13 = v5;
    double v14 = v7;
    double v15 = v9;
    double v16 = v11;
  }
  objc_msgSend(v17, "setBounds:", v13, v14, v15, v16);
  UIRectGetCenter();
  objc_msgSend(v12, "setCenter:");
  BOOL v18 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _blurContentView];
  objc_msgSend(v18, "setFrame:", v5, v7, v9, v11);
}

- (void)loadView
{
  id v3 = [SBHitTestExtendedView alloc];
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v56 = -[SBHitTestExtendedView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self setView:v56];
  double v8 = -[SBHitTestExtendedView initWithFrame:]([SBHitTestExtendedView alloc], "initWithFrame:", v4, v5, v6, v7);
  containerView = self->_containerView;
  self->_containerView = &v8->super;

  [(UIView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SBHitTestExtendedView *)v56 addSubview:self->_containerView];
  double v10 = [(UIView *)self->_containerView leftAnchor];
  double v11 = [(SBHitTestExtendedView *)v56 leftAnchor];
  unint64_t v12 = [v10 constraintEqualToAnchor:v11];
  [v12 setActive:1];

  double v13 = [(UIView *)self->_containerView rightAnchor];
  double v14 = [(SBHitTestExtendedView *)v56 rightAnchor];
  double v15 = [v13 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  double v16 = [(UIView *)self->_containerView topAnchor];
  uint64_t v17 = [(SBHitTestExtendedView *)v56 topAnchor];
  BOOL v18 = [v16 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  objc_super v19 = [(UIView *)self->_containerView bottomAnchor];
  uint64_t v20 = [(SBHitTestExtendedView *)v56 bottomAnchor];
  uint64_t v21 = [v19 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  uint64_t v22 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self dropInteraction];
  if (v22) {
    [(UIView *)self->_containerView addInteraction:v22];
  }
  v23 = [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController view];
  [v23 setAutoresizingMask:0];

  [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self bs_addChildViewController:self->_deviceApplicationSceneViewController withSuperview:self->_containerView];
  id v24 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v4, v5, v6, v7);
  blurViewContainerView = self->_blurViewContainerView;
  self->_blurViewContainerView = v24;

  [(UIView *)self->_blurViewContainerView setUserInteractionEnabled:0];
  [(UIView *)self->_blurViewContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_containerView addSubview:self->_blurViewContainerView];
  v26 = [(UIView *)self->_blurViewContainerView leftAnchor];
  uint64_t v27 = [(UIView *)self->_containerView leftAnchor];
  uint64_t v28 = [v26 constraintEqualToAnchor:v27];
  [v28 setActive:1];

  int64_t v29 = [(UIView *)self->_blurViewContainerView rightAnchor];
  uint64_t v30 = [(UIView *)self->_containerView rightAnchor];
  uint64_t v31 = [v29 constraintEqualToAnchor:v30];
  [v31 setActive:1];

  id v32 = [(UIView *)self->_blurViewContainerView topAnchor];
  __int16 v33 = [(UIView *)self->_containerView topAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  [v34 setActive:1];

  __int16 v35 = [(UIView *)self->_blurViewContainerView bottomAnchor];
  double v36 = [(UIView *)self->_containerView bottomAnchor];
  uint64_t v37 = [v35 constraintEqualToAnchor:v36];
  [v37 setActive:1];

  [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _createOrDestroyTopAffordanceViewControllerAnimated:0];
  double v38 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v4, v5, v6, v7);
  darkenView = self->_darkenView;
  self->_darkenView = v38;

  double v40 = self->_darkenView;
  [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self darkenViewAlpha];
  -[UIView setAlpha:](v40, "setAlpha:");
  uint64_t v41 = self->_darkenView;
  double v42 = [MEMORY[0x1E4F428B8] colorWithRed:0.0274509806 green:0.0431372561 blue:0.0666666701 alpha:0.5];
  [(UIView *)v41 setBackgroundColor:v42];

  [(UIView *)self->_darkenView setTranslatesAutoresizingMaskIntoConstraints:0];
  v43 = [(UIView *)self->_darkenView layer];
  [v43 setAllowsHitTesting:0];

  [(UIView *)self->_containerView addSubview:self->_darkenView];
  v44 = [(UIView *)self->_darkenView leftAnchor];
  uint64_t v45 = [(UIView *)self->_containerView leftAnchor];
  uint64_t v46 = [v44 constraintEqualToAnchor:v45];
  [v46 setActive:1];

  v47 = [(UIView *)self->_darkenView rightAnchor];
  uint64_t v48 = [(UIView *)self->_containerView rightAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];
  [v49 setActive:1];

  v50 = [(UIView *)self->_darkenView topAnchor];
  id v51 = [(UIView *)self->_containerView topAnchor];
  v52 = [v50 constraintEqualToAnchor:v51];
  [v52 setActive:1];

  v53 = [(UIView *)self->_darkenView bottomAnchor];
  uint64_t v54 = [(UIView *)self->_containerView bottomAnchor];
  v55 = [v53 constraintEqualToAnchor:v54];
  [v55 setActive:1];
}

- (void)willMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBMedusaDecoratedDeviceApplicationSceneViewController;
  -[SBMedusaDecoratedDeviceApplicationSceneViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_);
  if (!a3) {
    [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self bs_removeChildViewController:self->_deviceApplicationSceneViewController];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)SBMedusaDecoratedDeviceApplicationSceneViewController;
  id v7 = a4;
  -[SBMedusaDecoratedDeviceApplicationSceneViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[SBDeviceApplicationSceneViewController viewWillTransitionToSize:withTransitionCoordinator:](self->_deviceApplicationSceneViewController, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height, v8.receiver, v8.super_class);
  -[SBTopAffordanceViewController viewWillTransitionToSize:withTransitionCoordinator:](self->_topAffordanceViewController, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
}

- (id)topAffordanceView
{
  return (id)[(SBTopAffordanceViewController *)self->_topAffordanceViewController view];
}

- (void)setDarkenViewAlpha:(double)a3
{
  if (self->_darkenViewAlpha != a3)
  {
    self->_darkenViewAlpha = a3;
    if ([(SBMedusaDecoratedDeviceApplicationSceneViewController *)self isViewLoaded])
    {
      darkenView = self->_darkenView;
      [(UIView *)darkenView setAlpha:a3];
    }
  }
}

- (void)setDropInteraction:(id)a3
{
  objc_super v5 = (UIDropInteraction *)a3;
  p_dropInteraction = &self->_dropInteraction;
  dropInteraction = self->_dropInteraction;
  objc_super v8 = v5;
  if (dropInteraction != v5)
  {
    if (dropInteraction
      && [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self isViewLoaded])
    {
      [(UIView *)self->_containerView removeInteraction:*p_dropInteraction];
    }
    objc_storeStrong((id *)&self->_dropInteraction, a3);
    if (*p_dropInteraction
      && [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self isViewLoaded])
    {
      [(UIView *)self->_containerView addInteraction:*p_dropInteraction];
    }
  }
}

- (int64_t)homeGrabberDisplayMode
{
  return [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController homeGrabberDisplayMode];
}

- (void)setHomeGrabberDisplayMode:(int64_t)a3
{
}

- (void)setHomeGrabberPillSettings:(id)a3
{
}

- (NSString)sceneMinificationFilter
{
  return self->_sceneMinificationFilter;
}

- (void)setSceneMinificationFilter:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    double v4 = (NSString *)[v6 copy];
    sceneMinificationFilter = self->_sceneMinificationFilter;
    self->_sceneMinificationFilter = v4;

    [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _updateAsyncRendering];
  }
}

- (BOOL)sceneRendersAsynchronously
{
  return self->_sceneRendersAsynchronously;
}

- (void)setSceneRendersAsynchronously:(BOOL)a3
{
  if (self->_sceneRendersAsynchronously != a3)
  {
    self->_sceneRendersAsynchronousldouble y = a3;
    [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _updateAsyncRendering];
  }
}

- (BOOL)sceneResizesHostedContext
{
  return [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController sceneResizesHostedContext];
}

- (void)setSceneResizesHostedContext:(BOOL)a3
{
}

- (MTLumaDodgePillSettings)homeGrabberPillSettings
{
  return [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController homeGrabberPillSettings];
}

- (void)_handleTopAffordanceTapGestureRecognizerAction:(id)a3
{
  id v12 = a3;
  if ([v12 state] == 3)
  {
    double v4 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self topAffordanceView];
    objc_super v5 = [(SBTopAffordanceViewController *)self->_topAffordanceViewController view];

    if (v4 == v5)
    {
      id v6 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self view];
      [v12 locationInView:v6];
      double v8 = v7;
      double v10 = v9;
      double v11 = [(SBTopAffordanceViewController *)self->_topAffordanceViewController dotsView];
      objc_msgSend(v6, "convertPoint:toView:", v11, v8, v10);
      if ((objc_msgSend(v11, "pointInside:withEvent:", 0) & 1) == 0) {
        [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _sendStatusBarScrollToTopActionForGestureRecognizer:v12];
      }
    }
    else
    {
      [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _sendStatusBarScrollToTopActionForGestureRecognizer:v12];
    }
  }
}

- (void)_sendStatusBarScrollToTopActionForGestureRecognizer:(id)a3
{
  deviceApplicationSceneViewController = self->_deviceApplicationSceneViewController;
  id v5 = a3;
  id v6 = [(SBDeviceApplicationSceneViewController *)deviceApplicationSceneViewController view];
  [v5 locationInView:v6];
  double v8 = v7;

  id v12 = (id)[objc_alloc(MEMORY[0x1E4F42E50]) initWithType:0 xPosition:v8];
  double v9 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self sceneHandle];
  double v10 = [v9 sceneIfExists];
  double v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
  [v10 sendActions:v11];
}

- (void)_handleSplitHomeScreenSwitcherKeyShortcut
{
  int64_t v3 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self layoutRole];
  double v4 = +[SBWorkspaceEntity entity];
  if (v3 == 1)
  {
    uint64_t v5 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:2];

    uint64_t v6 = 3;
    double v4 = (void *)v5;
  }
  else
  {
    uint64_t v6 = 2;
  }
  double v7 = +[SBWorkspace mainWorkspace];
  double v8 = [(UIViewController *)self _sbWindowScene];
  double v9 = [v8 _fbsDisplayConfiguration];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __98__SBMedusaDecoratedDeviceApplicationSceneViewController__handleSplitHomeScreenSwitcherKeyShortcut__block_invoke;
  v11[3] = &unk_1E6B02178;
  id v12 = v4;
  double v13 = self;
  uint64_t v14 = v6;
  id v10 = v4;
  [v7 requestTransitionWithOptions:0 displayConfiguration:v9 builder:v11 validator:0];
}

void __98__SBMedusaDecoratedDeviceApplicationSceneViewController__handleSplitHomeScreenSwitcherKeyShortcut__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:51];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__SBMedusaDecoratedDeviceApplicationSceneViewController__handleSplitHomeScreenSwitcherKeyShortcut__block_invoke_2;
  v7[3] = &unk_1E6B020E0;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v4;
  uint64_t v9 = v5;
  uint64_t v10 = v6;
  [v3 modifyApplicationContext:v7];
}

void __98__SBMedusaDecoratedDeviceApplicationSceneViewController__handleSplitHomeScreenSwitcherKeyShortcut__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = a2;
  [v7 setEntity:v3 forLayoutRole:1];
  id v4 = +[SBWorkspaceEntity entity];
  [v7 setEntity:v4 forLayoutRole:2];

  uint64_t v5 = +[SBWorkspaceEntity entity];
  [v7 setEntity:v5 forLayoutRole:3];

  uint64_t v6 = +[SBWorkspaceEntity entity];
  [v7 setEntity:v6 forLayoutRole:4];

  objc_msgSend(v7, "setRequestedSpaceConfiguration:", objc_msgSend(*(id *)(a1 + 40), "spaceConfiguration"));
  [v7 setRequestedPeekConfiguration:*(void *)(a1 + 48)];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_topAffordanceTapGestureRecognizer == a3
    && ([(SBMedusaDecoratedDeviceApplicationSceneViewController *)self topAffordanceView],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [(SBTopAffordanceViewController *)self->_topAffordanceViewController view],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v4 == v5))
  {
    return ![(SBTopAffordanceViewController *)self->_topAffordanceViewController isExpanded];
  }
  else
  {
    return 1;
  }
}

- (void)_elasticValueViewControllerWillPresent:(id)a3
{
  id v4 = a3;
  if (*(_OWORD *)&self->_layoutRole == __PAIR128__(1, 1))
  {
    id v5 = v4;
    [(SBTopAffordanceViewController *)self->_topAffordanceViewController setHidden:1 forReason:@"Elastic HUD" animated:1];
    id v4 = v5;
  }
}

- (void)_elasticValueViewControllerWillDismiss:(id)a3
{
}

- (void)_guidedAccessActivationChanged:(id)a3
{
}

- (void)_medusaCapabilityChanged:(id)a3
{
}

- (void)_windowManagementStyleDidChange:(id)a3
{
  [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _createOrDestroyTopAffordanceViewControllerAnimated:1];
  [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self updateTopAffordanceOverrideUserInterfaceStyle];
  [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self updateTopAffordanceContextMenu];
}

- (void)applicationSceneViewController:(id)a3 statusBarTapped:(id)a4 tapActionType:(int64_t)a5
{
  p_delegate = &self->_delegate;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained medusaDecoratedDeviceApplicationSceneViewController:self statusBarTapped:v8 tapActionType:a5];
}

- (void)applicationSceneViewControllerDidUpdateHomeAffordanceSupportedOrientations:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained medusaDecoratedDeviceApplicationSceneViewControllerDidUpdateHomeAffordanceSupportedOrientations:self];
}

- (BOOL)applicationSceneViewControllerIsInNonrotatingWindow:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v5 = [WeakRetained medusaDecoratedDeviceApplicationSceneViewControllerIsInNonrotatingWindow:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (UIView)_blurViewContainerView
{
  return self->_blurViewContainerView;
}

- (id)_blurContentView
{
  return self->_blurView;
}

- (void)_setBlurContentView:(id)a3
{
  char v5 = (SBApplicationBlurContentView *)a3;
  p_blurView = &self->_blurView;
  blurView = self->_blurView;
  if (blurView != v5)
  {
    uint64_t v9 = v5;
    [(SBApplicationBlurContentView *)blurView removeFromSuperview];
    objc_storeStrong((id *)&self->_blurView, a3);
    if (*p_blurView)
    {
      [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _beginRequiringSceneViewMatchMoveAnimationForReason:@"SBMedusaDecoratedDeviceApplicationSceneViewControllerBlurredReason"];
      [(SBApplicationBlurContentView *)*p_blurView setClipsToBounds:1];
      id v8 = [(SBApplicationBlurContentView *)*p_blurView layer];
      [v8 setAllowsGroupOpacity:1];

      [(UIView *)self->_blurViewContainerView addSubview:*p_blurView];
    }
    else
    {
      [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _endRequiringSceneViewMatchMoveAnimationForReason:@"SBMedusaDecoratedDeviceApplicationSceneViewControllerBlurredReason"];
    }
    self->_isBlurred = *p_blurView != 0;
    char v5 = v9;
  }
}

- (BOOL)_sceneViewHasMatchMoveAnimation
{
  uint64_t v2 = [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController view];
  uint64_t v3 = [v2 layer];
  id v4 = [v3 animationForKey:@"SceneViewMatchMoveAnimation"];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)_addSceneViewMatchMoveAnimation
{
  v16[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBApplicationSceneHandle *)self->_deviceApplicationSceneHandle application];
  char v4 = [v3 classicAppPhoneAppRunningOnPad];

  if ((v4 & 1) == 0)
  {
    BOOL v5 = [MEMORY[0x1E4F39C00] animation];
    uint64_t v6 = [(UIView *)self->_containerView layer];
    [v5 setSourceLayer:v6];

    [v5 setDuration:INFINITY];
    [v5 setFillMode:*MEMORY[0x1E4F39FA0]];
    [v5 setRemovedOnCompletion:0];
    [v5 setAppliesX:0];
    [v5 setAppliesY:0];
    [v5 setAppliesScale:1];
    [v5 setUsesNormalizedCoordinates:1];
    id v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 0.0);
    v16[0] = v7;
    id v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 1.0, 0.0);
    v16[1] = v8;
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 1.0, 1.0);
    v16[2] = v9;
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 1.0);
    v16[3] = v10;
    double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
    [v5 setSourcePoints:v11];

    id v12 = [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController view];
    double v13 = [v12 layer];
    [v13 addAnimation:v5 forKey:@"SceneViewMatchMoveAnimation"];

    uint64_t v14 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self view];
    [v14 setNeedsLayout];

    double v15 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self view];
    [v15 layoutIfNeeded];
  }
}

- (void)_removeSceneViewMatchMoveAnimation
{
  uint64_t v3 = [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController view];
  char v4 = [v3 layer];
  [v4 removeAnimationForKey:@"SceneViewMatchMoveAnimation"];

  BOOL v5 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self view];
  [v5 setNeedsLayout];

  id v6 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self view];
  [v6 layoutIfNeeded];
}

- (void)_beginRequiringSceneViewMatchMoveAnimationForReason:(id)a3
{
  id v10 = a3;
  if (!v10)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBMedusaDecoratedDeviceApplicationSceneViewController.m", 1587, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  matchMoveAnimationRequiringReasons = self->_matchMoveAnimationRequiringReasons;
  if (!matchMoveAnimationRequiringReasons)
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
    id v7 = self->_matchMoveAnimationRequiringReasons;
    self->_matchMoveAnimationRequiringReasons = v6;

    matchMoveAnimationRequiringReasons = self->_matchMoveAnimationRequiringReasons;
  }
  uint64_t v8 = [(NSMutableSet *)matchMoveAnimationRequiringReasons count];
  [(NSMutableSet *)self->_matchMoveAnimationRequiringReasons addObject:v10];
  if (!v8
    || ![(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _sceneViewHasMatchMoveAnimation])
  {
    [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _addSceneViewMatchMoveAnimation];
  }
}

- (void)_endRequiringSceneViewMatchMoveAnimationForReason:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBMedusaDecoratedDeviceApplicationSceneViewController.m", 1602, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  uint64_t v5 = [(NSMutableSet *)self->_matchMoveAnimationRequiringReasons count];
  [(NSMutableSet *)self->_matchMoveAnimationRequiringReasons removeObject:v9];
  uint64_t v6 = [(NSMutableSet *)self->_matchMoveAnimationRequiringReasons count];
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _removeSceneViewMatchMoveAnimation];
  }
}

- (void)_setTopAffordanceAutoHides:(BOOL)a3
{
}

- (BOOL)_wantsTopAffordance
{
  BOOL v3 = [(SBMainWorkspace *)self->_workspace isMedusaCapable];
  if ([(SBSetupManager *)self->_setupManager isInSetupMode])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    char IsActive = SBGuidedAccessIsActive();
    LOBYTE(v4) = 0;
    if (v3 && (IsActive & 1) == 0)
    {
      uint64_t v6 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self sceneHandle];
      BOOL v7 = [v6 application];

      if ([v7 alwaysMaximizedInChamois]) {
        LOBYTE(v4) = 0;
      }
      else {
        int v4 = [v7 restrictedToTheEmbeddedDisplayInChamois] ^ 1;
      }
    }
  }
  return v4;
}

- (void)_createOrDestroyTopAffordanceViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v44[4] = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self _wantsTopAffordance];
  topAffordanceViewController = self->_topAffordanceViewController;
  if (v5 && !topAffordanceViewController)
  {
    BOOL v7 = [SBTopAffordanceViewController alloc];
    uint64_t v8 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self sceneHandle];
    id v9 = [(SBTopAffordanceViewController *)v7 initWithDeviceApplicationSceneHandle:v8];
    id v10 = self->_topAffordanceViewController;
    self->_topAffordanceViewController = v9;

    [(SBTopAffordanceViewController *)self->_topAffordanceViewController setDelegate:self];
    [(SBTopAffordanceViewController *)self->_topAffordanceViewController setHidden:self->_nubViewHidden forReason:@"MedusaDecoratedVC" animated:v3];
    double v11 = self->_topAffordanceViewController;
    if ([(SBMedusaDecoratedDeviceApplicationSceneViewController *)self isNubViewHighlighted]) {
      uint64_t v12 = [(id)SBApp isHardwareKeyboardAttached];
    }
    else {
      uint64_t v12 = 0;
    }
    [(SBTopAffordanceViewController *)v11 setHighlighted:v12];
    objc_super v19 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleTopAffordanceTapGestureRecognizerAction_];
    topAffordanceTapGestureRecognizer = self->_topAffordanceTapGestureRecognizer;
    self->_topAffordanceTapGestureRecognizer = v19;

    [(UITapGestureRecognizer *)self->_topAffordanceTapGestureRecognizer setDelegate:self];
    uint64_t v21 = [(SBTopAffordanceViewController *)self->_topAffordanceViewController view];
    [v21 setAlpha:0.0];
    [v21 addGestureRecognizer:self->_topAffordanceTapGestureRecognizer];
    uint64_t v22 = self->_topAffordanceViewController;
    containerView = self->_containerView;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke;
    v41[3] = &unk_1E6B083B8;
    BOOL v43 = v3;
    double v42 = v21;
    id v16 = v21;
    [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self bs_addChildViewController:v22 withSuperview:containerView animated:v3 transitionBlock:v41];
    id v32 = self->_containerView;
    uint64_t v37 = [v16 leftAnchor];
    double v36 = [(UIView *)self->_containerView leftAnchor];
    __int16 v35 = [v37 constraintEqualToAnchor:v36];
    v44[0] = v35;
    v34 = [v16 rightAnchor];
    __int16 v33 = [(UIView *)self->_containerView rightAnchor];
    id v24 = [v34 constraintEqualToAnchor:v33];
    v44[1] = v24;
    int64_t v25 = [v16 topAnchor];
    v26 = [(UIView *)self->_containerView topAnchor];
    uint64_t v27 = [v25 constraintEqualToAnchor:v26];
    v44[2] = v27;
    uint64_t v28 = [v16 bottomAnchor];
    int64_t v29 = [(UIView *)self->_containerView bottomAnchor];
    uint64_t v30 = [v28 constraintEqualToAnchor:v29];
    v44[3] = v30;
    uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];
    [(UIView *)v32 addConstraints:v31];

    double v15 = &v42;
    [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self updateTopAffordanceOverrideUserInterfaceStyle];
    [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self updateTopAffordanceContextMenu];
    goto LABEL_11;
  }
  if (!topAffordanceViewController) {
    LOBYTE(v5) = 1;
  }
  if (!v5)
  {
    double v13 = [(SBTopAffordanceViewController *)topAffordanceViewController view];
    uint64_t v14 = self->_topAffordanceViewController;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke_4;
    v38[3] = &unk_1E6B083B8;
    BOOL v40 = v3;
    double v15 = &v39;
    double v39 = v13;
    id v16 = v13;
    [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self bs_removeChildViewController:v14 animated:v3 transitionBlock:v38];
    uint64_t v17 = self->_topAffordanceViewController;
    self->_topAffordanceViewController = 0;

    BOOL v18 = self->_topAffordanceTapGestureRecognizer;
    self->_topAffordanceTapGestureRecognizer = 0;

LABEL_11:
  }
}

void __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)MEMORY[0x1E4F42FF0];
  if (*(unsigned char *)(a1 + 40)) {
    double v5 = 0.2;
  }
  else {
    double v5 = 0.0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke_2;
  v9[3] = &unk_1E6AF4AC0;
  id v10 = *(id *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke_3;
  v7[3] = &unk_1E6AF5A50;
  id v8 = v3;
  id v6 = v3;
  [v4 animateWithDuration:v9 animations:v7 completion:v5];
}

uint64_t __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)MEMORY[0x1E4F42FF0];
  if (*(unsigned char *)(a1 + 40)) {
    double v5 = 0.2;
  }
  else {
    double v5 = 0.0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke_5;
  v9[3] = &unk_1E6AF4AC0;
  id v10 = *(id *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke_6;
  v7[3] = &unk_1E6AF5A50;
  id v8 = v3;
  id v6 = v3;
  [v4 animateWithDuration:v9 animations:v7 completion:v5];
}

uint64_t __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __109__SBMedusaDecoratedDeviceApplicationSceneViewController__createOrDestroyTopAffordanceViewControllerAnimated___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateTopAffordanceHighlight
{
  if ([(SBMedusaDecoratedDeviceApplicationSceneViewController *)self isViewLoaded])
  {
    BOOL nubViewHighlighted = self->_nubViewHighlighted;
    BOOL v4 = SBSpaceConfigurationIsSplitView(self->_spaceConfiguration)
      || (unint64_t)(self->_floatingConfiguration - 1) < 2;
    double v5 = [(id)SBApp windowSceneManager];
    id v6 = [v5 connectedWindowScenes];
    unint64_t v7 = [v6 count];

    int v8 = [(id)SBApp isHardwareKeyboardAttached];
    id v9 = [(SBMedusaDecoratedDeviceApplicationSceneViewController *)self topAffordanceView];
    id v10 = [(SBTopAffordanceViewController *)self->_topAffordanceViewController view];

    if (v9 == v10)
    {
      unsigned int v11 = v4 & v8;
      if (v7 > 1) {
        unsigned int v11 = 1;
      }
      if (nubViewHighlighted) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      topAffordanceViewController = self->_topAffordanceViewController;
      [(SBTopAffordanceViewController *)topAffordanceViewController setHighlighted:v12];
    }
  }
}

- (void)_updateAsyncRendering
{
  sceneRendersAsynchronousldouble y = self->_sceneRendersAsynchronously;
  deviceApplicationSceneViewController = self->_deviceApplicationSceneViewController;
  if (sceneRendersAsynchronously)
  {
    double v5 = [(SBDeviceApplicationSceneViewController *)deviceApplicationSceneViewController view];
    BOOL v6 = ([v5 isHidden] & 1) == 0 && self->_disableAsyncRenderingCount == 0;

    [(SBDeviceApplicationSceneViewController *)self->_deviceApplicationSceneViewController setSceneRendersAsynchronously:v6];
    int v8 = self->_deviceApplicationSceneViewController;
    if (v6) {
      sceneMinificationFilter = self->_sceneMinificationFilter;
    }
    else {
      sceneMinificationFilter = 0;
    }
  }
  else
  {
    [(SBDeviceApplicationSceneViewController *)deviceApplicationSceneViewController setSceneRendersAsynchronously:0];
    sceneMinificationFilter = 0;
    int v8 = self->_deviceApplicationSceneViewController;
  }
  [(SBDeviceApplicationSceneViewController *)v8 setSceneMinificationFilter:sceneMinificationFilter];
}

- (BOOL)_isChamoisWindowingUIEnabled
{
  uint64_t v2 = [(SBDeviceApplicationSceneHandle *)self->_deviceApplicationSceneHandle _windowScene];
  id v3 = [v2 switcherController];
  char v4 = [v3 isChamoisWindowingUIEnabled];

  return v4;
}

- (double)darkenViewAlpha
{
  return self->_darkenViewAlpha;
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (int64_t)spaceConfiguration
{
  return self->_spaceConfiguration;
}

- (int64_t)floatingConfiguration
{
  return self->_floatingConfiguration;
}

- (SBMedusaDecoratedDeviceApplicationSceneViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBMedusaDecoratedDeviceApplicationSceneViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
  objc_storeStrong((id *)&self->_matchMoveAnimationRequiringReasons, 0);
  objc_storeStrong((id *)&self->_statusBarAssertions, 0);
  objc_storeStrong((id *)&self->_sceneMinificationFilter, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_darkenView, 0);
  objc_storeStrong((id *)&self->_topAffordanceTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_topAffordanceViewController, 0);
  objc_storeStrong((id *)&self->_blurViewContainerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_applicationSceneClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_deviceApplicationSceneViewController, 0);
  objc_storeStrong((id *)&self->_deviceApplicationSceneHandle, 0);
  objc_storeStrong((id *)&self->_setupManager, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
}

void __102__SBMedusaDecoratedDeviceApplicationSceneViewController__topAffordanceViewControllerHandleCloseAction__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Error while attempting to disconnect scene: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_modifyApplicationContext:(void *)a1 handleActionType:(NSObject *)a2 spaceConfiguration:layoutRole:desiredFloatingConfiguration:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 succinctDescription];
  int v4 = 138543362;
  double v5 = v3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "previousLayoutState was not an SBMainDisplayLayoutState: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end
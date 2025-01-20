@interface SBFullScreenSwitcherSceneLiveContentOverlay
- (BOOL)applicationSceneViewControllerIsInNonrotatingWindow:(id)a3;
- (BOOL)asyncRenderingDisabled;
- (BOOL)asynchronousRenderingTemporarilyDisabled;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleHomeButtonLongPress;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)hitTestedToTopAffordance:(CGPoint)a3 window:(id)a4;
- (BOOL)isAsyncRenderingEnabled;
- (BOOL)isBlurred;
- (BOOL)isContentUpdating;
- (BOOL)isDisplayLayoutElementActive;
- (BOOL)isMatchMovedToScene;
- (BOOL)isMaximized;
- (BOOL)medusaDecoratedDeviceApplicationSceneViewControllerIsInNonrotatingWindow:(id)a3;
- (BOOL)requiresLegacyRotationSupport;
- (BOOL)resizesHostedContext;
- (BOOL)wantsEnhancedWindowingEnabled;
- (BOOL)wantsMinificationFilter;
- (BSInvalidatable)displayLayoutElementAssertion;
- (BSUIOrientationTransformWrapperView)orientationWrapperView;
- (SBDeviceApplicationSceneViewControlling)deviceApplicationSceneViewController;
- (SBFullScreenSwitcherSceneLiveContentOverlay)init;
- (SBFullScreenSwitcherSceneLiveContentOverlayDelegate)statusBarActionDelegate;
- (SBSDisplayLayoutElement)displayLayoutElement;
- (SBSceneViewStatusBarAssertion)statusBarAssertion;
- (SBSwitcherLiveContentOverlayDelegate)delegate;
- (UIRectCornerRadii)cornerRadii;
- (UIView)contentOverlayView;
- (double)currentStatusBarHeight;
- (id)_medusaDecoratedDeviceApplicationSceneViewController;
- (id)_sbWindowScene;
- (id)_sceneHandleForHardwareButtonEvents;
- (id)backgroundActivitiesToSuppress;
- (id)contentViewController;
- (id)liveSceneIdentityToken;
- (id)newPortaledLiveContentOverlayView;
- (id)overlaySceneHandle;
- (id)prepareOverlayForContentRotation;
- (int64_t)bestHomeAffordanceOrientationForOrientation:(int64_t)a3;
- (int64_t)containerOrientation;
- (int64_t)leadingStatusBarStyle;
- (int64_t)overlayType;
- (int64_t)preferredInterfaceOrientation;
- (int64_t)touchBehavior;
- (int64_t)trailingStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_settingsDidUpdateEdgeProtectOrAutoHideOnHomeGrabberView;
- (void)_updateAsyncRendering;
- (void)_updateDisplayLayoutElementActive;
- (void)_updateOrientationWrapper;
- (void)_updateTopAffordanceAutoHide;
- (void)_updateTouchBehaviorForScene:(id)a3;
- (void)applicationSceneViewController:(id)a3 statusBarTapped:(id)a4 tapActionType:(int64_t)a5;
- (void)applicationSceneViewControllerDidUpdateHomeAffordanceSupportedOrientations:(id)a3;
- (void)configureWithWorkspaceEntity:(id)a3 referenceFrame:(CGRect)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 layoutRole:(int64_t)a7 sbsDisplayLayoutRole:(int64_t)a8 spaceConfiguration:(int64_t)a9 floatingConfiguration:(int64_t)a10 hasClassicAppOrientationMismatch:(BOOL)a11 sizingPolicy:(int64_t)a12;
- (void)dealloc;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4;
- (void)disableAsynchronousRenderingForNextCommit;
- (void)invalidate;
- (void)medusaDecoratedDeviceApplicationSceneViewController:(id)a3 statusBarTapped:(id)a4 tapActionType:(int64_t)a5;
- (void)medusaDecoratedDeviceApplicationSceneViewControllerDidUpdateHomeAffordanceSupportedOrientations:(id)a3;
- (void)noteKeyboardFocusDidChangeToSceneID:(id)a3;
- (void)sceneHandle:(id)a3 didCreateScene:(id)a4;
- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5;
- (void)sceneLayerManagerDidStopTrackingLayers:(id)a3;
- (void)sceneLayerManagerDidUpdateLayers:(id)a3;
- (void)setAsyncRenderingDisabled:(BOOL)a3;
- (void)setAsyncRenderingEnabled:(BOOL)a3 withMinificationFilterEnabled:(BOOL)a4;
- (void)setBlurViewIconScale:(double)a3;
- (void)setContainerOrientation:(int64_t)a3;
- (void)setContentReferenceSize:(CGSize)a3 interfaceOrientation:(int64_t)a4;
- (void)setCornerRadii:(UIRectCornerRadii)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setDisplayLayoutElementActive:(BOOL)a3;
- (void)setDisplayLayoutElementAssertion:(id)a3;
- (void)setLiveContentBlurEnabled:(BOOL)a3 duration:(double)a4 blurDelay:(double)a5 iconViewScale:(double)a6 began:(id)a7 completion:(id)a8;
- (void)setMatchMovedToScene:(BOOL)a3;
- (void)setMaximized:(BOOL)a3;
- (void)setOccluded:(BOOL)a3;
- (void)setResizesHostedContext:(BOOL)a3;
- (void)setStatusBarActionDelegate:(id)a3;
- (void)setStatusBarHidden:(BOOL)a3 nubViewHidden:(BOOL)a4 animator:(id)a5;
- (void)setTouchBehavior:(int64_t)a3;
- (void)setWantsEnhancedWindowingEnabled:(BOOL)a3;
- (void)updateDisplayLayoutElementWithBuilder:(id)a3;
- (void)updateTopAffordanceContextMenu;
- (void)willRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 alongsideContainerView:(id)a5 animated:(BOOL)a6;
@end

@implementation SBFullScreenSwitcherSceneLiveContentOverlay

- (void)setMaximized:(BOOL)a3
{
  self->_maximized = a3;
}

- (void)setCornerRadii:(UIRectCornerRadii)a3
{
  self->_cornerRadii = a3;
}

- (void)_updateOrientationWrapper
{
  v3 = [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController sceneHandle];
  v4 = [v3 sceneIfExists];
  v5 = [v4 settings];
  v6 = v5;
  if (!v4
    || (objc_msgSend(v5, "sb_displayIdentityForSceneManagers"),
        v7 = objc_claimAutoreleasedReturnValue(),
        -[SBDeviceApplicationSceneViewControlling _fbsDisplayIdentity](self->_deviceApplicationSceneViewController, "_fbsDisplayIdentity"), v8 = objc_claimAutoreleasedReturnValue(), int v9 = [v7 isEqual:v8], v8, v7, v9))
  {
    v10 = [(BSUIOrientationTransformWrapperView *)self->_orientationWrapperView _sbWindowScene];
    int v11 = [v3 _supportsMixedOrientationOnWindowScene:v10];

    if (v11)
    {
      int64_t containerOrientation = self->_containerOrientation;
    }
    else
    {
      uint64_t v13 = [v6 interfaceOrientation];
      unint64_t v14 = [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController contentOrientation];
      if (v14 <= 1) {
        int64_t containerOrientation = 1;
      }
      else {
        int64_t containerOrientation = v14;
      }
      if (v13) {
        int64_t containerOrientation = v13;
      }
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __72__SBFullScreenSwitcherSceneLiveContentOverlay__updateOrientationWrapper__block_invoke;
    v16[3] = &unk_1E6AF4A70;
    v16[4] = self;
    v16[5] = containerOrientation;
    v15 = (void (**)(void))MEMORY[0x1D948C7A0](v16);
    if ([MEMORY[0x1E4F42FF0] _isInRetargetableAnimationBlock])
    {
      [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v15];
    }
    else if ([MEMORY[0x1E4F42FF0] _isInAnimationBlock])
    {
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v15];
    }
    else
    {
      v15[2](v15);
    }
  }
}

uint64_t __72__SBFullScreenSwitcherSceneLiveContentOverlay__updateOrientationWrapper__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) setContentOrientation:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  uint64_t v4 = *(void *)(v2 + 104);
  return [v3 setContainerOrientation:v4];
}

- (void)setTouchBehavior:(int64_t)a3
{
  if (self->_touchBehavior != a3)
  {
    self->_touchBehavior = a3;
    id v5 = [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController sceneHandle];
    uint64_t v4 = [v5 sceneIfExists];
    [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _updateTouchBehaviorForScene:v4];
  }
}

- (void)sceneLayerManagerDidUpdateLayers:(id)a3
{
  id v4 = [a3 scene];
  [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _updateTouchBehaviorForScene:v4];
}

- (void)_updateTouchBehaviorForScene:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 layerManager];
  v6 = [v5 layers];
  v7 = v6;
  if (v4 && [v6 count])
  {
    v22 = v5;
    id v8 = objc_alloc(MEMORY[0x1E4F4F3A0]);
    id v23 = v4;
    int v9 = [v4 identifier];
    v10 = (void *)[v8 initWithIdentifier:v9 touchBehavior:self->_touchBehavior];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v21 = v7;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v17 = [(NSMutableDictionary *)self->_backboardSceneHostRegistrations objectForKey:v16];
          v18 = v17;
          if (v17)
          {
            [v17 updateSettings:v10];
          }
          else
          {
            v19 = [MEMORY[0x1E4F4F3F0] sharedInstance];
            v20 = objc_msgSend(v19, "registerSceneHostSettings:forCAContextID:", v10, objc_msgSend(v16, "contextID"));

            [(NSMutableDictionary *)self->_backboardSceneHostRegistrations setObject:v20 forKey:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }

    id v5 = v22;
    id v4 = v23;
    v7 = v21;
  }
}

- (int64_t)bestHomeAffordanceOrientationForOrientation:(int64_t)a3
{
  return [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController bestHomeAffordanceOrientationForOrientation:a3];
}

- (void)setOccluded:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController sceneHandle];
  [v4 setOccluded:v3];
}

- (void)setResizesHostedContext:(BOOL)a3
{
}

- (void)setWantsEnhancedWindowingEnabled:(BOOL)a3
{
  if (self->_wantsEnhancedWindowingEnabled != a3)
  {
    BOOL v3 = a3;
    self->_wantsEnhancedWindowingEnabled = a3;
    id v4 = [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController sceneHandle];
    [v4 setWantsEnhancedWindowingEnabled:v3];
  }
}

- (void)setAsyncRenderingEnabled:(BOOL)a3 withMinificationFilterEnabled:(BOOL)a4
{
  if (self->_asyncRenderingEnabled != a3 || self->_wantsMinificationFilter != a4)
  {
    self->_asyncRenderingEnabled = a3;
    self->_wantsMinificationFilter = a4;
    [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _updateAsyncRendering];
  }
}

- (void)setMatchMovedToScene:(BOOL)a3
{
  if (self->_matchMovedToScene != a3)
  {
    BOOL v3 = a3;
    self->_matchMovedToScene = a3;
    id v4 = [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _medusaDecoratedDeviceApplicationSceneViewController];
    id v5 = v4;
    if (v3) {
      [v4 _beginRequiringSceneViewMatchMoveAnimationForReason:@"switcher"];
    }
    else {
      [v4 _endRequiringSceneViewMatchMoveAnimationForReason:@"switcher"];
    }
  }
}

- (void)setAsyncRenderingDisabled:(BOOL)a3
{
  if (self->_asyncRenderingDisabled != a3)
  {
    self->_asyncRenderingDisabled = a3;
    [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _updateAsyncRendering];
  }
}

- (void)setDisplayLayoutElementActive:(BOOL)a3
{
  if (self->_displayLayoutElementActive != a3)
  {
    self->_displayLayoutElementActive = a3;
    [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _updateDisplayLayoutElementActive];
  }
}

- (void)_updateDisplayLayoutElementActive
{
  uint64_t v2 = objc_opt_class();
  BOOL v3 = *(void **)(a1 + 72);
  id v4 = v2;
  id v5 = [v3 sceneHandle];
  v6 = [v5 sceneIdentifier];
  v7 = [*(id *)(a1 + 72) sceneHandle];
  id v8 = [v7 displayIdentity];
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_10(&dword_1D85BA000, v9, v10, "Trying to activate a display layout element for %{public}@ but we can't find the publisher - sceneID: %{public}@ displayIdentity: %{public}@", v11, v12, v13, v14, v15);
}

- (void)configureWithWorkspaceEntity:(id)a3 referenceFrame:(CGRect)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 layoutRole:(int64_t)a7 sbsDisplayLayoutRole:(int64_t)a8 spaceConfiguration:(int64_t)a9 floatingConfiguration:(int64_t)a10 hasClassicAppOrientationMismatch:(BOOL)a11 sizingPolicy:(int64_t)a12
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v19 = a3;
  v50 = [v19 deviceApplicationSceneEntity];
  v20 = [v50 sceneHandle];
  v21 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v22 = [v21 userInterfaceIdiom];

  unint64_t v23 = v22 & 0xFFFFFFFFFFFFFFFBLL;
  deviceApplicationSceneViewController = self->_deviceApplicationSceneViewController;
  if (!deviceApplicationSceneViewController)
  {
    [v20 addObserver:self];
    if (v23 == 1)
    {
      long long v25 = -[SBMedusaDecoratedDeviceApplicationSceneViewController initWithDeviceApplicationSceneHandle:layoutRole:]([SBMedusaDecoratedDeviceApplicationSceneViewController alloc], "initWithDeviceApplicationSceneHandle:layoutRole:", v20, [v19 layoutRole]);
      [(SBMedusaDecoratedDeviceApplicationSceneViewController *)v25 setDelegate:self];
      [(SBMedusaDecoratedDeviceApplicationSceneViewController *)v25 setNubViewHidden:0];
    }
    else
    {
      long long v25 = [[SBDeviceApplicationSceneViewController alloc] initWithSceneHandle:v20];
      [(SBMedusaDecoratedDeviceApplicationSceneViewController *)v25 setShouldDrawStatusBarInsideSceneView:1];
      [(SBMedusaDecoratedDeviceApplicationSceneViewController *)v25 setDelegate:self];
    }
    long long v26 = self->_deviceApplicationSceneViewController;
    self->_deviceApplicationSceneViewController = (SBDeviceApplicationSceneViewControlling *)v25;

    [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController setDisplayMode:4 animationFactory:0 completion:0];
    id v27 = objc_alloc(MEMORY[0x1E4FA6A68]);
    v28 = [v20 sceneIdentifier];
    uint64_t v29 = (SBSDisplayLayoutElement *)[v27 initWithIdentifier:v28];
    displayLayoutElement = self->_displayLayoutElement;
    self->_displayLayoutElement = v29;

    deviceApplicationSceneViewController = self->_deviceApplicationSceneViewController;
  }
  [(SBDeviceApplicationSceneViewControlling *)deviceApplicationSceneViewController setHomeGrabberDisplayMode:1];
  v31 = [(SBDeviceApplicationScenePlaceholderContentContext *)[SBMutableDeviceApplicationScenePlaceholderContentContext alloc] initWithActivationSettings:v19];
  [(SBDeviceApplicationScenePlaceholderContentContext *)v31 setLayoutEnvironment:1];
  [(SBDeviceApplicationScenePlaceholderContentContext *)v31 setHasOrientationMismatchForClassicApp:a11];
  [(SBDeviceApplicationScenePlaceholderContentContext *)v31 setSizingPolicy:a12];
  [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController setPlaceholderContentContext:v31];
  if (v23 == 1)
  {
    uint64_t v32 = objc_opt_class();
    v33 = SBSafeCast(v32, self->_deviceApplicationSceneViewController);
    [v33 setLayoutRole:a7 spaceConfiguration:a9 floatingConfiguration:a10 sizingPolicy:a12];
  }
  -[SBDeviceApplicationSceneViewControlling setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_deviceApplicationSceneViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", a5, a6, width, height);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __250__SBFullScreenSwitcherSceneLiveContentOverlay_configureWithWorkspaceEntity_referenceFrame_contentOrientation_containerOrientation_layoutRole_sbsDisplayLayoutRole_spaceConfiguration_floatingConfiguration_hasClassicAppOrientationMismatch_sizingPolicy___block_invoke;
  v51[3] = &unk_1E6AFC2A8;
  id v34 = v20;
  id v52 = v34;
  int64_t v53 = a8;
  CGFloat v54 = x;
  CGFloat v55 = y;
  double v56 = width;
  double v57 = height;
  [(SBFullScreenSwitcherSceneLiveContentOverlay *)self updateDisplayLayoutElementWithBuilder:v51];
  [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _updateDisplayLayoutElementActive];
  [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController setDisplayMode:4 animationFactory:0 completion:0];
  v35 = [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController sceneHandle];
  int HaveTransparentBackground = SBApplicationMightHaveTransparentBackground(v35);

  if (HaveTransparentBackground)
  {
    v37 = [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController backgroundView];
    if (objc_opt_respondsToSelector()) {
      [v37 setFullscreen:1];
    }
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v37, "setTransformOptions:", objc_msgSend(v37, "transformOptions") | 2);
    }
  }
  [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _updateTopAffordanceAutoHide];
  [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _updateOrientationWrapper];
  v38 = [(id)SBApp windowSceneManager];
  v39 = [v38 windowSceneForSceneHandle:v34];
  v40 = [v39 switcherController];
  v41 = [v40 traitsParticipantForSceneHandle:v34];

  [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController containerDidUpdateTraitsParticipant:v41];
  v42 = [v34 sceneIfExists];
  v43 = [v42 layerManager];
  v44 = v43;
  if (v42)
  {
    v45 = [v43 layers];
    uint64_t v46 = [v45 count];

    if (!v46) {
      [v44 addObserver:self];
    }
  }
}

- (void)noteKeyboardFocusDidChangeToSceneID:(id)a3
{
  if (a3)
  {
    deviceApplicationSceneViewController = self->_deviceApplicationSceneViewController;
    id v5 = a3;
    v6 = [(SBDeviceApplicationSceneViewControlling *)deviceApplicationSceneViewController sceneHandle];
    v7 = [v6 sceneIdentifier];
    uint64_t v8 = [v7 isEqualToString:v5];
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _medusaDecoratedDeviceApplicationSceneViewController];
  [v9 setNubViewHighlighted:v8];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__SBFullScreenSwitcherSceneLiveContentOverlay_noteKeyboardFocusDidChangeToSceneID___block_invoke;
  v10[3] = &__block_descriptor_33_e33_v16__0__SBSDisplayLayoutElement_8l;
  char v11 = v8;
  [(SBFullScreenSwitcherSceneLiveContentOverlay *)self updateDisplayLayoutElementWithBuilder:v10];
}

- (void)setLiveContentBlurEnabled:(BOOL)a3 duration:(double)a4 blurDelay:(double)a5 iconViewScale:(double)a6 began:(id)a7 completion:(id)a8
{
  BOOL v12 = a3;
  id v14 = a8;
  id v15 = a7;
  id v16 = [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _medusaDecoratedDeviceApplicationSceneViewController];
  [v16 setLiveContentBlurEnabled:v12 duration:v15 blurDelay:v14 iconViewScale:a4 began:a5 completion:a6];
}

- (void)setBlurViewIconScale:(double)a3
{
  id v4 = [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _medusaDecoratedDeviceApplicationSceneViewController];
  [v4 setBlurViewIconScale:a3];
}

- (id)_medusaDecoratedDeviceApplicationSceneViewController
{
  uint64_t v3 = objc_opt_class();
  deviceApplicationSceneViewController = self->_deviceApplicationSceneViewController;
  return SBSafeCast(v3, deviceApplicationSceneViewController);
}

- (void)updateDisplayLayoutElementWithBuilder:(id)a3
{
  if (self->_displayLayoutElementAssertion)
  {
    id v5 = (void (**)(id, SBSDisplayLayoutElement *))a3;
    v6 = [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _sbWindowScene];
    id v7 = [v6 displayLayoutPublisher];

    if (!v7)
    {
      uint64_t v8 = SBLogAppSwitcher();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SBFullScreenSwitcherSceneLiveContentOverlay updateDisplayLayoutElementWithBuilder:]((uint64_t)self);
      }

      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v10 = objc_opt_class();
      char v11 = [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController sceneHandle];
      BOOL v12 = [v11 sceneIdentifier];
      uint64_t v13 = [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController sceneHandle];
      id v14 = [v13 displayIdentity];
      [v9 handleFailureInMethod:a2, self, @"SBFullScreenSwitcherLiveContentOverlayCoordinator.m", 1851, @"No publisher - %@ sceneID: %@ displayIdentity: %@", v10, v12, v14 object file lineNumber description];
    }
    id v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    v17 = [v7 transitionAssertionWithReason:v16];

    [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

    v5[2](v5, self->_displayLayoutElement);
    id v19 = [v7 addElement:self->_displayLayoutElement];
    v20 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v19;

    [v17 invalidate];
  }
  else
  {
    v21 = (void (*)(void))*((void *)a3 + 2);
    id v7 = a3;
    v21();
  }
}

uint64_t __83__SBFullScreenSwitcherSceneLiveContentOverlay_noteKeyboardFocusDidChangeToSceneID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHasKeyboardFocus:*(unsigned __int8 *)(a1 + 32)];
}

- (id)_sbWindowScene
{
  uint64_t v3 = [(SBFullScreenSwitcherSceneLiveContentOverlay *)self delegate];
  id v4 = [v3 windowSceneForLiveContentOverlay:self];

  return v4;
}

void __250__SBFullScreenSwitcherSceneLiveContentOverlay_configureWithWorkspaceEntity_referenceFrame_contentOrientation_containerOrientation_layoutRole_sbsDisplayLayoutRole_spaceConfiguration_floatingConfiguration_hasClassicAppOrientationMismatch_sizingPolicy___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = a2;
  id v4 = [v3 application];
  id v5 = [v4 bundleIdentifier];
  [v6 setBundleIdentifier:v5];

  [v6 setLayoutRole:*(void *)(a1 + 40)];
  [v6 setLevel:1];
  [v6 setUIApplicationElement:1];
  objc_msgSend(v6, "setHasKeyboardFocus:", objc_msgSend(*(id *)(a1 + 32), "isPairedWithExternalSceneWithIdentifier:", *MEMORY[0x1E4F71DE8]));
  objc_msgSend(v6, "setReferenceFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (BOOL)isMaximized
{
  return self->_maximized;
}

- (UIRectCornerRadii)cornerRadii
{
  double topLeft = self->_cornerRadii.topLeft;
  double bottomLeft = self->_cornerRadii.bottomLeft;
  double bottomRight = self->_cornerRadii.bottomRight;
  double topRight = self->_cornerRadii.topRight;
  result.double topRight = topRight;
  result.double bottomRight = bottomRight;
  result.double bottomLeft = bottomLeft;
  result.double topLeft = topLeft;
  return result;
}

void __109__SBFullScreenSwitcherSceneLiveContentOverlay_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _settingsDidUpdateEdgeProtectOrAutoHideOnHomeGrabberView];
}

- (void)_updateTopAffordanceAutoHide
{
  uint64_t v3 = objc_opt_class();
  SBSafeCast(v3, self->_deviceApplicationSceneViewController);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController sceneHandle];
  uint64_t v5 = [v4 isAutoHideEnabledForHomeAffordance];

  [v6 _setTopAffordanceAutoHides:v5];
}

- (void)_settingsDidUpdateEdgeProtectOrAutoHideOnHomeGrabberView
{
  uint64_t v3 = [(SBFullScreenSwitcherSceneLiveContentOverlay *)self delegate];
  [v3 liveContentOverlayDidUpdateHomeAffordanceEdgeProtectOrAutoHide:self];

  [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _updateTopAffordanceAutoHide];
}

- (SBSwitcherLiveContentOverlayDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSwitcherLiveContentOverlayDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)currentStatusBarHeight
{
  [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController currentStatusBarHeight];
  return result;
}

- (void)setContentReferenceSize:(CGSize)a3 interfaceOrientation:(int64_t)a4
{
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  clientSettingsInspector = self->_clientSettingsInspector;
  if (!clientSettingsInspector)
  {
    BOOL v12 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F42768]);
    uint64_t v13 = self->_clientSettingsInspector;
    self->_clientSettingsInspector = v12;

    objc_initWeak(&location, self);
    id v14 = self->_clientSettingsInspector;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __109__SBFullScreenSwitcherSceneLiveContentOverlay_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke;
    v18[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v19, &location);
    [(UIApplicationSceneClientSettingsDiffInspector *)v14 observeScreenEdgesDeferringSystemGesturesWithBlock:v18];
    id v15 = self->_clientSettingsInspector;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __109__SBFullScreenSwitcherSceneLiveContentOverlay_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2;
    v16[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v17, &location);
    [(UIApplicationSceneClientSettingsDiffInspector *)v15 observeHomeIndicatorAutoHiddenWithBlock:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    clientSettingsInspector = self->_clientSettingsInspector;
  }
  [(UIApplicationSceneClientSettingsDiffInspector *)clientSettingsInspector inspectDiff:v9 withContext:v10];
}

- (id)overlaySceneHandle
{
  return (id)[(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController sceneHandle];
}

- (SBDeviceApplicationSceneViewControlling)deviceApplicationSceneViewController
{
  return self->_deviceApplicationSceneViewController;
}

- (void)setStatusBarHidden:(BOOL)a3 nubViewHidden:(BOOL)a4 animator:(id)a5
{
  BOOL v5 = a4;
  id v8 = (void (**)(id, uint64_t, void))a5;
  if (a3 || v5)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __89__SBFullScreenSwitcherSceneLiveContentOverlay_setStatusBarHidden_nubViewHidden_animator___block_invoke;
    v17[3] = &unk_1E6AF7EB8;
    v17[4] = self;
    BOOL v18 = a3;
    BOOL v19 = v5;
    uint64_t v12 = MEMORY[0x1D948C7A0](v17);
    id v10 = (void (**)(void))v12;
    if (v8) {
      v8[2](v8, v12, 0);
    }
    else {
      (*(void (**)(uint64_t))(v12 + 16))(v12);
    }
LABEL_13:

    goto LABEL_14;
  }
  statusBarAssertion = self->_statusBarAssertion;
  if (statusBarAssertion
    && ([(SBSceneViewStatusBarAssertion *)statusBarAssertion isStatusBarHidden]
     || [(SBSceneViewStatusBarAssertion *)self->_statusBarAssertion nubViewHidden] != 0x7FFFFFFFFFFFFFFFLL))
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __89__SBFullScreenSwitcherSceneLiveContentOverlay_setStatusBarHidden_nubViewHidden_animator___block_invoke_2;
    v15[3] = &unk_1E6AFB0E8;
    char v16 = 0;
    v15[4] = self;
    v15[5] = 0x7FFFFFFFFFFFFFFFLL;
    id v10 = (void (**)(void))MEMORY[0x1D948C7A0](v15);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __89__SBFullScreenSwitcherSceneLiveContentOverlay_setStatusBarHidden_nubViewHidden_animator___block_invoke_3;
    v13[3] = &unk_1E6AFC2F0;
    char v14 = 0;
    v13[4] = self;
    v13[5] = 0x7FFFFFFFFFFFFFFFLL;
    char v11 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v13);
    if (v8)
    {
      v8[2](v8, (uint64_t)v10, v11);
    }
    else
    {
      v10[2](v10);
      v11[2](v11, 1, 0);
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (id)contentViewController
{
  return self->_deviceApplicationSceneViewController;
}

uint64_t __89__SBFullScreenSwitcherSceneLiveContentOverlay_setStatusBarHidden_nubViewHidden_animator___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) setStatusBarHidden:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 80);
  return [v3 setNubViewHidden:v2];
}

void __89__SBFullScreenSwitcherSceneLiveContentOverlay_setStatusBarHidden_nubViewHidden_animator___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 80);
  if (v3)
  {
    [v3 setStatusBarHidden:*(unsigned __int8 *)(a1 + 40)];
    id v4 = *(void **)(*(void *)(a1 + 32) + 80);
    uint64_t v5 = BSSettingFlagIfYes();
    [v4 setNubViewHidden:v5];
  }
  else
  {
    int v6 = objc_msgSend(*(id *)(v2 + 72), "SB_conformsToSceneLayoutMedusaStatusBarAssertionProviding");
    int v7 = *(unsigned __int8 *)(a1 + 40);
    if (v6) {
      [*(id *)(*(void *)(a1 + 32) + 72) statusBarAssertionWithStatusBarHidden:v7 != 0 nubViewHidden:BSSettingFlagIfYes() atLevel:4];
    }
    else {
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 72) statusBarAssertionWithStatusBarHidden:v7 != 0 atLevel:4];
    }
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 80);
    *(void *)(v9 + 80) = v8;
  }
}

void __89__SBFullScreenSwitcherSceneLiveContentOverlay_setStatusBarHidden_nubViewHidden_animator___block_invoke_3(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0
    && *(unsigned __int8 *)(a1 + 48) == [*(id *)(*(void *)(a1 + 32) + 80) isStatusBarHidden]&& objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "nubViewHidden") == *(void *)(a1 + 40))
  {
    [*(id *)(*(void *)(a1 + 32) + 80) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 80);
    *(void *)(v4 + 80) = 0;
  }
}

- (int64_t)overlayType
{
  return 1;
}

- (void)setStatusBarActionDelegate:(id)a3
{
}

- (BSUIOrientationTransformWrapperView)orientationWrapperView
{
  return self->_orientationWrapperView;
}

- (SBFullScreenSwitcherSceneLiveContentOverlay)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBFullScreenSwitcherSceneLiveContentOverlay;
  uint64_t v2 = [(SBFullScreenSwitcherSceneLiveContentOverlay *)&v8 init];
  if (v2)
  {
    uint64_t v3 = (BSUIOrientationTransformWrapperView *)objc_alloc_init(MEMORY[0x1E4F4F8D0]);
    orientationWrapperView = v2->_orientationWrapperView;
    v2->_orientationWrapperView = v3;

    uint64_t v5 = objc_opt_new();
    backboardSceneHostRegistrations = v2->_backboardSceneHostRegistrations;
    v2->_backboardSceneHostRegistrations = (NSMutableDictionary *)v5;

    v2->_touchBehavior = 2;
  }
  return v2;
}

- (void)setContainerOrientation:(int64_t)a3
{
  if (self->_containerOrientation != a3)
  {
    self->_int64_t containerOrientation = a3;
    [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _updateOrientationWrapper];
  }
}

- (UIView)contentOverlayView
{
  return (UIView *)self->_orientationWrapperView;
}

- (BOOL)isAsyncRenderingEnabled
{
  return self->_asyncRenderingEnabled;
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  id v12 = a4;
  deviceApplicationSceneViewController = self->_deviceApplicationSceneViewController;
  id v7 = a3;
  id v8 = [(SBDeviceApplicationSceneViewControlling *)deviceApplicationSceneViewController sceneHandle];

  if (v8 == v7)
  {
    [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _updateOrientationWrapper];
    [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _updateAsyncRendering];
    uint64_t v9 = [v12 layerManager];
    id v10 = [v9 layers];
    uint64_t v11 = [v10 count];

    if (v11) {
      [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _updateTouchBehaviorForScene:v12];
    }
    else {
      [v9 addObserver:self];
    }
  }
}

- (void)_updateAsyncRendering
{
  BOOL v3 = self->_asyncRenderingEnabled
    && !self->_asynchronousRenderingTemporarilyDisabled
    && !self->_asyncRenderingDisabled;
  [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController setSceneRendersAsynchronously:v3];
  deviceApplicationSceneViewController = self->_deviceApplicationSceneViewController;
  if (v3) {
    uint64_t v5 = *MEMORY[0x1E4F39FE0];
  }
  else {
    uint64_t v5 = 0;
  }
  [(SBDeviceApplicationSceneViewControlling *)deviceApplicationSceneViewController setSceneMinificationFilter:v5];
}

void __109__SBFullScreenSwitcherSceneLiveContentOverlay_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _settingsDidUpdateEdgeProtectOrAutoHideOnHomeGrabberView];
}

- (void)dealloc
{
  [(SBFullScreenSwitcherSceneLiveContentOverlay *)self invalidate];
  BOOL v3 = [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController sceneHandle];
  [v3 removeObserver:self];

  uint64_t v4 = [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController sceneHandle];
  uint64_t v5 = [v4 sceneIfExists];
  int v6 = [v5 layerManager];
  [v6 removeObserver:self];

  [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController invalidate];
  v7.receiver = self;
  v7.super_class = (Class)SBFullScreenSwitcherSceneLiveContentOverlay;
  [(SBFullScreenSwitcherSceneLiveContentOverlay *)&v7 dealloc];
}

- (void)willRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 alongsideContainerView:(id)a5 animated:(BOOL)a6
{
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4
{
}

- (int64_t)touchBehavior
{
  return self->_touchBehavior;
}

- (id)prepareOverlayForContentRotation
{
  return (id)[(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController prepareForContentRotation];
}

- (void)invalidate
{
  [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController invalidate];
  [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  self->_displayLayoutElementAssertion = 0;

  [(UIApplicationSceneClientSettingsDiffInspector *)self->_clientSettingsInspector removeAllObservers];
  clientSettingsInspector = self->_clientSettingsInspector;
  self->_clientSettingsInspector = 0;

  [(NSMutableDictionary *)self->_backboardSceneHostRegistrations enumerateKeysAndObjectsUsingBlock:&__block_literal_global_265];
  backboardSceneHostRegistrations = self->_backboardSceneHostRegistrations;
  self->_backboardSceneHostRegistrations = 0;
}

uint64_t __57__SBFullScreenSwitcherSceneLiveContentOverlay_invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (int64_t)leadingStatusBarStyle
{
  return [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController leadingStatusBarStyle];
}

- (int64_t)trailingStatusBarStyle
{
  return [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController trailingStatusBarStyle];
}

- (id)backgroundActivitiesToSuppress
{
  return (id)[(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController backgroundActivitiesToSuppress];
}

- (void)setDimmed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _medusaDecoratedDeviceApplicationSceneViewController];
  id v6 = v4;
  double v5 = 0.0;
  if (v3) {
    double v5 = 1.0;
  }
  [v4 setDarkenViewAlpha:v5];
}

- (BOOL)isContentUpdating
{
  uint64_t v2 = [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController sceneHandle];
  char v3 = [v2 isSceneUpdateInProgress];

  return v3;
}

- (void)disableAsynchronousRenderingForNextCommit
{
  if (!self->_asynchronousRenderingTemporarilyDisabled)
  {
    self->_asynchronousRenderingTemporarilyDisabled = 1;
    [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _updateAsyncRendering];
    char v3 = (void *)*MEMORY[0x1E4F43630];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __88__SBFullScreenSwitcherSceneLiveContentOverlay_disableAsynchronousRenderingForNextCommit__block_invoke;
    v4[3] = &unk_1E6AF4AC0;
    v4[4] = self;
    [v3 _performBlockAfterCATransactionCommits:v4];
  }
}

uint64_t __88__SBFullScreenSwitcherSceneLiveContentOverlay_disableAsynchronousRenderingForNextCommit__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 53) = 0;
  return [*(id *)(a1 + 32) _updateAsyncRendering];
}

- (BOOL)resizesHostedContext
{
  return [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController sceneResizesHostedContext];
}

- (BOOL)requiresLegacyRotationSupport
{
  uint64_t v2 = [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController sceneHandle];
  char v3 = [v2 wantsDeviceOrientationEventsEnabled];

  return v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  uint64_t v2 = [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController sceneHandle];
  char v3 = v2;
  if (v2 && ([v2 _supportsMixedOrientation] & 1) == 0) {
    unint64_t v4 = [v3 supportedInterfaceOrientations];
  }
  else {
    unint64_t v4 = 30;
  }

  return v4;
}

- (int64_t)preferredInterfaceOrientation
{
  uint64_t v2 = [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController sceneHandle];
  if ([v2 isEffectivelyForeground]) {
    int64_t v3 = [v2 currentInterfaceOrientation];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (id)newPortaledLiveContentOverlayView
{
  uint64_t v2 = [(SBFullScreenSwitcherSceneLiveContentOverlay *)self contentOverlayView];
  if (v2)
  {
    int64_t v3 = objc_alloc_init(SBPortalView);
    [(SBPortalView *)v3 setSourceView:v2];
  }
  else
  {
    int64_t v3 = 0;
  }

  return v3;
}

- (BOOL)hitTestedToTopAffordance:(CGPoint)a3 window:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _medusaDecoratedDeviceApplicationSceneViewController];
  uint64_t v9 = objc_msgSend(v8, "hitTestToTopAffordance:window:", v7, x, y);

  return v9 != 0;
}

- (void)updateTopAffordanceContextMenu
{
  id v2 = [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _medusaDecoratedDeviceApplicationSceneViewController];
  [v2 updateTopAffordanceContextMenu];
}

- (BOOL)isDisplayLayoutElementActive
{
  return self->_displayLayoutElementAssertion != 0;
}

- (void)medusaDecoratedDeviceApplicationSceneViewController:(id)a3 statusBarTapped:(id)a4 tapActionType:(int64_t)a5
{
  p_statusBarActionDelegate = &self->_statusBarActionDelegate;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_statusBarActionDelegate);
  [WeakRetained fullScreenSwitcherSceneLiveContentOverlay:self tappedStatusBar:v8 tapActionType:a5];
}

- (void)medusaDecoratedDeviceApplicationSceneViewControllerDidUpdateHomeAffordanceSupportedOrientations:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained liveContentOverlayDidUpdateHomeAffordanceSupportedOrientations:self];
}

- (BOOL)medusaDecoratedDeviceApplicationSceneViewControllerIsInNonrotatingWindow:(id)a3
{
  return 1;
}

- (void)applicationSceneViewController:(id)a3 statusBarTapped:(id)a4 tapActionType:(int64_t)a5
{
  p_statusBarActionDelegate = &self->_statusBarActionDelegate;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_statusBarActionDelegate);
  [WeakRetained fullScreenSwitcherSceneLiveContentOverlay:self tappedStatusBar:v8 tapActionType:a5];
}

- (void)applicationSceneViewControllerDidUpdateHomeAffordanceSupportedOrientations:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained liveContentOverlayDidUpdateHomeAffordanceSupportedOrientations:self];
}

- (BOOL)applicationSceneViewControllerIsInNonrotatingWindow:(id)a3
{
  return 1;
}

- (void)sceneLayerManagerDidStopTrackingLayers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v4 = objc_msgSend(a3, "layers", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v10 = [(NSMutableDictionary *)self->_backboardSceneHostRegistrations objectForKey:v9];
        [v10 invalidate];
        [(NSMutableDictionary *)self->_backboardSceneHostRegistrations removeObjectForKey:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (BOOL)handleHomeButtonPress
{
  return 0;
}

- (BOOL)handleHomeButtonDoublePress
{
  return 0;
}

- (BOOL)handleHomeButtonLongPress
{
  return 0;
}

- (BOOL)handleLockButtonPress
{
  return 0;
}

- (BOOL)handleVolumeUpButtonPress
{
  id v2 = [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _sceneHandleForHardwareButtonEvents];
  int64_t v3 = v2;
  if (v2 && ([v2 preferredHardwareButtonEventTypes] & 2) != 0) {
    char v4 = [v3 handleHardwareButtonEventType:1];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)handleVolumeDownButtonPress
{
  id v2 = [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _sceneHandleForHardwareButtonEvents];
  int64_t v3 = v2;
  if (v2 && ([v2 preferredHardwareButtonEventTypes] & 4) != 0) {
    char v4 = [v3 handleHardwareButtonEventType:2];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  BOOL v3 = a3;
  char v4 = [(SBFullScreenSwitcherSceneLiveContentOverlay *)self _sceneHandleForHardwareButtonEvents];
  uint64_t v5 = v4;
  if (v4)
  {
    char v6 = [v4 preferredHardwareButtonEventTypes];
    if (v3)
    {
      if ((v6 & 0x10) != 0)
      {
        uint64_t v7 = 4;
LABEL_8:
        char v8 = [v5 handleHardwareButtonEventType:v7];
        goto LABEL_9;
      }
    }
    else if ((v6 & 8) != 0)
    {
      uint64_t v7 = 3;
      goto LABEL_8;
    }
  }
  char v8 = 0;
LABEL_9:

  return v8;
}

- (id)_sceneHandleForHardwareButtonEvents
{
  return (id)[(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController sceneHandle];
}

- (id)liveSceneIdentityToken
{
  id v2 = [(SBDeviceApplicationSceneViewControlling *)self->_deviceApplicationSceneViewController sceneHandle];
  BOOL v3 = [v2 sceneIfExists];

  if ([v3 isActive])
  {
    char v4 = [v3 settings];
    if ([v4 isForeground])
    {
      uint64_t v5 = [v3 identityToken];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)wantsEnhancedWindowingEnabled
{
  return self->_wantsEnhancedWindowingEnabled;
}

- (SBSceneViewStatusBarAssertion)statusBarAssertion
{
  return self->_statusBarAssertion;
}

- (SBSDisplayLayoutElement)displayLayoutElement
{
  return self->_displayLayoutElement;
}

- (BSInvalidatable)displayLayoutElementAssertion
{
  return self->_displayLayoutElementAssertion;
}

- (void)setDisplayLayoutElementAssertion:(id)a3
{
}

- (BOOL)wantsMinificationFilter
{
  return self->_wantsMinificationFilter;
}

- (BOOL)asyncRenderingDisabled
{
  return self->_asyncRenderingDisabled;
}

- (BOOL)asynchronousRenderingTemporarilyDisabled
{
  return self->_asynchronousRenderingTemporarilyDisabled;
}

- (BOOL)isBlurred
{
  return self->_blurred;
}

- (BOOL)isMatchMovedToScene
{
  return self->_matchMovedToScene;
}

- (int64_t)containerOrientation
{
  return self->_containerOrientation;
}

- (SBFullScreenSwitcherSceneLiveContentOverlayDelegate)statusBarActionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarActionDelegate);
  return (SBFullScreenSwitcherSceneLiveContentOverlayDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_statusBarActionDelegate);
  objc_storeStrong((id *)&self->_displayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutElement, 0);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong((id *)&self->_deviceApplicationSceneViewController, 0);
  objc_storeStrong((id *)&self->_orientationWrapperView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_sbWindowScene);
  objc_storeStrong((id *)&self->_backboardSceneHostRegistrations, 0);
  objc_storeStrong((id *)&self->_clientSettingsInspector, 0);
}

- (void)updateDisplayLayoutElementWithBuilder:(uint64_t)a1 .cold.1(uint64_t a1)
{
  id v2 = objc_opt_class();
  BOOL v3 = *(void **)(a1 + 72);
  id v4 = v2;
  uint64_t v5 = [v3 sceneHandle];
  char v6 = [v5 sceneIdentifier];
  uint64_t v7 = [*(id *)(a1 + 72) sceneHandle];
  char v8 = [v7 displayIdentity];
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_10(&dword_1D85BA000, v9, v10, "Trying to update a display layout element for %{public}@ but we can't find the publisher - sceneID: %{public}@ displayIdentity: %{public}@", v11, v12, v13, v14, v15);
}

@end
@interface SBSwitcherCaptureExtensionLiveContentOverlay
- (BOOL)isAsyncRenderingEnabled;
- (BOOL)isContentUpdating;
- (BOOL)isDisplayLayoutElementActive;
- (BOOL)isMaximized;
- (BOOL)requiresLegacyRotationSupport;
- (BOOL)resizesHostedContext;
- (BOOL)wantsEnhancedWindowingEnabled;
- (SBSwitcherCaptureExtensionLiveContentOverlay)initWithEntity:(id)a3 windowScene:(id)a4;
- (SBSwitcherLiveContentOverlayDelegate)delegate;
- (UIRectCornerRadii)cornerRadii;
- (UIView)contentOverlayView;
- (double)currentStatusBarHeight;
- (id)_hostedEntityViewController;
- (id)_hostedSceneID;
- (id)_sceneHandleIfExists;
- (id)_sceneIfExists;
- (id)backgroundActivitiesToSuppress;
- (id)contentViewController;
- (id)liveSceneIdentityToken;
- (id)overlaySceneHandle;
- (id)prepareOverlayForContentRotation;
- (int64_t)leadingStatusBarStyle;
- (int64_t)overlayType;
- (int64_t)preferredInterfaceOrientation;
- (int64_t)touchBehavior;
- (int64_t)trailingStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)configureWithWorkspaceEntity:(id)a3 referenceFrame:(CGRect)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 layoutRole:(int64_t)a7 sbsDisplayLayoutRole:(int64_t)a8 spaceConfiguration:(int64_t)a9 floatingConfiguration:(int64_t)a10 hasClassicAppOrientationMismatch:(BOOL)a11 sizingPolicy:(int64_t)a12;
- (void)invalidate;
- (void)noteKeyboardFocusDidChangeToSceneID:(id)a3;
- (void)setCornerRadii:(UIRectCornerRadii)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLayoutElementActive:(BOOL)a3;
- (void)setLiveContentBlurEnabled:(BOOL)a3 duration:(double)a4 blurDelay:(double)a5 iconViewScale:(double)a6 began:(id)a7 completion:(id)a8;
- (void)setMaximized:(BOOL)a3;
- (void)setResizesHostedContext:(BOOL)a3;
- (void)setWantsEnhancedWindowingEnabled:(BOOL)a3;
- (void)updateDisplayLayoutElementWithBuilder:(id)a3;
@end

@implementation SBSwitcherCaptureExtensionLiveContentOverlay

- (SBSwitcherCaptureExtensionLiveContentOverlay)initWithEntity:(id)a3 windowScene:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBSwitcherCaptureExtensionLiveContentOverlay;
  v9 = [(SBSwitcherCaptureExtensionLiveContentOverlay *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entity, a3);
    objc_storeWeak((id *)&v10->_sbWindowScene, v8);
    id v11 = objc_alloc(MEMORY[0x1E4FA6A68]);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    uint64_t v14 = [v11 initWithIdentifier:v13];
    displayLayoutElement = v10->_displayLayoutElement;
    v10->_displayLayoutElement = (SBSDisplayLayoutElement *)v14;
  }
  return v10;
}

- (void)updateDisplayLayoutElementWithBuilder:(id)a3
{
  if (self->_displayLayoutElementAssertion)
  {
    v5 = (void (**)(id, SBSDisplayLayoutElement *))a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
    if (!WeakRetained)
    {
      uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"SBSwitcherCaptureExtensionLiveContentOverlay.m", 56, @"No window scene to get a publisher: %@", self object file lineNumber description];
    }
    id v16 = [WeakRetained displayLayoutPublisher];
    if (!v16)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBSwitcherCaptureExtensionLiveContentOverlay.m", 56, @"No publisher for window scene: %@; self: %@",
        WeakRetained,
        self);
    }
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    v9 = [v16 transitionAssertionWithReason:v8];

    [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

    v5[2](v5, self->_displayLayoutElement);
    id v11 = [v16 addElement:self->_displayLayoutElement];
    v12 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v11;

    [v9 invalidate];
  }
  else
  {
    v13 = (void (*)(void))*((void *)a3 + 2);
    id v16 = a3;
    v13();
  }
}

- (void)setDisplayLayoutElementActive:(BOOL)a3
{
  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  if (a3)
  {
    if (displayLayoutElementAssertion) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
    if (!WeakRetained)
    {
      uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"SBSwitcherCaptureExtensionLiveContentOverlay.m", 73, @"No window scene to get a publisher: %@", self object file lineNumber description];
    }
    id v16 = [WeakRetained displayLayoutPublisher];
    if (!v16)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBSwitcherCaptureExtensionLiveContentOverlay.m", 73, @"No publisher for window scene: %@; self: %@",
        WeakRetained,
        self);
    }
    displayLayoutElement = self->_displayLayoutElement;
    id v8 = [(SBSwitcherCaptureExtensionLiveContentOverlay *)self contentOverlayView];
    v9 = [v8 window];
    [v9 level];
    [(SBSDisplayLayoutElement *)displayLayoutElement setLevel:(uint64_t)v10];

    id v11 = [v16 addElement:self->_displayLayoutElement];
    v12 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v11;

    v13 = (BSInvalidatable *)v16;
  }
  else
  {
    if (!displayLayoutElementAssertion) {
      return;
    }
    [(BSInvalidatable *)displayLayoutElementAssertion invalidate];
    v13 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;
  }
}

- (BOOL)isDisplayLayoutElementActive
{
  return self->_displayLayoutElementAssertion != 0;
}

- (UIView)contentOverlayView
{
  v2 = [(SBSwitcherCaptureExtensionLiveContentOverlay *)self contentViewController];
  v3 = [v2 view];

  return (UIView *)v3;
}

- (BOOL)isContentUpdating
{
  return 0;
}

- (void)noteKeyboardFocusDidChangeToSceneID:(id)a3
{
  id v4 = a3;
  v5 = [(SBSwitcherCaptureExtensionLiveContentOverlay *)self _hostedSceneID];
  char v6 = [v5 isEqualToString:v4];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__SBSwitcherCaptureExtensionLiveContentOverlay_noteKeyboardFocusDidChangeToSceneID___block_invoke;
  v7[3] = &__block_descriptor_33_e33_v16__0__SBSDisplayLayoutElement_8l;
  char v8 = v6;
  [(SBSwitcherCaptureExtensionLiveContentOverlay *)self updateDisplayLayoutElementWithBuilder:v7];
}

uint64_t __84__SBSwitcherCaptureExtensionLiveContentOverlay_noteKeyboardFocusDidChangeToSceneID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHasKeyboardFocus:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setLiveContentBlurEnabled:(BOOL)a3 duration:(double)a4 blurDelay:(double)a5 iconViewScale:(double)a6 began:(id)a7 completion:(id)a8
{
  v9 = (void (*)(id))*((void *)a7 + 2);
  double v10 = (void (**)(void))a8;
  v9(a7);
  v10[2]();
}

- (BOOL)requiresLegacyRotationSupport
{
  return 0;
}

- (int64_t)touchBehavior
{
  return 0;
}

- (int64_t)preferredInterfaceOrientation
{
  v2 = [(SBSwitcherCaptureExtensionLiveContentOverlay *)self _sceneHandleIfExists];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    int64_t v7 = [v6 currentInterfaceOrientation];
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (id)prepareOverlayForContentRotation
{
  return 0;
}

- (int64_t)leadingStatusBarStyle
{
  return 0;
}

- (int64_t)trailingStatusBarStyle
{
  return 0;
}

- (id)backgroundActivitiesToSuppress
{
  return 0;
}

- (double)currentStatusBarHeight
{
  return 0.0;
}

- (id)liveSceneIdentityToken
{
  v2 = [(SBSwitcherCaptureExtensionLiveContentOverlay *)self _sceneIfExists];
  if ([v2 isActive])
  {
    uint64_t v3 = [v2 settings];
    if ([v3 isForeground])
    {
      id v4 = [v2 identityToken];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)overlaySceneHandle
{
  return 0;
}

- (int64_t)overlayType
{
  return 5;
}

- (id)contentViewController
{
  return self->_cameraContainerViewController;
}

- (void)configureWithWorkspaceEntity:(id)a3 referenceFrame:(CGRect)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 layoutRole:(int64_t)a7 sbsDisplayLayoutRole:(int64_t)a8 spaceConfiguration:(int64_t)a9 floatingConfiguration:(int64_t)a10 hasClassicAppOrientationMismatch:(BOOL)a11 sizingPolicy:(int64_t)a12
{
  objc_msgSend(a3, "captureExtensionEntity", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  v13 = +[SBCaptureApplicationCenter sharedInstance];
  uint64_t v14 = [v24 bundleIdentifier];
  uint64_t v15 = [v13 captureApplicationForExtensionIdentifier:v14];

  id v16 = [v24 bundleIdentifier];
  uint64_t v17 = [v13 captureApplicationForBundleIdentifier:v16];

  if (v15 | v17)
  {
    v18 = [v24 hostableEntity];
    v19 = objc_alloc_init(SBDashBoardCameraContainerViewController);
    [(SBDashBoardCameraContainerViewController *)v19 setHostedEntity:v18];
    v20 = [(SBDashBoardCameraContainerViewController *)v19 hostedEntityViewController];
    [v20 setHostableEntityContentMode:2];

    hostableEntity = self->_hostableEntity;
    self->_hostableEntity = v18;
    v22 = v18;

    cameraContainerViewController = self->_cameraContainerViewController;
    self->_cameraContainerViewController = v19;
  }
}

- (void)invalidate
{
  [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  self->_displayLayoutElementAssertion = 0;

  [(SBDashBoardCameraContainerViewController *)self->_cameraContainerViewController invalidate];
  cameraContainerViewController = self->_cameraContainerViewController;
  self->_cameraContainerViewController = 0;

  hostableEntity = self->_hostableEntity;
  self->_hostableEntity = 0;
}

- (id)_hostedSceneID
{
  uint64_t v3 = [(SBSwitcherCaptureExtensionLiveContentOverlay *)self _sceneHandleIfExists];
  id v4 = [v3 sceneIdentifier];

  if (!v4)
  {
    v5 = [(SBSwitcherCaptureExtensionLiveContentOverlay *)self _hostedEntityViewController];
    id v6 = [v5 sceneForTraitsParticipant];
    id v4 = [v6 identifier];
  }
  return v4;
}

- (id)_sceneIfExists
{
  uint64_t v3 = [(SBSwitcherCaptureExtensionLiveContentOverlay *)self _sceneHandleIfExists];
  id v4 = [v3 sceneIfExists];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    int64_t v7 = [(SBSwitcherCaptureExtensionLiveContentOverlay *)self _hostedEntityViewController];
    id v6 = [v7 sceneForTraitsParticipant];
  }
  return v6;
}

- (id)_sceneHandleIfExists
{
  v2 = [(SBSwitcherCaptureExtensionLiveContentOverlay *)self _hostedEntityViewController];
  uint64_t v3 = [v2 sceneHandleForTraitsParticipant];

  return v3;
}

- (id)_hostedEntityViewController
{
  return [(SBDashBoardCameraContainerViewController *)self->_cameraContainerViewController hostedEntityViewController];
}

- (SBSwitcherLiveContentOverlayDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSwitcherLiveContentOverlayDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isMaximized
{
  return self->_maximized;
}

- (void)setMaximized:(BOOL)a3
{
  self->_maximized = a3;
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

- (void)setCornerRadii:(UIRectCornerRadii)a3
{
  self->_cornerRadii = a3;
}

- (BOOL)isAsyncRenderingEnabled
{
  return self->_asyncRenderingEnabled;
}

- (BOOL)wantsEnhancedWindowingEnabled
{
  return self->_wantsEnhancedWindowingEnabled;
}

- (void)setWantsEnhancedWindowingEnabled:(BOOL)a3
{
  self->_wantsEnhancedWindowingEnabled = a3;
}

- (BOOL)resizesHostedContext
{
  return self->_resizesHostedContext;
}

- (void)setResizesHostedContext:(BOOL)a3
{
  self->_resizesHostedContext = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cameraContainerViewController, 0);
  objc_storeStrong((id *)&self->_hostableEntity, 0);
  objc_storeStrong((id *)&self->_displayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutElement, 0);
  objc_destroyWeak((id *)&self->_sbWindowScene);
  objc_storeStrong((id *)&self->_entity, 0);
}

@end
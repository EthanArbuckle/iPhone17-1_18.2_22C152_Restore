@interface SBFullScreenAlwaysLiveLiveContentOverlay
- (BOOL)isAsyncRenderingEnabled;
- (BOOL)isContentUpdating;
- (BOOL)isDisplayLayoutElementActive;
- (BOOL)isMaximized;
- (BOOL)requiresLegacyRotationSupport;
- (BOOL)resizesHostedContext;
- (BOOL)wantsEnhancedWindowingEnabled;
- (SBFullScreenAlwaysLiveLiveContentOverlay)initWithSceneHandle:(id)a3 referenceSize:(CGSize)a4 containerOrientation:(int64_t)a5;
- (SBSwitcherLiveContentOverlayDelegate)delegate;
- (UIRectCornerRadii)cornerRadii;
- (UIView)contentOverlayView;
- (double)currentStatusBarHeight;
- (id)backgroundActivitiesToSuppress;
- (id)contentViewController;
- (id)liveSceneIdentityToken;
- (id)overlaySceneHandle;
- (id)prepareOverlayForContentRotation;
- (id)sceneViewPresentationIdentifier:(id)a3;
- (int64_t)containerOrientation;
- (int64_t)leadingStatusBarStyle;
- (int64_t)overlayType;
- (int64_t)preferredInterfaceOrientation;
- (int64_t)sceneViewPresentationPriority:(id)a3;
- (int64_t)touchBehavior;
- (int64_t)trailingStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)invalidate;
- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5;
- (void)setContainerOrientation:(int64_t)a3;
- (void)setCornerRadii:(UIRectCornerRadii)a3;
- (void)setDelegate:(id)a3;
- (void)setMaximized:(BOOL)a3;
- (void)setOccluded:(BOOL)a3;
- (void)setResizesHostedContext:(BOOL)a3;
- (void)setUsesBrightSceneViewBackgroundMaterial:(BOOL)a3;
- (void)setWantsEnhancedWindowingEnabled:(BOOL)a3;
@end

@implementation SBFullScreenAlwaysLiveLiveContentOverlay

- (SBFullScreenAlwaysLiveLiveContentOverlay)initWithSceneHandle:(id)a3 referenceSize:(CGSize)a4 containerOrientation:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SBFullScreenAlwaysLiveLiveContentOverlay;
  v11 = [(SBFullScreenAlwaysLiveLiveContentOverlay *)&v23 init];
  v12 = v11;
  if (v11)
  {
    v11->_uint64_t containerOrientation = a5;
    objc_storeStrong((id *)&v11->_sceneHandle, a3);
    if ([(SBDeviceApplicationSceneHandle *)v12->_sceneHandle _supportsMixedOrientation]) {
      uint64_t containerOrientation = v12->_containerOrientation;
    }
    else {
      uint64_t containerOrientation = [(SBDeviceApplicationSceneHandle *)v12->_sceneHandle currentInterfaceOrientation];
    }
    v14 = -[SBDeviceApplicationSceneView initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:]([SBDeviceApplicationSceneView alloc], "initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:", v10, containerOrientation, a5, v12, width, height);
    sceneView = v12->_sceneView;
    v12->_sceneView = v14;

    v16 = [(SBSceneView *)v12->_sceneView sceneHandle];
    int HaveTransparentBackground = SBApplicationMightHaveTransparentBackground(v16);

    if (HaveTransparentBackground)
    {
      v18 = [(SBSceneView *)v12->_sceneView backgroundView];
      if (objc_opt_respondsToSelector()) {
        [v18 setFullscreen:1];
      }
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v18, "setTransformOptions:", objc_msgSend(v18, "transformOptions") | 2);
      }
    }
    [(SBSceneView *)v12->_sceneView setDisplayMode:4 animationFactory:0 completion:0];
    id v19 = objc_alloc(MEMORY[0x1E4F4F8D0]);
    BSRectWithSize();
    uint64_t v20 = objc_msgSend(v19, "initWithFrame:");
    transformWrapperView = v12->_transformWrapperView;
    v12->_transformWrapperView = (BSUIOrientationTransformWrapperView *)v20;

    [(BSUIOrientationTransformWrapperView *)v12->_transformWrapperView setContentOrientation:containerOrientation];
    [(BSUIOrientationTransformWrapperView *)v12->_transformWrapperView setContainerOrientation:a5];
    [(BSUIOrientationTransformWrapperView *)v12->_transformWrapperView addContentView:v12->_sceneView];
    [(SBDeviceApplicationSceneHandle *)v12->_sceneHandle addObserver:v12];
  }

  return v12;
}

- (int64_t)overlayType
{
  return 3;
}

- (void)invalidate
{
  [(SBDeviceApplicationSceneHandle *)self->_sceneHandle removeObserver:self];
  [(SBDeviceApplicationSceneView *)self->_sceneView invalidate];
  sceneSettingsInspector = self->_sceneSettingsInspector;
  [(UIApplicationSceneSettingsDiffInspector *)sceneSettingsInspector removeAllObservers];
}

- (id)contentViewController
{
  return 0;
}

- (id)prepareOverlayForContentRotation
{
  return 0;
}

- (id)overlaySceneHandle
{
  return self->_sceneHandle;
}

- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  sceneSettingsInspector = self->_sceneSettingsInspector;
  if (!sceneSettingsInspector)
  {
    v12 = (UIApplicationSceneSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F42780]);
    v13 = self->_sceneSettingsInspector;
    self->_sceneSettingsInspector = v12;

    objc_initWeak(&location, self);
    v14 = self->_sceneSettingsInspector;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __99__SBFullScreenAlwaysLiveLiveContentOverlay_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke;
    v15[3] = &unk_1E6AFC338;
    objc_copyWeak(&v16, &location);
    v15[4] = self;
    [(UIApplicationSceneSettingsDiffInspector *)v14 observeInterfaceOrientationWithBlock:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    sceneSettingsInspector = self->_sceneSettingsInspector;
  }
  [(UIApplicationSceneSettingsDiffInspector *)sceneSettingsInspector inspectDiff:v9 withContext:0];
}

void __99__SBFullScreenAlwaysLiveLiveContentOverlay_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[1], "setContentOrientation:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "currentInterfaceOrientation"));
    WeakRetained = v3;
  }
}

- (id)sceneViewPresentationIdentifier:(id)a3
{
  return @"SBFullScreenAlwaysLiveLiveContentOverlay";
}

- (int64_t)sceneViewPresentationPriority:(id)a3
{
  return -5;
}

- (UIView)contentOverlayView
{
  return (UIView *)self->_transformWrapperView;
}

- (void)setContainerOrientation:(int64_t)a3
{
  self->_uint64_t containerOrientation = a3;
  -[BSUIOrientationTransformWrapperView setContainerOrientation:](self->_transformWrapperView, "setContainerOrientation:");
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
  return *MEMORY[0x1E4F43D08];
}

- (BOOL)isContentUpdating
{
  return 0;
}

- (void)setOccluded:(BOOL)a3
{
}

- (void)setUsesBrightSceneViewBackgroundMaterial:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBSceneView *)self->_sceneView backgroundView];
  if (objc_opt_respondsToSelector()) {
    [v4 setShouldUseBrightMaterial:v3];
  }
}

- (void)setWantsEnhancedWindowingEnabled:(BOOL)a3
{
  if (self->_wantsEnhancedWindowingEnabled != a3)
  {
    self->_wantsEnhancedWindowingEnabled = a3;
    -[SBDeviceApplicationSceneHandle setWantsEnhancedWindowingEnabled:](self->_sceneHandle, "setWantsEnhancedWindowingEnabled:");
  }
}

- (BOOL)requiresLegacyRotationSupport
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return [(SBDeviceApplicationSceneHandle *)self->_sceneHandle supportedInterfaceOrientations];
}

- (int64_t)preferredInterfaceOrientation
{
  return [(SBDeviceApplicationSceneHandle *)self->_sceneHandle currentInterfaceOrientation];
}

- (int64_t)touchBehavior
{
  return 2;
}

- (id)liveSceneIdentityToken
{
  v2 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
  if ([v2 isActive])
  {
    BOOL v3 = [v2 settings];
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

- (BOOL)isDisplayLayoutElementActive
{
  return 0;
}

- (BOOL)isAsyncRenderingEnabled
{
  return self->_asyncRenderingEnabled;
}

- (BOOL)resizesHostedContext
{
  return self->_resizesHostedContext;
}

- (void)setResizesHostedContext:(BOOL)a3
{
  self->_resizesHostedContext = a3;
}

- (BOOL)wantsEnhancedWindowingEnabled
{
  return self->_wantsEnhancedWindowingEnabled;
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

- (int64_t)containerOrientation
{
  return self->_containerOrientation;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_sceneSettingsInspector, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_storeStrong((id *)&self->_transformWrapperView, 0);
}

@end
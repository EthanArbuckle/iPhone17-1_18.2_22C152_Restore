@interface SBFluidSwitcherPortaledSceneLiveContentOverlay
- (BOOL)isAsyncRenderingEnabled;
- (BOOL)isContentUpdating;
- (BOOL)isDisplayLayoutElementActive;
- (BOOL)isMaximized;
- (BOOL)requiresLegacyRotationSupport;
- (BOOL)resizesHostedContext;
- (BOOL)wantsEnhancedWindowingEnabled;
- (CGSize)referenceSize;
- (SBDeviceApplicationSceneHandle)sceneHandle;
- (SBDeviceApplicationSceneView)sceneView;
- (SBFluidSwitcherPortaledSceneLiveContentOverlay)initWithSceneHandle:(id)a3 referenceSize:(CGSize)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 livePortalView:(id)a7;
- (SBSwitcherLiveContentOverlayDelegate)delegate;
- (SBUISizeObservingView)sizeObservingView;
- (UIRectCornerRadii)cornerRadii;
- (UIView)contentOverlayView;
- (UIView)livePortalView;
- (double)currentStatusBarHeight;
- (id)backgroundActivitiesToSuppress;
- (id)contentViewController;
- (id)liveSceneIdentityToken;
- (id)overlaySceneHandle;
- (id)prepareOverlayForContentRotation;
- (id)sceneViewPresentationIdentifier:(id)a3;
- (int64_t)containerOrientation;
- (int64_t)contentOrientation;
- (int64_t)leadingStatusBarStyle;
- (int64_t)overlayType;
- (int64_t)preferredInterfaceOrientation;
- (int64_t)sceneViewPresentationPriority:(id)a3;
- (int64_t)touchBehavior;
- (int64_t)trailingStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)setCornerRadii:(UIRectCornerRadii)a3;
- (void)setDelegate:(id)a3;
- (void)setMaximized:(BOOL)a3;
- (void)setResizesHostedContext:(BOOL)a3;
- (void)sizeObservingView:(id)a3 didChangeSize:(CGSize)a4;
@end

@implementation SBFluidSwitcherPortaledSceneLiveContentOverlay

- (SBFluidSwitcherPortaledSceneLiveContentOverlay)initWithSceneHandle:(id)a3 referenceSize:(CGSize)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 livePortalView:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v14 = a3;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)SBFluidSwitcherPortaledSceneLiveContentOverlay;
  v16 = [(SBFluidSwitcherPortaledSceneLiveContentOverlay *)&v24 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_sceneHandle, a3);
    v17->_referenceSize.double width = width;
    v17->_referenceSize.double height = height;
    v17->_contentOrientation = a5;
    v17->_containerOrientation = a6;
    objc_storeStrong((id *)&v17->_livePortalView, a7);
    uint64_t v18 = objc_msgSend(v14, "newSceneViewWithReferenceSize:contentOrientation:containerOrientation:hostRequester:", a5, a6, v17, width, height);
    sceneView = v17->_sceneView;
    v17->_sceneView = (SBDeviceApplicationSceneView *)v18;

    [(SBSceneView *)v17->_sceneView setCustomContentView:v17->_livePortalView];
    [(SBSceneView *)v17->_sceneView setDisplayMode:1 animationFactory:0 completion:0];
    id v20 = objc_alloc(MEMORY[0x1E4FA7D38]);
    SBRectWithSize();
    uint64_t v21 = objc_msgSend(v20, "initWithFrame:");
    sizeObservingView = v17->_sizeObservingView;
    v17->_sizeObservingView = (SBUISizeObservingView *)v21;

    [(SBUISizeObservingView *)v17->_sizeObservingView setDelegate:v17];
    [(SBUISizeObservingView *)v17->_sizeObservingView addSubview:v17->_sceneView];
    -[SBFluidSwitcherPortaledSceneLiveContentOverlay sizeObservingView:didChangeSize:](v17, "sizeObservingView:didChangeSize:", v17->_sizeObservingView, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }

  return v17;
}

- (id)sceneViewPresentationIdentifier:(id)a3
{
  v3 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v3);
}

- (int64_t)sceneViewPresentationPriority:(id)a3
{
  return -1;
}

- (UIView)contentOverlayView
{
  return (UIView *)self->_sizeObservingView;
}

- (BOOL)isContentUpdating
{
  return 0;
}

- (BOOL)isAsyncRenderingEnabled
{
  return 0;
}

- (BOOL)wantsEnhancedWindowingEnabled
{
  return 0;
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
  return 0;
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
  return *MEMORY[0x1E4F43D08];
}

- (id)liveSceneIdentityToken
{
  return 0;
}

- (id)overlaySceneHandle
{
  return 0;
}

- (BOOL)isDisplayLayoutElementActive
{
  return 0;
}

- (int64_t)overlayType
{
  return 4;
}

- (id)contentViewController
{
  return 0;
}

- (void)sizeObservingView:(id)a3 didChangeSize:(CGSize)a4
{
  if (objc_msgSend(a3, "isEqual:", self->_sizeObservingView, a4.width, a4.height))
  {
    sceneView = self->_sceneView;
    [(SBUISizeObservingView *)self->_sizeObservingView bounds];
    -[SBDeviceApplicationSceneView setFrame:](sceneView, "setFrame:");
  }
}

- (SBSwitcherLiveContentOverlayDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (SBSwitcherLiveContentOverlayDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)resizesHostedContext
{
  return self->resizesHostedContext;
}

- (void)setResizesHostedContext:(BOOL)a3
{
  self->resizesHostedContext = a3;
}

- (BOOL)isMaximized
{
  return self->maximized;
}

- (void)setMaximized:(BOOL)a3
{
  self->maximized = a3;
}

- (UIRectCornerRadii)cornerRadii
{
  double topLeft = self->cornerRadii.topLeft;
  double bottomLeft = self->cornerRadii.bottomLeft;
  double bottomRight = self->cornerRadii.bottomRight;
  double topRight = self->cornerRadii.topRight;
  result.double topRight = topRight;
  result.double bottomRight = bottomRight;
  result.double bottomLeft = bottomLeft;
  result.double topLeft = topLeft;
  return result;
}

- (void)setCornerRadii:(UIRectCornerRadii)a3
{
  self->cornerRadii = a3;
}

- (SBDeviceApplicationSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (CGSize)referenceSize
{
  double width = self->_referenceSize.width;
  double height = self->_referenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)contentOrientation
{
  return self->_contentOrientation;
}

- (int64_t)containerOrientation
{
  return self->_containerOrientation;
}

- (UIView)livePortalView
{
  return self->_livePortalView;
}

- (SBUISizeObservingView)sizeObservingView
{
  return self->_sizeObservingView;
}

- (SBDeviceApplicationSceneView)sceneView
{
  return self->_sceneView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_sizeObservingView, 0);
  objc_storeStrong((id *)&self->_livePortalView, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
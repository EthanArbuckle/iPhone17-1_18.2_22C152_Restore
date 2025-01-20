@interface SBShelfLiveContentOverlay
- (BOOL)isAsyncRenderingEnabled;
- (BOOL)isContentUpdating;
- (BOOL)isDisplayLayoutElementActive;
- (BOOL)isMaximized;
- (BOOL)isPendingSwitcherSnapshotCacheUpdate;
- (BOOL)requiresLegacyRotationSupport;
- (BOOL)resizesHostedContext;
- (BOOL)wantsEnhancedWindowingEnabled;
- (SBDeviceApplicationSceneHandle)sceneHandle;
- (SBShelfLiveContentOverlay)initWithSceneHandle:(id)a3 referenceSize:(CGSize)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 livePortalView:(id)a7;
- (SBSwitcherLiveContentOverlayDelegate)delegate;
- (UIRectCornerRadii)cornerRadii;
- (UIView)contentOverlayView;
- (double)currentStatusBarHeight;
- (id)backgroundActivitiesToSuppress;
- (id)liveSceneIdentityToken;
- (id)overlaySceneHandle;
- (id)prepareOverlayForContentRotation;
- (id)sceneViewPresentationIdentifier:(id)a3;
- (int64_t)leadingStatusBarStyle;
- (int64_t)preferredInterfaceOrientation;
- (int64_t)sceneViewPresentationPriority:(id)a3;
- (int64_t)touchBehavior;
- (int64_t)trailingStatusBarStyle;
- (unint64_t)displayMode;
- (unint64_t)supportedInterfaceOrientations;
- (void)_updateSceneViewInSideSizeObservingViewIfNecessary;
- (void)setCornerRadii:(UIRectCornerRadii)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayMode:(unint64_t)a3;
- (void)setMaximized:(BOOL)a3;
- (void)setPendingSwitcherSnapshotCacheUpdate:(BOOL)a3;
- (void)setResizesHostedContext:(BOOL)a3;
- (void)setWantsEnhancedWindowingEnabled:(BOOL)a3;
- (void)sizeObservingView:(id)a3 didChangeSize:(CGSize)a4;
@end

@implementation SBShelfLiveContentOverlay

- (SBShelfLiveContentOverlay)initWithSceneHandle:(id)a3 referenceSize:(CGSize)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 livePortalView:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v14 = a3;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)SBShelfLiveContentOverlay;
  v16 = [(SBShelfLiveContentOverlay *)&v24 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_sceneHandle, a3);
    uint64_t v18 = -[SBDeviceApplicationSceneHandle newSceneViewWithReferenceSize:contentOrientation:containerOrientation:hostRequester:](v17->_sceneHandle, "newSceneViewWithReferenceSize:contentOrientation:containerOrientation:hostRequester:", a5, a6, v17, width, height);
    sceneView = v17->_sceneView;
    v17->_sceneView = (SBDeviceApplicationSceneView *)v18;

    [(SBSceneView *)v17->_sceneView setCustomContentView:v15];
    [(SBSceneView *)v17->_sceneView setDisplayMode:1 animationFactory:0 completion:0];
    id v20 = objc_alloc(MEMORY[0x1E4FA7D38]);
    uint64_t v21 = objc_msgSend(v20, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sizeObservingView = v17->_sizeObservingView;
    v17->_sizeObservingView = (SBUISizeObservingView *)v21;

    [(SBUISizeObservingView *)v17->_sizeObservingView setDelegate:v17];
    [(SBUISizeObservingView *)v17->_sizeObservingView addSubview:v17->_sceneView];
    [(SBShelfLiveContentOverlay *)v17 _updateSceneViewInSideSizeObservingViewIfNecessary];
  }

  return v17;
}

- (void)setDisplayMode:(unint64_t)a3
{
  if (a3 == 1)
  {
    sceneView = self->_sceneView;
    uint64_t v4 = [MEMORY[0x1E4F4F898] factoryWithDuration:0.35];
    v5 = sceneView;
    uint64_t v6 = 1;
  }
  else
  {
    if (a3) {
      return;
    }
    v3 = self->_sceneView;
    uint64_t v4 = [MEMORY[0x1E4F4F898] factoryWithDuration:0.35];
    v5 = v3;
    uint64_t v6 = 2;
  }
  id v8 = (id)v4;
  -[SBSceneView setDisplayMode:animationFactory:completion:](v5, "setDisplayMode:animationFactory:completion:", v6);
}

- (void)sizeObservingView:(id)a3 didChangeSize:(CGSize)a4
{
  if (self->_sizeObservingView == a3) {
    [(SBShelfLiveContentOverlay *)self _updateSceneViewInSideSizeObservingViewIfNecessary];
  }
}

- (void)_updateSceneViewInSideSizeObservingViewIfNecessary
{
  [(SBUISizeObservingView *)self->_sizeObservingView bounds];
  double v4 = v3;
  double v6 = v5;
  [(SBSceneView *)self->_sceneView referenceSize];
  double v8 = v7;
  double v10 = v9;
  unint64_t v11 = [(SBSceneView *)self->_sceneView orientation] - 3;
  if (v11 >= 2) {
    double v12 = v8;
  }
  else {
    double v12 = v10;
  }
  sceneView = self->_sceneView;
  if (v12 >= v4)
  {
    SBRectWithSize();
    -[SBDeviceApplicationSceneView setBounds:](sceneView, "setBounds:");
    -[SBDeviceApplicationSceneView setCenter:](self->_sceneView, "setCenter:", v4 * 0.5, v6 * 0.5);
    v17 = self->_sceneView;
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v19[0] = *MEMORY[0x1E4F1DAB8];
    v19[1] = v18;
    v19[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(SBDeviceApplicationSceneView *)v17 setTransform:v19];
  }
  else
  {
    if (v11 >= 2) {
      double v14 = v10;
    }
    else {
      double v14 = v8;
    }
    SBRectWithSize();
    -[SBDeviceApplicationSceneView setBounds:](sceneView, "setBounds:");
    id v15 = self->_sceneView;
    CGFloat v16 = v4 / v12;
    CGAffineTransformMakeScale(&v20, v16, v16);
    [(SBDeviceApplicationSceneView *)v15 setTransform:&v20];
    -[SBDeviceApplicationSceneView setCenter:](self->_sceneView, "setCenter:", v12 * v16 * 0.5, v14 * v16 * 0.5);
  }
}

- (UIView)contentOverlayView
{
  return (UIView *)self->_sizeObservingView;
}

- (BOOL)requiresLegacyRotationSupport
{
  return 0;
}

- (BOOL)isContentUpdating
{
  return 0;
}

- (int64_t)leadingStatusBarStyle
{
  return 0;
}

- (double)currentStatusBarHeight
{
  return *MEMORY[0x1E4F43D08];
}

- (int64_t)preferredInterfaceOrientation
{
  return 1;
}

- (id)prepareOverlayForContentRotation
{
  return 0;
}

- (id)overlaySceneHandle
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (int64_t)trailingStatusBarStyle
{
  return 0;
}

- (int64_t)touchBehavior
{
  return 1;
}

- (id)backgroundActivitiesToSuppress
{
  return 0;
}

- (id)liveSceneIdentityToken
{
  return 0;
}

- (BOOL)isDisplayLayoutElementActive
{
  return 0;
}

- (id)sceneViewPresentationIdentifier:(id)a3
{
  return @"Shelf";
}

- (int64_t)sceneViewPresentationPriority:(id)a3
{
  return -1;
}

- (BOOL)isAsyncRenderingEnabled
{
  return self->asyncRenderingEnabled;
}

- (BOOL)resizesHostedContext
{
  return self->resizesHostedContext;
}

- (void)setResizesHostedContext:(BOOL)a3
{
  self->resizesHostedContext = a3;
}

- (SBSwitcherLiveContentOverlayDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (SBSwitcherLiveContentOverlayDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)wantsEnhancedWindowingEnabled
{
  return self->wantsEnhancedWindowingEnabled;
}

- (void)setWantsEnhancedWindowingEnabled:(BOOL)a3
{
  self->wantsEnhancedWindowingEnabled = a3;
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

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (BOOL)isPendingSwitcherSnapshotCacheUpdate
{
  return self->_pendingSwitcherSnapshotCacheUpdate;
}

- (void)setPendingSwitcherSnapshotCacheUpdate:(BOOL)a3
{
  self->_pendingSwitcherSnapshotCacheUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->contentOverlayView, 0);
  objc_storeStrong((id *)&self->_sizeObservingView, 0);
  objc_storeStrong((id *)&self->_sceneView, 0);
}

@end
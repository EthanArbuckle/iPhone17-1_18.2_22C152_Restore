@interface SBDeviceApplicationSceneView
- (BOOL)_anyOverlayViewNeedsCounterRotation;
- (BOOL)_contentPrefersToDisableClipping;
- (BOOL)_representsTranslucentContent;
- (BOOL)_sceneDrivesOwnRotation;
- (BOOL)_useClassicWrapperView;
- (BOOL)_wantsBlackBackground;
- (BOOL)forcesStatusBarHidden;
- (BOOL)isActive;
- (BOOL)isVisible;
- (NSString)description;
- (SBApplicationSceneViewStatusBarDescriptor)statusBarDescriptor;
- (SBDeviceApplicationSceneView)initWithSceneHandle:(id)a3 referenceSize:(CGSize)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 hostRequester:(id)a7;
- (SBHomeGrabberView)homeGrabberView;
- (UIEdgeInsets)_contentContainerEdgeInsets;
- (double)_contentContainerCornerRadius;
- (double)cornerRadius;
- (double)statusBarAlpha;
- (id)_adjustedOverlayViewPriorities;
- (id)_transitionViewForHostView;
- (id)prepareForContentRotation;
- (int64_t)_wallpaperStyle;
- (unint64_t)maskedCorners;
- (void)_cleanUpTransitionOverlayView:(id)a3;
- (void)_configureSceneLiveHostView:(id)a3;
- (void)_configureSceneLiveSnapshotView:(id)a3;
- (void)_configureSceneSnapshotContext:(id)a3;
- (void)_createClassicWrapperViewIfNecessaryForHostView:(id)a3;
- (void)_createHostCounterRotationViewIfNecessary;
- (void)_enumerateOrderedOverlayViewPriorities:(id)a3;
- (void)_invalidateSceneLiveHostView:(id)a3;
- (void)_layoutLiveHostView:(id)a3;
- (void)_layoutLiveSnapshotView:(id)a3;
- (void)_maybeStartTrackingRotationForOverlayFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4;
- (void)_refresh;
- (void)_sceneHandleDidUpdateClientSettingsWithDiff:(id)a3 transitionContext:(id)a4;
- (void)_sceneHandleDidUpdateSettingsWithDiff:(id)a3 previousSettings:(id)a4;
- (void)_setCounterRotationViewTransformUpdatesPaused:(BOOL)a3;
- (void)_setOrientation:(int64_t)a3;
- (void)_tearDownHostCounterRotationViewIfNecessary;
- (void)_updateDragAndDropExclusionDebugViewsIfNecessary;
- (void)_updateEdgeProtectAndAutoHideOnHomeGrabberView;
- (void)_updateReferenceSize:(CGSize)a3 andOrientation:(int64_t)a4;
- (void)_updateStatusBarVisibilityForHostView;
- (void)_windowManagementStyleDidChange:(id)a3;
- (void)addOverlayView:(id)a3 withPriority:(int64_t)a4;
- (void)applicationSceneCompatibilityModeAnimatingChangeTo:(int64_t)a3;
- (void)containerViewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)createClassicAccessoryViewIfNecessary;
- (void)createHomeGrabberViewIfNecessaryWithSettings:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)enableTransitionOverlay:(BOOL)a3;
- (void)invalidate;
- (void)layoutSubviews;
- (void)noteApplicationClassicPhoneSceneOrientationPreferenceChangingForUserAction:(BOOL)a3;
- (void)overlayViewDidChangeCounterRotationRequirement:(id)a3;
- (void)overlayViewDidRotate:(id)a3 toInterfaceOrientation:(int64_t)a4;
- (void)removeOverlayView:(id)a3 withPriority:(int64_t)a4;
- (void)setActive:(BOOL)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCornerRadius:(double)a3;
- (void)setForcesStatusBarHidden:(BOOL)a3;
- (void)setMaskedCorners:(unint64_t)a3;
- (void)setStatusBarAlpha:(double)a3;
- (void)setStatusBarDescriptor:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)tearDownHomeGrabberView;
- (void)teardownClassicAccessoryViewIfNecessary;
- (void)willRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 alongsideContainerView:(id)a5 animated:(BOOL)a6;
@end

@implementation SBDeviceApplicationSceneView

- (double)_contentContainerCornerRadius
{
  return 0.0;
}

- (UIEdgeInsets)_contentContainerEdgeInsets
{
  double v2 = *MEMORY[0x1E4F437F8];
  double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setForcesStatusBarHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBDeviceApplicationSceneView *)self forcesStatusBarHidden] != a3)
  {
    double v5 = [(SBDeviceApplicationSceneView *)self statusBarDescriptor];
    [v5 setForceHidden:v3];

    if ([(SBSceneView *)self effectiveDisplayMode] == 4)
    {
      [(SBDeviceApplicationSceneView *)self _updateStatusBarVisibilityForHostView];
    }
  }
}

- (BOOL)forcesStatusBarHidden
{
  double v2 = [(SBDeviceApplicationSceneView *)self statusBarDescriptor];
  char v3 = [v2 isForcedHidden];

  return v3;
}

- (SBApplicationSceneViewStatusBarDescriptor)statusBarDescriptor
{
  return self->_statusBarDescriptor;
}

- (BOOL)_contentPrefersToDisableClipping
{
  double v2 = [(SBSceneView *)self sceneHandle];
  char v3 = [v2 contentPrefersToDisableClipping];

  return v3;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SBDeviceApplicationSceneView *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)SBDeviceApplicationSceneView;
  -[SBDeviceApplicationSceneView setBounds:](&v16, sel_setBounds_, x, y, width, height);
  if (self->_waitingForBoundsUpdateDuringRotation)
  {
    v17.origin.double x = v9;
    v17.origin.double y = v11;
    v17.size.double width = v13;
    v17.size.double height = v15;
    v18.origin.double x = x;
    v18.origin.double y = y;
    v18.size.double width = width;
    v18.size.double height = height;
    if (!CGRectEqualToRect(v17, v18))
    {
      self->_waitingForBoundsUpdateDuringRotation = 0;
      self->_overlayOrientationAtStartOfRotation = 0;
      [(SBDeviceApplicationSceneView *)self _setCounterRotationViewTransformUpdatesPaused:0];
    }
  }
  [(SBSceneView *)self _updateBackgroundColor];
}

- (void)_updateEdgeProtectAndAutoHideOnHomeGrabberView
{
  id v7 = [(SBDeviceApplicationSceneView *)self homeGrabberView];
  char v3 = [(SBSceneView *)self sceneHandle];
  int v4 = [v3 isAutoHideEnabledForHomeAffordance];

  grabberSettings = self->_grabberSettings;
  if (v4)
  {
    [(SBFHomeGrabberSettings *)grabberSettings autoHideTimeOnAppRequest];
    objc_msgSend(v7, "turnOnAutoHideWithInitialDelay:");
  }
  else
  {
    [(SBFHomeGrabberSettings *)grabberSettings delayForUnhideOnAppRequest];
    objc_msgSend(v7, "turnOffAutoHideWithDelay:");
  }
  v6 = [(SBSceneView *)self sceneHandle];
  objc_msgSend(v7, "setEdgeProtectEnabled:", objc_msgSend(v6, "isEdgeProtectEnabledForHomeGesture"));
}

- (SBHomeGrabberView)homeGrabberView
{
  return [(SBHomeGrabberRotationView *)self->_grabberRotationView grabberView];
}

void __120__SBDeviceApplicationSceneView_initWithSceneHandle_referenceSize_contentOrientation_containerOrientation_hostRequester___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _updateStatusBarVisibilityForHostView];
    if ([v6 _sceneDrivesOwnRotation])
    {
      id v7 = [v4 uiClientSettings];
      uint64_t v8 = objc_msgSend(v7, "sb_effectiveInterfaceOrientation");

      [v6[81] setOrientation:v8];
      CGFloat v9 = SBLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        double v10 = [v6 homeGrabberView];
        CGFloat v11 = BSInterfaceOrientationDescription();
        int v12 = 134218242;
        CGFloat v13 = v10;
        __int16 v14 = 2114;
        CGFloat v15 = v11;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "%p setting affordance orientation to %{public}@ for scene creation", (uint8_t *)&v12, 0x16u);
      }
    }
  }
}

- (void)_configureSceneLiveHostView:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_currentHostView, v4);
  [(SBDeviceApplicationSceneView *)self _updateStatusBarVisibilityForHostView];
  [(SBDeviceApplicationSceneView *)self createClassicAccessoryViewIfNecessary];
  [(SBDeviceApplicationSceneView *)self _createClassicWrapperViewIfNecessaryForHostView:v4];
  if (![(SBDeviceApplicationSceneView *)self _useClassicWrapperView])
  {
    v8.receiver = self;
    v8.super_class = (Class)SBDeviceApplicationSceneView;
    [(SBSceneView *)&v8 _configureSceneLiveHostView:v4];
  }
  [(BSInvalidatable *)self->_snapshottingInfoAssertion invalidate];
  double v5 = [(SBSceneView *)self sceneHandle];
  v6 = [v5 _sceneHostingInfoForSnapshottingAssertionWithView:v4];
  snapshottingInfoAssertion = self->_snapshottingInfoAssertion;
  self->_snapshottingInfoAssertion = v6;
}

- (void)_layoutLiveSnapshotView:(id)a3
{
  id v4 = a3;
  if ([(SBDeviceApplicationSceneView *)self _useClassicWrapperView])
  {
    [(SBDeviceApplicationSceneClassicWrapperView *)self->_classicWrapperView addContentView:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBDeviceApplicationSceneView;
    [(SBSceneView *)&v5 _layoutLiveSnapshotView:v4];
  }
}

- (BOOL)_wantsBlackBackground
{
  BOOL v3 = [(SBDeviceApplicationSceneView *)self _useClassicWrapperView];
  if (v3)
  {
    classicWrapperView = self->_classicWrapperView;
    LOBYTE(v3) = [(SBDeviceApplicationSceneClassicWrapperView *)classicWrapperView wantsBlackBackground];
  }
  return v3;
}

- (BOOL)_useClassicWrapperView
{
  double v2 = [(SBSceneView *)self sceneHandle];
  BOOL v3 = +[SBDeviceApplicationSceneClassicWrapperView shouldUseWrapperViewForSceneHandle:v2];

  return v3;
}

- (void)_updateStatusBarVisibilityForHostView
{
  BOOL v3 = [(SBSceneView *)self sceneHandle];
  id v4 = [v3 sceneIfExists];

  if (self->_statusBarLayerTarget)
  {
    objc_super v5 = [(SBSceneView *)self presenter];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__SBDeviceApplicationSceneView__updateStatusBarVisibilityForHostView__block_invoke;
    v12[3] = &unk_1E6AF51C8;
    v12[4] = self;
    [v5 modifyPresentationContext:v12];
  }
  v6 = [v4 clientSettings];
  uint64_t v7 = [v6 statusBarContextID];

  if (v7)
  {
    objc_super v8 = [MEMORY[0x1E4F42D70] targetForContextID:v7];
    statusBarLayerTarget = self->_statusBarLayerTarget;
    self->_statusBarLayerTarget = v8;

    double v10 = [(SBSceneView *)self presenter];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__SBDeviceApplicationSceneView__updateStatusBarVisibilityForHostView__block_invoke_2;
    v11[3] = &unk_1E6AF51C8;
    v11[4] = self;
    [v10 modifyPresentationContext:v11];
  }
}

- (void)createClassicAccessoryViewIfNecessary
{
  if (!self->_classicAccessoryView)
  {
    BOOL v3 = [(SBSceneView *)self sceneHandle];
    id v4 = [v3 application];
    int v5 = [v4 classicAppPhoneAppRunningOnPad];

    if (v5)
    {
      v6 = [SBDeviceApplicationSceneClassicAccessoryView alloc];
      [(SBDeviceApplicationSceneView *)self bounds];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      CGFloat v15 = [(SBSceneView *)self sceneHandle];
      uint64_t v16 = -[SBDeviceApplicationSceneClassicAccessoryView initWithFrame:sceneHandle:](v6, "initWithFrame:sceneHandle:", v15, v8, v10, v12, v14);
      classicAccessoryView = self->_classicAccessoryView;
      self->_classicAccessoryView = v16;

      [(SBDeviceApplicationSceneView *)self addSubview:self->_classicAccessoryView];
      CGRect v18 = self->_classicAccessoryView;
      [(SBDeviceApplicationSceneClassicAccessoryView *)v18 setDelegate:self];
    }
  }
}

- (void)_createClassicWrapperViewIfNecessaryForHostView:(id)a3
{
  id v11 = a3;
  BOOL v4 = [(SBDeviceApplicationSceneView *)self _useClassicWrapperView];
  classicWrapperView = self->_classicWrapperView;
  if (v4)
  {
    if (!classicWrapperView)
    {
      v6 = [SBDeviceApplicationSceneClassicWrapperView alloc];
      double v7 = [(SBSceneView *)self sceneHandle];
      double v8 = [(SBDeviceApplicationSceneClassicWrapperView *)v6 initWithSceneHandle:v7];
      double v9 = self->_classicWrapperView;
      self->_classicWrapperView = v8;

      [(SBDeviceApplicationSceneClassicWrapperView *)self->_classicWrapperView setOrientation:[(SBSceneView *)self orientation]];
      [(SBDeviceApplicationSceneView *)self addSubview:self->_classicWrapperView];
    }
    [(SBDeviceApplicationSceneView *)self _layoutLiveHostView:v11];
    [(SBDeviceApplicationSceneClassicWrapperView *)self->_classicWrapperView addContentView:v11];
  }
  else
  {
    [(SBDeviceApplicationSceneClassicWrapperView *)classicWrapperView removeFromSuperview];
    double v10 = self->_classicWrapperView;
    self->_classicWrapperView = 0;
  }
}

- (BOOL)_sceneDrivesOwnRotation
{
  double v2 = [(SBSceneView *)self sceneHandle];
  BOOL v3 = [v2 _interfaceOrientationMode] == 100;

  return v3;
}

void __120__SBDeviceApplicationSceneView_initWithSceneHandle_referenceSize_contentOrientation_containerOrientation_hostRequester___block_invoke_22(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  int v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _sceneHandleDidUpdateClientSettingsWithDiff:v7 transitionContext:v6];
}

- (void)_sceneHandleDidUpdateClientSettingsWithDiff:(id)a3 transitionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    CGFloat v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"-[SBDeviceApplicationSceneView _sceneHandleDidUpdateClientSettingsWithDiff:transitionContext:]"];
    [v15 handleFailureInFunction:v16 file:@"SBDeviceApplicationSceneView.m" lineNumber:700 description:@"this call must be made on the main thread"];
  }
  if (!self->_clientSettingsInspector)
  {
    double v8 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F42768]);
    clientSettingsInspector = self->_clientSettingsInspector;
    self->_clientSettingsInspector = v8;

    objc_initWeak(location, self);
    double v10 = self->_clientSettingsInspector;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke;
    v29[3] = &unk_1E6AF85E0;
    CGRect v17 = &v30;
    objc_copyWeak(&v30, location);
    [(UIApplicationSceneClientSettingsDiffInspector *)v10 observeStatusBarContextIDWithBlock:v29];
    id v11 = self->_clientSettingsInspector;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_2;
    v27[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v28, location);
    [(UIApplicationSceneClientSettingsDiffInspector *)v11 observeBackgroundStyleWithBlock:v27];
    double v12 = self->_clientSettingsInspector;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_4;
    v25[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v26, location);
    [(UIApplicationSceneClientSettingsDiffInspector *)v12 observeInterfaceOrientationWithBlock:v25];
    double v13 = self->_clientSettingsInspector;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_98;
    v23[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v24, location);
    [(UIApplicationSceneClientSettingsDiffInspector *)v13 observeHomeIndicatorAutoHiddenWithBlock:v23];
    double v14 = self->_clientSettingsInspector;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_2_99;
    v21 = &unk_1E6AF85E0;
    objc_copyWeak(&v22, location);
    [(UIApplicationSceneClientSettingsDiffInspector *)v14 observeScreenEdgesDeferringSystemGesturesWithBlock:&v18];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(location);
  }
  [(SBDeviceApplicationSceneView *)self _updateDragAndDropExclusionDebugViewsIfNecessary];
  [(UIApplicationSceneClientSettingsDiffInspector *)self->_clientSettingsInspector inspectDiff:v6 withContext:v7];
}

- (void)layoutSubviews
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([(SBDeviceApplicationSceneClassicWrapperView *)self->_classicWrapperView suppressLayoutUpdatesForStartOfClassicPhoneAppRotation])
  {
    return;
  }
  v33.receiver = self;
  v33.super_class = (Class)SBDeviceApplicationSceneView;
  [(SBSceneView *)&v33 layoutSubviews];
  [(SBDeviceApplicationSceneView *)self bounds];
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  if (self->_hostCounterRotationView)
  {
    -[SBDeviceApplicationSceneView bringSubviewToFront:](self, "bringSubviewToFront:");
    uint64_t v11 = [(SBSceneView *)self orientation];
    double v12 = [(SBSceneView *)self sceneHandle];
    double v13 = [v12 application];
    int v14 = [v13 classicAppPhoneAppRunningOnPad];

    if (v14) {
      uint64_t v11 = [(id)SBApp interfaceOrientationForCurrentDeviceOrientation:0];
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v30 = 0u;
    SBFTransformFromOrientationToOrientation();
    [(SBDeviceApplicationSceneView *)self center];
    double v17 = v15;
    double v18 = v16;
    if (self->_waitingForBoundsUpdateDuringRotation)
    {
      double v19 = v10;
      double v20 = v9;
      if ((unint64_t)(self->_overlayOrientationAtStartOfRotation - 3) > 1)
      {
LABEL_8:
        -[_UIDirectionalRotationView setCenter:](self->_hostCounterRotationView, "setCenter:", v15, v16);
        -[_UIDirectionalRotationView setBounds:](self->_hostCounterRotationView, "setBounds:", v7, v8, v20, v19);
        if (!self->_counterRotationViewTransformUpdatesPaused)
        {
          hostCounterRotationView = self->_hostCounterRotationView;
          *(_OWORD *)buf = v30;
          *(_OWORD *)&buf[16] = v31;
          long long v35 = v32;
          [(_UIDirectionalRotationView *)hostCounterRotationView setTransform:buf];
        }
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __46__SBDeviceApplicationSceneView_layoutSubviews__block_invoke;
        v29[3] = &unk_1E6B05A58;
        void v29[4] = self;
        v29[5] = v11;
        *(double *)&v29[6] = v17;
        *(double *)&v29[7] = v18;
        *(double *)&v29[8] = v7;
        *(double *)&v29[9] = v8;
        *(double *)&v29[10] = v20;
        *(double *)&v29[11] = v19;
        *(double *)&v29[12] = v7;
        *(double *)&v29[13] = v8;
        *(double *)&v29[14] = v9;
        *(double *)&v29[15] = v10;
        [(SBDeviceApplicationSceneView *)self _enumerateOrderedOverlayViewPriorities:v29];
        if (self->_grabberLivesInCounterRotationView)
        {
          -[SBHomeGrabberRotationView setFrame:](self->_grabberRotationView, "setFrame:", v7, v8, v20, v19);
          [(_UIDirectionalRotationView *)self->_hostCounterRotationView bringSubviewToFront:self->_grabberRotationView];
        }
        id v22 = SBLogHomeAffordance();
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);

        if (v23)
        {
          [(SBDeviceApplicationSceneView *)self bounds];
          id v24 = NSStringFromCGRect(v37);
          [(_UIDirectionalRotationView *)self->_hostCounterRotationView bounds];
          v25 = NSStringFromCGRect(v38);
          [(SBSceneView *)self orientation];
          id v26 = BSInterfaceOrientationDescription();
          v27 = SBLogHomeAffordance();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218754;
            *(void *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v24;
            *(_WORD *)&buf[22] = 2114;
            *(void *)&buf[24] = v25;
            LOWORD(v35) = 2114;
            *(void *)((char *)&v35 + 2) = v26;
            _os_log_debug_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_DEBUG, "%p laying out sceneView - scene=%{public}@ counter=%{public}@-%{public}@", buf, 0x2Au);
          }
        }
        goto LABEL_17;
      }
    }
    else
    {
      double v19 = v10;
      double v20 = v9;
      if ((unint64_t)(v11 - 3) >= 2) {
        goto LABEL_8;
      }
    }
    double v19 = v9;
    double v20 = v10;
    goto LABEL_8;
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __46__SBDeviceApplicationSceneView_layoutSubviews__block_invoke_76;
  v28[3] = &unk_1E6B05A80;
  v28[4] = self;
  *(double *)&v28[5] = v3;
  *(double *)&v28[6] = v4;
  *(double *)&v28[7] = v5;
  *(double *)&v28[8] = v6;
  [(SBDeviceApplicationSceneView *)self _enumerateOrderedOverlayViewPriorities:v28];
LABEL_17:
  if (self->_classicAccessoryView)
  {
    -[SBDeviceApplicationSceneView bringSubviewToFront:](self, "bringSubviewToFront:");
    -[SBDeviceApplicationSceneClassicAccessoryView setFrame:](self->_classicAccessoryView, "setFrame:", v7, v8, v9, v10);
  }
  if (self->_grabberRotationView)
  {
    if (!self->_grabberLivesInCounterRotationView)
    {
      -[SBDeviceApplicationSceneView bringSubviewToFront:](self, "bringSubviewToFront:");
      -[SBHomeGrabberRotationView setFrame:](self->_grabberRotationView, "setFrame:", v7, v8, v9, v10);
    }
  }
  [(SBDeviceApplicationSceneView *)self _updateDragAndDropExclusionDebugViewsIfNecessary];
}

- (void)_updateDragAndDropExclusionDebugViewsIfNecessary
{
  double v2 = self;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  multitaskingExclusionRectDebugViews = self->_multitaskingExclusionRectDebugViews;
  if (multitaskingExclusionRectDebugViews)
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    double v4 = multitaskingExclusionRectDebugViews;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v58 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v57 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v57 objects:v62 count:16];
      }
      while (v6);
    }

    [(NSMutableArray *)v2->_multitaskingExclusionRectDebugViews removeAllObjects];
  }
  double v9 = +[SBMedusaDomain rootSettings];
  int v10 = [v9 showContentDragExclusionRects];

  if (v10)
  {
    uint64_t v11 = [(SBSceneView *)v2 sceneHandle];
    double v12 = [v11 sceneIfExists];

    if (v12)
    {
      double v13 = [v12 clientSettings];
      if ([v13 isUISubclass])
      {
        v50 = v13;
        [v13 multitaskingDragExclusionRects];
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = [obj countByEnumeratingWithState:&v53 objects:v61 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          double v16 = &off_1E6AF0000;
          uint64_t v17 = *(void *)v54;
          unint64_t v18 = 0x1E4F42000uLL;
          do
          {
            uint64_t v19 = 0;
            uint64_t v51 = v15;
            do
            {
              if (*(void *)v54 != v17) {
                objc_enumerationMutation(obj);
              }
              [*(id *)(*((void *)&v53 + 1) + 8 * v19) CGRectValue];
              double v21 = v20;
              double v23 = v22;
              double v25 = v24;
              double v27 = v26;
              id v28 = v16[117];
              v29 = [*(id *)(v18 + 3472) mainScreen];
              long long v30 = [v29 fixedCoordinateSpace];
              long long v31 = [v28 coordinateSpaceForInterfaceOrientation:1 withReferenceCoordinateSpace:v30 inOrientation:1];

              long long v32 = v16[117];
              objc_super v33 = [v12 settings];
              [v33 frame];
              v34 = objc_msgSend(v32, "coordinateSpaceForFrame:withinCoordinateSpace:", v31);

              -[SBDeviceApplicationSceneView convertRect:fromCoordinateSpace:](v2, "convertRect:fromCoordinateSpace:", v34, v21, v23, v25, v27);
              double x = v64.origin.x;
              double y = v64.origin.y;
              double width = v64.size.width;
              double height = v64.size.height;
              if (!CGRectIsNull(v64))
              {
                uint64_t v39 = v17;
                v40 = v16;
                v41 = v12;
                v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA6028]), "initWithFrame:", x, y, width, height);
                v43 = [v42 layer];
                [v43 setAllowsHitTesting:0];

                v44 = [MEMORY[0x1E4F428B8] redColor];
                [v44 colorWithAlphaComponent:0.5];
                v46 = v45 = v2;
                [v42 setBackgroundColor:v46];

                double v2 = v45;
                v47 = v45->_multitaskingExclusionRectDebugViews;
                if (!v47)
                {
                  v48 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  v49 = v45->_multitaskingExclusionRectDebugViews;
                  v45->_multitaskingExclusionRectDebugViews = v48;

                  v47 = v45->_multitaskingExclusionRectDebugViews;
                }
                [(NSMutableArray *)v47 addObject:v42];
                [(SBDeviceApplicationSceneView *)v45 addSubview:v42];

                double v12 = v41;
                double v16 = v40;
                uint64_t v17 = v39;
                unint64_t v18 = 0x1E4F42000;
                uint64_t v15 = v51;
              }

              ++v19;
            }
            while (v15 != v19);
            uint64_t v15 = [obj countByEnumeratingWithState:&v53 objects:v61 count:16];
          }
          while (v15);
        }

        double v13 = v50;
      }
    }
  }
  else
  {
    double v12 = v2->_multitaskingExclusionRectDebugViews;
    v2->_multitaskingExclusionRectDebugViews = 0;
  }
}

- (void)_enumerateOrderedOverlayViewPriorities:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v4 = (void (**)(id, uint64_t))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(SBDeviceApplicationSceneView *)self _adjustedOverlayViewPriorities];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, [*(id *)(*((void *)&v10 + 1) + 8 * v9++) integerValue]);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

void __46__SBDeviceApplicationSceneView_layoutSubviews__block_invoke_76(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v3 = *(void **)(*(void *)(a1 + 32) + 672);
  double v4 = objc_msgSend(NSNumber, "numberWithInteger:", a2, 0);
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v10 needsCounterRotation] & 1) == 0)
        {
          objc_msgSend(v10, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
          [*(id *)(a1 + 32) bringSubviewToFront:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)_adjustedOverlayViewPriorities
{
  double v2 = [(NSMutableDictionary *)self->_overlayViewsByPriority objectForKeyedSubscript:&unk_1F334A7C0];

  if (v2) {
    return &unk_1F3348138;
  }
  else {
    return &unk_1F3348150;
  }
}

void __120__SBDeviceApplicationSceneView_initWithSceneHandle_referenceSize_contentOrientation_containerOrientation_hostRequester___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _sceneHandleDidUpdateSettingsWithDiff:v7 previousSettings:v6];
}

- (void)_sceneHandleDidUpdateSettingsWithDiff:(id)a3 previousSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v13 = [NSString stringWithUTF8String:"-[SBDeviceApplicationSceneView _sceneHandleDidUpdateSettingsWithDiff:previousSettings:]"];
    [v12 handleFailureInFunction:v13 file:@"SBDeviceApplicationSceneView.m" lineNumber:790 description:@"this call must be made on the main thread"];
  }
  sceneSettingsInspector = self->_sceneSettingsInspector;
  if (!sceneSettingsInspector)
  {
    uint64_t v9 = (UIApplicationSceneSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F42780]);
    long long v10 = self->_sceneSettingsInspector;
    self->_sceneSettingsInspector = v9;

    objc_initWeak(&location, self);
    long long v11 = self->_sceneSettingsInspector;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __87__SBDeviceApplicationSceneView__sceneHandleDidUpdateSettingsWithDiff_previousSettings___block_invoke;
    uint64_t v17 = &unk_1E6AF85E0;
    objc_copyWeak(&v18, &location);
    [(UIApplicationSceneSettingsDiffInspector *)v11 observeInterfaceOrientationWithBlock:&v14];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    sceneSettingsInspector = self->_sceneSettingsInspector;
  }
  -[UIApplicationSceneSettingsDiffInspector inspectDiff:withContext:](sceneSettingsInspector, "inspectDiff:withContext:", v6, 0, v14, v15, v16, v17);
}

- (id)_transitionViewForHostView
{
  classicWrapperView = self->_classicWrapperView;
  if (classicWrapperView)
  {
    double v3 = classicWrapperView;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBDeviceApplicationSceneView;
    double v3 = [(SBSceneView *)&v5 _transitionViewForHostView];
  }
  return v3;
}

- (SBDeviceApplicationSceneView)initWithSceneHandle:(id)a3 referenceSize:(CGSize)a4 contentOrientation:(int64_t)a5 containerOrientation:(int64_t)a6 hostRequester:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v14 = a3;
  id v15 = a7;
  if (([v14 isDeviceApplicationSceneHandle] & 1) == 0)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneView.m" lineNumber:124 description:@"This class requires a SBDeviceApplicationSceneHandle."];
  }
  v52.receiver = self;
  v52.super_class = (Class)SBDeviceApplicationSceneView;
  uint64_t v16 = -[SBApplicationSceneView initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:](&v52, sel_initWithSceneHandle_referenceSize_contentOrientation_containerOrientation_hostRequester_, v14, a5, a6, v15, width, height);
  if (v16)
  {
    uint64_t v17 = [[SBApplicationSceneViewStatusBarDescriptor alloc] initWithForceHidden:0];
    statusBarDescriptor = v16->_statusBarDescriptor;
    v16->_statusBarDescriptor = v17;

    v16->_statusBarAlpha = 1.0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = [v14 placeholderContentProvider];
      [(SBSceneView *)v16 setPlaceholderContentProvider:v19];
    }
    double v20 = [(SBSceneView *)v16 placeholderContentProvider];

    if (!v20)
    {
      double v21 = [SBDeviceApplicationSceneViewPlaceholderContentViewProvider alloc];
      double v22 = [v14 application];
      double v23 = [(SBDeviceApplicationSceneViewPlaceholderContentViewProvider *)v21 initWithApplication:v22];
      [(SBSceneView *)v16 setPlaceholderContentProvider:v23];
    }
    double v24 = [SBApplicationSceneBackgroundView alloc];
    [(SBDeviceApplicationSceneView *)v16 bounds];
    double v25 = -[SBApplicationSceneBackgroundView initWithFrame:](v24, "initWithFrame:");
    [(SBApplicationSceneBackgroundView *)v25 setWallpaperStyle:[(SBDeviceApplicationSceneView *)v16 _wallpaperStyle]];
    [(SBDeviceApplicationSceneView *)v16 setBackgroundView:v25];
    uint64_t v26 = [MEMORY[0x1E4FA5F28] rootSettings];
    grabberSettings = v16->_grabberSettings;
    v16->_grabberSettings = (SBFHomeGrabberSettings *)v26;

    uint64_t v28 = +[SBMedusaDomain rootSettings];
    medusaSettings = v16->_medusaSettings;
    v16->_medusaSettings = (SBMedusaSettings *)v28;

    objc_initWeak(&location, v16);
    long long v30 = (SBSceneHandleBlockObserver *)objc_alloc_init(MEMORY[0x1E4FA7978]);
    sceneHandleObserver = v16->_sceneHandleObserver;
    v16->_sceneHandleObserver = v30;

    [v14 addObserver:v16->_sceneHandleObserver];
    long long v32 = v16->_sceneHandleObserver;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __120__SBDeviceApplicationSceneView_initWithSceneHandle_referenceSize_contentOrientation_containerOrientation_hostRequester___block_invoke;
    v49[3] = &unk_1E6AFF110;
    objc_copyWeak(&v50, &location);
    id v33 = (id)[(SBSceneHandleBlockObserver *)v32 observeCreate:v49];
    v34 = v16->_sceneHandleObserver;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __120__SBDeviceApplicationSceneView_initWithSceneHandle_referenceSize_contentOrientation_containerOrientation_hostRequester___block_invoke_22;
    v47[3] = &unk_1E6AFF138;
    objc_copyWeak(&v48, &location);
    id v35 = (id)[(SBSceneHandleBlockObserver *)v34 observeDidUpdateClientSettings:v47];
    uint64_t v36 = v16->_sceneHandleObserver;
    uint64_t v42 = MEMORY[0x1E4F143A8];
    uint64_t v43 = 3221225472;
    v44 = __120__SBDeviceApplicationSceneView_initWithSceneHandle_referenceSize_contentOrientation_containerOrientation_hostRequester___block_invoke_2;
    v45 = &unk_1E6AFF160;
    objc_copyWeak(&v46, &location);
    id v37 = (id)[(SBSceneHandleBlockObserver *)v36 observeDidUpdateSettings:&v42];
    CGRect v38 = +[SBMedusaDomain rootSettings];
    [v38 addKeyObserver:v16];

    uint64_t v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v39 addObserver:v16 selector:sel__windowManagementStyleDidChange_ name:@"SBSwitcherControllerWindowManagementStyleDidChangeNotification" object:0];

    objc_destroyWeak(&v46);
    objc_destroyWeak(&v48);
    objc_destroyWeak(&v50);
    objc_destroyWeak(&location);
  }
  return v16;
}

- (void)setBackgroundView:(id)a3
{
  double v4 = (SBApplicationSceneBackgroundView *)a3;
  objc_super v5 = v4;
  if (!v4)
  {
    id v6 = [SBApplicationSceneBackgroundView alloc];
    [(SBDeviceApplicationSceneView *)self bounds];
    objc_super v5 = -[SBApplicationSceneBackgroundView initWithFrame:](v6, "initWithFrame:");
  }
  if (objc_opt_respondsToSelector()) {
    [(SBApplicationSceneBackgroundView *)v4 setWallpaperStyle:[(SBDeviceApplicationSceneView *)self _wallpaperStyle]];
  }
  if (objc_opt_respondsToSelector())
  {
    id v7 = [(SBSceneView *)self sceneHandle];
    uint64_t v8 = [v7 application];
    -[SBApplicationSceneBackgroundView setNeedsClassicModeBackground:](v4, "setNeedsClassicModeBackground:", [v8 isClassic]);
  }
  v9.receiver = self;
  v9.super_class = (Class)SBDeviceApplicationSceneView;
  [(SBSceneView *)&v9 setBackgroundView:v5];
}

- (int64_t)_wallpaperStyle
{
  double v2 = [(SBSceneView *)self sceneHandle];
  int64_t v3 = [v2 wallpaperStyle];

  return v3;
}

- (void)_layoutLiveHostView:(id)a3
{
  p_currentHostView = &self->_currentHostView;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_currentHostView);
  uint64_t v8 = self->_classicWrapperView;
  objc_super v9 = v8;
  if (!v6 || (WeakRetained ? (BOOL v10 = v8 == 0) : (BOOL v10 = 1), v10))
  {
    v14.receiver = self;
    v14.super_class = (Class)SBDeviceApplicationSceneView;
    [(SBSceneView *)&v14 _layoutLiveHostView:v6];
  }
  else
  {

    if (WeakRetained != v6)
    {
      long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"SBDeviceApplicationSceneView.m" lineNumber:1053 description:@"unexpected host view!"];
    }
    [(SBDeviceApplicationSceneView *)self bounds];
    -[SBDeviceApplicationSceneClassicWrapperView setFrame:](v9, "setFrame:");
    [(SBDeviceApplicationSceneClassicWrapperView *)v9 layoutIfNeeded];
    long long v11 = [(SBSceneView *)self backgroundView];
    long long v12 = [WeakRetained backgroundView];

    if (v12 == v11)
    {
      [WeakRetained bounds];
      objc_msgSend(v11, "setFrame:");
    }
  }
}

void __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateEdgeProtectAndAutoHideOnHomeGrabberView];
    id WeakRetained = v2;
  }
}

void __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_2_99(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateEdgeProtectAndAutoHideOnHomeGrabberView];
    id WeakRetained = v2;
  }
}

- (void)didMoveToWindow
{
  v8.receiver = self;
  v8.super_class = (Class)SBDeviceApplicationSceneView;
  [(SBDeviceApplicationSceneView *)&v8 didMoveToWindow];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentHostView);
  if (WeakRetained)
  {
    double v4 = self->_snapshottingInfoAssertion;
    objc_super v5 = [(SBSceneView *)self sceneHandle];
    id v6 = [v5 _sceneHostingInfoForSnapshottingAssertionWithView:WeakRetained];
    snapshottingInfoAssertion = self->_snapshottingInfoAssertion;
    self->_snapshottingInfoAssertion = v6;

    [(BSInvalidatable *)v4 invalidate];
  }
}

- (void)dealloc
{
  [(SBSceneHandleBlockObserver *)self->_sceneHandleObserver invalidate];
  [(BSInvalidatable *)self->_snapshottingInfoAssertion invalidate];
  int64_t v3 = +[SBMedusaDomain rootSettings];
  [v3 removeKeyObserver:self];

  double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)SBDeviceApplicationSceneView;
  [(SBSceneView *)&v5 dealloc];
}

- (void)addOverlayView:(id)a3 withPriority:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    overlayViewsByPrioritdouble y = self->_overlayViewsByPriority;
    id v25 = v6;
    objc_super v8 = [NSNumber numberWithInteger:a4];
    objc_super v9 = [(NSMutableDictionary *)overlayViewsByPriority objectForKeyedSubscript:v8];
    char v10 = [v9 containsObject:v25];

    id v6 = v25;
    if ((v10 & 1) == 0)
    {
      long long v11 = self->_overlayViewsByPriority;
      if (!v11)
      {
        long long v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v13 = self->_overlayViewsByPriority;
        self->_overlayViewsByPrioritdouble y = v12;

        long long v11 = self->_overlayViewsByPriority;
      }
      objc_super v14 = [NSNumber numberWithInteger:a4];
      id v15 = [(NSMutableDictionary *)v11 objectForKeyedSubscript:v14];

      if (!v15)
      {
        id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v17 = self->_overlayViewsByPriority;
        id v18 = [NSNumber numberWithInteger:a4];
        [(NSMutableDictionary *)v17 setObject:v16 forKeyedSubscript:v18];
      }
      uint64_t v19 = self->_overlayViewsByPriority;
      double v20 = [NSNumber numberWithInteger:a4];
      double v21 = [(NSMutableDictionary *)v19 objectForKeyedSubscript:v20];
      [v21 addObject:v25];

      int64_t v22 = [(SBDeviceApplicationSceneView *)self window];
      double v23 = (void *)v22;
      if (v22) {
        int64_t v22 = [(SBSceneView *)self orientation];
      }
      self->_lastStableOverlayOrientation = v22;

      if ([v25 needsCounterRotation])
      {
        [(SBDeviceApplicationSceneView *)self _createHostCounterRotationViewIfNecessary];
        [(_UIDirectionalRotationView *)self->_hostCounterRotationView addSubview:v25];
        if (a4 == 2)
        {
          double v24 = [(NSMutableDictionary *)self->_overlayViewsByPriority objectForKey:&unk_1F334A7C0];

          if (v24)
          {
            [v25 setShouldAllowTouchPassthroughIfTransparent:1];
            [(_UIDirectionalRotationView *)self->_hostCounterRotationView setShouldAllowTouchPassthroughIfTransparent:1];
          }
        }
      }
      else
      {
        [(SBDeviceApplicationSceneView *)self addSubview:v25];
      }
      if ([(SBDeviceApplicationSceneView *)self _sceneDrivesOwnRotation]) {
        [v25 setShouldLayoutOverlayImmediatelyForContainerGeometryChange:0];
      }
      [v25 addObserver:self];
      [(SBDeviceApplicationSceneView *)self setNeedsLayout];
      [(SBDeviceApplicationSceneView *)self layoutIfNeeded];
      id v6 = v25;
    }
  }
}

- (void)removeOverlayView:(id)a3 withPriority:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    overlayViewsByPrioritdouble y = self->_overlayViewsByPriority;
    id v22 = v6;
    objc_super v8 = [NSNumber numberWithInteger:a4];
    objc_super v9 = [(NSMutableDictionary *)overlayViewsByPriority objectForKeyedSubscript:v8];
    int v10 = [v9 containsObject:v22];

    id v6 = v22;
    if (v10)
    {
      [v22 removeObserver:self];
      [v22 removeFromSuperview];
      long long v11 = self->_overlayViewsByPriority;
      long long v12 = [NSNumber numberWithInteger:a4];
      long long v13 = [(NSMutableDictionary *)v11 objectForKeyedSubscript:v12];
      [v13 removeObject:v22];

      objc_super v14 = self->_overlayViewsByPriority;
      id v15 = [NSNumber numberWithInteger:a4];
      id v16 = [(NSMutableDictionary *)v14 objectForKeyedSubscript:v15];
      uint64_t v17 = [v16 count];

      if (!v17)
      {
        id v18 = self->_overlayViewsByPriority;
        uint64_t v19 = [NSNumber numberWithInteger:a4];
        [(NSMutableDictionary *)v18 removeObjectForKey:v19];
      }
      if (![(NSMutableDictionary *)self->_overlayViewsByPriority count])
      {
        double v20 = self->_overlayViewsByPriority;
        self->_overlayViewsByPrioritdouble y = 0;

        self->_lastStableOverlayOrientation = 0;
      }
      [(SBDeviceApplicationSceneView *)self _tearDownHostCounterRotationViewIfNecessary];
      id v6 = v22;
      if (a4 == 2)
      {
        double v21 = [(NSMutableDictionary *)self->_overlayViewsByPriority objectForKey:&unk_1F334A7C0];

        id v6 = v22;
        if (v21)
        {
          [(_UIDirectionalRotationView *)self->_hostCounterRotationView setShouldAllowTouchPassthroughIfTransparent:0];
          id v6 = v22;
        }
      }
    }
  }
}

- (void)enableTransitionOverlay:(BOOL)a3
{
  transitionOverlayView = self->_transitionOverlayView;
  if (a3)
  {
    if (!transitionOverlayView)
    {
      objc_super v5 = [(SBDeviceApplicationSceneView *)self snapshotViewAfterScreenUpdates:0];
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F43380]) initWithSnapshot:v5];
      [(SBDeviceApplicationSceneView *)self bounds];
      objc_msgSend(v6, "setFrame:");
      [v6 setAutoresizingMask:18];
      [(SBDeviceApplicationSceneView *)self addSubview:v6];
      objc_initWeak(&location, self);
      uint64_t v8 = MEMORY[0x1E4F143A8];
      uint64_t v9 = 3221225472;
      int v10 = __56__SBDeviceApplicationSceneView_enableTransitionOverlay___block_invoke;
      long long v11 = &unk_1E6B05A30;
      objc_copyWeak(&v12, &location);
      [v6 setTransitionCompletionBlock:&v8];
      objc_msgSend(v6, "startTransition", v8, v9, v10, v11);
      id v7 = self->_transitionOverlayView;
      self->_transitionOverlayView = (_UITransitionOverlayView *)v6;

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  else if (transitionOverlayView)
  {
    [(_UITransitionOverlayView *)transitionOverlayView finishTransitionImmediately];
  }
}

void __56__SBDeviceApplicationSceneView_enableTransitionOverlay___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _cleanUpTransitionOverlayView:v3];
}

- (void)_cleanUpTransitionOverlayView:(id)a3
{
  if (self->_transitionOverlayView == a3)
  {
    [a3 removeFromSuperview];
    transitionOverlayView = self->_transitionOverlayView;
    self->_transitionOverlayView = 0;
  }
}

- (void)setStatusBarDescriptor:(id)a3
{
  objc_super v5 = (SBApplicationSceneViewStatusBarDescriptor *)a3;
  if (self->_statusBarDescriptor != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_statusBarDescriptor, a3);
    int64_t v6 = [(SBSceneView *)self effectiveDisplayMode];
    objc_super v5 = v7;
    if (v6 == 4)
    {
      [(SBDeviceApplicationSceneView *)self _updateStatusBarVisibilityForHostView];
      objc_super v5 = v7;
    }
  }
}

- (void)setStatusBarAlpha:(double)a3
{
  if (self->_statusBarAlpha != a3)
  {
    self->_statusBarAlpha = a3;
    if ([(SBSceneView *)self effectiveDisplayMode] == 4)
    {
      [(SBDeviceApplicationSceneView *)self _updateStatusBarVisibilityForHostView];
    }
  }
}

- (void)createHomeGrabberViewIfNecessaryWithSettings:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_grabberRotationView)
  {
    id v4 = a3;
    objc_super v5 = [SBHomeGrabberRotationView alloc];
    [(SBDeviceApplicationSceneView *)self bounds];
    int64_t v6 = -[SBHomeGrabberRotationView initWithFrame:settings:](v5, "initWithFrame:settings:", v4);

    grabberRotationView = self->_grabberRotationView;
    self->_grabberRotationView = v6;

    [(SBHomeGrabberRotationView *)self->_grabberRotationView setUserInteractionEnabled:0];
    [(SBDeviceApplicationSceneView *)self _createHostCounterRotationViewIfNecessary];
    if (self->_hostCounterRotationView
      && [(SBDeviceApplicationSceneView *)self _sceneDrivesOwnRotation])
    {
      self->_grabberLivesInCounterRotationView = 1;
      [(_UIDirectionalRotationView *)self->_hostCounterRotationView addSubview:self->_grabberRotationView];
      uint64_t v8 = [(SBSceneView *)self sceneHandle];
      uint64_t v9 = [v8 sceneIfExists];
      int v10 = [v9 uiClientSettings];

      if (v10)
      {
        -[SBHomeGrabberRotationView setOrientation:](self->_grabberRotationView, "setOrientation:", [v10 interfaceOrientation]);
        long long v11 = SBLogHomeAffordance();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = [(SBDeviceApplicationSceneView *)self homeGrabberView];
          [(SBHomeGrabberRotationView *)self->_grabberRotationView orientation];
          long long v13 = BSInterfaceOrientationDescription();
          *(_DWORD *)buf = 134218242;
          double v20 = v12;
          __int16 v21 = 2114;
          id v22 = v13;
          _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "grabber=%p initializing affordance orientation to %{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      self->_grabberLivesInCounterRotationView = 0;
      [(SBDeviceApplicationSceneView *)self addSubview:self->_grabberRotationView];
    }
    objc_super v14 = [(SBSceneView *)self sceneHandle];
    id v15 = (void *)MEMORY[0x1E4F42FF0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __77__SBDeviceApplicationSceneView_createHomeGrabberViewIfNecessaryWithSettings___block_invoke;
    v17[3] = &unk_1E6AF5290;
    v17[4] = self;
    id v18 = v14;
    id v16 = v14;
    [v15 performWithoutAnimation:v17];
  }
}

void __77__SBDeviceApplicationSceneView_createHomeGrabberViewIfNecessaryWithSettings___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homeGrabberView];
  objc_msgSend(v2, "setAutoHides:", objc_msgSend(*(id *)(a1 + 40), "isAutoHideEnabledForHomeAffordance"));

  id v3 = [*(id *)(a1 + 32) homeGrabberView];
  objc_msgSend(v3, "setEdgeProtectEnabled:", objc_msgSend(*(id *)(a1 + 40), "isEdgeProtectEnabledForHomeGesture"));
}

- (void)tearDownHomeGrabberView
{
  [(SBHomeGrabberRotationView *)self->_grabberRotationView removeFromSuperview];
  grabberRotationView = self->_grabberRotationView;
  self->_grabberRotationView = 0;

  [(SBDeviceApplicationSceneView *)self _tearDownHostCounterRotationViewIfNecessary];
}

- (void)_createHostCounterRotationViewIfNecessary
{
  if (!self->_hostCounterRotationView
    && ([(SBDeviceApplicationSceneView *)self _sceneDrivesOwnRotation]
     || [(SBDeviceApplicationSceneView *)self _anyOverlayViewNeedsCounterRotation]))
  {
    id v3 = objc_alloc_init(SBDeviceApplicationSceneViewTouchPassthroughCounterRotationView);
    hostCounterRotationView = self->_hostCounterRotationView;
    self->_hostCounterRotationView = &v3->super;

    [(_UIDirectionalRotationView *)self->_hostCounterRotationView setCounterTransformView:1];
    objc_super v5 = self->_hostCounterRotationView;
    [(SBDeviceApplicationSceneView *)self addSubview:v5];
  }
}

- (void)_tearDownHostCounterRotationViewIfNecessary
{
  if (self->_hostCounterRotationView
    && ![(SBDeviceApplicationSceneView *)self _sceneDrivesOwnRotation]
    && ![(SBDeviceApplicationSceneView *)self _anyOverlayViewNeedsCounterRotation])
  {
    [(_UIDirectionalRotationView *)self->_hostCounterRotationView removeFromSuperview];
    hostCounterRotationView = self->_hostCounterRotationView;
    self->_hostCounterRotationView = 0;
  }
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(SBApplicationSceneView *)self application];
  objc_super v5 = [v4 bundleIdentifier];
  id v6 = (id)[v3 appendObject:v5 withName:0];

  [(SBSceneView *)self displayMode];
  id v7 = NSStringFromSBSceneViewDisplayMode();
  id v8 = (id)[v3 appendObject:v7 withName:@"displayMode"];

  id v9 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[SBDeviceApplicationSceneView forcesStatusBarHidden](self, "forcesStatusBarHidden"), @"forceStatusBarHidden", 1);
  [(SBDeviceApplicationSceneView *)self statusBarAlpha];
  id v10 = (id)objc_msgSend(v3, "appendFloat:withName:", @"statusBarAlpha");
  long long v11 = [v3 build];

  return (NSString *)v11;
}

- (void)invalidate
{
  [(SBSceneHandleBlockObserver *)self->_sceneHandleObserver invalidate];
  sceneHandleObserver = self->_sceneHandleObserver;
  self->_sceneHandleObserver = 0;

  [(UIApplicationSceneClientSettingsDiffInspector *)self->_clientSettingsInspector removeAllObservers];
  clientSettingsInspector = self->_clientSettingsInspector;
  self->_clientSettingsInspector = 0;

  [(UIApplicationSceneSettingsDiffInspector *)self->_sceneSettingsInspector removeAllObservers];
  sceneSettingsInspector = self->_sceneSettingsInspector;
  self->_sceneSettingsInspector = 0;

  [(SBDeviceApplicationSceneClassicAccessoryView *)self->_classicAccessoryView invalidate];
  v6.receiver = self;
  v6.super_class = (Class)SBDeviceApplicationSceneView;
  [(SBSceneView *)&v6 invalidate];
}

void __46__SBDeviceApplicationSceneView_layoutSubviews__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = *(void **)(*(void *)(a1 + 32) + 672);
  id v4 = [NSNumber numberWithInteger:a2];
  objc_super v5 = [v3 objectForKeyedSubscript:v4];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
        if ([v10 needsCounterRotation])
        {
          uint64_t v11 = *(void *)(a1 + 32);
          if (*(unsigned char *)(v11 + 688) || (id v12 = (void *)(a1 + 40), *(unsigned char *)(v11 + 689))) {
            id v12 = (void *)(v11 + 696);
          }
          [v10 setHostOrientation:*v12];
          BOOL v14 = ([*(id *)(a1 + 32) _sceneDrivesOwnRotation] & 1) == 0
             && (uint64_t v13 = *(void *)(a1 + 32), !*(unsigned char *)(v13 + 688))
             && *(unsigned __int8 *)(v13 + 689) == 0;
          [v10 setShouldLayoutOverlayImmediatelyForContainerGeometryChange:v14];
          objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", *(void *)(*(void *)(a1 + 32) + 640), *(double *)(a1 + 48), *(double *)(a1 + 56));
          objc_msgSend(v10, "setCenter:");
          objc_msgSend(v10, "setBounds:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
          [*(id *)(*(void *)(a1 + 32) + 640) bringSubviewToFront:v10];
          id v15 = *(void **)(a1 + 32);
          id v10 = (void *)v15[80];
        }
        else
        {
          objc_msgSend(v10, "setFrame:", *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
          id v15 = *(void **)(a1 + 32);
        }
        [v15 bringSubviewToFront:v10];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v16 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v7 = v16;
    }
    while (v16);
  }
}

- (void)_refresh
{
  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneView;
  [(SBSceneView *)&v3 _refresh];
  if ([(SBSceneView *)self effectiveDisplayMode] == 4) {
    [(SBDeviceApplicationSceneView *)self _updateStatusBarVisibilityForHostView];
  }
}

- (void)_configureSceneSnapshotContext:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(SBSceneView *)self sceneHandle];
  uint64_t v6 = [v5 sceneIfExists];

  if ([(SBDeviceApplicationSceneView *)self forcesStatusBarHidden]
    || ([(SBDeviceApplicationSceneView *)self statusBarAlpha], v7 < 1.0))
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v9 = [v4 layersToExclude];
    id v10 = [v8 setWithSet:v9];

    uint64_t v11 = [v6 clientSettings];
    int v12 = [v11 statusBarContextID];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v13 = objc_msgSend(v6, "layerManager", 0);
    BOOL v14 = [v13 layers];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          int v20 = [v19 contextID];
          if (v20) {
            BOOL v21 = v20 == v12;
          }
          else {
            BOOL v21 = 0;
          }
          if (v21)
          {
            [v10 addObject:v19];
            goto LABEL_16;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_16:

    [v4 setLayersToExclude:v10];
  }
}

- (BOOL)_representsTranslucentContent
{
  id v2 = [(SBSceneView *)self sceneHandle];
  char v3 = [v2 isTranslucent];

  return v3;
}

- (void)setCornerRadius:(double)a3
{
  id v4 = [(SBDeviceApplicationSceneView *)self layer];
  [v4 setCornerRadius:a3];
}

- (double)cornerRadius
{
  id v2 = [(SBDeviceApplicationSceneView *)self layer];
  [v2 cornerRadius];
  double v4 = v3;

  return v4;
}

- (void)overlayViewDidRotate:(id)a3 toInterfaceOrientation:(int64_t)a4
{
  self->_lastStableOverlayOrientation = a4;
}

- (void)overlayViewDidChangeCounterRotationRequirement:(id)a3
{
  id v5 = a3;
  [v5 removeFromSuperview];
  if ([v5 needsCounterRotation])
  {
    [(SBDeviceApplicationSceneView *)self _createHostCounterRotationViewIfNecessary];
    hostCounterRotationView = self->_hostCounterRotationView;
  }
  else
  {
    [(SBDeviceApplicationSceneView *)self _tearDownHostCounterRotationViewIfNecessary];
    hostCounterRotationView = self;
  }
  [hostCounterRotationView addSubview:v5];
  [(SBDeviceApplicationSceneView *)self setNeedsLayout];
}

uint64_t __69__SBDeviceApplicationSceneView__updateStatusBarVisibilityForHostView__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeLayerPresentationOverrideForLayerTarget:*(void *)(*(void *)(a1 + 32) + 600)];
}

uint64_t __69__SBDeviceApplicationSceneView__updateStatusBarVisibilityForHostView__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 600);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__SBDeviceApplicationSceneView__updateStatusBarVisibilityForHostView__block_invoke_3;
  v5[3] = &unk_1E6B05AA8;
  v5[4] = v2;
  return [a2 modifyLayerPresentationOverrideContextForLayerTarget:v3 block:v5];
}

void __69__SBDeviceApplicationSceneView__updateStatusBarVisibilityForHostView__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 statusBarAlpha];
  objc_msgSend(v4, "setAlpha:");
  objc_msgSend(v4, "setHidden:", objc_msgSend(*(id *)(a1 + 32), "forcesStatusBarHidden"));
}

void __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateStatusBarVisibilityForHostView];
}

void __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = a2;
  id v5 = [WeakRetained backgroundView];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [WeakRetained _wallpaperStyle];
    if ([v5 wallpaperStyle] != v6)
    {
      if (objc_opt_respondsToSelector())
      {
        double v7 = [v4 animationSettings];
        [v5 setWallpaperStyle:v6 withAnimationSettings:v7];

        uint64_t v8 = (void *)MEMORY[0x1E4F42D58];
        uint64_t v9 = [v4 animationFence];
        [v8 _synchronizeDrawingWithFence:v9];
      }
      else if (objc_opt_respondsToSelector())
      {
        id v10 = (void *)MEMORY[0x1E4F4F898];
        uint64_t v11 = [v4 animationSettings];
        int v12 = [v10 factoryWithSettings:v11];
        uint64_t v15 = MEMORY[0x1E4F143A8];
        uint64_t v16 = 3221225472;
        uint64_t v17 = __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_3;
        long long v18 = &unk_1E6AF4A70;
        id v19 = v5;
        uint64_t v20 = v6;
        [v10 animateWithFactory:v12 actions:&v15];

        uint64_t v13 = (void *)MEMORY[0x1E4F42D58];
        BOOL v14 = objc_msgSend(v4, "animationFence", v15, v16, v17, v18);
        [v13 _synchronizeDrawingWithFence:v14];
      }
    }
  }
}

uint64_t __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setWallpaperStyle:*(void *)(a1 + 40)];
}

void __94__SBDeviceApplicationSceneView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained sceneHandle];
    uint64_t v6 = [v5 sceneIfExists];

    double v7 = [v6 uiClientSettings];
    uint64_t v8 = v7;
    if (v7) {
      uint64_t v9 = [v7 interfaceOrientation];
    }
    else {
      uint64_t v9 = [v4[81] orientation];
    }
    uint64_t v10 = v9;
    if ([v4 _sceneDrivesOwnRotation])
    {
      [v4 setNeedsLayout];
      id v11 = a2;
      int v12 = [v11 animationSettings];
      [v4[81] setOrientation:v10 animated:1 rotationSettings:v12];
      uint64_t v13 = SBLogHomeAffordance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        BOOL v14 = [v4[81] grabberView];
        uint64_t v15 = BSInterfaceOrientationDescription();
        int v20 = 134218242;
        BOOL v21 = v14;
        __int16 v22 = 2114;
        long long v23 = v15;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_INFO, "grabber=%p rotating affordance to %{public}@", (uint8_t *)&v20, 0x16u);
      }
      uint64_t v16 = (void *)MEMORY[0x1E4F42D58];
      uint64_t v17 = [v11 animationFence];

      [v16 _synchronizeDrawingWithFence:v17];
    }
    long long v18 = [v4 homeGrabberView];
    id v19 = [v4 sceneHandle];
    objc_msgSend(v18, "setEdgeProtectEnabled:", objc_msgSend(v19, "isEdgeProtectEnabledForHomeGesture"));
  }
}

void __87__SBDeviceApplicationSceneView__sceneHandleDidUpdateSettingsWithDiff_previousSettings___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = WeakRetained[89];
  uint64_t v2 = v1;
  if (v1 && [v1 suppressLayoutUpdatesForStartOfClassicPhoneAppRotation])
  {
    [v2 setSuppressLayoutUpdatesForStartOfClassicPhoneAppRotation:0];
    [WeakRetained setNeedsLayout];
  }
}

- (BOOL)_anyOverlayViewNeedsCounterRotation
{
  uint64_t v2 = [(NSMutableDictionary *)self->_overlayViewsByPriority allValues];
  char v3 = objc_msgSend(v2, "bs_containsObjectPassingTest:", &__block_literal_global_228);

  return v3;
}

uint64_t __67__SBDeviceApplicationSceneView__anyOverlayViewNeedsCounterRotation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bs_containsObjectPassingTest:", &__block_literal_global_104);
}

uint64_t __67__SBDeviceApplicationSceneView__anyOverlayViewNeedsCounterRotation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 needsCounterRotation];
}

- (void)_setCounterRotationViewTransformUpdatesPaused:(BOOL)a3
{
  if (self->_counterRotationViewTransformUpdatesPaused != a3)
  {
    self->_counterRotationViewTransformUpdatesPaused = a3;
    [(SBDeviceApplicationSceneView *)self setNeedsLayout];
  }
}

- (void)_updateReferenceSize:(CGSize)a3 andOrientation:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  int64_t v8 = [(SBSceneView *)self orientation];
  v10.receiver = self;
  v10.super_class = (Class)SBDeviceApplicationSceneView;
  -[SBSceneView _updateReferenceSize:andOrientation:](&v10, sel__updateReferenceSize_andOrientation_, a4, width, height);
  [(SBDeviceApplicationSceneView *)self _maybeStartTrackingRotationForOverlayFromOrientation:v8 toOrientation:a4];
  if (v8 != a4)
  {
    uint64_t v9 = [(SBDeviceApplicationSceneView *)self window];

    if (v9) {
      self->_lastStableOverlayOrientation = a4;
    }
  }
}

- (void)_maybeStartTrackingRotationForOverlayFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4
{
  if (!self->_counterRotationViewTransformUpdatesPaused
    && [(SBDeviceApplicationSceneView *)self _anyOverlayViewNeedsCounterRotation]&& self->_hostCounterRotationView&& ![(SBDeviceApplicationSceneView *)self _sceneDrivesOwnRotation])
  {
    int64_t lastStableOverlayOrientation = self->_lastStableOverlayOrientation;
    if (lastStableOverlayOrientation && lastStableOverlayOrientation != a4)
    {
      self->_counterRotationViewTransformUpdatesPaused = 1;
      SBFAngleForRotationFromInterfaceOrientationToInterfaceOrientation();
      if (BSFloatEqualToFloat())
      {
        self->_waitingForBoundsUpdateDuringRotation = 0;
      }
      else
      {
        int64_t v8 = [(SBSceneView *)self sceneHandle];
        uint64_t v9 = [v8 application];
        if ([v9 classicAppPhoneAppRunningOnPad])
        {
          objc_super v10 = [(UIView *)self _sbWindowScene];
          id v11 = [v10 switcherController];
          self->_waitingForBoundsUpdateDuringRotation = [v11 windowManagementStyle] != 2;
        }
        else
        {
          self->_waitingForBoundsUpdateDuringRotation = 1;
        }
      }
      self->_overlayOrientationAtStartOfRotation = self->_lastStableOverlayOrientation;
    }
  }
}

- (id)prepareForContentRotation
{
  char v3 = [(SBSceneView *)self sceneHandle];
  id v4 = [v3 application];
  int v5 = [v4 classicAppPhoneAppRunningOnPad];

  if (v5
    && ([(SBDeviceApplicationSceneClassicWrapperView *)self->_classicWrapperView setStartingOrientationForClassicPhoneAppRotation:[(SBSceneView *)self orientation]], [(SBDeviceApplicationSceneClassicWrapperView *)self->_classicWrapperView suppressLayoutUpdatesForStartOfClassicPhoneAppRotation]))
  {
    uint64_t v6 = [SBUIBlockAnimationController alloc];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__SBDeviceApplicationSceneView_prepareForContentRotation__block_invoke;
    v9[3] = &unk_1E6B05B10;
    v9[4] = self;
    double v7 = [(SBUIBlockAnimationController *)v6 initWithWorkspaceTransitionRequest:0 animationSettings:0 animationBlock:v9];
  }
  else
  {
    double v7 = 0;
  }
  return v7;
}

void __57__SBDeviceApplicationSceneView_prepareForContentRotation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 712);
  id v7 = a5;
  [v6 setPreparingForUserDrivenClassicRotation:1];
  [*(id *)(*(void *)(a1 + 32) + 712) setNeedsLayout];
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];
  [*(id *)(*(void *)(a1 + 32) + 712) setPreparingForUserDrivenClassicRotation:0];
  [*(id *)(*(void *)(a1 + 32) + 712) setStartingOrientationForClassicPhoneAppRotation:0];
  int64_t v8 = [*(id *)(a1 + 32) sceneHandle];
  uint64_t v9 = [v8 _windowScene];
  objc_super v10 = [v9 switcherController];
  id v11 = [v10 traitsParticipantForSceneHandle:v8];

  int v12 = +[SBAnimationUtilities animationSettingsForRotationFromInterfaceOrientation:toInterfaceOrientation:](SBAnimationUtilities, "animationSettingsForRotationFromInterfaceOrientation:toInterfaceOrientation:", objc_msgSend(v11, "sbf_previousOrientation"), objc_msgSend(v11, "sbf_currentOrientation"));
  uint64_t v13 = (void *)MEMORY[0x1E4F42FF0];
  [v12 duration];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__SBDeviceApplicationSceneView_prepareForContentRotation__block_invoke_2;
  v14[3] = &unk_1E6AF4AC0;
  v14[4] = *(void *)(a1 + 32);
  objc_msgSend(v13, "animateWithDuration:animations:completion:", v14, v7);
}

uint64_t __57__SBDeviceApplicationSceneView_prepareForContentRotation__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 712) setNeedsLayout];
  [*(id *)(a1 + 32) setNeedsLayout];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (void)willRotateFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 alongsideContainerView:(id)a5 animated:(BOOL)a6
{
  if (!self->_waitingForBoundsUpdateDuringRotation) {
    -[SBDeviceApplicationSceneView _setCounterRotationViewTransformUpdatesPaused:](self, "_setCounterRotationViewTransformUpdatesPaused:", 0, a4, a5, a6);
  }
}

- (void)containerViewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  if (!self->_waitingForBoundsUpdateDuringRotation) {
    -[SBDeviceApplicationSceneView _setCounterRotationViewTransformUpdatesPaused:](self, "_setCounterRotationViewTransformUpdatesPaused:", 0, a3.width, a3.height);
  }
}

- (double)statusBarAlpha
{
  return self->_statusBarAlpha;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (unint64_t)maskedCorners
{
  return self->maskedCorners;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  self->maskedCorners = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionOverlayView, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
  objc_storeStrong((id *)&self->_multitaskingExclusionRectDebugViews, 0);
  objc_destroyWeak((id *)&self->_currentHostView);
  objc_storeStrong((id *)&self->_snapshottingInfoAssertion, 0);
  objc_storeStrong((id *)&self->_classicWrapperView, 0);
  objc_storeStrong((id *)&self->_classicAccessoryView, 0);
  objc_storeStrong((id *)&self->_overlayViewsByPriority, 0);
  objc_storeStrong((id *)&self->_grabberSettings, 0);
  objc_storeStrong((id *)&self->_grabberRotationView, 0);
  objc_storeStrong((id *)&self->_hostCounterRotationView, 0);
  objc_storeStrong((id *)&self->_statusBarDescriptor, 0);
  objc_storeStrong((id *)&self->_sceneSettingsInspector, 0);
  objc_storeStrong((id *)&self->_clientSettingsInspector, 0);
  objc_storeStrong((id *)&self->_sceneHandleObserver, 0);
  objc_storeStrong((id *)&self->_statusBarLayerTarget, 0);
}

- (void)teardownClassicAccessoryViewIfNecessary
{
  classicAccessoryView = self->_classicAccessoryView;
  if (classicAccessoryView)
  {
    [(SBDeviceApplicationSceneClassicAccessoryView *)classicAccessoryView invalidate];
    [(SBDeviceApplicationSceneClassicAccessoryView *)self->_classicAccessoryView removeFromSuperview];
    id v4 = self->_classicAccessoryView;
    self->_classicAccessoryView = 0;
  }
}

- (void)applicationSceneCompatibilityModeAnimatingChangeTo:(int64_t)a3
{
  [(SBDeviceApplicationSceneClassicWrapperView *)self->_classicWrapperView setNeedsLayout];
  [(SBDeviceApplicationSceneView *)self setNeedsLayout];
  [(SBDeviceApplicationSceneView *)self layoutIfNeeded];
}

- (void)noteApplicationClassicPhoneSceneOrientationPreferenceChangingForUserAction:(BOOL)a3
{
  if (a3) {
    [(SBDeviceApplicationSceneClassicWrapperView *)self->_classicWrapperView setSuppressLayoutUpdatesForStartOfClassicPhoneAppRotation:1];
  }
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"SBClassicPhoneSceneOrientationPreferenceChanged" object:0];
}

- (void)_windowManagementStyleDidChange:(id)a3
{
  [(SBSceneView *)self _updateLiveViewContainment];
  [(SBDeviceApplicationSceneView *)self setNeedsLayout];
}

- (void)_configureSceneLiveSnapshotView:(id)a3
{
  id v4 = a3;
  if ([(SBDeviceApplicationSceneView *)self _useClassicWrapperView])
  {
    [(SBDeviceApplicationSceneClassicWrapperView *)self->_classicWrapperView addContentView:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBDeviceApplicationSceneView;
    [(SBSceneView *)&v5 _configureSceneLiveSnapshotView:v4];
  }
}

- (void)_invalidateSceneLiveHostView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBDeviceApplicationSceneView;
  [(SBSceneView *)&v5 _invalidateSceneLiveHostView:a3];
  objc_storeWeak((id *)&self->_currentHostView, 0);
  [(BSInvalidatable *)self->_snapshottingInfoAssertion invalidate];
  snapshottingInfoAssertion = self->_snapshottingInfoAssertion;
  self->_snapshottingInfoAssertion = 0;
}

- (void)_setOrientation:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBDeviceApplicationSceneView;
  -[SBSceneView _setOrientation:](&v5, sel__setOrientation_);
  [(SBDeviceApplicationSceneClassicWrapperView *)self->_classicWrapperView setOrientation:a3];
}

@end
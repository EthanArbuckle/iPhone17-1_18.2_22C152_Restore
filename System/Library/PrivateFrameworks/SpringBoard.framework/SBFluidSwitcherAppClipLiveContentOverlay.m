@interface SBFluidSwitcherAppClipLiveContentOverlay
- (BOOL)isAsyncRenderingEnabled;
- (BOOL)isContentUpdating;
- (BOOL)isDisplayLayoutElementActive;
- (BOOL)isMaximized;
- (BOOL)requiresLegacyRotationSupport;
- (BOOL)resizesHostedContext;
- (BOOL)wantsEnhancedWindowingEnabled;
- (SBFluidSwitcherAppClipLiveContentOverlay)initWithPlaceholderEntity:(id)a3 windowScene:(id)a4;
- (SBSwitcherLiveContentOverlayDelegate)delegate;
- (SBWindowScene)_sbWindowScene;
- (UIRectCornerRadii)cornerRadii;
- (UIView)contentOverlayView;
- (UIViewController)contentViewController;
- (double)currentStatusBarHeight;
- (id)_statusBarReusePool;
- (id)backgroundActivitiesToSuppress;
- (id)liveSceneIdentityToken;
- (id)overlaySceneHandle;
- (id)prepareOverlayForContentRotation;
- (int64_t)leadingStatusBarStyle;
- (int64_t)overlayType;
- (int64_t)preferredInterfaceOrientation;
- (int64_t)touchBehavior;
- (int64_t)trailingStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_beginPollingUpdateStillAvailable;
- (void)_createAndConfigureStatusBar;
- (void)_installedApplicationsDidChange:(id)a3;
- (void)_launchApplication:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setContentReferenceSize:(CGSize)a3 interfaceOrientation:(int64_t)a4;
- (void)setCornerRadii:(UIRectCornerRadii)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLayoutElementActive:(BOOL)a3;
- (void)setMaximized:(BOOL)a3;
- (void)setResizesHostedContext:(BOOL)a3;
- (void)setStatusBarHidden:(BOOL)a3 nubViewHidden:(BOOL)a4 animator:(id)a5;
- (void)setWantsEnhancedWindowingEnabled:(BOOL)a3;
- (void)sizeObservingView:(id)a3 didChangeSize:(CGSize)a4;
- (void)updateDisplayLayoutElementWithBuilder:(id)a3;
@end

@implementation SBFluidSwitcherAppClipLiveContentOverlay

- (SBFluidSwitcherAppClipLiveContentOverlay)initWithPlaceholderEntity:(id)a3 windowScene:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v44.receiver = self;
  v44.super_class = (Class)SBFluidSwitcherAppClipLiveContentOverlay;
  v9 = [(SBFluidSwitcherAppClipLiveContentOverlay *)&v44 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_sbWindowScene, v8);
    uint64_t v11 = [v7 bundleIdentifier];
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v11;

    uint64_t v13 = [v7 futureSceneIdentifier];
    sceneIdentifier = v10->_sceneIdentifier;
    v10->_sceneIdentifier = (NSString *)v13;

    v10->_isPendingUpdate = [v7 needsUpdate];
    id v15 = objc_alloc(MEMORY[0x1E4FA7D38]);
    uint64_t v16 = objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    containerView = v10->_containerView;
    v10->_containerView = (SBUISizeObservingView *)v16;

    [(SBUISizeObservingView *)v10->_containerView setDelegate:v10];
    v18 = [SBAppClipOverlayViewController alloc];
    v19 = [(id)SBApp appClipOverlayCoordinator];
    uint64_t v20 = [(SBAppClipOverlayViewController *)v18 initWithCoordinator:v19 bundleIdentifier:v10->_bundleIdentifier sceneIdentifier:v10->_sceneIdentifier];
    placeholderViewController = v10->_placeholderViewController;
    v10->_placeholderViewController = (SBAppClipOverlayViewController *)v20;

    v22 = v10->_containerView;
    v23 = [(SBAppClipOverlayViewController *)v10->_placeholderViewController view];
    [(SBUISizeObservingView *)v22 addSubview:v23];

    [(SBAppClipOverlayViewController *)v10->_placeholderViewController setDisplayedOverPlaceholder:1 animated:0];
    [(SBAppClipOverlayViewController *)v10->_placeholderViewController setSceneActivationState:-1 animated:0];
    if (v10->_isPendingUpdate) {
      [(SBAppClipOverlayViewController *)v10->_placeholderViewController setNeedsUpdate];
    }
    [(SBFluidSwitcherAppClipLiveContentOverlay *)v10 _createAndConfigureStatusBar];
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4FA6A68]) initWithIdentifier:v10->_sceneIdentifier];
    displayLayoutElement = v10->_displayLayoutElement;
    v10->_displayLayoutElement = (SBSDisplayLayoutElement *)v24;

    [(SBSDisplayLayoutElement *)v10->_displayLayoutElement setBundleIdentifier:v10->_bundleIdentifier];
    [(SBSDisplayLayoutElement *)v10->_displayLayoutElement setLayoutRole:1];
    [(SBSDisplayLayoutElement *)v10->_displayLayoutElement setLevel:1];
    [(SBSDisplayLayoutElement *)v10->_displayLayoutElement setUIApplicationElement:1];
    [(SBSDisplayLayoutElement *)v10->_displayLayoutElement setHasKeyboardFocus:0];
    v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v27 = +[SBApplicationController sharedInstance];
    [v26 addObserver:v10 selector:sel__installedApplicationsDidChange_ name:@"SBInstalledApplicationsDidChangeNotification" object:v27];

    v28 = +[SBApplicationPlaceholderController sharedInstance];
    v29 = [v28 placeholderForDisplayID:v10->_bundleIdentifier];

    if (v29 || v10->_isPendingUpdate)
    {
      v30 = SBLogCommon();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (objc_class *)objc_opt_class();
        v32 = NSStringFromClass(v31);
        v33 = v10->_bundleIdentifier;
        v34 = v10->_sceneIdentifier;
        *(_DWORD *)buf = 138543874;
        v46 = v32;
        __int16 v47 = 2114;
        v48 = v33;
        __int16 v49 = 2114;
        v50 = v34;
        _os_log_impl(&dword_1D85BA000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ Placeholder present or update available, will observe installation for app clip: %{public}@:%{public}@", buf, 0x20u);
      }
      if (v10->_isPendingUpdate) {
        [(SBFluidSwitcherAppClipLiveContentOverlay *)v10 _beginPollingUpdateStillAvailable];
      }
    }
    else
    {
      v35 = +[SBApplicationController sharedInstance];
      v36 = [v35 applicationWithBundleIdentifier:v10->_bundleIdentifier];

      if (!v36)
      {
        v43 = [MEMORY[0x1E4F28B00] currentHandler];
        [v43 handleFailureInMethod:a2, v10, @"SBFluidSwitcherAppClipLiveContentOverlay.m", 115, @"If we don't have a placeholder, we expect to have an installed application for %@", v10->_bundleIdentifier object file lineNumber description];
      }
      v37 = SBLogCommon();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = (objc_class *)objc_opt_class();
        v39 = NSStringFromClass(v38);
        v40 = v10->_bundleIdentifier;
        v41 = v10->_sceneIdentifier;
        *(_DWORD *)buf = 138543874;
        v46 = v39;
        __int16 v47 = 2114;
        v48 = v40;
        __int16 v49 = 2114;
        v50 = v41;
        _os_log_impl(&dword_1D85BA000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ Application already present, will launch app clip: %{public}@:%{public}@", buf, 0x20u);
      }
      [(SBFluidSwitcherAppClipLiveContentOverlay *)v10 _launchApplication:v36];
    }
  }

  return v10;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = +[SBApplicationController sharedInstance];
  [v3 removeObserver:self name:@"SBInstalledApplicationsDidChangeNotification" object:v4];

  v5 = [(SBFluidSwitcherAppClipLiveContentOverlay *)self _statusBarReusePool];
  [v5 recycleStatusBar:self->_statusBar];

  v6.receiver = self;
  v6.super_class = (Class)SBFluidSwitcherAppClipLiveContentOverlay;
  [(SBFluidSwitcherAppClipLiveContentOverlay *)&v6 dealloc];
}

- (void)sizeObservingView:(id)a3 didChangeSize:(CGSize)a4
{
  if (self->_containerView == a3)
  {
    objc_msgSend(a3, "bounds", a4.width, a4.height);
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    uint64_t v13 = [(SBAppClipOverlayViewController *)self->_placeholderViewController view];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    statusBar = self->_statusBar;
    -[UIStatusBar setFrame:](statusBar, "setFrame:", v6, v8, v10, v12);
  }
}

- (UIViewController)contentViewController
{
  return (UIViewController *)self->_placeholderViewController;
}

- (void)setContentReferenceSize:(CGSize)a3 interfaceOrientation:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __89__SBFluidSwitcherAppClipLiveContentOverlay_setContentReferenceSize_interfaceOrientation___block_invoke;
  v4[3] = &__block_descriptor_48_e33_v16__0__SBSDisplayLayoutElement_8l;
  CGSize v5 = a3;
  [(SBFluidSwitcherAppClipLiveContentOverlay *)self updateDisplayLayoutElementWithBuilder:v4];
}

void __89__SBFluidSwitcherAppClipLiveContentOverlay_setContentReferenceSize_interfaceOrientation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  SBRectWithSize();
  objc_msgSend(v2, "setReferenceFrame:");
}

- (UIView)contentOverlayView
{
  return (UIView *)self->_containerView;
}

- (void)setStatusBarHidden:(BOOL)a3 nubViewHidden:(BOOL)a4 animator:(id)a5
{
  double v7 = (void (**)(id, uint64_t, void))a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__SBFluidSwitcherAppClipLiveContentOverlay_setStatusBarHidden_nubViewHidden_animator___block_invoke;
  v10[3] = &unk_1E6AF5D38;
  v10[4] = self;
  BOOL v11 = a3;
  uint64_t v8 = MEMORY[0x1D948C7A0](v10);
  double v9 = (void *)v8;
  if (v7) {
    v7[2](v7, v8, 0);
  }
  else {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  }
}

uint64_t __86__SBFluidSwitcherAppClipLiveContentOverlay_setStatusBarHidden_nubViewHidden_animator___block_invoke(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 32) setAlpha:v1];
}

- (int64_t)leadingStatusBarStyle
{
  return _SBStatusBarStyleForPartWithIdentifier(self->_statusBar, (void *)*MEMORY[0x1E4F441B8]);
}

- (int64_t)trailingStatusBarStyle
{
  return _SBStatusBarStyleForPartWithIdentifier(self->_statusBar, (void *)*MEMORY[0x1E4F441C8]);
}

- (id)backgroundActivitiesToSuppress
{
  return 0;
}

- (double)currentStatusBarHeight
{
  [(UIStatusBar *)self->_statusBar currentHeight];
  return result;
}

- (BOOL)isContentUpdating
{
  return 0;
}

- (BOOL)requiresLegacyRotationSupport
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (int64_t)preferredInterfaceOrientation
{
  return 0;
}

- (int64_t)touchBehavior
{
  return 2;
}

- (id)liveSceneIdentityToken
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  double v10 = __Block_byref_object_copy__36;
  BOOL v11 = __Block_byref_object_dispose__36;
  id v12 = 0;
  v3 = [MEMORY[0x1E4F62490] sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__SBFluidSwitcherAppClipLiveContentOverlay_liveSceneIdentityToken__block_invoke;
  v6[3] = &unk_1E6AFC208;
  v6[4] = self;
  v6[5] = &v7;
  [v3 enumerateScenesWithBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __66__SBFluidSwitcherAppClipLiveContentOverlay_liveSceneIdentityToken__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v13 = a2;
  int v5 = [v13 isActive];
  double v6 = v13;
  if (v5)
  {
    uint64_t v7 = [v13 settings];
    if ([v7 isForeground])
    {
      uint64_t v8 = [v13 identifier];
      int v9 = [v8 isEqual:*(void *)(*(void *)(a1 + 32) + 16)];

      double v6 = v13;
      if (v9)
      {
        uint64_t v10 = [v13 identityToken];
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
        id v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;

        double v6 = v13;
        *a3 = 1;
      }
    }
    else
    {

      double v6 = v13;
    }
  }
}

- (void)_createAndConfigureStatusBar
{
  v3 = [(SBFluidSwitcherAppClipLiveContentOverlay *)self _statusBarReusePool];
  id v4 = [v3 getReusableStatusBarWithReason:@"app clip live content overlay"];
  statusBar = self->_statusBar;
  self->_statusBar = v4;

  id v13 = +[SBMedusaDomain rootSettings];
  if ([v13 statusBarDebugBackgroundColorsEnabled])
  {
    double v6 = self->_statusBar;
    uint64_t v7 = [MEMORY[0x1E4F428B8] yellowColor];
    uint64_t v8 = [v7 colorWithAlphaComponent:0.4];
    [(UIStatusBar *)v6 setBackgroundColor:v8];
  }
  uint64_t v9 = [MEMORY[0x1E4F42E28] defaultStyleForRequestedStyle:1 styleOverrides:0];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4FA9970]) initWithResolvedStyle:_SBStatusBarStyleFromLegacyStyle(v9) foregroundColor:0];
  [(UIStatusBar *)self->_statusBar setStyleRequest:v10];
  [(UIStatusBar *)self->_statusBar setHidden:0];
  [(SBUISizeObservingView *)self->_containerView addSubview:self->_statusBar];
  uint64_t v11 = self->_statusBar;
  id v12 = [(SBAppClipOverlayViewController *)self->_placeholderViewController view];
  [v12 bounds];
  -[UIStatusBar setFrame:](v11, "setFrame:");

  [(UIStatusBar *)self->_statusBar setAutoresizingMask:18];
}

- (void)_beginPollingUpdateStillAvailable
{
  if (self->_isPendingUpdate)
  {
    if (self->_bundleIdentifier)
    {
      objc_initWeak(&location, self);
      dispatch_time_t v2 = dispatch_time(0, 8000000000);
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __77__SBFluidSwitcherAppClipLiveContentOverlay__beginPollingUpdateStillAvailable__block_invoke;
      v3[3] = &unk_1E6AF4B10;
      objc_copyWeak(&v4, &location);
      dispatch_after(v2, MEMORY[0x1E4F14428], v3);
      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

void __77__SBFluidSwitcherAppClipLiveContentOverlay__beginPollingUpdateStillAvailable__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_time_t v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((void *)WeakRetained + 1);
    if (v3)
    {
      id v4 = v3;
      BOOL v5 = +[SBAppClipPlaceholderWorkspaceEntity isAppClipUpdateAvailableForBundleIdentifier:v4];
      double v6 = SBLogCommon();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7)
        {
          uint64_t v8 = (objc_class *)objc_opt_class();
          uint64_t v9 = NSStringFromClass(v8);
          int v14 = 138543618;
          id v15 = v9;
          __int16 v16 = 2114;
          id v17 = v4;
          _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ The update for %{public}@ is still available. Polling.", (uint8_t *)&v14, 0x16u);
        }
        [v2 _beginPollingUpdateStillAvailable];
      }
      else
      {
        if (v7)
        {
          uint64_t v10 = (objc_class *)objc_opt_class();
          uint64_t v11 = NSStringFromClass(v10);
          int v14 = 138543618;
          id v15 = v11;
          __int16 v16 = 2114;
          id v17 = v4;
          _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ The update for %{public}@ is no longer available. Launching previous version.", (uint8_t *)&v14, 0x16u);
        }
        id v12 = +[SBApplicationController sharedInstance];
        id v13 = [v12 applicationWithBundleIdentifier:v4];

        if (v13)
        {
          v2[48] = 0;
          [v2 _launchApplication:v13];
        }
      }
    }
  }
}

- (void)_installedApplicationsDidChange:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = +[SBApplicationController sharedInstance];
  BOOL v5 = [v4 applicationWithBundleIdentifier:self->_bundleIdentifier];

  double v6 = SBLogCommon();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      bundleIdentifier = self->_bundleIdentifier;
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v9;
      __int16 v25 = 2114;
      v26 = bundleIdentifier;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Application did finish installing: %{public}@", buf, 0x16u);
    }
    uint64_t v11 = (void *)MEMORY[0x1E4F624D8];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __76__SBFluidSwitcherAppClipLiveContentOverlay__installedApplicationsDidChange___block_invoke;
    uint64_t v20 = &unk_1E6AF5290;
    v21 = self;
    id v22 = v5;
    id v12 = [v11 eventWithName:@"LaunchAppClipApplication" handler:&v17];
    id v13 = objc_msgSend(MEMORY[0x1E4F624E0], "sharedInstance", v17, v18, v19, v20, v21);
    [v13 executeOrAppendEvent:v12];
  }
  else
  {
    if (v7)
    {
      int v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      __int16 v16 = self->_bundleIdentifier;
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v15;
      __int16 v25 = 2114;
      v26 = v16;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Installed applications did change, but we still don't have an application for: %{public}@", buf, 0x16u);
    }
  }
}

uint64_t __76__SBFluidSwitcherAppClipLiveContentOverlay__installedApplicationsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchApplication:*(void *)(a1 + 40)];
}

- (void)_launchApplication:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"SBFluidSwitcherAppClipLiveContentOverlay.m", 329, @"We expect to have an application at this point for %@:%@", self->_bundleIdentifier, self->_sceneIdentifier object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  BOOL v7 = [SBDeviceApplicationSceneEntity alloc];
  sceneIdentifier = self->_sceneIdentifier;
  uint64_t v9 = [WeakRetained sceneManager];
  uint64_t v10 = [WeakRetained _fbsDisplayIdentity];
  uint64_t v11 = [(SBDeviceApplicationSceneEntity *)v7 initWithApplication:v5 uniqueIdentifier:sceneIdentifier sceneHandleProvider:v9 displayIdentity:v10];

  id v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  int v14 = SBLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v33 = v13;
    __int16 v34 = 2114;
    v35 = v11;
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Will launch app clip from placeholder with workspace entity: %{public}@", buf, 0x16u);
  }

  id v15 = (void *)MEMORY[0x1E4F628D8];
  __int16 v16 = [v5 bundleIdentifier];
  uint64_t v17 = [v15 storeForApplication:v16];

  uint64_t v18 = [(SBApplicationSceneEntity *)v11 sceneHandle];
  v19 = [v18 sceneIdentifier];
  uint64_t v20 = [v17 sceneStoreForIdentifier:v19 creatingIfNecessary:0];

  v21 = [v20 objectForKey:@"appClipIdentifier"];
  id v22 = [(id)SBApp webClipService];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke;
  v27[3] = &unk_1E6AFF288;
  v28 = v11;
  id v29 = WeakRetained;
  id v30 = v13;
  v31 = self;
  id v23 = v13;
  id v24 = WeakRetained;
  __int16 v25 = v11;
  [v22 buildLaunchActionsForAppClipWithWebClipIdentifier:v21 completion:v27];
}

void __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addActions:a2];
  v3 = +[SBWorkspace mainWorkspace];
  id v4 = [*(id *)(a1 + 40) _fbsDisplayConfiguration];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_2;
  v10[3] = &unk_1E6AF67B0;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_45;
  v7[3] = &unk_1E6AFF260;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  id v8 = v5;
  uint64_t v9 = v6;
  [v3 requestTransitionWithOptions:0 displayConfiguration:v4 builder:v10 validator:v7];
}

void __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setEventLabel:@"ActivateAppClipFromPlaceholder"];
  [v3 setSource:44];
  [v3 setTransactionProvider:&__block_literal_global_117];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_4;
  v8[3] = &unk_1E6AF57C0;
  id v9 = *(id *)(a1 + 32);
  [v3 modifyApplicationContext:v8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_5;
  v5[3] = &unk_1E6AF4A98;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  id v4 = (id)[v3 addCompletionHandler:v5];
}

SBActivateAppClipFromPlaceholderWorkspaceTransaction *__63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(SBAppToAppWorkspaceTransaction *)[SBActivateAppClipFromPlaceholderWorkspaceTransaction alloc] initWithTransitionRequest:v2];

  return v3;
}

void __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setActivatingEntity:v2];
  [v3 setWaitsForSceneUpdates:0];
}

void __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_5(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogCommon();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Did launch app clip from placeholder with workspace entity: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_5_cold_1(a1, v5);
  }
}

BOOL __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_45(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) switcherController];
  uint64_t v5 = [v4 unlockedEnvironmentMode];

  if (v5 == 2) {
    [v3 modifyApplicationContext:&__block_literal_global_48_1];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (*(void *)(v6 + 8)) {
    BOOL v7 = *(void *)(v6 + 16) != 0;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_2_46(uint64_t a1, void *a2)
{
  return [a2 setRequestedUnlockedEnvironmentMode:2];
}

- (id)_statusBarReusePool
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  id v3 = [WeakRetained statusBarManager];
  id v4 = [v3 reusePool];

  return v4;
}

- (void)updateDisplayLayoutElementWithBuilder:(id)a3
{
  if (self->_displayLayoutElementAssertion)
  {
    uint64_t v5 = (void (**)(id, SBSDisplayLayoutElement *))a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
    if (!WeakRetained)
    {
      int v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"SBFluidSwitcherAppClipLiveContentOverlay.m", 385, @"No window scene to get a publisher: %@", self object file lineNumber description];
    }
    id v16 = [WeakRetained displayLayoutPublisher];
    if (!v16)
    {
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBFluidSwitcherAppClipLiveContentOverlay.m", 385, @"No publisher for window scene: %@; self: %@",
        WeakRetained,
        self);
    }
    BOOL v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    uint64_t v9 = [v16 transitionAssertionWithReason:v8];

    [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

    v5[2](v5, self->_displayLayoutElement);
    uint64_t v11 = [v16 addElement:self->_displayLayoutElement];
    uint64_t v12 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v11;

    [v9 invalidate];
  }
  else
  {
    id v13 = (void (*)(void))*((void *)a3 + 2);
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
      __int16 v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"SBFluidSwitcherAppClipLiveContentOverlay.m", 403, @"No window scene to get a publisher: %@", self object file lineNumber description];
    }
    uint64_t v12 = [WeakRetained displayLayoutPublisher];
    if (!v12)
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBFluidSwitcherAppClipLiveContentOverlay.m", 403, @"No publisher for window scene: %@; self: %@",
        WeakRetained,
        self);
    }
    BOOL v7 = [v12 addElement:self->_displayLayoutElement];
    int v8 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v7;

    uint64_t v9 = (BSInvalidatable *)v12;
  }
  else
  {
    if (!displayLayoutElementAssertion) {
      return;
    }
    [(BSInvalidatable *)displayLayoutElementAssertion invalidate];
    uint64_t v9 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;
  }
}

- (BOOL)isDisplayLayoutElementActive
{
  return self->_displayLayoutElementAssertion != 0;
}

- (int64_t)overlayType
{
  return 2;
}

- (void)invalidate
{
  [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  self->_displayLayoutElementAssertion = 0;
}

- (id)prepareOverlayForContentRotation
{
  return 0;
}

- (id)overlaySceneHandle
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

- (void)setWantsEnhancedWindowingEnabled:(BOOL)a3
{
  self->_wantsEnhancedWindowingEnabled = a3;
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

- (SBWindowScene)_sbWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sbWindowScene);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutElement, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

void __63__SBFluidSwitcherAppClipLiveContentOverlay__launchApplication___block_invoke_5_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "%{public}@ Failed to launch app clip from placeholder with workspace entity: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
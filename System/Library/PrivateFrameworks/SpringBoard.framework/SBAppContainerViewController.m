@interface SBAppContainerViewController
- (BOOL)SB_conformsToSBApplicationSceneStatusBarDescriberProviding;
- (CGSize)contentReferenceSize;
- (SBAppContainerViewController)initWithDisplayIdentity:(id)a3;
- (SBApplicationSceneHandle)sceneHandle;
- (SBApplicationSceneStatusBarDescribing)statusBarDescriber;
- (SBApplicationSceneViewControlling)_applicationSceneViewController;
- (SBApplicationSceneViewControllingStatusBarDelegate)applicationSceneStatusBarDelegate;
- (SBDeviceApplicationSceneStatusBarStateObserver)statusBarDelegate;
- (SBScenePlaceholderContentContext)placeholderContentContext;
- (UIView)customContentView;
- (double)statusBarAlpha;
- (id)_applicationSceneViewControllerForSceneHandle:(id)a3;
- (id)_deviceApplicationSceneHandle;
- (id)_newDisplayLayoutElementForEntity:(id)a3;
- (id)newSnapshot;
- (id)newSnapshotView;
- (int64_t)_overrideStatusBarOrientationGivenFallbackOrientation:(int64_t)a3;
- (int64_t)containerOrientation;
- (int64_t)contentOrientation;
- (int64_t)displayMode;
- (int64_t)overrideStatusBarStyle;
- (void)_clearState;
- (void)_updateDisplayLayoutElementForSceneExistence:(id)a3;
- (void)applicationSceneViewController:(id)a3 didUpdateStatusBarSettings:(id)a4;
- (void)configureWithWorkspaceEntity:(id)a3 forLayoutElement:(id)a4 layoutState:(id)a5 referenceFrame:(CGRect)a6;
- (void)containerContentWrapperInterfaceOrientationChangedTo:(int64_t)a3;
- (void)didEndTransitionToVisible:(BOOL)a3;
- (void)invalidate;
- (void)newSnapshotViewOnQueue:(id)a3 withCompletion:(id)a4;
- (void)prepareForReuse;
- (void)sceneHandle:(id)a3 didCreateScene:(id)a4;
- (void)sceneHandle:(id)a3 didUpdateContentState:(int64_t)a4;
- (void)sceneHandle:(id)a3 didUpdatePairingStatusForExternalSceneIdentifiers:(id)a4;
- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5;
- (void)sceneWithIdentifier:(id)a3 didChangeSceneInterfaceOrientationTo:(int64_t)a4;
- (void)setApplicationSceneStatusBarDelegate:(id)a3;
- (void)setContentReferenceSize:(CGSize)a3 withContentOrientation:(int64_t)a4 andContainerOrientation:(int64_t)a5;
- (void)setContentWrapperInterfaceOrientation:(int64_t)a3;
- (void)setCustomContentView:(id)a3;
- (void)setDisplayMode:(int64_t)a3 animationFactory:(id)a4 completion:(id)a5;
- (void)setPlaceholderContentContext:(id)a3;
- (void)setStatusBarDelegate:(id)a3;
@end

@implementation SBAppContainerViewController

- (SBAppContainerViewController)initWithDisplayIdentity:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBAppContainerViewController;
  result = [(SBLayoutElementViewController *)&v4 initWithDisplayIdentity:a3];
  if (result) {
    result->_requestedDisplayMode = 4;
  }
  return result;
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)SBAppContainerViewController;
  [(SBLayoutElementViewController *)&v3 invalidate];
  [(SBAppContainerViewController *)self _clearState];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)SBAppContainerViewController;
  [(SBLayoutElementViewController *)&v3 prepareForReuse];
  [(SBAppContainerViewController *)self _clearState];
}

- (void)configureWithWorkspaceEntity:(id)a3 forLayoutElement:(id)a4 layoutState:(id)a5 referenceFrame:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  if (([v14 isApplicationSceneEntity] & 1) == 0)
  {
    v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2, self, @"SBAppContainerViewController.m", 86, @"Invalid parameter not satisfying: %@", @"[workspaceEntity isApplicationSceneEntity]" object file lineNumber description];
  }
  v17 = [v14 applicationSceneEntity];
  v18 = [v17 sceneHandle];
  p_applicationSceneHandle = (id *)&self->_applicationSceneHandle;
  applicationSceneHandle = self->_applicationSceneHandle;
  if (applicationSceneHandle)
  {
    [(SBApplicationSceneHandle *)applicationSceneHandle removeObserver:self];
    id v21 = *p_applicationSceneHandle;
    id *p_applicationSceneHandle = 0;
  }
  v54.receiver = self;
  v54.super_class = (Class)SBAppContainerViewController;
  v53 = v17;
  -[SBLayoutElementViewController configureWithWorkspaceEntity:forLayoutElement:layoutState:referenceFrame:](&v54, sel_configureWithWorkspaceEntity_forLayoutElement_layoutState_referenceFrame_, v17, v15, v16, x, y, width, height);
  objc_storeStrong((id *)&self->_applicationSceneHandle, v18);
  [*p_applicationSceneHandle addObserver:self];
  [(SBDeviceApplicationSceneStatusBarStateProxy *)self->_statusBarObserverProxy invalidate];
  v22 = [_SBAppContainerStatusBarStateProxy alloc];
  v23 = [(SBAppContainerViewController *)self _deviceApplicationSceneHandle];
  v24 = [(SBDeviceApplicationSceneStatusBarStateProxy *)v22 initWithDeviceApplicationSceneHandle:v23];
  statusBarObserverProxdouble y = self->_statusBarObserverProxy;
  self->_statusBarObserverProxdouble y = v24;

  [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self->_statusBarObserverProxy addStatusBarObserver:self];
  [(_SBAppContainerStatusBarStateProxy *)self->_statusBarObserverProxy setAppVCBackReference:self];
  v26 = self->_statusBarObserverProxy;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarDelegate);
  [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)v26 addStatusBarObserver:WeakRetained];

  [(SBAppContainerViewController *)self loadViewIfNeeded];
  v28 = self->_applicationSceneViewController;
  v29 = [(SBAppContainerViewController *)self _applicationSceneViewControllerForSceneHandle:*p_applicationSceneHandle];
  applicationSceneViewController = self->_applicationSceneViewController;
  self->_applicationSceneViewController = v29;

  v31 = self->_applicationSceneViewController;
  v32 = v28;
  if (v28 != v31)
  {
    [(SBAppContainerViewController *)self bs_removeChildViewController:v28];
    v32 = self->_applicationSceneViewController;
  }
  v33 = (void *)[*p_applicationSceneHandle newScenePlaceholderContentContextWithActivationSettings:v14];
  [(SBApplicationSceneViewControlling *)v32 setPlaceholderContentContext:v33];

  -[SBApplicationSceneViewControlling setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_applicationSceneViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", [v16 interfaceOrientationForLayoutElement:v15], objc_msgSend(v16, "interfaceOrientation"), width, height);
  [(SBApplicationSceneViewControlling *)self->_applicationSceneViewController setApplicationSceneStatusBarDelegate:self];
  [(SBAppContainerViewController *)self _configureViewController:self->_applicationSceneViewController];
  if (v28 != v31)
  {
    v34 = self->_applicationSceneViewController;
    v35 = [(SBLayoutElementViewController *)self _contentContainerView];
    [(SBAppContainerViewController *)self bs_addChildViewController:v34 withSuperview:v35];

    v36 = [(SBApplicationSceneViewControlling *)self->_applicationSceneViewController view];
    v37 = [(SBLayoutElementViewController *)self _contentContainerView];
    [v36 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v36 leftAnchor];
    v38 = id v52 = v15;
    v39 = [v37 leftAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    [v40 setActive:1];

    v41 = [v36 rightAnchor];
    v42 = [v37 rightAnchor];
    v43 = [v41 constraintEqualToAnchor:v42];
    [v43 setActive:1];

    v44 = [v36 topAnchor];
    v45 = [v37 topAnchor];
    v46 = [v44 constraintEqualToAnchor:v45];
    [v46 setActive:1];

    v47 = [v36 bottomAnchor];
    v48 = [v37 bottomAnchor];
    v49 = [v47 constraintEqualToAnchor:v48];
    [v49 setActive:1];

    id v15 = v52;
    [(SBAppContainerViewController *)self setDisplayMode:[(SBAppContainerViewController *)self displayMode] animationFactory:0 completion:0];
  }
  v50 = [v18 sceneIfExists];
  if (v50) {
    [(SBAppContainerViewController *)self _updateDisplayLayoutElementForSceneExistence:v50];
  }
}

- (void)didEndTransitionToVisible:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBAppContainerViewController;
  -[SBLayoutElementViewController didEndTransitionToVisible:](&v7, sel_didEndTransitionToVisible_);
  applicationSceneViewController = self->_applicationSceneViewController;
  if (applicationSceneViewController)
  {
    if (!a3)
    {
      id v6 = [(SBApplicationSceneHandle *)self->_applicationSceneHandle newScenePlaceholderContentContextWithActivationSettings:0];
      [(SBApplicationSceneViewControlling *)applicationSceneViewController setPlaceholderContentContext:v6];
    }
  }
}

- (id)_newDisplayLayoutElementForEntity:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 applicationSceneEntity];
  v5 = [v4 uniqueIdentifier];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FA6A68]) initWithIdentifier:v5];
  objc_super v7 = [v3 applicationSceneEntity];

  v8 = [v7 application];
  v9 = [v8 bundleIdentifier];
  [v6 setBundleIdentifier:v9];

  [v6 setUIApplicationElement:1];
  return v6;
}

- (id)_applicationSceneViewControllerForSceneHandle:(id)a3
{
  id v3 = (void *)[a3 newSceneViewController];
  return v3;
}

- (SBApplicationSceneHandle)sceneHandle
{
  return self->_applicationSceneHandle;
}

- (SBScenePlaceholderContentContext)placeholderContentContext
{
  return (SBScenePlaceholderContentContext *)[(SBApplicationSceneViewControlling *)self->_applicationSceneViewController placeholderContentContext];
}

- (void)setPlaceholderContentContext:(id)a3
{
}

- (UIView)customContentView
{
  return (UIView *)[(SBApplicationSceneViewControlling *)self->_applicationSceneViewController customContentView];
}

- (void)setCustomContentView:(id)a3
{
}

- (id)newSnapshot
{
  return (id)[(SBApplicationSceneViewControlling *)self->_applicationSceneViewController newSnapshot];
}

- (id)newSnapshotView
{
  return (id)[(SBApplicationSceneViewControlling *)self->_applicationSceneViewController newSnapshotView];
}

- (void)newSnapshotViewOnQueue:(id)a3 withCompletion:(id)a4
{
}

- (CGSize)contentReferenceSize
{
  [(SBApplicationSceneViewControlling *)self->_applicationSceneViewController contentReferenceSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (int64_t)contentOrientation
{
  return [(SBApplicationSceneViewControlling *)self->_applicationSceneViewController contentOrientation];
}

- (int64_t)containerOrientation
{
  return [(SBApplicationSceneViewControlling *)self->_applicationSceneViewController containerOrientation];
}

- (void)setContentWrapperInterfaceOrientation:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBAppContainerViewController;
  -[SBLayoutElementViewController setContentWrapperInterfaceOrientation:](&v5, sel_setContentWrapperInterfaceOrientation_);
  [(SBAppContainerViewController *)self containerContentWrapperInterfaceOrientationChangedTo:a3];
}

- (void)setContentReferenceSize:(CGSize)a3 withContentOrientation:(int64_t)a4 andContainerOrientation:(int64_t)a5
{
}

- (int64_t)displayMode
{
  return self->_requestedDisplayMode;
}

- (void)setDisplayMode:(int64_t)a3 animationFactory:(id)a4 completion:(id)a5
{
  id v11 = a4;
  id v8 = a5;
  v9 = v8;
  self->_requestedDisplayMode = a3;
  applicationSceneViewController = self->_applicationSceneViewController;
  if (applicationSceneViewController)
  {
    [(SBApplicationSceneViewControlling *)applicationSceneViewController setDisplayMode:[(SBAppContainerViewController *)self displayMode] animationFactory:v11 completion:v8];
  }
  else if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
  }
}

- (void)containerContentWrapperInterfaceOrientationChangedTo:(int64_t)a3
{
}

- (int64_t)overrideStatusBarStyle
{
  return [(_SBAppContainerStatusBarStateProxy *)self->_statusBarObserverProxy overrideStatusBarStyle];
}

- (void)setApplicationSceneStatusBarDelegate:(id)a3
{
}

- (SBApplicationSceneViewControllingStatusBarDelegate)applicationSceneStatusBarDelegate
{
  return (SBApplicationSceneViewControllingStatusBarDelegate *)[(SBApplicationSceneViewControlling *)self->_applicationSceneViewController applicationSceneStatusBarDelegate];
}

- (double)statusBarAlpha
{
  [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self->_statusBarObserverProxy statusBarAlpha];
  return result;
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
}

- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  sceneSettingsDiffInspector = self->_sceneSettingsDiffInspector;
  if (!sceneSettingsDiffInspector)
  {
    v12 = (UIApplicationSceneSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F42780]);
    v13 = self->_sceneSettingsDiffInspector;
    self->_sceneSettingsDiffInspector = v12;

    objc_initWeak(&location, self);
    id v14 = self->_sceneSettingsDiffInspector;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __87__SBAppContainerViewController_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke;
    v18[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v19, &location);
    [(UIApplicationSceneSettingsDiffInspector *)v14 observeIsForegroundWithBlock:v18];
    id v15 = self->_sceneSettingsDiffInspector;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __87__SBAppContainerViewController_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_2;
    v16[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v17, &location);
    [(UIApplicationSceneSettingsDiffInspector *)v15 observeUnderLockWithBlock:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    sceneSettingsDiffInspector = self->_sceneSettingsDiffInspector;
  }
  [v9 evaluateWithInspector:sceneSettingsDiffInspector context:0];
}

void __87__SBAppContainerViewController_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateDisplayLayoutElementVisibility];
    id WeakRetained = v2;
  }
}

void __87__SBAppContainerViewController_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateDisplayLayoutElementVisibility];
    id WeakRetained = v2;
  }
}

- (void)sceneHandle:(id)a3 didUpdatePairingStatusForExternalSceneIdentifiers:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__SBAppContainerViewController_sceneHandle_didUpdatePairingStatusForExternalSceneIdentifiers___block_invoke;
  v7[3] = &unk_1E6B01568;
  id v8 = v5;
  id v6 = v5;
  [(SBLayoutElementViewController *)self _updateDisplayLayoutElementWithBuilder:v7];
}

void __94__SBAppContainerViewController_sceneHandle_didUpdatePairingStatusForExternalSceneIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *MEMORY[0x1E4F71DE8];
  id v4 = a2;
  objc_msgSend(v4, "setHasKeyboardFocus:", objc_msgSend(v2, "isPairedWithExternalSceneWithIdentifier:", v3));
}

- (void)sceneHandle:(id)a3 didUpdateContentState:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__SBAppContainerViewController_sceneHandle_didUpdateContentState___block_invoke;
  v4[3] = &unk_1E6AF4A70;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __66__SBAppContainerViewController_sceneHandle_didUpdateContentState___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40) == 2)
  {
    uint64_t v1 = *(void *)(a1 + 32);
    id v2 = *(void **)(v1 + 1104);
    id v3 = (id)[*(id *)(v1 + 1088) newScenePlaceholderContentContextWithActivationSettings:0];
    [v2 setPlaceholderContentContext:v3];
  }
}

- (BOOL)SB_conformsToSBApplicationSceneStatusBarDescriberProviding
{
  return 1;
}

- (void)setStatusBarDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarDelegate);
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_statusBarDelegate, obj);
    [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self->_statusBarObserverProxy removeStatusBarObserver:WeakRetained];
    [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self->_statusBarObserverProxy addStatusBarObserver:obj];
  }
}

- (id)_deviceApplicationSceneHandle
{
  uint64_t v3 = objc_opt_class();
  applicationSceneHandle = self->_applicationSceneHandle;
  return SBSafeCast(v3, applicationSceneHandle);
}

- (int64_t)_overrideStatusBarOrientationGivenFallbackOrientation:(int64_t)a3
{
  return 0;
}

- (void)sceneWithIdentifier:(id)a3 didChangeSceneInterfaceOrientationTo:(int64_t)a4
{
  id v11 = a3;
  id v5 = self->_statusBarObserverProxy;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)v5 statusBarOrientation];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = [(SBAppContainerViewController *)self _deviceApplicationSceneHandle];
      int v10 = [v9 wantsDeviceOrientationEventsEnabled];

      if (v10) {
        [(SBAppContainerViewController *)self setContentWrapperInterfaceOrientation:v8];
      }
    }
  }
}

- (void)applicationSceneViewController:(id)a3 didUpdateStatusBarSettings:(id)a4
{
  id v5 = a4;
  id v6 = SBLogAppStatusBars();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[SBAppContainerViewController applicationSceneViewController:didUpdateStatusBarSettings:]((uint64_t)self, (uint64_t)v5, v6);
  }

  [(SBDeviceApplicationSceneStatusBarStateProxy *)self->_statusBarObserverProxy invalidateStatusBarSettings];
}

- (void)_clearState
{
  self->_requestedDisplayMode = 4;
  sceneSettingsDiffInspector = self->_sceneSettingsDiffInspector;
  if (sceneSettingsDiffInspector)
  {
    [(UIApplicationSceneSettingsDiffInspector *)sceneSettingsDiffInspector removeAllObservers];
    id v4 = self->_sceneSettingsDiffInspector;
    self->_sceneSettingsDiffInspector = 0;
  }
  if (self->_applicationSceneViewController)
  {
    -[SBAppContainerViewController bs_removeChildViewController:](self, "bs_removeChildViewController:");
    applicationSceneViewController = self->_applicationSceneViewController;
    self->_applicationSceneViewController = 0;
  }
  applicationSceneHandle = self->_applicationSceneHandle;
  if (applicationSceneHandle)
  {
    [(SBApplicationSceneHandle *)applicationSceneHandle removeObserver:self];
    uint64_t v7 = self->_applicationSceneHandle;
    self->_applicationSceneHandle = 0;
  }
  statusBarObserverProxdouble y = self->_statusBarObserverProxy;
  if (statusBarObserverProxy)
  {
    [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)statusBarObserverProxy removeStatusBarObserver:self];
    [(SBDeviceApplicationSceneStatusBarStateProxy *)self->_statusBarObserverProxy invalidate];
    id v9 = self->_statusBarObserverProxy;
    self->_statusBarObserverProxdouble y = 0;
  }
}

- (void)_updateDisplayLayoutElementForSceneExistence:(id)a3
{
  if ([a3 isValid])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __77__SBAppContainerViewController__updateDisplayLayoutElementForSceneExistence___block_invoke;
    v4[3] = &unk_1E6B01568;
    v4[4] = self;
    [(SBLayoutElementViewController *)self _updateDisplayLayoutElementWithBuilder:v4];
  }
}

void __77__SBAppContainerViewController__updateDisplayLayoutElementForSceneExistence___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 sceneHandle];
  objc_msgSend(v3, "setHasKeyboardFocus:", objc_msgSend(v4, "isPairedWithExternalSceneWithIdentifier:", *MEMORY[0x1E4F71DE8]));
}

- (SBApplicationSceneViewControlling)_applicationSceneViewController
{
  return self->_applicationSceneViewController;
}

- (SBApplicationSceneStatusBarDescribing)statusBarDescriber
{
  return (SBApplicationSceneStatusBarDescribing *)self->_statusBarObserverProxy;
}

- (SBDeviceApplicationSceneStatusBarStateObserver)statusBarDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarDelegate);
  return (SBDeviceApplicationSceneStatusBarStateObserver *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_statusBarDelegate);
  objc_storeStrong((id *)&self->_statusBarObserverProxy, 0);
  objc_storeStrong((id *)&self->_applicationSceneViewController, 0);
  objc_storeStrong((id *)&self->_sceneSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_applicationSceneHandle, 0);
}

- (void)applicationSceneViewController:(NSObject *)a3 didUpdateStatusBarSettings:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = [*(id *)(a1 + 1088) sceneIdentifier];
  int v7 = 138412802;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  id v10 = (id)objc_opt_class();
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  id v6 = v10;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "(%@) %@ applying settings: %@", (uint8_t *)&v7, 0x20u);
}

@end
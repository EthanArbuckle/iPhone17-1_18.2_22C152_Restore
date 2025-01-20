@interface SBDeviceApplicationAppClipOverlayViewProvider
- (BOOL)wantsResignActiveAssertion;
- (SBDeviceApplicationAppClipOverlayViewProvider)initWithSceneHandle:(id)a3 delegate:(id)a4;
- (id)_realOverlayViewController;
- (void)_activateIfPossible;
- (void)_deactivateIfPossible;
- (void)_updateOverlaySceneActivationState;
- (void)dealloc;
- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5;
@end

@implementation SBDeviceApplicationAppClipOverlayViewProvider

- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5
{
}

void __78__SBDeviceApplicationAppClipOverlayViewProvider_initWithSceneHandle_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateOverlaySceneActivationState];
}

- (void)_updateOverlaySceneActivationState
{
  if (self->_appClipViewController)
  {
    id v10 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
    v3 = [v10 sceneIfExists];
    v4 = v3;
    if (v3)
    {
      v5 = [v3 settings];
      int v6 = [v5 isForeground];

      v7 = [v4 settings];
      if ([v7 isUISubclass]) {
        BOOL v8 = ([v7 deactivationReasons] & 0xFFFFFFFFFFFFFEFFLL) != 0;
      }
      else {
        BOOL v8 = 0;
      }
      if (v6) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 2;
      }
      [(SBAppClipOverlayViewController *)self->_appClipViewController setSceneActivationState:v9 animated:1];
    }
  }
}

- (void)_activateIfPossible
{
  if (!self->_appClipViewController)
  {
    v3 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
    v4 = [v3 application];
    v5 = [v4 info];
    int v6 = [v5 isAppClip];

    if (v6)
    {
      v7 = [v4 bundleIdentifier];
      BOOL v8 = [v3 sceneIdentifier];
      uint64_t v9 = [SBAppClipOverlayViewController alloc];
      id v10 = [(id)SBApp appClipOverlayCoordinator];
      v11 = [(SBAppClipOverlayViewController *)v9 initWithCoordinator:v10 bundleIdentifier:v7 sceneIdentifier:v8];
      appClipViewController = self->_appClipViewController;
      self->_appClipViewController = v11;

      [(SBAppClipOverlayViewController *)self->_appClipViewController setDisplayedOverPlaceholder:0 animated:0];
      [(SBDeviceApplicationAppClipOverlayViewProvider *)self _updateOverlaySceneActivationState];
      v13.receiver = self;
      v13.super_class = (Class)SBDeviceApplicationAppClipOverlayViewProvider;
      [(SBDeviceApplicationSceneOverlayViewProvider *)&v13 _activateIfPossible];
    }
  }
}

- (SBDeviceApplicationAppClipOverlayViewProvider)initWithSceneHandle:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBDeviceApplicationAppClipOverlayViewProvider;
  BOOL v8 = [(SBDeviceApplicationSceneOverlayViewProvider *)&v16 initWithSceneHandle:v6 delegate:v7];
  if (v8)
  {
    [v6 addObserver:v8];
    uint64_t v9 = (UIApplicationSceneSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F42780]);
    sceneSettingsDiffInspector = v8->_sceneSettingsDiffInspector;
    v8->_sceneSettingsDiffInspector = v9;

    objc_initWeak(&location, v8);
    v11 = v8->_sceneSettingsDiffInspector;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __78__SBDeviceApplicationAppClipOverlayViewProvider_initWithSceneHandle_delegate___block_invoke;
    v13[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v14, &location);
    [(UIApplicationSceneSettingsDiffInspector *)v11 observeDeactivationReasonsWithBlock:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)dealloc
{
  v3 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBDeviceApplicationAppClipOverlayViewProvider;
  [(SBDeviceApplicationSceneOverlayViewProvider *)&v4 dealloc];
}

- (BOOL)wantsResignActiveAssertion
{
  return 0;
}

- (void)_deactivateIfPossible
{
  appClipViewController = self->_appClipViewController;
  if (appClipViewController)
  {
    self->_appClipViewController = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBDeviceApplicationAppClipOverlayViewProvider;
  [(SBDeviceApplicationSceneOverlayViewProvider *)&v4 _deactivateIfPossible];
}

- (id)_realOverlayViewController
{
  return self->_appClipViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_appClipViewController, 0);
}

@end
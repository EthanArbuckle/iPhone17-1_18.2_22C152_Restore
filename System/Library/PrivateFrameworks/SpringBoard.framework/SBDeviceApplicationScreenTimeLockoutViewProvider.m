@interface SBDeviceApplicationScreenTimeLockoutViewProvider
- (SBDeviceApplicationScreenTimeLockoutViewProvider)initWithSceneHandle:(id)a3 delegate:(id)a4;
- (id)_newBlockingViewControllerWithBundleIdentifier:(id)a3;
- (id)_realOverlayViewController;
- (int64_t)priority;
- (void)_activateIfPossible;
- (void)_deactivateIfPossibleRespectingAppBlockedState:(BOOL)a3;
- (void)_handleInstalledAppsChanged:(id)a3;
- (void)dealloc;
- (void)hideContentWithAnimation:(BOOL)a3 completionHandler:(id)a4;
- (void)sceneHandle:(id)a3 didCreateScene:(id)a4;
- (void)showContentWithAnimation:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation SBDeviceApplicationScreenTimeLockoutViewProvider

- (SBDeviceApplicationScreenTimeLockoutViewProvider)initWithSceneHandle:(id)a3 delegate:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBDeviceApplicationScreenTimeLockoutViewProvider;
  v4 = [(SBDeviceApplicationSceneOverlayViewProvider *)&v7 initWithSceneHandle:a3 delegate:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__handleInstalledAppsChanged_ name:@"SBInstalledApplicationsDidChangeNotification" object:0];
  }
  return v4;
}

- (void)_activateIfPossible
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
  v4 = [v3 application];

  v5 = [v4 info];
  if ([v5 isBlockedForScreenTimeExpiration])
  {
    v6 = [(id)SBApp privacyPreflightController];
    objc_super v7 = [v5 applicationIdentity];
    int v8 = [v6 requiresPreflightForApplication:v7];

    if (v8)
    {
      v9 = SBLogScreenTime();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = [v4 bundleIdentifier];
        *(_DWORD *)buf = 138543362;
        v27 = v10;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "not activating overlay for %{public}@, exiting early because the app still requires privacy disclosure", buf, 0xCu);
      }
      self->_waitingForPrivacyPreflight = 1;
      v11 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
      [v11 addObserver:self];
    }
    else
    {
      blockingViewController = self->_blockingViewController;
      v15 = SBLogScreenTime();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
      if (blockingViewController)
      {
        if (v16)
        {
          v17 = [v4 bundleIdentifier];
          *(_DWORD *)buf = 138543618;
          v27 = v17;
          __int16 v28 = 2048;
          uint64_t v29 = [v5 screenTimePolicy];
          _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_INFO, "had existing VC for app %{public}@, updating with new policy %ld", buf, 0x16u);
        }
        v18 = self->_blockingViewController;
        uint64_t v19 = [v5 screenTimePolicy];
        v20 = [v5 bundleIdentifier];
        [(STBlockingViewController *)v18 updateAppearanceUsingPolicy:v19 forBundleIdentifier:v20];
      }
      else
      {
        if (v16)
        {
          v21 = [v4 bundleIdentifier];
          *(_DWORD *)buf = 138543362;
          v27 = v21;
          _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_INFO, "creating new blocking view controller for app %{public}@", buf, 0xCu);
        }
        v22 = [v4 bundleIdentifier];
        v23 = [(SBDeviceApplicationScreenTimeLockoutViewProvider *)self _newBlockingViewControllerWithBundleIdentifier:v22];
        v24 = self->_blockingViewController;
        self->_blockingViewController = v23;

        v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v20 addObserver:self selector:sel__blockingViewControllerDismissedItself name:*MEMORY[0x1E4F99DA8] object:self->_blockingViewController];
      }

      self->_isActive = 1;
      v25.receiver = self;
      v25.super_class = (Class)SBDeviceApplicationScreenTimeLockoutViewProvider;
      [(SBDeviceApplicationSceneOverlayViewProvider *)&v25 _activateIfPossible];
    }
  }
  else
  {
    v12 = SBLogScreenTime();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = [v4 bundleIdentifier];
      *(_DWORD *)buf = 138543362;
      v27 = v13;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_INFO, "attempted to activate overlay for %{public}@, exiting early because app is not blocked", buf, 0xCu);
    }
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SBInstalledApplicationsDidChangeNotification" object:0];
  if (self->_blockingViewController) {
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E4F99DA8]);
  }

  v4.receiver = self;
  v4.super_class = (Class)SBDeviceApplicationScreenTimeLockoutViewProvider;
  [(SBDeviceApplicationSceneOverlayViewProvider *)&v4 dealloc];
}

- (int64_t)priority
{
  return 4;
}

- (void)_handleInstalledAppsChanged:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [a3 userInfo];
  v5 = [v4 objectForKey:@"SBInstalledApplicationsUpdatedBundleIDs"];

  if ([v5 count])
  {
    v6 = SBLogScreenTime();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v13 = 138543362;
      v14 = v5;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "scene overlay got applicationsChanged: %{public}@", (uint8_t *)&v13, 0xCu);
    }

    objc_super v7 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
    int v8 = [v7 application];

    v9 = [v8 bundleIdentifier];
    v10 = [v8 info];
    int v11 = [v10 isBlockedForScreenTimeExpiration];

    v12 = SBLogScreenTime();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138543618;
      v14 = v9;
      __int16 v15 = 1024;
      int v16 = v11;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_INFO, "app %{public}@ is now blocked for Downtime: %d", (uint8_t *)&v13, 0x12u);
    }

    if (([v5 containsObject:v9] & v11) == 1)
    {
      [(SBDeviceApplicationScreenTimeLockoutViewProvider *)self _activateIfPossible];
    }
    else if (self->_isActive && (([v5 containsObject:v9] ^ 1 | v11) & 1) == 0)
    {
      [(SBDeviceApplicationScreenTimeLockoutViewProvider *)self _deactivateIfPossibleRespectingAppBlockedState:1];
    }
  }
}

- (void)showContentWithAnimation:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  objc_super v7 = SBLogScreenTime();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
    v9 = [v8 application];
    v10 = [v9 bundleIdentifier];
    v11[0] = 67109378;
    v11[1] = v4;
    __int16 v12 = 2114;
    int v13 = v10;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "showing content with animation: %d for app %{public}@", (uint8_t *)v11, 0x12u);
  }
  [(STBlockingViewController *)self->_blockingViewController showWithAnimation:v4 completionHandler:v6];
}

- (void)hideContentWithAnimation:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  objc_super v7 = SBLogScreenTime();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
    v9 = [v8 application];
    v10 = [v9 bundleIdentifier];
    v11[0] = 67109378;
    v11[1] = v4;
    __int16 v12 = 2114;
    int v13 = v10;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "hiding content with animation: %d for app %{public}@", (uint8_t *)v11, 0x12u);
  }
  [(STBlockingViewController *)self->_blockingViewController hideWithAnimation:v4 completionHandler:v6];
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  if (self->_waitingForPrivacyPreflight)
  {
    self->_waitingForPrivacyPreflight = 0;
    objc_msgSend(a3, "removeObserver:", self, a4);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__SBDeviceApplicationScreenTimeLockoutViewProvider_sceneHandle_didCreateScene___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __79__SBDeviceApplicationScreenTimeLockoutViewProvider_sceneHandle_didCreateScene___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateIfPossible];
}

- (void)_deactivateIfPossibleRespectingAppBlockedState:(BOOL)a3
{
  int v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
  id v6 = v5;
  if (v3)
  {
    objc_super v7 = [v5 application];
    int v8 = [v7 info];
    int v3 = [v8 isBlockedForScreenTimeExpiration];
  }
  if (self->_isActive && (v3 & 1) == 0 && self->_blockingViewController)
  {
    self->_BOOL isActive = 0;
    v14.receiver = self;
    v14.super_class = (Class)SBDeviceApplicationScreenTimeLockoutViewProvider;
    [(SBDeviceApplicationSceneOverlayViewProvider *)&v14 _deactivateIfPossible];
  }
  else
  {
    v9 = SBLogScreenTime();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = [v6 application];
      int v11 = [v10 bundleIdentifier];
      BOOL isActive = self->_isActive;
      blockingViewController = self->_blockingViewController;
      *(_DWORD *)buf = 138544130;
      int v16 = v11;
      __int16 v17 = 1024;
      BOOL v18 = isActive;
      __int16 v19 = 1024;
      int v20 = v3;
      __int16 v21 = 2114;
      v22 = blockingViewController;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "attempted to deactivate overlay for %{public}@, exiting early with state %d, %d, %{public}@", buf, 0x22u);
    }
  }
}

- (id)_realOverlayViewController
{
  if (self->_isActive) {
    return self->_blockingViewController;
  }
  else {
    return 0;
  }
}

- (id)_newBlockingViewControllerWithBundleIdentifier:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F99D98];
  id v5 = a3;
  id v6 = (void *)[v4 newTranslucentBlockingViewController];
  objc_super v7 = [MEMORY[0x1E4F99D98] closeApplicationHandler];
  [v6 setOkButtonHandler:v7];

  int v8 = [(SBDeviceApplicationSceneOverlayViewProvider *)self sceneHandle];
  v9 = [v8 application];
  v10 = [v9 info];

  objc_msgSend(v6, "updateAppearanceUsingPolicy:forBundleIdentifier:", objc_msgSend(v10, "screenTimePolicy"), v5);
  return v6;
}

- (void).cxx_destruct
{
}

@end
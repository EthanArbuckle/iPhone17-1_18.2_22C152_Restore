@interface SBApplicationSceneViewController
- (BOOL)_isApplicationStatusBarHidden;
- (SBApplicationSceneViewController)initWithSceneHandle:(id)a3;
- (SBApplicationSceneViewControllingStatusBarDelegate)applicationSceneStatusBarDelegate;
- (SBStatusBarSettings)_overrideStatusBarSettings;
- (double)_applicationStatusBarAlpha;
- (double)statusBarAlpha;
- (int64_t)overrideStatusBarStyle;
- (void)_setOverrideStatusBarSettings:(id)a3;
- (void)setApplicationSceneStatusBarDelegate:(id)a3;
@end

@implementation SBApplicationSceneViewController

- (int64_t)overrideStatusBarStyle
{
  overrideStatusBarSettings = self->_overrideStatusBarSettings;
  if (overrideStatusBarSettings) {
    return [(SBStatusBarSettings *)overrideStatusBarSettings style];
  }
  else {
    return -1;
  }
}

- (void)_setOverrideStatusBarSettings:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(SBStatusBarSettings *)self->_overrideStatusBarSettings isEqual:v4];
  v6 = SBLogAppStatusBars();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(SBApplicationSceneViewController *)self _setOverrideStatusBarSettings:v7];
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = [(SBSceneViewController *)self sceneHandle];
      v9 = [v8 sceneIdentifier];
      int v13 = 138412802;
      v14 = v9;
      __int16 v15 = 2112;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      id v18 = v4;
      id v10 = v16;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "(%@) %@ Override status bar settings did change: %{public}@", (uint8_t *)&v13, 0x20u);
    }
    v11 = (SBStatusBarSettings *)[v4 copy];
    overrideStatusBarSettings = self->_overrideStatusBarSettings;
    self->_overrideStatusBarSettings = v11;

    v7 = [(SBApplicationSceneViewController *)self applicationSceneStatusBarDelegate];
    [v7 applicationSceneViewController:self didUpdateStatusBarSettings:v4];
  }
}

- (SBApplicationSceneViewControllingStatusBarDelegate)applicationSceneStatusBarDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationSceneStatusBarDelegate);
  return (SBApplicationSceneViewControllingStatusBarDelegate *)WeakRetained;
}

- (SBApplicationSceneViewController)initWithSceneHandle:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBApplicationSceneViewController.m", 25, @"ApplicationSceneHandle must be of type SBApplicationSceneHandle, but was: %@", v5 object file lineNumber description];
  }
  v9.receiver = self;
  v9.super_class = (Class)SBApplicationSceneViewController;
  v6 = [(SBSceneViewController *)&v9 initWithSceneHandle:v5];

  return v6;
}

- (double)statusBarAlpha
{
  v3 = [(SBStatusBarSettings *)self->_overrideStatusBarSettings alpha];

  if (v3)
  {
    id v4 = [(SBStatusBarSettings *)self->_overrideStatusBarSettings alpha];
    [v4 doubleValue];
    double v6 = v5;

    return v6;
  }
  else
  {
    [(SBApplicationSceneViewController *)self _applicationStatusBarAlpha];
  }
  return result;
}

- (double)_applicationStatusBarAlpha
{
  v2 = [(SBSceneViewController *)self sceneHandle];
  v3 = [v2 sceneIfExists];

  if (v3)
  {
    id v4 = [v3 uiClientSettings];
    [v4 statusBarAlpha];
    double v6 = v5;
  }
  else
  {
    double v6 = 1.0;
  }

  return v6;
}

- (void)setApplicationSceneStatusBarDelegate:(id)a3
{
}

- (BOOL)_isApplicationStatusBarHidden
{
  return self->__applicationStatusBarHidden;
}

- (SBStatusBarSettings)_overrideStatusBarSettings
{
  return self->_overrideStatusBarSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideStatusBarSettings, 0);
  objc_destroyWeak((id *)&self->_applicationSceneStatusBarDelegate);
}

- (void)_setOverrideStatusBarSettings:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v5 = [a1 sceneHandle];
  double v6 = [v5 sceneIdentifier];
  int v8 = 138412802;
  objc_super v9 = v6;
  __int16 v10 = 2112;
  id v11 = (id)objc_opt_class();
  __int16 v12 = 2114;
  uint64_t v13 = a2;
  id v7 = v11;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "(%@) %@ Override status bar settings did not change: %{public}@", (uint8_t *)&v8, 0x20u);
}

@end
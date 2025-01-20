@interface SBDeviceApplicationSceneStatusBarStateProvider
- (BOOL)_anyObserverWants:(SEL)a3;
- (BOOL)_statusBarAppearsOutsideOfAJailedApp;
- (BOOL)_statusBarAppearsOutsideOfAJailedAppCanChange;
- (BOOL)_statusBarAppearsOutsideOfAJailedAppInOrientation:(int64_t)a3;
- (BOOL)_statusBarHiddenGivenFallbackOrientation:(int64_t)a3;
- (BOOL)_suppressInheritedPartStyles;
- (BOOL)sceneWantsDeviceOrientationEventsEnabled;
- (CGRect)statusBarAvoidanceFrame;
- (double)_statusBarAlpha;
- (id)_initWithSceneHandle:(id)a3;
- (id)_statusBarPartStyles;
- (id)backgroundActivitiesToSuppress;
- (id)breadcrumbProvider;
- (id)classicApplicationSceneHandleIfExists;
- (id)overlayStatusBarData;
- (id)sceneToHandleStatusBarTapIfExists;
- (id)statusBarSceneIdentifier;
- (int64_t)_defaultStatusBarStyle;
- (int64_t)_fallbackInterfaceOrientation;
- (int64_t)_statusBarOrientationGivenFallbackOrientation:(int64_t)a3;
- (int64_t)_statusBarStyle;
- (int64_t)_statusBarStyleForPartWithIdentifier:(id)a3 suppressingInherited:(BOOL)a4;
- (uint64_t)_statusBarCanAppearOutsideApp;
- (void)_handleStatusBarBackgroundActivitiesToSuppressUpdate;
- (void)_performUpdateWith:(id)a3 actions:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateStatusBarSettings;
- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5;
- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5;
@end

@implementation SBDeviceApplicationSceneStatusBarStateProvider

- (id)backgroundActivitiesToSuppress
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  v3 = [WeakRetained sceneIfExists];
  if (v3)
  {
    v4 = [WeakRetained backgroundActivitiesToSuppress];
    v5 = [v3 uiClientSettings];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = (void *)[v4 mutableCopy];
      v7 = [v5 preferredBackgroundActivitiesToSuppress];
      [v6 unionSet:v7];

      v4 = v6;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_statusBarAppearsOutsideOfAJailedApp
{
  int64_t v3 = [(SBDeviceApplicationSceneStatusBarStateProvider *)self _statusBarOrientationGivenFallbackOrientation:[(SBDeviceApplicationSceneStatusBarStateProvider *)self _fallbackInterfaceOrientation]];
  return [(SBDeviceApplicationSceneStatusBarStateProvider *)self _statusBarAppearsOutsideOfAJailedAppInOrientation:v3];
}

- (int64_t)_fallbackInterfaceOrientation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  int64_t v3 = [WeakRetained defaultInterfaceOrientation];

  return v3;
}

- (int64_t)_statusBarOrientationGivenFallbackOrientation:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  v5 = [WeakRetained sceneIfExists];

  if (v5)
  {
    v6 = [v5 uiSettings];
    if ([v6 deviceOrientationEventsEnabled])
    {
      v7 = [v5 uiClientSettings];
      a3 = [v7 interfaceOrientation];
    }
    else
    {
      a3 = [v6 interfaceOrientation];
    }
  }
  return a3;
}

- (int64_t)_statusBarStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  v4 = [WeakRetained sceneIfExists];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 uiClientSettings];
    int64_t v7 = [v6 statusBarModernStyle];
  }
  else
  {
    int64_t v7 = [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self defaultStatusBarStyle];
  }

  return v7;
}

- (BOOL)_statusBarAppearsOutsideOfAJailedAppInOrientation:(int64_t)a3
{
  if (-[SBDeviceApplicationSceneStatusBarStateProvider _statusBarCanAppearOutsideApp]((uint64_t)self))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
    v6 = [WeakRetained application];
    int v7 = [v6 includesStatusBarInClassicJailForInterfaceOrientation:a3] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (uint64_t)_statusBarCanAppearOutsideApp
{
  if (!a1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained application];
  if ([v2 isClassic])
  {
    int64_t v3 = [WeakRetained _windowScene];
    v4 = [v3 switcherController];
    uint64_t v5 = [v4 isChamoisWindowingUIEnabled] ^ 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (int64_t)_defaultStatusBarStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  uint64_t v3 = [WeakRetained _defaultStatusBarStyleFromSceneDataStore];
  if (v3 == -1)
  {
    v4 = [WeakRetained application];
    uint64_t v5 = [v4 info];
    uint64_t v3 = [v5 defaultStatusBarStyle];
  }
  int64_t v6 = _SBStatusBarStyleFromLegacyStyle(v3);

  return v6;
}

- (id)_statusBarPartStyles
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  uint64_t v3 = [WeakRetained sceneIfExists];

  if (v3)
  {
    v4 = [v3 uiClientSettings];
    uint64_t v5 = [v4 statusBarPartStyles];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v5;
}

- (BOOL)_statusBarHiddenGivenFallbackOrientation:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  uint64_t v5 = [WeakRetained sceneIfExists];
  int64_t v6 = v5;
  if (v5)
  {
    int v7 = [v5 uiClientSettings];
    char v8 = [v7 statusBarHidden];
  }
  else
  {
    char v8 = [WeakRetained defaultStatusBarHiddenForOrientation:a3];
  }

  return v8;
}

- (double)_statusBarAlpha
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  uint64_t v3 = [WeakRetained sceneIfExists];

  if (v3)
  {
    v4 = [v3 uiClientSettings];
    [v4 statusBarAlpha];
    double v6 = v5;
  }
  else
  {
    double v6 = 1.0;
  }

  return v6;
}

- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    appSceneSettingsDiffInspector = self->_appSceneSettingsDiffInspector;
    if (!appSceneSettingsDiffInspector)
    {
      v12 = (UIApplicationSceneSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F42780]);
      v13 = self->_appSceneSettingsDiffInspector;
      self->_appSceneSettingsDiffInspector = v12;

      objc_initWeak(&location, self);
      v14 = self->_appSceneSettingsDiffInspector;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __105__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke;
      v18[3] = &unk_1E6AF85E0;
      objc_copyWeak(&v19, &location);
      [(UIApplicationSceneSettingsDiffInspector *)v14 observeInterfaceOrientationWithBlock:v18];
      v15 = self->_appSceneSettingsDiffInspector;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __105__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_2;
      v16[3] = &unk_1E6AF85E0;
      objc_copyWeak(&v17, &location);
      [(UIApplicationSceneSettingsDiffInspector *)v15 observeStatusBarAvoidanceFrameWithBlock:v16];
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      appSceneSettingsDiffInspector = self->_appSceneSettingsDiffInspector;
    }
    [v9 evaluateWithInspector:appSceneSettingsDiffInspector context:0];
  }
}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_3_18(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [v3 statusBarSceneIdentifier];
  int v5 = [v3 statusBarHidden];
  double v6 = SBLogAppStatusBars();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v13 = v4;
    __int16 v14 = 2112;
    id v15 = (id)objc_opt_class();
    __int16 v16 = 1024;
    int v17 = v5;
    id v7 = v15;
    _os_log_debug_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEBUG, "(%@) %@ statusBarHidden scene client setting changed to %{BOOL}u", buf, 0x1Cu);
  }
  if ([v3 _anyObserverWants:sel_sceneWithIdentifier_didChangeStatusBarHiddenTo_withAnimation_])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_21;
    v8[3] = &unk_1E6AF8658;
    uint64_t v10 = a2;
    v8[4] = v3;
    id v9 = v4;
    char v11 = v5;
    [v3 _performUpdateWith:a2 actions:v8];
  }
}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [v3 statusBarSceneIdentifier];
  int v5 = [v3 statusBarPartStyles];
  double v6 = SBLogAppStatusBars();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v12 = v4;
    __int16 v13 = 2112;
    id v14 = (id)objc_opt_class();
    __int16 v15 = 2112;
    __int16 v16 = v5;
    id v7 = v14;
    _os_log_debug_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEBUG, "(%@) %@ statusBarPartStyles scene client setting changed to %@", buf, 0x20u);
  }
  if ([v3 _anyObserverWants:sel_sceneWithIdentifier_didChangeStatusBarStyleTo_forPartWithIdentifier_])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_11;
    v8[3] = &unk_1E6AF4E00;
    v8[4] = v3;
    id v9 = v3;
    id v10 = v4;
    [v9 _performUpdateWith:a2 actions:v8];
  }
}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [v3 statusBarSceneIdentifier];
  uint64_t v5 = [v3 statusBarStyle];
  double v6 = SBLogAppStatusBars();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    id v9 = _SBStringFromStatusBarStyle(v5);
    *(_DWORD *)buf = 138412802;
    id v14 = v4;
    __int16 v15 = 2112;
    __int16 v16 = v7;
    __int16 v17 = 2112;
    uint64_t v18 = v9;
    _os_log_debug_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEBUG, "(%@) %@ statusBarModernStyle scene client setting changed to %@", buf, 0x20u);
  }
  if ([v3 _anyObserverWants:sel_sceneWithIdentifier_didChangeStatusBarStyleTo_])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_6;
    v10[3] = &unk_1E6AF6FC0;
    v10[4] = v3;
    id v11 = v4;
    uint64_t v12 = v5;
    [v3 _performUpdateWith:a2 actions:v10];
  }
}

- (id)statusBarSceneIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  id v3 = [WeakRetained sceneIdentifier];

  return v3;
}

- (BOOL)_anyObserverWants:(SEL)a3
{
  return 1;
}

- (void)_performUpdateWith:(id)a3 actions:(id)a4
{
  id v10 = a3;
  uint64_t v5 = (void (**)(void))a4;
  double v6 = [v10 animationSettings];
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    id v8 = [MEMORY[0x1E4F4F898] factoryWithSettings:v6 timingFunction:v7];
    [v8 setAllowsAdditiveAnimations:1];
    [MEMORY[0x1E4F4F898] animateWithFactory:v8 actions:v5];
  }
  else if (v5)
  {
    v5[2](v5);
  }
  id v9 = [v10 animationFence];
  if (v9) {
    [MEMORY[0x1E4F42D58] _synchronizeDrawingWithFence:v9];
  }
}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_11(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2_12;
  v3[3] = &unk_1E6AF8608;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 enumerateObserversWithBlock:v3];
}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_6(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2;
  v5[3] = &unk_1E6AF85B8;
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateObserversWithBlock:v5];
}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_21(uint64_t a1)
{
  id v2 = *(id *)(a1 + 48);
  if ([v2 isUISubclass]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  id v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 statusBarAnimation];
  }
  else {
    uint64_t v6 = 1;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2_22;
  v9[3] = &unk_1E6AF8630;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  char v12 = *(unsigned char *)(a1 + 56);
  id v10 = v8;
  uint64_t v11 = v6;
  [v7 enumerateObserversWithBlock:v9];
}

uint64_t __76__SBDeviceApplicationSceneStatusBarStateProvider_Base_addStatusBarObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 observer];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2(uint64_t result, void *a2, char a3)
{
  if (a3) {
    return [a2 sceneWithIdentifier:*(void *)(result + 32) didChangeStatusBarStyleTo:*(void *)(result + 40)];
  }
  return result;
}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2_12(uint64_t a1, void *a2, char a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ((a3 & 2) != 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "statusBarPartStyles", 0);
    uint64_t v7 = [v6 allKeys];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(v5, "sceneWithIdentifier:didChangeStatusBarStyleTo:forPartWithIdentifier:", *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "statusBarStyleForPartWithIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * v11)), *(void *)(*((void *)&v12 + 1) + 8 * v11));
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (int64_t)_statusBarStyleForPartWithIdentifier:(id)a3 suppressingInherited:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self statusBarPartStyles];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    if (!v4)
    {
      int64_t v9 = 4;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  int64_t v9 = [v8 integerValue];
  if (v9 == 4 && v4) {
LABEL_6:
  }
    int64_t v9 = [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self statusBarStyle];
LABEL_8:

  return v9;
}

uint64_t __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2_22(uint64_t result, void *a2, char a3)
{
  if ((a3 & 8) != 0) {
    return [a2 sceneWithIdentifier:*(void *)(result + 32) didChangeStatusBarHiddenTo:*(unsigned __int8 *)(result + 48) withAnimation:*(void *)(result + 40)];
  }
  return result;
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    appClientSettingsDiffInspector = self->_appClientSettingsDiffInspector;
    if (!appClientSettingsDiffInspector)
    {
      long long v12 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F42768]);
      long long v13 = self->_appClientSettingsDiffInspector;
      self->_appClientSettingsDiffInspector = v12;

      objc_initWeak(location, self);
      long long v14 = self->_appClientSettingsDiffInspector;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke;
      v37[3] = &unk_1E6AF85E0;
      objc_copyWeak(&v38, location);
      [(UIApplicationSceneClientSettingsDiffInspector *)v14 observeStatusBarModernStyleWithBlock:v37];
      long long v15 = self->_appClientSettingsDiffInspector;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_3;
      v35[3] = &unk_1E6AF85E0;
      v26 = &v36;
      objc_copyWeak(&v36, location);
      [(UIApplicationSceneClientSettingsDiffInspector *)v15 observeStatusBarPartStylesWithBlock:v35];
      __int16 v16 = self->_appClientSettingsDiffInspector;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_3_13;
      v33[3] = &unk_1E6AF85E0;
      objc_copyWeak(&v34, location);
      [(UIApplicationSceneClientSettingsDiffInspector *)v16 observeStatusBarAlphaWithBlock:v33];
      uint64_t v17 = self->_appClientSettingsDiffInspector;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_3_18;
      v31[3] = &unk_1E6AF85E0;
      objc_copyWeak(&v32, location);
      [(UIApplicationSceneClientSettingsDiffInspector *)v17 observeStatusBarHiddenWithBlock:v31];
      uint64_t v18 = self->_appClientSettingsDiffInspector;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_3_23;
      v29[3] = &unk_1E6AF85E0;
      objc_copyWeak(&v30, location);
      [(UIApplicationSceneClientSettingsDiffInspector *)v18 observeInterfaceOrientationWithBlock:v29];
      objc_destroyWeak(&v30);
      objc_destroyWeak(&v32);
      objc_destroyWeak(&v34);
      objc_destroyWeak(&v36);
      objc_destroyWeak(&v38);
      objc_destroyWeak(location);
      appClientSettingsDiffInspector = self->_appClientSettingsDiffInspector;
    }
    objc_msgSend(v9, "evaluateWithInspector:context:", appClientSettingsDiffInspector, v10, v26);
    if (!self->_hasAttemptedInCallSceneClientSettingsDiffInspectorCreation)
    {
      self->_hasAttemptedInCallSceneClientSettingsDiffInspectorCreation = 1;
      uint64_t v19 = [v8 sceneIfExists];
      v20 = [v19 clientSettings];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v22 = (SBSUIInCallSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4FA7B98]);
        inCallSceneClientSettingsDiffInspector = self->_inCallSceneClientSettingsDiffInspector;
        self->_inCallSceneClientSettingsDiffInspector = v22;

        objc_initWeak(location, self);
        v24 = self->_inCallSceneClientSettingsDiffInspector;
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_3_29;
        v27[3] = &unk_1E6AF85E0;
        objc_copyWeak(&v28, location);
        [(SBSUIInCallSceneClientSettingsDiffInspector *)v24 observePreferredStatusBarStyleOverridesToSuppressWithBlock:v27];
        objc_destroyWeak(&v28);
        objc_destroyWeak(location);
      }
    }
    v25 = self->_inCallSceneClientSettingsDiffInspector;
    if (v25) {
      [v9 evaluateWithInspector:v25 context:v10];
    }
  }
}

- (id)_initWithSceneHandle:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDeviceApplicationSceneStatusBarStateProvider;
  id v5 = [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sceneHandle, v4);
    [v4 addObserver:v6];
  }

  return v6;
}

- (void)dealloc
{
  [(SBDeviceApplicationSceneStatusBarStateProvider *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneStatusBarStateProvider;
  [(SBDeviceApplicationSceneStatusBarStateProvider *)&v3 dealloc];
}

- (void)invalidateStatusBarSettings
{
  objc_super v3 = [(SBDeviceApplicationSceneStatusBarStateProvider *)self statusBarSceneIdentifier];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__SBDeviceApplicationSceneStatusBarStateProvider_invalidateStatusBarSettings__block_invoke;
  v5[3] = &unk_1E6AF8590;
  id v6 = v3;
  id v4 = v3;
  [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self enumerateObserversWithBlock:v5];
}

uint64_t __77__SBDeviceApplicationSceneStatusBarStateProvider_invalidateStatusBarSettings__block_invoke(uint64_t result, void *a2, char a3)
{
  if ((a3 & 0x20) != 0) {
    return [a2 didInvalidateStatusBarDescriptionForSceneWithIdentifier:*(void *)(result + 32)];
  }
  return result;
}

- (void)invalidate
{
  [(UIApplicationSceneClientSettingsDiffInspector *)self->_appClientSettingsDiffInspector removeAllObservers];
  [(UIApplicationSceneSettingsDiffInspector *)self->_appSceneSettingsDiffInspector removeAllObservers];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  [WeakRetained removeObserver:self];
}

- (CGRect)statusBarAvoidanceFrame
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  objc_super v3 = [WeakRetained sceneIfExists];

  if (v3)
  {
    id v4 = [v3 uiSettings];
    [v4 statusBarAvoidanceFrame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)sceneWantsDeviceOrientationEventsEnabled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  char v3 = [WeakRetained wantsDeviceOrientationEventsEnabled];

  return v3;
}

- (id)overlayStatusBarData
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  char v3 = [WeakRetained overlayStatusBarData];

  return v3;
}

- (id)breadcrumbProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  char v3 = [WeakRetained breadcrumbProvider];

  return v3;
}

- (id)classicApplicationSceneHandleIfExists
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  char v3 = [WeakRetained application];
  if ([v3 isClassic]) {
    id v4 = WeakRetained;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)sceneToHandleStatusBarTapIfExists
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  char v3 = [WeakRetained sceneIfExists];

  return v3;
}

- (BOOL)_suppressInheritedPartStyles
{
  return 0;
}

- (BOOL)_statusBarAppearsOutsideOfAJailedAppCanChange
{
  int CanAppearOutside = -[SBDeviceApplicationSceneStatusBarStateProvider _statusBarCanAppearOutsideApp]((uint64_t)self);
  if (CanAppearOutside)
  {
    BOOL v4 = [(SBDeviceApplicationSceneStatusBarStateProvider *)self _statusBarAppearsOutsideOfAJailedAppInOrientation:1];
    LOBYTE(CanAppearOutside) = v4 ^ [(SBDeviceApplicationSceneStatusBarStateProvider *)self _statusBarAppearsOutsideOfAJailedAppInOrientation:4];
  }
  return CanAppearOutside;
}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_3_13(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = [v3 statusBarSceneIdentifier];
  [v3 statusBarAlpha];
  uint64_t v6 = v5;
  double v7 = SBLogAppStatusBars();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    double v13 = v4;
    __int16 v14 = 2112;
    id v15 = (id)objc_opt_class();
    __int16 v16 = 2048;
    uint64_t v17 = v6;
    id v8 = v15;
    _os_log_debug_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEBUG, "(%@) %@ statusBarAlpha scene client setting changed to %f", buf, 0x20u);
  }
  if ([v3 _anyObserverWants:sel_sceneWithIdentifier_didChangeStatusBarAlphaTo_])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_16;
    v9[3] = &unk_1E6AF6FC0;
    void v9[4] = v3;
    id v10 = v4;
    uint64_t v11 = v6;
    [v3 _performUpdateWith:a2 actions:v9];
  }
}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_16(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2_17;
  v3[3] = &unk_1E6AF85B8;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  [v2 enumerateObserversWithBlock:v3];
}

uint64_t __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2_17(uint64_t result, void *a2, char a3)
{
  if ((a3 & 4) != 0) {
    return [a2 sceneWithIdentifier:*(void *)(result + 32) didChangeStatusBarAlphaTo:*(double *)(result + 40)];
  }
  return result;
}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_3_23(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = v3;
  if (v3 && [v3 sceneWantsDeviceOrientationEventsEnabled])
  {
    uint64_t v5 = [v4 statusBarSceneIdentifier];
    uint64_t v6 = [v4 statusBarOrientation];
    double v7 = SBLogAppStatusBars();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = objc_opt_class();
      id v9 = v8;
      id v10 = BSInterfaceOrientationDescription();
      *(_DWORD *)buf = 138412802;
      id v15 = v5;
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_debug_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEBUG, "(%@) %@ interfaceOrientation scene client setting changed to %@", buf, 0x20u);
    }
    if ([v4 _anyObserverWants:sel_sceneWithIdentifier_didChangeStatusBarOrientationTo_])
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_26;
      v11[3] = &unk_1E6AF6FC0;
      v11[4] = v4;
      id v12 = v5;
      uint64_t v13 = v6;
      [v4 _performUpdateWith:a2 actions:v11];
    }
  }
}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_26(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2_27;
  v5[3] = &unk_1E6AF85B8;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateObserversWithBlock:v5];
}

uint64_t __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2_27(uint64_t result, void *a2, char a3)
{
  if ((a3 & 0x10) != 0) {
    return [a2 sceneWithIdentifier:*(void *)(result + 32) didChangeStatusBarOrientationTo:*(void *)(result + 40)];
  }
  return result;
}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_3_29(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleStatusBarBackgroundActivitiesToSuppressUpdate];
}

void __105__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v1 = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [v1 statusBarSceneIdentifier];
  uint64_t v3 = [v1 statusBarOrientation];
  int v4 = [v1 sceneWantsDeviceOrientationEventsEnabled];
  uint64_t v5 = SBLogAppStatusBars();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v8 = objc_opt_class();
    id v9 = v8;
    id v10 = BSInterfaceOrientationDescription();
    *(_DWORD *)buf = 138413058;
    v21 = v2;
    __int16 v22 = 2112;
    v23 = v8;
    __int16 v24 = 2112;
    v25 = v10;
    __int16 v26 = 1024;
    int v27 = v4;
    _os_log_debug_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEBUG, "(%@) %@ interfaceOrientation scene setting changed to %@ (wantsDeviceOrientationEventsEnabled: %{BOOL}u)", buf, 0x26u);
  }
  if ([v1 _anyObserverWants:sel_sceneWithIdentifier_didChangeSceneInterfaceOrientationTo_])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __105__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_33;
    v17[3] = &unk_1E6AF85B8;
    id v18 = v2;
    uint64_t v19 = v3;
    [v1 enumerateObserversWithBlock:v17];
  }
  if ([v1 _statusBarAppearsOutsideOfAJailedAppCanChange])
  {
    uint64_t v6 = [v1 statusBarStyle];
    uint64_t v7 = SBLogAppStatusBars();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = objc_opt_class();
      id v12 = v11;
      uint64_t v13 = _SBStringFromStatusBarStyle(v6);
      *(_DWORD *)buf = 138412802;
      v21 = v2;
      __int16 v22 = 2112;
      v23 = v11;
      __int16 v24 = 2112;
      v25 = v13;
      _os_log_debug_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEBUG, "(%@) %@ statusBarModernStyle changed via rotation of a classic app to %@", buf, 0x20u);
    }
    if ([v1 _anyObserverWants:sel_sceneWithIdentifier_didChangeStatusBarStyleTo_])
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __105__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_34;
      v14[3] = &unk_1E6AF85B8;
      id v15 = v2;
      uint64_t v16 = v6;
      [v1 enumerateObserversWithBlock:v14];
    }
  }
}

uint64_t __105__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_33(uint64_t result, void *a2, __int16 a3)
{
  if ((a3 & 0x100) != 0) {
    return [a2 sceneWithIdentifier:*(void *)(result + 32) didChangeSceneInterfaceOrientationTo:*(void *)(result + 40)];
  }
  return result;
}

uint64_t __105__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_34(uint64_t result, void *a2, char a3)
{
  if (a3) {
    return [a2 sceneWithIdentifier:*(void *)(result + 32) didChangeStatusBarStyleTo:*(void *)(result + 40)];
  }
  return result;
}

void __105__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v1 = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [v1 statusBarSceneIdentifier];
  [v1 statusBarAvoidanceFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  uint64_t v11 = SBLogAppStatusBars();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = objc_opt_class();
    id v13 = v12;
    v28.origin.x = v4;
    v28.origin.y = v6;
    v28.size.width = v8;
    v28.size.height = v10;
    __int16 v14 = NSStringFromCGRect(v28);
    *(_DWORD *)buf = 138412802;
    __int16 v22 = v2;
    __int16 v23 = 2112;
    __int16 v24 = v12;
    __int16 v25 = 2112;
    __int16 v26 = v14;
    _os_log_debug_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEBUG, "(%@) %@ statusBarAvoidanceFrame scene setting changed to %@", buf, 0x20u);
  }
  if ([v1 _anyObserverWants:sel_sceneWithIdentifier_didChangeStatusBarAvoidanceFrameTo_])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __105__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_37;
    v15[3] = &unk_1E6AF8680;
    id v16 = v2;
    CGFloat v17 = v4;
    CGFloat v18 = v6;
    CGFloat v19 = v8;
    CGFloat v20 = v10;
    [v1 enumerateObserversWithBlock:v15];
  }
}

uint64_t __105__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_37(uint64_t result, void *a2, char a3)
{
  if (a3 < 0) {
    return objc_msgSend(a2, "sceneWithIdentifier:didChangeStatusBarAvoidanceFrameTo:", *(void *)(result + 32), *(double *)(result + 40), *(double *)(result + 48), *(double *)(result + 56), *(double *)(result + 64));
  }
  return result;
}

- (void)_handleStatusBarBackgroundActivitiesToSuppressUpdate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  double v3 = [(SBDeviceApplicationSceneStatusBarStateProvider *)v2 statusBarSceneIdentifier];
  CGFloat v4 = [(SBDeviceApplicationSceneStatusBarStateProvider *)v2 backgroundActivitiesToSuppress];
  double v5 = SBLogAppStatusBars();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    CGFloat v6 = objc_opt_class();
    id v7 = v6;
    CGFloat v8 = STBackgroundActivityIdentifiersDescription();
    *(_DWORD *)buf = 138412802;
    id v13 = v3;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    CGFloat v17 = v8;
    _os_log_debug_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEBUG, "(%@) %@ backgroundActivitiesToSuppress scene setting changed to %@ ", buf, 0x20u);
  }
  if ([(SBDeviceApplicationSceneStatusBarStateProvider *)v2 _anyObserverWants:sel_sceneWithIdentifier_didChangeBackgroundActivitiesToSuppressTo_])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __102__SBDeviceApplicationSceneStatusBarStateProvider__handleStatusBarBackgroundActivitiesToSuppressUpdate__block_invoke;
    v9[3] = &unk_1E6AF86A8;
    id v10 = v3;
    id v11 = v4;
    [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)v2 enumerateObserversWithBlock:v9];
  }
}

uint64_t __102__SBDeviceApplicationSceneStatusBarStateProvider__handleStatusBarBackgroundActivitiesToSuppressUpdate__block_invoke(uint64_t result, void *a2, char a3)
{
  if ((a3 & 0x40) != 0) {
    return [a2 sceneWithIdentifier:*(void *)(result + 32) didChangeBackgroundActivitiesToSuppressTo:*(void *)(result + 40)];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneHandle);
  objc_storeStrong((id *)&self->_inCallSceneClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_appSceneSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_appClientSettingsDiffInspector, 0);
}

uint64_t __79__SBDeviceApplicationSceneStatusBarStateProvider_Base_removeStatusBarObserver___block_invoke(uint64_t a1, void *a2)
{
  double v3 = [a2 observer];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __68__SBDeviceApplicationSceneStatusBarStateProvider_Base__allObservers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 observer];
}

void __93__SBDeviceApplicationSceneStatusBarStateProvider_Base_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
}

@end
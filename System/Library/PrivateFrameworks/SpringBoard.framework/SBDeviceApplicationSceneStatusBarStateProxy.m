@interface SBDeviceApplicationSceneStatusBarStateProxy
- (BOOL)_anyObserverWants:(SEL)a3;
- (BOOL)_statusBarAppearsOutsideOfAJailedApp;
- (BOOL)_statusBarHiddenGivenFallbackOrientation:(int64_t)a3;
- (BOOL)_suppressInheritedPartStyles;
- (BOOL)sceneWantsDeviceOrientationEventsEnabled;
- (CGRect)statusBarAvoidanceFrame;
- (SBDeviceApplicationSceneStatusBarStateProxy)initWithDeviceApplicationSceneHandle:(id)a3;
- (double)_statusBarAlpha;
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
- (void)didInvalidateStatusBarDescriptionForSceneWithIdentifier:(id)a3;
- (void)invalidateStatusBarSettings;
- (void)sceneWithIdentifier:(id)a3 didChangeBackgroundActivitiesToSuppressTo:(id)a4;
- (void)sceneWithIdentifier:(id)a3 didChangeSceneInterfaceOrientationTo:(int64_t)a4;
- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarAlphaTo:(double)a4;
- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarAvoidanceFrameTo:(CGRect)a4;
- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarHiddenTo:(BOOL)a4 withAnimation:(int64_t)a5;
- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarOrientationTo:(int64_t)a4;
- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4;
- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4 forPartWithIdentifier:(id)a5;
@end

@implementation SBDeviceApplicationSceneStatusBarStateProxy

- (SBDeviceApplicationSceneStatusBarStateProxy)initWithDeviceApplicationSceneHandle:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDeviceApplicationSceneStatusBarStateProxy;
  v5 = [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_deviceApplicationSceneHandle, v4);
    v7 = [v4 statusBarStateProvider];
    objc_storeWeak((id *)&v6->_stateProvider, v7);
    [v7 addStatusBarObserver:v6];
  }
  return v6;
}

- (void)invalidateStatusBarSettings
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  [WeakRetained invalidateStatusBarSettings];
}

- (int64_t)_statusBarStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  int64_t v3 = [WeakRetained _statusBarStyle];

  return v3;
}

- (id)_statusBarPartStyles
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  int64_t v3 = [WeakRetained _statusBarPartStyles];

  return v3;
}

- (int64_t)_statusBarStyleForPartWithIdentifier:(id)a3 suppressingInherited:(BOOL)a4
{
  p_stateProvider = &self->_stateProvider;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_stateProvider);
  int64_t v8 = objc_msgSend(WeakRetained, "_statusBarStyleForPartWithIdentifier:suppressingInherited:", v6, -[SBDeviceApplicationSceneStatusBarStateProxy _suppressInheritedPartStyles](self, "_suppressInheritedPartStyles"));

  return v8;
}

- (double)_statusBarAlpha
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  [WeakRetained _statusBarAlpha];
  double v4 = v3;

  return v4;
}

- (BOOL)_statusBarHiddenGivenFallbackOrientation:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  LOBYTE(a3) = [WeakRetained _statusBarHiddenGivenFallbackOrientation:a3];

  return a3;
}

- (int64_t)_statusBarOrientationGivenFallbackOrientation:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  int64_t v5 = [WeakRetained _statusBarOrientationGivenFallbackOrientation:a3];

  return v5;
}

- (id)backgroundActivitiesToSuppress
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  double v3 = [WeakRetained backgroundActivitiesToSuppress];

  return v3;
}

- (CGRect)statusBarAvoidanceFrame
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  [WeakRetained statusBarAvoidanceFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)sceneWantsDeviceOrientationEventsEnabled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  char v3 = [WeakRetained sceneWantsDeviceOrientationEventsEnabled];

  return v3;
}

- (id)overlayStatusBarData
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  char v3 = [WeakRetained overlayStatusBarData];

  return v3;
}

- (id)breadcrumbProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  char v3 = [WeakRetained breadcrumbProvider];

  return v3;
}

- (id)statusBarSceneIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  char v3 = [WeakRetained statusBarSceneIdentifier];

  return v3;
}

- (id)classicApplicationSceneHandleIfExists
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  char v3 = [WeakRetained classicApplicationSceneHandleIfExists];

  return v3;
}

- (id)sceneToHandleStatusBarTapIfExists
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  char v3 = [WeakRetained sceneToHandleStatusBarTapIfExists];

  return v3;
}

- (int64_t)_fallbackInterfaceOrientation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceApplicationSceneHandle);
  int64_t v3 = [WeakRetained defaultInterfaceOrientation];

  return v3;
}

- (BOOL)_suppressInheritedPartStyles
{
  return 0;
}

- (BOOL)_statusBarAppearsOutsideOfAJailedApp
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  char v3 = [WeakRetained _statusBarAppearsOutsideOfAJailedApp];

  return v3;
}

- (int64_t)_defaultStatusBarStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  int64_t v3 = [WeakRetained _defaultStatusBarStyle];

  return v3;
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self statusBarStyle];
  if (v7 != a4)
  {
    double v8 = SBLogAppStatusBars();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      double v9 = objc_opt_class();
      id v10 = v9;
      double v11 = _SBStringFromStatusBarStyle(v7);
      double v12 = _SBStringFromStatusBarStyle(a4);
      *(_DWORD *)buf = 138413058;
      id v17 = v6;
      __int16 v18 = 2112;
      v19 = v9;
      __int16 v20 = 2112;
      v21 = v11;
      __int16 v22 = 2112;
      v23 = v12;
      _os_log_debug_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEBUG, "(%@) %@ Using our overridden style %@ (was provided %@)", buf, 0x2Au);
    }
  }
  if ([(SBDeviceApplicationSceneStatusBarStateProxy *)self _anyObserverWants:sel_sceneWithIdentifier_didChangeStatusBarStyleTo_])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __93__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarStyleTo___block_invoke;
    v13[3] = &unk_1E6AF85B8;
    id v14 = v6;
    uint64_t v15 = v7;
    [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self enumerateObserversWithBlock:v13];
  }
}

uint64_t __93__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarStyleTo___block_invoke(uint64_t result, void *a2, char a3)
{
  if (a3) {
    return [a2 sceneWithIdentifier:*(void *)(result + 32) didChangeStatusBarStyleTo:*(void *)(result + 40)];
  }
  return result;
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4 forPartWithIdentifier:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self statusBarStyleForPartWithIdentifier:v9];
  if (v10 != a4)
  {
    double v11 = SBLogAppStatusBars();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      double v12 = objc_opt_class();
      id v13 = v12;
      id v14 = _SBStringFromStatusBarStyle(v10);
      uint64_t v15 = _SBStringFromStatusBarStyle(a4);
      *(_DWORD *)buf = 138413314;
      id v21 = v8;
      __int16 v22 = 2112;
      v23 = v12;
      __int16 v24 = 2112;
      v25 = v14;
      __int16 v26 = 2112;
      id v27 = v9;
      __int16 v28 = 2112;
      v29 = v15;
      _os_log_debug_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEBUG, "(%@) %@ Using our overridden style %@ for %@ (was provided %@)", buf, 0x34u);
    }
  }
  if ([(SBDeviceApplicationSceneStatusBarStateProxy *)self _anyObserverWants:sel_sceneWithIdentifier_didChangeStatusBarStyleTo_forPartWithIdentifier_])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __115__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarStyleTo_forPartWithIdentifier___block_invoke;
    v16[3] = &unk_1E6B07128;
    id v17 = v8;
    uint64_t v19 = v10;
    id v18 = v9;
    [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self enumerateObserversWithBlock:v16];
  }
}

void *__115__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarStyleTo_forPartWithIdentifier___block_invoke(void *result, void *a2, char a3)
{
  if ((a3 & 2) != 0) {
    return (void *)[a2 sceneWithIdentifier:result[4] didChangeStatusBarStyleTo:result[6] forPartWithIdentifier:result[5]];
  }
  return result;
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarAlphaTo:(double)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self statusBarAlpha];
  double v8 = v7;
  if (v7 != a4)
  {
    id v9 = SBLogAppStatusBars();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = (id)objc_opt_class();
      __int16 v18 = 2048;
      double v19 = v8;
      __int16 v20 = 2048;
      double v21 = a4;
      id v10 = v17;
      _os_log_debug_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEBUG, "(%@) %@ Using our overridden alpha %1.1f (was provided %1.1f)", buf, 0x2Au);
    }
  }
  if ([(SBDeviceApplicationSceneStatusBarStateProxy *)self _anyObserverWants:sel_sceneWithIdentifier_didChangeStatusBarAlphaTo_])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __93__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarAlphaTo___block_invoke;
    v11[3] = &unk_1E6AF85B8;
    id v12 = v6;
    double v13 = v8;
    [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self enumerateObserversWithBlock:v11];
  }
}

uint64_t __93__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarAlphaTo___block_invoke(uint64_t result, void *a2, char a3)
{
  if ((a3 & 4) != 0) {
    return [a2 sceneWithIdentifier:*(void *)(result + 32) didChangeStatusBarAlphaTo:*(double *)(result + 40)];
  }
  return result;
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarHiddenTo:(BOOL)a4 withAnimation:(int64_t)a5
{
  int v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self statusBarHidden];
  if (v9 != v6)
  {
    id v10 = SBLogAppStatusBars();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = (id)objc_opt_class();
      __int16 v20 = 1024;
      int v21 = v9;
      __int16 v22 = 1024;
      int v23 = v6;
      id v11 = v19;
      _os_log_debug_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEBUG, "(%@) %@ Using our overridden hidden %{BOOL}u (was provided %{BOOL}u)", buf, 0x22u);
    }
  }
  if ([(SBDeviceApplicationSceneStatusBarStateProxy *)self _anyObserverWants:sel_sceneWithIdentifier_didChangeStatusBarHiddenTo_withAnimation_])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __108__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarHiddenTo_withAnimation___block_invoke;
    v12[3] = &unk_1E6AF8630;
    char v15 = v9;
    id v13 = v8;
    int64_t v14 = a5;
    [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self enumerateObserversWithBlock:v12];
  }
}

uint64_t __108__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarHiddenTo_withAnimation___block_invoke(uint64_t result, void *a2, char a3)
{
  if ((a3 & 8) != 0) {
    return [a2 sceneWithIdentifier:*(void *)(result + 32) didChangeStatusBarHiddenTo:*(unsigned __int8 *)(result + 48) withAnimation:*(void *)(result + 40)];
  }
  return result;
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarOrientationTo:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self statusBarOrientation];
  if (v7 != a4)
  {
    id v8 = SBLogAppStatusBars();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = objc_opt_class();
      id v10 = v9;
      id v11 = BSInterfaceOrientationDescription();
      id v12 = BSInterfaceOrientationDescription();
      *(_DWORD *)buf = 138413058;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      int v21 = v11;
      __int16 v22 = 2112;
      int v23 = v12;
      _os_log_debug_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEBUG, "(%@) %@ Using our overridden orientation %@ (was provided %@)", buf, 0x2Au);
    }
  }
  if ([(SBDeviceApplicationSceneStatusBarStateProxy *)self _anyObserverWants:sel_sceneWithIdentifier_didChangeStatusBarOrientationTo_])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __99__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarOrientationTo___block_invoke;
    v13[3] = &unk_1E6AF85B8;
    id v14 = v6;
    int64_t v15 = v7;
    [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self enumerateObserversWithBlock:v13];
  }
}

uint64_t __99__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarOrientationTo___block_invoke(uint64_t result, void *a2, char a3)
{
  if ((a3 & 0x10) != 0) {
    return [a2 sceneWithIdentifier:*(void *)(result + 32) didChangeStatusBarOrientationTo:*(void *)(result + 40)];
  }
  return result;
}

- (void)sceneWithIdentifier:(id)a3 didChangeBackgroundActivitiesToSuppressTo:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBDeviceApplicationSceneStatusBarStateProxy *)self backgroundActivitiesToSuppress];
  if ((BSEqualSets() & 1) == 0)
  {
    int v9 = SBLogAppStatusBars();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = objc_opt_class();
      id v11 = v10;
      id v12 = STBackgroundActivityIdentifiersDescription();
      id v13 = STBackgroundActivityIdentifiersDescription();
      *(_DWORD *)buf = 138413058;
      id v18 = v6;
      __int16 v19 = 2112;
      __int16 v20 = v10;
      __int16 v21 = 2112;
      __int16 v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = v13;
      _os_log_debug_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEBUG, "(%@) %@ Using our overridden backgroundActivitiesToSuppress %@ (was provided %@)", buf, 0x2Au);
    }
  }
  if ([(SBDeviceApplicationSceneStatusBarStateProxy *)self _anyObserverWants:sel_sceneWithIdentifier_didChangeBackgroundActivitiesToSuppressTo_])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __109__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeBackgroundActivitiesToSuppressTo___block_invoke;
    v14[3] = &unk_1E6AF86A8;
    id v15 = v6;
    id v16 = v7;
    [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self enumerateObserversWithBlock:v14];
  }
}

uint64_t __109__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeBackgroundActivitiesToSuppressTo___block_invoke(uint64_t result, void *a2, char a3)
{
  if ((a3 & 0x40) != 0) {
    return [a2 sceneWithIdentifier:*(void *)(result + 32) didChangeBackgroundActivitiesToSuppressTo:*(void *)(result + 40)];
  }
  return result;
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarAvoidanceFrameTo:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  [(SBDeviceApplicationSceneStatusBarStateProxy *)self statusBarAvoidanceFrame];
  CGFloat v10 = v34.origin.x;
  CGFloat v11 = v34.origin.y;
  CGFloat v12 = v34.size.width;
  CGFloat v13 = v34.size.height;
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  if (!CGRectEqualToRect(v34, v37))
  {
    id v14 = SBLogAppStatusBars();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = objc_opt_class();
      id v16 = v15;
      v35.origin.CGFloat x = v10;
      v35.origin.CGFloat y = v11;
      v35.size.CGFloat width = v12;
      v35.size.CGFloat height = v13;
      id v17 = NSStringFromCGRect(v35);
      v36.origin.CGFloat x = x;
      v36.origin.CGFloat y = y;
      v36.size.CGFloat width = width;
      v36.size.CGFloat height = height;
      id v18 = NSStringFromCGRect(v36);
      *(_DWORD *)buf = 138413058;
      id v26 = v9;
      __int16 v27 = 2112;
      __int16 v28 = v15;
      __int16 v29 = 2112;
      uint64_t v30 = v17;
      __int16 v31 = 2112;
      v32 = v18;
      _os_log_debug_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEBUG, "(%@) %@ Using our overridden statusBarAvoidanceFrame %@ (was provided %@)", buf, 0x2Au);
    }
  }
  if ([(SBDeviceApplicationSceneStatusBarStateProxy *)self _anyObserverWants:sel_sceneWithIdentifier_didChangeStatusBarAvoidanceFrameTo_])
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __102__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarAvoidanceFrameTo___block_invoke;
    v19[3] = &unk_1E6AF8680;
    id v20 = v9;
    CGFloat v21 = x;
    CGFloat v22 = y;
    CGFloat v23 = width;
    CGFloat v24 = height;
    [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self enumerateObserversWithBlock:v19];
  }
}

uint64_t __102__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarAvoidanceFrameTo___block_invoke(uint64_t result, void *a2, char a3)
{
  if (a3 < 0) {
    return objc_msgSend(a2, "sceneWithIdentifier:didChangeStatusBarAvoidanceFrameTo:", *(void *)(result + 32), *(double *)(result + 40), *(double *)(result + 48), *(double *)(result + 56), *(double *)(result + 64));
  }
  return result;
}

- (void)didInvalidateStatusBarDescriptionForSceneWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([(SBDeviceApplicationSceneStatusBarStateProxy *)self _anyObserverWants:sel_didInvalidateStatusBarDescriptionForSceneWithIdentifier_])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __103__SBDeviceApplicationSceneStatusBarStateProxy_didInvalidateStatusBarDescriptionForSceneWithIdentifier___block_invoke;
    v5[3] = &unk_1E6AF8590;
    id v6 = v4;
    [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self enumerateObserversWithBlock:v5];
  }
}

uint64_t __103__SBDeviceApplicationSceneStatusBarStateProxy_didInvalidateStatusBarDescriptionForSceneWithIdentifier___block_invoke(uint64_t result, void *a2, char a3)
{
  if ((a3 & 0x20) != 0) {
    return [a2 didInvalidateStatusBarDescriptionForSceneWithIdentifier:*(void *)(result + 32)];
  }
  return result;
}

- (void)sceneWithIdentifier:(id)a3 didChangeSceneInterfaceOrientationTo:(int64_t)a4
{
  id v6 = a3;
  if ([(SBDeviceApplicationSceneStatusBarStateProxy *)self _anyObserverWants:sel_sceneWithIdentifier_didChangeSceneInterfaceOrientationTo_])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __104__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeSceneInterfaceOrientationTo___block_invoke;
    v7[3] = &unk_1E6AF85B8;
    id v8 = v6;
    int64_t v9 = a4;
    [(SBDeviceApplicationSceneStatusBarStateProvider_Base *)self enumerateObserversWithBlock:v7];
  }
}

uint64_t __104__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeSceneInterfaceOrientationTo___block_invoke(uint64_t result, void *a2, __int16 a3)
{
  if ((a3 & 0x100) != 0) {
    return [a2 sceneWithIdentifier:*(void *)(result + 32) didChangeSceneInterfaceOrientationTo:*(void *)(result + 40)];
  }
  return result;
}

- (BOOL)_anyObserverWants:(SEL)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceApplicationSceneHandle);
  objc_destroyWeak((id *)&self->_stateProvider);
}

@end
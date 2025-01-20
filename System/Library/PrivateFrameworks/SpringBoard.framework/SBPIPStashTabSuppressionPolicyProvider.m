@interface SBPIPStashTabSuppressionPolicyProvider
- (BOOL)stashTabCanBeHidden;
- (NSTimer)reevaluatePolicyTimer;
- (SBBannerManager)bannerManager;
- (SBDeviceApplicationSceneHandle)sceneHandleToObserve;
- (SBPIPStashTabSuppressionPolicyProvider)initWithObserver:(id)a3 bannerManager:(id)a4 sceneManager:(id)a5 pipManager:(id)a6;
- (SBPIPStashTabSuppressionPolicyProviderObserver)observer;
- (SBSceneManager)sceneManager;
- (SBSwitcherController)switcherController;
- (SBWindowScenePIPManager)pipManager;
- (void)_reevaluatePolicy;
- (void)_resetReevaluatePolicyTimer;
- (void)_startTrackingPresentable:(id)a3;
- (void)_stopTrackingPresentable:(id)a3;
- (void)_tapRecognized:(id)a3;
- (void)_updateSceneHandleToObserveForLayoutState:(id)a3;
- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5;
- (void)bannerManager:(id)a3 willDismissPresentable:(id)a4 withTransitionCoordinator:(id)a5;
- (void)bannerManager:(id)a3 willPresentPresentable:(id)a4 withTransitionCoordinator:(id)a5;
- (void)dealloc;
- (void)invalidate;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5;
- (void)setObserver:(id)a3;
- (void)setReevaluatePolicyTimer:(id)a3;
- (void)setSceneHandleToObserve:(id)a3;
- (void)setStashTabCanBeHidden:(BOOL)a3;
@end

@implementation SBPIPStashTabSuppressionPolicyProvider

- (SBPIPStashTabSuppressionPolicyProvider)initWithObserver:(id)a3 bannerManager:(id)a4 sceneManager:(id)a5 pipManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SBPIPStashTabSuppressionPolicyProvider;
  v15 = [(SBPIPStashTabSuppressionPolicyProvider *)&v23 init];
  if (v15)
  {
    if (v13)
    {
      if (v14)
      {
LABEL_4:
        objc_storeWeak((id *)&v15->_observer, v11);
        objc_storeWeak((id *)&v15->_bannerManager, v12);
        objc_storeWeak((id *)&v15->_sceneManager, v13);
        objc_storeWeak((id *)&v15->_pipManager, v14);
        [v12 addTransitionObserver:v15];
        v16 = [v13 _layoutStateTransitionCoordinator];
        [v16 addObserver:v15];

        [(SBPIPStashTabSuppressionPolicyProvider *)v15 _resetReevaluatePolicyTimer];
        uint64_t v17 = objc_opt_class();
        v18 = [v13 currentLayoutState];
        v19 = SBSafeCast(v17, v18);

        [(SBPIPStashTabSuppressionPolicyProvider *)v15 _updateSceneHandleToObserveForLayoutState:v19];
        goto LABEL_5;
      }
    }
    else
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:v15 file:@"SBPIPStashTabSuppressionPolicyProvider.m" lineNumber:51 description:@"invalid scene manager"];

      if (v14) {
        goto LABEL_4;
      }
    }
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:v15 file:@"SBPIPStashTabSuppressionPolicyProvider.m" lineNumber:52 description:@"invalid pip manager"];

    goto LABEL_4;
  }
LABEL_5:

  return v15;
}

- (void)invalidate
{
  objc_storeWeak((id *)&self->_observer, 0);
  self->_invalidated = 1;
  [(NSTimer *)self->_reevaluatePolicyTimer invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bannerManager);
  [WeakRetained removeTransitionObserver:self];

  id v4 = objc_loadWeakRetained((id *)&self->_sceneHandleToObserve);
  [v4 removeObserver:self];

  id v5 = objc_loadWeakRetained((id *)&self->_sceneManager);
  v6 = [v5 _layoutStateTransitionCoordinator];
  [v6 removeObserver:self];

  [(SBPIPStashTabSuppressionPolicyProvider *)self setSceneHandleToObserve:0];
  [(SBPIPStashTabSuppressionPolicyProvider *)self _reevaluatePolicy];
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"SBPIPStashTabSuppressionPolicyProvider.m", 78, @"Released %@ without invalidating", self object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBPIPStashTabSuppressionPolicyProvider;
  [(SBPIPStashTabSuppressionPolicyProvider *)&v5 dealloc];
}

- (void)_reevaluatePolicy
{
  if (self->_invalidated
    || [(NSMutableSet *)self->_requestIdentifiersForPresentedExpanseBanners count]
    || self->_reevaluatePolicyTimer)
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v4 = [(SBPIPStashTabSuppressionPolicyProvider *)self sceneHandleToObserve];
    objc_super v5 = [v4 sceneIfExists];

    v6 = [v5 clientSettings];
    uint64_t v7 = objc_opt_class();
    id v8 = v6;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        v9 = v8;
      }
      else {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
    }
    id v10 = v9;

    uint64_t v3 = [v10 homeIndicatorAutoHidden];
  }
  [(SBPIPStashTabSuppressionPolicyProvider *)self setStashTabCanBeHidden:v3];
}

- (void)_updateSceneHandleToObserveForLayoutState:(id)a3
{
  id v14 = a3;
  if ([v14 unlockedEnvironmentMode] == 3
    && ([v14 elements],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        v5 == 1))
  {
    v6 = [v14 elementWithRole:1];
    uint64_t v7 = [v6 entityGenerator];
    id v8 = v7[2]();

    uint64_t v9 = objc_opt_class();
    id v10 = v8;
    if (v9)
    {
      if (objc_opt_isKindOfClass()) {
        id v11 = v10;
      }
      else {
        id v11 = 0;
      }
    }
    else
    {
      id v11 = 0;
    }
    id v13 = v11;

    id v12 = [v13 sceneHandle];
  }
  else
  {
    id v12 = 0;
  }
  [(SBPIPStashTabSuppressionPolicyProvider *)self setSceneHandleToObserve:v12];
}

- (void)_startTrackingPresentable:(id)a3
{
  id v4 = a3;
  requestIdentifiersForPresentedExpanseBanners = self->_requestIdentifiersForPresentedExpanseBanners;
  id v9 = v4;
  if (!requestIdentifiersForPresentedExpanseBanners)
  {
    v6 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
    uint64_t v7 = self->_requestIdentifiersForPresentedExpanseBanners;
    self->_requestIdentifiersForPresentedExpanseBanners = v6;

    id v4 = v9;
    requestIdentifiersForPresentedExpanseBanners = self->_requestIdentifiersForPresentedExpanseBanners;
  }
  id v8 = [v4 requestIdentifier];
  [(NSMutableSet *)requestIdentifiersForPresentedExpanseBanners addObject:v8];

  [(SBPIPStashTabSuppressionPolicyProvider *)self _reevaluatePolicy];
}

- (void)_stopTrackingPresentable:(id)a3
{
  requestIdentifiersForPresentedExpanseBanners = self->_requestIdentifiersForPresentedExpanseBanners;
  uint64_t v5 = [a3 requestIdentifier];
  [(NSMutableSet *)requestIdentifiersForPresentedExpanseBanners removeObject:v5];

  if (![(NSMutableSet *)self->_requestIdentifiersForPresentedExpanseBanners count])
  {
    v6 = self->_requestIdentifiersForPresentedExpanseBanners;
    self->_requestIdentifiersForPresentedExpanseBanners = 0;
  }
  [(SBPIPStashTabSuppressionPolicyProvider *)self _reevaluatePolicy];
}

- (void)setSceneHandleToObserve:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandleToObserve);
  if (WeakRetained != obj)
  {
    [WeakRetained removeObserver:self];
    objc_storeWeak((id *)&self->_sceneHandleToObserve, obj);
    [obj addObserver:self];
    [(SBPIPStashTabSuppressionPolicyProvider *)self _reevaluatePolicy];
  }
}

- (void)setStashTabCanBeHidden:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_stashTabCanBeHidden != a3)
  {
    BOOL v3 = a3;
    self->_stashTabCanBeHidden = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pipManager);
    v6 = SBLogPIP();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109378;
      v8[1] = v3;
      __int16 v9 = 2112;
      id v10 = WeakRetained;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[SBPIPStashTabSuppressionPolicyProvider] setStashTabCanBeHidden %{BOOL}u %@", (uint8_t *)v8, 0x12u);
    }

    id v7 = objc_loadWeakRetained((id *)&self->_observer);
    [v7 stashTabVisibilityPolicyProviderDidUpdatePolicy:self];

    if (v3)
    {
      [WeakRetained addStashTabSuppressionTarget:self action:sel__tapRecognized_];
      [(id)SBApp addActiveOrientationObserver:self];
    }
    else
    {
      [WeakRetained removeStashTabSuppressionTarget:self action:sel__tapRecognized_];
      [(id)SBApp removeActiveOrientationObserver:self];
    }
  }
}

- (void)_tapRecognized:(id)a3
{
  [(SBPIPStashTabSuppressionPolicyProvider *)self setStashTabCanBeHidden:0];
  [(SBPIPStashTabSuppressionPolicyProvider *)self _resetReevaluatePolicyTimer];
}

- (void)_resetReevaluatePolicyTimer
{
  reevaluatePolicyTimer = self->_reevaluatePolicyTimer;
  id v4 = self;
  [(NSTimer *)reevaluatePolicyTimer invalidate];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__SBPIPStashTabSuppressionPolicyProvider__resetReevaluatePolicyTimer__block_invoke;
  v7[3] = &unk_1E6B08C90;
  v7[4] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v7 block:4.0];
  v6 = self->_reevaluatePolicyTimer;
  self->_reevaluatePolicyTimer = v5;
}

void __69__SBPIPStashTabSuppressionPolicyProvider__resetReevaluatePolicyTimer__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = *(id *)(a1 + 32);
  id v4 = v3;
  if (v3 && *((id *)v3 + 11) == v5)
  {
    *((void *)v3 + 11) = 0;

    [v4 _reevaluatePolicy];
  }
}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
  -[SBPIPStashTabSuppressionPolicyProvider setStashTabCanBeHidden:](self, "setStashTabCanBeHidden:", 0, a5, a4);
  [(SBPIPStashTabSuppressionPolicyProvider *)self _resetReevaluatePolicyTimer];
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_class();
  id v7 = [v5 toLayoutState];

  SBSafeCast(v6, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [(SBPIPStashTabSuppressionPolicyProvider *)self _updateSceneHandleToObserveForLayoutState:v8];
}

- (void)bannerManager:(id)a3 willPresentPresentable:(id)a4 withTransitionCoordinator:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = [v7 requestIdentifier];
  int v10 = [v9 hasPrefix:@"com.apple.conversationController.HUD"];

  if (v10)
  {
    [(SBPIPStashTabSuppressionPolicyProvider *)self _startTrackingPresentable:v7];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __105__SBPIPStashTabSuppressionPolicyProvider_bannerManager_willPresentPresentable_withTransitionCoordinator___block_invoke;
    v11[3] = &unk_1E6AF7D20;
    v11[4] = self;
    id v12 = v7;
    [v8 animateAlongsideTransition:0 completion:v11];
  }
}

uint64_t __105__SBPIPStashTabSuppressionPolicyProvider_bannerManager_willPresentPresentable_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 _stopTrackingPresentable:v5];
  }
  return result;
}

- (void)bannerManager:(id)a3 willDismissPresentable:(id)a4 withTransitionCoordinator:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = [v7 requestIdentifier];
  int v10 = [v9 hasPrefix:@"com.apple.conversationController.HUD"];

  if (v10)
  {
    [(SBPIPStashTabSuppressionPolicyProvider *)self _stopTrackingPresentable:v7];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __105__SBPIPStashTabSuppressionPolicyProvider_bannerManager_willDismissPresentable_withTransitionCoordinator___block_invoke;
    v11[3] = &unk_1E6AF7D20;
    v11[4] = self;
    id v12 = v7;
    [v8 animateAlongsideTransition:0 completion:v11];
  }
}

uint64_t __105__SBPIPStashTabSuppressionPolicyProvider_bannerManager_willDismissPresentable_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 _startTrackingPresentable:v5];
  }
  return result;
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  clientSettingsInspector = self->_clientSettingsInspector;
  if (!clientSettingsInspector)
  {
    id v12 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F42768]);
    id v13 = self->_clientSettingsInspector;
    self->_clientSettingsInspector = v12;

    objc_initWeak(&location, self);
    id v14 = self->_clientSettingsInspector;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __104__SBPIPStashTabSuppressionPolicyProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke;
    v18 = &unk_1E6AF85E0;
    objc_copyWeak(&v19, &location);
    [(UIApplicationSceneClientSettingsDiffInspector *)v14 observeHomeIndicatorAutoHiddenWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    clientSettingsInspector = self->_clientSettingsInspector;
  }
  -[UIApplicationSceneClientSettingsDiffInspector inspectDiff:withContext:](clientSettingsInspector, "inspectDiff:withContext:", v9, v10, v15, v16, v17, v18);
}

void __104__SBPIPStashTabSuppressionPolicyProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reevaluatePolicy];
}

- (BOOL)stashTabCanBeHidden
{
  return self->_stashTabCanBeHidden;
}

- (SBPIPStashTabSuppressionPolicyProviderObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (SBPIPStashTabSuppressionPolicyProviderObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (SBBannerManager)bannerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bannerManager);
  return (SBBannerManager *)WeakRetained;
}

- (SBSceneManager)sceneManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManager);
  return (SBSceneManager *)WeakRetained;
}

- (SBSwitcherController)switcherController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  return (SBSwitcherController *)WeakRetained;
}

- (SBWindowScenePIPManager)pipManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipManager);
  return (SBWindowScenePIPManager *)WeakRetained;
}

- (SBDeviceApplicationSceneHandle)sceneHandleToObserve
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandleToObserve);
  return (SBDeviceApplicationSceneHandle *)WeakRetained;
}

- (NSTimer)reevaluatePolicyTimer
{
  return self->_reevaluatePolicyTimer;
}

- (void)setReevaluatePolicyTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reevaluatePolicyTimer, 0);
  objc_destroyWeak((id *)&self->_sceneHandleToObserve);
  objc_destroyWeak((id *)&self->_pipManager);
  objc_destroyWeak((id *)&self->_switcherController);
  objc_destroyWeak((id *)&self->_sceneManager);
  objc_destroyWeak((id *)&self->_bannerManager);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_clientSettingsInspector, 0);
  objc_storeStrong((id *)&self->_requestIdentifiersForPresentedExpanseBanners, 0);
}

@end
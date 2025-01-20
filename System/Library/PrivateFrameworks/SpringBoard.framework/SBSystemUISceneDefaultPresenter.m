@interface SBSystemUISceneDefaultPresenter
- (BOOL)shouldPublishAsDisplayLayoutElement;
- (FBSDisplayConfiguration)targetDisplayConfiguration;
- (NSNumber)preferredWindowLevel;
- (NSString)description;
- (SBSystemUISceneBindingProviding)bindingProvider;
- (SBSystemUISceneDefaultPresenter)init;
- (SBSystemUISceneDefaultPresenter)initWithPresentationBinderProvider:(id)a3;
- (SBSystemUISceneDefaultPresenter)initWithTargetDisplayConfiguration:(id)a3;
- (SBSystemUISceneDefaultPresenter)initWithWindowHostingPresentationOnWindowScene:(id)a3;
- (UIWindowScene)targetWindowScene;
- (id)_initWithPresentationBinderProvider:(id)a3 targetDisplayConfiguration:(id)a4;
- (id)_presentationBinderForDisplayConfiguration:(id)a3;
- (id)_serviceBundleIdentifierForScene:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)dismissScene:(id)a3;
- (id)hostingBinderForScene:(id)a3;
- (id)hostingWindowForScene:(id)a3;
- (id)presentScene:(id)a3 viewControllerBuilderBlock:(id)a4;
- (id)statusBarForDisplayConfiguration:(id)a3 statusBarSceneHostComponent:(id)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_addSceneToPresentationBinder:(id)a3;
- (void)_disableIdleTimer:(BOOL)a3 sceneIdentityToken:(id)a4;
- (void)_invalidatePresentationBinderForDisplayConfiguration:(id)a3;
- (void)_removeSceneFromPresentationBinder:(id)a3;
- (void)_setDisplayLayoutElementActive:(BOOL)a3 scene:(id)a4;
- (void)_updateDisplayLayoutElementWindowLevelForScene:(id)a3;
- (void)dealloc;
- (void)featurePolicyHostComponentDidChangeAllowsMenuButtonDismissal:(id)a3;
- (void)featurePolicyHostComponentDidChangeShouldDisableReachability:(id)a3;
- (void)idleTimerSceneHostComponentDidChangeShouldDisableIdleTimer:(id)a3;
- (void)scene:(id)a3 didChangeTraitsParticipantDelegate:(id)a4;
- (void)scene:(id)a3 hasVisibleContent:(BOOL)a4;
- (void)sceneDidChangeDisplayIdentity:(id)a3;
- (void)setPreferredWindowLevel:(id)a3;
- (void)setPresentingDelegate:(id)a3;
- (void)setShouldPublishAsDisplayLayoutElement:(BOOL)a3;
- (void)statusBarSceneHostComponent:(id)a3 didChangePreferredStatusBarVisibilityWithAnimationSettings:(id)a4;
@end

@implementation SBSystemUISceneDefaultPresenter

- (void)dealloc
{
  if ([(NSMutableArray *)self->_presentedScenes count])
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"SBSystemUISceneDefaultPresenter.m" lineNumber:64 description:@"SBSystemUISceneDefaultPresenter was dealloc-ed while it is still presenting scenes."];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBSystemUISceneDefaultPresenter;
  [(SBSystemUISceneDefaultPresenter *)&v5 dealloc];
}

- (SBSystemUISceneDefaultPresenter)init
{
  v14.receiver = self;
  v14.super_class = (Class)SBSystemUISceneDefaultPresenter;
  v2 = [(SBSystemUISceneDefaultPresenter *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    presentedScenes = v2->_presentedScenes;
    v2->_presentedScenes = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    sceneToWindowMap = v2->_sceneToWindowMap;
    v2->_sceneToWindowMap = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    sceneToDisplayLayoutAssertionMap = v2->_sceneToDisplayLayoutAssertionMap;
    v2->_sceneToDisplayLayoutAssertionMap = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    sceneToPresentationBinderMap = v2->_sceneToPresentationBinderMap;
    v2->_sceneToPresentationBinderMap = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    displayConfigurationToPresentationBinderMap = v2->_displayConfigurationToPresentationBinderMap;
    v2->_displayConfigurationToPresentationBinderMap = (NSMutableDictionary *)v11;
  }
  return v2;
}

- (SBSystemUISceneDefaultPresenter)initWithWindowHostingPresentationOnWindowScene:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBSystemUISceneDefaultPresenter *)self init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_targetWindowScene, v4);
  }

  return v6;
}

- (SBSystemUISceneDefaultPresenter)initWithTargetDisplayConfiguration:(id)a3
{
  return (SBSystemUISceneDefaultPresenter *)[(SBSystemUISceneDefaultPresenter *)self _initWithPresentationBinderProvider:0 targetDisplayConfiguration:a3];
}

- (SBSystemUISceneDefaultPresenter)initWithPresentationBinderProvider:(id)a3
{
  return (SBSystemUISceneDefaultPresenter *)[(SBSystemUISceneDefaultPresenter *)self _initWithPresentationBinderProvider:a3 targetDisplayConfiguration:0];
}

- (id)_initWithPresentationBinderProvider:(id)a3 targetDisplayConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SBSystemUISceneDefaultPresenter *)self init];
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_bindingProvider, v6);
    objc_storeWeak(p_isa + 13, v7);
  }

  return p_isa;
}

- (id)hostingWindowForScene:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBSystemUISceneDefaultPresenter.m", 109, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];
  }
  sceneToWindowMap = self->_sceneToWindowMap;
  id v7 = [v5 identityToken];
  v8 = [(NSMutableDictionary *)sceneToWindowMap objectForKey:v7];

  return v8;
}

- (id)hostingBinderForScene:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBSystemUISceneDefaultPresenter.m", 114, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];
  }
  sceneToPresentationBinderMap = self->_sceneToPresentationBinderMap;
  id v7 = [v5 identityToken];
  v8 = [(NSMutableDictionary *)sceneToPresentationBinderMap objectForKey:v7];

  return v8;
}

- (void)setPreferredWindowLevel:(id)a3
{
  id v8 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_preferredWindowLevel, "isEqualToNumber:"))
  {
    id v4 = (NSNumber *)[v8 copy];
    preferredWindowLevel = self->_preferredWindowLevel;
    self->_preferredWindowLevel = v4;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_currentParticipantDelegate);
    [WeakRetained setPreferredSceneLevel:v8];
    id v7 = [WeakRetained participant];
    [v7 setNeedsUpdatePreferencesWithReason:@"level changed"];
  }
}

- (void)_addSceneToPresentationBinder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    int v15 = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Scene[%{public}@] was added to the presentation binder.", (uint8_t *)&v15, 0xCu);
  }
  id v7 = [v4 identityToken];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);
  uint64_t v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = WeakRetained;
  }
  else
  {
    uint64_t v11 = [v4 settings];
    objc_msgSend(v11, "sb_displayConfigurationForSceneManagers");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = [(SBSystemUISceneDefaultPresenter *)self _presentationBinderForDisplayConfiguration:v10];
  [v12 addScene:v4];
  sceneToWindowMap = self->_sceneToWindowMap;
  objc_super v14 = [v12 rootWindow];
  [(NSMutableDictionary *)sceneToWindowMap setObject:v14 forKey:v7];

  [(NSMutableDictionary *)self->_sceneToPresentationBinderMap setObject:v12 forKey:v7];
}

- (void)_removeSceneFromPresentationBinder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    int v15 = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Scene[%{public}@] was removed from the presentation binder.", (uint8_t *)&v15, 0xCu);
  }
  id v7 = [v4 identityToken];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);
  uint64_t v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = WeakRetained;
  }
  else
  {
    uint64_t v11 = [v4 settings];
    objc_msgSend(v11, "sb_displayConfigurationForSceneManagers");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = [(SBSystemUISceneDefaultPresenter *)self _presentationBinderForDisplayConfiguration:v10];
  [(NSMutableDictionary *)self->_sceneToPresentationBinderMap removeObjectForKey:v7];
  [(NSMutableDictionary *)self->_sceneToWindowMap removeObjectForKey:v7];
  [v12 removeScene:v4];
  v13 = [v12 scenes];
  uint64_t v14 = [v13 count];

  if (!v14) {
    [(SBSystemUISceneDefaultPresenter *)self _invalidatePresentationBinderForDisplayConfiguration:v10];
  }
}

- (id)_presentationBinderForDisplayConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_displayConfigurationToPresentationBinderMap objectForKey:v4];
  if (!v5)
  {
    id v6 = NSString;
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    uint64_t v9 = [v6 stringWithFormat:@"UIRootSceneWindow-%@-%p", v8, self];

    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F42D48]) initWithDisplayConfiguration:v4];
    [v10 setBackgroundColor:0];
    id v5 = [[SBRootWindowScenePresentationBinder alloc] initWithIdentifier:v9 priority:0 appearanceStyle:0 rootWindow:v10];
    [(NSMutableDictionary *)self->_displayConfigurationToPresentationBinderMap setObject:v5 forKey:v4];
  }
  return v5;
}

- (void)_invalidatePresentationBinderForDisplayConfiguration:(id)a3
{
  id v6 = a3;
  id v4 = -[NSMutableDictionary objectForKey:](self->_displayConfigurationToPresentationBinderMap, "objectForKey:");
  id v5 = v4;
  if (v4)
  {
    [v4 invalidate];
    [(NSMutableDictionary *)self->_displayConfigurationToPresentationBinderMap removeObjectForKey:v6];
  }
}

- (void)_disableIdleTimer:(BOOL)a3 sceneIdentityToken:(id)a4
{
  BOOL v4 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  scenesDisablingIdleTimer = self->_scenesDisablingIdleTimer;
  if (v4)
  {
    if (!scenesDisablingIdleTimer)
    {
      id v8 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v9 = self->_scenesDisablingIdleTimer;
      self->_scenesDisablingIdleTimer = v8;

      scenesDisablingIdleTimer = self->_scenesDisablingIdleTimer;
    }
    [(NSMutableSet *)scenesDisablingIdleTimer addObject:v6];
  }
  else if ([(NSMutableSet *)scenesDisablingIdleTimer containsObject:v6])
  {
    [(NSMutableSet *)self->_scenesDisablingIdleTimer removeObject:v6];
  }
  uint64_t v10 = [(NSMutableSet *)self->_scenesDisablingIdleTimer count];
  idleTimerDisableAssertion = self->_idleTimerDisableAssertion;
  if (v10)
  {
    if (!idleTimerDisableAssertion)
    {
      v12 = +[SBIdleTimerGlobalCoordinator sharedInstance];
      v13 = [v12 acquireIdleTimerDisableAssertionForReason:@"SystemUI Scene Presentation"];
      uint64_t v14 = self->_idleTimerDisableAssertion;
      self->_idleTimerDisableAssertion = v13;
    }
    int v15 = SBLogSystemUIScene();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_scenesDisablingIdleTimer;
      int v21 = 138543362;
      v22 = v16;
      uint64_t v17 = "Idle timer is disabled for scenes:%{public}@";
      v18 = v15;
      uint32_t v19 = 12;
LABEL_14:
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v21, v19);
    }
  }
  else
  {
    [(BSInvalidatable *)idleTimerDisableAssertion invalidate];
    v20 = self->_idleTimerDisableAssertion;
    self->_idleTimerDisableAssertion = 0;

    int v15 = SBLogSystemUIScene();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      uint64_t v17 = "Reenable idle timer";
      v18 = v15;
      uint32_t v19 = 2;
      goto LABEL_14;
    }
  }
}

- (id)presentScene:(id)a3 viewControllerBuilderBlock:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(void))a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"SBSystemUISceneDefaultPresenter.m", 203, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_39:
    v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2, self, @"SBSystemUISceneDefaultPresenter.m", 204, @"Invalid parameter not satisfying: %@", @"viewControllerBuilderBlock" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_39;
  }
LABEL_3:
  uint64_t v10 = [v7 identityToken];
  presentedScenes = self->_presentedScenes;
  if (presentedScenes && [(NSMutableArray *)presentedScenes containsObject:v10])
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2, self, @"SBSystemUISceneDefaultPresenter.m", 206, @"Scene[%@] already presented by[%p].", v7, self object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetWindowScene);
  if (!WeakRetained)
  {
    uint64_t v17 = objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);
    uint64_t v18 = [v17 identity];
    if (v18)
    {
      uint32_t v19 = (void *)v18;
    }
    else
    {
      v28 = [v7 settings];
      v29 = objc_msgSend(v28, "sb_displayConfigurationForSceneManagers");
      uint32_t v19 = [v29 identity];

      if (v19) {
        goto LABEL_23;
      }
      uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"SBSystemUISceneDefaultPresenter.m", 238, @"targetDisplayIdentity not found for scene[%@]", v7 object file lineNumber description];
    }

LABEL_23:
    id v30 = objc_loadWeakRetained((id *)&self->_bindingProvider);
    v31 = v30;
    if (v30) {
      [v30 addSystemUISceneToPresentationBinder:v7 forDisplayIdentity:v19];
    }
    else {
      [(SBSystemUISceneDefaultPresenter *)self _addSceneToPresentationBinder:v7];
    }
    v32 = +[SBSceneManagerCoordinator sharedInstance];
    v33 = [v32 sceneManagerForDisplayIdentity:v19];

    [v33 startTrackingSystemUISceneForInterfaceStyleUpdatePurposes:v7];
    goto LABEL_35;
  }
  v13 = [(NSMutableDictionary *)self->_sceneToWindowMap objectForKey:v10];
  uint64_t v14 = objc_opt_class();
  id v15 = v13;
  if (v14)
  {
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }
  v20 = v16;

  if (!v20)
  {
    v20 = [[SBTraitsSingleSceneWindow alloc] initWithWindowScene:WeakRetained];
    [(NSMutableDictionary *)self->_sceneToWindowMap setObject:v20 forKey:v10];
  }
  int v21 = [(SBTraitsSingleSceneWindow *)v20 rootViewController];

  if (!v21)
  {
    v22 = v9[2](v9);
    uint64_t v23 = [v22 traitsOrientedViewController];

    v24 = [v7 clientSettings];
    uint64_t v25 = objc_opt_class();
    id v26 = v24;
    if (v25)
    {
      if (objc_opt_isKindOfClass()) {
        v27 = v26;
      }
      else {
        v27 = 0;
      }
    }
    else
    {
      v27 = 0;
    }
    id v34 = v27;

    if (v34)
    {
      [v34 backgroundStyle];
      uint64_t v35 = _WallpaperStyleForBackgroundStyle();
      if (v35 != 1)
      {
        uint64_t v36 = v35;
        v37 = +[SBLockScreenManager sharedInstance];
        uint64_t v48 = [v37 isUILocked] ^ 1;

        v38 = [[SBWallpaperEffectView alloc] initWithWallpaperVariant:v48];
        [(PBUIWallpaperEffectViewBase *)v38 setWallpaperStyle:v36];
        v39 = [v23 view];
        [v39 setBackgroundView:v38];
      }
    }
    [(SBTraitsSingleSceneWindow *)v20 setRootViewController:v23];
    v40 = [v23 view];
    [(SBTraitsSingleSceneWindow *)v20 bounds];
    objc_msgSend(v40, "setFrame:");

    [(SBTraitsSingleSceneWindow *)v20 _legacySetRotatableViewOrientation:1 updateStatusBar:1 duration:0 force:0.0];
  }
  [(SBFWindow *)v20 setHidden:0];
  [(SBSystemUISceneDefaultPresenter *)self _setDisplayLayoutElementActive:1 scene:v7];
  v41 = SBLogCommon();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = [v7 identifier];
    *(_DWORD *)buf = 138543618;
    v50 = v42;
    __int16 v51 = 2112;
    id v52 = WeakRetained;
    _os_log_impl(&dword_1D85BA000, v41, OS_LOG_TYPE_DEFAULT, "Scene[%{public}@] window was shown on windowScene: %@.", buf, 0x16u);
  }
LABEL_35:
  [(NSMutableArray *)self->_presentedScenes addObject:v10];
  id v43 = objc_loadWeakRetained((id *)&self->_presentingDelegate);
  if (objc_opt_respondsToSelector()) {
    [v43 scenePresenter:self didPresentScene:v7];
  }

  return 0;
}

- (id)dismissScene:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"SBSystemUISceneDefaultPresenter.m", 262, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];
  }
  id v6 = [v5 identityToken];
  if ([(NSMutableArray *)self->_presentedScenes containsObject:v6])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingDelegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained scenePresenter:self willDismissScene:v5];
    }
    id v8 = objc_loadWeakRetained((id *)&self->_targetWindowScene);
    if (v8)
    {
      [(SBSystemUISceneDefaultPresenter *)self _disableIdleTimer:0 sceneIdentityToken:v6];
      uint64_t v9 = [(NSMutableDictionary *)self->_sceneToWindowMap objectForKey:v6];
      [v9 setHidden:1];
      [(SBSystemUISceneDefaultPresenter *)self _setDisplayLayoutElementActive:0 scene:v5];
      uint64_t v10 = [v9 rootViewController];
      uint64_t v11 = objc_opt_class();
      id v12 = v10;
      if (v11)
      {
        if (objc_opt_isKindOfClass()) {
          v13 = v12;
        }
        else {
          v13 = 0;
        }
      }
      else
      {
        v13 = 0;
      }
      id v17 = v13;

      if (v17)
      {
        uint64_t v18 = [v17 view];
        [v18 setBackgroundView:0];

        if (objc_opt_respondsToSelector()) {
          [WeakRetained scenePresenter:self updateHomeAffordance:0 forScene:v5];
        }
      }
      [v9 setRootViewController:0];
      [(NSMutableDictionary *)self->_sceneToWindowMap removeObjectForKey:v6];
      uint32_t v19 = SBLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [v5 identifier];
        *(_DWORD *)buf = 138543618;
        id v30 = v20;
        __int16 v31 = 2112;
        id v32 = v8;
        _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "Scene[%{public}@] window was hidden on windowScene: %@.", buf, 0x16u);
      }
      goto LABEL_26;
    }
    uint64_t v14 = objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);
    uint64_t v15 = [v14 identity];
    if (v15)
    {
      v16 = (void *)v15;
    }
    else
    {
      int v21 = [v5 settings];
      v22 = objc_msgSend(v21, "sb_displayConfigurationForSceneManagers");
      v16 = [v22 identity];

      if (v16) {
        goto LABEL_22;
      }
      uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"SBSystemUISceneDefaultPresenter.m", 288, @"targetDisplayIdentity not found for scene[%@]", v5 object file lineNumber description];
    }

LABEL_22:
    id v23 = objc_loadWeakRetained((id *)&self->_bindingProvider);
    v24 = v23;
    if (v23) {
      [v23 removeSystemUISceneFromPresentationBinder:v5 forDisplayIdentity:v16];
    }
    else {
      [(SBSystemUISceneDefaultPresenter *)self _removeSceneFromPresentationBinder:v5];
    }
    uint64_t v25 = +[SBSceneManagerCoordinator sharedInstance];
    id v26 = [v25 sceneManagerForDisplayIdentity:v16];

    [v26 stopTrackingSystemUISceneForInterfaceStyleUpdatePurposes:v5];
LABEL_26:
    [(NSMutableArray *)self->_presentedScenes removeObject:v6];
  }
  return 0;
}

- (void)sceneDidChangeDisplayIdentity:(id)a3
{
  id v5 = a3;
  id v17 = v5;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBSystemUISceneDefaultPresenter.m", 307, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];

    id v5 = 0;
  }
  id v6 = [v5 identityToken];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetWindowScene);
  if (WeakRetained) {
    goto LABEL_4;
  }
  id v8 = objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);

  if (!v8 && [(NSMutableArray *)self->_presentedScenes containsObject:v6])
  {
    id WeakRetained = [(NSMutableDictionary *)self->_sceneToPresentationBinderMap objectForKey:v6];
    uint64_t v9 = [WeakRetained displayConfiguration];
    uint64_t v10 = [v17 settings];
    uint64_t v11 = objc_msgSend(v10, "sb_displayConfigurationForSceneManagers");
    char v12 = [v9 isEqual:v11];

    if ((v12 & 1) == 0)
    {
      [(NSMutableDictionary *)self->_sceneToPresentationBinderMap removeObjectForKey:v6];
      [(NSMutableDictionary *)self->_sceneToWindowMap removeObjectForKey:v6];
      [WeakRetained removeScene:v17];
      v13 = [WeakRetained scenes];
      uint64_t v14 = [v13 count];

      if (!v14)
      {
        uint64_t v15 = [WeakRetained displayConfiguration];
        [(SBSystemUISceneDefaultPresenter *)self _invalidatePresentationBinderForDisplayConfiguration:v15];
      }
      [(SBSystemUISceneDefaultPresenter *)self _addSceneToPresentationBinder:v17];
    }
LABEL_4:
  }
}

- (void)scene:(id)a3 hasVisibleContent:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v18 = v7;
  if (!v7)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBSystemUISceneDefaultPresenter.m", 329, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];

    id v7 = 0;
  }
  id v8 = [v7 identityToken];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetWindowScene);
  if (WeakRetained)
  {
    uint64_t v10 = WeakRetained;
    int v11 = [(NSMutableArray *)self->_presentedScenes containsObject:v8];

    if (v11)
    {
      char v12 = [(NSMutableDictionary *)self->_sceneToWindowMap objectForKey:v8];
      uint64_t v13 = objc_opt_class();
      id v14 = v12;
      if (v13)
      {
        if (objc_opt_isKindOfClass()) {
          uint64_t v15 = v14;
        }
        else {
          uint64_t v15 = 0;
        }
      }
      else
      {
        uint64_t v15 = 0;
      }
      id v16 = v15;

      [v16 setSceneContentVisible:v4];
    }
  }
}

- (void)scene:(id)a3 didChangeTraitsParticipantDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SBSystemUISceneDefaultPresenter.m", 339, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];
  }
  uint64_t v9 = [v7 identityToken];
  objc_storeWeak((id *)&self->_currentParticipantDelegate, v8);
  uint64_t v10 = [v8 participant];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetWindowScene);
  if (WeakRetained)
  {
    char v12 = WeakRetained;
    uint64_t v13 = [(NSMutableDictionary *)self->_sceneToWindowMap objectForKey:v9];
    if (v13)
    {
      id v14 = (void *)v13;
      int v15 = [(NSMutableArray *)self->_presentedScenes containsObject:v9];

      if (v15)
      {
        objc_initWeak(&location, self);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __76__SBSystemUISceneDefaultPresenter_scene_didChangeTraitsParticipantDelegate___block_invoke;
        v25[3] = &unk_1E6AFD8A8;
        objc_copyWeak(&v27, &location);
        id v16 = v9;
        id v26 = v16;
        [v8 setActuateZOrderAlongsideBlock:v25];
        id v17 = [(NSMutableDictionary *)self->_sceneToWindowMap objectForKey:v16];
        [v10 currentZOrderLevel];
        objc_msgSend(v17, "setWindowLevel:");
        [(SBSystemUISceneDefaultPresenter *)self _updateDisplayLayoutElementWindowLevelForScene:v7];
        uint64_t v18 = objc_opt_class();
        id v19 = v17;
        if (v18)
        {
          if (objc_opt_isKindOfClass()) {
            v20 = v19;
          }
          else {
            v20 = 0;
          }
        }
        else
        {
          v20 = 0;
        }
        id v21 = v20;

        v22 = [v21 rootViewController];
        [v22 setContainerParticipant:0];

        id v23 = [v21 rootViewController];
        [v23 updateOrientationIfNeeded];

        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }
    }
    else
    {
    }
  }
  if (self->_preferredWindowLevel)
  {
    objc_msgSend(v8, "setPreferredSceneLevel:");
    [v10 setNeedsUpdatePreferencesWithReason:@"level"];
    [v10 updatePreferencesIfNeeded];
  }
}

void __76__SBSystemUISceneDefaultPresenter_scene_didChangeTraitsParticipantDelegate___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v5 = [WeakRetained[4] objectForKey:*(void *)(a1 + 32)];
    [v5 setWindowLevel:a2];

    id WeakRetained = v6;
  }
}

- (void)setPresentingDelegate:(id)a3
{
}

- (NSString)description
{
  return (NSString *)[(SBSystemUISceneDefaultPresenter *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBSystemUISceneDefaultPresenter *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBSystemUISceneDefaultPresenter *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSystemUISceneDefaultPresenter *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__SBSystemUISceneDefaultPresenter_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  int v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __73__SBSystemUISceneDefaultPresenter_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 96));
  id v4 = [WeakRetained _FBSScene];
  id v5 = [v4 identifier];
  [v2 appendString:v5 withName:@"targetWindowScene scene identifier"];

  id v6 = *(void **)(a1 + 32);
  id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 104));
  id v8 = (id)[v6 appendObject:v7 withName:@"targetDisplayConfiguration"];

  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 112));
  id v11 = (id)[v9 appendObject:v10 withName:@"bindingProvider"];

  id v12 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"presentedScenes"];
  id v13 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"sceneToWindowMap"];
  v45 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v14 = a1;
  int v15 = [*(id *)(*(void *)(a1 + 40) + 48) allKeys];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v51 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        id v21 = [*(id *)(*(void *)(v14 + 40) + 48) objectForKey:v20];
        v22 = NSString;
        id v23 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v23);
        uint64_t v25 = [v22 stringWithFormat:@"<%@: %p>", v24, v21];
        [v45 setObject:v25 forKey:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v17);
  }

  id v26 = (id)[*(id *)(v14 + 32) appendObject:v45 withName:@"sceneToPresentationBinderMap"];
  v44 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = [*(id *)(*(void *)(v14 + 40) + 56) allKeys];
  uint64_t v27 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v47 != v29) {
          objc_enumerationMutation(obj);
        }
        __int16 v31 = *(void **)(*((void *)&v46 + 1) + 8 * j);
        id v32 = [*(id *)(*(void *)(v14 + 40) + 56) objectForKey:v31];
        uint64_t v33 = NSString;
        id v34 = (objc_class *)objc_opt_class();
        uint64_t v35 = NSStringFromClass(v34);
        uint64_t v36 = [v33 stringWithFormat:@"<%@: %p>", v35, v32];

        v37 = NSString;
        v38 = (objc_class *)objc_opt_class();
        v39 = NSStringFromClass(v38);
        v40 = [v31 identity];
        v41 = [v37 stringWithFormat:@"<%@: %p; %@>", v39, v31, v40];

        [v44 setObject:v36 forKey:v41];
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v28);
  }

  id v42 = (id)[*(id *)(v14 + 32) appendObject:v44 withName:@"displayConfigurationToPresentationBinderMap"];
}

- (id)statusBarForDisplayConfiguration:(id)a3 statusBarSceneHostComponent:(id)a4
{
  id v4 = (void *)SBApp;
  id v5 = a3;
  id v6 = [v4 windowSceneManager];
  id v7 = [v5 identity];

  id v8 = [v6 windowSceneForDisplayIdentity:v7];

  uint64_t v9 = [v8 statusBarManager];
  id v10 = [v9 statusBar];

  return v10;
}

- (void)statusBarSceneHostComponent:(id)a3 didChangePreferredStatusBarVisibilityWithAnimationSettings:(id)a4
{
  id v5 = a3;
  id v6 = [v5 hostScene];
  id v35 = [v6 identityToken];

  id v7 = [v5 hostScene];

  id v8 = [v7 clientSettings];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetWindowScene);
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    uint64_t v11 = [(NSMutableDictionary *)self->_sceneToWindowMap objectForKey:v35];
    if (v11)
    {
      id v12 = (void *)v11;
      int v13 = [(NSMutableArray *)self->_presentedScenes containsObject:v35];

      if (!v13) {
        goto LABEL_27;
      }
      uint64_t v14 = [(NSMutableDictionary *)self->_sceneToWindowMap objectForKey:v35];
      uint64_t v15 = objc_opt_class();
      id v10 = v14;
      if (v15)
      {
        if (objc_opt_isKindOfClass()) {
          uint64_t v16 = v10;
        }
        else {
          uint64_t v16 = 0;
        }
      }
      else
      {
        uint64_t v16 = 0;
      }
      id v17 = v16;

      uint64_t v18 = [v17 _sbWindowScene];
      uint64_t v19 = objc_opt_class();
      id v20 = v18;
      if (v19)
      {
        if (objc_opt_isKindOfClass()) {
          id v21 = v20;
        }
        else {
          id v21 = 0;
        }
      }
      else
      {
        id v21 = 0;
      }
      id v22 = v21;

      id v23 = [v22 statusBarManager];

      v24 = [v23 reusePool];

      uint64_t v25 = [v17 rootViewController];
      uint64_t v26 = objc_opt_class();
      id v27 = v25;
      if (v26)
      {
        if (objc_opt_isKindOfClass()) {
          uint64_t v28 = v27;
        }
        else {
          uint64_t v28 = 0;
        }
      }
      else
      {
        uint64_t v28 = 0;
      }
      id v29 = v28;

      char v30 = [v8 statusBarHidden];
      statusBar = self->_statusBar;
      if (v30)
      {
        if (statusBar)
        {
          [(UIStatusBar *)statusBar removeFromSuperview];
          [v24 recycleStatusBar:self->_statusBar];
        }
      }
      else
      {
        if (!statusBar)
        {
          id v32 = [v24 getReusableStatusBarWithReason:@"SystemUI Scene Presentation"];
          uint64_t v33 = self->_statusBar;
          self->_statusBar = v32;
        }
        id v34 = [v29 view];
        [v34 addOverlayView:self->_statusBar];
      }
    }
  }
LABEL_27:
}

- (void)featurePolicyHostComponentDidChangeShouldDisableReachability:(id)a3
{
  id v8 = a3;
  id v4 = [v8 hostScene];
  id v5 = [v4 identityToken];
  id v6 = [(NSMutableDictionary *)self->_sceneToWindowMap objectForKey:v5];
  if (v6 && [v8 shouldDisableReachability])
  {
    id v7 = +[SBReachabilityManager sharedInstance];
    [v7 ignoreWindowForReachability:v6];
  }
}

- (void)featurePolicyHostComponentDidChangeAllowsMenuButtonDismissal:(id)a3
{
  id v12 = [a3 hostScene];
  id v4 = [v12 identityToken];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetWindowScene);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    uint64_t v7 = [(NSMutableDictionary *)self->_sceneToWindowMap objectForKey:v4];
    if (v7)
    {
      id v8 = (void *)v7;
      int v9 = [(NSMutableArray *)self->_presentedScenes containsObject:v4];

      if (!v9) {
        goto LABEL_11;
      }
      id v6 = [v12 clientSettings];
      if ([v6 allowsMenuButtonDismissal]) {
        uint64_t v10 = SBHomeGestureEnabled();
      }
      else {
        uint64_t v10 = 0;
      }
      id v11 = objc_loadWeakRetained((id *)&self->_presentingDelegate);
      if (objc_opt_respondsToSelector()) {
        [v11 scenePresenter:self updateHomeAffordance:v10 forScene:v12];
      }
    }
  }
LABEL_11:
}

- (void)idleTimerSceneHostComponentDidChangeShouldDisableIdleTimer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 hostScene];
  id v13 = [v5 identityToken];

  id v6 = [v4 hostScene];

  uint64_t v7 = [v6 clientSettings];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetWindowScene);
  if (WeakRetained)
  {
    int v9 = WeakRetained;
    uint64_t v10 = [(NSMutableDictionary *)self->_sceneToWindowMap objectForKey:v13];
    if (v10)
    {
      id v11 = (void *)v10;
      int v12 = [(NSMutableArray *)self->_presentedScenes containsObject:v13];

      if (v12) {
        -[SBSystemUISceneDefaultPresenter _disableIdleTimer:sceneIdentityToken:](self, "_disableIdleTimer:sceneIdentityToken:", [v7 idleTimerDisabled], v13);
      }
    }
    else
    {
    }
  }
}

- (id)_serviceBundleIdentifierForScene:(id)a3
{
  uint64_t v3 = [a3 clientHandle];
  id v4 = [v3 processHandle];

  if ([v4 hasConsistentLaunchdJob])
  {
    uint64_t v5 = [v4 consistentJobLabel];
LABEL_5:
    id v6 = (void *)v5;
    goto LABEL_6;
  }
  if ([v4 isDaemon])
  {
    uint64_t v5 = [v4 daemonJobLabel];
    goto LABEL_5;
  }
  if ([v4 isApplication])
  {
    id v8 = [v4 bundle];
    id v6 = [v8 identifier];
  }
  else
  {
    id v6 = 0;
  }
LABEL_6:

  return v6;
}

- (void)_setDisplayLayoutElementActive:(BOOL)a3 scene:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SBSystemUISceneDefaultPresenter.m", 545, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];

    id v7 = 0;
  }
  if (self->_shouldPublishAsDisplayLayoutElement)
  {
    id v20 = v7;
    id v8 = [v7 identityToken];
    int v9 = [(NSMutableDictionary *)self->_sceneToWindowMap objectForKey:v8];
    if (!v9)
    {
LABEL_14:

      id v7 = v20;
      goto LABEL_15;
    }
    uint64_t v10 = [(NSMutableDictionary *)self->_sceneToDisplayLayoutAssertionMap objectForKey:v8];
    id v11 = (void *)v10;
    int v12 = !v4;
    if (!v4 || v10)
    {
      if (!v10) {
        int v12 = 0;
      }
      if (v12 != 1) {
        goto LABEL_13;
      }
      [(NSMutableDictionary *)self->_sceneToDisplayLayoutAssertionMap removeObjectForKey:v8];
      [v11 invalidate];
      uint64_t v18 = 0;
    }
    else
    {
      id v13 = objc_alloc(MEMORY[0x1E4FA6A68]);
      uint64_t v14 = [(SBSystemUISceneDefaultPresenter *)self _serviceBundleIdentifierForScene:v20];
      id v11 = (void *)[v13 initWithIdentifier:v14];

      [v9 level];
      [v11 setLevel:(uint64_t)v15];
      [v11 setFillsDisplayBounds:1];
      [v11 setLayoutRole:3];
      uint64_t v16 = [v9 _sbWindowScene];
      id v17 = [v16 displayLayoutPublisher];
      uint64_t v18 = [v17 addElement:v11];

      [(NSMutableDictionary *)self->_sceneToDisplayLayoutAssertionMap setObject:v18 forKey:v8];
    }

    id v11 = (void *)v18;
LABEL_13:

    goto LABEL_14;
  }
LABEL_15:
}

- (void)_updateDisplayLayoutElementWindowLevelForScene:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    int v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBSystemUISceneDefaultPresenter.m", 568, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];

    id v5 = 0;
  }
  if (self->_shouldPublishAsDisplayLayoutElement)
  {
    id v13 = v5;
    id v6 = [v5 identityToken];
    id v7 = [(NSMutableDictionary *)self->_sceneToWindowMap objectForKey:v6];
    if (v7)
    {
      id v8 = [(NSMutableDictionary *)self->_sceneToDisplayLayoutAssertionMap objectForKey:v6];
      if (v8)
      {
        int v9 = [v7 _sbWindowScene];
        uint64_t v10 = [v9 displayLayoutPublisher];
        id v11 = [v10 transitionAssertionWithReason:0];

        [(SBSystemUISceneDefaultPresenter *)self _setDisplayLayoutElementActive:0 scene:v13];
        [(SBSystemUISceneDefaultPresenter *)self _setDisplayLayoutElementActive:1 scene:v13];
        [v11 invalidate];
      }
    }

    id v5 = v13;
  }
}

- (UIWindowScene)targetWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetWindowScene);
  return (UIWindowScene *)WeakRetained;
}

- (FBSDisplayConfiguration)targetDisplayConfiguration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);
  return (FBSDisplayConfiguration *)WeakRetained;
}

- (SBSystemUISceneBindingProviding)bindingProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bindingProvider);
  return (SBSystemUISceneBindingProviding *)WeakRetained;
}

- (NSNumber)preferredWindowLevel
{
  return self->_preferredWindowLevel;
}

- (BOOL)shouldPublishAsDisplayLayoutElement
{
  return self->_shouldPublishAsDisplayLayoutElement;
}

- (void)setShouldPublishAsDisplayLayoutElement:(BOOL)a3
{
  self->_shouldPublishAsDisplayLayoutElement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredWindowLevel, 0);
  objc_destroyWeak((id *)&self->_bindingProvider);
  objc_destroyWeak((id *)&self->_targetDisplayConfiguration);
  objc_destroyWeak((id *)&self->_targetWindowScene);
  objc_storeStrong((id *)&self->_scenesDisablingIdleTimer, 0);
  objc_storeStrong((id *)&self->_idleTimerDisableAssertion, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_displayConfigurationToPresentationBinderMap, 0);
  objc_storeStrong((id *)&self->_sceneToPresentationBinderMap, 0);
  objc_storeStrong((id *)&self->_sceneToDisplayLayoutAssertionMap, 0);
  objc_storeStrong((id *)&self->_sceneToWindowMap, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_destroyWeak((id *)&self->_currentParticipantDelegate);
  objc_storeStrong((id *)&self->_presentedScenes, 0);
}

@end
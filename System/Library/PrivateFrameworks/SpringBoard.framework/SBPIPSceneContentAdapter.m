@interface SBPIPSceneContentAdapter
- (BOOL)isPresentingPictureInPictureForPIPController:(id)a3 applicationBundleIdentifier:(id)a4;
- (BOOL)isStartingStoppingOrCancellingPictureInPictureForPIPController:(id)a3;
- (BOOL)isStoppingOrCancellingPictureForPIPController:(id)a3 applicationWithBundleIdentifier:(id)a4 scenePersistenceIdentifier:(id)a5;
- (BOOL)pipController:(id)a3 willBeginPIPInterruptionForAssertion:(id)a4;
- (BOOL)shouldStartPictureInPictureForPIPController:(id)a3 applicationWithProcessIdentifierEnteringBackground:(int)a4 scenePersistenceIdentifier:(id)a5;
- (SBPIPSceneContentAdapter)initWithPIPContentType:(int64_t)a3 sceneManager:(id)a4;
- (int64_t)contentTypeForPIPController:(id)a3;
- (int64_t)tetheringModeForScenePersistenceIdentifier:(id)a3;
- (void)_recalculateLevelAssertions;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)pipController:(id)a3 didAddContainerViewController:(id)a4;
- (void)pipController:(id)a3 didUpdateEnhancedWindowingModeEnabled:(BOOL)a4 windowScene:(id)a5;
- (void)pipController:(id)a3 willRemoveContainerViewController:(id)a4;
- (void)setPIPController:(id)a3;
@end

@implementation SBPIPSceneContentAdapter

- (SBPIPSceneContentAdapter)initWithPIPContentType:(int64_t)a3 sceneManager:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBPIPSceneContentAdapter;
  v8 = [(SBPIPSceneContentAdapter *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_pipContentType = a3;
    objc_storeStrong((id *)&v8->_sceneManager, a4);
    v10 = [(SBSceneManager *)v9->_sceneManager _layoutStateTransitionCoordinator];
    [v10 addObserver:v9];

    v11 = [(SBSceneManager(ChamoisDevelopmentShimming) *)v9->_sceneManager currentLayoutState];
    v9->_effectiveEnvironmentMode = [v11 unlockedEnvironmentMode];
  }
  return v9;
}

- (int64_t)contentTypeForPIPController:(id)a3
{
  return self->_pipContentType;
}

- (BOOL)isStartingStoppingOrCancellingPictureInPictureForPIPController:(id)a3
{
  return 0;
}

- (BOOL)isPresentingPictureInPictureForPIPController:(id)a3 applicationBundleIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  id v7 = [WeakRetained hostedAppSceneHandles];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "application", (void)v16);
        objc_super v13 = [v12 bundleIdentifier];
        char v14 = [v13 isEqualToString:v5];

        if (v14)
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (BOOL)shouldStartPictureInPictureForPIPController:(id)a3 applicationWithProcessIdentifierEnteringBackground:(int)a4 scenePersistenceIdentifier:(id)a5
{
  return 0;
}

- (BOOL)isStoppingOrCancellingPictureForPIPController:(id)a3 applicationWithBundleIdentifier:(id)a4 scenePersistenceIdentifier:(id)a5
{
  return 0;
}

- (int64_t)tetheringModeForScenePersistenceIdentifier:(id)a3
{
  return 0;
}

- (void)setPIPController:(id)a3
{
  id obj = a3;
  p_pipController = &self->_pipController;
  id WeakRetained = objc_loadWeakRetained((id *)p_pipController);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_pipController, obj);
    v6 = obj;
  }
}

- (void)pipController:(id)a3 didAddContainerViewController:(id)a4
{
  id v15 = a4;
  id v5 = [v15 hostedAppSceneHandle];
  if (v5)
  {
    trackedPIPBundleIdentifiers = self->_trackedPIPBundleIdentifiers;
    if (!trackedPIPBundleIdentifiers)
    {
      id v7 = [MEMORY[0x1E4F1CA80] set];
      id v8 = self->_trackedPIPBundleIdentifiers;
      self->_trackedPIPBundleIdentifiers = v7;

      trackedPIPBundleIdentifiers = self->_trackedPIPBundleIdentifiers;
    }
    uint64_t v9 = [v5 application];
    uint64_t v10 = [v9 bundleIdentifier];
    [(NSMutableSet *)trackedPIPBundleIdentifiers addObject:v10];

    [(SBPIPSceneContentAdapter *)self _recalculateLevelAssertions];
    if ([v15 requiresMedusaKeyboard])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
      v12 = [WeakRetained windowSceneManager];
      objc_super v13 = [v12 activeDisplayWindowScene];
      char v14 = [v13 medusaHostedKeyboardWindowController];
      [v14 updateMedusaHostedKeyboardWindow];
    }
  }
}

- (void)pipController:(id)a3 willRemoveContainerViewController:(id)a4
{
  objc_msgSend(a4, "hostedAppSceneHandle", a3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(SBPIPSceneContentAdapter *)self _recalculateLevelAssertions];
  trackedPIPBundleIdentifiers = self->_trackedPIPBundleIdentifiers;
  v6 = [v10 application];
  id v7 = [v6 bundleIdentifier];
  [(NSMutableSet *)trackedPIPBundleIdentifiers removeObject:v7];

  id v8 = [v10 sceneIfExists];
  uint64_t v9 = v8;
  if (v8) {
    [v8 updateSettingsWithBlock:&__block_literal_global_284];
  }
}

uint64_t __76__SBPIPSceneContentAdapter_pipController_willRemoveContainerViewController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setForeground:0];
}

- (BOOL)pipController:(id)a3 willBeginPIPInterruptionForAssertion:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [v5 cameraSensorAttributionBundleIdentifier];
  id v7 = [(SBSceneManager(ChamoisDevelopmentShimming) *)self->_sceneManager currentLayoutState];
  id v8 = [v5 reason];
  uint64_t v9 = SBStringForPIPBehaviorOverrideReason(1uLL);
  char v10 = [v8 isEqualToString:v9];

  v36 = v7;
  v11 = [v7 elementWithRole:3];
  v12 = [v11 workspaceEntity];
  objc_super v13 = [v12 applicationSceneEntity];
  char v14 = [v13 application];
  id v15 = [v14 bundleIdentifier];
  int v16 = [v15 isEqualToString:v6];

  if (v10)
  {
    if (v16)
    {
      long long v17 = SBLogPIP();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        long long v18 = _SBFLoggingMethodProem();
        *(_DWORD *)buf = 138543874;
        v43 = v18;
        __int16 v44 = 2114;
        id v45 = v5;
        __int16 v46 = 2114;
        v47 = v6;
        long long v19 = "%{public}@ NOT stashing PIP for interruption assertion: [%{public}@] bundleIdentifier[%{public}@], as it's"
              " within the floating app";
LABEL_23:
        _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, v19, buf, 0x20u);
      }
    }
    else if ([(NSMutableSet *)self->_interruptingBundleIdentifiersSinceLastTransition containsObject:v6])
    {
      long long v17 = SBLogPIP();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        long long v18 = _SBFLoggingMethodProem();
        *(_DWORD *)buf = 138543874;
        v43 = v18;
        __int16 v44 = 2114;
        id v45 = v5;
        __int16 v46 = 2114;
        v47 = v6;
        long long v19 = "%{public}@ NOT stashing PIP for interruption assertion: [%{public}@] bundleIdentifier[%{public}@], as we w"
              "ere asked about it before";
        goto LABEL_23;
      }
    }
    else if ([(NSMutableSet *)self->_trackedPIPBundleIdentifiers containsObject:v6])
    {
      long long v17 = SBLogPIP();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        long long v18 = _SBFLoggingMethodProem();
        *(_DWORD *)buf = 138543874;
        v43 = v18;
        __int16 v44 = 2114;
        id v45 = v5;
        __int16 v46 = 2114;
        v47 = v6;
        long long v19 = "%{public}@ NOT stashing PIP for interruption assertion: [%{public}@] bundleIdentifier[%{public}@], as it's within PIP";
        goto LABEL_23;
      }
    }
    else
    {
      id v34 = v5;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id obj = [v36 elements];
      uint64_t v20 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v38;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v38 != v22) {
              objc_enumerationMutation(obj);
            }
            v24 = [*(id *)(*((void *)&v37 + 1) + 8 * i) workspaceEntity];
            v25 = [v24 applicationSceneEntity];
            v26 = [v25 application];
            v27 = [v26 bundleIdentifier];
            char v28 = [v27 isEqual:v6];

            if (v28)
            {

              interruptingBundleIdentifiersSinceLastTransition = self->_interruptingBundleIdentifiersSinceLastTransition;
              if (!interruptingBundleIdentifiersSinceLastTransition)
              {
                v32 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
                v33 = self->_interruptingBundleIdentifiersSinceLastTransition;
                self->_interruptingBundleIdentifiersSinceLastTransition = v32;

                interruptingBundleIdentifiersSinceLastTransition = self->_interruptingBundleIdentifiersSinceLastTransition;
              }
              [(NSMutableSet *)interruptingBundleIdentifiersSinceLastTransition addObject:v6];
              BOOL v29 = 1;
              id v5 = v34;
              goto LABEL_25;
            }
          }
          uint64_t v21 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }

      long long v17 = SBLogPIP();
      id v5 = v34;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        long long v18 = _SBFLoggingMethodProem();
        *(_DWORD *)buf = 138543874;
        v43 = v18;
        __int16 v44 = 2114;
        id v45 = v34;
        __int16 v46 = 2114;
        v47 = v6;
        long long v19 = "%{public}@ NOT stashing PIP for interruption assertion: [%{public}@] bundleIdentifier[%{public}@], as it i"
              "sn't within the layout state or in PIP";
        goto LABEL_23;
      }
    }
  }
  else
  {
    long long v17 = SBLogPIP();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      long long v18 = _SBFLoggingMethodProem();
      *(_DWORD *)buf = 138543874;
      v43 = v18;
      __int16 v44 = 2114;
      id v45 = v5;
      __int16 v46 = 2114;
      v47 = v6;
      long long v19 = "%{public}@ NOT stashing PIP for interruption assertion: [%{public}@] bundleIdentifier[%{public}@], because i"
            "t's not due to camera usage";
      goto LABEL_23;
    }
  }

  BOOL v29 = 0;
LABEL_25:

  return v29;
}

- (void)pipController:(id)a3 didUpdateEnhancedWindowingModeEnabled:(BOOL)a4 windowScene:(id)a5
{
  BOOL v5 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  long long v18 = v7;
  uint64_t v9 = [WeakRetained containerViewControllersOnWindowScene:v7];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        char v14 = [*(id *)(*((void *)&v21 + 1) + 8 * v13) hostedAppSceneHandle];
        id v15 = v14;
        if (v14)
        {
          [v14 setWantsEnhancedWindowingEnabled:v5];
          int v16 = [v15 sceneIfExists];
          long long v17 = v16;
          if (v16)
          {
            v19[0] = MEMORY[0x1E4F143A8];
            v19[1] = 3221225472;
            v19[2] = __92__SBPIPSceneContentAdapter_pipController_didUpdateEnhancedWindowingModeEnabled_windowScene___block_invoke;
            v19[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
            BOOL v20 = v5;
            [v16 updateSettingsWithBlock:v19];
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }
}

void __92__SBPIPSceneContentAdapter_pipController_didUpdateEnhancedWindowingModeEnabled_windowScene___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v7 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = v7;
    }
    else {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  id v6 = v5;

  [v6 setEnhancedWindowingEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 toLayoutState];
  int64_t v7 = [v6 unlockedEnvironmentMode];
  if (self->_effectiveEnvironmentMode != v7)
  {
    self->_effectiveEnvironmentMode = v7;
    [(SBPIPSceneContentAdapter *)self _recalculateLevelAssertions];
  }
  long long v22 = v5;
  id v8 = [v5 fromLayoutState];
  uint64_t v9 = [v6 elements];
  long long v23 = objc_msgSend(v9, "bs_map:", &__block_literal_global_4_1);

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v21 = v8;
  uint64_t v10 = [v8 elements];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v15 layoutRole] != 2)
        {
          int v16 = [v15 workspaceEntity];
          long long v17 = [v16 applicationSceneEntity];
          long long v18 = [v17 application];
          long long v19 = [v18 bundleIdentifier];

          if (([v23 containsObject:v19] & 1) == 0)
          {
            [(NSMutableSet *)self->_interruptingBundleIdentifiersSinceLastTransition removeObject:v19];
            if (![(NSMutableSet *)self->_interruptingBundleIdentifiersSinceLastTransition count])
            {
              interruptingBundleIdentifiersSinceLastTransition = self->_interruptingBundleIdentifiersSinceLastTransition;
              self->_interruptingBundleIdentifiersSinceLastTransition = 0;
            }
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }
}

id __99__SBPIPSceneContentAdapter_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 layoutRole];
  if (v3 == 1 || !SBLayoutRoleIsValidForSplitView(v3))
  {
    id v5 = [v2 workspaceEntity];
    id v6 = [v5 applicationSceneEntity];
    int64_t v7 = [v6 application];
    uint64_t v4 = [v7 bundleIdentifier];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_recalculateLevelAssertions
{
  id v11 = [(SBMainDisplaySceneManager *)self->_sceneManager _windowScene];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  if ([WeakRetained isPictureInPictureWindowVisibleOnWindowScene:v11]
    && self->_effectiveEnvironmentMode == 1)
  {
    [WeakRetained windowLevelForWindowScene:v11];
    double v5 = v4 + -1.0;
    dockWindowLevelAssertion = self->_dockWindowLevelAssertion;
    if (dockWindowLevelAssertion)
    {
      [(SBFloatingDockWindowLevelAssertion *)dockWindowLevelAssertion level];
      if (v7 == v5) {
        goto LABEL_9;
      }
      dockWindowLevelAssertion = self->_dockWindowLevelAssertion;
    }
    [(SBFloatingDockWindowLevelAssertion *)dockWindowLevelAssertion invalidate];
    id v8 = [v11 floatingDockController];
    uint64_t v9 = [[SBFloatingDockWindowLevelAssertion alloc] initWithFloatingDockController:v8 priority:3 level:@"SBSystemNotesContentViewController" reason:v5];
    uint64_t v10 = self->_dockWindowLevelAssertion;
    self->_dockWindowLevelAssertion = v9;
  }
  else
  {
    [(SBFloatingDockWindowLevelAssertion *)self->_dockWindowLevelAssertion invalidate];
    id v8 = self->_dockWindowLevelAssertion;
    self->_dockWindowLevelAssertion = 0;
  }

LABEL_9:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptingBundleIdentifiersSinceLastTransition, 0);
  objc_storeStrong((id *)&self->_dockWindowLevelAssertion, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_trackedPIPBundleIdentifiers, 0);
  objc_destroyWeak((id *)&self->_pipController);
}

@end
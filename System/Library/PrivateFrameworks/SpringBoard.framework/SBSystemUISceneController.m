@interface SBSystemUISceneController
+ (id)_setupInfo;
- (BOOL)_isAllowedToRecreateSceneOnConnectingWindowScene:(id)a3;
- (BOOL)enumerateScenesWithBlock:(id)a3;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleHomeButtonLongPress;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVoiceCommandButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (NSString)debugDescription;
- (NSString)jobLabel;
- (NSString)traitsRole;
- (RBSProcessIdentity)clientProcessIdentity;
- (SBFSceneWorkspaceController)sceneWorkspaceController;
- (SBFSceneWorkspaceDefaultDelegate)sceneWorkspaceControllerDelegate;
- (SBSystemUISceneController)initWithSceneWorkspaceIdentifier:(id)a3 clientProcessIdentity:(id)a4 sceneVendingPolicy:(int64_t)a5 traitsRole:(id)a6 jobLabel:(id)a7 level:(double)a8;
- (SBSystemUISceneDefaultPresenter)defaultPresenter;
- (double)level;
- (id)__newSceneIdentifierForWindowScene:(id)a3;
- (id)__sceneFutureIdentifierForWindowScene:(id)a3 level:(double)a4;
- (id)_continuityPresenterForDisplayIdentity:(id)a3 level:(double)a4;
- (id)_newAppSceneRequestOptionsForWindowScene:(id)a3 withBlueprintOptions:(id)a4;
- (id)_newSceneControllerForWindowScene:(id)a3 sceneRequestOptions:(id)a4 traitsRole:(id)a5 level:(double)a6;
- (id)_newSceneControllerForWindowScene:(id)a3 withSceneRequestOptions:(id)a4;
- (id)_presenterArray;
- (id)addPresenter:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)sceneFromIdentityToken:(id)a3;
- (id)sceneFromIdentityTokenStringRepresentation:(id)a3;
- (id)sceneWorkspaceControllerForProcessIdentity:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)sceneVendingPolicy;
- (void)_evaluateAvailablePresenters:(id)a3 forSceneControllers:(id)a4;
- (void)_invalidateAllSceneControllers;
- (void)_invalidateSceneControllersForWindowScene:(id)a3;
- (void)_setNeedsPresentersEvaluation;
- (void)_updateClientProcess:(id)a3;
- (void)_updateShouldHideForSecureMode;
- (void)activateSceneForProcessIdentity:(id)a3 withHandle:(id)a4 options:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)destroyScenesWithPersistentIdentifiers:(id)a3 processIdentity:(id)a4 completion:(id)a5;
- (void)processDidExit:(id)a3;
- (void)processManager:(id)a3 didAddProcess:(id)a4;
- (void)processManager:(id)a3 didRemoveProcess:(id)a4;
- (void)setDefaultPresenter:(id)a3;
- (void)setSceneWorkspaceControllerDelegate:(id)a3;
- (void)windowSceneDidConnect:(id)a3;
- (void)windowSceneDidDisconnect:(id)a3;
@end

@implementation SBSystemUISceneController

- (void)processManager:(id)a3 didAddProcess:(id)a4
{
  id v5 = a4;
  v6 = [v5 identity];
  int v7 = [v6 isEqual:self->_clientProcessIdentity];

  if (v7)
  {
    [v5 addObserver:self];
    id v8 = v5;
    BSDispatchMain();
  }
}

- (NSString)jobLabel
{
  return self->_jobLabel;
}

- (BOOL)enumerateScenesWithBlock:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  LOBYTE(self) = [(SBFSceneWorkspaceController *)self->_sceneWorkspaceController enumerateScenesWithBlock:v4];

  return (char)self;
}

- (void)_setNeedsPresentersEvaluation
{
  id v3 = [(SBSystemUISceneController *)self _presenterArray];
  [(SBSystemUISceneController *)self _evaluateAvailablePresenters:v3 forSceneControllers:self->_sceneControllers];
}

- (void)_evaluateAvailablePresenters:(id)a3 forSceneControllers:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = a4;
  uint64_t v33 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v40;
    v28 = self;
    id v29 = v6;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v40 != v32) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v9 = [v8 sceneOptions];
        v34 = v9;
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          v12 = 0;
LABEL_19:
          id v13 = 0;
          char v19 = 1;
          goto LABEL_24;
        }
        id v10 = [v9 scenePlacementConfiguration];
        char v11 = objc_opt_respondsToSelector();
        if (v11)
        {
          v12 = [v10 targetSceneIdentity];

          if (!v12) {
            goto LABEL_19;
          }
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v10 = v6;
          id v13 = (id)[v10 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v13)
          {
            char v30 = v11;
            uint64_t v14 = *(void *)v36;
            while (2)
            {
              for (j = 0; j != v13; j = (char *)j + 1)
              {
                if (*(void *)v36 != v14) {
                  objc_enumerationMutation(v10);
                }
                v16 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
                v17 = [v16 parentSceneIdentityToken];
                int v18 = [v17 isEqual:v12];

                if (v18)
                {
                  id v13 = v16;
                  goto LABEL_22;
                }
              }
              id v13 = (id)[v10 countByEnumeratingWithState:&v35 objects:v43 count:16];
              if (v13) {
                continue;
              }
              break;
            }
LABEL_22:
            self = v28;
            id v6 = v29;
            char v11 = v30;
          }
        }
        else
        {
          v12 = 0;
          id v13 = 0;
        }
        char v19 = v11 ^ 1;

LABEL_24:
        v20 = [v8 targetDisplayConfiguration];
        v21 = [v20 identity];

        if ([v21 isContinuityDisplay])
        {
          v22 = [v8 scene];
          v23 = [v22 settings];
          [v23 level];
          v24 = -[SBSystemUISceneController _continuityPresenterForDisplayIdentity:level:](self, "_continuityPresenterForDisplayIdentity:level:", v21);

          [v8 setPresenter:v24];
        }
        else if (v13)
        {
          [v8 setPresenter:v13];
        }
        else if (v19)
        {
          v25 = [v6 lastObject];
          defaultPresenter = v25;
          if (!v25) {
            defaultPresenter = self->_defaultPresenter;
          }
          v27 = defaultPresenter;

          [v8 setPresenter:v27];
        }
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v33);
  }
}

- (id)addPresenter:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBSystemUISceneController.m", 225, @"Invalid parameter not satisfying: %@", @"presenter" object file lineNumber description];
  }
  id v6 = [(SBSystemUISceneController *)self _presenterArray];
  int v7 = [v6 containsObject:v5];

  if (v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBSystemUISceneController.m", 226, @"presenter was already added: %@", v5 object file lineNumber description];
  }
  objc_initWeak(&location, self);
  objc_initWeak(&from, v5);
  id v8 = objc_alloc(MEMORY[0x1E4F4F838]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __42__SBSystemUISceneController_addPresenter___block_invoke;
  v17[3] = &unk_1E6B0DDC8;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  v9 = (void *)[v8 initWithIdentifier:@"SBSystemUISceneController" forReason:@"_initiallyPendedPresenters" invalidationBlock:v17];
  if (objc_opt_respondsToSelector()) {
    [v5 setPresentingDelegate:self];
  }
  presenters = self->_presenters;
  if (presenters)
  {
    char v11 = presenters;
  }
  else
  {
    char v11 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
  }
  v12 = self->_presenters;
  self->_presenters = v11;

  [(NSPointerArray *)self->_presenters addPointer:v5];
  [(NSPointerArray *)self->_presenters compact];
  id v13 = [(SBSystemUISceneController *)self _presenterArray];
  [(SBSystemUISceneController *)self _evaluateAvailablePresenters:v13 forSceneControllers:self->_sceneControllers];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v9;
}

- (id)_presenterArray
{
  return [(NSPointerArray *)self->_presenters allObjects];
}

+ (id)_setupInfo
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];

  return (id)MEMORY[0x1E4F1CC08];
}

- (SBSystemUISceneController)initWithSceneWorkspaceIdentifier:(id)a3 clientProcessIdentity:(id)a4 sceneVendingPolicy:(int64_t)a5 traitsRole:(id)a6 jobLabel:(id)a7 level:(double)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_10:
    v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2, self, @"SBSystemUISceneController.m", 112, @"Invalid parameter not satisfying: %@", @"clientProcessIdentity" object file lineNumber description];

    if (v17) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  uint64_t v45 = [MEMORY[0x1E4F28B00] currentHandler];
  [v45 handleFailureInMethod:a2, self, @"SBSystemUISceneController.m", 111, @"Invalid parameter not satisfying: %@", @"workspaceIdentifier" object file lineNumber description];

  if (!v16) {
    goto LABEL_10;
  }
LABEL_3:
  if (v17) {
    goto LABEL_4;
  }
LABEL_11:
  v47 = [MEMORY[0x1E4F28B00] currentHandler];
  [v47 handleFailureInMethod:a2, self, @"SBSystemUISceneController.m", 113, @"Invalid parameter not satisfying: %@", @"traitsRole" object file lineNumber description];

LABEL_4:
  v50.receiver = self;
  v50.super_class = (Class)SBSystemUISceneController;
  id v19 = [(SBSystemUISceneController *)&v50 init];
  v20 = v19;
  if (v19)
  {
    v19->_level = a8;
    uint64_t v21 = [v18 copy];
    jobLabel = v20->_jobLabel;
    v20->_jobLabel = (NSString *)v21;

    uint64_t v23 = [v17 copy];
    traitsRole = v20->_traitsRole;
    v20->_traitsRole = (NSString *)v23;

    v20->_sceneVendingPolicy = a5;
    uint64_t v25 = [MEMORY[0x1E4F1CA48] array];
    sceneControllers = v20->_sceneControllers;
    v20->_sceneControllers = (NSMutableArray *)v25;

    objc_storeStrong((id *)&v20->_clientProcessIdentity, a4);
    uint64_t v27 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    sceneControllersByDisplayIdentity = v20->_sceneControllersByDisplayIdentity;
    v20->_sceneControllersByDisplayIdentity = (NSMapTable *)v27;

    uint64_t v29 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    continuityPresentersByLevelForDisplayIdentity = v20->_continuityPresentersByLevelForDisplayIdentity;
    v20->_continuityPresentersByLevelForDisplayIdentity = (NSMapTable *)v29;

    uint64_t v31 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    continuityFuturesByLevelForDisplayIdentity = v20->_continuityFuturesByLevelForDisplayIdentity;
    v20->_continuityFuturesByLevelForDisplayIdentity = (NSMapTable *)v31;

    uint64_t v33 = (SBFSceneWorkspaceDefaultDelegate *)objc_alloc_init(MEMORY[0x1E4FA5FD0]);
    sceneWorkspaceControllerDelegate = v20->_sceneWorkspaceControllerDelegate;
    v20->_sceneWorkspaceControllerDelegate = v33;

    uint64_t v35 = [objc_alloc(MEMORY[0x1E4FA5FC8]) initWithIdentifier:v15 delegate:v20->_sceneWorkspaceControllerDelegate];
    sceneWorkspaceController = v20->_sceneWorkspaceController;
    v20->_sceneWorkspaceController = (SBFSceneWorkspaceController *)v35;

    if ((unint64_t)(v20->_sceneVendingPolicy - 1) <= 2)
    {
      long long v37 = [MEMORY[0x1E4F62448] sharedInstance];
      long long v38 = [v37 processForIdentity:v20->_clientProcessIdentity];
      [(SBSystemUISceneController *)v20 _updateClientProcess:v38];

      [(FBProcess *)v20->_clientProcess addObserver:v20];
      long long v39 = [MEMORY[0x1E4F62448] sharedInstance];
      [v39 addObserver:v20];
    }
    objc_initWeak(&location, v20);
    id v40 = MEMORY[0x1E4F14428];
    long long v41 = [NSString stringWithFormat:@"SpringBoard - SystemUISceneController - %@", v18];
    objc_copyWeak(&v48, &location);
    uint64_t v42 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureInvalidatable = v20->_stateCaptureInvalidatable;
    v20->_stateCaptureInvalidatable = (BSInvalidatable *)v42;

    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
  }

  return v20;
}

id __129__SBSystemUISceneController_initWithSceneWorkspaceIdentifier_clientProcessIdentity_sceneVendingPolicy_traitsRole_jobLabel_level___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained descriptionWithMultilinePrefix:0];

  return v2;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F62448] sharedInstance];
  [v3 removeObserver:self];

  [(FBProcess *)self->_clientProcess removeObserver:self];
  [(BSInvalidatable *)self->_stateCaptureInvalidatable invalidate];
  [(SBFSceneWorkspaceController *)self->_sceneWorkspaceController invalidate];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(SBSystemUISceneController *)self _presenterArray];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) cancel];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)SBSystemUISceneController;
  [(SBSystemUISceneController *)&v9 dealloc];
}

- (void)windowSceneDidConnect:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  sceneControllersByDisplayIdentity = self->_sceneControllersByDisplayIdentity;
  uint64_t v7 = [v5 _fbsDisplayIdentity];
  uint64_t v8 = [(NSMapTable *)sceneControllersByDisplayIdentity objectForKey:v7];

  if (v8)
  {
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
  }
  if (self->_sceneVendingPolicy >= 2uLL)
  {
    objc_super v9 = [(NSMapTable *)self->_sceneControllersByDisplayIdentity keyEnumerator];
    long long v10 = v9;
    if (self->_sceneVendingPolicy != 3
      || ([v9 nextObject], long long v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
    {
      long long v12 = [(NSMapTable *)self->_sceneControllersByDisplayIdentity objectEnumerator];
      long long v13 = [v12 allObjects];
      uint64_t v14 = objc_msgSend(v13, "bs_filter:", &__block_literal_global_402);
      uint64_t v15 = [v14 firstObject];

      if (v15)
      {
        uint64_t v31 = v12;
        uint64_t v32 = v10;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        char v30 = v15;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          id v19 = 0;
          uint64_t v20 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v34 != v20) {
                objc_enumerationMutation(v16);
              }
              v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              uint64_t v23 = [v22 scene];
              BOOL v24 = [(SBSystemUISceneController *)self _isAllowedToRecreateSceneOnConnectingWindowScene:v23];

              if (v24)
              {
                uint64_t v25 = [v22 sceneOptions];
                id v26 = [(SBSystemUISceneController *)self _newAppSceneRequestOptionsForWindowScene:v5 withBlueprintOptions:v25];

                id v27 = [(SBSystemUISceneController *)self _newSceneControllerForWindowScene:v5 withSceneRequestOptions:v26];
                objc_msgSend(v27, "setSceneActive:", objc_msgSend(v22, "isSceneActive"));

                id v19 = v27;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
          }
          while (v18);
        }
        else
        {
          id v19 = 0;
        }

        long long v12 = v31;
        long long v10 = v32;
        uint64_t v15 = v30;
      }
      else
      {
        id v28 = [(SBSystemUISceneController *)self _newAppSceneRequestOptionsForWindowScene:v5 withBlueprintOptions:0];
        id v19 = [(SBSystemUISceneController *)self _newSceneControllerForWindowScene:v5 withSceneRequestOptions:v28];
      }
    }
  }
}

BOOL __51__SBSystemUISceneController_windowSceneDidConnect___block_invoke(uint64_t a1, void *a2)
{
  return [a2 count] != 0;
}

- (void)windowSceneDidDisconnect:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_sceneVendingPolicy)
  {
    if (!self->_sceneControllers)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    }
    [(SBSystemUISceneController *)self _invalidateSceneControllersForWindowScene:v5];
    if ([v5 isContinuityDisplayWindowScene])
    {
      uint64_t v6 = [v5 _fbsDisplayIdentity];
      uint64_t v7 = SBLogSystemUIScene();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        long long v10 = v6;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Continuity display %{public}@ disconnected", (uint8_t *)&v9, 0xCu);
      }

      [(NSMapTable *)self->_continuityPresentersByLevelForDisplayIdentity removeObjectForKey:v6];
      [(NSMapTable *)self->_continuityFuturesByLevelForDisplayIdentity removeObjectForKey:v6];
    }
  }
}

void __42__SBSystemUISceneController_addPresenter___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained[6] count];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = 0;
      while ((id)[WeakRetained[6] pointerAtIndex:v5] != v2)
      {
        if (v4 == ++v5) {
          goto LABEL_8;
        }
      }
      [WeakRetained[6] removePointerAtIndex:v5];
      uint64_t v6 = [WeakRetained _presenterArray];
      [WeakRetained _evaluateAvailablePresenters:v6 forSceneControllers:WeakRetained[5]];
    }
  }
LABEL_8:
}

- (id)_newSceneControllerForWindowScene:(id)a3 sceneRequestOptions:(id)a4 traitsRole:(id)a5 level:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v13)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_9:
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SBSystemUISceneController.m", 304, @"Invalid parameter not satisfying: %@", @"windowScene" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_10;
  }
  uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"SBSystemUISceneController.m", 303, @"Invalid parameter not satisfying: %@", @"traitsRole" object file lineNumber description];

  if (!v11) {
    goto LABEL_9;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_10:
  uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"SBSystemUISceneController.m", 305, @"Invalid parameter not satisfying: %@", @"sceneRequestOptions" object file lineNumber description];

LABEL_4:
  uint64_t v14 = [v11 _fbsDisplayConfiguration];
  uint64_t v15 = [v14 identity];
  id v16 = [[SBSingleSceneController alloc] initWithSceneWorkspaceController:self->_sceneWorkspaceController sceneRequestOptions:v12 clientIdentity:self->_clientProcessIdentity traitsRole:v13 level:a6];
  [(SBSingleSceneController *)v16 setTargetDisplayConfiguration:v14];
  [(SBSingleSceneController *)v16 setShouldForegroundForDisplayConfiguration:1];
  [(SBSingleSceneController *)v16 setShouldActivateUponClientConnection:self->_sceneVendingPolicy == 2];
  [(SBSystemUISceneController *)self _updateShouldHideForSecureMode];
  uint64_t v17 = [(NSMapTable *)self->_sceneControllersByDisplayIdentity objectForKey:v15];
  if (v17)
  {
    uint64_t v18 = v17;
    [v17 addObject:v16];
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA48] arrayWithObject:v16];
  }
  [(NSMapTable *)self->_sceneControllersByDisplayIdentity setObject:v18 forKey:v15];
  [(NSMutableArray *)self->_sceneControllers addObject:v16];
  id v19 = [(SBSystemUISceneController *)self _presenterArray];
  [(SBSystemUISceneController *)self _evaluateAvailablePresenters:v19 forSceneControllers:self->_sceneControllers];

  return v16;
}

- (BOOL)_isAllowedToRecreateSceneOnConnectingWindowScene:(id)a3
{
  return 1;
}

- (void)_invalidateSceneControllersForWindowScene:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 _fbsDisplayIdentity];
  uint64_t v5 = [(NSMapTable *)self->_sceneControllersByDisplayIdentity objectForKey:v4];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__SBSystemUISceneController__invalidateSceneControllersForWindowScene___block_invoke;
  v15[3] = &unk_1E6B0DDF0;
  v15[4] = self;
  uint64_t v6 = objc_msgSend(v5, "bs_filter:", v15);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) invalidate];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }
  [(NSMutableArray *)self->_sceneControllers removeObjectsInArray:v6];
  [(NSMapTable *)self->_sceneControllersByDisplayIdentity removeObjectForKey:v4];
}

uint64_t __71__SBSystemUISceneController__invalidateSceneControllersForWindowScene___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) containsObject:a2];
}

- (void)_invalidateAllSceneControllers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(id)SBApp windowSceneManager];
  uint64_t v4 = [v3 connectedWindowScenes];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[SBSystemUISceneController _invalidateSceneControllersForWindowScene:](self, "_invalidateSceneControllersForWindowScene:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_newAppSceneRequestOptionsForWindowScene:(id)a3 withBlueprintOptions:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F42D88];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  id v10 = [(SBSystemUISceneController *)self __newSceneIdentifierForWindowScene:v8];

  [v9 setIdentifier:v10];
  long long v11 = [v6 specification];
  if (v11)
  {
    [v9 setSpecification:v11];
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F42788]);
    [v9 setSpecification:v12];
  }
  long long v13 = [v6 actions];
  [v9 setActions:v13];

  long long v14 = [v6 initialClientSettings];
  [v9 setInitialClientSettings:v14];

  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    uint64_t v15 = [v6 scenePlacementConfiguration];
    [v9 setScenePlacementConfiguration:v15];
  }
  return v9;
}

- (id)__newSceneIdentifierForWindowScene:(id)a3
{
  ++self->_sceneIDGeneration;
  sceneWorkspaceController = self->_sceneWorkspaceController;
  id v5 = a3;
  id v6 = [(SBFSceneWorkspaceController *)sceneWorkspaceController sceneWorkspaceIdentifier];
  uint64_t v7 = [v6 componentsSeparatedByString:@"."];
  id v8 = [v7 lastObject];

  id v9 = NSString;
  id v10 = [v5 _fbsDisplayIdentity];

  long long v11 = [v10 description];
  id v12 = [v9 stringWithFormat:@"SUIS-%@:[%@] - %lu", v8, v11, self->_sceneIDGeneration];

  return v12;
}

- (id)_newSceneControllerForWindowScene:(id)a3 withSceneRequestOptions:(id)a4
{
  return [(SBSystemUISceneController *)self _newSceneControllerForWindowScene:a3 sceneRequestOptions:a4 traitsRole:self->_traitsRole level:self->_level];
}

- (id)__sceneFutureIdentifierForWindowScene:(id)a3 level:(double)a4
{
  sceneWorkspaceController = self->_sceneWorkspaceController;
  id v6 = a3;
  uint64_t v7 = [(SBFSceneWorkspaceController *)sceneWorkspaceController sceneWorkspaceIdentifier];
  id v8 = [v7 componentsSeparatedByString:@"."];
  id v9 = [v8 lastObject];

  id v10 = NSString;
  long long v11 = [v6 _fbsDisplayIdentity];

  id v12 = [v11 description];
  long long v13 = [v10 stringWithFormat:@"SUIS-Future-%@:[%@][%f]", v9, v12, *(void *)&a4];

  return v13;
}

- (id)_continuityPresenterForDisplayIdentity:(id)a3 level:(double)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(NSMapTable *)self->_continuityPresentersByLevelForDisplayIdentity objectForKey:v6];
  id v8 = [NSNumber numberWithDouble:a4];
  id v9 = [v7 objectForKey:v8];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    long long v11 = [(id)SBApp windowSceneManager];
    id v12 = [v11 windowSceneForDisplayIdentity:v6];

    long long v13 = [v12 _FBSScene];
    long long v14 = [v13 workspaceService];
    uint64_t v15 = [v12 _fbsDisplayConfiguration];
    id v16 = [(SBSystemUISceneController *)self __sceneFutureIdentifierForWindowScene:v12 level:a4];
    uint64_t v17 = [v13 settings];
    [v17 frame];
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    uint64_t v23 = v22;
    uint64_t v25 = v24;

    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __74__SBSystemUISceneController__continuityPresenterForDisplayIdentity_level___block_invoke;
    v50[3] = &unk_1E6B0DE68;
    id v26 = v16;
    id v51 = v26;
    id v27 = v15;
    id v52 = v27;
    uint64_t v53 = v19;
    uint64_t v54 = v21;
    uint64_t v55 = v23;
    uint64_t v56 = v25;
    double v57 = a4;
    v47 = v14;
    id v28 = [v14 createScene:v50];
    if (v28)
    {
      id v43 = v27;
      v46 = v13;
      uint64_t v29 = SBLogSystemUIScene();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        char v30 = [v28 identifier];
        *(_DWORD *)buf = 138543362;
        v59 = v30;
        _os_log_impl(&dword_1D85BA000, v29, OS_LOG_TYPE_DEFAULT, "Scene future %{public}@ created", buf, 0xCu);
      }
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __74__SBSystemUISceneController__continuityPresenterForDisplayIdentity_level___block_invoke_107;
      v48[3] = &unk_1E6AF8948;
      id v31 = v26;
      id v49 = v31;
      [v28 activateWithCompletion:v48];
      uint64_t v32 = [(NSMapTable *)self->_continuityFuturesByLevelForDisplayIdentity objectForKey:v6];
      if (!v32)
      {
        uint64_t v32 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
        [(NSMapTable *)self->_continuityFuturesByLevelForDisplayIdentity setObject:v32 forKey:v6];
      }
      long long v33 = objc_msgSend(NSNumber, "numberWithDouble:", a4, v43);
      [v32 setObject:v28 forKey:v33];

      long long v34 = [v28 delegate];
      uint64_t v35 = objc_opt_class();
      id v36 = v34;
      if (v35)
      {
        if (objc_opt_isKindOfClass()) {
          long long v37 = v36;
        }
        else {
          long long v37 = 0;
        }
      }
      else
      {
        long long v37 = 0;
      }
      id v45 = v26;
      id v39 = v37;

      if (v39)
      {
        id v10 = [[SBSystemUISceneDefaultPresenter alloc] initWithWindowHostingPresentationOnWindowScene:v39];
        id v40 = [(NSMapTable *)self->_continuityPresentersByLevelForDisplayIdentity objectForKey:v6];
        if (!v40)
        {
          id v40 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
          [(NSMapTable *)self->_continuityPresentersByLevelForDisplayIdentity setObject:v40 forKey:v6];
        }
        long long v41 = [NSNumber numberWithDouble:a4];
        [v40 setObject:v10 forKey:v41];
      }
      else
      {
        id v40 = SBLogSystemUIScene();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          -[SBSystemUISceneController _continuityPresenterForDisplayIdentity:level:]((uint64_t)v31, v40);
        }
        id v10 = 0;
      }
      uint64_t v38 = v47;

      id v26 = v45;
      long long v13 = v46;
      id v27 = v44;
    }
    else
    {
      id v10 = 0;
      uint64_t v38 = v47;
    }
  }
  return v10;
}

void __74__SBSystemUISceneController__continuityPresenterForDisplayIdentity_level___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setIdentifier:v3];
  id v5 = objc_opt_new();
  [v4 setSpecification:v5];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__SBSystemUISceneController__continuityPresenterForDisplayIdentity_level___block_invoke_2;
  v7[3] = &unk_1E6B0DE40;
  id v8 = *(id *)(a1 + 40);
  long long v6 = *(_OWORD *)(a1 + 64);
  long long v9 = *(_OWORD *)(a1 + 48);
  long long v10 = v6;
  uint64_t v11 = *(void *)(a1 + 80);
  [v4 configureParameters:v7];
}

void __74__SBSystemUISceneController__continuityPresenterForDisplayIdentity_level___block_invoke_2(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__SBSystemUISceneController__continuityPresenterForDisplayIdentity_level___block_invoke_3;
  v7[3] = &unk_1E6B0DE18;
  id v8 = *(id *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 56);
  long long v9 = *(_OWORD *)(a1 + 40);
  long long v10 = v4;
  id v5 = a2;
  [v5 updateSettingsWithBlock:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__SBSystemUISceneController__continuityPresenterForDisplayIdentity_level___block_invoke_4;
  v6[3] = &__block_descriptor_40_e39_v16__0__FBSMutableSceneClientSettings_8l;
  v6[4] = *(void *)(a1 + 72);
  [v5 updateClientSettingsWithBlock:v6];
}

void __74__SBSystemUISceneController__continuityPresenterForDisplayIdentity_level___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setForeground:1];
  [v3 setDisplayConfiguration:*(void *)(a1 + 32)];
  objc_msgSend(v3, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __74__SBSystemUISceneController__continuityPresenterForDisplayIdentity_level___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setPreferredLevel:*(double *)(a1 + 32)];
}

void __74__SBSystemUISceneController__continuityPresenterForDisplayIdentity_level___block_invoke_107(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v6 = SBLogSystemUIScene();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543874;
    uint64_t v9 = v7;
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Scene future %{public}@ creation complete %u error %{public}@", (uint8_t *)&v8, 0x1Cu);
  }
}

- (void)activateSceneForProcessIdentity:(id)a3 withHandle:(id)a4 options:(id)a5 completion:(id)a6
{
  v76[1] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  int v11 = (void (**)(id, void, void *))a6;
  BSDispatchQueueAssertMain();
  if (v10)
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2, self, @"SBSystemUISceneController.m", 472, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];

    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v54 = [MEMORY[0x1E4F28B00] currentHandler];
  [v54 handleFailureInMethod:a2, self, @"SBSystemUISceneController.m", 473, @"Invalid parameter not satisfying: %@", @"processIdentity" object file lineNumber description];

LABEL_3:
  if (!self->_sceneVendingPolicy)
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = SBSystemUISceneControllerErrorDomain;
    uint64_t v75 = *MEMORY[0x1E4F28568];
    v76[0] = @"The controller policy doesn't allow to handle this request";
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:&v75 count:1];
    __int16 v12 = [v24 errorWithDomain:v25 code:2 userInfo:v26];

    v11[2](v11, 0, v12);
    goto LABEL_44;
  }
  __int16 v12 = [v10 identifier];
  v58 = v10;
  if (!v12)
  {
    id v27 = [(id)SBApp windowSceneManager];
    id v28 = v27;
    if (self->_sceneVendingPolicy == 1)
    {
      uint64_t v29 = (void *)MEMORY[0x1E4F1CAD0];
      char v30 = [v27 activeDisplayWindowScene];
      id v31 = [v29 setWithObject:v30];
    }
    else
    {
      id v31 = [v27 connectedWindowScenes];
    }
    if (![v31 count]) {
      goto LABEL_42;
    }
    uint64_t v56 = v28;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v55 = v31;
    id obja = v31;
    uint64_t v32 = [obja countByEnumeratingWithState:&v61 objects:v71 count:16];
    if (!v32)
    {
      id v48 = v11;
      goto LABEL_41;
    }
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v62;
    uint64_t v57 = *MEMORY[0x1E4F28568];
    while (1)
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v62 != v34) {
          objc_enumerationMutation(obja);
        }
        id v36 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        sceneControllersByDisplayIdentity = self->_sceneControllersByDisplayIdentity;
        uint64_t v38 = [v36 _fbsDisplayIdentity];
        id v39 = [(NSMapTable *)sceneControllersByDisplayIdentity objectForKey:v38];
        unint64_t v40 = [v39 count];

        if (v40 > 4)
        {
          if (!v11) {
            goto LABEL_34;
          }
          v44 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v45 = SBSystemUISceneControllerErrorDomain;
          uint64_t v69 = v57;
          v46 = objc_msgSend(NSString, "stringWithFormat:", @"Reached maximum allowed number of scenes per display (%d)", 5);
          v70 = v46;
          v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
          id v41 = [v44 errorWithDomain:v45 code:5 userInfo:v47];

          id v10 = v58;
          v11[2](v11, 0, v41);
          id v42 = v11;
        }
        else
        {
          id v41 = [(SBSystemUISceneController *)self _newAppSceneRequestOptionsForWindowScene:v36 withBlueprintOptions:v10];
          id v42 = [(SBSystemUISceneController *)self _newSceneControllerForWindowScene:v36 withSceneRequestOptions:v41];
          [v42 setSceneActive:1];
          if (v11)
          {
            id v43 = [v42 scene];
            ((void (**)(id, void *, void *))v11)[2](v11, v43, 0);
          }
        }

LABEL_34:
        int v11 = 0;
      }
      uint64_t v33 = [obja countByEnumeratingWithState:&v61 objects:v71 count:16];
      int v11 = 0;
      id v48 = 0;
      if (!v33)
      {
LABEL_41:

        int v11 = v48;
        id v28 = v56;
        __int16 v12 = 0;
        id v31 = v55;
LABEL_42:

        goto LABEL_43;
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_39;
  }
  id v13 = [v10 scenePlacementConfiguration];
  char v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) == 0) {
    goto LABEL_39;
  }
  uint64_t v15 = v12;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = self->_sceneControllers;
  uint64_t v16 = [(NSMutableArray *)obj countByEnumeratingWithState:&v65 objects:v74 count:16];
  if (!v16)
  {
LABEL_17:

    id v10 = v58;
    __int16 v12 = v15;
LABEL_39:
    objc_super v50 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v51 = SBSystemUISceneControllerErrorDomain;
    uint64_t v72 = *MEMORY[0x1E4F28568];
    v73 = @"Tried to re-activate an unknown scene session";
    id v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
    id v28 = [v50 errorWithDomain:v51 code:3 userInfo:v52];

    v11[2](v11, 0, v28);
    int v11 = 0;
    goto LABEL_43;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v66;
LABEL_9:
  uint64_t v19 = 0;
  while (1)
  {
    if (*(void *)v66 != v18) {
      objc_enumerationMutation(obj);
    }
    uint64_t v20 = *(void **)(*((void *)&v65 + 1) + 8 * v19);
    uint64_t v21 = [v20 scenePersistentIdentifier];
    int v22 = [v21 isEqualToString:v15];

    if (!v22) {
      goto LABEL_15;
    }
    uint64_t v23 = [v20 sceneOptions];
    if (objc_opt_respondsToSelector()) {
      break;
    }

LABEL_15:
    if (v17 == ++v19)
    {
      uint64_t v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v65 objects:v74 count:16];
      if (v17) {
        goto LABEL_9;
      }
      goto LABEL_17;
    }
  }
  id v10 = v58;
  id v49 = [v58 scenePlacementConfiguration];
  [v23 setScenePlacementConfiguration:v49];

  id v28 = [v20 scene];

  __int16 v12 = v15;
  if (!v28) {
    goto LABEL_39;
  }
  ((void (**)(id, void *, void *))v11)[2](v11, v28, 0);
  [(SBSystemUISceneController *)self _setNeedsPresentersEvaluation];
LABEL_43:

LABEL_44:
}

- (void)destroyScenesWithPersistentIdentifiers:(id)a3 processIdentity:(id)a4 completion:(id)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  BSDispatchQueueAssertMain();
  if (!v9)
  {
    id v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:a2, self, @"SBSystemUISceneController.m", 544, @"Invalid parameter not satisfying: %@", @"persistentIdentifiers" object file lineNumber description];
  }
  objc_super v50 = (void (**)(void, void, void))v10;
  if (!a4)
  {
    id v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, self, @"SBSystemUISceneController.m", 545, @"Invalid parameter not satisfying: %@", @"processIdentity" object file lineNumber description];
  }
  uint64_t v54 = [(NSMapTable *)self->_sceneControllersByDisplayIdentity keyEnumerator];
  int v11 = [(NSMutableArray *)self->_sceneControllers firstObject];
  __int16 v12 = [v11 scene];
  id v13 = [v12 clientHandle];
  char v14 = [v13 processHandle];
  uint64_t v15 = [v14 pid];

  clientProcess = self->_clientProcess;
  if (clientProcess)
  {
    uint64_t v51 = clientProcess;
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F62448] sharedInstance];
    uint64_t v51 = [v17 processForPID:v15];
  }
  uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  uint64_t v19 = [v54 nextObject];
  id v53 = v9;
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    id v52 = self;
    do
    {
      uint64_t v21 = [(NSMapTable *)self->_sceneControllersByDisplayIdentity objectForKey:v20];
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __95__SBSystemUISceneController_destroyScenesWithPersistentIdentifiers_processIdentity_completion___block_invoke;
      v63[3] = &unk_1E6B0DDF0;
      id v64 = v9;
      int v22 = objc_msgSend(v21, "bs_filter:", v63);
      if ([v22 count])
      {
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v23 = v22;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v59 objects:v68 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v60;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v60 != v26) {
                objc_enumerationMutation(v23);
              }
              id v28 = *(void **)(*((void *)&v59 + 1) + 8 * i);
              uint64_t v29 = [v28 scenePersistentIdentifier];
              [v18 addObject:v29];
              [v28 invalidate];
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v59 objects:v68 count:16];
          }
          while (v25);
        }

        self = v52;
        [(NSMutableArray *)v52->_sceneControllers removeObjectsInArray:v23];
        [v21 removeObjectsInArray:v23];
        char v30 = (void *)[(NSMutableArray *)v52->_sceneControllers copy];
        [(SBSystemUISceneController *)v52 _activeSceneControllersAfterRemoving:v30];

        id v9 = v53;
      }

      uint64_t v31 = [v54 nextObject];

      uint64_t v20 = (void *)v31;
    }
    while (v31);
  }
  uint64_t v32 = v51;
  if ([v18 count])
  {
    if (v51)
    {
      uint64_t v33 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v18, "count"));
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v34 = v18;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v55 objects:v67 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v56;
        do
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v56 != v37) {
              objc_enumerationMutation(v34);
            }
            uint64_t v39 = *(void *)(*((void *)&v55 + 1) + 8 * j);
            id v40 = objc_alloc(MEMORY[0x1E4F42938]);
            id v41 = [MEMORY[0x1E4F1CAD0] setWithObject:v39];
            id v42 = (void *)[v40 initWithPersistedIdentifiers:v41 preferredAnimationType:1 callbackQueue:0 completion:0];
            [v33 addObject:v42];
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v55 objects:v67 count:16];
        }
        while (v36);
      }

      uint64_t v32 = v51;
      id v43 = [(FBProcess *)v51 workspace];
      [v43 sendActions:v33];

      id v9 = v53;
    }
    else
    {
      uint64_t v33 = SBLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
        -[SBSystemUISceneController destroyScenesWithPersistentIdentifiers:processIdentity:completion:]((uint64_t)self, v33);
      }
    }
  }
  if (v50)
  {
    uint64_t v44 = [v18 count];
    if (v44 == [v9 count])
    {
      v50[2](v50, 1, 0);
    }
    else
    {
      uint64_t v45 = [MEMORY[0x1E4F1CA48] arrayWithArray:v9];
      [v45 removeObjectsInArray:v18];
      v65[0] = *MEMORY[0x1E4F28568];
      v65[1] = SBSystemUISceneControllerErrorInfoUnknownPersistentIdentifiersListKey;
      v66[0] = @"Unknown persistent identifiers";
      v66[1] = v45;
      v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:2];
      v47 = [MEMORY[0x1E4F28C58] errorWithDomain:SBSystemUISceneControllerErrorDomain code:4 userInfo:v46];
      ((void (**)(void, void, void *))v50)[2](v50, 0, v47);
    }
  }
}

uint64_t __95__SBSystemUISceneController_destroyScenesWithPersistentIdentifiers_processIdentity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 scenePersistentIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)sceneFromIdentityToken:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [(SBFSceneWorkspaceController *)self->_sceneWorkspaceController sceneFromIdentityToken:v4];

  return v5;
}

- (id)sceneFromIdentityTokenStringRepresentation:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [(SBFSceneWorkspaceController *)self->_sceneWorkspaceController sceneFromIdentityTokenStringRepresentation:v4];

  return v5;
}

- (id)sceneWorkspaceControllerForProcessIdentity:(id)a3
{
  id v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBSystemUISceneController.m", 626, @"Invalid parameter not satisfying: %@", @"processIdentity" object file lineNumber description];
  }
  if ([(RBSProcessIdentity *)self->_clientProcessIdentity isEqual:v5]) {
    long long v6 = self;
  }
  else {
    long long v6 = 0;
  }
  uint64_t v7 = v6;

  return v7;
}

- (void)processDidExit:(id)a3
{
  id v5 = [a3 identity];
  char v6 = [v5 isEqual:self->_clientProcessIdentity];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBSystemUISceneController.m", 633, @"Invalid parameter not satisfying: %@", @"[[process identity] isEqual:_clientProcessIdentity]" object file lineNumber description];
  }
  if ((self->_sceneVendingPolicy | 2) == 3) {
    BSDispatchMain();
  }
}

uint64_t __44__SBSystemUISceneController_processDidExit___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateAllSceneControllers];
}

uint64_t __58__SBSystemUISceneController_processManager_didAddProcess___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateClientProcess:*(void *)(a1 + 40)];
}

- (void)processManager:(id)a3 didRemoveProcess:(id)a4
{
  id v5 = a4;
  char v6 = [v5 identity];
  int v7 = [v6 isEqual:self->_clientProcessIdentity];

  if (v7)
  {
    [v5 removeObserver:self];
    BSDispatchMain();
  }
}

uint64_t __61__SBSystemUISceneController_processManager_didRemoveProcess___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateClientProcess:0];
}

- (void)_updateClientProcess:(id)a3
{
  id v10 = a3;
  BSDispatchQueueAssertMain();
  objc_storeStrong((id *)&self->_clientProcess, a3);
  clientProcess = self->_clientProcess;
  if (clientProcess)
  {
    char v6 = (void *)MEMORY[0x1E4F963E8];
    int v7 = objc_msgSend(MEMORY[0x1E4F963F8], "identifierWithPid:", -[FBProcess pid](clientProcess, "pid"));
    int v8 = [v6 handleForIdentifier:v7 error:0];
    clientProcessHandle = self->_clientProcessHandle;
    self->_clientProcessHandle = v8;
  }
  else
  {
    int v7 = self->_clientProcessHandle;
    self->_clientProcessHandle = 0;
  }

  [(SBSystemUISceneController *)self _updateShouldHideForSecureMode];
}

- (void)_updateShouldHideForSecureMode
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(RBSProcessHandle *)self->_clientProcessHandle sb_canDrawWhileLocked];
  id v4 = [(id)SBApp windowSceneManager];
  id v5 = [v4 connectedWindowScenes];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    int v26 = !v3;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        int v11 = [v10 secureDisplayStateProvider];
        __int16 v12 = v11;
        if (v11)
        {
          id v13 = v11;
        }
        else
        {
          id v13 = [(id)SBApp authenticationController];
        }
        char v14 = v13;

        int v15 = [v14 isInSecureDisplayMode];
        sceneControllersByDisplayIdentity = self->_sceneControllersByDisplayIdentity;
        uint64_t v17 = [v10 _fbsDisplayIdentity];
        uint64_t v18 = [(NSMapTable *)sceneControllersByDisplayIdentity objectForKey:v17];

        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = v15 & v26;
          uint64_t v23 = *(void *)v28;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v28 != v23) {
                objc_enumerationMutation(v19);
              }
              [*(id *)(*((void *)&v27 + 1) + 8 * j) setHidden:v22];
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v21);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v7);
  }
}

- (NSString)debugDescription
{
  return (NSString *)[(SBSystemUISceneController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(SBSystemUISceneController *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  BOOL v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_jobLabel withName:@"Job Label"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(SBSystemUISceneController *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBSystemUISceneController *)self succinctDescriptionBuilder];
  [v4 appendString:self->_traitsRole withName:@"Traits Role"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__SBSystemUISceneController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v8[3] = &unk_1E6AF5290;
  id v5 = v4;
  id v9 = v5;
  id v10 = self;
  [v5 appendBodySectionWithName:0 multilinePrefix:0 block:v8];
  id v6 = v5;

  return v6;
}

void __67__SBSystemUISceneController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 80) withName:@"Client Process Identity"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 128) withName:@"Scene Workspace Controller"];
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(*(void *)(a1 + 40) + 56) dictionaryRepresentation];
  [v4 appendDictionarySection:v5 withName:@"Scene controllers by window scene" skipIfEmpty:1];

  id v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) _presenterArray];
  [v6 appendArraySection:v7 withName:@"Presenters" skipIfEmpty:0];
}

- (BOOL)handleHomeButtonPress
{
  return 0;
}

- (BOOL)handleHomeButtonDoublePress
{
  return 0;
}

- (BOOL)handleHomeButtonLongPress
{
  return 0;
}

- (BOOL)handleLockButtonPress
{
  return 0;
}

- (BOOL)handleVoiceCommandButtonPress
{
  return 0;
}

- (BOOL)handleVolumeUpButtonPress
{
  return 0;
}

- (BOOL)handleVolumeDownButtonPress
{
  return 0;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  return 0;
}

- (RBSProcessIdentity)clientProcessIdentity
{
  return self->_clientProcessIdentity;
}

- (int64_t)sceneVendingPolicy
{
  return self->_sceneVendingPolicy;
}

- (NSString)traitsRole
{
  return self->_traitsRole;
}

- (double)level
{
  return self->_level;
}

- (SBFSceneWorkspaceDefaultDelegate)sceneWorkspaceControllerDelegate
{
  return self->_sceneWorkspaceControllerDelegate;
}

- (void)setSceneWorkspaceControllerDelegate:(id)a3
{
}

- (SBFSceneWorkspaceController)sceneWorkspaceController
{
  return self->_sceneWorkspaceController;
}

- (SBSystemUISceneDefaultPresenter)defaultPresenter
{
  return self->_defaultPresenter;
}

- (void)setDefaultPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultPresenter, 0);
  objc_storeStrong((id *)&self->_sceneWorkspaceController, 0);
  objc_storeStrong((id *)&self->_sceneWorkspaceControllerDelegate, 0);
  objc_storeStrong((id *)&self->_jobLabel, 0);
  objc_storeStrong((id *)&self->_traitsRole, 0);
  objc_storeStrong((id *)&self->_clientProcessIdentity, 0);
  objc_storeStrong((id *)&self->_continuityFuturesByLevelForDisplayIdentity, 0);
  objc_storeStrong((id *)&self->_continuityPresentersByLevelForDisplayIdentity, 0);
  objc_storeStrong((id *)&self->_sceneControllersByDisplayIdentity, 0);
  objc_storeStrong((id *)&self->_presenters, 0);
  objc_storeStrong((id *)&self->_sceneControllers, 0);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_clientProcessHandle, 0);
  objc_storeStrong((id *)&self->_clientProcess, 0);
}

- (void)_continuityPresenterForDisplayIdentity:(uint64_t)a1 level:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Scene future %{public}@ with a non UIWindowScene delegate", (uint8_t *)&v2, 0xCu);
}

- (void)destroyScenesWithPersistentIdentifiers:(uint64_t)a1 processIdentity:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 80);
  int v3 = 138543362;
  uint64_t v4 = v2;
}

@end
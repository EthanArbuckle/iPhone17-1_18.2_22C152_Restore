@interface SBNonInteractiveDisplayControllerPolicy
- (BOOL)displayController:(id)a3 shouldUpdatePresentationWithSceneManager:(id)a4 displayConfiguration:(id)a5;
- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4;
- (NSString)description;
- (SBNonInteractiveDisplayControllerPolicy)initWithFBSceneManager:(id)a3 monitoredWindowScene:(id)a4 applicationController:(id)a5;
- (id)_fetchOrCreateSceneForApplication:(id)a3 monitoredDisplayScene:(id)a4 fromSceneManager:(id)a5 displayConfiguration:(id)a6 deactivationReasons:(unint64_t)a7;
- (id)assertionPreferencesForDisplay:(id)a3 displayConfiguration:(id)a4;
- (id)childTransactionsForTransitionRequest:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)displayPreferencesForDisplayController:(id)a3;
- (id)layoutStateForApplicationTransitionContext:(id)a3;
- (id)previousLayoutStateForApplicationTransitionContext:(id)a3;
- (unint64_t)displayAssertionDeactivationReasons:(id)a3;
- (unint64_t)displayAssertionPriorityLevel:(id)a3;
- (void)connectToDisplayController:(id)a3 displayConfiguration:(id)a4;
- (void)dealloc;
- (void)displayController:(id)a3 didBeginTransaction:(id)a4 sceneManager:(id)a5 displayConfiguration:(id)a6 deactivationReasons:(unint64_t)a7;
- (void)displayController:(id)a3 didGainControlOfDisplayWithSceneManager:(id)a4;
- (void)displayController:(id)a3 sceneManager:(id)a4 didLoseControlOfDisplayWithDeactivationReasons:(unint64_t)a5;
- (void)displayController:(id)a3 sceneManager:(id)a4 didReceiveNewDeactivationReasons:(unint64_t)a5;
- (void)displayController:(id)a3 updatePresentationWithSceneManager:(id)a4 displayConfiguration:(id)a5 completion:(id)a6;
- (void)displayControllerDidDisconnect:(id)a3 sceneManager:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
@end

@implementation SBNonInteractiveDisplayControllerPolicy

- (SBNonInteractiveDisplayControllerPolicy)initWithFBSceneManager:(id)a3 monitoredWindowScene:(id)a4 applicationController:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBNonInteractiveDisplayControllerPolicy.m", 86, @"Invalid parameter not satisfying: %@", @"monitoredWindowScene" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"SBNonInteractiveDisplayControllerPolicy.m", 85, @"Invalid parameter not satisfying: %@", @"fbSceneManager" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"SBNonInteractiveDisplayControllerPolicy.m", 87, @"Invalid parameter not satisfying: %@", @"applicationController" object file lineNumber description];

LABEL_4:
  v20.receiver = self;
  v20.super_class = (Class)SBNonInteractiveDisplayControllerPolicy;
  v13 = [(SBNonInteractiveDisplayControllerPolicy *)&v20 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_fbSceneManager, a3);
    objc_storeStrong((id *)&v14->_monitoredWindowScene, a4);
    objc_storeStrong((id *)&v14->_applicationController, a5);
    v15 = [(SBWindowScene *)v14->_monitoredWindowScene sceneManager];
    [v15 addChildTransactionProvider:v14];
  }
  return v14;
}

- (void)dealloc
{
  v3 = [(SBWindowScene *)self->_monitoredWindowScene sceneManager];
  [v3 removeChildTransactionProvider:self];

  v4.receiver = self;
  v4.super_class = (Class)SBNonInteractiveDisplayControllerPolicy;
  [(SBNonInteractiveDisplayControllerPolicy *)&v4 dealloc];
}

- (id)childTransactionsForTransitionRequest:(id)a3
{
  p_displayController = &self->_displayController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_displayController);
  v6 = [WeakRetained createTransactionForTransitionRequest:v4];

  return v6;
}

- (unint64_t)displayAssertionPriorityLevel:(id)a3
{
  return 3;
}

- (unint64_t)displayAssertionDeactivationReasons:(id)a3
{
  return 512;
}

- (void)connectToDisplayController:(id)a3 displayConfiguration:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F29060];
  id v7 = a4;
  id v8 = a3;
  if (([v6 isMainThread] & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = [NSString stringWithUTF8String:"-[SBNonInteractiveDisplayControllerPolicy connectToDisplayController:displayConfiguration:]"];
    [v13 handleFailureInFunction:v14 file:@"SBNonInteractiveDisplayControllerPolicy.m" lineNumber:122 description:@"this call must be made on the main thread"];
  }
  objc_storeWeak((id *)&self->_displayController, v8);
  v9 = [v7 identity];

  displayIdentity = self->_displayIdentity;
  self->_displayIdentity = v9;

  id v11 = [v8 layoutPublisher];

  layoutPublisher = self->_layoutPublisher;
  self->_layoutPublisher = v11;
}

- (void)displayControllerDidDisconnect:(id)a3 sceneManager:(id)a4
{
  currentScene = self->_currentScene;
  id v7 = a4;
  [(FBScene *)currentScene removeObserver:self];
  id v8 = [v7 allScenes];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__SBNonInteractiveDisplayControllerPolicy_displayControllerDidDisconnect_sceneManager___block_invoke;
  v9[3] = &unk_1E6B08608;
  v9[4] = self;
  v9[5] = a2;
  [v8 enumerateObjectsUsingBlock:v9];
}

void __87__SBNonInteractiveDisplayControllerPolicy_displayControllerDidDisconnect_sceneManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = SBLogDisplayControlling();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = _SBFLoggingMethodProem();
    v5 = [v2 identifier];
    int v6 = 138543618;
    id v7 = v4;
    __int16 v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ INVALIDATING scene %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [v2 invalidate];
}

- (void)displayController:(id)a3 didGainControlOfDisplayWithSceneManager:(id)a4
{
  id v5 = a4;
  if (self->_currentLayoutElement)
  {
    [(BSInvalidatable *)self->_currentLayoutElementAssertion invalidate];
    int v6 = [(FBSDisplayLayoutPublishing *)self->_layoutPublisher addElement:self->_currentLayoutElement];
    currentLayoutElementAssertion = self->_currentLayoutElementAssertion;
    self->_currentLayoutElementAssertion = v6;
  }
  __int16 v8 = [v5 allScenes];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __101__SBNonInteractiveDisplayControllerPolicy_displayController_didGainControlOfDisplayWithSceneManager___block_invoke;
  v9[3] = &unk_1E6AF87C0;
  v9[4] = self;
  [v8 enumerateObjectsUsingBlock:v9];

  self->_previouslyReceivedDeactivationReasons = 0;
}

void __101__SBNonInteractiveDisplayControllerPolicy_displayController_didGainControlOfDisplayWithSceneManager___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 settings];
  int v4 = [v3 isUISubclass];

  if (v4)
  {
    id v5 = [v7 uiSettings];
    int v6 = (void *)[v5 mutableCopy];

    objc_msgSend(v6, "setDeactivationReasons:", objc_msgSend(v6, "deactivationReasons") & ~*(void *)(*(void *)(a1 + 32) + 72));
    [v7 updateSettings:v6 withTransitionContext:0];
  }
}

- (void)displayController:(id)a3 sceneManager:(id)a4 didLoseControlOfDisplayWithDeactivationReasons:(unint64_t)a5
{
  currentLayoutElementAssertion = self->_currentLayoutElementAssertion;
  id v8 = a4;
  [(BSInvalidatable *)currentLayoutElementAssertion invalidate];
  v9 = self->_currentLayoutElementAssertion;
  self->_currentLayoutElementAssertion = 0;

  uint64_t v10 = [v8 allScenes];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __121__SBNonInteractiveDisplayControllerPolicy_displayController_sceneManager_didLoseControlOfDisplayWithDeactivationReasons___block_invoke;
  v11[3] = &__block_descriptor_40_e21_v24__0__FBScene_8_B16l;
  v11[4] = a5;
  [v10 enumerateObjectsUsingBlock:v11];

  self->_previouslyReceivedDeactivationReasons = a5;
}

void __121__SBNonInteractiveDisplayControllerPolicy_displayController_sceneManager_didLoseControlOfDisplayWithDeactivationReasons___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 settings];
  int v4 = [v3 isUISubclass];

  if (v4)
  {
    id v5 = [v7 uiSettings];
    int v6 = (void *)[v5 mutableCopy];

    objc_msgSend(v6, "setDeactivationReasons:", *(void *)(a1 + 32) | objc_msgSend(v6, "deactivationReasons"));
    [v7 updateSettings:v6 withTransitionContext:0];
  }
}

- (void)displayController:(id)a3 sceneManager:(id)a4 didReceiveNewDeactivationReasons:(unint64_t)a5
{
  id v7 = objc_msgSend(a4, "allScenes", a3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __107__SBNonInteractiveDisplayControllerPolicy_displayController_sceneManager_didReceiveNewDeactivationReasons___block_invoke;
  v8[3] = &unk_1E6B08608;
  v8[4] = self;
  v8[5] = a5;
  [v7 enumerateObjectsUsingBlock:v8];

  self->_previouslyReceivedDeactivationReasons = a5;
}

void __107__SBNonInteractiveDisplayControllerPolicy_displayController_sceneManager_didReceiveNewDeactivationReasons___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 settings];
  int v4 = [v3 isUISubclass];

  if (v4)
  {
    id v5 = [v7 uiSettings];
    int v6 = (void *)[v5 mutableCopy];

    objc_msgSend(v6, "setDeactivationReasons:", *(void *)(a1 + 40) | objc_msgSend(v6, "deactivationReasons") & ~*(void *)(*(void *)(a1 + 32) + 72));
    [v7 updateSettings:v6 withTransitionContext:0];
  }
}

- (void)displayController:(id)a3 didBeginTransaction:(id)a4 sceneManager:(id)a5 displayConfiguration:(id)a6 deactivationReasons:(unint64_t)a7
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v12 = a4;
  id v13 = a5;
  id v44 = a6;
  if ([(FBSDisplayIdentity *)self->_displayIdentity isiPodOnlyDisplay])
  {
    uint64_t v14 = [(SBApplicationController *)self->_applicationController iPodOutApplication];
LABEL_5:
    id v15 = (id)v14;
    char v16 = 0;
    goto LABEL_11;
  }
  if ([(FBSDisplayIdentity *)self->_displayIdentity isMusicOnlyDisplay])
  {
    uint64_t v14 = [(SBApplicationController *)self->_applicationController musicApplication];
    goto LABEL_5;
  }
  v17 = [(SBWindowScene *)self->_monitoredWindowScene layoutStateProvider];
  v18 = [v17 layoutState];
  v19 = [v18 elementWithRole:1];
  objc_super v20 = [v19 workspaceEntity];
  v21 = [v20 applicationSceneEntity];

  v22 = [v21 application];
  if (-[FBSDisplayIdentity isRestrictedAirPlayDisplay](self->_displayIdentity, "isRestrictedAirPlayDisplay")&& ([v22 processState], v23 = objc_claimAutoreleasedReturnValue(), int v24 = objc_msgSend(v23, "pid"), v25 = -[FBSDisplayIdentity pid](self->_displayIdentity, "pid"), v23, v24 != v25))
  {
    id v15 = 0;
  }
  else
  {
    id v15 = v22;
  }

  char v16 = 1;
LABEL_11:
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__109;
  v53 = __Block_byref_object_dispose__109;
  id v54 = 0;
  v26 = [(SBWindowScene *)self->_monitoredWindowScene sceneManager];
  v27 = [v26 externalApplicationSceneHandles];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __135__SBNonInteractiveDisplayControllerPolicy_displayController_didBeginTransaction_sceneManager_displayConfiguration_deactivationReasons___block_invoke;
  v46[3] = &unk_1E6B0BBA8;
  id v28 = v15;
  id v47 = v28;
  v48 = &v49;
  [v27 enumerateObjectsUsingBlock:v46];

  uint64_t v29 = v50[5];
  if (!v29 || !v28)
  {
    if (v28) {
      char v35 = 1;
    }
    else {
      char v35 = v16;
    }
    if (v35)
    {
      v30 = 0;
      if (!v28 || v29) {
        goto LABEL_33;
      }
      v36 = SBLogDisplayControlling();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
        -[SBNonInteractiveDisplayControllerPolicy displayController:didBeginTransaction:sceneManager:displayConfiguration:deactivationReasons:](v37, (uint64_t)v28, buf, v36);
      }

      if ([v12 isAuditHistoryEnabled]) {
        [v12 _addAuditHistoryItem:@"failed to add an external display scene for %@ because there's no monitoredDisplayScene", v28];
      }
    }
    else
    {
      v38 = SBLogDisplayControlling();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
        -[SBNonInteractiveDisplayControllerPolicy displayController:didBeginTransaction:sceneManager:displayConfiguration:deactivationReasons:](v39, buf, v38);
      }

      if ([v12 isAuditHistoryEnabled]) {
        [v12 _addAuditHistoryItem:@"failed to add an external display scene because we couldn't resolve an application"];
      }
    }
    v30 = 0;
    goto LABEL_33;
  }
  v30 = -[SBNonInteractiveDisplayControllerPolicy _fetchOrCreateSceneForApplication:monitoredDisplayScene:fromSceneManager:displayConfiguration:deactivationReasons:](self, "_fetchOrCreateSceneForApplication:monitoredDisplayScene:fromSceneManager:displayConfiguration:deactivationReasons:", v28);
  if (v30)
  {
    v31 = SBLogDisplayControlling();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      v33 = [v30 identity];
      *(_DWORD *)buf = 138543618;
      id v56 = v32;
      __int16 v57 = 2114;
      v58 = v33;
      _os_log_impl(&dword_1D85BA000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ retrieved scene: %{public}@", buf, 0x16u);
    }
    if ([v12 isAuditHistoryEnabled])
    {
      v34 = [(FBScene *)self->_currentScene identifier];
      [v12 _addAuditHistoryItem:@"retrieved scene %@", v34];
    }
  }
LABEL_33:
  currentApplication = self->_currentApplication;
  self->_currentApplication = 0;

  [(FBScene *)self->_currentScene removeObserver:self];
  objc_storeStrong((id *)&self->_currentScene, v30);
  if (self->_currentScene)
  {
    objc_storeStrong((id *)&self->_currentApplication, v15);
    [(FBScene *)self->_currentScene addObserver:self];
  }
  v41 = [v13 allScenes];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __135__SBNonInteractiveDisplayControllerPolicy_displayController_didBeginTransaction_sceneManager_displayConfiguration_deactivationReasons___block_invoke_31;
  v45[3] = &unk_1E6B0BBD0;
  v45[4] = self;
  v45[5] = a2;
  v45[6] = a7;
  [v41 enumerateObjectsUsingBlock:v45];

  _Block_object_dispose(&v49, 8);
}

void __135__SBNonInteractiveDisplayControllerPolicy_displayController_didBeginTransaction_sceneManager_displayConfiguration_deactivationReasons___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  id v5 = [v10 application];
  int v6 = [v5 isSameExecutableAsApplication:*(void *)(a1 + 32)];

  if (v6)
  {
    uint64_t v7 = [v10 scene];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a3 = 1;
  }
}

void __135__SBNonInteractiveDisplayControllerPolicy_displayController_didBeginTransaction_sceneManager_displayConfiguration_deactivationReasons___block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 settings];
  char v5 = [v4 isUISubclass];

  if ((v5 & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"SBNonInteractiveDisplayControllerPolicy.m" lineNumber:251 description:@"settings must be a UI subclass"];
  }
  if (*(id *)(*(void *)(a1 + 32) + 88) != v3)
  {
    int v6 = [v3 uiSettings];
    uint64_t v7 = (void *)[v6 mutableCopy];

    if ([v7 isForeground])
    {
      uint64_t v8 = SBLogDisplayControlling();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v9 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(a1 + 32));
        id v10 = [v3 identifier];
        int v12 = 138543618;
        id v13 = v9;
        __int16 v14 = 2114;
        id v15 = v10;
        _os_log_debug_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ backgrounding non-current scene: %{public}@", (uint8_t *)&v12, 0x16u);
      }
      [v7 setForeground:0];
    }
    objc_msgSend(v7, "setDeactivationReasons:", objc_msgSend(v7, "deactivationReasons") | *(void *)(a1 + 48) | 0x200);
    [v3 updateSettings:v7 withTransitionContext:0];
  }
}

- (BOOL)displayController:(id)a3 shouldUpdatePresentationWithSceneManager:(id)a4 displayConfiguration:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v6 = (FBSDisplayConfiguration *)a5;
  uint64_t v7 = [MEMORY[0x1E4F28E78] string];
  if (([(FBSDisplayConfiguration *)self->_lastPresentationUpdateDisplayConfiguration isEqual:v6] & 1) == 0) {
    [v7 appendString:@"displayConfiguration"];
  }
  if (([(FBScene *)self->_lastPresentationUpdateScene isEqual:self->_currentScene] & 1) == 0)
  {
    if ([v7 length]) {
      [v7 appendString:@", "];
    }
    [v7 appendString:@"scene"];
  }
  uint64_t v8 = [v7 length];
  if (v8)
  {
    v9 = SBLogDisplayControlling();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      int v15 = 138543618;
      uint64_t v16 = v10;
      __int16 v17 = 2114;
      v18 = v7;
    }
  }
  BOOL v11 = v8 != 0;
  lastPresentationUpdateDisplayConfiguration = self->_lastPresentationUpdateDisplayConfiguration;
  self->_lastPresentationUpdateDisplayConfiguration = v6;
  id v13 = v6;

  objc_storeStrong((id *)&self->_lastPresentationUpdateScene, self->_currentScene);
  return v11;
}

- (void)displayController:(id)a3 updatePresentationWithSceneManager:(id)a4 displayConfiguration:(id)a5 completion:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  BOOL v11 = (void (**)(void))a6;
  if (([(FBSDisplayConfiguration *)self->_lastPresentationUpdateDisplayConfiguration isEqual:v10] & 1) != 0
    || (objc_storeStrong((id *)&self->_lastPresentationUpdateDisplayConfiguration, a5),
        p_currentScene = &self->_currentScene,
        !self->_currentScene))
  {
    p_lastPresentationUpdateScene = &self->_lastPresentationUpdateScene;
    p_currentScene = &self->_currentScene;
    if ([(FBScene *)self->_lastPresentationUpdateScene isEqual:self->_currentScene])
    {
LABEL_18:
      v11[2](v11);
      goto LABEL_19;
    }
  }
  else
  {
    id v13 = SBLogDisplayControlling();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      *(_DWORD *)buf = 138543362;
      v34 = v14;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ running update as display changed", buf, 0xCu);
    }
    p_lastPresentationUpdateScene = &self->_lastPresentationUpdateScene;
    if ([(FBScene *)self->_lastPresentationUpdateScene isEqual:self->_currentScene]) {
      goto LABEL_12;
    }
  }
  objc_storeStrong((id *)p_lastPresentationUpdateScene, *p_currentScene);
  if (!*p_currentScene) {
    goto LABEL_18;
  }
  uint64_t v16 = SBLogDisplayControlling();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v17 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    *(_DWORD *)buf = 138543362;
    v34 = v17;
    _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ running update as scene changed", buf, 0xCu);
  }
LABEL_12:
  v18 = [(SBApplication *)self->_currentApplication bundleIdentifier];
  uint64_t v19 = [(FBSDisplayLayoutElement *)self->_currentLayoutElement bundleIdentifier];
  char v20 = [v19 isEqualToString:v18];

  if ((v20 & 1) == 0)
  {
    [(BSInvalidatable *)self->_currentLayoutElementAssertion invalidate];
    if (v18)
    {
      v21 = [MEMORY[0x1E4FA6A78] elementWithIdentifier:v18 presenting:1];
      currentLayoutElement = self->_currentLayoutElement;
      self->_currentLayoutElement = v21;

      v23 = [(FBSDisplayLayoutPublishing *)self->_layoutPublisher addElement:self->_currentLayoutElement];
      currentLayoutElementAssertion = self->_currentLayoutElementAssertion;
      self->_currentLayoutElementAssertion = v23;
    }
  }
  int v25 = [(FBScene *)*p_currentScene settings];
  char v26 = [v25 isUISubclass];

  if ((v26 & 1) == 0)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"SBNonInteractiveDisplayControllerPolicy.m" lineNumber:330 description:@"settings must be a UI subclass"];
  }
  v27 = [(FBScene *)*p_currentScene uiSettings];
  id v28 = (void *)[v27 mutableCopy];

  [v28 setDisplayConfiguration:v10];
  [v10 bounds];
  objc_msgSend(v28, "setFrame:");
  uint64_t v29 = *p_currentScene;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __128__SBNonInteractiveDisplayControllerPolicy_displayController_updatePresentationWithSceneManager_displayConfiguration_completion___block_invoke;
  v31[3] = &unk_1E6AF5A50;
  id v32 = v11;
  [(FBScene *)v29 updateSettings:v28 withTransitionContext:0 completion:v31];

LABEL_19:
}

uint64_t __128__SBNonInteractiveDisplayControllerPolicy_displayController_updatePresentationWithSceneManager_displayConfiguration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)displayPreferencesForDisplayController:(id)a3
{
  id v3 = [(FBScene *)self->_currentScene uiClientSettings];
  int v4 = [v3 displayConfigurationRequest];

  char v5 = -[SBSceneHostingDisplayPreferences initWithDisplayConfigurationRequest:logicalScale:contentsScale:keepOtherModes:]([SBSceneHostingDisplayPreferences alloc], "initWithDisplayConfigurationRequest:logicalScale:contentsScale:keepOtherModes:", v4, 1, 1.0, 1.0, 1.0);
  return v5;
}

- (id)assertionPreferencesForDisplay:(id)a3 displayConfiguration:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(SBDisplayAssertionPreferences);
  currentScene = self->_currentScene;
  if (currentScene)
  {
    v9 = [(FBScene *)currentScene clientSettings];
    char v10 = [v9 isUISubclass];

    if ((v10 & 1) == 0)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"SBNonInteractiveDisplayControllerPolicy.m" lineNumber:360 description:@"clientSettings must be a UI subclass"];
    }
    BOOL v11 = [(FBScene *)self->_currentScene uiClientSettings];
    uint64_t v12 = [v11 disablesMirroring];

    id v13 = SBLogDisplayControlling();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      char v20 = [(FBScene *)self->_currentScene identity];
      int v22 = 138543874;
      v23 = v19;
      __int16 v24 = 2114;
      int v25 = v20;
      __int16 v26 = 1024;
      int v27 = v12;
      _os_log_debug_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@ want control (disablesMirroring): %{BOOL}u", (uint8_t *)&v22, 0x1Cu);
    }
    [(SBDisplayAssertionPreferences *)v7 setWantsControlOfDisplay:v12];
  }
  __int16 v14 = +[SBDisplayPowerLogEntry forDisplay:v6 mode:4 zoom:0];
  [(SBDisplayAssertionPreferences *)v7 setPowerLogEntry:v14];
  displayIdentity = self->_displayIdentity;
  uint64_t v16 = objc_opt_class();
  __int16 v17 = _SBPreventIdleSleepReason(displayIdentity, v16);
  [(SBDisplayAssertionPreferences *)v7 setDisableSystemIdleSleepReason:v17];

  [(SBDisplayAssertionPreferences *)v7 setCloneMirroringMode:1];
  return v7;
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (([v10 isUISubclass] & 1) == 0)
  {
    int v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"SBNonInteractiveDisplayControllerPolicy.m" lineNumber:383 description:@"clientSettings must be a UI subclass"];
  }
  BOOL v11 = [v9 clientSettings];
  char v12 = [v11 isUISubclass];

  if ((v12 & 1) == 0)
  {
    __int16 v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"SBNonInteractiveDisplayControllerPolicy.m" lineNumber:384 description:@"clientSettings must be a UI subclass"];
  }
  id v13 = [v9 uiClientSettings];
  id v14 = v10;
  int v15 = [v13 displayConfigurationRequest];
  uint64_t v16 = [v14 displayConfigurationRequest];
  int v17 = [v15 isEqual:v16];

  int v18 = [v13 disablesMirroring];
  if (v18 == [v14 disablesMirroring])
  {
    if (v17) {
      goto LABEL_17;
    }
    uint64_t v19 = 2;
  }
  else
  {
    if (v17) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = 3;
    }
    char v20 = SBLogDisplayControlling();
    if (os_signpost_enabled(v20))
    {
      v21 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      int v27 = 138543618;
      uint64_t v28 = v21;
      __int16 v29 = 1024;
      int v30 = v18;
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_NON_INTERACTIVE_POLICY_UPDATE_ASSERTION_FOR_MIRRORING", "%{public}@ disabledMirroring:%{BOOL}u", (uint8_t *)&v27, 0x12u);
    }
  }
  int v22 = SBLogDisplayControlling();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    int v27 = 138543362;
    uint64_t v28 = v23;
    _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_INFO, "%{public}@ detected client settings change. requesting update", (uint8_t *)&v27, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayController);
  [WeakRetained requestUpdate:v19];

LABEL_17:
}

- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 request];
  uint64_t v8 = [v7 displayConfiguration];

  [v8 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v16 = v9;
  if (v14 == *MEMORY[0x1E4F1DB30] && v9 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    int v18 = SBLogDisplayControlling();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v23 = _SBFLoggingMethodProem();
      v36.origin.x = v11;
      v36.origin.y = v13;
      v36.size.width = v15;
      v36.size.height = v16;
      __int16 v24 = NSStringFromCGRect(v36);
      int v25 = 138544386;
      __int16 v26 = v23;
      __int16 v27 = 2114;
      uint64_t v28 = v24;
      __int16 v29 = 2114;
      id v30 = v5;
      __int16 v31 = 2114;
      id v32 = v6;
      __int16 v33 = 2114;
      v34 = v8;
      _os_log_error_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_ERROR, "%{public}@ returning frame with CGSizeZero: %{public}@. context: %{public}@; entity: %{public}@; displayConfig: %{public}@",
        (uint8_t *)&v25,
        0x34u);
    }
  }

  double v19 = v11;
  double v20 = v13;
  double v21 = v15;
  double v22 = v16;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  id v3 = a3;
  int v4 = [v3 request];
  id v5 = [v4 layoutStateForApplicationTransitionContext:v3];

  return v5;
}

- (id)previousLayoutStateForApplicationTransitionContext:(id)a3
{
  id v3 = a3;
  int v4 = [v3 request];
  id v5 = [v4 previousLayoutStateForApplicationTransitionContext:v3];

  return v5;
}

- (id)_fetchOrCreateSceneForApplication:(id)a3 monitoredDisplayScene:(id)a4 fromSceneManager:(id)a5 displayConfiguration:(id)a6 deactivationReasons:(unint64_t)a7
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a5;
  int v17 = [v16 sceneIdentityForApplication:v13];
  int v18 = +[SBApplicationSceneHandleRequest defaultRequestForApplication:v13 sceneIdentity:v17 displayIdentity:self->_displayIdentity];

  double v19 = [v16 fetchOrCreateApplicationSceneHandleForRequest:v18];

  if (v19)
  {
    SEL v50 = a2;
    double v20 = [v19 sceneIfExists];
    if (v20)
    {
      double v21 = v20;
      double v22 = [v20 uiSettings];
      v23 = (SBMainWorkspaceTransitionRequest *)[v22 mutableCopy];

      [(SBWorkspaceTransitionRequest *)v23 setDisplayConfiguration:v15];
      [v15 bounds];
      -[SBMainWorkspaceTransitionRequest setFrame:](v23, "setFrame:");
      [(SBMainWorkspaceTransitionRequest *)v23 setForeground:1];
      [(SBMainWorkspaceTransitionRequest *)v23 setDeactivationReasons:[(SBMainWorkspaceTransitionRequest *)v23 deactivationReasons] | a7];
      [v21 updateSettings:v23 withTransitionContext:0];
      __int16 v24 = SBLogDisplayControlling();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
        int v25 = v48 = v14;
        __int16 v26 = [v21 identifier];
        __int16 v27 = UIApplicationSceneDeactivationReasonMaskDescriptionComponents();
        *(_DWORD *)buf = 138544130;
        __int16 v57 = v25;
        __int16 v58 = 2114;
        id v59 = v26;
        __int16 v60 = 2114;
        id v61 = v27;
        __int16 v62 = 2114;
        id v63 = v15;
        _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ RETRIEVED scene %{public}@ for presentation; deactivationReasons: %{public}@; displayConfiguration: %{public}@",
          buf,
          0x2Au);

        id v14 = v48;
      }
    }
    else
    {
      v23 = [[SBMainWorkspaceTransitionRequest alloc] initWithDisplayConfiguration:v15];
      uint64_t v28 = [(SBWorkspaceTransitionRequest *)v23 applicationContext];
      [v28 setDelegate:self];

      [(SBMainWorkspaceTransitionRequest *)v23 finalize];
      __int16 v29 = [[SBExternalDisplayApplicationSceneEntity alloc] initWithApplicationSceneHandle:v19];
      id v30 = [(SBWorkspaceTransitionRequest *)v23 applicationContext];
      id v47 = v29;
      [v19 _createParametersFromTransitionContext:v30 entity:v29];
      id v32 = v31 = v15;

      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __157__SBNonInteractiveDisplayControllerPolicy__fetchOrCreateSceneForApplication_monitoredDisplayScene_fromSceneManager_displayConfiguration_deactivationReasons___block_invoke;
      v52[3] = &unk_1E6B0BBF8;
      SEL v54 = v50;
      v52[4] = self;
      v45 = v31;
      id v44 = v31;
      id v53 = v44;
      unint64_t v55 = a7;
      [v32 updateSettingsWithBlock:v52];
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __157__SBNonInteractiveDisplayControllerPolicy__fetchOrCreateSceneForApplication_monitoredDisplayScene_fromSceneManager_displayConfiguration_deactivationReasons___block_invoke_2;
      v51[3] = &unk_1E6B0BC20;
      v51[4] = self;
      v51[5] = v50;
      [v32 updateClientSettingsWithBlock:v51];
      fbSceneManager = self->_fbSceneManager;
      v34 = [v19 sceneIdentifier];
      id v49 = v14;
      uint64_t v35 = [v14 clientProcess];
      CGRect v36 = [v35 workspace];
      v46 = v32;
      double v21 = [(FBSceneManager *)fbSceneManager createSceneWithIdentifier:v34 parameters:v32 clientProvider:v36 transitionContext:0];

      v37 = SBLogDisplayControlling();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
        v39 = [v21 identifier];
        v40 = [v21 uiSettings];
        [v40 deactivationReasons];
        v41 = UIApplicationSceneDeactivationReasonMaskDescriptionComponents();
        *(_DWORD *)buf = 138544130;
        __int16 v57 = v38;
        __int16 v58 = 2114;
        id v59 = v39;
        __int16 v60 = 2114;
        id v61 = v41;
        __int16 v62 = 2114;
        id v63 = v44;
        _os_log_impl(&dword_1D85BA000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ CREATED scene %{public}@ for presentation deactivationReasons: %{public}@; displayConfiguration: %{public}@",
          buf,
          0x2Au);
      }
      id v14 = v49;
      id v15 = v45;
    }
  }
  else
  {
    SBLogDisplayControlling();
    v23 = (SBMainWorkspaceTransitionRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v23->super.super, OS_LOG_TYPE_ERROR))
    {
      v43 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      *(_DWORD *)buf = 138543874;
      __int16 v57 = v43;
      __int16 v58 = 2114;
      id v59 = v13;
      __int16 v60 = 2114;
      id v61 = v14;
      _os_log_error_impl(&dword_1D85BA000, &v23->super.super, OS_LOG_TYPE_ERROR, "%{public}@ failed to retrieve scene handle for application: %{public}@ monitoredDisplayScene: %{public}@", buf, 0x20u);
    }
    double v21 = 0;
  }

  return v21;
}

void __157__SBNonInteractiveDisplayControllerPolicy__fetchOrCreateSceneForApplication_monitoredDisplayScene_fromSceneManager_displayConfiguration_deactivationReasons___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([v4 isUISubclass] & 1) == 0)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"SBNonInteractiveDisplayControllerPolicy.m" lineNumber:460 description:@"settings must be a UI subclass"];
  }
  [v4 setInterfaceOrientationMode:2];
  [v4 setInterfaceOrientation:1];
  [v4 setDisplayConfiguration:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 setForeground:1];
  objc_msgSend(v4, "setDeactivationReasons:", *(void *)(a1 + 56) | objc_msgSend(v4, "deactivationReasons"));
}

void __157__SBNonInteractiveDisplayControllerPolicy__fetchOrCreateSceneForApplication_monitoredDisplayScene_fromSceneManager_displayConfiguration_deactivationReasons___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isUISubclass] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"SBNonInteractiveDisplayControllerPolicy.m" lineNumber:474 description:@"clientSettings must be a UI subclass"];
  }
  [v3 setPreferredInterfaceOrientation:1];
  id v6 = objc_alloc_init(MEMORY[0x1E4F629A0]);
  [v6 setOverscanCompensation:1];
  id v4 = (void *)[v6 copy];
  [v3 setDisplayConfigurationRequest:v4];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBNonInteractiveDisplayControllerPolicy *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (NSString)description
{
  return (NSString *)[(SBNonInteractiveDisplayControllerPolicy *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v6 = (id)[v5 appendObject:self->_currentApplication withName:@"currentApplication"];
  id v7 = (id)[v5 appendObject:self->_currentLayoutElement withName:@"currentLayoutElement"];
  if (self->_currentScene)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __81__SBNonInteractiveDisplayControllerPolicy_descriptionBuilderWithMultilinePrefix___block_invoke;
    v9[3] = &unk_1E6AF5290;
    v9[4] = self;
    id v10 = v5;
    [v10 appendBodySectionWithName:@"FBScene" multilinePrefix:v4 block:v9];
  }
  return v5;
}

void __81__SBNonInteractiveDisplayControllerPolicy_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(*(void *)(a1 + 32) + 88) uiSettings];
  id v2 = *(void **)(a1 + 40);
  [v8 frame];
  id v3 = (id)objc_msgSend(v2, "appendRect:withName:", @"frame");
  id v4 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", objc_msgSend(v8, "isForeground"), @"isForeground");
  id v5 = *(void **)(a1 + 40);
  [v8 deactivationReasons];
  id v6 = UIApplicationSceneDeactivationReasonMaskDescriptionComponents();
  id v7 = (id)[v5 appendObject:v6 withName:@"deactivationReasons"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPresentationUpdateScene, 0);
  objc_storeStrong((id *)&self->_lastPresentationUpdateDisplayConfiguration, 0);
  objc_storeStrong((id *)&self->_currentScene, 0);
  objc_storeStrong((id *)&self->_currentApplication, 0);
  objc_storeStrong((id *)&self->_currentLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_currentLayoutElement, 0);
  objc_storeStrong((id *)&self->_layoutPublisher, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_monitoredWindowScene, 0);
  objc_storeStrong((id *)&self->_fbSceneManager, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_destroyWeak((id *)&self->_displayController);
}

- (void)displayController:(uint8_t *)buf didBeginTransaction:(os_log_t)log sceneManager:displayConfiguration:deactivationReasons:.cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "%{public}@ can't get a scene for %{public}@ because there's no monitoredDisplayScene", buf, 0x16u);
}

- (void)displayController:(os_log_t)log didBeginTransaction:sceneManager:displayConfiguration:deactivationReasons:.cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "%{public}@ can't get a scene because we couldn't resolve an application", buf, 0xCu);
}

@end
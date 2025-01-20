@interface SBSingleSceneController
- (BOOL)_isClientProcessRunning;
- (BOOL)isHidden;
- (BOOL)isSceneActive;
- (BOOL)isSceneContentVisible;
- (BOOL)shouldActivateForDisplayConfiguration;
- (BOOL)shouldActivateUponClientConnection;
- (BOOL)shouldBeKeptActiveWhileForeground;
- (BOOL)shouldForegroundForDisplayConfiguration;
- (BOOL)shouldPresentAnyContentState;
- (BOOL)visible;
- (FBSDisplayConfiguration)targetDisplayConfiguration;
- (FBScene)scene;
- (NSString)debugDescription;
- (NSString)scenePersistentIdentifier;
- (NSString)traitsRole;
- (SBFSceneWorkspaceController)sceneWorkspaceController;
- (SBScenePresenting)presenter;
- (SBSingleSceneController)initWithSceneWorkspaceController:(id)a3 sceneRequestOptions:(id)a4 clientIdentity:(id)a5 traitsRole:(id)a6 level:(double)a7;
- (SBUIKitResizableSceneHostComponent)hostComponent;
- (UISceneRequestOptions)sceneOptions;
- (id)_newActivationContext;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)traitsOrientedResizableViewController;
- (id)traitsOrientedViewController;
- (unint64_t)initialSupportedInterfaceOrientations;
- (void)_dismissScene;
- (void)_evaluateSceneActivationState;
- (void)_evaluateSceneForegroundState;
- (void)_evaluateVisibility;
- (void)_presentScene;
- (void)_setVisible:(BOOL)a3;
- (void)dealloc;
- (void)didUpdateSceneTraitsDelegate:(id)a3;
- (void)invalidate;
- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidInvalidate:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHostComponent:(id)a3;
- (void)setInitialSupportedInterfaceOrientations:(unint64_t)a3;
- (void)setPresenter:(id)a3;
- (void)setSceneActive:(BOOL)a3;
- (void)setSceneContentVisible:(BOOL)a3;
- (void)setShouldActivateForDisplayConfiguration:(BOOL)a3;
- (void)setShouldActivateUponClientConnection:(BOOL)a3;
- (void)setShouldBeKeptActiveWhileForeground:(BOOL)a3;
- (void)setShouldForegroundForDisplayConfiguration:(BOOL)a3;
- (void)setShouldPresentAnyContentState:(BOOL)a3;
- (void)setTargetDisplayConfiguration:(id)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation SBSingleSceneController

- (SBSingleSceneController)initWithSceneWorkspaceController:(id)a3 sceneRequestOptions:(id)a4 clientIdentity:(id)a5 traitsRole:(id)a6 level:(double)a7
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  BSDispatchQueueAssertMain();
  if (v14)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"SBSingleSceneController.m", 66, @"Invalid parameter not satisfying: %@", @"sceneWorkspaceController" object file lineNumber description];

    if (v16)
    {
LABEL_3:
      if (v15) {
        goto LABEL_4;
      }
LABEL_10:
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2, self, @"SBSingleSceneController.m", 68, @"Invalid parameter not satisfying: %@", @"sceneRequestOptions" object file lineNumber description];

      if (v17) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"SBSingleSceneController.m", 67, @"Invalid parameter not satisfying: %@", @"clientIdentity" object file lineNumber description];

  if (!v15) {
    goto LABEL_10;
  }
LABEL_4:
  if (v17) {
    goto LABEL_5;
  }
LABEL_11:
  v32 = [MEMORY[0x1E4F28B00] currentHandler];
  [v32 handleFailureInMethod:a2, self, @"SBSingleSceneController.m", 69, @"Invalid parameter not satisfying: %@", @"traitsRole" object file lineNumber description];

LABEL_5:
  v37.receiver = self;
  v37.super_class = (Class)SBSingleSceneController;
  v18 = [(SBSingleSceneController *)&v37 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_traitsRole, a6);
    v19->_sceneContentVisible = 1;
    objc_storeStrong((id *)&v19->_clientIdentity, a5);
    objc_storeStrong((id *)&v19->_sceneOptions, a4);
    objc_storeStrong((id *)&v19->_sceneWorkspaceController, a3);
    sceneWorkspaceController = v19->_sceneWorkspaceController;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __112__SBSingleSceneController_initWithSceneWorkspaceController_sceneRequestOptions_clientIdentity_traitsRole_level___block_invoke;
    v33[3] = &unk_1E6B0C548;
    SEL v36 = a2;
    v21 = v19;
    v34 = v21;
    id v35 = v15;
    [(SBFSceneWorkspaceController *)sceneWorkspaceController createSceneForProcessIdentity:v16 withOptions:v35 completion:v33];
    [v21[12] addObserver:v21];
    v22 = [SBSceneSettingsUpdater alloc];
    id v23 = v21[12];
    v24 = [MEMORY[0x1E4F29128] UUID];
    v25 = [v24 UUIDString];
    uint64_t v26 = [(SBSceneSettingsUpdater *)v22 initWithScene:v23 persistentIdentifier:v25 level:1 updatesGeometry:a7];
    id v27 = v21[3];
    v21[3] = (id)v26;

    [v21[3] setTraitsRole:v19->_traitsRole];
  }

  return v19;
}

void __112__SBSingleSceneController_initWithSceneWorkspaceController_sceneRequestOptions_clientIdentity_traitsRole_level___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = [0 identifier];
    v10 = [*(id *)(a1 + 40) identifier];
    [v6 handleFailureInMethod:v7, v8, @"SBSingleSceneController.m", 80, @"[%@] Scene workspace controller unexpectedly unable to create a new scene (with identifier:%@)", v9, v10 object file lineNumber description];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = v3;
}

- (void)dealloc
{
  [(SBSingleSceneController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSingleSceneController;
  [(SBSingleSceneController *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_super v3 = SBLogSystemUIScene();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(FBScene *)self->_scene identifier];
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating SBSingleSceneController[%p]", (uint8_t *)&v7, 0x16u);
  }
  [(BSInvalidatable *)self->_settingsUpdaterObserverInvalidatable invalidate];
  [(FBScene *)self->_scene removeObserver:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  id v6 = (id)[WeakRetained dismissScene:self->_scene];

  if ([(FBScene *)self->_scene isValid]) {
    [(FBScene *)self->_scene invalidate];
  }
  [(SBSingleSceneController *)self _evaluateVisibility];
}

- (void)setSceneContentVisible:(BOOL)a3
{
  self->_sceneContentVisible = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained scene:self->_scene hasVisibleContent:self->_sceneContentVisible];
  }
}

- (void)setTargetDisplayConfiguration:(id)a3
{
  id v8 = a3;
  if ((-[FBSDisplayConfiguration isEqual:](self->_targetDisplayConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_targetDisplayConfiguration, a3);
    [(SBSceneSettingsUpdater *)self->_sceneSettingsUpdater setDisplayConfiguration:v8];
    if (v8)
    {
      v5 = [(FBScene *)self->_scene systemShellHostingEnvironment];
      id v6 = SBUISystemShellHostingSpaceIdentifierForDisplayConfiguration();
      [v5 setSystemShellHostingSpaceIdentifier:v6];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained sceneDidChangeDisplayIdentity:self->_scene];
    }
    [(SBSingleSceneController *)self _evaluateSceneActivationState];
    [(SBSingleSceneController *)self _evaluateSceneForegroundState];
    [(SBSingleSceneController *)self _evaluateVisibility];
  }
}

- (void)setInitialSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_initialSupportedInterfaceOrientations = a3;
  -[SBSceneSettingsUpdater setInitialSupportedInterfaceOrientations:](self->_sceneSettingsUpdater, "setInitialSupportedInterfaceOrientations:");
}

- (void)setShouldForegroundForDisplayConfiguration:(BOOL)a3
{
  self->_shouldForegroundForDisplayConfiguration = a3;
  [(SBSingleSceneController *)self _evaluateSceneForegroundState];
}

- (void)setShouldActivateForDisplayConfiguration:(BOOL)a3
{
  self->_shouldActivateForDisplayConfiguration = a3;
  [(SBSingleSceneController *)self _evaluateSceneActivationState];
}

- (void)setShouldActivateUponClientConnection:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  v5 = [(SBFSceneWorkspaceController *)self->_sceneWorkspaceController delegate];
  scene = self->_scene;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  __int16 v9 = __65__SBSingleSceneController_setShouldActivateUponClientConnection___block_invoke;
  v10 = &unk_1E6B0C570;
  objc_copyWeak(&v11, &location);
  [v5 setScene:scene shouldActivateUponClientConnection:v3 withContextGenerator:&v7];

  if (v3
    && ([(FBScene *)self->_scene isActive] & 1) == 0
    && [(SBSingleSceneController *)self _isClientProcessRunning])
  {
    [(SBSingleSceneController *)self setSceneActive:1];
  }
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

id __65__SBSingleSceneController_setShouldActivateUponClientConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)[WeakRetained _newActivationContext];

  return v2;
}

- (void)setShouldBeKeptActiveWhileForeground:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  v5 = [(SBFSceneWorkspaceController *)self->_sceneWorkspaceController delegate];
  scene = self->_scene;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __64__SBSingleSceneController_setShouldBeKeptActiveWhileForeground___block_invoke;
  v12 = &unk_1E6B0C570;
  objc_copyWeak(&v13, &location);
  [v5 setScene:scene shouldBeKeptActiveWhileForeground:v3 withContextGenerator:&v9];

  if (v3 && ([(FBScene *)self->_scene isActive] & 1) == 0)
  {
    uint64_t v7 = [(FBScene *)self->_scene settings];
    if ([v7 isForeground])
    {
      BOOL v8 = [(SBSingleSceneController *)self _isClientProcessRunning];

      if (v8) {
        [(SBSingleSceneController *)self setSceneActive:1];
      }
    }
    else
    {
    }
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

id __64__SBSingleSceneController_setShouldBeKeptActiveWhileForeground___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)[WeakRetained _newActivationContext];

  return v2;
}

- (BOOL)isSceneActive
{
  return [(SBSceneSettingsUpdater *)self->_sceneSettingsUpdater isActive];
}

- (void)setSceneActive:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    id v5 = [(SBSingleSceneController *)self _newActivationContext];
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  [(SBSceneSettingsUpdater *)self->_sceneSettingsUpdater setActive:v3 withTransitionContext:v5];
}

- (void)setHidden:(BOOL)a3
{
  if (self->_hidden != a3)
  {
    self->_hidden = a3;
    [(SBSingleSceneController *)self _evaluateVisibility];
  }
}

- (NSString)scenePersistentIdentifier
{
  return [(SBSceneSettingsUpdater *)self->_sceneSettingsUpdater scenePersistentIdentifier];
}

- (void)setPresenter:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  if (!v4)
  {
    uint64_t v9 = SBLogSystemUIScene();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(FBScene *)self->_scene identifier];
      int v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] setPresenter[nil]", (uint8_t *)&v11, 0xCu);
    }
    BOOL v8 = 0;
    goto LABEL_9;
  }
  if (([v4 isEqual:WeakRetained] & 1) == 0)
  {
    id v6 = SBLogSystemUIScene();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(FBScene *)self->_scene identifier];
      int v11 = 138543874;
      v12 = v7;
      __int16 v13 = 2114;
      id v14 = v4;
      __int16 v15 = 2114;
      id v16 = WeakRetained;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] setPresenter[%{public}@] oldPresenter[%{public}@]", (uint8_t *)&v11, 0x20u);
    }
    [(SBSingleSceneController *)self _setVisible:0];
    BOOL v8 = v4;
LABEL_9:
    objc_storeWeak((id *)&self->_presenter, v8);
  }
  [(SBSingleSceneController *)self _evaluateVisibility];
}

- (void)_evaluateVisibility
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  int v4 = [(FBScene *)self->_scene isValid];
  uint64_t v5 = [(FBScene *)self->_scene contentState];
  BOOL v6 = v5 == 2;
  if (self->_hidden || WeakRetained == 0 || v4 == 0)
  {
    BOOL v6 = 0;
  }
  else if (self->_shouldPresentAnyContentState && self->_targetDisplayConfiguration)
  {
    BOOL v6 = 1;
  }
  uint64_t v9 = SBLogSystemUIScene();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = WeakRetained != 0;
    int v11 = [(FBScene *)self->_scene identifier];
    BOOL hidden = self->_hidden;
    int v13 = 138544642;
    id v14 = v11;
    __int16 v15 = 1024;
    BOOL v16 = hidden;
    __int16 v17 = 1024;
    BOOL v18 = v6;
    __int16 v19 = 1024;
    BOOL v20 = v10;
    __int16 v21 = 1024;
    int v22 = v4;
    __int16 v23 = 1024;
    BOOL v24 = v5 == 2;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] hidden[%{BOOL}u] shouldBeVisible[%{BOOL}u] hasPresenter[%{BOOL}u] sceneIsValid[%{BOOL}u] contentIsReady[%{BOOL}u]", (uint8_t *)&v13, 0x2Au);
  }
  [(SBSingleSceneController *)self _setVisible:v6];
}

- (void)sceneContentStateDidChange:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (FBScene *)a3;
  if (self->_scene != v5)
  {
    int v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBSingleSceneController.m", 224, @"Invalid parameter not satisfying: %@", @"_scene == scene" object file lineNumber description];
  }
  uint64_t v6 = [(FBScene *)v5 contentState];
  if ((unint64_t)(v6 - 1) >= 2)
  {
    if (!v6)
    {
      uint64_t v9 = SBLogSystemUIScene();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v10 = [(FBScene *)self->_scene identifier];
        *(_DWORD *)buf = 138543362;
        BOOL v18 = v10;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sceneContentStateDidChange: not ready", buf, 0xCu);
      }
      objc_initWeak((id *)buf, self);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __54__SBSingleSceneController_sceneContentStateDidChange___block_invoke;
      v15[3] = &unk_1E6AF4B10;
      objc_copyWeak(&v16, (id *)buf);
      dispatch_async(MEMORY[0x1E4F14428], v15);
      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v7 = SBLogSystemUIScene();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [(FBScene *)self->_scene identifier];
      *(_DWORD *)buf = 138543362;
      BOOL v18 = v8;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sceneContentStateDidChange: preparing or ready", buf, 0xCu);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__SBSingleSceneController_sceneContentStateDidChange___block_invoke_33;
    block[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v13, &location);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __54__SBSingleSceneController_sceneContentStateDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _evaluateVisibility];
}

void __54__SBSingleSceneController_sceneContentStateDidChange___block_invoke_33(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _evaluateVisibility];
}

- (void)sceneDidInvalidate:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (FBScene *)a3;
  if (self->_scene != v5)
  {
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBSingleSceneController.m", 247, @"Invalid parameter not satisfying: %@", @"_scene == scene" object file lineNumber description];
  }
  uint64_t v6 = SBLogSystemUIScene();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(FBScene *)self->_scene identifier];
    *(_DWORD *)buf = 138543362;
    BOOL v10 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] sceneDidInvalidate", buf, 0xCu);
  }
  [(SBSingleSceneController *)self _evaluateVisibility];
}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  uint64_t v6 = [a3 settings];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v17.origin.x = v8;
  v17.origin.y = v10;
  v17.size.width = v12;
  v17.size.height = v14;
  if (!CGRectIsNull(v17))
  {
    v18.origin.x = v8;
    v18.origin.y = v10;
    v18.size.width = v12;
    v18.size.height = v14;
    if (!CGRectIsEmpty(v18))
    {
      [(SBSingleSceneController *)self _evaluateVisibility];
      id v15 = [(SBTraitsOrientedContentViewController *)self->_orientedSceneViewController view];
      objc_msgSend(v15, "setContentViewBoundsInReferenceSpace:", v8, v10, v12, v14);
    }
  }
}

- (void)_setVisible:(BOOL)a3
{
  if (self->_visible != a3)
  {
    self->_visible = a3;
    if (a3)
    {
      scene = self->_scene;
      uint64_t v5 = (void *)SBApp;
      uint64_t v6 = [(FBSDisplayConfiguration *)self->_targetDisplayConfiguration identity];
      double v7 = [v5 userInterfaceStyleProviderForDisplay:v6];
      +[SBSceneSettingsUpdater safeUpdateScene:withUserInterfaceStyle:](SBSceneSettingsUpdater, "safeUpdateScene:withUserInterfaceStyle:", scene, [v7 currentStyle]);

      [(SBSingleSceneController *)self _presentScene];
    }
    else
    {
      [(SBSingleSceneController *)self _dismissScene];
    }
  }
}

- (void)_presentScene
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__SBSingleSceneController__presentScene__block_invoke;
  v2[3] = &unk_1E6AF4AC0;
  v2[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v2];
}

void __40__SBSingleSceneController__presentScene__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
  if (WeakRetained)
  {
    BOOL v3 = SBLogSystemUIScene();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = [*(id *)(*(void *)(a1 + 32) + 96) identifier];
      *(_DWORD *)buf = 138543618;
      double v12 = v4;
      __int16 v13 = 2114;
      id v14 = WeakRetained;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Presenter[%{public}@] will present scene", buf, 0x16u);
    }
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 96);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__SBSingleSceneController__presentScene__block_invoke_35;
    v10[3] = &unk_1E6B0C598;
    v10[4] = v5;
    id v7 = (id)[WeakRetained presentScene:v6 viewControllerBuilderBlock:v10];
    double v8 = *(id **)(a1 + 32);
    double v9 = [v8[3] sceneTraitsDelegate];
    [v8 didUpdateSceneTraitsDelegate:v9];

    if (([*(id *)(*(void *)(a1 + 32) + 32) isActive] & 1) == 0) {
      [*(id *)(*(void *)(a1 + 32) + 32) activate];
    }
  }
}

id __40__SBSingleSceneController__presentScene__block_invoke_35(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_dismissScene
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(UIScenePresenter *)self->_uiScenePresenter isActive]) {
    [(UIScenePresenter *)self->_uiScenePresenter deactivate];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  int v4 = SBLogSystemUIScene();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(FBScene *)self->_scene identifier];
    int v7 = 138543618;
    double v8 = v5;
    __int16 v9 = 2114;
    id v10 = WeakRetained;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Presenter[%{public}@] will dismiss scene", (uint8_t *)&v7, 0x16u);
  }
  id v6 = (id)[WeakRetained dismissScene:self->_scene];
}

- (id)_newActivationContext
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v2 = [(UISceneRequestOptions *)self->_sceneOptions actions];
  BOOL v3 = objc_msgSend(v2, "bs_firstObjectPassingTest:", &__block_literal_global_373);

  if (v3)
  {
    v12[0] = &unk_1F334B510;
    int v4 = [v3 userActivityData];
    v13[0] = v4;
    v12[1] = &unk_1F334B528;
    uint64_t v5 = [v3 activityType];
    v13[1] = v5;
    v12[2] = &unk_1F334B540;
    id v6 = [v3 lastUpdateTime];
    v13[2] = v6;
    int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

    double v8 = (void *)[objc_alloc(MEMORY[0x1E4F42700]) initWithSettings:v7];
    id v9 = objc_alloc_init(MEMORY[0x1E4F42790]);
    id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
    [v9 setActions:v10];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __48__SBSingleSceneController__newActivationContext__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_isClientProcessRunning
{
  BOOL v3 = [MEMORY[0x1E4F62448] sharedInstance];
  int v4 = [v3 processForIdentity:self->_clientIdentity];
  char v5 = [v4 isRunning];

  return v5;
}

- (void)didUpdateSceneTraitsDelegate:(id)a3
{
  char v5 = (SBTraitsSceneParticipantDelegate *)a3;
  id v6 = [(SBTraitsSceneParticipantDelegate *)v5 participant];
  int v7 = self->_lastSceneTraitsParticipantDelegate;
  double v8 = v7;
  if (v7 != v5)
  {
    [(SBTraitsSceneParticipantDelegate *)v7 setActuateOrientationAlongsideBlock:0];
    objc_storeStrong((id *)&self->_lastSceneTraitsParticipantDelegate, a3);
    objc_initWeak(&location, self);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    double v12 = __56__SBSingleSceneController_didUpdateSceneTraitsDelegate___block_invoke;
    __int16 v13 = &unk_1E6AF9470;
    objc_copyWeak(&v14, &location);
    [(SBTraitsSceneParticipantDelegate *)v5 setActuateOrientationAlongsideBlock:&v10];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  -[SBTraitsOrientedContentViewController setContentParticipant:](self->_orientedSceneViewController, "setContentParticipant:", v6, v10, v11, v12, v13);
  [(SBTraitsOrientedContentViewController *)self->_orientedSceneViewController setContainerParticipant:v6];
  [(SBTraitsOrientedContentViewController *)self->_orientedSceneViewController updateOrientationIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained scene:self->_scene didChangeTraitsParticipantDelegate:v5];
  }
}

void __56__SBSingleSceneController_didUpdateSceneTraitsDelegate___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if ((a3 & 3) == 2 && WeakRetained)
  {
    char v5 = WeakRetained;
    [WeakRetained[6] updateOrientationIfNeeded];
    id WeakRetained = v5;
  }
}

- (void)_evaluateSceneForegroundState
{
  targetDisplayConfiguration = self->_targetDisplayConfiguration;
  if (!targetDisplayConfiguration || self->_shouldForegroundForDisplayConfiguration) {
    [(SBSceneSettingsUpdater *)self->_sceneSettingsUpdater setForeground:targetDisplayConfiguration != 0];
  }
}

- (void)_evaluateSceneActivationState
{
  if (self->_shouldActivateForDisplayConfiguration && self->_targetDisplayConfiguration)
  {
    sceneSettingsUpdater = self->_sceneSettingsUpdater;
    id v3 = [(SBSingleSceneController *)self _newActivationContext];
    [(SBSceneSettingsUpdater *)sceneSettingsUpdater setActive:1 withTransitionContext:v3];
  }
}

- (id)traitsOrientedViewController
{
  orientedSceneViewController = self->_orientedSceneViewController;
  if (!orientedSceneViewController)
  {
    int v4 = [[SBTraitsOrientedContentViewController alloc] initWithNibName:0 bundle:0];
    char v5 = self->_orientedSceneViewController;
    self->_orientedSceneViewController = v4;

    id v6 = [(SBTraitsOrientedContentViewController *)self->_orientedSceneViewController view];
    [v6 setContentOrientation:1];
    [v6 setContainerOrientation:1];
    int v7 = [(FBScene *)self->_scene settings];
    [v7 frame];
    objc_msgSend(v6, "setContentViewBoundsInReferenceSpace:");

    [v6 setAutoresizingMask:18];
    if (self->_scene && !self->_uiScenePresenter)
    {
      [0 deactivate];
      [(UIScenePresenter *)self->_uiScenePresenter invalidate];
      double v8 = [(FBScene *)self->_scene uiPresentationManager];
      id v9 = NSString;
      uint64_t v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      uint64_t v12 = [(FBScene *)self->_scene identifier];
      __int16 v13 = (void *)v12;
      id v14 = &stru_1F3084718;
      if (v12) {
        id v14 = (__CFString *)v12;
      }
      uint64_t v15 = [v9 stringWithFormat:@"%@-%@", v11, v14];

      id v16 = [v8 createPresenterWithIdentifier:v15 priority:0];
      uiScenePresenter = self->_uiScenePresenter;
      self->_uiScenePresenter = v16;

      [(UIScenePresenter *)self->_uiScenePresenter modifyPresentationContext:&__block_literal_global_61_3];
      CGRect v18 = [(UIScenePresenter *)self->_uiScenePresenter presentationView];
      [v6 setContentView:v18];
    }
    [(BSInvalidatable *)self->_settingsUpdaterObserverInvalidatable invalidate];
    uint64_t v19 = [(SBSceneSettingsUpdater *)self->_sceneSettingsUpdater addObserver:self];
    settingsUpdaterObserverInvalidatable = self->_settingsUpdaterObserverInvalidatable;
    self->_settingsUpdaterObserverInvalidatable = v19;

    __int16 v21 = [(SBSceneSettingsUpdater *)self->_sceneSettingsUpdater sceneTraitsDelegate];
    [(SBSingleSceneController *)self didUpdateSceneTraitsDelegate:v21];

    orientedSceneViewController = self->_orientedSceneViewController;
  }
  return orientedSceneViewController;
}

void __55__SBSingleSceneController_traitsOrientedViewController__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAppearanceStyle:2];
  id v3 = [MEMORY[0x1E4F428B8] clearColor];
  [v2 setBackgroundColorWhileHosting:v3];

  id v4 = [MEMORY[0x1E4F428B8] clearColor];
  [v2 setBackgroundColorWhileNotHosting:v4];
}

- (id)traitsOrientedResizableViewController
{
  resizableOrientedSceneViewController = self->_resizableOrientedSceneViewController;
  if (!resizableOrientedSceneViewController)
  {
    if ([(SBSingleSceneController *)self isSceneActive])
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"SBSingleSceneController.m" lineNumber:410 description:@"Scene can not be activated to get a proper resizable view controller."];
    }
    [(FBScene *)self->_scene addExtension:objc_opt_class()];
    [(SBSingleSceneController *)self setSceneActive:1];
    [(SBSceneSettingsUpdater *)self->_sceneSettingsUpdater setForeground:1];
    scene = self->_scene;
    uint64_t v6 = objc_opt_class();
    int v7 = [(FBScene *)scene componentForExtension:v6 ofClass:objc_opt_class()];
    hostComponent = self->_hostComponent;
    self->_hostComponent = v7;

    id v9 = [SBTraitsOrientedResizableContentViewController alloc];
    uint64_t v10 = [(SBSingleSceneController *)self traitsOrientedViewController];
    uint64_t v11 = [(SBTraitsOrientedResizableContentViewController *)v9 initWithContentViewController:v10 delegate:self->_hostComponent];
    uint64_t v12 = self->_resizableOrientedSceneViewController;
    self->_resizableOrientedSceneViewController = v11;

    resizableOrientedSceneViewController = self->_resizableOrientedSceneViewController;
  }
  return resizableOrientedSceneViewController;
}

- (NSString)debugDescription
{
  return (NSString *)[(SBSingleSceneController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(SBSingleSceneController *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(SBSingleSceneController *)self scenePersistentIdentifier];
  [v3 appendString:v4 withName:@"scenePersistentIdentifier"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBSingleSceneController *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  char v5 = [(SBSingleSceneController *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__SBSingleSceneController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __65__SBSingleSceneController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) scene];
  id v4 = [v3 identifier];
  [v2 appendString:v4 withName:@"scene"];

  id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isSceneContentVisible"), @"isSceneContentVisible");
  id v6 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 104));
  id v7 = (id)[v6 appendObject:WeakRetained withName:@"presenter"];
}

- (SBFSceneWorkspaceController)sceneWorkspaceController
{
  return self->_sceneWorkspaceController;
}

- (UISceneRequestOptions)sceneOptions
{
  return self->_sceneOptions;
}

- (NSString)traitsRole
{
  return self->_traitsRole;
}

- (FBScene)scene
{
  return self->_scene;
}

- (SBScenePresenting)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (SBScenePresenting *)WeakRetained;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (SBUIKitResizableSceneHostComponent)hostComponent
{
  return self->_hostComponent;
}

- (void)setHostComponent:(id)a3
{
}

- (BOOL)shouldForegroundForDisplayConfiguration
{
  return self->_shouldForegroundForDisplayConfiguration;
}

- (BOOL)shouldActivateForDisplayConfiguration
{
  return self->_shouldActivateForDisplayConfiguration;
}

- (BOOL)shouldActivateUponClientConnection
{
  return self->_shouldActivateUponClientConnection;
}

- (BOOL)shouldBeKeptActiveWhileForeground
{
  return self->_shouldBeKeptActiveWhileForeground;
}

- (BOOL)shouldPresentAnyContentState
{
  return self->_shouldPresentAnyContentState;
}

- (void)setShouldPresentAnyContentState:(BOOL)a3
{
  self->_shouldPresentAnyContentState = a3;
}

- (unint64_t)initialSupportedInterfaceOrientations
{
  return self->_initialSupportedInterfaceOrientations;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)isSceneContentVisible
{
  return self->_sceneContentVisible;
}

- (FBSDisplayConfiguration)targetDisplayConfiguration
{
  return self->_targetDisplayConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDisplayConfiguration, 0);
  objc_storeStrong((id *)&self->_hostComponent, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_traitsRole, 0);
  objc_storeStrong((id *)&self->_sceneOptions, 0);
  objc_storeStrong((id *)&self->_sceneWorkspaceController, 0);
  objc_storeStrong((id *)&self->_resizableOrientedSceneViewController, 0);
  objc_storeStrong((id *)&self->_orientedSceneViewController, 0);
  objc_storeStrong((id *)&self->_lastSceneTraitsParticipantDelegate, 0);
  objc_storeStrong((id *)&self->_uiScenePresenter, 0);
  objc_storeStrong((id *)&self->_sceneSettingsUpdater, 0);
  objc_storeStrong((id *)&self->_settingsUpdaterObserverInvalidatable, 0);
  objc_storeStrong((id *)&self->_clientIdentity, 0);
}

@end
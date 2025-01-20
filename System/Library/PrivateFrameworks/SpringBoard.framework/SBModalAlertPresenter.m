@interface SBModalAlertPresenter
- (BOOL)isForeground;
- (BOOL)isShowingModalAlert;
- (FBScene)scene;
- (FBSceneManager)sceneManager;
- (NSString)description;
- (SBModalAlertPresentationCoordinator)modalAlertPresentationCoordinator;
- (SBModalAlertPresenter)initWithScene:(id)a3;
- (id)_initWithModalAlertPresentationCoordinator:(id)a3 sceneManager:(id)a4 scene:(id)a5;
- (id)acquireVisibleModalAlertAssertionWithDescription:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initForSystemApplication;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)visibleModalAlertCount;
- (void)_addOrRemoveModalAlertPresenterIfNecessary;
- (void)_addOrRemoveModalAlertPresenterIfNecessaryWithForegroundState:(BOOL)a3 fromOrToTerminalState:(BOOL)a4;
- (void)_setScene:(id)a3;
- (void)dealloc;
- (void)decrementVisibleModalAlertCount;
- (void)incrementVisibleModalAlertCount;
- (void)invalidate;
- (void)sceneManager:(id)a3 willUpdateScene:(id)a4 withSettings:(id)a5 transitionContext:(id)a6;
- (void)setModalAlertPresentationCoordinator:(id)a3;
- (void)setSceneManager:(id)a3;
- (void)setVisibleModalAlertCount:(unint64_t)a3;
@end

@implementation SBModalAlertPresenter

- (void)sceneManager:(id)a3 willUpdateScene:(id)a4 withSettings:(id)a5 transitionContext:(id)a6
{
  id v10 = a4;
  id v8 = a5;
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    id v9 = [(SBModalAlertPresenter *)self scene];

    if (v9 == v10) {
      -[SBModalAlertPresenter _addOrRemoveModalAlertPresenterIfNecessaryWithForegroundState:fromOrToTerminalState:](self, "_addOrRemoveModalAlertPresenterIfNecessaryWithForegroundState:fromOrToTerminalState:", [v8 isForeground], 0);
    }
  }
}

- (FBScene)scene
{
  return self->_scene;
}

- (void)_addOrRemoveModalAlertPresenterIfNecessaryWithForegroundState:(BOOL)a3 fromOrToTerminalState:(BOOL)a4
{
  BOOL v4 = a3;
  BSDispatchQueueAssertMain();
  if (!self->_modalAlertPresentationCoordinator)
  {
    v7 = [(id)SBApp modalAlertPresentationCoordinator];
    modalAlertPresentationCoordinator = self->_modalAlertPresentationCoordinator;
    self->_modalAlertPresentationCoordinator = v7;

    if (!self->_modalAlertPresentationCoordinator)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"SBModalAlertPresenter.m" lineNumber:216 description:@"SBModalAlertPresenter was Unable to retrieve a presentation coordinator."];
    }
  }
  BOOL v9 = [(SBModalAlertPresenter *)self isShowingModalAlert];
  id v10 = self->_modalAlertPresentationCoordinator;
  if (v9 && v4)
  {
    [(SBModalAlertPresentationCoordinator *)v10 _addModalAlertPresenterIfNecessary:self];
  }
  else
  {
    [(SBModalAlertPresentationCoordinator *)v10 _removeModalAlertPresenter:self];
  }
}

- (BOOL)isShowingModalAlert
{
  return self->_visibleModalAlertCount || [(NSHashTable *)self->_visibleAlertAssertions count] != 0;
}

- (SBModalAlertPresenter)initWithScene:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBModalAlertPresenter.m", 65, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];
  }
  v6 = [MEMORY[0x1E4F62490] sharedInstance];
  v7 = [(SBModalAlertPresenter *)self _initWithModalAlertPresentationCoordinator:0 sceneManager:v6 scene:v5];

  return v7;
}

- (id)_initWithModalAlertPresentationCoordinator:(id)a3 sceneManager:(id)a4 scene:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v11)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBModalAlertPresenter.m", 39, @"Invalid parameter not satisfying: %@", @"sceneManager" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)SBModalAlertPresenter;
  v13 = [(SBModalAlertPresenter *)&v18 init];
  if (v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    visibleAlertAssertions = v13->_visibleAlertAssertions;
    v13->_visibleAlertAssertions = (NSHashTable *)v14;

    objc_storeStrong((id *)&v13->_modalAlertPresentationCoordinator, a3);
    objc_storeStrong((id *)&v13->_sceneManager, a4);
    objc_storeStrong((id *)&v13->_scene, a5);
    if (v13->_scene) {
      [(FBSceneManager *)v13->_sceneManager addObserver:v13];
    }
  }

  return v13;
}

- (id)initForSystemApplication
{
  v3 = [MEMORY[0x1E4F62490] sharedInstance];
  BOOL v4 = [(SBModalAlertPresenter *)self _initWithModalAlertPresentationCoordinator:0 sceneManager:v3 scene:0];

  if (v4) {
    v4[41] = 1;
  }
  return v4;
}

- (void)dealloc
{
  [(FBSceneManager *)self->_sceneManager removeObserver:self];
  [(SBModalAlertPresentationCoordinator *)self->_modalAlertPresentationCoordinator _removeModalAlertPresenter:self];
  v3.receiver = self;
  v3.super_class = (Class)SBModalAlertPresenter;
  [(SBModalAlertPresenter *)&v3 dealloc];
}

- (BOOL)isForeground
{
  if (self->_isSystemPresenter)
  {
    LOBYTE(scene) = 1;
  }
  else
  {
    scene = self->_scene;
    if (scene)
    {
      objc_super v3 = [(FBScene *)scene settings];
      char v4 = [v3 isForeground];

      LOBYTE(scene) = v4;
    }
  }
  return (char)scene;
}

- (void)setVisibleModalAlertCount:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  if (self->_visibleModalAlertCount != a3)
  {
    self->_visibleModalAlertCount = a3;
    id v5 = SBLogAlertItems();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(FBScene *)self->_scene identityToken];
      v7 = [v6 stringRepresentation];
      int v8 = 138412546;
      BOOL v9 = v7;
      __int16 v10 = 2048;
      unint64_t v11 = a3;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Setting visible modal alert count for [%@] to %zu", (uint8_t *)&v8, 0x16u);
    }
    [(SBModalAlertPresenter *)self _addOrRemoveModalAlertPresenterIfNecessary];
  }
}

- (void)incrementVisibleModalAlertCount
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  ++self->_visibleModalAlertCount;
  objc_super v3 = SBLogAlertItems();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = [(FBScene *)self->_scene identityToken];
    id v5 = [v4 stringRepresentation];
    unint64_t visibleModalAlertCount = self->_visibleModalAlertCount;
    int v7 = 138412546;
    int v8 = v5;
    __int16 v9 = 2048;
    unint64_t v10 = visibleModalAlertCount;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Incremented visible modal alert count for [%@] to %zu", (uint8_t *)&v7, 0x16u);
  }
  [(SBModalAlertPresenter *)self _addOrRemoveModalAlertPresenterIfNecessary];
}

- (void)decrementVisibleModalAlertCount
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  unint64_t visibleModalAlertCount = self->_visibleModalAlertCount;
  if (visibleModalAlertCount)
  {
    self->_unint64_t visibleModalAlertCount = visibleModalAlertCount - 1;
    char v4 = SBLogAlertItems();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(FBScene *)self->_scene identityToken];
      v6 = [v5 stringRepresentation];
      unint64_t v7 = self->_visibleModalAlertCount;
      int v8 = 138412546;
      __int16 v9 = v6;
      __int16 v10 = 2048;
      unint64_t v11 = v7;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Decremented visible modal alert count for [%@] to %zu", (uint8_t *)&v8, 0x16u);
    }
    [(SBModalAlertPresenter *)self _addOrRemoveModalAlertPresenterIfNecessary];
  }
}

- (id)acquireVisibleModalAlertAssertionWithDescription:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__SBModalAlertPresenter_acquireVisibleModalAlertAssertionWithDescription___block_invoke;
  v11[3] = &unk_1E6AF4940;
  v11[4] = self;
  v6 = (void *)[v5 initWithIdentifier:@"modalAlertPresenterContentAssertion" forReason:v4 queue:MEMORY[0x1E4F14428] invalidationBlock:v11];

  unint64_t v7 = SBLogAlertItems();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [(FBScene *)self->_scene identifier];
    NSUInteger v9 = [(NSHashTable *)self->_visibleAlertAssertions count];
    *(_DWORD *)buf = 134218498;
    v13 = v6;
    __int16 v14 = 2114;
    v15 = v8;
    __int16 v16 = 2048;
    NSUInteger v17 = v9 + 1;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Acquiring visible modal alert assertion (%p) for presenter: %{public}@, count %zu", buf, 0x20u);
  }
  [(NSHashTable *)self->_visibleAlertAssertions addObject:v6];
  return v6;
}

void __74__SBModalAlertPresenter_acquireVisibleModalAlertAssertionWithDescription___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogAlertItems();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 24) identifier];
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 48) count];
    int v7 = 134218498;
    id v8 = v3;
    __int16 v9 = 2114;
    __int16 v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v6 - 1;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating visible modal alert assertion (%p) for presenter: %{public}@, count %zu", (uint8_t *)&v7, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 32) + 48) removeObject:v3];
  [*(id *)(a1 + 32) _addOrRemoveModalAlertPresenterIfNecessary];
}

- (void)invalidate
{
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(SBModalAlertPresentationCoordinator *)self->_modalAlertPresentationCoordinator _removeModalAlertPresenter:self];
    sceneManager = self->_sceneManager;
    [(FBSceneManager *)sceneManager removeObserver:self];
  }
}

- (NSString)description
{
  return (NSString *)[(SBModalAlertPresenter *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBModalAlertPresenter *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBModalAlertPresenter *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBModalAlertPresenter *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__SBModalAlertPresenter_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v5 = v4;
  id v10 = v5;
  __int16 v11 = self;
  id v6 = (id)[v5 modifyProem:v9];
  id v7 = v5;

  return v7;
}

id __63__SBModalAlertPresenter_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 32) withName:@"alertCount"];
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v3 + 41))
  {
    id v5 = (id)[*(id *)(a1 + 32) appendBool:1 withName:@"isSystemPresenter"];
  }
  else
  {
    id v6 = [*(id *)(v3 + 24) identifier];
    [v4 appendString:v6 withName:@"sceneID"];

    id v7 = *(void **)(a1 + 32);
    id v8 = [*(id *)(*(void *)(a1 + 40) + 24) clientProcess];
    __int16 v9 = [v8 bundleIdentifier];
    [v7 appendString:v9 withName:@"bundleID"];
  }
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"visibleAlertAssertions"];
}

- (void)_addOrRemoveModalAlertPresenterIfNecessary
{
  BOOL v3 = [(SBModalAlertPresenter *)self isForeground];
  [(SBModalAlertPresenter *)self _addOrRemoveModalAlertPresenterIfNecessaryWithForegroundState:v3 fromOrToTerminalState:0];
}

- (void)_setScene:(id)a3
{
}

- (unint64_t)visibleModalAlertCount
{
  return self->_visibleModalAlertCount;
}

- (SBModalAlertPresentationCoordinator)modalAlertPresentationCoordinator
{
  return self->_modalAlertPresentationCoordinator;
}

- (void)setModalAlertPresentationCoordinator:(id)a3
{
}

- (FBSceneManager)sceneManager
{
  return self->_sceneManager;
}

- (void)setSceneManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleAlertAssertions, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_modalAlertPresentationCoordinator, 0);
}

@end
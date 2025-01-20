@interface SBSceneHandle
- (BOOL)_handleSceneAction:(id)a3;
- (BOOL)_manuallyControlsLifecycle;
- (BOOL)isContentReady;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPairedWithExternalSceneWithIdentifier:(id)a3;
- (FBSDisplayIdentity)displayIdentity;
- (FBSSceneDefinition)_definition;
- (FBSSceneIdentity)_sceneIdentity;
- (FBScene)scene;
- (FBScene)sceneIfExists;
- (FBSceneMonitor)_sceneMonitor;
- (NSString)description;
- (NSString)sceneIdentifier;
- (SBSceneHandle)init;
- (SBSceneManager)sceneManager;
- (id)_createMonitor;
- (id)_initWithDefinition:(id)a3 displayIdentity:(id)a4;
- (id)_initWithDefinition:(id)a3 scene:(id)a4 displayIdentity:(id)a5;
- (id)_initWithScene:(id)a3 displayIdentity:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)contentState;
- (unint64_t)hash;
- (void)_didCreateScene:(id)a3;
- (void)_didDestroyScene:(id)a3;
- (void)_didUpdateClientSettingsWithDiff:(id)a3 transitionContext:(id)a4;
- (void)_didUpdateContentState:(int64_t)a3;
- (void)_didUpdatePairingStatusForExternalSceneIdentifiers:(id)a3;
- (void)_didUpdateSettingsWithDiff:(id)a3 previousSettings:(id)a4;
- (void)_enumerateObserversWithBlock:(id)a3;
- (void)_noteDidMoveFromSceneManager:(id)a3;
- (void)_noteReplacedWithSceneHandle:(id)a3;
- (void)_noteSceneCreated:(id)a3;
- (void)_noteSceneDestroyed:(id)a3;
- (void)_setDisplayIdentity:(id)a3;
- (void)_setManuallyControlsLifecycle:(BOOL)a3;
- (void)_setScene:(id)a3;
- (void)_setSceneMonitor:(id)a3;
- (void)addActionConsumer:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeActionConsumer:(id)a3;
- (void)removeObserver:(id)a3;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneMonitor:(id)a3 pairingStatusDidChangeForExternalSceneIDs:(id)a4;
- (void)sceneMonitor:(id)a3 sceneClientSettingsDidChangeWithDiff:(id)a4 transitionContext:(id)a5;
- (void)sceneMonitor:(id)a3 sceneSettingsDidChangeWithDiff:(id)a4 previousSettings:(id)a5;
- (void)sceneMonitor:(id)a3 sceneWasCreated:(id)a4;
- (void)sceneMonitor:(id)a3 sceneWasDestroyed:(id)a4;
- (void)setSceneManager:(id)a3;
@end

@implementation SBSceneHandle

- (FBSDisplayIdentity)displayIdentity
{
  v3 = [(SBSceneHandle *)self sceneManager];
  v4 = [v3 displayIdentity];
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = [(SBSceneHandle *)self sceneIfExists];
    v8 = [v7 settings];
    objc_msgSend(v8, "sb_displayIdentityForSceneManagers");
    v9 = (FBSDisplayIdentity *)objc_claimAutoreleasedReturnValue();
    displayIdentity = v9;
    if (!v9) {
      displayIdentity = self->_displayIdentity;
    }
    v6 = displayIdentity;
  }

  return v6;
}

- (FBSSceneDefinition)_definition
{
  return self->_definition;
}

- (void)_didCreateScene:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __33__SBSceneHandle__didCreateScene___block_invoke;
  v3[3] = &unk_2645D3D98;
  v3[4] = self;
  [(SBSceneHandle *)self _enumerateObserversWithBlock:v3];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBSceneHandle *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_scene withName:@"scene"];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = [(SBSceneHandle *)self sceneIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"sceneID"];

  id v6 = (id)[v3 appendPointer:self->_scene withName:@"scenePointer"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(SBSceneHandle *)self sceneIdentifier];
    v7 = [v5 sceneIdentifier];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)sceneContentStateDidChange:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!self->_scene)
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBSceneHandle.m" lineNumber:408 description:@"A scene is required for the content host manager state to change."];

    id v5 = v7;
  }
  -[SBSceneHandle _didUpdateContentState:](self, "_didUpdateContentState:", [v5 contentState]);
}

- (void)_didUpdateContentState:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__SBSceneHandle__didUpdateContentState___block_invoke;
  v3[3] = &unk_2645D3DC0;
  v3[4] = self;
  void v3[5] = a3;
  [(SBSceneHandle *)self _enumerateObserversWithBlock:v3];
}

- (void)_didUpdateClientSettingsWithDiff:(id)a3 transitionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__SBSceneHandle__didUpdateClientSettingsWithDiff_transitionContext___block_invoke;
  v10[3] = &unk_2645D3DE8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SBSceneHandle *)self _enumerateObserversWithBlock:v10];
}

- (void)_didUpdateSettingsWithDiff:(id)a3 previousSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__SBSceneHandle__didUpdateSettingsWithDiff_previousSettings___block_invoke;
  v10[3] = &unk_2645D3DE8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SBSceneHandle *)self _enumerateObserversWithBlock:v10];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    observers = self->_observers;
    id v13 = v5;
    if (!observers)
    {
      id v7 = [MEMORY[0x263F088B0] weakObjectsHashTable];
      id v8 = self->_observers;
      self->_observers = v7;

      id v9 = [MEMORY[0x263F08968] mapTableWithKeyOptions:517 valueOptions:0];
      observersToObserverBehaviors = self->_observersToObserverBehaviors;
      self->_observersToObserverBehaviors = v9;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v13];
    id v11 = self->_observersToObserverBehaviors;
    id v12 = +[_SBSceneHandleObserverBehavior behaviorFromObserver:v13];
    [(NSMapTable *)v11 setObject:v12 forKey:v13];

    id v5 = v13;
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)_enumerateObserversWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, void *))a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      id v11 = v8;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        id v8 = [(NSMapTable *)self->_observersToObserverBehaviors objectForKey:v12];

        if (v8) {
          v4[2](v4, v12, v8);
        }
        ++v10;
        id v11 = v8;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (unint64_t)hash
{
  v2 = [(SBSceneHandle *)self sceneIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)sceneIdentifier
{
  v2 = [(FBSSceneDefinition *)self->_definition identity];
  unint64_t v3 = [v2 identifier];

  return (NSString *)v3;
}

void __61__SBSceneHandle__didUpdateSettingsWithDiff_previousSettings___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 didUpdateSettingsWithDiff]) {
    [v5 sceneHandle:a1[4] didUpdateSettingsWithDiff:a1[5] previousSettings:a1[6]];
  }
}

void __68__SBSceneHandle__didUpdateClientSettingsWithDiff_transitionContext___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 didUpdateClientSettingsWithDiff]) {
    [v5 sceneHandle:a1[4] didUpdateClientSettingsWithDiff:a1[5] transitionContext:a1[6]];
  }
}

void __40__SBSceneHandle__didUpdateContentState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 didUpdateContentState]) {
    [v5 sceneHandle:*(void *)(a1 + 32) didUpdateContentState:*(void *)(a1 + 40)];
  }
}

void __33__SBSceneHandle__didCreateScene___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 didCreateScene]) {
    [v5 sceneHandle:*(void *)(a1 + 32) didCreateScene:*(void *)(*(void *)(a1 + 32) + 16)];
  }
}

- (BOOL)isContentReady
{
  return [(SBSceneHandle *)self contentState] == 2;
}

- (int64_t)contentState
{
  v2 = [(SBSceneHandle *)self sceneIfExists];
  unint64_t v3 = v2;
  if (v2) {
    int64_t v4 = [v2 contentState];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (FBScene)sceneIfExists
{
  return self->_scene;
}

- (void)sceneMonitor:(id)a3 sceneSettingsDidChangeWithDiff:(id)a4 previousSettings:(id)a5
{
  if (a4)
  {
    if (self->_scene) {
      [(SBSceneHandle *)self _didUpdateSettingsWithDiff:a4 previousSettings:a5];
    }
  }
}

- (void)sceneMonitor:(id)a3 sceneClientSettingsDidChangeWithDiff:(id)a4 transitionContext:(id)a5
{
  if (a4)
  {
    if (self->_scene) {
      [(SBSceneHandle *)self _didUpdateClientSettingsWithDiff:a4 transitionContext:a5];
    }
  }
}

- (FBScene)scene
{
  scene = self->_scene;
  if (!scene)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBSceneHandle.m", 133, @"Required scene wasn't found from scene handle: %@", self object file lineNumber description];

    scene = self->_scene;
  }

  return scene;
}

- (BOOL)isPairedWithExternalSceneWithIdentifier:(id)a3
{
  return [(FBSceneMonitor *)self->_sceneMonitor isPairedWithExternalSceneID:a3];
}

- (NSString)description
{
  return (NSString *)[(SBSceneHandle *)self descriptionWithMultilinePrefix:0];
}

- (void)sceneMonitor:(id)a3 sceneWasCreated:(id)a4
{
  if (!self->_manuallyControlsLifecycle) {
    [(SBSceneHandle *)self _setScene:a4];
  }
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(SBSceneHandle *)self descriptionBuilderWithMultilinePrefix:a3];
  int64_t v4 = [v3 build];

  return v4;
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    observersToObserverBehaviors = self->_observersToObserverBehaviors;
    id v5 = a3;
    [(NSMapTable *)observersToObserverBehaviors removeObjectForKey:v5];
    [(NSHashTable *)self->_observers removeObject:v5];
  }
}

- (void)_noteSceneCreated:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!self->_manuallyControlsLifecycle)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBSceneHandle.m" lineNumber:311 description:@"Cannot have scene creation/destruction invoked when using a scene monitor for lifecycle events."];

    id v5 = v7;
  }
  [(SBSceneHandle *)self _setScene:v5];
}

- (void)_setScene:(id)a3
{
  int64_t v4 = (FBScene *)a3;
  scene = self->_scene;
  if (scene != v4)
  {
    uint64_t v10 = v4;
    uint64_t v6 = v4;
    id v7 = self->_scene;
    self->_scene = v6;
    id v8 = scene;

    uint64_t v9 = self->_scene;
    if (v9)
    {
      [(FBScene *)v9 addObserver:self];
      [(SBSceneHandle *)self _didCreateScene:self->_scene];
    }
    else
    {
      [(FBScene *)v8 removeObserver:self];
      [(SBSceneHandle *)self _didDestroyScene:v8];
    }

    int64_t v4 = v10;
  }
}

- (BOOL)_handleSceneAction:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSHashTable *)self->_actionConsumers allObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "sceneHandle:didReceiveAction:", self, v4, (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (SBSceneHandle)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBSceneHandle.m" lineNumber:59 description:@"init is unavailable for SBSceneHandle."];

  return 0;
}

- (id)_initWithScene:(id)a3 displayIdentity:(id)a4
{
  return [(SBSceneHandle *)self _initWithDefinition:0 scene:a3 displayIdentity:a4];
}

- (id)_initWithDefinition:(id)a3 displayIdentity:(id)a4
{
  return [(SBSceneHandle *)self _initWithDefinition:a3 scene:0 displayIdentity:a4];
}

- (id)_initWithDefinition:(id)a3 scene:(id)a4 displayIdentity:(id)a5
{
  unint64_t v9 = (unint64_t)a3;
  unint64_t v10 = (unint64_t)a4;
  id v11 = a5;
  if (!(v9 | v10))
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"SBSceneHandle.m" lineNumber:72 description:@"Scene or definition must be provided."];
  }
  v25.receiver = self;
  v25.super_class = (Class)SBSceneHandle;
  long long v12 = [(SBSceneHandle *)&v25 init];
  long long v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_displayIdentity, a5);
    if (v10)
    {
      long long v14 = [(id)v10 definition];
    }
    else
    {
      long long v14 = (FBSSceneDefinition *)(id)v9;
    }
    definition = v13->_definition;
    v13->_definition = v14;

    uint64_t v16 = [(SBSceneHandle *)v13 _createMonitor];
    sceneMonitor = v13->_sceneMonitor;
    v13->_sceneMonitor = (FBSceneMonitor *)v16;

    [(FBSceneMonitor *)v13->_sceneMonitor setDelegate:v13];
    [(SBSceneHandle *)v13 _commonInit];
    uint64_t v18 = [(FBSceneMonitor *)v13->_sceneMonitor scene];
    id v19 = v18;
    if (v10)
    {

      if (v19 != (id)v10)
      {
        v24 = [MEMORY[0x263F08690] currentHandler];
        [v24 handleFailureInMethod:a2 object:v13 file:@"SBSceneHandle.m" lineNumber:87 description:@"Given scene and monitor'd scene do not match."];
      }
      [(SBSceneHandle *)v13 _setScene:v10];
    }
    else
    {
      int v20 = [v18 isValid];

      if (v20)
      {
        v21 = [(FBSceneMonitor *)v13->_sceneMonitor scene];
        [(SBSceneHandle *)v13 _setScene:v21];
      }
    }
  }

  return v13;
}

- (void)setSceneManager:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManager);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_sceneManager);
    objc_storeWeak((id *)&self->_sceneManager, obj);
    displayIdentity = self->_displayIdentity;
    self->_displayIdentity = 0;

    [(SBSceneHandle *)self _noteDidMoveFromSceneManager:v5];
  }
}

- (void)_noteDidMoveFromSceneManager:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__SBSceneHandle__noteDidMoveFromSceneManager___block_invoke;
  v6[3] = &unk_2645D3D70;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBSceneHandle *)self _enumerateObserversWithBlock:v6];
}

void __46__SBSceneHandle__noteDidMoveFromSceneManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sceneHandle:*(void *)(a1 + 32) didMoveFromSceneManager:*(void *)(a1 + 40)];
  }
}

- (void)dealloc
{
  [(FBScene *)self->_scene removeObserver:self];
  id v3 = self->_sceneMonitor;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__SBSceneHandle_dealloc__block_invoke;
  block[3] = &unk_2645D3CD0;
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  v5.receiver = self;
  v5.super_class = (Class)SBSceneHandle;
  [(SBSceneHandle *)&v5 dealloc];
}

uint64_t __24__SBSceneHandle_dealloc__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:0];
  v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

- (void)addActionConsumer:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    actionConsumers = self->_actionConsumers;
    id v9 = v5;
    if (!actionConsumers)
    {
      id v7 = [MEMORY[0x263F088B0] weakObjectsHashTable];
      uint64_t v8 = self->_actionConsumers;
      self->_actionConsumers = v7;

      actionConsumers = self->_actionConsumers;
    }
    id v4 = (id)[(NSHashTable *)actionConsumers addObject:v9];
    id v5 = v9;
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)removeActionConsumer:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v7 = v4;
    [(NSHashTable *)self->_actionConsumers removeObject:v4];
    id v4 = [(NSHashTable *)self->_actionConsumers count];
    id v5 = v7;
    if (!v4)
    {
      actionConsumers = self->_actionConsumers;
      self->_actionConsumers = 0;

      id v5 = v7;
    }
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)_didDestroyScene:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__SBSceneHandle__didDestroyScene___block_invoke;
  v6[3] = &unk_2645D3D70;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBSceneHandle *)self _enumerateObserversWithBlock:v6];
}

void __34__SBSceneHandle__didDestroyScene___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 didDestroyScene]) {
    [v5 sceneHandle:*(void *)(a1 + 32) didDestroyScene:*(void *)(a1 + 40)];
  }
}

- (void)_didUpdatePairingStatusForExternalSceneIdentifiers:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__SBSceneHandle__didUpdatePairingStatusForExternalSceneIdentifiers___block_invoke;
  v6[3] = &unk_2645D3D70;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBSceneHandle *)self _enumerateObserversWithBlock:v6];
}

void __68__SBSceneHandle__didUpdatePairingStatusForExternalSceneIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 didUpdatePairingStatusForExternalSceneIdentifiers]) {
    [v5 sceneHandle:*(void *)(a1 + 32) didUpdatePairingStatusForExternalSceneIdentifiers:*(void *)(a1 + 40)];
  }
}

- (FBSSceneIdentity)_sceneIdentity
{
  return (FBSSceneIdentity *)[(FBSSceneDefinition *)self->_definition identity];
}

- (void)_setSceneMonitor:(id)a3
{
  id v5 = (FBSceneMonitor *)a3;
  p_sceneMonitor = &self->_sceneMonitor;
  sceneMonitor = self->_sceneMonitor;
  uint64_t v8 = v5;
  if (sceneMonitor != v5)
  {
    [(FBSceneMonitor *)sceneMonitor setDelegate:0];
    [(FBSceneMonitor *)*p_sceneMonitor invalidate];
    objc_storeStrong((id *)&self->_sceneMonitor, a3);
    if (*p_sceneMonitor) {
      [(FBSceneMonitor *)*p_sceneMonitor setDelegate:self];
    }
  }
}

- (id)_createMonitor
{
  id v3 = objc_alloc(MEMORY[0x263F3F4F8]);
  id v4 = [(SBSceneHandle *)self sceneIdentifier];
  id v5 = (void *)[v3 initWithSceneID:v4];

  return v5;
}

- (void)_noteSceneDestroyed:(id)a3
{
  id v5 = (FBScene *)a3;
  if (!self->_manuallyControlsLifecycle)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBSceneHandle.m" lineNumber:316 description:@"Cannot have scene creation/destruction invoked when using a scene monitor for lifecycle events."];
  }
  scene = self->_scene;
  if (scene) {
    BOOL v7 = scene == v5;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(SBSceneHandle *)(uint64_t *)&self->_scene _noteSceneDestroyed:v8];
    }

    scene = self->_scene;
  }
  if (scene && scene != v5)
  {
    unint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBSceneHandle.m" lineNumber:320 description:@"Scene destroyed did not match the scene being tracked."];
  }
  [(SBSceneHandle *)self _setScene:0];
}

- (void)_noteReplacedWithSceneHandle:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__SBSceneHandle__noteReplacedWithSceneHandle___block_invoke;
  v6[3] = &unk_2645D3D70;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBSceneHandle *)self _enumerateObserversWithBlock:v6];
}

void __46__SBSceneHandle__noteReplacedWithSceneHandle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 replacedWithSceneHandle]) {
    [v5 sceneHandle:*(void *)(a1 + 32) replacedWithSceneHandle:*(void *)(a1 + 40)];
  }
}

- (id)succinctDescription
{
  v2 = [(SBSceneHandle *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (void)sceneMonitor:(id)a3 sceneWasDestroyed:(id)a4
{
  id v10 = a3;
  id v7 = (FBScene *)a4;
  uint64_t v8 = v7;
  if (!self->_manuallyControlsLifecycle)
  {
    if (self->_scene != v7)
    {
      id v9 = [MEMORY[0x263F08690] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"SBSceneHandle.m" lineNumber:378 description:@"Scene destroyed did not match the scene being tracked."];
    }
    [(SBSceneHandle *)self _setScene:0];
  }
}

- (void)sceneMonitor:(id)a3 pairingStatusDidChangeForExternalSceneIDs:(id)a4
{
  if (self->_scene) {
    [(SBSceneHandle *)self _didUpdatePairingStatusForExternalSceneIdentifiers:a4];
  }
}

- (SBSceneManager)sceneManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManager);

  return (SBSceneManager *)WeakRetained;
}

- (void)_setDisplayIdentity:(id)a3
{
}

- (FBSceneMonitor)_sceneMonitor
{
  return self->_sceneMonitor;
}

- (BOOL)_manuallyControlsLifecycle
{
  return self->_manuallyControlsLifecycle;
}

- (void)_setManuallyControlsLifecycle:(BOOL)a3
{
  self->_manuallyControlsLifecycle = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneManager);
  objc_storeStrong((id *)&self->_actionConsumers, 0);
  objc_storeStrong((id *)&self->_observersToObserverBehaviors, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sceneMonitor, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_storeStrong((id *)&self->_scene, 0);

  objc_storeStrong((id *)&self->_definition, 0);
}

- (void)_noteSceneDestroyed:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_2218C9000, log, OS_LOG_TYPE_ERROR, "*** _noteSceneDestroyed will assert: _scene %{public}@ does not match scene being destroyed %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
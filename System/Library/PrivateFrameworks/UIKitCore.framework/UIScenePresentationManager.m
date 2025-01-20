@interface UIScenePresentationManager
+ (id)sceneHostingGraph;
- (BOOL)_hasPresenterWithIdentifier:(id)a3;
- (BOOL)isInvalidated;
- (FBScene)scene;
- (NSString)description;
- (UIScenePresentationContext)defaultPresentationContext;
- (UIScenePresentationManager)init;
- (UIScenePresentationManagerDelegate)delegate;
- (id)_initWithScene:(id)a3;
- (id)_initWithScene:(id)a3 keyboardProxyLayerManager:(id)a4 keyboardProxyPresentationEnvironment:(id)a5;
- (id)_presenterWithIdentifier:(id)a3;
- (id)createPresenterForLayerTarget:(id)a3 identifier:(id)a4;
- (id)createPresenterForLayerTarget:(id)a3 identifier:(id)a4 priority:(int64_t)a5;
- (id)createPresenterWithIdentifier:(id)a3;
- (id)createPresenterWithIdentifier:(id)a3 priority:(int64_t)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)snapshotContext;
- (id)snapshotPresentationForSnapshot:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)_defaultPresentationPriority;
- (void)_addPrioritizedPresenterObserver:(id)a3;
- (void)_removePrioritizedPresenterObserver:(id)a3;
- (void)modifyDefaultPresentationContext:(id)a3;
- (void)owner:(id)a3 willPrioritizePresenter:(id)a4 deactivatePresenter:(id)a5;
- (void)ownerDidInvalidateLastPresenter:(id)a3;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidInvalidate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation UIScenePresentationManager

- (void)modifyDefaultPresentationContext:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, void *))a3;
  if (!v5)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"UIScenePresentationManager.m", 112, @"Invalid parameter not satisfying: %@", @"modifyBlock" object file lineNumber description];
  }
  if ([(UIScenePresentationManager *)self isInvalidated])
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"UIScenePresentationManager.m" lineNumber:113 description:@"Cannot modify the default presentation context if the presentation manager is already invalidated"];
  }
  v6 = (void *)[(UIScenePresentationContext *)self->_defaultScenePresentationContext mutableCopy];
  v5[2](v5, v6);
  v7 = UIScenePresentationLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

  if (v8)
  {
    v9 = UIScenePresentationLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
      v22 = [WeakRetained identifier];
      v23 = [NSNumber numberWithBool:BSEqualObjects()];
      defaultScenePresentationContext = self->_defaultScenePresentationContext;
      *(_DWORD *)buf = 138413058;
      v42 = v22;
      __int16 v43 = 2112;
      v44 = v23;
      __int16 v45 = 2112;
      v46 = defaultScenePresentationContext;
      __int16 v47 = 2112;
      v48 = v6;
      _os_log_debug_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEBUG, "Modify default presentation context on %@ (equal? %@), prevContext: %@, newContext: %@", buf, 0x2Au);
    }
  }
  if ((BSEqualObjects() & 1) == 0)
  {
    SEL v28 = a2;
    v30 = v6;
    v10 = (UIScenePresentationContext *)[v6 copy];
    v11 = self->_defaultScenePresentationContext;
    self->_defaultScenePresentationContext = v10;

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__UIScenePresentationManager_modifyDefaultPresentationContext___block_invoke;
    aBlock[3] = &unk_1E52EFA78;
    aBlock[4] = self;
    v12 = _Block_copy(aBlock);
    scenePresenterOwner = self->_scenePresenterOwner;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __63__UIScenePresentationManager_modifyDefaultPresentationContext___block_invoke_3;
    v37[3] = &unk_1E52EFAA0;
    id v29 = v12;
    id v38 = v29;
    [(_UIScenePresenterOwner *)scenePresenterOwner enumeratePresentersUsingBlock:v37];
    v14 = (void *)[(UIScenePresentationContext *)self->_defaultScenePresentationContext mutableCopy];
    [v14 _setLayerTargetsToExclude:0];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v15 = [(NSMapTable *)self->_mapLayersToPresenterOwners objectEnumerator];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v40 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __63__UIScenePresentationManager_modifyDefaultPresentationContext___block_invoke_4;
          v31[3] = &unk_1E52EF740;
          id v32 = v14;
          [v20 enumeratePresentersUsingBlock:v31];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v40 count:16];
      }
      while (v17);
    }

    if ([(UIScenePresentationContext *)self->_defaultScenePresentationContext _isVisibilityPropagationEnabled])
    {
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:v28 object:self file:@"UIScenePresentationManager.m" lineNumber:148 description:@"Toggling visibility propagation on the default scene presentation context is not supported."];
    }
    v6 = v30;
  }
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

uint64_t __57__UIScenePresentationManager_sceneContentStateDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _setVisibilityPropagationEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (void)sceneContentStateDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  BOOL v5 = [WeakRetained contentState] != 0;

  scenePresenterOwner = self->_scenePresenterOwner;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__UIScenePresentationManager_sceneContentStateDidChange___block_invoke;
  v7[3] = &__block_descriptor_33_e31_v24__0___UIScenePresenter_8_B16l;
  BOOL v8 = v5;
  [(_UIScenePresenterOwner *)scenePresenterOwner enumeratePresentersUsingBlock:v7];
}

uint64_t __63__UIScenePresentationManager_modifyDefaultPresentationContext___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _setDefaultPresentationContext:*(void *)(*(void *)(a1 + 32) + 56)];
}

- (id)_initWithScene:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[_UISceneKeyboardProxyLayerForwardingManager sharedInstance];
  v6 = -[_UISceneKeyboardProxyLayerForwardingPresentationScene initWithScene:]([_UISceneKeyboardProxyLayerForwardingPresentationScene alloc], v4);
  id v7 = [(UIScenePresentationManager *)self _initWithScene:v4 keyboardProxyLayerManager:v5 keyboardProxyPresentationEnvironment:v6];

  return v7;
}

- (void)owner:(id)a3 willPrioritizePresenter:(id)a4 deactivatePresenter:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = (_UIScenePresenterOwner *)a3;
  id v8 = a4;
  if (self->_scenePresenterOwner == v7)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v12 = self->_prioritizedPresenterObservers;
    uint64_t v13 = [(NSHashTable *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * i) _presentationManager:self willPrioritizePresenter:v8];
        }
        uint64_t v14 = [(NSHashTable *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }
  }
  else
  {
    v9 = [(UIScenePresentationContext *)self->_defaultScenePresentationContext _layerTargetsToExclude];
    v10 = (void *)[v9 mutableCopy];

    if (!v10)
    {
      v10 = [MEMORY[0x1E4F1CA80] set];
    }
    v11 = [(_UIScenePresenterOwner *)v7 context];
    if (v8) {
      [v10 addObject:v11];
    }
    else {
      [v10 removeObject:v11];
    }

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __80__UIScenePresentationManager_owner_willPrioritizePresenter_deactivatePresenter___block_invoke;
    v17[3] = &unk_1E52E0698;
    id v18 = v10;
    v12 = v10;
    [(UIScenePresentationManager *)self modifyDefaultPresentationContext:v17];
  }
}

- (FBScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (FBScene *)WeakRetained;
}

- (id)createPresenterWithIdentifier:(id)a3 priority:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"UIScenePresentationManager.m", 161, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  if ([(UIScenePresentationManager *)self isInvalidated])
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"UIScenePresentationManager.m" lineNumber:162 description:@"Cannot create a presenter on a presentation manager that's been invalidated."];
  }
  if ([(UIScenePresentationManager *)self _hasPresenterWithIdentifier:v7])
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"UIScenePresentationManager.m" lineNumber:163 description:@"Cannot create a presenter with this identifier as it's already in use."];
  }
  id v8 = [_UIScenePresenter alloc];
  scenePresenterOwner = self->_scenePresenterOwner;
  uint64_t v10 = [NSNumber numberWithInteger:a4];
  v11 = [(_UIScenePresenter *)v8 initWithOwner:scenePresenterOwner identifier:v7 sortContext:v10];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  uint64_t v13 = [WeakRetained contentState];

  uint64_t v14 = [(_UIScenePresenter *)v11 presentationContext];
  [v14 _isVisibilityPropagationEnabled];
  LOBYTE(v10) = BSEqualBools();

  if ((v10 & 1) == 0)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__UIScenePresentationManager_createPresenterWithIdentifier_priority___block_invoke;
    v19[3] = &__block_descriptor_33_e43_v16__0__UIMutableScenePresentationContext_8l;
    BOOL v20 = v13 != 0;
    [(_UIScenePresenter *)v11 modifyPresentationContext:v19];
  }
  [(_UIScenePresenterOwner *)self->_scenePresenterOwner addPresenter:v11];

  return v11;
}

void __57__UIScenePresentationManager_sceneContentStateDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 presentationContext];
  [v4 _isVisibilityPropagationEnabled];
  char v5 = BSEqualBools();

  if ((v5 & 1) == 0)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__UIScenePresentationManager_sceneContentStateDidChange___block_invoke_2;
    v6[3] = &__block_descriptor_33_e43_v16__0__UIMutableScenePresentationContext_8l;
    char v7 = *(unsigned char *)(a1 + 32);
    [v3 modifyPresentationContext:v6];
  }
}

- (id)_initWithScene:(id)a3 keyboardProxyLayerManager:(id)a4 keyboardProxyPresentationEnvironment:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"UIScenePresentationManager.m", 68, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];
  }
  if (([v9 isValid] & 1) == 0)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"UIScenePresentationManager.m" lineNumber:69 description:@"Must have a valid scene to create a presentation manager for a scene."];
  }
  v27.receiver = self;
  v27.super_class = (Class)UIScenePresentationManager;
  v12 = [(UIScenePresentationManager *)&v27 init];
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = objc_storeWeak((id *)&v12->_scene, v9);
    [v9 addObserver:v13];

    uint64_t v15 = [v9 _relationshipManagementHostComponent];
    [(UIScenePresentationManager *)v13 _addPrioritizedPresenterObserver:v15];
    v13->_invalidated = 0;
    uint64_t v16 = [_UIScenePresenterOwner alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v13->_scene);
    uint64_t v18 = [(_UIScenePresenterOwner *)v16 initWithScenePresentationManager:v13 context:WeakRetained];
    scenePresenterOwner = v13->_scenePresenterOwner;
    v13->_scenePresenterOwner = (_UIScenePresenterOwner *)v18;

    [(_UIScenePresenterOwner *)v13->_scenePresenterOwner setDelegate:v13];
    BOOL v20 = [[UIScenePresentationContext alloc] _initWithDefaultValues];
    defaultScenePresentationContext = v13->_defaultScenePresentationContext;
    v13->_defaultScenePresentationContext = v20;

    uint64_t v22 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
    mapLayersToPresenterOwners = v13->_mapLayersToPresenterOwners;
    v13->_mapLayersToPresenterOwners = (NSMapTable *)v22;

    objc_storeStrong((id *)&v13->_keyboardProxyPresentationEnvironment, a5);
    [v10 trackPresentationEnvironment:v13->_keyboardProxyPresentationEnvironment];
    [(UIScenePresentationManager *)v13 _addPrioritizedPresenterObserver:v13->_keyboardProxyPresentationEnvironment];
  }
  return v13;
}

- (void)_addPrioritizedPresenterObserver:(id)a3
{
  id v4 = a3;
  prioritizedPresenterObservers = self->_prioritizedPresenterObservers;
  id v8 = v4;
  if (!prioritizedPresenterObservers)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    char v7 = self->_prioritizedPresenterObservers;
    self->_prioritizedPresenterObservers = v6;

    id v4 = v8;
    prioritizedPresenterObservers = self->_prioritizedPresenterObservers;
  }
  [(NSHashTable *)prioritizedPresenterObservers addObject:v4];
}

- (UIScenePresentationContext)defaultPresentationContext
{
  return self->_defaultScenePresentationContext;
}

- (BOOL)_hasPresenterWithIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(_UIScenePresenterOwner *)self->_scenePresenterOwner presenterWithIdentifier:v4];

  if (v5)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    char v7 = [(NSMapTable *)self->_mapLayersToPresenterOwners objectEnumerator];
    uint64_t v6 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v7);
          }
          id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) presenterWithIdentifier:v4];

          if (v10)
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v6;
}

uint64_t __63__UIScenePresentationManager_modifyDefaultPresentationContext___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63__UIScenePresentationManager_modifyDefaultPresentationContext___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__UIScenePresentationManager_modifyDefaultPresentationContext___block_invoke_2;
  v3[3] = &unk_1E52E0698;
  v3[4] = *(void *)(a1 + 32);
  return [a2 modifyPresentationContext:v3];
}

- (UIScenePresentationManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UIScenePresentationManager.m" lineNumber:59 description:@"[UIScenePresentationManager init] is unavailable for use."];

  v6.receiver = self;
  v6.super_class = (Class)UIScenePresentationManager;
  return [(UIScenePresentationManager *)&v6 init];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  if (obj && [(UIScenePresentationManager *)self isInvalidated])
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIScenePresentationManager.m" lineNumber:100 description:@"Cannot set a new delegate if the presentation manager is already invalidated"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  objc_super v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    char v7 = objc_opt_respondsToSelector();
    objc_super v6 = obj;
    self->_delegateFlags.defaultPriorityBand = v7 & 1;
  }
}

void __63__UIScenePresentationManager_modifyDefaultPresentationContext___block_invoke_4(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__UIScenePresentationManager_modifyDefaultPresentationContext___block_invoke_5;
  v3[3] = &unk_1E52E0698;
  id v4 = *(id *)(a1 + 32);
  [a2 modifyPresentationContext:v3];
}

uint64_t __63__UIScenePresentationManager_modifyDefaultPresentationContext___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 _setDefaultPresentationContext:*(void *)(a1 + 32)];
}

- (id)createPresenterWithIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = [(UIScenePresentationManager *)self createPresenterWithIdentifier:v4 priority:[(UIScenePresentationManager *)self _defaultPresentationPriority]];

  return v5;
}

uint64_t __69__UIScenePresentationManager_createPresenterWithIdentifier_priority___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setVisibilityPropagationEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (id)createPresenterForLayerTarget:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(UIScenePresentationManager *)self createPresenterForLayerTarget:v7 identifier:v6 priority:[(UIScenePresentationManager *)self _defaultPresentationPriority]];

  return v8;
}

- (id)createPresenterForLayerTarget:(id)a3 identifier:(id)a4 priority:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"UIScenePresentationManager.m", 186, @"Invalid parameter not satisfying: %@", @"layerTarget" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"UIScenePresentationManager.m", 187, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

LABEL_3:
  if ([(UIScenePresentationManager *)self isInvalidated])
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"UIScenePresentationManager.m" lineNumber:188 description:@"Cannot create a presenter on a presentation manager that's been invalidated."];
  }
  if ([(UIScenePresentationManager *)self _hasPresenterWithIdentifier:v11])
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"UIScenePresentationManager.m" lineNumber:189 description:@"Cannot create a presenter with this identifier as it's already in use."];
  }
  long long v12 = [(NSMapTable *)self->_mapLayersToPresenterOwners objectForKey:v9];
  if (!v12)
  {
    long long v12 = [[_UIScenePresenterOwner alloc] initWithScenePresentationManager:self context:v9];
    [(_UIScenePresenterOwner *)v12 setDelegate:self];
    [(NSMapTable *)self->_mapLayersToPresenterOwners setObject:v12 forKey:v9];
  }
  long long v13 = [_UIScenePresenter alloc];
  long long v14 = [NSNumber numberWithInteger:a5];
  long long v15 = [(_UIScenePresenter *)v13 initWithOwner:v12 identifier:v11 sortContext:v14];

  uint64_t v16 = (void *)[(UIScenePresentationContext *)self->_defaultScenePresentationContext mutableCopy];
  [v16 _setLayerTargetsToExclude:0];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __80__UIScenePresentationManager_createPresenterForLayerTarget_identifier_priority___block_invoke;
  v24[3] = &unk_1E52EFAC8;
  id v25 = v9;
  v26 = self;
  id v27 = v16;
  id v17 = v16;
  id v18 = v9;
  [(_UIScenePresenter *)v15 modifyPresentationContext:v24];
  [(_UIScenePresenterOwner *)v12 addPresenter:v15];

  return v15;
}

void __80__UIScenePresentationManager_createPresenterForLayerTarget_identifier_priority___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = a1[4];
  id v7 = a2;
  char v5 = [v3 setWithObject:v4];
  [v7 _setExclusiveLayerTargetsToInclude:v5];

  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 16));
  objc_msgSend(v7, "_setVisibilityPropagationEnabled:", objc_msgSend(WeakRetained, "contentState") != 0);

  [v7 _setDefaultPresentationContext:a1[6]];
}

- (id)snapshotContext
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(UIScenePresentationManager *)self scene];
  uint64_t v4 = [v3 snapshotContext];
  char v5 = [MEMORY[0x1E4F1CA80] set];
  [(UIScenePresentationContext *)self->_defaultScenePresentationContext presentedLayerTypes];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = objc_msgSend(v3, "layerManager", 0);
  id v7 = [v6 layers];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v12 type];
        if ((FBSceneLayerTypeMaskContainsType() & 1) == 0) {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  [v4 setLayersToExclude:v5];
  long long v13 = [(UIScenePresentationContext *)self->_defaultScenePresentationContext backgroundColorWhileHosting];
  [v13 alphaComponent];
  [v4 setOpaque:v14 >= 1.0];

  return v4;
}

- (id)snapshotPresentationForSnapshot:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[_UISceneSnapshotPresentationView alloc] initWithSnapshot:v3];

  return v4;
}

- (NSString)description
{
  return (NSString *)[(UIScenePresentationManager *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(UIScenePresentationManager *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  char v5 = [WeakRetained identifier];
  [v3 appendString:v5 withName:@"sceneID"];

  if ([(UIScenePresentationManager *)self isInvalidated]) {
    id v6 = (id)[v3 appendBool:1 withName:@"invalidated"];
  }
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(UIScenePresentationManager *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  char v5 = [(UIScenePresentationManager *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__UIScenePresentationManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __68__UIScenePresentationManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"allLayersTargetOwner" skipIfNil:1];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"individualLayersTargetOwner" skipIfNil:1];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 56) withName:@"defaultPresentationContext" skipIfNil:1];
}

uint64_t __80__UIScenePresentationManager_owner_willPrioritizePresenter_deactivatePresenter___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setLayerTargetsToExclude:*(void *)(a1 + 32)];
}

- (void)ownerDidInvalidateLastPresenter:(id)a3
{
  id v5 = a3;
  id v4 = [v5 context];
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    [(UIScenePresentationManager *)self owner:v5 willPrioritizePresenter:0 deactivatePresenter:0];
    [(NSMapTable *)self->_mapLayersToPresenterOwners removeObjectForKey:v4];
    [v5 setDelegate:0];
    [v5 invalidate];
  }
}

- (void)sceneDidInvalidate:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(_UIScenePresenterOwner *)self->_scenePresenterOwner invalidate];
    scenePresenterOwner = self->_scenePresenterOwner;
    self->_scenePresenterOwner = 0;

    id v6 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v7 = [(NSMapTable *)self->_mapLayersToPresenterOwners objectEnumerator];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          [v6 addObject:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v9);
    }

    [(NSMapTable *)self->_mapLayersToPresenterOwners removeAllObjects];
    mapLayersToPresenterOwners = self->_mapLayersToPresenterOwners;
    self->_mapLayersToPresenterOwners = 0;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v19 + 1) + 8 * j);
          objc_msgSend(v18, "setDelegate:", 0, (void)v19);
          [v18 invalidate];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v15);
    }

    objc_setAssociatedObject(v4, &_UI_PRESENTATION_MANAGER_KEY, 0, (void *)0x301);
  }
}

+ (id)sceneHostingGraph
{
  return +[_UISceneHostingGraph sharedInstance];
}

- (id)_presenterWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_UIScenePresenterOwner *)self->_scenePresenterOwner presenterWithIdentifier:v4];
  if (!v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [(NSMapTable *)self->_mapLayersToPresenterOwners objectEnumerator];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) presenterWithIdentifier:v4];
          if (v11)
          {
            id v5 = (void *)v11;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    id v5 = 0;
LABEL_12:
  }
  return v5;
}

- (int64_t)_defaultPresentationPriority
{
  if (!self->_delegateFlags.defaultPriorityBand) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v4 = [WeakRetained scenePresentationManagerDefaultPriorityBand:self];

  return v4;
}

- (void)_removePrioritizedPresenterObserver:(id)a3
{
}

- (UIScenePresentationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIScenePresentationManagerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaultScenePresentationContext, 0);
  objc_storeStrong((id *)&self->_prioritizedPresenterObservers, 0);
  objc_storeStrong((id *)&self->_mapLayersToPresenterOwners, 0);
  objc_storeStrong((id *)&self->_scenePresenterOwner, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_keyboardProxyPresentationEnvironment, 0);
}

@end
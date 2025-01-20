@interface UIScenePresentationBinder
- (BOOL)_delegateShouldPresentSceneOnlyWhenLayersExist;
- (NSSet)scenes;
- (NSString)description;
- (UIScenePresentationBinder)initWithIdentifier:(id)a3 priority:(int64_t)a4 rootView:(id)a5 appearanceStyle:(unint64_t)a6;
- (UIScenePresentationBinderDelegate)delegate;
- (id)_rootView;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_activatePresenter:(id)a3 scene:(id)a4 reason:(id)a5;
- (void)_deactivatePresenter:(id)a3 scene:(id)a4 reason:(id)a5;
- (void)_delegateDidStartPresentingScene:(id)a3;
- (void)_delegateDidStopPresentingScene:(id)a3;
- (void)_evaluateSceneForHosting:(id)a3 forReason:(id)a4;
- (void)_noteSceneChangedLevel:(id)a3;
- (void)_noteSceneMovedToBackground:(id)a3;
- (void)_noteSceneMovedToForeground:(id)a3;
- (void)_positionPresentationViewInRootViewOrderedCorrectly:(id)a3;
- (void)_removeScene:(id)a3 forReason:(id)a4;
- (void)addScene:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeScene:(id)a3;
- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4;
- (void)sceneLayerManagerDidStartTrackingLayers:(id)a3;
- (void)sceneLayerManagerDidStopTrackingLayers:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation UIScenePresentationBinder

- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_settingsDiffInspector)
  {
    objc_initWeak(&location, self);
    v8 = (FBSSceneSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F62A88]);
    settingsDiffInspector = self->_settingsDiffInspector;
    self->_settingsDiffInspector = v8;

    v10 = self->_settingsDiffInspector;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61__UIScenePresentationBinder_scene_didApplyUpdateWithContext___block_invoke;
    v15[3] = &unk_1E52E06E0;
    objc_copyWeak(&v16, &location);
    [(FBSSceneSettingsDiffInspector *)v10 observeLevelWithBlock:v15];
    v11 = self->_settingsDiffInspector;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__UIScenePresentationBinder_scene_didApplyUpdateWithContext___block_invoke_2;
    v13[3] = &unk_1E52E06E0;
    objc_copyWeak(&v14, &location);
    [(FBSSceneSettingsDiffInspector *)v11 observeIsForegroundWithBlock:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  v12 = [v7 settingsDiff];
  [v12 evaluateWithInspector:self->_settingsDiffInspector context:v6];
}

- (UIScenePresentationBinder)initWithIdentifier:(id)a3 priority:(int64_t)a4 rootView:(id)a5 appearanceStyle:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)UIScenePresentationBinder;
  v13 = [(UIScenePresentationBinder *)&v20 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    v14->_priority = a4;
    objc_storeStrong((id *)&v14->_rootView, a5);
    uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
    scenes = v14->_scenes;
    v14->_scenes = (NSMutableSet *)v15;

    v14->_appearanceStyle = a6;
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mapSceneIDToPresenter = v14->_mapSceneIDToPresenter;
    v14->_mapSceneIDToPresenter = v17;
  }
  return v14;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"UIScenePresentationBinder.m" lineNumber:62 description:@"UIAutomaticScenePresenter must be invalidated before it can be deallocated."];
  }
  v5.receiver = self;
  v5.super_class = (Class)UIScenePresentationBinder;
  [(UIScenePresentationBinder *)&v5 dealloc];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_delegate, obj);
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;

    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      char v7 = 2;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFD | v7;

    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      char v9 = 4;
    }
    else {
      char v9 = 0;
    }
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFB | v9;
  }
}

- (void)addScene:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"UIScenePresentationBinder.m", 81, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];
  }
  if (!self->_invalidated && ([(NSMutableSet *)self->_scenes containsObject:v5] & 1) == 0)
  {
    [(NSMutableSet *)self->_scenes addObject:v5];
    [v5 addObserver:self];
    id v6 = [v5 layerManager];
    [v6 addObserver:self];

    char v7 = [v5 uiPresentationManager];
    id v8 = [v7 createPresenterWithIdentifier:self->_identifier priority:self->_priority];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __38__UIScenePresentationBinder_addScene___block_invoke;
    v14[3] = &unk_1E52E0698;
    v14[4] = self;
    [v8 modifyPresentationContext:v14];
    mapSceneIDToPresenter = self->_mapSceneIDToPresenter;
    v10 = [v5 identifier];
    [(NSMutableDictionary *)mapSceneIDToPresenter setObject:v8 forKey:v10];

    id v11 = UIScenePresentationBinderLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v5 identifier];
      *(_DWORD *)buf = 134218242;
      id v16 = self;
      __int16 v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-added scene.", buf, 0x16u);
    }
    [(UIScenePresentationBinder *)self _evaluateSceneForHosting:v5 forReason:@"client added scene"];
  }
}

void __38__UIScenePresentationBinder_addScene___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 40);
  id v3 = a2;
  [v3 setAppearanceStyle:v2];
  [v3 setPresentedLayerTypes:26];
}

- (void)removeScene:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    char v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"UIScenePresentationBinder.m", 102, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];

    id v5 = 0;
  }
  if (!self->_invalidated)
  {
    id v8 = v5;
    int v6 = [(NSMutableSet *)self->_scenes containsObject:v5];
    id v5 = v8;
    if (v6)
    {
      [(UIScenePresentationBinder *)self _removeScene:v8 forReason:@"client requested"];
      id v5 = v8;
    }
  }
}

- (id)_rootView
{
  return self->_rootView;
}

- (BOOL)_delegateShouldPresentSceneOnlyWhenLayersExist
{
  if ((*(unsigned char *)&self->_delegateFlags & 1) == 0) {
    return 0;
  }
  id v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = [WeakRetained scenePresentationBinderShouldPresentSceneOnlyWhenLayersExist:v3];

  return (char)v3;
}

- (void)_delegateDidStartPresentingScene:(id)a3
{
  if ((*(unsigned char *)&self->_delegateFlags & 2) != 0)
  {
    p_delegate = &self->_delegate;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained scenePresentationBinder:self didStartPresentingScene:v5];
  }
}

- (void)_delegateDidStopPresentingScene:(id)a3
{
  if ((*(unsigned char *)&self->_delegateFlags & 4) != 0)
  {
    p_delegate = &self->_delegate;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained scenePresentationBinder:self didStopPresentingScene:v5];
  }
}

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = (void *)[(NSMutableSet *)self->_scenes copy];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          [(UIScenePresentationBinder *)self removeScene:*(void *)(*((void *)&v9 + 1) + 8 * i)];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    settingsDiffInspector = self->_settingsDiffInspector;
    self->_settingsDiffInspector = 0;

    [(FBSSceneSettingsDiffInspector *)self->_settingsDiffInspector removeAllObservers];
    self->_invalidated = 1;
  }
}

- (NSString)description
{
  return (NSString *)[(UIScenePresentationBinder *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(UIScenePresentationBinder *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__UIScenePresentationBinder_succinctDescriptionBuilder__block_invoke;
  v8[3] = &unk_1E52D9F98;
  id v4 = v3;
  id v9 = v4;
  long long v10 = self;
  id v5 = (id)[v4 modifyProem:v8];
  id v6 = v4;

  return v6;
}

void __55__UIScenePresentationBinder_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 8) withName:@"identifier"];
  id v2 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 32) withName:@"priority"];
  id v3 = *(void **)(a1 + 32);
  NSStringFromUISceneAppearanceStyle(*(void *)(*(void *)(a1 + 40) + 40));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 appendString:v4 withName:@"style"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(UIScenePresentationBinder *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(UIScenePresentationBinder *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__UIScenePresentationBinder_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v10 = v6;
  long long v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __67__UIScenePresentationBinder_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendDictionarySection:*(void *)(*(void *)(a1 + 40) + 64) withName:@"sceneIDsToPresenter" skipIfEmpty:1];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 24) allObjects];
  [v2 appendArraySection:v3 withName:@"scenes" skipIfEmpty:0];
}

- (void)sceneLayerManagerDidStartTrackingLayers:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = UIScenePresentationBinderLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    BOOL v7 = [(UIScenePresentationBinder *)self _delegateShouldPresentSceneOnlyWhenLayersExist];
    id v8 = @"NO";
    *(_DWORD *)buf = 134218498;
    v23 = self;
    __int16 v24 = 2114;
    if (v7) {
      id v8 = @"YES";
    }
    v25 = v6;
    __int16 v26 = 2114;
    v27 = v8;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-started tracking layers: shouldPresentOnlyWhenLayersExist: %{public}@", buf, 0x20u);
  }
  if ([(UIScenePresentationBinder *)self _delegateShouldPresentSceneOnlyWhenLayersExist])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = self->_scenes;
    uint64_t v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
LABEL_8:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
        objc_msgSend(v14, "layerManager", (void)v17);
        id v15 = (id)objc_claimAutoreleasedReturnValue();

        if (v15 == v4) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v11) {
            goto LABEL_8;
          }
          goto LABEL_17;
        }
      }
      id v16 = v14;

      if (!v16) {
        goto LABEL_18;
      }
      [(UIScenePresentationBinder *)self _evaluateSceneForHosting:v16 forReason:@"layers exist"];
      id v9 = v16;
    }
LABEL_17:
  }
LABEL_18:
}

- (void)sceneLayerManagerDidStopTrackingLayers:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = UIScenePresentationBinderLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    BOOL v7 = [(UIScenePresentationBinder *)self _delegateShouldPresentSceneOnlyWhenLayersExist];
    id v8 = @"NO";
    *(_DWORD *)buf = 134218498;
    v23 = self;
    __int16 v24 = 2114;
    if (v7) {
      id v8 = @"YES";
    }
    v25 = v6;
    __int16 v26 = 2114;
    v27 = v8;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-stopped tracking layers: shouldPresentOnlyWhenLayersExist: %{public}@", buf, 0x20u);
  }
  if ([(UIScenePresentationBinder *)self _delegateShouldPresentSceneOnlyWhenLayersExist])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = self->_scenes;
    uint64_t v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
LABEL_8:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
        objc_msgSend(v14, "layerManager", (void)v17);
        id v15 = (id)objc_claimAutoreleasedReturnValue();

        if (v15 == v4) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v11) {
            goto LABEL_8;
          }
          goto LABEL_17;
        }
      }
      id v16 = v14;

      if (!v16) {
        goto LABEL_18;
      }
      [(UIScenePresentationBinder *)self _evaluateSceneForHosting:v16 forReason:@"no layers exist"];
      id v9 = v16;
    }
LABEL_17:
  }
LABEL_18:
}

void __61__UIScenePresentationBinder_scene_didApplyUpdateWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _noteSceneChangedLevel:a2];
}

void __61__UIScenePresentationBinder_scene_didApplyUpdateWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = a2;
  id v4 = [v3 settings];
  int v5 = [v4 isForeground];

  if (v5) {
    [WeakRetained _noteSceneMovedToForeground:v3];
  }
  else {
    [WeakRetained _noteSceneMovedToBackground:v3];
  }
}

- (void)_removeScene:(id)a3 forReason:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"UIScenePresentationBinder.m", 263, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"UIScenePresentationBinder.m", 264, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

LABEL_3:
  uint64_t v10 = [v7 layerManager];
  [v10 removeObserver:self];

  [v7 removeObserver:self];
  [(NSMutableSet *)self->_scenes removeObject:v7];
  uint64_t v11 = UIScenePresentationBinderLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v7 identifier];
    *(_DWORD *)buf = 134218498;
    long long v18 = self;
    __int16 v19 = 2114;
    long long v20 = v12;
    __int16 v21 = 2114;
    v22 = v9;
    _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-removed scene for reason: %{public}@", buf, 0x20u);
  }
  uint64_t v13 = [v7 identifier];
  uint64_t v14 = [(NSMutableDictionary *)self->_mapSceneIDToPresenter objectForKey:v13];
  if ([v14 isActive]) {
    [(UIScenePresentationBinder *)self _deactivatePresenter:v14 scene:v7 reason:v9];
  }
  [(NSMutableDictionary *)self->_mapSceneIDToPresenter removeObjectForKey:v13];
  [v14 invalidate];
}

- (void)_evaluateSceneForHosting:(id)a3 forReason:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"UIScenePresentationBinder.m", 281, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"UIScenePresentationBinder.m", 282, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

LABEL_3:
  uint64_t v10 = UIScenePresentationBinderLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v7 identifier];
    *(_DWORD *)buf = 134218498;
    v31 = self;
    __int16 v32 = 2114;
    v33 = v11;
    __int16 v34 = 2114;
    *(void *)v35 = v9;
    _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-evaluate scene for hosting for reason: %{public}@", buf, 0x20u);
  }
  mapSceneIDToPresenter = self->_mapSceneIDToPresenter;
  uint64_t v13 = [v7 identifier];
  uint64_t v14 = [(NSMutableDictionary *)mapSceneIDToPresenter objectForKey:v13];

  int v15 = [v14 isActive];
  id v16 = [v7 layerManager];
  long long v17 = [v16 layers];
  uint64_t v18 = [v17 count];

  __int16 v19 = [v7 settings];
  int v20 = [v19 isForeground];

  BOOL v21 = [(UIScenePresentationBinder *)self _delegateShouldPresentSceneOnlyWhenLayersExist];
  if (v18) {
    BOOL v22 = v21;
  }
  else {
    BOOL v22 = 0;
  }
  int v23 = !v21;
  if (v20 && v23 | v22)
  {
    if (v15)
    {
      __int16 v24 = UIScenePresentationBinderLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = [v7 identifier];
        *(_DWORD *)buf = 134218242;
        v31 = self;
        __int16 v32 = 2114;
        v33 = v25;
        _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-not presenting scene is already being presented.", buf, 0x16u);
      }
    }
    else
    {
      [(UIScenePresentationBinder *)self _activatePresenter:v14 scene:v7 reason:v9];
    }
  }
  else if (v15)
  {
    [(UIScenePresentationBinder *)self _deactivatePresenter:v14 scene:v7 reason:v9];
  }
  else
  {
    __int16 v26 = UIScenePresentationBinderLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [v7 identifier];
      *(_DWORD *)buf = 134219010;
      v31 = self;
      __int16 v32 = 2114;
      v33 = v27;
      __int16 v34 = 1024;
      *(_DWORD *)v35 = v20;
      *(_WORD *)&v35[4] = 1024;
      *(_DWORD *)&v35[6] = v22;
      __int16 v36 = 1024;
      int v37 = v23;
      _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-not hosting because scene is not foreground or other conditions aren't met to allow hosting (foreground: %d, allowsHostingWithLayersAndHasLayers: %d, allowsHostingWithoutLayers: %d).", buf, 0x28u);
    }
  }
}

- (void)_activatePresenter:(id)a3 scene:(id)a4 reason:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_10:
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"UIScenePresentationBinder.m", 316, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  int v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"UIScenePresentationBinder.m", 315, @"Invalid parameter not satisfying: %@", @"presenter" object file lineNumber description];

  if (!v10) {
    goto LABEL_10;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_11:
  long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"UIScenePresentationBinder.m", 317, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

LABEL_4:
  uint64_t v12 = UIScenePresentationBinderLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v10 identifier];
    *(_DWORD *)buf = 134218498;
    int v20 = self;
    __int16 v21 = 2114;
    BOOL v22 = v13;
    __int16 v23 = 2114;
    id v24 = v11;
    _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-started layer hosting for reason: %{public}@", buf, 0x20u);
  }
  if (!v9)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"UIScenePresentationBinder.m" lineNumber:320 description:@"We expect a presenter."];
  }
  [v9 activate];
  [(UIScenePresentationBinder *)self _noteWillStartPresentingScene:v10];
  uint64_t v14 = [v9 presentationView];
  [(UIScenePresentationBinder *)self _positionPresentationViewInRootViewOrderedCorrectly:v14];

  [(UIScenePresentationBinder *)self _delegateDidStartPresentingScene:v10];
}

- (void)_deactivatePresenter:(id)a3 scene:(id)a4 reason:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"UIScenePresentationBinder.m", 334, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  int v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"UIScenePresentationBinder.m", 333, @"Invalid parameter not satisfying: %@", @"presenter" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"UIScenePresentationBinder.m", 335, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

LABEL_4:
  uint64_t v12 = UIScenePresentationBinderLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v10 identifier];
    *(_DWORD *)buf = 134218498;
    __int16 v19 = self;
    __int16 v20 = 2114;
    __int16 v21 = v13;
    __int16 v22 = 2114;
    id v23 = v11;
    _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-stopped layer hosting for reason: %{public}@", buf, 0x20u);
  }
  uint64_t v14 = [v9 presentationView];
  [v14 removeFromSuperview];

  [v9 deactivate];
  [(UIScenePresentationBinder *)self _noteDidStopPresentingScene:v10];
  [(UIScenePresentationBinder *)self _delegateDidStopPresentingScene:v10];
}

- (void)_noteSceneMovedToForeground:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = UIScenePresentationBinderLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    int v7 = 134218242;
    id v8 = self;
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-scene moved to foreground", (uint8_t *)&v7, 0x16u);
  }
  [(UIScenePresentationBinder *)self _evaluateSceneForHosting:v4 forReason:@"scene moved foreground"];
}

- (void)_noteSceneMovedToBackground:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = UIScenePresentationBinderLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    int v7 = 134218242;
    id v8 = self;
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-scene moved to background", (uint8_t *)&v7, 0x16u);
  }
  [(UIScenePresentationBinder *)self _evaluateSceneForHosting:v4 forReason:@"scene moved background"];
}

- (void)_noteSceneChangedLevel:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = UIScenePresentationBinderLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    int v11 = 134218242;
    uint64_t v12 = self;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "%p-%{public}@-scene level changed", (uint8_t *)&v11, 0x16u);
  }
  mapSceneIDToPresenter = self->_mapSceneIDToPresenter;
  id v8 = [v4 identifier];
  __int16 v9 = [(NSMutableDictionary *)mapSceneIDToPresenter objectForKey:v8];

  if ([v9 isActive])
  {
    id v10 = [v9 presentationView];
    [(UIScenePresentationBinder *)self _positionPresentationViewInRootViewOrderedCorrectly:v10];
  }
}

- (void)_positionPresentationViewInRootViewOrderedCorrectly:(id)a3
{
  id v24 = a3;
  [v24 removeFromSuperview];
  id v4 = [(UIScenePresentationBinder *)self _rootView];
  int v5 = [v4 subviews];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    char v22 = 0;
    uint64_t v21 = v6 - 1;
    id v23 = v4;
    do
    {
      while (1)
      {
        __int16 v9 = objc_msgSend(v5, "objectAtIndex:", v8, v21);
        id v10 = [v24 presenter];
        int v11 = [v10 scene];
        uint64_t v12 = [v11 settings];
        [v12 level];
        double v14 = v13;
        uint64_t v15 = [v9 presenter];
        id v16 = [v15 scene];
        long long v17 = [v16 settings];
        [v17 level];
        double v19 = v18;

        if (v14 <= v19) {
          break;
        }
        id v4 = v23;
        [v23 insertSubview:v24 aboveSubview:v9];

        char v22 = 1;
        if (v21 == v8++) {
          goto LABEL_12;
        }
      }

      ++v8;
    }
    while (v7 != v8);
    id v4 = v23;
    if ((v22 & 1) == 0)
    {
      [v23 addSubview:v24];
      [v23 sendSubviewToBack:v24];
    }
  }
  else
  {
    [v4 addSubview:v24];
  }
LABEL_12:
}

- (NSSet)scenes
{
  return &self->_scenes->super;
}

- (UIScenePresentationBinderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIScenePresentationBinderDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_mapSceneIDToPresenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scenes, 0);
  objc_storeStrong((id *)&self->_rootView, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
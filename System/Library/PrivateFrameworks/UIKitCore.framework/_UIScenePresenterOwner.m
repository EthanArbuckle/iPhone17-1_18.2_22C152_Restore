@interface _UIScenePresenterOwner
- (BOOL)_isPresenterActive:(id)a3;
- (BOOL)_isPresenterHosting:(id)a3;
- (FBScene)scene;
- (NSString)description;
- (UIScenePresentationContext)defaultPresentationContext;
- (_UIScenePresenterOwner)initWithScenePresentationManager:(id)a3 context:(id)a4;
- (_UIScenePresenterOwnerDelegate)delegate;
- (id)activePrioritizedPresenter;
- (id)context;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)presenterWithIdentifier:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_activatePresenter:(id)a3;
- (void)_deactivatePresenter:(id)a3;
- (void)_invalidatePresenter:(id)a3;
- (void)_setActivePrioritizedPresenter:(id)a3;
- (void)_updateActivePrioritizedPresenterIfNecessary;
- (void)_updateHostingStateForScenePresentersIfNecessary;
- (void)addPresenter:(id)a3;
- (void)dealloc;
- (void)enumeratePresentersUsingBlock:(id)a3;
- (void)invalidate;
- (void)setDelegate:(id)a3;
@end

@implementation _UIScenePresenterOwner

- (void)_updateHostingStateForScenePresentersIfNecessary
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74___UIScenePresenterOwner__updateHostingStateForScenePresentersIfNecessary__block_invoke;
  v3[3] = &unk_1E52EF740;
  v3[4] = self;
  [(_UIScenePresenterOwner *)self enumeratePresentersUsingBlock:v3];
  [(_UIScenePresenter *)self->_prioritizedPresenter updateHostingStateIfNecessary];
}

- (void)enumeratePresentersUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  inactivePresentersByPriority = self->_inactivePresentersByPriority;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56___UIScenePresenterOwner_enumeratePresentersUsingBlock___block_invoke;
  v10[3] = &unk_1E52EF690;
  id v6 = v4;
  id v11 = v6;
  v12 = &v13;
  [(NSMutableSet *)inactivePresentersByPriority enumerateObjectsUsingBlock:v10];
  if (!*((unsigned char *)v14 + 24))
  {
    activePresentersByPriority = self->_activePresentersByPriority;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56___UIScenePresenterOwner_enumeratePresentersUsingBlock___block_invoke_2;
    v8[3] = &unk_1E52EF6B8;
    id v9 = v6;
    [(NSMutableOrderedSet *)activePresentersByPriority enumerateObjectsUsingBlock:v8];
  }
  _Block_object_dispose(&v13, 8);
}

- (BOOL)_isPresenterHosting:(id)a3
{
  v5 = (_UIScenePresenter *)a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UIScenePresenterOwner.m", 114, @"Invalid parameter not satisfying: %@", @"presenter" object file lineNumber description];
  }
  BOOL v6 = self->_prioritizedPresenter == v5;

  return v6;
}

- (BOOL)_isPresenterActive:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UIScenePresenterOwner.m", 109, @"Invalid parameter not satisfying: %@", @"presenter" object file lineNumber description];
  }
  char v6 = [(NSMutableOrderedSet *)self->_activePresentersByPriority containsObject:v5];

  return v6;
}

- (void)_activatePresenter:(id)a3
{
  id v5 = a3;
  id v11 = v5;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIScenePresenterOwner.m", 119, @"Invalid parameter not satisfying: %@", @"presenter" object file lineNumber description];

    id v5 = 0;
  }
  if ([v5 isInvalidated])
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UIScenePresenterOwner.m", 120, @"Attempted to activate presenter %@ which was already invalidated.", v11 object file lineNumber description];
  }
  [(NSMutableSet *)self->_inactivePresentersByPriority removeObject:v11];
  activePresentersByPriority = self->_activePresentersByPriority;
  if (!activePresentersByPriority)
  {
    v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    v8 = self->_activePresentersByPriority;
    self->_activePresentersByPriority = v7;

    activePresentersByPriority = self->_activePresentersByPriority;
  }
  [(NSMutableOrderedSet *)activePresentersByPriority addObject:v11];
  [(NSMutableOrderedSet *)self->_activePresentersByPriority sortUsingComparator:&__block_literal_global_239];
  [(_UIScenePresenterOwner *)self _updateActivePrioritizedPresenterIfNecessary];
}

- (void)_updateActivePrioritizedPresenterIfNecessary
{
  v3 = [(NSMutableOrderedSet *)self->_activePresentersByPriority lastObject];
  if (self->_prioritizedPresenter != v3)
  {
    id v4 = v3;
    [(_UIScenePresenterOwner *)self _setActivePrioritizedPresenter:v3];
    v3 = v4;
  }
}

- (void)_setActivePrioritizedPresenter:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = (_UIScenePresenter *)a3;
  p_prioritizedPresenter = &self->_prioritizedPresenter;
  prioritizedPresenter = self->_prioritizedPresenter;
  if (prioritizedPresenter != v5)
  {
    v8 = [(_UIScenePresenter *)prioritizedPresenter presentationView];
    id v9 = [(_UIScenePresenter *)v5 presentationView];
    v10 = [v8 window];
    id v11 = [v9 window];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained owner:self willPrioritizePresenter:v5 deactivatePresenter:self->_prioritizedPresenter];

    if (v8)
    {
      uint64_t v13 = UIScenePresentationLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = [(_UIScenePresenterOwner *)self scene];
        [v14 identifier];
        uint64_t v15 = v21 = v10;
        char v16 = self->_prioritizedPresenter;
        *(_DWORD *)buf = 138543618;
        v24 = v15;
        __int16 v25 = 2114;
        v26 = v16;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_INFO, "[%{public}@] Deactivating scene presenter: %{public}@", buf, 0x16u);

        v10 = v21;
      }

      [v8 setHostContainerView:0];
      v17 = *p_prioritizedPresenter;
      *p_prioritizedPresenter = 0;
    }
    if (v9)
    {
      v18 = UIScenePresentationLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        [(_UIScenePresenterOwner *)self scene];
        v19 = v22 = v10;
        v20 = [v19 identifier];
        *(_DWORD *)buf = 138543618;
        v24 = v20;
        __int16 v25 = 2114;
        v26 = v5;
        _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_INFO, "[%{public}@] Activating scene presenter: %{public}@", buf, 0x16u);

        v10 = v22;
      }

      objc_storeStrong((id *)&self->_prioritizedPresenter, a3);
    }
    [(_UIScenePresenterOwner *)self _updateHostingStateForScenePresentersIfNecessary];
    if (v8) {
      [(UIView *)self->_realSceneHostViewsContainer removeFromSuperview];
    }
    if (v9) {
      [v9 setHostContainerView:self->_realSceneHostViewsContainer];
    }
    else {
      [(UIView *)self->_realSceneHostViewsContainer removeFromSuperview];
    }
    if (v10 != v11) {
      +[UIWindow _synchronizeDrawing];
    }
  }
}

- (FBScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scenePresentationManager);
  v3 = [WeakRetained scene];

  return (FBScene *)v3;
}

- (void)addPresenter:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_UIScenePresenterOwner.m", 67, @"Invalid parameter not satisfying: %@", @"presenter" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableSet *)self->_inactivePresentersByPriority addObject:v5];
}

- (void)setDelegate:(id)a3
{
}

- (_UIScenePresenterOwner)initWithScenePresentationManager:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_UIScenePresenterOwner;
  v8 = [(_UIScenePresenterOwner *)&v19 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_context, a4);
    objc_storeWeak((id *)&v9->_scenePresentationManager, v6);
    v10 = [_UISceneLayerHostContainerView alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_scenePresentationManager);
    v12 = [WeakRetained scene];
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"<_UIScenePresenterOwner-%p>", v9);
    uint64_t v14 = [(_UISceneLayerHostContainerView *)v10 initWithScene:v12 debugDescription:v13];
    realSceneHostViewsContainer = v9->_realSceneHostViewsContainer;
    v9->_realSceneHostViewsContainer = (_UISceneLayerHostContainerView *)v14;

    char v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    inactivePresentersByPriority = v9->_inactivePresentersByPriority;
    v9->_inactivePresentersByPriority = v16;
  }
  return v9;
}

- (UIScenePresentationContext)defaultPresentationContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scenePresentationManager);
  v3 = [WeakRetained defaultPresentationContext];

  return (UIScenePresentationContext *)v3;
}

- (id)presenterWithIdentifier:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"_UIScenePresenterOwner.m", 92, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = self->_inactivePresentersByPriority;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v26 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v25 + 1) + 8 * v10);
      v12 = [v11 identifier];
      char v13 = [v12 isEqualToString:v5];

      if (v13) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v8) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = self->_activePresentersByPriority;
    id v14 = (id)[(NSMutableSet *)v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (!v14) {
      goto LABEL_21;
    }
    uint64_t v15 = *(void *)v22;
LABEL_13:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v22 != v15) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v21 + 1) + 8 * v16);
      v17 = [v11 identifier];
      char v18 = [v17 isEqualToString:v5];

      if (v18) {
        break;
      }
      if (v14 == (id)++v16)
      {
        id v14 = (id)[(NSMutableSet *)v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v14) {
          goto LABEL_13;
        }
        goto LABEL_21;
      }
    }
  }
  id v14 = v11;
LABEL_21:

  return v14;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"_UIScenePresenterOwner.m", 51, @"_UIScenePresenterOwner %@ must be invalidated before it can be deallocated.", self object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)_UIScenePresenterOwner;
  [(_UIScenePresenterOwner *)&v5 dealloc];
}

- (id)activePrioritizedPresenter
{
  return self->_prioritizedPresenter;
}

- (void)_deactivatePresenter:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_UIScenePresenterOwner.m", 136, @"Invalid parameter not satisfying: %@", @"presenter" object file lineNumber description];

    id v5 = 0;
  }
  if ([(_UIScenePresenterOwner *)self _isPresenterActive:v5])
  {
    [(NSMutableOrderedSet *)self->_activePresentersByPriority removeObject:v7];
    [(NSMutableSet *)self->_inactivePresentersByPriority addObject:v7];
    [(_UIScenePresenterOwner *)self _updateActivePrioritizedPresenterIfNecessary];
  }
}

- (void)_invalidatePresenter:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_UIScenePresenterOwner.m", 146, @"Invalid parameter not satisfying: %@", @"presenter" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableSet *)self->_inactivePresentersByPriority removeObject:v5];
  if ([(_UIScenePresenterOwner *)self _isPresenterActive:v8])
  {
    [(NSMutableOrderedSet *)self->_activePresentersByPriority removeObject:v8];
    [(_UIScenePresenterOwner *)self _updateActivePrioritizedPresenterIfNecessary];
  }
  if (![(NSMutableSet *)self->_inactivePresentersByPriority count]
    && ![(NSMutableOrderedSet *)self->_activePresentersByPriority count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained ownerDidInvalidateLastPresenter:self];
  }
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    v3 = (void *)[(NSMutableSet *)self->_inactivePresentersByPriority copy];
    [v3 enumerateObjectsUsingBlock:&__block_literal_global_29_0];

    id v4 = (void *)[(NSMutableOrderedSet *)self->_activePresentersByPriority copy];
    [v4 enumerateObjectsUsingBlock:&__block_literal_global_31_0];

    [(_UISceneLayerHostContainerView *)self->_realSceneHostViewsContainer invalidate];
    [(NSMutableSet *)self->_inactivePresentersByPriority removeAllObjects];
    activePresentersByPriority = self->_activePresentersByPriority;
    [(NSMutableOrderedSet *)activePresentersByPriority removeAllObjects];
  }
}

- (NSString)description
{
  return (NSString *)[(_UIScenePresenterOwner *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_UIScenePresenterOwner *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIScenePresenterOwner *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIScenePresenterOwner *)self succinctDescriptionBuilder];
  id v6 = NSString;
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  uint64_t v9 = [v6 stringWithFormat:@"<%@:%p>", v8, self->_context];
  id v10 = (id)[v5 appendObject:v9 withName:@"context"];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64___UIScenePresenterOwner_descriptionBuilderWithMultilinePrefix___block_invoke;
  v14[3] = &unk_1E52D9F98;
  id v11 = v5;
  id v15 = v11;
  uint64_t v16 = self;
  [v11 appendBodySectionWithName:0 multilinePrefix:v4 block:v14];

  id v12 = v11;
  return v12;
}

- (id)context
{
  return self->_context;
}

- (_UIScenePresenterOwnerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIScenePresenterOwnerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_prioritizedPresenter, 0);
  objc_storeStrong((id *)&self->_inactivePresentersByPriority, 0);
  objc_storeStrong((id *)&self->_activePresentersByPriority, 0);
  objc_storeStrong((id *)&self->_realSceneHostViewsContainer, 0);
  objc_destroyWeak((id *)&self->_scenePresentationManager);
  objc_storeStrong(&self->_context, 0);
}

@end
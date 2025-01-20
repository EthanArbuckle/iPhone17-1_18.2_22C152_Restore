@interface _UISceneRelationshipManagementHostComponent
- (void)_presentationManager:(id)a3 willPrioritizePresenter:(id)a4;
- (void)_scenePresenterIsMovingToWindow:(id)a3;
- (void)addObserver:(id)a3;
- (void)notifyObserversOfParentChange:(id)a3;
- (void)presentationView:(id)a3 didMoveToWindow:(id)a4;
- (void)removeObserver:(id)a3;
- (void)sceneDidInvalidate:(id)a3;
- (void)windowDidMoveToScene:(id)a3;
@end

@implementation _UISceneRelationshipManagementHostComponent

- (void)presentationView:(id)a3 didMoveToWindow:(id)a4
{
  id v11 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_prioritizedPresenter);
  id v9 = [WeakRetained presentationView];

  if (v9 != v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"_UISceneRelationshipManagementHostComponent.m" lineNumber:91 description:@"Presentation view mismatch."];
  }
  [(_UISceneRelationshipManagementHostComponent *)self _scenePresenterIsMovingToWindow:v11];
}

- (void)_scenePresenterIsMovingToWindow:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(FBSSceneComponent *)self hostScene];
  id v6 = [v4 _remoteContentParent];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  if (v6 != WeakRetained)
  {
    v8 = [v6 _childRemoteContentRegistry];
    id v9 = objc_loadWeakRetained((id *)&self->_associatedRemoteContentRegistry);
    [v9 removeChildScene:v5];

    [v8 addChildScene:v5];
    objc_storeWeak((id *)&self->_parent, v6);
    objc_storeWeak((id *)&self->_associatedRemoteContentRegistry, v8);
    if (v8 && ([v8 parentSettingsAvailable] & 1) == 0)
    {
      objc_initWeak((id *)location, self);
      objc_initWeak(&from, v6);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __79___UISceneRelationshipManagementHostComponent__scenePresenterIsMovingToWindow___block_invoke;
      v22[3] = &unk_1E52DA7A0;
      objc_copyWeak(&v23, (id *)location);
      objc_copyWeak(&v24, &from);
      [v8 executeWhenParentSettingsAreAvailable:v22 forChildScene:v5];
      objc_destroyWeak(&v24);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&from);
      objc_destroyWeak((id *)location);
    }
    else
    {
      [(_UISceneRelationshipManagementHostComponent *)self notifyObserversOfParentChange:v6];
    }
    v10 = *(id *)(__UILogGetCategoryCachedImpl("UISceneRelationshipManagement", &_scenePresenterIsMovingToWindow____s_category)+ 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v5;
      if (v11)
      {
        v12 = NSString;
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        v15 = [v12 stringWithFormat:@"<%@: %p>", v14, v11];
      }
      else
      {
        v15 = @"(nil)";
      }

      v16 = v15;
      id v17 = v6;
      if (v17)
      {
        v18 = NSString;
        v19 = (objc_class *)objc_opt_class();
        v20 = NSStringFromClass(v19);
        v21 = [v18 stringWithFormat:@"<%@: %p>", v20, v17];
      }
      else
      {
        v21 = @"(nil)";
      }

      *(_DWORD *)location = 134218498;
      *(void *)&location[4] = self;
      __int16 v27 = 2112;
      v28 = v16;
      __int16 v29 = 2112;
      v30 = v21;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "<_UISceneRelationshipManagementHostComponent:%p> Scene %@ is hosted in %@", location, 0x20u);
    }
  }
}

- (void)notifyObserversOfParentChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        id v11 = [(FBSSceneComponent *)self hostScene];
        [v10 _scene:v11 isMovingToParent:v4];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_presentationManager:(id)a3 willPrioritizePresenter:(id)a4
{
  id obj = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_prioritizedPresenter);

  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_prioritizedPresenter);
    uint64_t v7 = [v6 presentationView];
    [v7 removeObserver:self];

    uint64_t v8 = [obj presentationView];
    [v8 addObserver:self];

    objc_storeWeak((id *)&self->_prioritizedPresenter, obj);
    uint64_t v9 = [obj presentationView];
    v10 = [v9 window];
    [(_UISceneRelationshipManagementHostComponent *)self _scenePresenterIsMovingToWindow:v10];
  }
}

- (void)sceneDidInvalidate:(id)a3
{
  p_prioritizedPresenter = &self->_prioritizedPresenter;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_prioritizedPresenter);
  uint64_t v7 = [WeakRetained presentationView];
  [v7 removeObserver:self];

  uint64_t v8 = [v5 uiPresentationManager];

  [v8 _removePrioritizedPresenterObserver:self];
  objc_storeWeak((id *)p_prioritizedPresenter, 0);
}

- (void)windowDidMoveToScene:(id)a3
{
  id v8 = [a3 object];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_prioritizedPresenter);
  id v5 = [WeakRetained presentationView];
  id v6 = [v5 window];

  uint64_t v7 = v8;
  if (v8 && v8 == v6)
  {
    [(_UISceneRelationshipManagementHostComponent *)self _scenePresenterIsMovingToWindow:v8];
    uint64_t v7 = v8;
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v4;
    if (!observers)
    {
      id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    id v4 = v8;
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    [(NSHashTable *)self->_observers removeObject:v4];
    NSUInteger v5 = [(NSHashTable *)self->_observers count];
    id v4 = v7;
    if (!v5)
    {
      observers = self->_observers;
      self->_observers = 0;

      id v4 = v7;
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_associatedRemoteContentRegistry);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_prioritizedPresenter);
}

@end
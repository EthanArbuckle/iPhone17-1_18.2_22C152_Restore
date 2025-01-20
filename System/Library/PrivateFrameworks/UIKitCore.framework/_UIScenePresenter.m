@interface _UIScenePresenter
- (BOOL)_isHosting;
- (BOOL)isActive;
- (BOOL)isHosting;
- (BOOL)isInvalidated;
- (BOOL)isVisibilityPropagationEnabled;
- (FBScene)scene;
- (NSCopying)sortContext;
- (NSString)description;
- (NSString)identifier;
- (UIScenePresentation)presentationView;
- (UIScenePresentationContext)presentationContext;
- (_UIScenePresenter)init;
- (_UIScenePresenter)initWithOwner:(id)a3 identifier:(id)a4 sortContext:(id)a5;
- (double)_initializeTime;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)newSnapshot;
- (id)newSnapshotContext;
- (id)newSnapshotPresentationView;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)compare:(id)a3;
- (void)activate;
- (void)addObserver:(id)a3;
- (void)deactivate;
- (void)dealloc;
- (void)invalidate;
- (void)modifyPresentationContext:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setVisibilityPropagationEnabled:(BOOL)a3;
- (void)set_initializeTime:(double)a3;
- (void)updateHostingStateIfNecessary;
@end

@implementation _UIScenePresenter

- (NSString)description
{
  return (NSString *)[(_UIScenePresenter *)self descriptionWithMultilinePrefix:0];
}

- (void)modifyPresentationContext:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, void *))a3;
  if (!v5)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"_UIScenePresenter.m", 181, @"Invalid parameter not satisfying: %@", @"modifyBlock" object file lineNumber description];
  }
  BSDispatchQueueAssertMain();
  v6 = self->_presentationContext;
  v7 = (void *)[(UIScenePresentationContext *)self->_presentationContext mutableCopy];
  v5[2](v5, v7);
  v8 = UIScenePresentationLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    v10 = UIScenePresentationLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v13 = NSString;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
      v20 = [WeakRetained scene];
      v14 = [v20 identifier];
      v15 = [v13 stringWithFormat:@"%@-%@", v14, self->_identifier];
      v16 = [NSNumber numberWithBool:BSEqualObjects()];
      v17 = [(UIScenePresentationContext *)self->_presentationContext _defaultPresentationContext];
      v18 = [v7 _defaultPresentationContext];
      *(_DWORD *)buf = 138413570;
      v23 = v15;
      __int16 v24 = 2112;
      v25 = v16;
      __int16 v26 = 2112;
      v27 = v6;
      __int16 v28 = 2112;
      v29 = v7;
      __int16 v30 = 2112;
      v31 = v17;
      __int16 v32 = 2112;
      v33 = v18;
      _os_log_debug_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEBUG, "Modify presentation context on %@ (equal? %@), prevContext: %@, newContext: %@,  prevDefaultContext: %@, newDefaultContext: %@", buf, 0x3Eu);
    }
  }
  if ((BSEqualObjects() & 1) == 0)
  {
    v11 = (UIScenePresentationContext *)[v7 copy];
    presentationContext = self->_presentationContext;
    self->_presentationContext = v11;

    [(_UIScenePresentationView *)self->_view setCurrentPresentationContext:self->_presentationContext];
  }
}

- (void)updateHostingStateIfNecessary
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_UIScenePresenter *)self _isHosting];
  if (self->_hosting != v3)
  {
    BOOL v4 = v3;
    v5 = (void *)[(NSHashTable *)self->_observers copy];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * v10++) scenePresenter:self hostingWillChange:v4];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v8);
    }

    self->_hosting = v4;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "scenePresenter:hostingDidChange:", self, self->_hosting, (void)v16);
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }
  }
}

- (BOOL)_isHosting
{
  if (self->_invalidated) {
    return 0;
  }
  BOOL v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  LOBYTE(v3) = [WeakRetained _isPresenterHosting:v3];

  return (char)v3;
}

- (void)deactivate
{
  p_owner = &self->_owner;
  id v6 = objc_loadWeakRetained((id *)&self->_owner);
  int v4 = [v6 _isPresenterActive:self];

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)p_owner);
    [WeakRetained _deactivatePresenter:self];
  }
}

- (void)activate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  [WeakRetained _activatePresenter:self];
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (BOOL)isHosting
{
  return self->_hosting;
}

- (UIScenePresentation)presentationView
{
  BSDispatchQueueAssertMain();
  if (!self->_invalidated && !self->_view)
  {
    BOOL v3 = [(_UIScenePresenter *)self scene];
    int v4 = [v3 isValid];

    if (v4)
    {
      v5 = [[_UIScenePresentationView alloc] initWithPresenter:self];
      view = self->_view;
      self->_view = v5;
    }
  }
  uint64_t v7 = self->_view;
  return (UIScenePresentation *)v7;
}

- (FBScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  BOOL v3 = [WeakRetained scene];

  return (FBScene *)v3;
}

- (UIScenePresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (_UIScenePresenter)initWithOwner:(id)a3 identifier:(id)a4 sortContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_UIScenePresenter;
  id v11 = [(_UIScenePresenter *)&v21 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_owner, v8);
    objc_storeStrong((id *)&v12->_identifier, a4);
    uint64_t v13 = [v10 copy];
    sortContext = v12->_sortContext;
    v12->_sortContext = (NSCopying *)v13;

    BSAbsoluteMachTimeNow();
    v12->_initializeTime = v15;
    long long v16 = [UIScenePresentationContext alloc];
    long long v17 = [v8 defaultPresentationContext];
    uint64_t v18 = [(UIScenePresentationContext *)v16 _initWithDefaultPresentationContext:v17];
    presentationContext = v12->_presentationContext;
    v12->_presentationContext = (UIScenePresentationContext *)v18;
  }
  return v12;
}

- (NSString)identifier
{
  v2 = (void *)[(NSString *)self->_identifier copy];
  return (NSString *)v2;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(_UIScenePresenter *)self descriptionBuilderWithMultilinePrefix:a3];
  int v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  BOOL v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_identifier withName:@"identifier"];
  id v5 = (id)[v3 appendObject:self->_sortContext withName:@"sortContext"];
  if (self->_invalidated) {
    id v6 = (id)[v3 appendBool:1 withName:@"invalidated"];
  }
  return v3;
}

- (_UIScenePresenter)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UIScenePresenter.m" lineNumber:45 description:@"[_UIScenePresenter init] is unavailable for use."];

  v6.receiver = self;
  v6.super_class = (Class)_UIScenePresenter;
  return [(_UIScenePresenter *)&v6 init];
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"_UIScenePresenter.m", 61, @"_UIScenePresenter %@ must be invalidated before it can be deallocated.", self object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)_UIScenePresenter;
  [(_UIScenePresenter *)&v5 dealloc];
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  sortContext = self->_sortContext;
  objc_super v6 = [v4 sortContext];
  int64_t v7 = [(NSCopying *)sortContext compare:v6];

  if (!v7)
  {
    [v4 _initializeTime];
    double initializeTime = self->_initializeTime;
    uint64_t v10 = -1;
    if (initializeTime >= v8) {
      uint64_t v10 = 1;
    }
    if (initializeTime == v8) {
      int64_t v7 = 0;
    }
    else {
      int64_t v7 = v10;
    }
  }

  return v7;
}

- (void)addObserver:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UIScenePresenter.m", 90, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  BSDispatchQueueAssertMain();
  observers = self->_observers;
  if (!observers)
  {
    objc_super v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    int64_t v7 = self->_observers;
    self->_observers = v6;

    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v9];
}

- (void)removeObserver:(id)a3
{
  id v7 = a3;
  BSDispatchQueueAssertMain();
  id v4 = v7;
  if (v7)
  {
    [(NSHashTable *)self->_observers removeObject:v7];
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

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(_UIScenePresenter *)self updateHostingStateIfNecessary];
    [(_UIScenePresentationView *)self->_view invalidate];
    [(UIView *)self->_view removeFromSuperview];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
    [WeakRetained _invalidatePresenter:self];
  }
}

- (BOOL)isActive
{
  if (self->_invalidated) {
    return 0;
  }
  BOOL v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  LOBYTE(v3) = [WeakRetained _isPresenterActive:v3];

  return (char)v3;
}

- (id)newSnapshot
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  id v4 = [WeakRetained scene];
  id v5 = [(_UIScenePresenter *)self newSnapshotContext];
  objc_super v6 = [v4 createSnapshotWithContext:v5];

  return v6;
}

- (id)newSnapshotContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  id v4 = [WeakRetained scene];
  id v5 = [v4 snapshotContext];

  objc_super v6 = [(_UIScenePresentationView *)self->_view hostContainerView];
  id v7 = [v6 nonHostedLayers];
  [v5 setLayersToExclude:v7];

  double v8 = [(UIScenePresentationContext *)self->_presentationContext backgroundColorWhileHosting];
  [v8 alphaComponent];
  [v5 setOpaque:BSFloatIsOne()];

  return v5;
}

- (id)newSnapshotPresentationView
{
  BOOL v3 = [_UISceneSnapshotPresentationView alloc];
  id v4 = [(_UIScenePresenter *)self newSnapshot];
  id v5 = [(_UISceneSnapshotPresentationView *)v3 initWithSnapshot:v4];

  return v5;
}

- (id)succinctDescription
{
  v2 = [(_UIScenePresenter *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (double)_initializeTime
{
  return self->_initializeTime;
}

- (void)set_initializeTime:(double)a3
{
  self->_double initializeTime = a3;
}

- (NSCopying)sortContext
{
  return self->_sortContext;
}

- (BOOL)isVisibilityPropagationEnabled
{
  return self->_visibilityPropagationEnabled;
}

- (void)setVisibilityPropagationEnabled:(BOOL)a3
{
  self->_visibilityPropagationEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sortContext, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_destroyWeak((id *)&self->_owner);
}

@end
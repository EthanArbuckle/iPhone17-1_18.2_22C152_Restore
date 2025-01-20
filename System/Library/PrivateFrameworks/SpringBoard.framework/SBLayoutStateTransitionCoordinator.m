@interface SBLayoutStateTransitionCoordinator
- (BOOL)isTransitioning;
- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4;
- (SBLayoutStateTransitionContext)transitionContext;
- (SBLayoutStateTransitionCoordinator)initWithWindowScene:(id)a3;
- (SBLayoutStateTransitionSceneEntityFrameProvider)sceneEntityFrameProvider;
- (SBWindowScene)windowScene;
- (id)layoutStateForApplicationTransitionContext:(id)a3;
- (id)previousLayoutStateForApplicationTransitionContext:(id)a3;
- (void)addObserver:(id)a3;
- (void)beginTransitionForWorkspaceTransaction:(id)a3;
- (void)endTransitionWithError:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setSceneEntityFrameProvider:(id)a3;
- (void)willEndTransition;
@end

@implementation SBLayoutStateTransitionCoordinator

- (id)previousLayoutStateForApplicationTransitionContext:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v4 = [WeakRetained layoutStateProvider];
  v5 = [v4 layoutState];

  return v5;
}

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  p_windowScene = &self->_windowScene;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_windowScene);
  v6 = [WeakRetained layoutStateManager];
  v7 = [v6 layoutStateForApplicationTransitionContext:v4];

  return v7;
}

- (BOOL)isTransitioning
{
  v2 = [(SBLayoutStateTransitionCoordinator *)self transitionContext];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)endTransitionWithError:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBLayoutStateTransitionCoordinator *)self isTransitioning])
  {
    v5 = [(SBLayoutStateTransitionCoordinator *)self transitionContext];
    [v5 transitionCompletedWithError:v4];

    v6 = (void *)[(NSPointerArray *)self->_observerPointerArray copy];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector())
          {
            v13 = [(SBLayoutStateTransitionCoordinator *)self transitionContext];
            [v12 layoutStateTransitionCoordinator:self transitionDidEndWithTransitionContext:v13];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    transitionContext = self->_transitionContext;
    self->_transitionContext = 0;
  }
}

- (void)beginTransitionForWorkspaceTransaction:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(SBLayoutStateTransitionCoordinator *)self isTransitioning])
  {
    v5 = [[SBLayoutStateTransitionContext alloc] initWithWorkspaceTransaction:v4];
    transitionContext = self->_transitionContext;
    self->_transitionContext = v5;

    id v7 = (void *)[(NSPointerArray *)self->_observerPointerArray copy];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
          if (objc_opt_respondsToSelector())
          {
            v14 = [(SBLayoutStateTransitionCoordinator *)self transitionContext];
            [v13 layoutStateTransitionCoordinator:self transitionDidBeginWithTransitionContext:v14];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

- (SBLayoutStateTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (SBLayoutStateTransitionSceneEntityFrameProvider)sceneEntityFrameProvider
{
  id WeakRetained = (_SBDefaultSceneEntityFrameProvider *)objc_loadWeakRetained((id *)&self->_sceneEntityFrameProvider);
  if (!WeakRetained)
  {
    defaultSceneEntityFrameProvider = self->_defaultSceneEntityFrameProvider;
    if (!defaultSceneEntityFrameProvider)
    {
      v5 = [_SBDefaultSceneEntityFrameProvider alloc];
      id v6 = objc_loadWeakRetained((id *)&self->_windowScene);
      id v7 = [(_SBDefaultSceneEntityFrameProvider *)v5 initWithWindowScene:v6];
      id v8 = self->_defaultSceneEntityFrameProvider;
      self->_defaultSceneEntityFrameProvider = v7;

      defaultSceneEntityFrameProvider = self->_defaultSceneEntityFrameProvider;
    }
    id WeakRetained = defaultSceneEntityFrameProvider;
  }
  return (SBLayoutStateTransitionSceneEntityFrameProvider *)WeakRetained;
}

- (void)willEndTransition
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(SBLayoutStateTransitionCoordinator *)self isTransitioning])
  {
    BOOL v3 = (void *)[(NSPointerArray *)self->_observerPointerArray copy];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v10 = [(SBLayoutStateTransitionCoordinator *)self transitionContext];
            [v9 layoutStateTransitionCoordinator:self transitionWillEndWithTransitionContext:v10];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (SBLayoutStateTransitionCoordinator)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBLayoutStateTransitionCoordinator;
  uint64_t v5 = [(SBLayoutStateTransitionCoordinator *)&v10 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_windowScene, v4);
    uint64_t v7 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    observerPointerArray = v6->_observerPointerArray;
    v6->_observerPointerArray = (NSPointerArray *)v7;
  }
  return v6;
}

- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 request];
  [v7 applicationTransitionContext:v6 frameForApplicationSceneEntity:v5];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)addObserver:(id)a3
{
  if (a3) {
    -[NSPointerArray addPointer:](self->_observerPointerArray, "addPointer:");
  }
}

- (void)removeObserver:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    NSUInteger v4 = [(NSPointerArray *)self->_observerPointerArray count];
    if (v4)
    {
      NSUInteger v5 = v4;
      uint64_t v6 = 0;
      while ([(NSPointerArray *)self->_observerPointerArray pointerAtIndex:v6] != v7)
      {
        if (v5 == ++v6) {
          goto LABEL_8;
        }
      }
      [(NSPointerArray *)self->_observerPointerArray removePointerAtIndex:v6];
    }
  }
LABEL_8:
}

- (void)setSceneEntityFrameProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneEntityFrameProvider);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_defaultSceneEntityFrameProvider, 0);
  objc_storeStrong((id *)&self->_observerPointerArray, 0);
}

@end
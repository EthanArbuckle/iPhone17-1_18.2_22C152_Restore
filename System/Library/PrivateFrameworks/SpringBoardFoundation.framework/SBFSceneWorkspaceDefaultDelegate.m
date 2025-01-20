@interface SBFSceneWorkspaceDefaultDelegate
- (SBFSceneWorkspaceDefaultDelegate)init;
- (void)_activateScene:(id)a3;
- (void)_cleanupTransitionContextGeneratorBlockForSceneIfNeeded:(id)a3;
- (void)_setScene:(id)a3 activatesWithTransitionContextGeneratorBlock:(id)a4;
- (void)_setScene:(id)a3 cached:(BOOL)a4 inContainer:(id)a5 withContextGenerator:(id)a6;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidActivate:(id)a3;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)setScene:(id)a3 shouldActivateUponClientConnection:(BOOL)a4 withContextGenerator:(id)a5;
- (void)setScene:(id)a3 shouldBeKeptActiveWhileForeground:(BOOL)a4 withContextGenerator:(id)a5;
- (void)workspace:(id)a3 clientDidConnectWithHandshake:(id)a4;
- (void)workspace:(id)a3 didAddScene:(id)a4;
- (void)workspace:(id)a3 willRemoveScene:(id)a4;
@end

@implementation SBFSceneWorkspaceDefaultDelegate

- (void)workspace:(id)a3 clientDidConnectWithHandshake:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v27 = a4;
  BSDispatchQueueAssertMain();
  v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v24 identifier];
    *(_DWORD *)buf = 134218498;
    v34 = self;
    __int16 v35 = 2114;
    v36 = v7;
    __int16 v37 = 2114;
    id v38 = v27;
    _os_log_impl(&dword_18B52E000, v6, OS_LOG_TYPE_DEFAULT, "SceneWorkspaceDelegate[%p-%{public}@] client did connect with handshake: %{public}@", buf, 0x20u);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v25 = self;
  id obj = [(NSMutableSet *)self->_scenesActivatedUponClientConnection allObjects];
  uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v29;
    *(void *)&long long v9 = 134218498;
    long long v23 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "definition", v23);
        v15 = [v14 clientIdentity];
        v16 = [v15 processIdentity];
        v17 = [v27 handle];
        v18 = [v17 identity];
        int v19 = [v16 isEqual:v18];

        if (v19 && ([v13 isActive] & 1) == 0)
        {
          [(SBFSceneWorkspaceDefaultDelegate *)v25 _activateScene:v13];
          v20 = SBLogCommon();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = [v24 identifier];
            v22 = [v13 identifier];
            *(_DWORD *)buf = v23;
            v34 = v25;
            __int16 v35 = 2114;
            v36 = v21;
            __int16 v37 = 2114;
            id v38 = v22;
            _os_log_impl(&dword_18B52E000, v20, OS_LOG_TYPE_DEFAULT, "SceneWorkspaceDelegate[%p-%{public}@] scene was activated for client process is running: %{public}@", buf, 0x20u);
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v10);
  }
}

- (SBFSceneWorkspaceDefaultDelegate)init
{
  v10.receiver = self;
  v10.super_class = (Class)SBFSceneWorkspaceDefaultDelegate;
  v2 = [(SBFSceneWorkspaceDefaultDelegate *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    scenesKeptActiveWhileForeground = v2->_scenesKeptActiveWhileForeground;
    v2->_scenesKeptActiveWhileForeground = (NSMutableSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    scenesActivatedUponClientConnection = v2->_scenesActivatedUponClientConnection;
    v2->_scenesActivatedUponClientConnection = (NSMutableSet *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    scenesWithActivationContextGeneratorBlock = v2->_scenesWithActivationContextGeneratorBlock;
    v2->_scenesWithActivationContextGeneratorBlock = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (void)setScene:(id)a3 shouldActivateUponClientConnection:(BOOL)a4 withContextGenerator:(id)a5
{
  BOOL v6 = a4;
  id v13 = a3;
  id v9 = a5;
  id v10 = v13;
  id v11 = v9;
  if (!v13)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBFSceneWorkspaceDefaultDelegate.m", 35, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];

    id v10 = 0;
  }
  [(SBFSceneWorkspaceDefaultDelegate *)self _setScene:v10 cached:v6 inContainer:self->_scenesActivatedUponClientConnection withContextGenerator:v11];
}

- (void)setScene:(id)a3 shouldBeKeptActiveWhileForeground:(BOOL)a4 withContextGenerator:(id)a5
{
  BOOL v6 = a4;
  id v13 = a3;
  id v9 = a5;
  id v10 = v13;
  id v11 = v9;
  if (!v13)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBFSceneWorkspaceDefaultDelegate.m", 40, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];

    id v10 = 0;
  }
  [(SBFSceneWorkspaceDefaultDelegate *)self _setScene:v10 cached:v6 inContainer:self->_scenesKeptActiveWhileForeground withContextGenerator:v11];
}

- (void)_setScene:(id)a3 cached:(BOOL)a4 inContainer:(id)a5 withContextGenerator:(id)a6
{
  BOOL v8 = a4;
  id v17 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = v17;
  id v14 = v12;
  if (v17)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBFSceneWorkspaceDefaultDelegate.m", 47, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];

    id v13 = 0;
    if (v11) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"SBFSceneWorkspaceDefaultDelegate.m", 48, @"Invalid parameter not satisfying: %@", @"container" object file lineNumber description];

  id v13 = v17;
LABEL_3:
  if (v8)
  {
    if (([v11 containsObject:v13] & 1) == 0)
    {
      [v11 addObject:v17];
      if (v14) {
        [(SBFSceneWorkspaceDefaultDelegate *)self _setScene:v17 activatesWithTransitionContextGeneratorBlock:v14];
      }
    }
  }
  else
  {
    [v11 removeObject:v13];
    [(SBFSceneWorkspaceDefaultDelegate *)self _cleanupTransitionContextGeneratorBlockForSceneIfNeeded:v17];
  }
}

- (void)_setScene:(id)a3 activatesWithTransitionContextGeneratorBlock:(id)a4
{
  id v18 = a3;
  id v7 = a4;
  BOOL v8 = v18;
  if (v18)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBFSceneWorkspaceDefaultDelegate.m", 64, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];

    BOOL v8 = 0;
    if (v7) {
      goto LABEL_3;
    }
  }
  id v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"SBFSceneWorkspaceDefaultDelegate.m", 65, @"Invalid parameter not satisfying: %@", @"transitionContextGeneratorBlock" object file lineNumber description];

  BOOL v8 = v18;
LABEL_3:
  scenesWithActivationContextGeneratorBlock = self->_scenesWithActivationContextGeneratorBlock;
  id v10 = [v8 identifier];
  id v11 = [(NSMutableDictionary *)scenesWithActivationContextGeneratorBlock objectForKey:v10];

  if (!v11)
  {
    id v12 = self->_scenesWithActivationContextGeneratorBlock;
    id v13 = (void *)[v7 copy];
    id v14 = (void *)MEMORY[0x18C133210]();
    v15 = [v18 identifier];
    [(NSMutableDictionary *)v12 setObject:v14 forKey:v15];
  }
}

- (void)_cleanupTransitionContextGeneratorBlockForSceneIfNeeded:(id)a3
{
  id v6 = a3;
  if ((-[NSMutableSet containsObject:](self->_scenesActivatedUponClientConnection, "containsObject:") & 1) == 0
    && ([(NSMutableSet *)self->_scenesKeptActiveWhileForeground containsObject:v6] & 1) == 0)
  {
    scenesWithActivationContextGeneratorBlock = self->_scenesWithActivationContextGeneratorBlock;
    uint64_t v5 = [v6 identifier];
    [(NSMutableDictionary *)scenesWithActivationContextGeneratorBlock removeObjectForKey:v5];
  }
}

- (void)_activateScene:(id)a3
{
  id v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBFSceneWorkspaceDefaultDelegate.m", 79, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];
  }
  scenesWithActivationContextGeneratorBlock = self->_scenesWithActivationContextGeneratorBlock;
  id v7 = [v5 identifier];
  BOOL v8 = [(NSMutableDictionary *)scenesWithActivationContextGeneratorBlock objectForKey:v7];
  v8[2]();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [v5 activateWithTransitionContext:v10];
}

- (void)workspace:(id)a3 didAddScene:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  BOOL v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 identifier];
    id v10 = [v7 identifier];
    int v11 = 134218498;
    id v12 = self;
    __int16 v13 = 2114;
    id v14 = v9;
    __int16 v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_18B52E000, v8, OS_LOG_TYPE_DEFAULT, "SceneWorkspaceDelegate[%p-%{public}@] did add scene: %{public}@", (uint8_t *)&v11, 0x20u);
  }
  [v7 setDelegate:self];
}

- (void)workspace:(id)a3 willRemoveScene:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  BOOL v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 identifier];
    id v10 = [v7 identifier];
    int v11 = 134218498;
    id v12 = self;
    __int16 v13 = 2114;
    id v14 = v9;
    __int16 v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_18B52E000, v8, OS_LOG_TYPE_DEFAULT, "SceneWorkspaceDelegate[%p-%{public}@] will remove scene: %{public}@", (uint8_t *)&v11, 0x20u);
  }
  [v7 setDelegate:0];
}

- (void)sceneDidActivate:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    int v7 = 134218242;
    BOOL v8 = self;
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl(&dword_18B52E000, v5, OS_LOG_TYPE_DEFAULT, "SceneWorkspaceDelegate[%p] scene did activate: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  BOOL v8 = [v6 identifier];
  __int16 v9 = SBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v7 localizedDescription];
    int v15 = 134218498;
    v16 = self;
    __int16 v17 = 2114;
    id v18 = v8;
    __int16 v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_18B52E000, v9, OS_LOG_TYPE_DEFAULT, "SceneWorkspaceDelegate[%p] scene did deactivate: %{public}@ error: %{public}@", (uint8_t *)&v15, 0x20u);
  }
  uint64_t v11 = [v6 settings];
  int v12 = [v11 isForeground];

  if (v12)
  {
    __int16 v13 = SBLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134218242;
      v16 = self;
      __int16 v17 = 2114;
      id v18 = v8;
      _os_log_impl(&dword_18B52E000, v13, OS_LOG_TYPE_DEFAULT, "SceneWorkspaceDelegate[%p] scene did deactivate while foreground: %{public}@", (uint8_t *)&v15, 0x16u);
    }

    if ([(NSMutableSet *)self->_scenesKeptActiveWhileForeground containsObject:v6])
    {
      id v14 = SBLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 134218242;
        v16 = self;
        __int16 v17 = 2114;
        id v18 = v8;
        _os_log_impl(&dword_18B52E000, v14, OS_LOG_TYPE_DEFAULT, "SceneWorkspaceDelegate[%p] automatically re-activating scene: %{public}@", (uint8_t *)&v15, 0x16u);
      }

      [(SBFSceneWorkspaceDefaultDelegate *)self _activateScene:v6];
    }
  }
}

- (void)sceneContentStateDidChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 contentState];
    id v7 = [v4 identifier];
    int v8 = 134218498;
    __int16 v9 = self;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    __int16 v13 = v7;
    _os_log_impl(&dword_18B52E000, v5, OS_LOG_TYPE_DEFAULT, "SceneWorkspaceDelegate[%p] content state did change: %ld for scene: %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scenesWithActivationContextGeneratorBlock, 0);
  objc_storeStrong((id *)&self->_scenesKeptActiveWhileForeground, 0);
  objc_storeStrong((id *)&self->_scenesActivatedUponClientConnection, 0);
}

@end
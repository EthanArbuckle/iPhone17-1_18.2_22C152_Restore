@interface SBIdleTimerCoordinatorHelper
- (BOOL)hasProvider:(id)a3;
- (NSMapTable)idleTimerCache;
- (SBIdleTimerCoordinating)targetCoordinator;
- (SBIdleTimerCoordinatorHelper)init;
- (SBIdleTimerCoordinatorHelper)initWithSourceProvider:(id)a3;
- (SBIdleTimerProviding)sourceProvider;
- (id)_updateProvider:(id)a3 behavior:(id)a4 reason:(id)a5;
- (id)_updateProviderInfo:(id)a3 behavior:(id)a4 reason:(id)a5;
- (id)idleTimerProxyForProvider:(id)a3;
- (id)proposeIdleTimerBehavior:(id)a3 fromProvider:(id)a4 reason:(id)a5;
- (id)proposeProvider:(id)a3 byCoordinator:(id)a4 reason:(id)a5;
- (void)bindProvider:(id)a3 toSourceTimer:(id)a4 behavior:(id)a5 forReason:(id)a6;
- (void)removeProvider:(id)a3;
- (void)setSourceProvider:(id)a3;
- (void)setTargetCoordinator:(id)a3;
@end

@implementation SBIdleTimerCoordinatorHelper

- (id)proposeIdleTimerBehavior:(id)a3 fromProvider:(id)a4 reason:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = SBLogIdleTimer();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 138543874;
    id v19 = (id)objc_opt_class();
    __int16 v20 = 2114;
    id v21 = v10;
    __int16 v22 = 2114;
    id v23 = v8;
    id v17 = v19;
    _os_log_debug_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEBUG, "PROPOSE BEHAVIOR: %{public}@ reason:%{public}@ %{public}@", (uint8_t *)&v18, 0x20u);
  }
  v12 = [(SBIdleTimerCoordinatorHelper *)self _updateProvider:v9 behavior:v8 reason:v10];
  v13 = [(SBIdleTimerCoordinatorHelper *)self targetCoordinator];
  v14 = [(SBIdleTimerCoordinatorHelper *)self sourceProvider];
  v15 = [v13 idleTimerProvider:v14 didProposeBehavior:v8 forReason:v10];

  [v12 setSourceTimer:v15];
  return v12;
}

- (id)_updateProvider:(id)a3 behavior:(id)a4 reason:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = SBLogIdleTimer();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138543874;
    id v17 = (id)objc_opt_class();
    __int16 v18 = 2114;
    id v19 = v10;
    __int16 v20 = 2114;
    id v21 = v9;
    id v15 = v17;
    _os_log_debug_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEBUG, "UPDATE BEHAVIOR: %{public}@ reason:%{public}@ %{public}@", (uint8_t *)&v16, 0x20u);
  }
  v12 = [(SBIdleTimerCoordinatorHelper *)self _updateProviderInfo:v8 behavior:v9 reason:v10];
  v13 = [v12 idleTimerProxy];

  return v13;
}

- (id)_updateProviderInfo:(id)a3 behavior:(id)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  idleTimerCache = self->_idleTimerCache;
  v11 = (SBIdleTimerProxy *)a5;
  v12 = [(NSMapTable *)idleTimerCache objectForKey:v8];
  if (v12)
  {
    v13 = v12;
    [(SBIdleTimerInfo *)v12 setBehavior:v9];
    [(SBIdleTimerInfo *)v13 setReason:v11];
  }
  else
  {
    v14 = [[SBIdleTimerProxy alloc] initWithIdleTimerSource:0];
    v13 = [[SBIdleTimerInfo alloc] initWithProvider:v8 behavior:v9 reason:v11 idleTimerProxy:v14];

    [(NSMapTable *)self->_idleTimerCache setObject:v13 forKey:v8];
    v11 = v14;
  }

  return v13;
}

- (SBIdleTimerCoordinating)targetCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetCoordinator);
  return (SBIdleTimerCoordinating *)WeakRetained;
}

- (SBIdleTimerProviding)sourceProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceProvider);
  return (SBIdleTimerProviding *)WeakRetained;
}

- (id)idleTimerProxyForProvider:(id)a3
{
  v3 = [(NSMapTable *)self->_idleTimerCache objectForKey:a3];
  v4 = [v3 idleTimerProxy];

  return v4;
}

- (SBIdleTimerCoordinatorHelper)init
{
  return [(SBIdleTimerCoordinatorHelper *)self initWithSourceProvider:0];
}

- (SBIdleTimerCoordinatorHelper)initWithSourceProvider:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBIdleTimerCoordinatorHelper;
  v5 = [(SBIdleTimerCoordinatorHelper *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sourceProvider, v4);
    uint64_t v7 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    idleTimerCache = v6->_idleTimerCache;
    v6->_idleTimerCache = (NSMapTable *)v7;
  }
  return v6;
}

- (BOOL)hasProvider:(id)a3
{
  id v4 = a3;
  v5 = [(SBIdleTimerCoordinatorHelper *)self idleTimerCache];
  v6 = [v5 objectForKey:v4];

  return v6 != 0;
}

- (id)proposeProvider:(id)a3 byCoordinator:(id)a4 reason:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = SBLogIdleTimer();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v19 = objc_opt_class();
    id v20 = v19;
    int v22 = 138543874;
    id v23 = v19;
    __int16 v24 = 2114;
    id v25 = (id)objc_opt_class();
    __int16 v26 = 2114;
    id v27 = v10;
    id v21 = v25;
    _os_log_debug_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEBUG, "PROPOSE provider:%{public}@ coordinator:%{public}@ reason:%{public}@ ", (uint8_t *)&v22, 0x20u);
  }
  v12 = [v8 coordinatorRequestedIdleTimerBehavior:v9];
  v13 = [(SBIdleTimerCoordinatorHelper *)self _updateProviderInfo:v8 behavior:v12 reason:v10];
  v14 = [(SBIdleTimerCoordinatorHelper *)self targetCoordinator];
  id v15 = [(SBIdleTimerCoordinatorHelper *)self sourceProvider];
  int v16 = [v14 idleTimerProvider:v15 didProposeBehavior:v12 forReason:v10];

  id v17 = [v13 idleTimerProxy];
  [v17 setSourceTimer:v16];

  return v17;
}

- (void)bindProvider:(id)a3 toSourceTimer:(id)a4 behavior:(id)a5 forReason:(id)a6
{
  id v10 = a4;
  id v11 = [(SBIdleTimerCoordinatorHelper *)self _updateProvider:a3 behavior:a5 reason:a6];
  [v11 setSourceTimer:v10];
}

- (void)removeProvider:(id)a3
{
  id v4 = a3;
  v5 = SBLogIdleTimer();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBIdleTimerCoordinatorHelper removeProvider:]((uint64_t)v4, v5);
  }

  [(NSMapTable *)self->_idleTimerCache removeObjectForKey:v4];
}

- (void)setSourceProvider:(id)a3
{
}

- (void)setTargetCoordinator:(id)a3
{
}

- (NSMapTable)idleTimerCache
{
  return self->_idleTimerCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimerCache, 0);
  objc_destroyWeak((id *)&self->_targetCoordinator);
  objc_destroyWeak((id *)&self->_sourceProvider);
}

- (void)removeProvider:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138543362;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "REMOVE provider: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end
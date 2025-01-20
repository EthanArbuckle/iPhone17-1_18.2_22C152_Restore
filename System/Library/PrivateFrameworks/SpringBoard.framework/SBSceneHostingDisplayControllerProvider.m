@interface SBSceneHostingDisplayControllerProvider
- (SBSceneHostingDisplayControllerProvider)initWithTransformerRegistry:(id)a3 displayManager:(id)a4 workspaceEventQueue:(id)a5 displayModeResolverFactory:(id)a6 policyFactory:(id)a7;
- (id)displayControllerInfoForConnectingDisplay:(id)a3 configuration:(id)a4;
- (id)transformDisplayConfiguration:(id)a3;
- (void)dealloc;
- (void)displayManager:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displayManager:(id)a3 didDisconnectIdentity:(id)a4;
- (void)resolver:(id)a3 rootDisplay:(id)a4 didUpdateAvailability:(BOOL)a5;
@end

@implementation SBSceneHostingDisplayControllerProvider

- (SBSceneHostingDisplayControllerProvider)initWithTransformerRegistry:(id)a3 displayManager:(id)a4 workspaceEventQueue:(id)a5 displayModeResolverFactory:(id)a6 policyFactory:(id)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"SBSceneHostingDisplayControllerProvider.m", 49, @"Invalid parameter not satisfying: %@", @"transformerRegistry" object file lineNumber description];

    if (v14)
    {
LABEL_3:
      if (v16) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  v43 = [MEMORY[0x1E4F28B00] currentHandler];
  [v43 handleFailureInMethod:a2, self, @"SBSceneHostingDisplayControllerProvider.m", 50, @"Invalid parameter not satisfying: %@", @"displayManager" object file lineNumber description];

  if (v16)
  {
LABEL_4:
    if (v15) {
      goto LABEL_5;
    }
LABEL_19:
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"SBSceneHostingDisplayControllerProvider.m", 52, @"Invalid parameter not satisfying: %@", @"workspaceEventQueue" object file lineNumber description];

    if (v17) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_18:
  v44 = [MEMORY[0x1E4F28B00] currentHandler];
  [v44 handleFailureInMethod:a2, self, @"SBSceneHostingDisplayControllerProvider.m", 51, @"Invalid parameter not satisfying: %@", @"displayModeResolverFactory" object file lineNumber description];

  if (!v15) {
    goto LABEL_19;
  }
LABEL_5:
  if (v17) {
    goto LABEL_6;
  }
LABEL_20:
  v46 = [MEMORY[0x1E4F28B00] currentHandler];
  [v46 handleFailureInMethod:a2, self, @"SBSceneHostingDisplayControllerProvider.m", 53, @"Invalid parameter not satisfying: %@", @"policyFactory" object file lineNumber description];

LABEL_6:
  v53.receiver = self;
  v53.super_class = (Class)SBSceneHostingDisplayControllerProvider;
  v18 = [(SBSceneHostingDisplayControllerProvider *)&v53 init];
  v19 = v18;
  if (v18)
  {
    id v41 = v15;
    id v48 = v13;
    objc_storeStrong((id *)&v18->_transformerRegistry, a3);
    objc_storeWeak((id *)&v19->_displayManager, v14);
    v19->_lock._os_unfair_lock_opaque = 0;
    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    lock_capableRootDisplaysToResolverMap = v19->_lock_capableRootDisplaysToResolverMap;
    v19->_lock_capableRootDisplaysToResolverMap = (NSMutableDictionary *)v20;

    uint64_t v22 = [MEMORY[0x1E4F1CA80] set];
    lock_derivedDisplaysAwaitingConnection = v19->_lock_derivedDisplaysAwaitingConnection;
    v19->_lock_derivedDisplaysAwaitingConnection = (NSMutableSet *)v22;

    uint64_t v24 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    lock_rootDisplaysToControllerMap = v19->_lock_rootDisplaysToControllerMap;
    v19->_lock_rootDisplaysToControllerMap = (NSMapTable *)v24;

    objc_storeStrong((id *)&v19->_workspaceEventQueue, a5);
    objc_storeStrong((id *)&v19->_resolverFactory, a6);
    objc_storeStrong((id *)&v19->_policyFactory, a7);
    transformerRegistry = v19->_transformerRegistry;
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    uint64_t v29 = [(SBDisplayTransformerRegistry *)transformerRegistry addTransformer:v19 withIdentifier:v28];
    transformerToken = v19->_transformerToken;
    v19->_transformerToken = (BSInvalidatable *)v29;

    uint64_t v31 = [v14 addObserver:v19];
    displayManagerObserverToken = v19->_displayManagerObserverToken;
    v19->_displayManagerObserverToken = (BSInvalidatable *)v31;

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v33 = [v14 connectedIdentities];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v50 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          v39 = [v14 configurationForIdentity:v38];
          [(SBSceneHostingDisplayControllerProvider *)v19 displayManager:v14 didConnectIdentity:v38 withConfiguration:v39];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v35);
    }

    id v15 = v41;
    id v13 = v48;
  }

  return v19;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_transformerToken invalidate];
  [(BSInvalidatable *)self->_displayManagerObserverToken invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSceneHostingDisplayControllerProvider;
  [(SBSceneHostingDisplayControllerProvider *)&v3 dealloc];
}

- (void)displayManager:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  if ([v11 isRootIdentity])
  {
    v8 = [(SBWindowingModeResolverFactory *)self->_resolverFactory resolverForPhysicalDisplay:v7];
    v9 = v8;
    if (v8)
    {
      [v8 setDelegate:self];
      os_unfair_lock_assert_not_owner(&self->_lock);
      os_unfair_lock_lock(&self->_lock);
      [(NSMutableDictionary *)self->_lock_capableRootDisplaysToResolverMap setObject:v9 forKey:v11];
      os_unfair_lock_unlock(&self->_lock);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_displayManager);
      [WeakRetained updateTransformsWithCompletion:0];
    }
  }
}

- (void)displayManager:(id)a3 didDisconnectIdentity:(id)a4
{
  id v8 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v5 = [(NSMutableDictionary *)self->_lock_capableRootDisplaysToResolverMap objectForKey:v8];

  if (v5) {
    [(NSMutableDictionary *)self->_lock_capableRootDisplaysToResolverMap removeObjectForKey:v8];
  }
  v6 = [(NSMapTable *)self->_lock_rootDisplaysToControllerMap objectForKey:v8];

  if (v6) {
    [(NSMapTable *)self->_lock_rootDisplaysToControllerMap removeObjectForKey:v8];
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_displayManager);
    [WeakRetained updateTransformsWithCompletion:0];
  }
}

- (id)displayControllerInfoForConnectingDisplay:(id)a3 configuration:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  int v7 = [(NSMutableSet *)self->_lock_derivedDisplaysAwaitingConnection containsObject:v6];
  [(NSMutableSet *)self->_lock_derivedDisplaysAwaitingConnection removeObject:v6];
  os_unfair_lock_unlock(&self->_lock);
  if (v7)
  {
    id v8 = [(SBSceneHostingDisplayControllerPolicyFactory *)self->_policyFactory policyForConnectingDisplay:v6];
    uint64_t v9 = [v8 displayAssertionPriorityLevel:v6];
    uint64_t v10 = [v8 displayAssertionDeactivationReasons:v6];
    id v11 = [[SBSceneHostingDisplayController alloc] initWithWorkspaceEventQueue:self->_workspaceEventQueue policy:v8];
    v12 = [[SBDisplayControllerInfo alloc] initWithController:v11 windowingMode:[(SBWindowingModeResolverFactory *)self->_resolverFactory displayWindowingMode] priorityLevel:v9 deactivationReasons:v10];
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    id v13 = [v6 rootIdentity];
    id v14 = [(NSMapTable *)self->_lock_rootDisplaysToControllerMap objectForKey:v13];
    if (v14)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBSceneHostingDisplayControllerProvider.m", 139, @"we can only track one controller per physical display. already tracking: %@; wanted to add: %@; to display: %@",
        v14,
        v11,
        v13);
    }
    [(NSMapTable *)self->_lock_rootDisplaysToControllerMap setObject:v11 forKey:v13];
    id v15 = SBLogDisplayControlling();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = _SBFLoggingMethodProem();
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v16;
      __int16 v21 = 2114;
      uint64_t v22 = v11;
      __int16 v23 = 2114;
      uint64_t v24 = v13;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ tracking controller: %{public}@; display: %{public}@",
        buf,
        0x20u);
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)transformDisplayConfiguration:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA80] set];
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  int v7 = [v5 identity];
  id v8 = [v7 rootIdentity];

  uint64_t v9 = [(NSMutableDictionary *)self->_lock_capableRootDisplaysToResolverMap objectForKey:v8];
  if ([v9 isWindowingModeAvailable])
  {
    v26 = v9;
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F62920]) initWithConfiguration:v5];
    [(SBSceneHostingDisplayControllerPolicyFactory *)self->_policyFactory transformDisplayConfiguration:v5 forControllersWithBuilder:v10];
    id v11 = [(NSMapTable *)self->_lock_rootDisplaysToControllerMap objectForKey:v8];
    uint64_t v25 = v11;
    if (v11)
    {
      [v11 transformDisplayConfiguration:v5 withBuilder:v10];
    }
    else
    {
      v12 = SBLogDisplayTransforming();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        [(SBSceneHostingDisplayControllerProvider *)(uint64_t)self transformDisplayConfiguration:v12];
      }
    }
    id v28 = 0;
    id v13 = [v10 buildConfigurationWithError:&v28];
    id v27 = v28;
    if (v13)
    {
      lock_derivedDisplaysAwaitingConnection = self->_lock_derivedDisplaysAwaitingConnection;
      id v15 = [v13 identity];
      [(NSMutableSet *)lock_derivedDisplaysAwaitingConnection addObject:v15];

      [v6 addObject:v13];
    }
    else
    {
      id v16 = SBLogDisplayTransforming();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        [(SBSceneHostingDisplayControllerProvider *)(uint64_t)v27 transformDisplayConfiguration:v16];
      }
    }
    id v17 = SBLogDisplayTransforming();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = _SBFLoggingMethodProem();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v21 = uint64_t v20 = v6;
      *(_DWORD *)buf = 138543874;
      v30 = v18;
      __int16 v31 = 2114;
      v32 = v21;
      __int16 v33 = 2114;
      uint64_t v34 = v13;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] transformed display: %{public}@", buf, 0x20u);

      id v6 = v20;
    }

    uint64_t v9 = v26;
  }
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v22 = SBLogDisplayTransforming();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543618;
    v30 = v24;
    __int16 v31 = 2114;
    v32 = v6;
    _os_log_debug_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEBUG, "%{public}@ returning: %{public}@", buf, 0x16u);
  }
  return v6;
}

- (void)resolver:(id)a3 rootDisplay:(id)a4 didUpdateAvailability:(BOOL)a5
{
  if ((objc_msgSend(a4, "isRootIdentity", a3) & 1) == 0)
  {
    int v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBSceneHostingDisplayControllerProvider.m", 192, @"Invalid parameter not satisfying: %@", @"[rootDisplay isRootIdentity]" object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayManager);
  [WeakRetained updateTransformsWithCompletion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspaceEventQueue, 0);
  objc_storeStrong((id *)&self->_policyFactory, 0);
  objc_storeStrong((id *)&self->_lock_rootDisplaysToControllerMap, 0);
  objc_storeStrong((id *)&self->_lock_derivedDisplaysAwaitingConnection, 0);
  objc_storeStrong((id *)&self->_lock_capableRootDisplaysToResolverMap, 0);
  objc_storeStrong((id *)&self->_resolverFactory, 0);
  objc_storeStrong((id *)&self->_displayManagerObserverToken, 0);
  objc_destroyWeak((id *)&self->_displayManager);
  objc_storeStrong((id *)&self->_transformerToken, 0);
  objc_storeStrong((id *)&self->_transformerRegistry, 0);
}

- (void)transformDisplayConfiguration:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Unable to create shell ui external display configuration: %@ from configuration:%@", (uint8_t *)&v3, 0x16u);
}

- (void)transformDisplayConfiguration:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _SBFLoggingMethodProem();
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ not passing to controller as we don't have one yet", (uint8_t *)&v5, 0xCu);
}

@end
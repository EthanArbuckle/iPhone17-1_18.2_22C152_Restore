@interface PRSWallpaperObserver
- (PRSWallpaperObserver)init;
- (PRSWallpaperObserver)initWithExplanation:(id)a3;
- (void)_lock_invalidate;
- (void)activateWithConfiguration:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)notifyInitialUpdatesComplete;
- (void)notifyRoleActivePosterUpdates:(id)a3;
- (void)notifyRolePosterCollectionUpdates:(id)a3;
- (void)notifySnapshotUpdates:(id)a3;
- (void)notifyWallpaperUpdates:(id)a3;
@end

@implementation PRSWallpaperObserver

- (PRSWallpaperObserver)init
{
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v4 stringWithFormat:@"%@ is not allowed on %@", v5, v7];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = NSStringFromSelector(a2);
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138544642;
    v14 = v9;
    __int16 v15 = 2114;
    v16 = v11;
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 2114;
    v20 = @"PRSWallpaperObserver.m";
    __int16 v21 = 1024;
    int v22 = 197;
    __int16 v23 = 2114;
    v24 = v8;
    _os_log_error_impl(&dword_1A78AC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v8 UTF8String];
  result = (PRSWallpaperObserver *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (PRSWallpaperObserver)initWithExplanation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v15.receiver = self;
    v15.super_class = (Class)PRSWallpaperObserver;
    v6 = [(PRSWallpaperObserver *)&v15 init];
    if (v6)
    {
      uint64_t v7 = [v5 copy];
      explanation = v6->_explanation;
      v6->_explanation = (NSString *)v7;

      v6->_lock._os_unfair_lock_opaque = 0;
      uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
      conn_configurationByIdentity = v6->_conn_configurationByIdentity;
      v6->_conn_configurationByIdentity = (NSMutableDictionary *)v9;

      uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
      conn_roleToActivePosterConfiguration = v6->_conn_roleToActivePosterConfiguration;
      v6->_conn_roleToActivePosterConfiguration = (NSMutableDictionary *)v11;
    }
    return v6;
  }
  else
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"explanation"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSWallpaperObserver initWithExplanation:]();
    }
    [v14 UTF8String];
    result = (PRSWallpaperObserver *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_lock_invalidate
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_lock_invalidated)
  {
    self->_lock_invalidated = 1;
    [(BSServiceConnectionClient *)self->_lock_connection invalidate];
    id lock_pathHandler = self->_lock_pathHandler;
    self->_id lock_pathHandler = 0;

    id lock_snapshotHandler = self->_lock_snapshotHandler;
    self->_id lock_snapshotHandler = 0;

    [(RBSAssertion *)self->_lock_initialUpdateAssertion invalidate];
    lock_initialUpdateAssertion = self->_lock_initialUpdateAssertion;
    self->_lock_initialUpdateAssertion = 0;
  }
}

- (void)activateWithConfiguration:(id)a3
{
  v93[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSClassFromString(&cfstr_Prswallpaperob_0.isa);
  if (!v4)
  {
    v43 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSWallpaperObserver activateWithConfiguration:]();
    }
LABEL_53:
    [v43 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78C78E0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v44 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSWallpaperObserverConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSWallpaperObserver activateWithConfiguration:].cold.9();
    }
    [v44 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78C7944);
  }

  if (([v4 isValid] & 1) == 0)
  {
    v45 = NSString;
    v46 = (objc_class *)objc_opt_class();
    v47 = NSStringFromClass(v46);
    v48 = [v45 stringWithFormat:@"<%@:%@:%p> cannot be activated with an invalid configuration", v47, self->_explanation, self];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSWallpaperObserver activateWithConfiguration:].cold.8();
    }
    [v48 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78C79C4);
  }
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_clientInvalidated)
  {
    os_unfair_lock_unlock(lock);
    v53 = NSString;
    v54 = (objc_class *)objc_opt_class();
    v55 = NSStringFromClass(v54);
    v56 = [v53 stringWithFormat:@"<%@:%@:%p> cannot be activated after invalidation", v55, self->_explanation, self];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSWallpaperObserver activateWithConfiguration:].cold.7();
    }
    [v56 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78C7ADCLL);
  }
  if (self->_lock_clientActivated)
  {
    [(PRSWallpaperObserver *)self _lock_invalidate];
    os_unfair_lock_unlock(lock);
    v57 = NSString;
    v58 = (objc_class *)objc_opt_class();
    v59 = NSStringFromClass(v58);
    v60 = [v57 stringWithFormat:@"<%@:%@:%p> cannot be activated twice", v59, self->_explanation, self];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSWallpaperObserver activateWithConfiguration:].cold.6();
    }
    [v60 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78C7B6CLL);
  }
  uint64_t v5 = [v4 locationStateObserver];

  uint64_t v6 = [v4 snapshotObserver];
  BOOL v70 = v6 != 0;

  uint64_t v7 = [v4 activePosterRoleObserver];

  uint64_t v8 = [v4 postersCollectionRoleObserver];

  if (v5)
  {
    uint8_t v9 = [v4 locationStateObserver];
    self->_observed = [v9 locations];

    PRSWallpaperObserverLocationsDescription(self->_observed);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    active_observedDescription = self->_active_observedDescription;
    self->_active_observedDescription = v10;

    v12 = [v4 locationStateObserver];
    v13 = [v12 handler];
    id lock_pathHandler = self->_lock_pathHandler;
    self->_id lock_pathHandler = v13;

    if ((self->_observed & 0xF) == 0 || !self->_lock_pathHandler)
    {
      [(PRSWallpaperObserver *)self _lock_invalidate];
      os_unfair_lock_unlock(lock);
      v49 = NSString;
      v50 = (objc_class *)objc_opt_class();
      v51 = NSStringFromClass(v50);
      v52 = [v49 stringWithFormat:@"<%@:%@:%p> activated location state observer without observing anything", v51, self->_explanation, self];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRSWallpaperObserver activateWithConfiguration:]();
      }
      [v52 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A78C7A54);
    }
  }
  if (v6)
  {
    objc_super v15 = [v4 snapshotObserver];
    v16 = [v15 handler];
    id lock_snapshotHandler = self->_lock_snapshotHandler;
    self->_id lock_snapshotHandler = v16;

    if (!self->_lock_snapshotHandler)
    {
      [(PRSWallpaperObserver *)self _lock_invalidate];
      os_unfair_lock_unlock(lock);
      v61 = NSString;
      v62 = (objc_class *)objc_opt_class();
      v63 = NSStringFromClass(v62);
      v64 = [v61 stringWithFormat:@"<%@:%@:%p> activated snapshot observer without observing anything", v63, self->_explanation, self];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRSWallpaperObserver activateWithConfiguration:]();
      }
      [v64 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A78C7C00);
    }
  }
  if (v7)
  {
    v18 = [v4 activePosterRoleObserver];
    lock_roleActivePosterObserver = self->_lock_roleActivePosterObserver;
    self->_lock_roleActivePosterObserver = v18;
  }
  if (v8)
  {
    v20 = [v4 postersCollectionRoleObserver];
    lock_rolePosterCollectionObserver = self->_lock_rolePosterCollectionObserver;
    self->_lock_rolePosterCollectionObserver = v20;

    int v22 = [(PRSPosterRoleCollectionObserver *)self->_lock_rolePosterCollectionObserver role];
    conn_knownPostersCollectionRole = self->_conn_knownPostersCollectionRole;
    self->_conn_knownPostersCollectionRole = v22;

    goto LABEL_18;
  }
  if (!v6 && !v5 && !v7)
  {
    [(PRSWallpaperObserver *)self _lock_invalidate];
    os_unfair_lock_unlock(lock);
    v65 = NSString;
    v66 = (objc_class *)objc_opt_class();
    v67 = NSStringFromClass(v66);
    v43 = [v65 stringWithFormat:@"<%@:%@:%p> activated without observing anything", v67, self->_explanation, self];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSWallpaperObserver activateWithConfiguration:].cold.5();
    }
    goto LABEL_53;
  }
LABEL_18:
  self->_lock_clientActivated = 1;
  if (!self->_lock_invalidated)
  {
    v72 = PRSWallpaperObserverInterface();
    v24 = (void *)MEMORY[0x1E4F50BB8];
    v25 = [v72 identifier];
    v71 = [v24 endpointForMachName:@"com.apple.posterboardservices.services" service:v25 instance:0];

    if (v71)
    {
      objc_initWeak(&location, self);
      v26 = (objc_class *)objc_opt_class();
      v69 = NSStringFromClass(v26);
      v68 = self->_explanation;
      v27 = self->_active_observedDescription;
      v28 = (void *)MEMORY[0x1E4F50BA0];
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke;
      v86[3] = &unk_1E5D00CF0;
      v86[4] = self;
      BOOL v88 = v70;
      BOOL v89 = v7 != 0;
      BOOL v90 = v8 != 0;
      BOOL v91 = v5 != 0;
      id v29 = v4;
      id v87 = v29;
      v30 = [v28 connectionWithEndpoint:v71 clientContextBuilder:v86];
      lock_connection = self->_lock_connection;
      self->_lock_connection = v30;

      v32 = self->_lock_connection;
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke_2;
      v75[3] = &unk_1E5D00DB8;
      id v76 = v29;
      id v77 = v72;
      v78 = self;
      objc_copyWeak(&v82, &location);
      BOOL v83 = v5 != 0;
      BOOL v84 = v7 != 0;
      BOOL v85 = v8 != 0;
      id v73 = v69;
      id v79 = v73;
      v33 = v68;
      v80 = v33;
      v34 = v27;
      v81 = v34;
      [(BSServiceConnectionClient *)v32 configureConnection:v75];
      if (v5 || v7 || v8)
      {
        id v35 = objc_alloc(MEMORY[0x1E4F96318]);
        v36 = [NSString stringWithFormat:@"initializing PRSWallpaperObserver-%@", self->_explanation];
        v37 = [(BSServiceConnectionClient *)self->_lock_connection remoteAssertionTarget];
        v38 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
        v93[0] = v38;
        v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:1];
        v40 = (RBSAssertion *)[v35 initWithExplanation:v36 target:v37 attributes:v39];
        lock_initialUpdateAssertion = self->_lock_initialUpdateAssertion;
        self->_lock_initialUpdateAssertion = v40;

        [(RBSAssertion *)self->_lock_initialUpdateAssertion acquireWithInvalidationHandler:0];
      }
      [(BSServiceConnectionClient *)self->_lock_connection activate];

      objc_destroyWeak(&v82);
      objc_destroyWeak(&location);
    }
    else
    {
      v42 = PRSLogObserver();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        -[PRSWallpaperObserver activateWithConfiguration:].cold.4((uint64_t)self, v42);
      }

      [(PRSWallpaperObserver *)self _lock_invalidate];
    }
  }
  os_unfair_lock_unlock(lock);
}

void __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 encodeObject:*(void *)(*(void *)(a1 + 32) + 8) forKey:@"explanation"];
  [v6 encodeUInt64:*(void *)(*(void *)(a1 + 32) + 56) forKey:@"observedLocations"];
  [v6 encodeBool:*(unsigned __int8 *)(a1 + 48) forKey:@"snapshotObservation"];
  [v6 encodeBool:*(unsigned __int8 *)(a1 + 49) forKey:@"roleObservation"];
  if (*(unsigned char *)(a1 + 49))
  {
    v3 = [*(id *)(*(void *)(a1 + 32) + 40) roles];
    [v6 encodeCollection:v3 forKey:@"observedRoles"];

    objc_msgSend(v6, "encodeBool:forKey:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "needsSandboxExtensions"), @"observedRolesNeedSandboxExtensions");
  }
  [v6 encodeBool:*(unsigned __int8 *)(a1 + 50) forKey:@"collectionObserving"];
  if (*(unsigned char *)(a1 + 50))
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 48) role];
    [v6 encodeObject:v4 forKey:@"collectionObservingRole"];

    objc_msgSend(v6, "encodeBool:forKey:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "needsSandboxExtensions"), @"collectionObservingNeedsSandboxExtensions");
  }
  if (*(unsigned char *)(a1 + 51))
  {
    uint64_t v5 = [*(id *)(a1 + 40) locationStateObserver];
    objc_msgSend(v6, "encodeBool:forKey:", objc_msgSend(v5, "needsSandboxExtensions"), @"needsSandboxExtensions");
  }
}

void __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PRSDefaultServiceQuality();
  [v3 setServiceQuality:v4];

  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 8)];
  [v3 setInterface:*(void *)(a1 + 40)];
  [v3 setInterfaceTarget:*(void *)(a1 + 48)];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke_3;
  v15[3] = &unk_1E5D00D40;
  objc_copyWeak(&v19, (id *)(a1 + 80));
  char v20 = *(unsigned char *)(a1 + 88);
  __int16 v21 = *(_WORD *)(a1 + 89);
  id v16 = *(id *)(a1 + 56);
  id v17 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 72);
  [v3 setActivationHandler:v15];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke_175;
  v10[3] = &unk_1E5D00D68;
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  objc_copyWeak(&v14, (id *)(a1 + 80));
  id v13 = *(id *)(a1 + 72);
  [v3 setInterruptionHandler:v10];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke_176;
  v5[3] = &unk_1E5D00D90;
  objc_copyWeak(&v9, (id *)(a1 + 80));
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  [v3 setInvalidationHandler:v5];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&v19);
}

void __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke_3(id *a1, void *a2)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (char *)objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    uint64_t v5 = [v3 remoteTarget];
    id v6 = (void *)v5;
    if (v5)
    {
      v51 = a1;
      if (*((unsigned char *)a1 + 64))
      {
        v48 = (void *)v5;
        id v50 = v3;
        id v7 = 0;
        id v8 = WeakRetained + 80;
        uint64_t v9 = 4;
        v10 = WeakRetained + 80;
        do
        {
          if (*v10)
          {
            if (!v7)
            {
              id v7 = [MEMORY[0x1E4F1CA80] setWithCapacity:v9];
            }
            objc_msgSend(v7, "addObject:");
          }
          ++v10;
          --v9;
        }
        while (v9);
        v49 = WeakRetained;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v11 = v7;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v54 objects:v68 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          id v14 = 0;
          uint64_t v15 = *(void *)v55;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v55 != v15) {
                objc_enumerationMutation(v11);
              }
              id v17 = *(void **)(*((void *)&v54 + 1) + 8 * i);
              id v18 = objc_alloc_init(PRSWallpaperObserverPathUpdate);
              [(PRSWallpaperObserverPathUpdate *)v18 setIdentity:v17];
              uint64_t v19 = 0;
              uint64_t v20 = 0;
              do
              {
                if ([v17 isEqual:*(void *)&v8[8 * v19]]) {
                  v20 |= PRSWallpaperObserverLocationsFromIndex(v19);
                }
                ++v19;
              }
              while (v19 != 4);
              [(PRSWallpaperObserverPathUpdate *)v18 setLocations:v20];
              if (!v14)
              {
                objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
                id v14 = (PRSPosterRoleCollectionObserverUpdate *)objc_claimAutoreleasedReturnValue();
              }
              [(PRSPosterRoleCollectionObserverUpdate *)v14 addObject:v18];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v54 objects:v68 count:16];
          }
          while (v13);
        }
        else
        {
          id v14 = 0;
        }

        WeakRetained = v49;
        id v3 = v50;
        id v6 = v48;
        a1 = v51;
      }
      else
      {
        id v14 = 0;
      }
      if (*((unsigned char *)a1 + 65))
      {
        __int16 v21 = objc_opt_new();
        int v22 = v6;
        __int16 v23 = (void *)*((void *)WeakRetained + 17);
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke_4;
        v52[3] = &unk_1E5D00D18;
        v24 = v21;
        v53 = v24;
        v25 = v23;
        id v6 = v22;
        [v25 enumerateKeysAndObjectsUsingBlock:v52];
      }
      else
      {
        v24 = 0;
      }
      if (*((unsigned char *)a1 + 66) && [*((id *)WeakRetained + 15) count] && *((void *)WeakRetained + 16))
      {
        v26 = v6;
        v27 = [PRSPosterRoleCollectionObserverUpdate alloc];
        uint64_t v28 = *((void *)WeakRetained + 16);
        id v29 = (void *)[*((id *)WeakRetained + 15) copy];
        v30 = v27;
        id v6 = v26;
        v31 = [(PRSPosterRoleCollectionObserverUpdate *)v30 initWithRole:v28 posterCollection:v29];
      }
      else
      {
        v31 = 0;
      }
      v32 = PRSLogObserver();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v33 = v51[4];
        id v34 = v51[5];
        id v35 = v51[6];
        *(_DWORD *)buf = 138544130;
        id v59 = v33;
        __int16 v60 = 2114;
        id v61 = v34;
        __int16 v62 = 2048;
        v63 = WeakRetained;
        __int16 v64 = 2114;
        id v65 = v35;
        _os_log_impl(&dword_1A78AC000, v32, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> received activation reply - sending known data...", buf, 0x2Au);
      }

      if (v14)
      {
        v36 = PRSLogObserver();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          id v37 = v51[4];
          id v38 = v51[5];
          id v39 = v51[6];
          *(_DWORD *)buf = 138544386;
          id v59 = v37;
          __int16 v60 = 2114;
          id v61 = v38;
          __int16 v62 = 2048;
          v63 = WeakRetained;
          __int16 v64 = 2114;
          id v65 = v39;
          __int16 v66 = 2114;
          v67 = v14;
          _os_log_impl(&dword_1A78AC000, v36, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> known identities of %{public}@", buf, 0x34u);
        }
      }
      if (v24)
      {
        v40 = PRSLogObserver();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          id v41 = v51[4];
          id v42 = v51[5];
          id v43 = v51[6];
          *(_DWORD *)buf = 138544386;
          id v59 = v41;
          __int16 v60 = 2114;
          id v61 = v42;
          __int16 v62 = 2048;
          v63 = WeakRetained;
          __int16 v64 = 2114;
          id v65 = v43;
          __int16 v66 = 2114;
          v67 = v24;
          _os_log_impl(&dword_1A78AC000, v40, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> known roles of %{public}@", buf, 0x34u);
        }
      }
      if (v31)
      {
        v44 = PRSLogObserver();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          id v45 = v51[4];
          id v46 = v51[5];
          id v47 = v51[6];
          *(_DWORD *)buf = 138544386;
          id v59 = v45;
          __int16 v60 = 2114;
          id v61 = v46;
          __int16 v62 = 2048;
          v63 = WeakRetained;
          __int16 v64 = 2114;
          id v65 = v47;
          __int16 v66 = 2114;
          v67 = v31;
          _os_log_impl(&dword_1A78AC000, v44, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> known posters for role of %{public}@", buf, 0x34u);
        }
      }
      [v6 initializeWithKnownIdentities:v14 knownRoles:v24 knownCollection:v31];
    }
  }
}

void __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [PRSRoleActivePosterObserverUpdate alloc];
  id v9 = [v5 _path];

  id v8 = [(PRSRoleActivePosterObserverUpdate *)v7 initWithRole:v6 activePath:v9];
  [v4 addObject:v8];
}

void __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke_175(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PRSLogObserver();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v8 = *(void *)(a1 + 48);
    int v9 = 138544130;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    id v14 = WeakRetained;
    __int16 v15 = 2114;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1A78AC000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> reactivating after interrupt", (uint8_t *)&v9, 0x2Au);
  }
  [v3 activate];
}

void __50__PRSWallpaperObserver_activateWithConfiguration___block_invoke_176(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = PRSLogObserver();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v7 = 138544130;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = WeakRetained;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1A78AC000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> remotely invalidated", (uint8_t *)&v7, 0x2Au);
  }

  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 36);
    [(os_unfair_lock_s *)WeakRetained _lock_invalidate];
    os_unfair_lock_unlock(WeakRetained + 36);
  }
}

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_clientInvalidated)
  {
    self->_lock_clientInvalidated = 1;
    uint64_t v4 = PRSLogObserver();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      explanation = self->_explanation;
      int v8 = 138543874;
      __int16 v9 = v6;
      __int16 v10 = 2114;
      __int16 v11 = explanation;
      __int16 v12 = 2048;
      __int16 v13 = self;
      _os_log_impl(&dword_1A78AC000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p> client invalidated", (uint8_t *)&v8, 0x20u);
    }
    [(PRSWallpaperObserver *)self _lock_invalidate];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)notifyWallpaperUpdates:(id)a3
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  uint64_t v4 = PRSLogObserver();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    explanation = self->_explanation;
    active_observedDescription = self->_active_observedDescription;
    *(_DWORD *)buf = 138544386;
    id v90 = v6;
    __int16 v91 = 2114;
    v92 = explanation;
    __int16 v93 = 2048;
    v94 = self;
    __int16 v95 = 2114;
    v96 = active_observedDescription;
    __int16 v97 = 2114;
    id v98 = v61;
    _os_log_impl(&dword_1A78AC000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> received updates=%{public}@", buf, 0x34u);
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    os_unfair_lock_unlock(&self->_lock);
    __int16 v9 = 0;
    id v10 = 0;
    id v11 = 0;
    goto LABEL_53;
  }
  os_unfair_lock_t lock = &self->_lock;
  if (!self->_lock_pathHandler)
  {
    v53 = NSString;
    long long v54 = (objc_class *)objc_opt_class();
    long long v55 = NSStringFromClass(v54);
    long long v56 = [v53 stringWithFormat:@"<%@:%@:%p observed=(%@)> it should be impossible for us to have an nil path handler at this point", v55, self->_explanation, self, self->_active_observedDescription, lock];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSWallpaperObserver notifyWallpaperUpdates:]();
    }
    [v56 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78C92B0);
  }
  uint64_t v85 = 0;
  v86 = &v85;
  uint64_t v87 = 0x2020000000;
  char v88 = 0;
  uint64_t v81 = 0;
  id v82 = &v81;
  uint64_t v83 = 0x2020000000;
  uint64_t v84 = 0;
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x2020000000;
  v80[3] = 0;
  uint64_t v76 = 0;
  id v77 = &v76;
  uint64_t v78 = 0x2020000000;
  char v79 = 0;
  if (![v61 count])
  {
    LOBYTE(v29) = 0;
    BOOL v30 = 0;
    *((unsigned char *)v86 + 24) = 1;
    goto LABEL_40;
  }
  long long v75 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v72 = 0u;
  obuint64_t j = v61;
  uint64_t v12 = [obj countByEnumeratingWithState:&v72 objects:v101 count:16];
  if (!v12)
  {
    int v29 = 0;
    goto LABEL_34;
  }
  uint64_t v59 = v12;
  uint64_t v60 = *(void *)v73;
  while (2)
  {
    for (uint64_t i = 0; i != v59; ++i)
    {
      if (*(void *)v73 != v60) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void **)(*((void *)&v72 + 1) + 8 * i);
      uint64_t v15 = [v14 path];
      uint64_t v16 = [v15 identity];
      if (!v16)
      {
        uint64_t v16 = [v14 identity];
        if (!v16)
        {
          int v29 = 0;
          *((unsigned char *)v86 + 24) = 1;
          goto LABEL_33;
        }
      }
      conn_configurationByIdentity = self->_conn_configurationByIdentity;
      if (v15)
      {
        id v18 = [[PRSPosterConfiguration alloc] _initWithPath:v15];
        [(NSMutableDictionary *)conn_configurationByIdentity setObject:v18 forKey:v16];

        *((unsigned char *)v77 + 24) = 1;
      }
      else
      {
        uint64_t v19 = [(NSMutableDictionary *)self->_conn_configurationByIdentity objectForKey:v16];
        uint64_t v20 = [v19 _path];
        uint64_t v21 = [v20 serverIdentity];

        uint64_t v16 = (void *)v21;
        if (!v21)
        {
          uint64_t v15 = PRSLogObserver();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            v48 = (objc_class *)objc_opt_class();
            NSStringFromClass(v48);
            id v49 = (id)objc_claimAutoreleasedReturnValue();
            id v50 = self->_explanation;
            v51 = self->_active_observedDescription;
            v52 = [v14 identity];
            *(_DWORD *)buf = 138544642;
            id v90 = v49;
            __int16 v91 = 2114;
            v92 = v50;
            __int16 v93 = 2048;
            v94 = self;
            __int16 v95 = 2114;
            v96 = v51;
            __int16 v97 = 2114;
            id v98 = v52;
            __int16 v99 = 2114;
            id v100 = obj;
            _os_log_fault_impl(&dword_1A78AC000, v15, OS_LOG_TYPE_FAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> received update that assumes a previous update for %{public}@ that we don't have : updates=%{public}@", buf, 0x3Eu);
          }
          int v29 = 1;
          goto LABEL_33;
        }
      }
      uint64_t v22 = [v14 locations] & 0xF;
      if (!v22)
      {
        *((unsigned char *)v86 + 24) = 1;

LABEL_32:
        int v29 = 0;
LABEL_33:

        goto LABEL_34;
      }
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v63 = (void (*)(void *))__47__PRSWallpaperObserver_notifyWallpaperUpdates___block_invoke;
      __int16 v64 = &unk_1E5D00DE0;
      uint64_t v69 = &v85;
      v68 = v80;
      id v65 = self;
      id v23 = v16;
      BOOL v70 = &v76;
      v71 = &v81;
      id v66 = v23;
      v67 = v14;
      v24 = v62;
      buf[0] = 0;
      uint8x8_t v25 = (uint8x8_t)vcnt_s8((int8x8_t)v22);
      v25.i16[0] = vaddlv_u8(v25);
      int v26 = v25.i32[0];
      if (v25.i32[0])
      {
        unint64_t v27 = 0;
        do
        {
          if (((1 << v27) & v22) != 0)
          {
            v63(v24);
            if (buf[0]) {
              break;
            }
            --v26;
          }
          if (v27 > 0x3E) {
            break;
          }
          ++v27;
        }
        while (v26 > 0);
      }

      BOOL v28 = *((unsigned char *)v86 + 24) == 0;
      if (!v28) {
        goto LABEL_32;
      }
    }
    int v29 = 0;
    uint64_t v59 = [obj countByEnumeratingWithState:&v72 objects:v101 count:16];
    if (v59) {
      continue;
    }
    break;
  }
LABEL_34:

  v31 = (void *)MEMORY[0x1E4F1CA80];
  v32 = [(NSMutableDictionary *)self->_conn_configurationByIdentity allKeys];
  id v33 = [v31 setWithArray:v32];

  for (uint64_t j = 0; j != 4; ++j)
  {
    if (self->_conn_identityLocations[j]) {
      objc_msgSend(v33, "removeObject:");
    }
  }
  id v35 = self->_conn_configurationByIdentity;
  v36 = [v33 allObjects];
  [(NSMutableDictionary *)v35 removeObjectsForKeys:v36];

  BOOL v30 = *((unsigned char *)v86 + 24) == 0;
  if (v29 || *((unsigned char *)v86 + 24))
  {
LABEL_40:
    if ((v29 & 1) == 0 && !v30)
    {
      id v37 = PRSLogObserver();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      {
        v44 = (objc_class *)objc_opt_class();
        id v45 = NSStringFromClass(v44);
        id v46 = self->_explanation;
        id v47 = self->_active_observedDescription;
        *(_DWORD *)buf = 138544386;
        id v90 = v45;
        __int16 v91 = 2114;
        v92 = v46;
        __int16 v93 = 2048;
        v94 = self;
        __int16 v95 = 2114;
        v96 = v47;
        __int16 v97 = 2114;
        id v98 = v61;
        _os_log_fault_impl(&dword_1A78AC000, v37, OS_LOG_TYPE_FAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> received incoherent updates : updates=%{public}@", buf, 0x34u);
      }
    }
    [(PRSWallpaperObserver *)self _lock_invalidate];
  }
  if (self->_lock_pathHandler && (*((unsigned char *)v77 + 24) || v82[3]))
  {
    self->_lock_initialLocationStateUpdateWasSent = 1;
    __int16 v9 = (void (**)(void, void, void))MEMORY[0x1AD0D2EC0]();
    id v38 = [PRSWallpaperObserverState alloc];
    id v39 = [(NSMutableDictionary *)self->_conn_configurationByIdentity objectForKey:self->_conn_identityLocations[0]];
    v40 = [(NSMutableDictionary *)self->_conn_configurationByIdentity objectForKey:self->_conn_identityLocations[1]];
    id v41 = [(NSMutableDictionary *)self->_conn_configurationByIdentity objectForKey:self->_conn_identityLocations[2]];
    id v42 = [(NSMutableDictionary *)self->_conn_configurationByIdentity objectForKey:self->_conn_identityLocations[3]];
    id v10 = [(PRSWallpaperObserverState *)v38 _initWithSelectedLock:v39 selectedHome:v40 activeLock:v41 activeHome:v42];

    id v43 = [PRSWallpaperObserverTransition alloc];
    id v11 = [(PRSWallpaperObserverTransition *)v43 _initWithChanged:v82[3]];
  }
  else
  {
    id v11 = 0;
    id v10 = 0;
    __int16 v9 = 0;
  }
  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(v80, 8);
  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(&v85, 8);
  os_unfair_lock_unlock(lock);
  if (v9) {
    ((void (**)(void, id, id))v9)[2](v9, v10, v11);
  }
LABEL_53:
}

uint64_t __47__PRSWallpaperObserver_notifyWallpaperUpdates___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = result;
  if ((a2 & ~*(void *)(*(void *)(*(void *)(result + 56) + 8) + 24)) != 0)
  {
    int v6 = PRSWallpaperObserverLocationsToIndex(a2);
    int v7 = *(void **)(v4 + 40);
    uint64_t v8 = *(void *)(v4 + 32) + 8 * v6;
    id v10 = *(void **)(v8 + 80);
    __int16 v9 = (id *)(v8 + 80);
    if (v10 != v7)
    {
      objc_storeStrong(v9, v7);
      *(unsigned char *)(*(void *)(*(void *)(v4 + 72) + 8) + 24) = 1;
      *(void *)(*(void *)(*(void *)(v4 + 80) + 8) + 24) |= a2;
    }
    *(void *)(*(void *)(*(void *)(v4 + 56) + 8) + 24) |= a2;
    result = [*(id *)(v4 + 48) changed];
    if ((a2 & ~result) == 0) {
      *(void *)(*(void *)(*(void *)(v4 + 80) + 8) + 24) |= a2;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 64) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)notifySnapshotUpdates:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PRSLogObserver();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    explanation = self->_explanation;
    active_observedDescription = self->_active_observedDescription;
    *(_DWORD *)buf = 138544386;
    int v29 = v7;
    __int16 v30 = 2114;
    v31 = explanation;
    __int16 v32 = 2048;
    id v33 = self;
    __int16 v34 = 2114;
    id v35 = active_observedDescription;
    __int16 v36 = 2114;
    id v37 = v4;
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> received snapshot updates=%{public}@", buf, 0x34u);
  }
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    id v11 = (void (**)(void, void, void))MEMORY[0x1AD0D2EC0](self->_lock_snapshotHandler);
    os_unfair_lock_unlock(p_lock);
    if (v11)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v22 = v4;
      id v12 = v4;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v24 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            id v18 = [PRSPosterConfiguration alloc];
            uint64_t v19 = [v17 path];
            id v20 = [(PRSPosterConfiguration *)v18 _initWithPath:v19];

            uint64_t v21 = [v17 snapshotType];
            ((void (**)(void, id, void *))v11)[2](v11, v20, v21);
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v14);
      }

      id v4 = v22;
    }
  }
}

- (void)notifyRoleActivePosterUpdates:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PRSLogObserver();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    explanation = self->_explanation;
    active_observedDescription = self->_active_observedDescription;
    *(_DWORD *)buf = 138544386;
    v44 = v7;
    __int16 v45 = 2114;
    id v46 = explanation;
    __int16 v47 = 2048;
    v48 = self;
    __int16 v49 = 2114;
    id v50 = active_observedDescription;
    __int16 v51 = 2114;
    id v52 = v4;
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> received role updates=%{public}@", buf, 0x34u);
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    os_unfair_lock_unlock(&self->_lock);
    id v10 = 0;
    id v11 = 0;
  }
  else
  {
    int v29 = self->_lock_roleActivePosterObserver;
    id v30 = v4;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = v4;
    uint64_t v12 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v11 = 0;
      uint64_t v32 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v38 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v16 = [v15 role];
          uint64_t v17 = [v15 activePath];
          id v18 = [(NSMutableDictionary *)self->_conn_roleToActivePosterConfiguration objectForKey:v16];
          uint64_t v19 = [v18 _path];

          if (!v19
            || ([v19 serverIdentity],
                id v20 = objc_claimAutoreleasedReturnValue(),
                [v17 serverIdentity],
                uint64_t v21 = objc_claimAutoreleasedReturnValue(),
                char v22 = [v20 isEqual:v21],
                v21,
                v20,
                (v22 & 1) == 0))
          {
            id v23 = [[PRSPosterConfiguration alloc] _initWithPath:v17];
            [(NSMutableDictionary *)self->_conn_roleToActivePosterConfiguration setObject:v23 forKeyedSubscript:v16];
            long long v24 = [[PRSPosterRoleActivePosterObserverState alloc] initWithRole:v16 activePoster:v23];
            if (!v11) {
              id v11 = (id)objc_opt_new();
            }
            [v11 addObject:v24];
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v13);
    }
    else
    {
      id v11 = 0;
    }

    os_unfair_lock_unlock(&self->_lock);
    id v10 = v29;
    if (v29)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v11 = v11;
      uint64_t v25 = [v11 countByEnumeratingWithState:&v33 objects:v41 count:16];
      id v4 = v30;
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v34 != v27) {
              objc_enumerationMutation(v11);
            }
            [(PRSPosterRoleActivePosterObserver *)v29 issueUpdatedState:*(void *)(*((void *)&v33 + 1) + 8 * j)];
          }
          uint64_t v26 = [v11 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v26);
      }
    }
    else
    {
      id v4 = v30;
    }
  }
}

- (void)notifyRolePosterCollectionUpdates:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PRSLogObserver();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    explanation = self->_explanation;
    active_observedDescription = self->_active_observedDescription;
    *(_DWORD *)buf = 138544386;
    long long v57 = v7;
    __int16 v58 = 2114;
    uint64_t v59 = explanation;
    __int16 v60 = 2048;
    id v61 = self;
    __int16 v62 = 2114;
    v63 = active_observedDescription;
    __int16 v64 = 2114;
    id v65 = v4;
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%{public}@:%p observed=(%{public}@)> received role updates=%{public}@", buf, 0x34u);
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    os_unfair_lock_unlock(&self->_lock);
    id v10 = 0;
    id v11 = 0;
    goto LABEL_5;
  }
  os_unfair_lock_t lock = &self->_lock;
  id v10 = self->_lock_rolePosterCollectionObserver;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v39 = v4;
  id v12 = v4;
  uint64_t v45 = [v12 countByEnumeratingWithState:&v50 objects:v55 count:16];
  id v11 = 0;
  if (v45)
  {
    uint64_t v13 = *(void *)v51;
    id v41 = self;
    id v42 = v10;
    id v40 = v12;
    uint64_t v44 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v51 != v13) {
          objc_enumerationMutation(v12);
        }
        uint64_t v15 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "role", lock);
        uint64_t v17 = [(PRSPosterRoleCollectionObserver *)v10 role];
        int v18 = [v16 isEqual:v17];

        if (v18)
        {
          uint64_t v19 = [v15 posterCollection];
          id v20 = self->_conn_knownPostersCollection;
          uint64_t v21 = [v19 count];
          if (v21 != [(NSArray *)v20 count]) {
            goto LABEL_21;
          }
          if ([v19 count])
          {
            id v43 = v11;
            unint64_t v22 = 0;
            do
            {
              id v23 = [(NSArray *)v20 objectAtIndexedSubscript:v22];
              long long v24 = [v19 objectAtIndexedSubscript:v22];
              uint64_t v25 = [v23 serverIdentity];
              uint64_t v26 = [v24 serverIdentity];
              int v27 = BSEqualObjects();

              if ((v27 & 1) == 0) {
                break;
              }
              ++v22;
            }
            while (v22 < [v19 count]);
            int v28 = v27 ^ 1;
            id v10 = v42;
            id v11 = v43;
            id v12 = v40;
            self = v41;
            if (!v19)
            {
LABEL_21:
              int v29 = (NSArray *)[v19 copy];
              conn_knownPostersCollection = self->_conn_knownPostersCollection;
              self->_conn_knownPostersCollection = v29;

              v31 = [[PRSPosterRoleCollectionObserverUpdate alloc] initWithRole:v16 posterCollection:v19];
              if (!v11) {
                id v11 = (id)objc_opt_new();
              }
              [v11 addObject:v31];

              goto LABEL_24;
            }
          }
          else
          {
            int v28 = 0;
            if (!v19) {
              goto LABEL_21;
            }
          }
          if (v28) {
            goto LABEL_21;
          }
LABEL_24:

          uint64_t v13 = v44;
        }
      }
      uint64_t v45 = [v12 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v45);
  }

  os_unfair_lock_unlock(lock);
  if (v10)
  {
    id v4 = v39;
    if ([v11 count])
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v11 = v11;
      uint64_t v32 = [v11 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v47;
        do
        {
          long long v35 = v11;
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v47 != v34) {
              objc_enumerationMutation(v35);
            }
            long long v37 = objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * j), "posterCollection", lock);
            [(PRSPosterRoleCollectionObserver *)v10 issueUpdatedState:v37];
          }
          id v11 = v35;
          uint64_t v33 = [v35 countByEnumeratingWithState:&v46 objects:v54 count:16];
        }
        while (v33);
      }
    }
  }
  else
  {
    id v4 = v39;
  }
LABEL_5:
}

- (void)notifyInitialUpdatesComplete
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_clientInvalidated)
  {
    [(RBSAssertion *)self->_lock_initialUpdateAssertion invalidate];
    lock_initialUpdateAssertion = self->_lock_initialUpdateAssertion;
    self->_lock_initialUpdateAssertion = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conn_roleToActivePosterConfiguration, 0);
  objc_storeStrong((id *)&self->_conn_knownPostersCollectionRole, 0);
  objc_storeStrong((id *)&self->_conn_knownPostersCollection, 0);
  objc_storeStrong((id *)&self->_conn_configurationByIdentity, 0);
  for (uint64_t i = 0; i != -4; --i)
    objc_storeStrong((id *)&self->_conn_identityLocations[i + 3], 0);
  objc_storeStrong((id *)&self->_lock_initialUpdateAssertion, 0);
  objc_storeStrong((id *)&self->_active_observedDescription, 0);
  objc_storeStrong((id *)&self->_lock_rolePosterCollectionObserver, 0);
  objc_storeStrong((id *)&self->_lock_roleActivePosterObserver, 0);
  objc_storeStrong(&self->_lock_snapshotHandler, 0);
  objc_storeStrong(&self->_lock_pathHandler, 0);
  objc_storeStrong((id *)&self->_lock_connection, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
}

- (void)initWithExplanation:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)activateWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_5_1();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_6_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)activateWithConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_5_1();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_6_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)activateWithConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_5_1();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_6_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)activateWithConfiguration:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 64);
  int v8 = 138544130;
  uint8_t v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v6;
  __int16 v12 = 2048;
  uint64_t v13 = a1;
  __int16 v14 = 2114;
  uint64_t v15 = v7;
  _os_log_error_impl(&dword_1A78AC000, a2, OS_LOG_TYPE_ERROR, "<%{public}@:%{public}@:%p observed=(%{public}@)> failed to lookup endpoint", (uint8_t *)&v8, 0x2Au);
}

- (void)activateWithConfiguration:.cold.5()
{
  OUTLINED_FUNCTION_5_1();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_6_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)activateWithConfiguration:.cold.6()
{
  OUTLINED_FUNCTION_5_1();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_6_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)activateWithConfiguration:.cold.7()
{
  OUTLINED_FUNCTION_5_1();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_6_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)activateWithConfiguration:.cold.8()
{
  OUTLINED_FUNCTION_5_1();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_6_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)activateWithConfiguration:.cold.9()
{
  OUTLINED_FUNCTION_5_1();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_6_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)notifyWallpaperUpdates:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end
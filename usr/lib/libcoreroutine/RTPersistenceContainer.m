@interface RTPersistenceContainer
- (BOOL)_validateConfigurations:(id)a3;
- (BOOL)serveContexts;
- (BOOL)setupFailed;
- (BOOL)storesNeedSetup;
- (BOOL)updateContainerConfigurations:(id)a3;
- (NSPersistentStoreCoordinator)coordinator;
- (NSString)name;
- (OS_dispatch_queue)contextRequestsQueue;
- (RTPersistenceContainer)init;
- (RTPersistenceContainer)initWithName:(id)a3 model:(id)a4 configurations:(id)a5;
- (RTPersistenceContainerDelegate)delegate;
- (id)_persistenceContext;
- (id)persistenceContext;
- (id)persistenceContextWithOptions:(unint64_t)a3;
- (id)tearDownPersistenceStack;
- (id)waitForPersistenceContext;
- (void)dealloc;
- (void)persistenceContextWithHandler:(id)a3;
- (void)resumePersistenceStores;
- (void)setContextRequestsQueue:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setServeContexts:(BOOL)a3;
- (void)setSetupFailed:(BOOL)a3;
- (void)setupPersistenceStores;
- (void)suspendPersistenceStores;
@end

@implementation RTPersistenceContainer

- (RTPersistenceContainer)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithName_model_configurations_);
}

- (RTPersistenceContainer)initWithName:(id)a3 model:(id)a4 configurations:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[RTPersistenceContainer initWithName:model:configurations:]";
      __int16 v39 = 1024;
      int v40 = 46;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: name (in %s:%d)", buf, 0x12u);
    }

    if (v9) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  if (!v9)
  {
LABEL_15:
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[RTPersistenceContainer initWithName:model:configurations:]";
      __int16 v39 = 1024;
      int v40 = 47;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: model (in %s:%d)", buf, 0x12u);
    }

    goto LABEL_18;
  }
  if (![(RTPersistenceContainer *)self _validateConfigurations:v10]) {
    goto LABEL_18;
  }
  v11 = [v9 versionIdentifiers];
  uint64_t v12 = [v11 count];

  if (v12 != 1)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[RTPersistenceContainer initWithName:model:configurations:]";
      __int16 v39 = 1024;
      int v40 = 56;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Containers require model with exactly one version identifier (in %s:%d)", buf, 0x12u);
    }
  }
  v14 = [v9 versionIdentifiers];
  uint64_t v15 = [v14 count];

  if (v15 != 1)
  {
LABEL_18:
    v31 = 0;
    goto LABEL_19;
  }
  v36.receiver = self;
  v36.super_class = (Class)RTPersistenceContainer;
  v16 = [(RTPersistenceContainer *)&v36 init];
  if (v16)
  {
    uint64_t v17 = [v8 copy];
    name = v16->_name;
    v16->_name = (NSString *)v17;

    uint64_t v19 = [v10 copy];
    configurations = v16->_configurations;
    v16->_configurations = (NSArray *)v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1C188]) initWithManagedObjectModel:v9];
    coordinator = v16->_coordinator;
    v16->_coordinator = (NSPersistentStoreCoordinator *)v21;

    [(NSPersistentStoreCoordinator *)v16->_coordinator setName:v8];
    v23 = [NSString stringWithFormat:@"%@-%@-%p", objc_opt_class(), v16->_name, v16];
    v24 = dispatch_queue_attr_make_with_overcommit();
    v25 = dispatch_queue_attr_make_initially_inactive(v24);

    id v26 = v23;
    v27 = v25;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = (const char *)[v26 UTF8String];
    }
    else
    {
      id v33 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v26];
      v28 = (const char *)[v33 UTF8String];
    }
    dispatch_queue_t v34 = dispatch_queue_create(v28, v27);

    contextRequestsQueue = v16->_contextRequestsQueue;
    v16->_contextRequestsQueue = (OS_dispatch_queue *)v34;

    v16->_serveContexts = 0;
  }
  self = v16;
  v31 = self;
LABEL_19:

  return v31;
}

- (void)dealloc
{
  v3 = [(RTPersistenceContainer *)self contextRequestsQueue];
  v4 = v3;
  if (v3)
  {
    dispatch_activate(v3);
    [(RTPersistenceContainer *)self setContextRequestsQueue:0];
  }

  v5.receiver = self;
  v5.super_class = (Class)RTPersistenceContainer;
  [(RTPersistenceContainer *)&v5 dealloc];
}

- (BOOL)_validateConfigurations:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count])
  {
    objc_super v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v26 = "-[RTPersistenceContainer _validateConfigurations:]";
      __int16 v27 = 1024;
      LODWORD(v28) = 91;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configurations.count (in %s:%d)", buf, 0x12u);
    }
  }
  if ([v4 count])
  {
    v6 = [MEMORY[0x1E4F1CA80] setWithCapacity:[v4 count]];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v21 + 1) + 8 * i) store:v21];
          v13 = [v12 URL];

          if (v13) {
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v9);
    }

    uint64_t v14 = [v6 count];
    if (v14 != [v7 count])
    {
      uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v26 = "-[RTPersistenceContainer _validateConfigurations:]";
        __int16 v27 = 1024;
        LODWORD(v28) = 105;
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Containers require each store to have a unique URL (in %s:%d)", buf, 0x12u);
      }
    }
    uint64_t v16 = [v6 count:v21];
    BOOL v17 = v16 == [v7 count];
    if (v17)
    {
      v18 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v20 = [(RTPersistenceContainer *)self name];
        *(_DWORD *)buf = 138412546;
        id v26 = v20;
        __int16 v27 = 2112;
        id v28 = v7;
        _os_log_debug_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEBUG, "container named, %@, updating configurations, %@", buf, 0x16u);
      }
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)suspendPersistenceStores
{
  v3 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "suspending persistence stores.", v4, 2u);
  }

  [(RTPersistenceContainer *)self setServeContexts:0];
}

- (void)resumePersistenceStores
{
  v3 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "resuming persistence stores.", v4, 2u);
  }

  [(RTPersistenceContainer *)self setServeContexts:1];
}

- (BOOL)storesNeedSetup
{
  uint64_t v2 = [(RTPersistenceContainer *)self contextRequestsQueue];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)tearDownPersistenceStack
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v18 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  BOOL v3 = self->_configurations;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v20 + 1) + 8 * v7) store];
        uint64_t v9 = [(RTPersistenceContainer *)self coordinator];
        id v19 = 0;
        int v10 = [v8 removeFromCoordinator:v9 error:&v19];
        id v11 = v19;

        if (v10) {
          BOOL v12 = v11 == 0;
        }
        else {
          BOOL v12 = 0;
        }
        if (!v12)
        {
          v13 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v25 = v11;
            _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "error closing store, %@", buf, 0xCu);
          }

          if (v11) {
            [v18 addObject:v11];
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v5);
  }

  configurations = self->_configurations;
  self->_configurations = 0;

  uint64_t v15 = _RTSafeArray();
  uint64_t v16 = _RTMultiErrorCreate();

  return v16;
}

- (void)setupPersistenceStores
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if ([(RTPersistenceContainer *)self storesNeedSetup])
  {
    BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v31 = [(RTPersistenceContainer *)self name];
      *(_DWORD *)buf = 138412290;
      uint64_t v45 = (uint64_t)v31;
      _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "container named, %@, opening stores", buf, 0xCu);
    }
    uint64_t v4 = (void *)[(NSArray *)self->_configurations mutableCopy];
    if ([v4 count])
    {
      char v35 = 0;
      *(void *)&long long v5 = 134218498;
      long long v34 = v5;
      v38 = v4;
      do
      {
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id obj = [v4 copy:v34];
        uint64_t v6 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v41;
          while (2)
          {
            uint64_t v9 = 0;
            uint64_t v36 = v7;
            do
            {
              if (*(void *)v41 != v8) {
                objc_enumerationMutation(obj);
              }
              int v10 = *(void **)(*((void *)&v40 + 1) + 8 * v9);
              id v11 = (void *)MEMORY[0x1E016D870]();
              BOOL v12 = [v10 store];
              v13 = [(RTPersistenceContainer *)self coordinator];
              uint64_t v14 = [v12 URL];
              uint64_t v15 = [v13 persistentStoreForURL:v14];

              if (v15)
              {
                [v38 removeObject:v10];
              }
              else
              {
                uint64_t v16 = [(RTPersistenceContainer *)self coordinator];
                id v39 = 0;
                char v17 = [v12 openWithCoordinator:v16 configuration:v10 error:&v39];
                id v18 = v39;

                if ([v18 code] == 1)
                {
                  id v19 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                  {
                    long long v21 = [(RTPersistenceContainer *)self name];
                    *(_DWORD *)buf = 138412290;
                    uint64_t v45 = (uint64_t)v21;
                    _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "container named, %@, currently unavailable", buf, 0xCu);
                  }
                  [v38 removeObject:v10];
                  char v35 = 1;
                }
                else
                {
                  if (v18)
                  {
                    [v38 removeAllObjects];
                    [(RTPersistenceContainer *)self setSetupFailed:1];

                    goto LABEL_32;
                  }
                  if (v17)
                  {
                    [v38 removeObject:v10];
                  }
                  else
                  {
                    if ([v12 state] == 2)
                    {
                      long long v20 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
                      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                      {
                        long long v22 = [(RTPersistenceContainer *)self name];
                        *(_DWORD *)buf = 138412290;
                        uint64_t v45 = (uint64_t)v22;
                        _os_log_debug_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_DEBUG, "container named, %@, currently yielding", buf, 0xCu);
                      }
                    }
                    else
                    {
                      long long v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                      {
                        uint64_t v23 = [v12 state];
                        *(_DWORD *)buf = v34;
                        uint64_t v45 = v23;
                        __int16 v46 = 2080;
                        v47 = "-[RTPersistenceContainer setupPersistenceStores]";
                        __int16 v48 = 1024;
                        int v49 = 203;
                        _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "unknown store state, %lu (in %s:%d)", buf, 0x1Cu);
                      }
                    }
                  }
                }
                uint64_t v7 = v36;
              }
              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v50 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }
LABEL_32:

        uint64_t v4 = v38;
      }
      while ([v38 count]);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((v35 & 1) != 0 && ![(RTPersistenceContainer *)self setupFailed])
      {
        if (objc_opt_respondsToSelector())
        {
          id v25 = [(RTPersistenceContainer *)self contextRequestsQueue];
          [WeakRetained container:self failedToActivateRequestsQueue:v25];
        }
LABEL_48:

        return;
      }
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    }
    BOOL v26 = [(RTPersistenceContainer *)self setupFailed];
    uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
    if (v26)
    {
      if (v28)
      {
        v32 = [(RTPersistenceContainer *)self name];
        *(_DWORD *)buf = 138412290;
        uint64_t v45 = (uint64_t)v32;
        _os_log_debug_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_DEBUG, "container named, %@, failed to open all stores", buf, 0xCu);
      }
    }
    else
    {
      if (v28)
      {
        id v33 = [(RTPersistenceContainer *)self name];
        *(_DWORD *)buf = 138412290;
        uint64_t v45 = (uint64_t)v33;
        _os_log_debug_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_DEBUG, "container named, %@, successfully opened all stores", buf, 0xCu);
      }
      [(RTPersistenceContainer *)self setServeContexts:1];
    }
    if (objc_opt_respondsToSelector())
    {
      v29 = [(RTPersistenceContainer *)self contextRequestsQueue];
      [WeakRetained container:self willActivateRequestsQueue:v29];
    }
    uint64_t v30 = [(RTPersistenceContainer *)self contextRequestsQueue];
    dispatch_activate(v30);

    [(RTPersistenceContainer *)self setContextRequestsQueue:0];
    goto LABEL_48;
  }
}

- (BOOL)updateContainerConfigurations:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(RTPersistenceContainer *)self _validateConfigurations:v4]
    && [(RTPersistenceContainer *)self storesNeedSetup])
  {
    long long v5 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v10 = [(RTPersistenceContainer *)self name];
      int v11 = 138412546;
      BOOL v12 = v10;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "container named, %@, updating configurations, %@", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v6 = (NSArray *)[v4 copy];
    configurations = self->_configurations;
    self->_configurations = v6;

    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)persistenceContextWithHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(RTPersistenceContainer *)self contextRequestsQueue];
    if (v5)
    {
      uint64_t v6 = v5;
      objc_initWeak((id *)location, self);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __56__RTPersistenceContainer_persistenceContextWithHandler___block_invoke;
      v8[3] = &unk_1E6B954D8;
      id v9 = v4;
      objc_copyWeak(&v10, (id *)location);
      dispatch_async(v6, v8);
      objc_destroyWeak(&v10);

      objc_destroyWeak((id *)location);
    }
    else
    {
      uint64_t v7 = [(RTPersistenceContainer *)self _persistenceContext];
      (*((void (**)(id, void *))v4 + 2))(v4, v7);

      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "-[RTPersistenceContainer persistenceContextWithHandler:]";
      __int16 v12 = 1024;
      int v13 = 259;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", location, 0x12u);
    }
  }
}

void __56__RTPersistenceContainer_persistenceContextWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained _persistenceContext];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

- (id)persistenceContext
{
  BOOL v3 = [(RTPersistenceContainer *)self contextRequestsQueue];

  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(RTPersistenceContainer *)self _persistenceContext];
  }

  return v4;
}

- (id)waitForPersistenceContext
{
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x3032000000;
  int v13 = __Block_byref_object_copy__54;
  uint64_t v14 = __Block_byref_object_dispose__54;
  id v15 = 0;
  BOOL v3 = [(RTPersistenceContainer *)self contextRequestsQueue];
  id v4 = v3;
  if (v3)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__RTPersistenceContainer_waitForPersistenceContext__block_invoke;
    v9[3] = &unk_1E6B93860;
    v9[4] = self;
    v9[5] = &v10;
    dispatch_sync(v3, v9);
  }
  else
  {
    uint64_t v5 = [(RTPersistenceContainer *)self _persistenceContext];
    uint64_t v6 = (void *)v11[5];
    v11[5] = v5;
  }
  id v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __51__RTPersistenceContainer_waitForPersistenceContext__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _persistenceContext];

  return MEMORY[0x1F41817F8]();
}

- (id)_persistenceContext
{
  return [(RTPersistenceContainer *)self persistenceContextWithOptions:0];
}

- (id)persistenceContextWithOptions:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(RTPersistenceContainer *)self setupFailed])
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v21 = "-[RTPersistenceContainer persistenceContextWithOptions:]";
      __int16 v22 = 1024;
      int v23 = 312;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Unable to vend managed object context due to setup failure. (in %s:%d)", buf, 0x12u);
    }
LABEL_4:
    uint64_t v6 = 0;
    goto LABEL_12;
  }
  if ((a3 & 1) == 0 && ![(RTPersistenceContainer *)self serveContexts])
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "Not serving contexts due to suspension.", buf, 2u);
    }
    goto LABEL_4;
  }
  id v7 = [[RTPersistenceContext alloc] initWithConcurrencyType:1 options:a3];
  BOOL v8 = [MEMORY[0x1E4F1C130] mergeByPropertyStoreTrumpMergePolicy];
  [(RTPersistenceContext *)v7 setMergePolicy:v8];

  id v9 = [(RTPersistenceContainer *)self coordinator];
  [(RTPersistenceContext *)v7 setPersistentStoreCoordinator:v9];

  uint64_t v10 = [MEMORY[0x1E4F28F80] processInfo];
  int v11 = [v10 processName];
  [(RTPersistenceContext *)v7 setName:v11];

  uint64_t v12 = [MEMORY[0x1E4F28F80] processInfo];
  int v13 = [v12 processName];
  [(RTPersistenceContext *)v7 setTransactionAuthor:v13];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__RTPersistenceContainer_persistenceContextWithOptions___block_invoke;
  v18[3] = &unk_1E6B90BF0;
  v18[4] = self;
  uint64_t v14 = v7;
  id v19 = v14;
  [(RTPersistenceContext *)v14 performBlockAndWait:v18];
  if (!v14)
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v21 = "-[RTPersistenceContainer persistenceContextWithOptions:]";
      __int16 v22 = 1024;
      int v23 = 337;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Failed to return a valid managed object context. (in %s:%d)", buf, 0x12u);
    }
  }
  uint64_t v16 = v19;
  uint64_t v5 = v14;

  uint64_t v6 = v5;
LABEL_12:

  return v6;
}

void __56__RTPersistenceContainer_persistenceContextWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
        BOOL v8 = [*(id *)(a1 + 40) userInfo:v11];
        id v9 = [v7 store];
        uint64_t v10 = [v9 userInfo];
        [v8 addEntriesFromDictionary:v10];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (RTPersistenceContainerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RTPersistenceContainerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)contextRequestsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setContextRequestsQueue:(id)a3
{
}

- (BOOL)serveContexts
{
  return self->_serveContexts;
}

- (void)setServeContexts:(BOOL)a3
{
  self->_serveContexts = a3;
}

- (BOOL)setupFailed
{
  return self->_setupFailed;
}

- (void)setSetupFailed:(BOOL)a3
{
  self->_setupFailed = a3;
}

- (NSPersistentStoreCoordinator)coordinator
{
  return (NSPersistentStoreCoordinator *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_contextRequestsQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_configurations, 0);
}

@end
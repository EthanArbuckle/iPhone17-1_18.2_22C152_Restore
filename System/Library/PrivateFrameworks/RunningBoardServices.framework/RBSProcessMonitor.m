@interface RBSProcessMonitor
+ (id)_monitorWithService:(id)a3;
+ (id)_monitorWithService:(id)a3 configuration:(id)a4;
+ (id)monitor;
+ (id)monitorWithConfiguration:(id)a3;
+ (id)monitorWithPredicate:(id)a3 updateHandler:(id)a4;
- (NSSet)states;
- (OS_dispatch_queue)calloutQueue;
- (RBSProcessMonitor)init;
- (RBSProcessMonitorConfiguration)configuration;
- (id)_initWithService:(id *)a1;
- (id)description;
- (id)stateForIdentity:(id)a3;
- (unint64_t)events;
- (unsigned)serviceClass;
- (void)_handleExitEvent:(id)a3;
- (void)_handlePreventLaunchUpdate:(id)a3;
- (void)_handleProcessStateChange:(id)a3;
- (void)_reconnect;
- (void)dealloc;
- (void)invalidate;
- (void)setEvents:(unint64_t)a3;
- (void)setPredicates:(id)a3;
- (void)setPreventLaunchUpdateHandle:(id)a3;
- (void)setServiceClass:(unsigned int)a3;
- (void)setStateDescriptor:(id)a3;
- (void)setUpdateHandler:(id)a3;
- (void)updateConfiguration:(id)a3;
@end

@implementation RBSProcessMonitor

- (void)_handleProcessStateChange:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(RBSProcessMonitorConfiguration *)self->_configuration stateDescriptor];

  if (!v5 || !self->_valid)
  {
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_28;
  }
  v6 = [v4 process];
  v7 = self->_configuration;
  v8 = [v6 identity];
  if ([(RBSProcessMonitorConfiguration *)v7 matchesProcess:v6])
  {
    v9 = (void *)[v4 copy];
    v10 = [(RBSProcessMonitorConfiguration *)v7 stateDescriptor];
    [v10 filterState:v9];

    v11 = [(NSMutableDictionary *)self->_stateByIdentity objectForKey:v8];
    v20 = v11;
    if (v11)
    {
      if ([v11 isEqual:v9])
      {
LABEL_13:
        v15 = rbs_monitor_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = [v4 process];
          *(_DWORD *)buf = 138543362;
          v22 = v16;
          _os_log_impl(&dword_191FE8000, v15, OS_LOG_TYPE_INFO, "Update skipped for %{public}@", buf, 0xCu);
        }
        v12 = 0;
        v13 = 0;
        goto LABEL_16;
      }
    }
    else if (([v4 isRunning] & 1) == 0 {
           && ([v4 taskState] || (objc_msgSend(v4, "isEmptyState") & 1) != 0))
    }
    {
      goto LABEL_13;
    }
    v12 = [(RBSProcessMonitorConfiguration *)v7 updateHandler];
    v14 = (void *)[v9 copy];
    v13 = +[RBSProcessStateUpdate updateWithState:v14 previousState:v20 exitEvent:0];

LABEL_16:
    if (([v4 isRunning] & 1) == 0
      && ([v4 taskState] || (objc_msgSend(v4, "isEmptyState") & 1) != 0))
    {
      [(NSMutableDictionary *)self->_stateByIdentity removeObjectForKey:v8];
    }
    else
    {
      [(NSMutableDictionary *)self->_stateByIdentity setObject:v9 forKey:v8];
    }

    goto LABEL_22;
  }
  [(NSMutableDictionary *)self->_stateByIdentity removeObjectForKey:v8];
  v12 = 0;
  v13 = 0;
LABEL_22:
  os_unfair_lock_unlock(&self->_lock);
  if (v13 && v12)
  {
    ((void (**)(void, RBSProcessMonitor *, void *, void *))v12)[2](v12, self, v6, v13);
    v17 = rbs_monitor_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = [v4 process];
      int v19 = [v4 taskState];
      *(_DWORD *)buf = 138543618;
      v22 = v18;
      __int16 v23 = 1024;
      int v24 = v19;
      _os_log_impl(&dword_191FE8000, v17, OS_LOG_TYPE_INFO, "Update delivered for %{public}@ with taskState %d", buf, 0x12u);
    }
  }

LABEL_28:
}

- (void)updateConfiguration:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, RBSProcessMonitor *))a3;
  if (!v5)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"RBSProcessMonitor.m", 119, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_valid)
  {
    self->_configuring = 1;
    v5[2](v5, self);
    self->_configuring = 0;
    v7 = (void *)[(RBSProcessMonitorConfiguration *)self->_configuration copy];
    os_unfair_lock_unlock(&self->_lock);
    if (v7)
    {
      service = self->_service;
      id v36 = 0;
      int v9 = [(RBSServiceLocalProtocol *)service subscribeProcessStateMonitor:self configuration:v7 error:&v36];
      id v10 = v36;
      v11 = v10;
      if (v9)
      {
        id v30 = v10;
        v31 = v5;
        os_unfair_lock_lock(&self->_lock);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        v12 = [(NSMutableDictionary *)self->_stateByIdentity allValues];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v33 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              v18 = [(RBSProcessMonitorConfiguration *)self->_configuration stateDescriptor];
              [v18 filterState:v17];

              if (([v17 isEmptyState] & 1) == 0)
              {
                int v19 = [v17 process];
                char v20 = [v7 matchesProcess:v19];

                if (v20) {
                  continue;
                }
              }
              stateByIdentity = self->_stateByIdentity;
              v22 = [v17 process];
              __int16 v23 = [v22 identity];
              [(NSMutableDictionary *)stateByIdentity setObject:0 forKeyedSubscript:v23];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
          }
          while (v14);
        }

        os_unfair_lock_unlock(&self->_lock);
        int v24 = rbs_monitor_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          -[RBSProcessMonitor updateConfiguration:]();
        }

        v11 = v30;
        v5 = v31;
      }
      else
      {
        int v26 = objc_msgSend(v10, "rbs_isPermanentFailure");
        v27 = rbs_monitor_log();
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
        if (v26)
        {
          if (v28) {
            -[RBSProcessMonitor updateConfiguration:]();
          }

          [(RBSProcessMonitor *)self invalidate];
        }
        else
        {
          if (v28) {
            -[RBSProcessMonitor updateConfiguration:]();
          }
        }
      }
    }
  }
  else
  {
    uint64_t v25 = objc_alloc_init(RBSProcessMonitorConfiguration);
    v5[2](v5, (RBSProcessMonitor *)v25);

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)setPredicates:(id)a3
{
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_configuring)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"RBSProcessMonitor.m" lineNumber:208 description:@"must only call during configuration"];
  }
  [(RBSProcessMonitorConfiguration *)self->_configuration setPredicates:v6];
}

- (RBSProcessMonitorConfiguration)configuration
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_valid) {
    id v4 = (void *)[(RBSProcessMonitorConfiguration *)self->_configuration copy];
  }
  else {
    id v4 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return (RBSProcessMonitorConfiguration *)v4;
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (unsigned)serviceClass
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_valid) {
    unsigned int v4 = [(RBSProcessMonitorConfiguration *)self->_configuration serviceClass];
  }
  else {
    unsigned int v4 = 17;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)dealloc
{
}

+ (id)monitorWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = +[RBSConnection sharedInstance];
  id v6 = [a1 _monitorWithService:v5 configuration:v4];

  return v6;
}

+ (id)_monitorWithService:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[RBSProcessMonitor _initWithService:]((id *)objc_alloc((Class)a1), v7);

  [v8 updateConfiguration:v6];
  return v8;
}

- (RBSProcessMonitor)init
{
  v3 = +[RBSConnection sharedInstance];
  id v4 = (RBSProcessMonitor *)-[RBSProcessMonitor _initWithService:]((id *)&self->super.isa, v3);

  return v4;
}

- (id)_initWithService:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)RBSProcessMonitor;
    v5 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v5;
    if (v5)
    {
      *((unsigned char *)v5 + 24) = 1;
      objc_storeStrong(v5 + 2, a2);
      *((_DWORD *)a1 + 2) = 0;
      id v6 = objc_alloc_init(RBSProcessMonitorConfiguration);
      id v7 = a1[4];
      a1[4] = v6;

      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v9 = a1[5];
      a1[5] = v8;

      dispatch_queue_t v10 = +[RBSWorkloop createCalloutQueue:@"RBSProcessMonitorCalloutQueue"];
      id v11 = a1[6];
      a1[6] = v10;
    }
  }

  return a1;
}

- (void)setStateDescriptor:(id)a3
{
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_configuring)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"RBSProcessMonitor.m" lineNumber:213 description:@"must only call during configuration"];
  }
  [(RBSProcessMonitorConfiguration *)self->_configuration setStateDescriptor:v6];
}

- (void)setUpdateHandler:(id)a3
{
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_configuring)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"RBSProcessMonitor.m" lineNumber:228 description:@"must only call during configuration"];
  }
  [(RBSProcessMonitorConfiguration *)self->_configuration setUpdateHandler:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_stateByIdentity, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)invalidate
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_191FE8000, v0, OS_LOG_TYPE_DEBUG, "Invalidated monitor %{public}@", v1, 0xCu);
}

- (void)setServiceClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_configuring)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"RBSProcessMonitor.m" lineNumber:218 description:@"must only call during configuration"];
  }
  configuration = self->_configuration;
  [(RBSProcessMonitorConfiguration *)configuration setServiceClass:v3];
}

- (void)setEvents:(unint64_t)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_configuring)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"RBSProcessMonitor.m" lineNumber:223 description:@"must only call during configuration"];
  }
  configuration = self->_configuration;
  [(RBSProcessMonitorConfiguration *)configuration setEvents:a3];
}

- (void)_handlePreventLaunchUpdate:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_valid)
  {
    v5 = self->_configuration;
    if (([(RBSProcessMonitorConfiguration *)v5 events] & 2) != 0)
    {
      -[RBSProcessMonitorConfiguration preventLaunchUpdateHandler]((os_unfair_lock_s *)v5);
      id v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock(&self->_lock);
      if (v6)
      {
        ((void (**)(void, RBSProcessMonitor *, id))v6)[2](v6, self, v4);
      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    rbs_monitor_log();
    v5 = (RBSProcessMonitorConfiguration *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR)) {
      -[RBSProcessMonitor _handlePreventLaunchUpdate:]();
    }
  }
}

+ (id)monitor
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)_monitorWithService:(id)a3
{
  id v4 = a3;
  v5 = -[RBSProcessMonitor _initWithService:]((id *)objc_alloc((Class)a1), v4);

  return v5;
}

+ (id)monitorWithPredicate:(id)a3 updateHandler:(id)a4
{
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
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"RBSProcessMonitor.m", 55, @"Invalid parameter not satisfying: %@", @"predicate" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, a1, @"RBSProcessMonitor.m", 56, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

LABEL_3:
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__RBSProcessMonitor_monitorWithPredicate_updateHandler___block_invoke;
  v16[3] = &unk_1E5740E00;
  id v17 = v7;
  id v18 = v9;
  id v10 = v9;
  id v11 = v7;
  v12 = [a1 monitorWithConfiguration:v16];

  return v12;
}

void __56__RBSProcessMonitor_monitorWithPredicate_updateHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  v5 = [v3 arrayWithObjects:&v7 count:1];
  objc_msgSend(v4, "setPredicates:", v5, v7, v8);

  [v4 setUpdateHandler:*(void *)(a1 + 40)];
  id v6 = +[RBSProcessStateDescriptor descriptor];
  [v4 setStateDescriptor:v6];
}

- (id)stateForIdentity:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(NSMutableDictionary *)self->_stateByIdentity objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (NSSet)states
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = [(NSMutableDictionary *)self->_stateByIdentity allValues];
  id v6 = [v4 setWithArray:v5];

  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v6;
}

- (id)description
{
  return [(RBSProcessMonitorConfiguration *)self->_configuration description];
}

- (unint64_t)events
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_valid) {
    unint64_t v4 = [(RBSProcessMonitorConfiguration *)self->_configuration events];
  }
  else {
    unint64_t v4 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPreventLaunchUpdateHandle:(id)a3
{
  newValue = (char *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_configuring)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"RBSProcessMonitor.m" lineNumber:233 description:@"must only call during configuration"];
  }
  -[RBSProcessMonitorConfiguration setPreventLaunchUpdateHandler:](self->_configuration, newValue);
}

- (void)_reconnect
{
  if (a1) {
    return (void *)[a1 updateConfiguration:&__block_literal_global];
  }
  return a1;
}

- (void)_handleExitEvent:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_valid)
  {
    id v5 = [v4 process];
    id v6 = self->_configuration;
    if (([(RBSProcessMonitorConfiguration *)v6 events] & 1) != 0
      && [(RBSProcessMonitorConfiguration *)v6 matchesProcess:v5])
    {
      uint64_t v7 = [(RBSProcessMonitorConfiguration *)v6 updateHandler];
      uint64_t v8 = +[RBSProcessStateUpdate updateWithState:0 previousState:0 exitEvent:v4];
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
    }
    os_unfair_lock_unlock(&self->_lock);
    if (v8 && v7) {
      ((void (**)(void, RBSProcessMonitor *, void *, NSObject *))v7)[2](v7, self, v5, v8);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v8 = rbs_monitor_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[RBSProcessMonitor _handleExitEvent:]();
    }
  }
}

- (void)updateConfiguration:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_191FE8000, v0, OS_LOG_TYPE_DEBUG, "Successfully synced configuration for monitor %{public}@", v1, 0xCu);
}

- (void)updateConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_191FE8000, v0, v1, "Permanent error subscribing to process monitor %{public}@ <%{public}@>");
}

- (void)updateConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_191FE8000, v0, v1, "Transient error subscribing to process monitor %{public}@ <%{public}@>");
}

- (void)_handleExitEvent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_191FE8000, v0, OS_LOG_TYPE_ERROR, "_handleExitEvent called for invalid monitor %{public}@", v1, 0xCu);
}

- (void)_handlePreventLaunchUpdate:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_191FE8000, v0, OS_LOG_TYPE_ERROR, "_handlePreventLaunchUpdate called for invalid monitor %{public}@", v1, 0xCu);
}

@end
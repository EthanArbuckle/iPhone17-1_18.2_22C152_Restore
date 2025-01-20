@interface RBThrottleBestEffortNetworkingManager
- (BOOL)isThrottleBestEffortNetworkingEnabled;
- (NSString)debugDescription;
- (NSString)stateCaptureTitle;
- (RBThrottleBestEffortNetworkingManager)init;
- (void)_updateThrottleBestEffortNetworking;
- (void)addProcess:(id)a3;
- (void)didUpdateProcessStates:(id)a3;
- (void)removeProcess:(id)a3;
@end

@implementation RBThrottleBestEffortNetworkingManager

- (void)didUpdateProcessStates:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v10 = [v9 updatedState];
        v11 = [v9 originalState];
        int v12 = [v11 throttleBestEffortNetworking];
        int v13 = [v10 throttleBestEffortNetworking];

        if (v12 != v13)
        {
          v14 = [v9 identity];
          int v15 = [v10 throttleBestEffortNetworking];
          stateMap = self->_stateMap;
          if (v15)
          {
            v17 = (void *)[v10 copy];
            id v18 = [(RBProcessMap *)stateMap setValue:v17 forIdentity:v14];
          }
          else
          {
            [(RBProcessMap *)self->_stateMap removeIdentity:v14];
          }

          char v6 = 1;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
    if (v6) {
      -[RBThrottleBestEffortNetworkingManager _updateThrottleBestEffortNetworking]((uint64_t)self);
    }
  }
}

- (void)addProcess:(id)a3
{
  [(RBProcessIndex *)self->_processIndex addProcess:a3];
  -[RBThrottleBestEffortNetworkingManager _updateThrottleBestEffortNetworking]((uint64_t)self);
}

- (void)_updateThrottleBestEffortNetworking
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 36));
    uint64_t v11 = 0;
    int v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    id v3 = *(void **)(a1 + 24);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __76__RBThrottleBestEffortNetworkingManager__updateThrottleBestEffortNetworking__block_invoke;
    v10[3] = &unk_2647C7FF8;
    v10[4] = a1;
    v10[5] = &v11;
    [v3 enumerateWithBlock:v10];
    if (*((unsigned __int8 *)v12 + 24) != *(unsigned __int8 *)(a1 + 32))
    {
      uint64_t v4 = rbs_best_effort_networking_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        if (*((unsigned char *)v12 + 24)) {
          uint64_t v5 = "enabled";
        }
        else {
          uint64_t v5 = "disabled";
        }
        *(_DWORD *)buf = 136315138;
        v16 = v5;
        _os_log_impl(&dword_226AB3000, v4, OS_LOG_TYPE_DEFAULT, "Throttle best effort networking set to %s", buf, 0xCu);
      }

      char v6 = v12;
      *(unsigned char *)(a1 + 32) = *((unsigned char *)v12 + 24);
      LODWORD(v6) = *((unsigned __int8 *)v6 + 24);
      uint64_t v7 = *(NSObject **)(a1 + 8);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __76__RBThrottleBestEffortNetworkingManager__updateThrottleBestEffortNetworking__block_invoke_10;
      block[3] = &__block_descriptor_36_e5_v8__0l;
      int v9 = (int)v6;
      dispatch_async(v7, block);
    }
    os_unfair_lock_unlock(v2);
    _Block_object_dispose(&v11, 8);
  }
}

- (void)removeProcess:(id)a3
{
  [(RBProcessIndex *)self->_processIndex removeProcess:a3];
  -[RBThrottleBestEffortNetworkingManager _updateThrottleBestEffortNetworking]((uint64_t)self);
}

- (RBThrottleBestEffortNetworkingManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)RBThrottleBestEffortNetworkingManager;
  v2 = [(RBThrottleBestEffortNetworkingManager *)&v11 init];
  id v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_alloc_init(RBProcessMap);
    stateMap = v3->_stateMap;
    v3->_stateMap = v4;

    char v6 = objc_alloc_init(RBProcessIndex);
    processIndex = v3->_processIndex;
    v3->_processIndex = v6;

    v3->_throttleBestEffortNetworking = 0;
    uint64_t v8 = [MEMORY[0x263F64650] createBackgroundQueue:@"RBThrottleBestEffortNetworkingManager"];
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;
  }
  return v3;
}

- (BOOL)isThrottleBestEffortNetworkingEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_throttleBestEffortNetworking;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(id)objc_opt_class() description];
  uint64_t v5 = [(RBProcessMap *)self->_stateMap dictionary];
  char v6 = [v5 entriesToStringWithIndent:1 debug:1];
  uint64_t v7 = (void *)[v3 initWithFormat:@"<%@| process states:{\n\t%@\n\t}>", v4, v6];

  return (NSString *)v7;
}

- (NSString)stateCaptureTitle
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

uint64_t __76__RBThrottleBestEffortNetworkingManager__updateThrottleBestEffortNetworking__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) containsIdentity:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __76__RBThrottleBestEffortNetworkingManager__updateThrottleBestEffortNetworking__block_invoke_10(uint64_t a1)
{
  if (sysctlbyname("kern.ipc.throttle_best_effort", 0, 0, (void *)(a1 + 32), 4uLL) && *__error() != 2)
  {
    v1 = rbs_best_effort_networking_log();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __76__RBThrottleBestEffortNetworkingManager__updateThrottleBestEffortNetworking__block_invoke_10_cold_1(v1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMap, 0);
  objc_storeStrong((id *)&self->_processIndex, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __76__RBThrottleBestEffortNetworkingManager__updateThrottleBestEffortNetworking__block_invoke_10_cold_1(NSObject *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = *__error();
  id v3 = __error();
  uint64_t v4 = strerror(*v3);
  v5[0] = 67109378;
  v5[1] = v2;
  __int16 v6 = 2080;
  uint64_t v7 = v4;
  _os_log_error_impl(&dword_226AB3000, a1, OS_LOG_TYPE_ERROR, "Error applying throttle best effort with error %d: %s", (uint8_t *)v5, 0x12u);
}

@end
@interface RBThermalResponseManager
+ (id)managerWithDaemonContext:(id)a3 notificationName:(id)a4;
+ (int64_t)_thermalConditionLevelForThermalLevel:(unint64_t)a3;
- (id)_initWithDaemonContext:(id)a3 notificationName:(id)a4;
- (void)_queue_updateAssertion;
- (void)_takeAssertionForConditionLevel:(int64_t)a3 completion:(id)a4;
@end

@implementation RBThermalResponseManager

+ (int64_t)_thermalConditionLevelForThermalLevel:(unint64_t)a3
{
  int64_t v3 = 830;
  uint64_t v4 = 840;
  uint64_t v5 = 860;
  if (a3 == 14) {
    uint64_t v5 = 850;
  }
  if (a3 >= 0xE) {
    uint64_t v4 = v5;
  }
  if (a3 >= 0xB) {
    int64_t v3 = v4;
  }
  if (a3 >= 7) {
    return v3;
  }
  else {
    return 0;
  }
}

- (void)_takeAssertionForConditionLevel:(int64_t)a3 completion:(id)a4
{
  v27[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = (void *)MEMORY[0x263F64418];
  v8 = [(RBDaemonContextProviding *)self->_daemonContext process];
  objc_msgSend(v7, "identifierWithClientPid:", objc_msgSend(v8, "rbs_pid"));
  v9 = (RBSAssertionIdentifier *)objc_claimAutoreleasedReturnValue();

  v10 = [MEMORY[0x263F64460] attributeWithCondition:@"therm" value:a3];
  v27[0] = v10;
  v11 = [MEMORY[0x263F643C8] attributeWithCompletionPolicy:1];
  v27[1] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];

  v13 = (void *)MEMORY[0x263F64410];
  v14 = [MEMORY[0x263F64630] systemTarget];
  v15 = [v13 descriptorWithIdentifier:v9 target:v14 explanation:@"Thermal Condition" attributes:v12];

  v16 = [(RBDaemonContextProviding *)self->_daemonContext process];
  v17 = +[RBAssertionAcquisitionContext contextForProcess:v16 withDescriptor:v15 daemonContext:self->_daemonContext];

  v18 = self->_currentAssertion;
  currentAssertion = self->_currentAssertion;
  self->_currentAssertion = v9;
  v20 = v9;

  v21 = [(RBDaemonContextProviding *)self->_daemonContext assertionManager];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __71__RBThermalResponseManager__takeAssertionForConditionLevel_completion___block_invoke;
  v24[3] = &unk_2647C8068;
  v25 = v18;
  id v26 = v6;
  v22 = v18;
  id v23 = v6;
  [v21 acquireAssertionWithContext:v17 completion:v24];
}

void __71__RBThermalResponseManager__takeAssertionForConditionLevel_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = rbs_general_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __71__RBThermalResponseManager__takeAssertionForConditionLevel_completion___block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_queue_updateAssertion
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_226AB3000, a2, OS_LOG_TYPE_FAULT, "In RBThermalResponseManager, notify_get_state failed with %d", (uint8_t *)v2, 8u);
}

void __50__RBThermalResponseManager__queue_updateAssertion__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v2 = *(void **)(*(void *)(a1 + 32) + 8);
    id v3 = a2;
    id v4 = [v2 assertionManager];
    [v4 invalidateAssertionWithIdentifier:v3];
  }
}

- (id)_initWithDaemonContext:(id)a3 notificationName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)RBThermalResponseManager;
  v9 = [(RBThermalResponseManager *)&v20 init];
  v10 = (int *)v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemonContext, a3);
    v11 = (const char *)[v8 UTF8String];
    v12 = [MEMORY[0x263F64650] sharedBackgroundWorkloop];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __68__RBThermalResponseManager__initWithDaemonContext_notificationName___block_invoke;
    handler[3] = &unk_2647C80B8;
    v13 = v10;
    v19 = v13;
    uint32_t v14 = notify_register_dispatch(v11, v10 + 4, v12, handler);

    if (v14)
    {
      v15 = rbs_general_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[RBThermalResponseManager _initWithDaemonContext:notificationName:](v14, v15);
      }
    }
    v16 = v13;
  }
  return v10;
}

uint64_t __68__RBThermalResponseManager__initWithDaemonContext_notificationName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateAssertion");
}

+ (id)managerWithDaemonContext:(id)a3 notificationName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[RBThermalResponseManager alloc] _initWithDaemonContext:v6 notificationName:v5];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAssertion, 0);
  objc_storeStrong((id *)&self->_daemonContext, 0);
}

void __71__RBThermalResponseManager__takeAssertionForConditionLevel_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_226AB3000, a2, OS_LOG_TYPE_FAULT, "In RBThermalResponseManager, acqusition failed with %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_initWithDaemonContext:(int)a1 notificationName:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_226AB3000, a2, OS_LOG_TYPE_FAULT, "In RBThermalResponseManager, notify_register_dispatch failed with %d", (uint8_t *)v2, 8u);
}

@end
@interface VTTriggerEventMonitorManager
+ (id)sharedManager;
- (VTTriggerEventMonitorManager)init;
- (void)addConnection:(id)a3;
- (void)notifyEarlyDetect;
- (void)notifyVoiceTrigger;
- (void)removeConnection:(id)a3;
@end

@implementation VTTriggerEventMonitorManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_connections, 0);
}

- (void)notifyEarlyDetect
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__127;
  v19 = __Block_byref_object_dispose__128;
  id v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__VTTriggerEventMonitorManager_notifyEarlyDetect__block_invoke;
  block[3] = &unk_264325F50;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(queue, block);
  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "Broadcasting XPC notification for EarlyDetection event", buf, 2u);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = (id)v16[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "remoteObjectProxy", (void)v9);
        [v8 earlyDetected];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v21 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v15, 8);
}

uint64_t __49__VTTriggerEventMonitorManager_notifyEarlyDetect__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) copy];

  return MEMORY[0x270F9A758]();
}

- (void)notifyVoiceTrigger
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__127;
  v19 = __Block_byref_object_dispose__128;
  id v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__VTTriggerEventMonitorManager_notifyVoiceTrigger__block_invoke;
  block[3] = &unk_264325F50;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(queue, block);
  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "Broadcasting XPC notification for VoiceTrigger event", buf, 2u);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = (id)v16[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "remoteObjectProxy", (void)v9);
        [v8 voiceTriggered];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v21 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v15, 8);
}

uint64_t __50__VTTriggerEventMonitorManager_notifyVoiceTrigger__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) copy];

  return MEMORY[0x270F9A758]();
}

- (void)removeConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__VTTriggerEventMonitorManager_removeConnection___block_invoke;
    v8[3] = &unk_264325FF0;
    v8[4] = self;
    id v9 = v4;
    dispatch_sync(queue, v8);
  }
  else
  {
    uint64_t v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_21844F000, v7, OS_LOG_TYPE_ERROR, "Cannot add connection since it is nil", buf, 2u);
    }
  }
}

void __49__VTTriggerEventMonitorManager_removeConnection___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) count];
  [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
  v3 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = v3;
    int v7 = 134349568;
    uint64_t v8 = v4;
    __int16 v9 = 2050;
    uint64_t v10 = v2;
    __int16 v11 = 2050;
    uint64_t v12 = [v5 count];
    _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_DEFAULT, "Remove Connection : %{public}p, numConnection was %{public}tu, become %{public}tu", (uint8_t *)&v7, 0x20u);
  }
}

- (void)addConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __46__VTTriggerEventMonitorManager_addConnection___block_invoke;
    v8[3] = &unk_264325FF0;
    v8[4] = self;
    id v9 = v4;
    dispatch_sync(queue, v8);
  }
  else
  {
    int v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_21844F000, v7, OS_LOG_TYPE_ERROR, "Cannot add connection since it is nil", buf, 2u);
    }
  }
}

void __46__VTTriggerEventMonitorManager_addConnection___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) count];
  [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
  v3 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = v3;
    int v7 = 134349568;
    uint64_t v8 = v4;
    __int16 v9 = 2050;
    uint64_t v10 = v2;
    __int16 v11 = 2050;
    uint64_t v12 = [v5 count];
    _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_DEFAULT, "Add Connection : %{public}p, numConnection was %{public}tu, become %{public}tu", (uint8_t *)&v7, 0x20u);
  }
}

- (VTTriggerEventMonitorManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)VTTriggerEventMonitorManager;
  uint64_t v2 = [(VTTriggerEventMonitorManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9C0] set];
    connections = v2->_connections;
    v2->_connections = (NSMutableSet *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("VTTriggerEventMonitorManager queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_143);
  }
  uint64_t v2 = (void *)sharedManager_sharedManager;

  return v2;
}

uint64_t __45__VTTriggerEventMonitorManager_sharedManager__block_invoke()
{
  sharedManager_sharedManager = objc_alloc_init(VTTriggerEventMonitorManager);

  return MEMORY[0x270F9A758]();
}

@end
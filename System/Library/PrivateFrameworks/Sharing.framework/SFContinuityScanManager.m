@interface SFContinuityScanManager
+ (id)sharedManager;
- (BOOL)shouldEscapeXpcTryCatch;
- (NSHashTable)observers;
- (NSMutableSet)foundDevices;
- (SFContinuityScanManager)init;
- (id)exportedInterface;
- (id)machServiceName;
- (id)remoteObjectInterface;
- (unint64_t)scanTypes;
- (void)activityPayloadFromDeviceUniqueID:(id)a3 forAdvertisementPayload:(id)a4 command:(id)a5 timeout:(int64_t)a6 withCompletionHandler:(id)a7;
- (void)addObserver:(id)a3;
- (void)foundDeviceWithDevice:(id)a3;
- (void)lostDeviceWithDevice:(id)a3;
- (void)onqueue_connectionEstablished;
- (void)onqueue_connectionInterrupted;
- (void)pairedDevicesChanged:(id)a3;
- (void)receivedAdvertisement:(id)a3;
- (void)removeObserver:(id)a3;
- (void)scanForTypes:(unint64_t)a3;
- (void)setFoundDevices:(id)a3;
- (void)setObservers:(id)a3;
- (void)setScanTypes:(unint64_t)a3;
@end

@implementation SFContinuityScanManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)sharedManager_manager;

  return v2;
}

void __40__SFContinuityScanManager_sharedManager__block_invoke()
{
  if (SFDeviceSupportsContinuity()) {
    v0 = objc_alloc_init(SFContinuityScanManager);
  }
  else {
    v0 = 0;
  }
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;
}

- (SFContinuityScanManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)SFContinuityScanManager;
  v2 = [(SFXPCClient *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_scanTypes = 0;
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    foundDevices = v3->_foundDevices;
    v3->_foundDevices = v4;

    uint64_t v6 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v6;

    v9.receiver = v3;
    v9.super_class = (Class)SFContinuityScanManager;
    [(SFXPCClient *)&v9 _activate];
  }
  return v3;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    BOOL v5 = [(NSHashTable *)self->_observers containsObject:v4];
    id v4 = v6;
    if (!v5)
    {
      [(NSHashTable *)self->_observers addObject:v6];
      id v4 = v6;
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSHashTable *)self->_observers removeObject:v4];
    if (![(NSHashTable *)self->_observers count])
    {
      BOOL v5 = handoff_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "all observers gone, resetting scan types", v6, 2u);
      }

      [(SFContinuityScanManager *)self scanForTypes:0];
    }
  }
}

- (void)scanForTypes:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFActivityScanner/scanForTypes", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  [(SFContinuityScanManager *)self setScanTypes:a3];
  id v6 = handoff_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = SFActivityScanTypesToString(a3);
    *(_DWORD *)buf = 138412290;
    v11 = v7;
    _os_log_impl(&dword_1A5389000, v6, OS_LOG_TYPE_DEFAULT, "client process changing types to scan for to %@", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__SFContinuityScanManager_scanForTypes___block_invoke;
  v8[3] = &__block_descriptor_40_e47_v16__0__NSObject_SFContinuityScannerProtocol__8l;
  v8[4] = a3;
  [(SFContinuityScanManager *)self _getRemoteObjectProxyOnQueue:v8];
  os_activity_scope_leave(&state);
}

uint64_t __40__SFContinuityScanManager_scanForTypes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 scanForTypes:*(void *)(a1 + 32)];
}

- (void)activityPayloadFromDeviceUniqueID:(id)a3 forAdvertisementPayload:(id)a4 command:(id)a5 timeout:(int64_t)a6 withCompletionHandler:(id)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = _os_activity_create(&dword_1A5389000, "Sharing/SFActivityScanner/activityPayloadFromDeviceUniqueID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v16, &state);
  v17 = handoff_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = SFHexStringForData(v13);
    *(_DWORD *)buf = 138412802;
    id v33 = v19;
    __int16 v34 = 2112;
    id v35 = v12;
    __int16 v36 = 2112;
    v37 = v20;
    _os_log_impl(&dword_1A5389000, v17, OS_LOG_TYPE_DEFAULT, "[%@] Dispatching payload request to %@ for %@", buf, 0x20u);
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __123__SFContinuityScanManager_activityPayloadFromDeviceUniqueID_forAdvertisementPayload_command_timeout_withCompletionHandler___block_invoke;
  v25[3] = &unk_1E5BBDED0;
  id v21 = v12;
  id v26 = v21;
  id v22 = v13;
  id v27 = v22;
  id v23 = v14;
  id v28 = v23;
  int64_t v30 = a6;
  id v24 = v15;
  id v29 = v24;
  [(SFContinuityScanManager *)self _getRemoteObjectProxyOnQueue:v25];

  os_activity_scope_leave(&state);
}

uint64_t __123__SFContinuityScanManager_activityPayloadFromDeviceUniqueID_forAdvertisementPayload_command_timeout_withCompletionHandler___block_invoke(void *a1, void *a2)
{
  return [a2 activityPayloadFromDeviceUniqueID:a1[4] forAdvertisementPayload:a1[5] command:a1[6] timeout:a1[8] withCompletionHandler:a1[7]];
}

- (void)onqueue_connectionEstablished
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[SFContinuityScanManager onqueue_connectionEstablished]";
  _os_log_error_impl(&dword_1A5389000, log, OS_LOG_TYPE_ERROR, "[%s]", (uint8_t *)&v1, 0xCu);
}

- (void)onqueue_connectionInterrupted
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[SFContinuityScanManager onqueue_connectionInterrupted]";
  _os_log_error_impl(&dword_1A5389000, log, OS_LOG_TYPE_ERROR, "[%s]", (uint8_t *)&v1, 0xCu);
}

- (void)receivedAdvertisement:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(SFContinuityScanManager *)self observers];
  id v6 = (void *)[v5 copy];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    v11 = @"YES";
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "scanManager:receivedAdvertisement:", self, v4, (void)v17);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v9);
  }
  else
  {
    v11 = @"NO";
  }

  id v13 = handoff_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    v16 = [v4 debugDescription];
    *(_DWORD *)buf = 138412802;
    id v22 = v15;
    __int16 v23 = 2112;
    id v24 = v16;
    __int16 v25 = 2112;
    id v26 = v11;
    _os_log_impl(&dword_1A5389000, v13, OS_LOG_TYPE_DEFAULT, "[%@] Received advertisement %@. Handled:%@", buf, 0x20u);
  }
}

- (void)foundDeviceWithDevice:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSMutableSet *)self->_foundDevices addObject:v4];
  BOOL v5 = [(SFContinuityScanManager *)self observers];
  id v6 = (void *)[v5 copy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    v11 = @"YES";
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "scanManager:foundDeviceWithDevice:", self, v4, (void)v16);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v9);
  }
  else
  {
    v11 = @"NO";
  }

  id v13 = handoff_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138412802;
    id v21 = v15;
    __int16 v22 = 2112;
    id v23 = v4;
    __int16 v24 = 2112;
    __int16 v25 = v11;
    _os_log_impl(&dword_1A5389000, v13, OS_LOG_TYPE_DEFAULT, "[%@] Found device %@. Handled:%@", buf, 0x20u);
  }
}

- (void)lostDeviceWithDevice:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSMutableSet *)self->_foundDevices removeObject:v4];
  BOOL v5 = [(SFContinuityScanManager *)self observers];
  id v6 = (void *)[v5 copy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    v11 = @"YES";
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "scanManager:lostDeviceWithDevice:", self, v4, (void)v16);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v9);
  }
  else
  {
    v11 = @"NO";
  }

  id v13 = handoff_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138412802;
    id v21 = v15;
    __int16 v22 = 2112;
    id v23 = v4;
    __int16 v24 = 2112;
    __int16 v25 = v11;
    _os_log_impl(&dword_1A5389000, v13, OS_LOG_TYPE_DEFAULT, "[%@] Lost device %@. Handled:%@", buf, 0x20u);
  }
}

- (void)pairedDevicesChanged:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(SFContinuityScanManager *)self observers];
  id v6 = (void *)[v5 copy];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "scanManager:pairedDevicesChanged:", self, v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)machServiceName
{
  return @"com.apple.sharing.handoff.scanning";
}

- (id)exportedInterface
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA15958];
  [v2 setClass:objc_opt_class() forSelector:sel_receivedAdvertisement_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_foundDeviceWithDevice_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_lostDeviceWithDevice_ argumentIndex:0 ofReply:0];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  BOOL v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_pairedDevicesChanged_ argumentIndex:0 ofReply:0];

  return v2;
}

- (id)remoteObjectInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA390E0];
}

- (BOOL)shouldEscapeXpcTryCatch
{
  return 1;
}

- (NSMutableSet)foundDevices
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFoundDevices:(id)a3
{
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 40, 1);
}

- (void)setObservers:(id)a3
{
}

- (unint64_t)scanTypes
{
  return self->_scanTypes;
}

- (void)setScanTypes:(unint64_t)a3
{
  self->_scanTypes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_foundDevices, 0);
}

@end
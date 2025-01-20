@interface ICNanoPairedDeviceStatusMonitor
+ (ICNanoPairedDeviceStatusMonitor)sharedMonitor;
- (BOOL)isInitialSyncComplete;
- (BOOL)isMediaSyncingSupported;
- (NSArray)allPairedDeviceGUIDs;
- (NSArray)allPairedDevicePairingIDs;
- (NSString)pairedDeviceGUID;
- (NSString)pairedDeviceMediaGUID;
- (NSUUID)activePairedDevicePairingID;
- (NSUUID)pairedDevicePairingID;
- (id)_activePairedDevice;
- (id)_allObservers;
- (id)_init;
- (void)_handlePairedDeviceChangedNotification;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)deviceBecameActive:(id)a3;
- (void)initialSyncStateObserver:(id)a3 initialSyncDidCompleteForPairingIdentifier:(id)a4;
- (void)removeObserver:(id)a3;
@end

@implementation ICNanoPairedDeviceStatusMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialSyncStateObserver, 0);
  objc_storeStrong((id *)&self->_pairedDeviceMediaGUID, 0);
  objc_storeStrong((id *)&self->_pairedDeviceGUID, 0);
  objc_storeStrong((id *)&self->_pairingIDPropertyName, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_callBackQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initialSyncStateObserver:(id)a3 initialSyncDidCompleteForPairingIdentifier:(id)a4
{
  id v5 = a4;
  callBackQueue = self->_callBackQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __103__ICNanoPairedDeviceStatusMonitor_initialSyncStateObserver_initialSyncDidCompleteForPairingIdentifier___block_invoke;
  v8[3] = &unk_1E5ACD4C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(callBackQueue, v8);
}

void __103__ICNanoPairedDeviceStatusMonitor_initialSyncStateObserver_initialSyncDidCompleteForPairingIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_allObservers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 nanoPairedDeviceStatusMonitor:*(void *)(a1 + 32) didFinishInitialSyncForPairingIdentifier:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)deviceBecameActive:(id)a3
{
  callBackQueue = self->_callBackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__ICNanoPairedDeviceStatusMonitor_deviceBecameActive___block_invoke;
  block[3] = &unk_1E5ACD750;
  block[4] = self;
  dispatch_async(callBackQueue, block);
}

void __54__ICNanoPairedDeviceStatusMonitor_deviceBecameActive___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_allObservers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 nanoPairedDeviceStatusMonitorNewActiveDevice:*(void *)(a1 + 32)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_handlePairedDeviceChangedNotification
{
  pairedDeviceGUID = self->_pairedDeviceGUID;
  self->_pairedDeviceGUID = 0;

  pairedDeviceMediaGUID = self->_pairedDeviceMediaGUID;
  self->_pairedDeviceMediaGUID = 0;

  callBackQueue = self->_callBackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__ICNanoPairedDeviceStatusMonitor__handlePairedDeviceChangedNotification__block_invoke;
  block[3] = &unk_1E5ACD750;
  block[4] = self;
  dispatch_async(callBackQueue, block);
}

void __73__ICNanoPairedDeviceStatusMonitor__handlePairedDeviceChangedNotification__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_allObservers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 nanoPairedDeviceStatusMonitorPairedDeviceChanged:*(void *)(a1 + 32)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)_activePairedDevice
{
  v2 = [getNRPairedDeviceRegistryClass() sharedInstance];
  uint64_t v3 = [getNRPairedDeviceRegistryClass() activeDeviceSelectorBlock];
  uint64_t v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  uint64_t v5 = [v4 firstObject];

  return v5;
}

- (id)_allObservers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__7327;
  long long v10 = __Block_byref_object_dispose__7328;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__ICNanoPairedDeviceStatusMonitor__allObservers__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__ICNanoPairedDeviceStatusMonitor__allObservers__block_invoke(uint64_t a1)
{
  id v5 = (id)[*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v2 = [v5 objectEnumerator];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)isMediaSyncingSupported
{
  return 1;
}

- (BOOL)isInitialSyncComplete
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v3 = +[ICDefaults standardDefaults];
  int v4 = [v3 shouldForceWatchInitialSyncCompletion];

  if (v4)
  {
    id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = self;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Forcing initial sync completion from debug override", buf, 0xCu);
    }
    BOOL v6 = 1;
  }
  else
  {
    id v7 = [(ICNanoPairedDeviceStatusMonitor *)self activePairedDevicePairingID];
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__ICNanoPairedDeviceStatusMonitor_isInitialSyncComplete__block_invoke;
    block[3] = &unk_1E5ACCC88;
    id v11 = v7;
    v12 = self;
    uint64_t v13 = &v14;
    id v5 = v7;
    dispatch_sync(queue, block);
    BOOL v6 = *((unsigned char *)v15 + 24) != 0;
  }
  _Block_object_dispose(&v14, 8);
  return v6;
}

void __56__ICNanoPairedDeviceStatusMonitor_isInitialSyncComplete__block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1[4] && *(void *)(a1[5] + 56))
  {
    dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
    uint64_t v3 = (void *)a1[4];
    int v4 = *(void **)(a1[5] + 56);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__ICNanoPairedDeviceStatusMonitor_isInitialSyncComplete__block_invoke_2;
    v8[3] = &unk_1E5AC7DE8;
    uint64_t v11 = a1[6];
    id v9 = v3;
    dispatch_semaphore_t v10 = v2;
    id v5 = v2;
    [v4 requestInitialSyncStateForPairingIdentifier:v9 completion:v8];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = *(void *)(a1[5] + 56);
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "Could not get activePairedDeviceId %{public}@, _initialSyncStateObserver %{public}@.", buf, 0x16u);
    }
  }
}

void __56__ICNanoPairedDeviceStatusMonitor_isInitialSyncComplete__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5) {
    char v6 = 1;
  }
  else {
    char v6 = a2;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
  uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    int v10 = 138544130;
    uint64_t v11 = v8;
    __int16 v12 = 1024;
    int v13 = a2;
    __int16 v14 = 2114;
    id v15 = v5;
    __int16 v16 = 1024;
    int v17 = v9;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "obtained initial sync state for %{public}@. hasCompletedSync=%d, err=%{public}@, initialSyncComplete=%d", (uint8_t *)&v10, 0x22u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (NSString)pairedDeviceMediaGUID
{
  pairedDeviceMediaGUID = self->_pairedDeviceMediaGUID;
  if (!pairedDeviceMediaGUID)
  {
    int v4 = [(ICNanoPairedDeviceStatusMonitor *)self _activePairedDevice];
    if (v4)
    {
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x2020000000;
      id v5 = (void *)getNRDevicePropertyIsAltAccountSymbolLoc_ptr;
      uint64_t v30 = getNRDevicePropertyIsAltAccountSymbolLoc_ptr;
      if (!getNRDevicePropertyIsAltAccountSymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        uint64_t v23 = 3221225472;
        v24 = __getNRDevicePropertyIsAltAccountSymbolLoc_block_invoke;
        v25 = &unk_1E5ACD4F0;
        v26 = &v27;
        char v6 = NanoRegistryLibrary();
        v28[3] = (uint64_t)dlsym(v6, "NRDevicePropertyIsAltAccount");
        getNRDevicePropertyIsAltAccountSymbolLoc_ptr = *(void *)(v26[1] + 24);
        id v5 = (void *)v28[3];
      }
      _Block_object_dispose(&v27, 8);
      if (!v5)
      {
        uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
        v21 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyIsAltAccount(void)"];
        objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"ICNanoPairedDeviceStatusMonitor.m", 38, @"%s", dlerror());
        goto LABEL_25;
      }
      uint64_t v7 = [v4 valueForProperty:*v5];
      char v8 = [v7 BOOLValue];

      if (v8) {
        goto LABEL_20;
      }
      int v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C5DDE5DD-2FF7-4735-80A3-0108488556DE"];
      int v10 = [v4 supportsCapability:v9];

      if (v10)
      {
        uint64_t v27 = 0;
        v28 = &v27;
        uint64_t v29 = 0x2020000000;
        uint64_t v11 = (id *)getNRDevicePropertyCompanionMusicGUIDSymbolLoc_ptr;
        uint64_t v30 = getNRDevicePropertyCompanionMusicGUIDSymbolLoc_ptr;
        if (!getNRDevicePropertyCompanionMusicGUIDSymbolLoc_ptr)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          uint64_t v23 = 3221225472;
          v24 = __getNRDevicePropertyCompanionMusicGUIDSymbolLoc_block_invoke;
          v25 = &unk_1E5ACD4F0;
          v26 = &v27;
          __int16 v12 = NanoRegistryLibrary();
          v28[3] = (uint64_t)dlsym(v12, "NRDevicePropertyCompanionMusicGUID");
          getNRDevicePropertyCompanionMusicGUIDSymbolLoc_ptr = *(void *)(v26[1] + 24);
          uint64_t v11 = (id *)v28[3];
        }
        _Block_object_dispose(&v27, 8);
        if (!v11)
        {
          while (1)
          {
            uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
            v21 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyCompanionMusicGUID(void)"];
            objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"ICNanoPairedDeviceStatusMonitor.m", 36, @"%s", dlerror());
LABEL_25:

            __break(1u);
          }
        }
        id v13 = *v11;
      }
      else
      {
        getNRDevicePropertyUDID();
        id v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      __int16 v16 = v13;
      int v17 = [v4 valueForProperty:v13];
      uint64_t v18 = self->_pairedDeviceMediaGUID;
      self->_pairedDeviceMediaGUID = v17;

      if (self->_pairedDeviceMediaGUID) {
        goto LABEL_20;
      }
      __int16 v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v15 = "failed to obtain CompanionMusicGUID - you may need an entitlement for this process";
        goto LABEL_18;
      }
    }
    else
    {
      __int16 v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v15 = "failed to obtain pairedDeviceMediaGUID because there is no active paired device";
LABEL_18:
        _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
      }
    }

LABEL_20:
    pairedDeviceMediaGUID = self->_pairedDeviceMediaGUID;
  }

  return pairedDeviceMediaGUID;
}

- (NSString)pairedDeviceGUID
{
  pairedDeviceGUID = self->_pairedDeviceGUID;
  if (!pairedDeviceGUID)
  {
    int v4 = [(ICNanoPairedDeviceStatusMonitor *)self _activePairedDevice];
    if (v4)
    {
      id v5 = getNRDevicePropertyUDID();
      char v6 = [v4 valueForProperty:v5];
      uint64_t v7 = self->_pairedDeviceGUID;
      self->_pairedDeviceGUID = v6;

      if (self->_pairedDeviceGUID)
      {
LABEL_10:

        pairedDeviceGUID = self->_pairedDeviceGUID;
        goto LABEL_11;
      }
      char v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = 0;
        int v9 = "failed to obtain paired device GUID - you may need an entitlement for this process";
        int v10 = (uint8_t *)&v13;
LABEL_8:
        _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      }
    }
    else
    {
      char v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = 0;
        int v9 = "failed to obtain paired device GUID because there is no active paired device";
        int v10 = (uint8_t *)&v12;
        goto LABEL_8;
      }
    }

    goto LABEL_10;
  }
LABEL_11:

  return pairedDeviceGUID;
}

- (NSArray)allPairedDeviceGUIDs
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy__7327;
  uint64_t v11 = __Block_byref_object_dispose__7328;
  id v12 = [MEMORY[0x1E4F1CA48] array];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__ICNanoPairedDeviceStatusMonitor_allPairedDeviceGUIDs__block_invoke;
  block[3] = &unk_1E5ACD4F0;
  void block[4] = &v7;
  dispatch_sync(queue, block);
  int v4 = (void *)[(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __55__ICNanoPairedDeviceStatusMonitor_allPairedDeviceGUIDs__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = [getNRPairedDeviceRegistryClass() sharedInstance];
  uint64_t v3 = [v2 getPairedDevices];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        uint64_t v9 = getNRDevicePropertyUDID();
        int v10 = [v8 valueForProperty:v9];

        if (v10) {
          [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v10];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (NSArray)allPairedDevicePairingIDs
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  long long v11 = __Block_byref_object_copy__7327;
  long long v12 = __Block_byref_object_dispose__7328;
  id v13 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__ICNanoPairedDeviceStatusMonitor_allPairedDevicePairingIDs__block_invoke;
  v7[3] = &unk_1E5ACD880;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(queue, v7);
  uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [(id)v9[5] count];
    *(_DWORD *)buf = 67109120;
    int v15 = v4;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "Found %d paired device ids", buf, 8u);
  }

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

void __60__ICNanoPairedDeviceStatusMonitor_allPairedDevicePairingIDs__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [getNRPairedDeviceRegistryClass() sharedInstance];
  int v4 = [v3 getPairedDevices];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) valueForProperty:*(void *)(*(void *)(a1 + 32) + 32)];
        if (v9) {
          [v2 addObject:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v2;
}

- (NSUUID)pairedDevicePairingID
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  long long v11 = __Block_byref_object_copy__7327;
  long long v12 = __Block_byref_object_dispose__7328;
  id v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ICNanoPairedDeviceStatusMonitor_pairedDevicePairingID__block_invoke;
  block[3] = &unk_1E5ACD4F0;
  void block[4] = &v8;
  dispatch_sync(queue, block);
  uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v9[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v4;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "paired device pairing id %{public}@", buf, 0xCu);
  }

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSUUID *)v5;
}

void __56__ICNanoPairedDeviceStatusMonitor_pairedDevicePairingID__block_invoke(uint64_t a1)
{
  id v5 = [getNRPairedDeviceRegistryClass() sharedInstance];
  uint64_t v2 = [v5 pairingID];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSUUID)activePairedDevicePairingID
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  long long v11 = __Block_byref_object_copy__7327;
  long long v12 = __Block_byref_object_dispose__7328;
  id v13 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__ICNanoPairedDeviceStatusMonitor_activePairedDevicePairingID__block_invoke;
  v7[3] = &unk_1E5ACD880;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(queue, v7);
  uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v9[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v4;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "active paired device pairing id %{public}@", buf, 0xCu);
  }

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSUUID *)v5;
}

void __62__ICNanoPairedDeviceStatusMonitor_activePairedDevicePairingID__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _activePairedDevice];
  uint64_t v2 = [v5 valueForProperty:*(void *)(*(void *)(a1 + 32) + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removeObserver:(id)a3
{
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__ICNanoPairedDeviceStatusMonitor_removeObserver___block_invoke;
  v5[3] = &unk_1E5ACCD30;
  v5[4] = self;
  v5[5] = a3;
  id v4 = a3;
  dispatch_async(queue, v5);
}

void __50__ICNanoPairedDeviceStatusMonitor_removeObserver___block_invoke(uint64_t a1)
{
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__ICNanoPairedDeviceStatusMonitor_addObserver___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __47__ICNanoPairedDeviceStatusMonitor_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  initialSyncStateObserver = self->_initialSyncStateObserver;
  self->_initialSyncStateObserver = 0;

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.nanoregistry.devicedidpair", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.nanoregistry.devicedidunpair", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.nanoregistry.paireddevicedidchangeversion", 0);
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v6 = getNRPairedDeviceRegistryDeviceDidBecomeActive();
  [v5 removeObserver:self name:v6 object:0];

  v7.receiver = self;
  v7.super_class = (Class)ICNanoPairedDeviceStatusMonitor;
  [(ICNanoPairedDeviceStatusMonitor *)&v7 dealloc];
}

- (id)_init
{
  v25.receiver = self;
  v25.super_class = (Class)ICNanoPairedDeviceStatusMonitor;
  uint64_t v2 = [(ICNanoPairedDeviceStatusMonitor *)&v25 init];
  if (!v2) {
    return v2;
  }
  uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.amp.iTunesCloud.ICNanoPairedDeviceStatusMonitor.queue", v3);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v4;

  id v6 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.amp.iTunesCloud.ICNanoPairedDeviceStatusMonitor.callBackQueue", v6);
  callBackQueue = v2->_callBackQueue;
  v2->_callBackQueue = (OS_dispatch_queue *)v7;

  uint64_t v9 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:5];
  observers = v2->_observers;
  v2->_observers = (NSMapTable *)v9;

  long long v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "HAS_PAIRED_SYNC", buf, 2u);
  }

  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  long long v12 = (id *)getNRDevicePropertyPairingIDSymbolLoc_ptr;
  uint64_t v34 = getNRDevicePropertyPairingIDSymbolLoc_ptr;
  if (!getNRDevicePropertyPairingIDSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __getNRDevicePropertyPairingIDSymbolLoc_block_invoke;
    uint64_t v29 = &unk_1E5ACD4F0;
    uint64_t v30 = &v31;
    id v13 = NanoRegistryLibrary();
    long long v14 = dlsym(v13, "NRDevicePropertyPairingID");
    *(void *)(v30[1] + 24) = v14;
    getNRDevicePropertyPairingIDSymbolLoc_ptr = *(void *)(v30[1] + 24);
    long long v12 = (id *)v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (v12)
  {
    objc_storeStrong((id *)&v2->_pairingIDPropertyName, *v12);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2050000000;
    uint64_t v16 = (void *)getPSYInitialSyncStateObserverClass_softClass;
    uint64_t v34 = getPSYInitialSyncStateObserverClass_softClass;
    if (!getPSYInitialSyncStateObserverClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      v28 = __getPSYInitialSyncStateObserverClass_block_invoke;
      uint64_t v29 = &unk_1E5ACD4F0;
      uint64_t v30 = &v31;
      __getPSYInitialSyncStateObserverClass_block_invoke((uint64_t)buf);
      uint64_t v16 = (void *)v32[3];
    }
    uint64_t v17 = v16;
    _Block_object_dispose(&v31, 8);
    uint64_t v18 = [[v17 alloc] initWithDelegate:v2];
    initialSyncStateObserver = v2->_initialSyncStateObserver;
    v2->_initialSyncStateObserver = (PSYInitialSyncStateObserver *)v18;

    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)HandleDeviceDidPairNotification, @"com.apple.nanoregistry.devicedidpair", 0, CFNotificationSuspensionBehaviorDrop);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)HandleDeviceDidUnPairNotification, @"com.apple.nanoregistry.devicedidunpair", 0, CFNotificationSuspensionBehaviorDrop);
    uint64_t v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v21 = getNRPairedDeviceRegistryDeviceDidBecomeActive();
    [v20 addObserver:v2 selector:sel_deviceBecameActive_ name:v21 object:0];

    return v2;
  }
  uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
  v24 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyPairingID(void)"];
  objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, @"ICNanoPairedDeviceStatusMonitor.m", 34, @"%s", dlerror());

  __break(1u);
  return result;
}

+ (ICNanoPairedDeviceStatusMonitor)sharedMonitor
{
  if (sharedMonitor_sOnceToken != -1) {
    dispatch_once(&sharedMonitor_sOnceToken, &__block_literal_global_7374);
  }
  uint64_t v2 = (void *)sharedMonitor_sSharedMonitor;

  return (ICNanoPairedDeviceStatusMonitor *)v2;
}

uint64_t __48__ICNanoPairedDeviceStatusMonitor_sharedMonitor__block_invoke()
{
  id v0 = [[ICNanoPairedDeviceStatusMonitor alloc] _init];
  uint64_t v1 = sharedMonitor_sSharedMonitor;
  sharedMonitor_sSharedMonitor = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end
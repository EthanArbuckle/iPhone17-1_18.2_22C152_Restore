@interface TIInputModeAssetStatusManager
+ (id)sharedManager;
- (BOOL)usesDummyFileDebugging;
- (NSMutableDictionary)inputModeToAssetStatusMap;
- (NSMutableSet)debuggingTimers;
- (NSMutableSet)listeners;
- (TIInputModeAssetStatusManager)init;
- (TILinguisticAssetDownloadClient)client;
- (id)addedInputModesForInputModes:(id)a3;
- (id)dummyFilePathForInputMode:(id)a3 assetStatus:(int64_t)a4;
- (id)inputModesCurrentlyInProgressOrAvailable;
- (id)inputModesToRemoveForInputModes:(id)a3;
- (id)normalizedInputModesForInputModes:(id)a3;
- (int64_t)assetStatusForInputMode:(id)a3;
- (void)addDebuggingTimerForInputMode:(id)a3 status:(int64_t)a4 duration:(double)a5;
- (void)addListener:(id)a3;
- (void)debuggingTimerFired:(id)a3;
- (void)lockAccessToAssetStatusMap;
- (void)refetchStatusForInputModesCurrentlyInProgressOrAvailable;
- (void)removeListener:(id)a3;
- (void)setClient:(id)a3;
- (void)setDebuggingTimers:(id)a3;
- (void)setInputModeToAssetStatusMap:(id)a3;
- (void)setListeners:(id)a3;
- (void)setUsesDummyFileDebugging:(BOOL)a3;
- (void)startDownloadingAssetsForInputMode:(id)a3;
- (void)startMonitoringAssetUpdateStatusForInputModes:(id)a3;
- (void)startMonitoringAssetUpdateStatusForInputModes:(id)a3 includeExisting:(BOOL)a4;
- (void)unlockAccessToAssetStatusMap;
- (void)updateAssetStatus:(int64_t)a3 forInputMode:(id)a4;
- (void)updateListenerOnMainThread:(id)a3 status:(int64_t)a4 inputModeName:(id)a5;
@end

@implementation TIInputModeAssetStatusManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debuggingTimers, 0);
  objc_storeStrong((id *)&self->_inputModeToAssetStatusMap, 0);
  objc_storeStrong((id *)&self->_listeners, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

- (void)setDebuggingTimers:(id)a3
{
}

- (void)setUsesDummyFileDebugging:(BOOL)a3
{
  self->_usesDummyFileDebugging = a3;
}

- (BOOL)usesDummyFileDebugging
{
  return self->_usesDummyFileDebugging;
}

- (void)setInputModeToAssetStatusMap:(id)a3
{
}

- (void)setListeners:(id)a3
{
}

- (void)setClient:(id)a3
{
}

- (void)startDownloadingAssetsForInputMode:(id)a3
{
  v4 = TIInputModeGetNormalizedIdentifier(a3);
  if (v4)
  {
    [(TIInputModeAssetStatusManager *)self updateAssetStatus:2 forInputMode:v4];
    if ([(TIInputModeAssetStatusManager *)self usesDummyFileDebugging])
    {
      [(TIInputModeAssetStatusManager *)self addDebuggingTimerForInputMode:v4 status:0 duration:10.0];
    }
    else
    {
      v5 = [(TIInputModeAssetStatusManager *)self client];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __68__TIInputModeAssetStatusManager_startDownloadingAssetsForInputMode___block_invoke;
      v6[3] = &unk_1E555A178;
      v6[4] = self;
      id v7 = v4;
      [v5 updateAssetForInputModeIdentifier:v7 callback:v6];
    }
  }
}

void __68__TIInputModeAssetStatusManager_startDownloadingAssetsForInputMode___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = 0;
    goto LABEL_10;
  }
  v6 = [v4 domain];
  if ([v6 isEqualToString:@"DDSAssetDownloadUIErrorDomain"])
  {
    uint64_t v7 = [v5 code];

    if (v7 == 3)
    {
      v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = 2;
      goto LABEL_10;
    }
  }
  else
  {
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = 136315650;
    v13 = "-[TIInputModeAssetStatusManager startDownloadingAssetsForInputMode:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_18D240000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Updating assets for %@ failed with error %@", (uint8_t *)&v12, 0x20u);
  }
  v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = 1;
LABEL_10:
  [v8 updateAssetStatus:v10 forInputMode:v9];
  [*(id *)(a1 + 32) refetchStatusForInputModesCurrentlyInProgressOrAvailable];
}

- (void)startMonitoringAssetUpdateStatusForInputModes:(id)a3
{
}

- (void)startMonitoringAssetUpdateStatusForInputModes:(id)a3 includeExisting:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(TIInputModeAssetStatusManager *)self normalizedInputModesForInputModes:a3];
  uint64_t v7 = [(TIInputModeAssetStatusManager *)self addedInputModesForInputModes:v6];
  v8 = [(TIInputModeAssetStatusManager *)self inputModesToRemoveForInputModes:v6];
  [(TIInputModeAssetStatusManager *)self lockAccessToAssetStatusMap];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v50 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v15 = [(TIInputModeAssetStatusManager *)self inputModeToAssetStatusMap];
        [v15 removeObjectForKey:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v11);
  }
  v31 = v9;

  [(TIInputModeAssetStatusManager *)self unlockAccessToAssetStatusMap];
  v32 = (void *)v7;
  v33 = (void *)v6;
  if (v4) {
    __int16 v16 = (void *)v6;
  }
  else {
    __int16 v16 = (void *)v7;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = v16;
  uint64_t v37 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v46;
    v34 = v40;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v46 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = v17;
        uint64_t v18 = *(void *)(*((void *)&v45 + 1) + 8 * v17);
        [(TIInputModeAssetStatusManager *)self lockAccessToAssetStatusMap];
        v19 = [(TIInputModeAssetStatusManager *)self inputModeToAssetStatusMap];
        v20 = [v19 objectForKeyedSubscript:v18];

        if (!v20)
        {
          v21 = [(TIInputModeAssetStatusManager *)self inputModeToAssetStatusMap];
          [v21 setObject:&unk_1EDC38678 forKeyedSubscript:v18];
        }
        [(TIInputModeAssetStatusManager *)self unlockAccessToAssetStatusMap];
        if ([(TIInputModeAssetStatusManager *)self usesDummyFileDebugging])
        {
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          uint64_t v22 = [&unk_1EDC28768 countByEnumeratingWithState:&v41 objects:v53 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v42;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v42 != v24) {
                  objc_enumerationMutation(&unk_1EDC28768);
                }
                v26 = *(void **)(*((void *)&v41 + 1) + 8 * j);
                v27 = [MEMORY[0x1E4F28CB8] defaultManager];
                v28 = -[TIInputModeAssetStatusManager dummyFilePathForInputMode:assetStatus:](self, "dummyFilePathForInputMode:assetStatus:", v18, [v26 unsignedIntegerValue]);
                int v29 = [v27 fileExistsAtPath:v28];

                if (v29) {
                  -[TIInputModeAssetStatusManager addDebuggingTimerForInputMode:status:duration:](self, "addDebuggingTimerForInputMode:status:duration:", v18, [v26 unsignedIntegerValue], 0.04);
                }
              }
              uint64_t v23 = [&unk_1EDC28768 countByEnumeratingWithState:&v41 objects:v53 count:16];
            }
            while (v23);
          }
        }
        else
        {
          v30 = [(TIInputModeAssetStatusManager *)self client];
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v40[0] = __95__TIInputModeAssetStatusManager_startMonitoringAssetUpdateStatusForInputModes_includeExisting___block_invoke;
          v40[1] = &unk_1E555A150;
          v40[2] = v18;
          v40[3] = self;
          [v30 fetchAssetUpdateStatusForInputModeIdentifier:v18 callback:v39];
        }
        uint64_t v17 = v38 + 1;
      }
      while (v38 + 1 != v37);
      uint64_t v37 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v37);
  }
}

void __95__TIInputModeAssetStatusManager_startMonitoringAssetUpdateStatusForInputModes_includeExisting___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315650;
      v8 = "-[TIInputModeAssetStatusManager startMonitoringAssetUpdateStatusForInputModes:includeExisting:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_18D240000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Fetching asset update status for %@ failed with error %@", (uint8_t *)&v7, 0x20u);
    }
  }
  else
  {
    [*(id *)(a1 + 40) updateAssetStatus:a2 forInputMode:*(void *)(a1 + 32)];
  }
}

- (int64_t)assetStatusForInputMode:(id)a3
{
  BOOL v4 = TIInputModeGetNormalizedIdentifier(a3);
  if (v4)
  {
    [(TIInputModeAssetStatusManager *)self lockAccessToAssetStatusMap];
    id v5 = [(TIInputModeAssetStatusManager *)self inputModeToAssetStatusMap];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];
    int64_t v7 = [v6 unsignedIntegerValue];

    [(TIInputModeAssetStatusManager *)self unlockAccessToAssetStatusMap];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  id v5 = [(TIInputModeAssetStatusManager *)self listeners];
  [v5 removeObject:v4];
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  id v5 = [(TIInputModeAssetStatusManager *)self listeners];
  [v5 addObject:v4];
}

- (void)refetchStatusForInputModesCurrentlyInProgressOrAvailable
{
  id v3 = [(TIInputModeAssetStatusManager *)self inputModesCurrentlyInProgressOrAvailable];
  [(TIInputModeAssetStatusManager *)self startMonitoringAssetUpdateStatusForInputModes:v3 includeExisting:1];
}

- (id)inputModesCurrentlyInProgressOrAvailable
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [(TIInputModeAssetStatusManager *)self lockAccessToAssetStatusMap];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(TIInputModeAssetStatusManager *)self inputModeToAssetStatusMap];
  id v5 = [v4 allKeys];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        __int16 v11 = [(TIInputModeAssetStatusManager *)self inputModeToAssetStatusMap];
        id v12 = [v11 objectForKeyedSubscript:v10];
        int v13 = [v12 unsignedIntValue];

        if ((v13 - 1) <= 1) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [(TIInputModeAssetStatusManager *)self unlockAccessToAssetStatusMap];

  return v3;
}

- (id)inputModesToRemoveForInputModes:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  [(TIInputModeAssetStatusManager *)self lockAccessToAssetStatusMap];
  uint64_t v6 = [(TIInputModeAssetStatusManager *)self inputModeToAssetStatusMap];
  uint64_t v7 = [v6 allKeys];

  [(TIInputModeAssetStatusManager *)self unlockAccessToAssetStatusMap];
  uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v8, "containsObject:", v14, (void)v16) & 1) == 0) {
          [v5 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v5;
}

- (id)addedInputModesForInputModes:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  [(TIInputModeAssetStatusManager *)self lockAccessToAssetStatusMap];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [(TIInputModeAssetStatusManager *)self inputModeToAssetStatusMap];
        int v13 = [v12 objectForKeyedSubscript:v11];

        if (!v13)
        {
          uint64_t v14 = [(TIInputModeAssetStatusManager *)self inputModeToAssetStatusMap];
          [v14 setObject:&unk_1EDC38678 forKeyedSubscript:v11];

          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  [(TIInputModeAssetStatusManager *)self unlockAccessToAssetStatusMap];

  return v5;
}

- (id)normalizedInputModesForInputModes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = TIInputModeGetNormalizedIdentifier(*(void **)(*((void *)&v12 + 1) + 8 * i));
        if (v10) {
          objc_msgSend(v4, "addObject:", v10, (void)v12);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)debuggingTimerFired:(id)a3
{
  id v7 = [a3 userInfo];
  id v4 = [v7 objectForKeyedSubscript:@"TIInputModeDebugging"];
  id v5 = [v7 objectForKeyedSubscript:@"TIInputModeAssetStatus"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  [(TIInputModeAssetStatusManager *)self updateAssetStatus:v6 forInputMode:v4];
}

- (void)addDebuggingTimerForInputMode:(id)a3 status:(int64_t)a4 duration:(double)a5
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = @"TIInputModeDebugging";
  v14[1] = @"TIInputModeAssetStatus";
  v15[0] = a3;
  uint64_t v8 = NSNumber;
  id v9 = a3;
  uint64_t v10 = [v8 numberWithInteger:a4];
  v15[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  long long v12 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_debuggingTimerFired_ selector:v11 userInfo:0 repeats:a5];

  long long v13 = [(TIInputModeAssetStatusManager *)self debuggingTimers];
  [v13 addObject:v12];
}

- (id)dummyFilePathForInputMode:(id)a3 assetStatus:(int64_t)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = TIInputModeGetNormalizedIdentifier(a3);
  uint64_t v6 = v5;
  if ((unint64_t)a4 <= 2)
  {
    uint64_t v7 = [v5 stringByAppendingString:off_1E555A198[a4]];

    uint64_t v6 = (void *)v7;
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F1CB10];
  v13[0] = @"/var/mobile/Library/Keyboard/";
  v13[1] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v10 = [v8 fileURLWithPathComponents:v9];
  uint64_t v11 = [v10 path];

  return v11;
}

- (void)updateAssetStatus:(int64_t)a3 forInputMode:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(TIInputModeAssetStatusManager *)self lockAccessToAssetStatusMap];
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  uint64_t v8 = [(TIInputModeAssetStatusManager *)self inputModeToAssetStatusMap];
  [v8 setObject:v7 forKeyedSubscript:v6];

  [(TIInputModeAssetStatusManager *)self unlockAccessToAssetStatusMap];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = [(TIInputModeAssetStatusManager *)self listeners];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [(TIInputModeAssetStatusManager *)self updateListenerOnMainThread:*(void *)(*((void *)&v14 + 1) + 8 * v13++) status:a3 inputModeName:v6];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)updateListenerOnMainThread:(id)a3 status:(int64_t)a4 inputModeName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  long long v15 = __81__TIInputModeAssetStatusManager_updateListenerOnMainThread_status_inputModeName___block_invoke;
  long long v16 = &unk_1E555A128;
  id v10 = v8;
  id v17 = v10;
  long long v18 = self;
  int64_t v20 = a4;
  id v11 = v9;
  id v19 = v11;
  uint64_t v12 = (void (**)(void))MEMORY[0x192F9B5E0](&v13);
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v13, v14, v15, v16)) {
    v12[2](v12);
  }
  else {
    TIDispatchSync(MEMORY[0x1E4F14428], v12);
  }
}

uint64_t __81__TIInputModeAssetStatusManager_updateListenerOnMainThread_status_inputModeName___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) manager:*(void *)(a1 + 40) didUpdateStatus:*(void *)(a1 + 56) forInputMode:*(void *)(a1 + 48)];
}

- (void)unlockAccessToAssetStatusMap
{
}

- (void)lockAccessToAssetStatusMap
{
}

- (NSMutableDictionary)inputModeToAssetStatusMap
{
  inputModeToAssetStatusMap = self->_inputModeToAssetStatusMap;
  if (!inputModeToAssetStatusMap)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = self->_inputModeToAssetStatusMap;
    self->_inputModeToAssetStatusMap = v4;

    inputModeToAssetStatusMap = self->_inputModeToAssetStatusMap;
  }

  return inputModeToAssetStatusMap;
}

- (NSMutableSet)debuggingTimers
{
  debuggingTimers = self->_debuggingTimers;
  if (!debuggingTimers)
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
    id v5 = self->_debuggingTimers;
    self->_debuggingTimers = v4;

    debuggingTimers = self->_debuggingTimers;
  }

  return debuggingTimers;
}

- (NSMutableSet)listeners
{
  listeners = self->_listeners;
  if (!listeners)
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
    id v5 = self->_listeners;
    self->_listeners = v4;

    listeners = self->_listeners;
  }

  return listeners;
}

- (TILinguisticAssetDownloadClient)client
{
  client = self->_client;
  if (!client)
  {
    id v4 = objc_alloc_init(TILinguisticAssetDownloadClient);
    id v5 = self->_client;
    self->_client = v4;

    client = self->_client;
  }

  return client;
}

- (TIInputModeAssetStatusManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)TIInputModeAssetStatusManager;
  result = [(TIInputModeAssetStatusManager *)&v3 init];
  if (result) {
    result->_assetStatusMapLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (id)sharedManager
{
  if (sharedManager___onceToken != -1) {
    dispatch_once(&sharedManager___onceToken, &__block_literal_global_9419);
  }
  v2 = (void *)sharedManager___sharedManager;

  return v2;
}

void __46__TIInputModeAssetStatusManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(TIInputModeAssetStatusManager);
  v1 = (void *)sharedManager___sharedManager;
  sharedManager___sharedManager = (uint64_t)v0;

  if (TIGetUseTestFilesForAssetDownloadingTestingValue_onceToken != -1) {
    dispatch_once(&TIGetUseTestFilesForAssetDownloadingTestingValue_onceToken, &__block_literal_global_104_9422);
  }
  v2 = +[TIPreferencesController sharedPreferencesController];
  id v4 = [v2 valueForPreferenceKey:@"UseTestFilesForAssetDownloadingTesting"];

  uint64_t v3 = [v4 BOOLValue];
  [(id)sharedManager___sharedManager setUsesDummyFileDebugging:v3];
}

@end
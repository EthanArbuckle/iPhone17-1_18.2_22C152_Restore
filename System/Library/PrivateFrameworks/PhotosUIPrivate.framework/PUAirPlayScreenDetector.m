@interface PUAirPlayScreenDetector
- (BOOL)shouldIgnoreScreen:(id)a3 displayInfo:(id)a4;
- (NSArray)availableScreens;
- (NSMutableDictionary)detectedScreensMap;
- (PUAirPlayScreenDetector)init;
- (PUAirPlayScreenReceiver)receiver;
- (SBSExternalDisplayService)externalDisplayService;
- (void)_createAirPlayScreenAndNotifyDelegate:(id)a3;
- (void)_enumerateAllScreensAndDisplayInfos:(id)a3;
- (void)_handleUpdatedDisplayInfo:(id)a3;
- (void)_performBlockWithDisplayInfoForScreen:(id)a3 handler:(id)a4;
- (void)_performBlockWithScreenForDisplayInfo:(id)a3 handler:(id)a4;
- (void)_removeAirPlayScreenAndNotifyDelegate:(id)a3;
- (void)_scanForAvailableScreens;
- (void)_sceneDidDisconnect:(id)a3;
- (void)_sceneWillConnect:(id)a3;
- (void)_setUpSceneNotifications;
- (void)externalDisplayDidUpdateProperties:(id)a3;
- (void)setReceiver:(id)a3;
@end

@implementation PUAirPlayScreenDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedScreensMap, 0);
  objc_storeStrong((id *)&self->_externalDisplayService, 0);
  objc_destroyWeak((id *)&self->_receiver);
}

- (NSMutableDictionary)detectedScreensMap
{
  return self->_detectedScreensMap;
}

- (SBSExternalDisplayService)externalDisplayService
{
  return self->_externalDisplayService;
}

- (void)setReceiver:(id)a3
{
}

- (PUAirPlayScreenReceiver)receiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
  return (PUAirPlayScreenReceiver *)WeakRetained;
}

- (void)externalDisplayDidUpdateProperties:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__PUAirPlayScreenDetector_externalDisplayDidUpdateProperties___block_invoke;
  v6[3] = &unk_1E5F2ECC8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __62__PUAirPlayScreenDetector_externalDisplayDidUpdateProperties___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleUpdatedDisplayInfo:*(void *)(a1 + 40)];
}

- (void)_sceneDidDisconnect:(id)a3
{
  id v11 = a3;
  id v4 = [v11 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [v11 object];
    id v7 = [v6 screen];
    detectedScreensMap = self->_detectedScreensMap;
    v9 = -[UIScreen pu_hardwareIdentifier](v7);
    v10 = [(NSMutableDictionary *)detectedScreensMap objectForKey:v9];

    [(PUAirPlayScreenDetector *)self _removeAirPlayScreenAndNotifyDelegate:v10];
  }
}

- (void)_sceneWillConnect:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v4 object];
    v8 = [v7 screen];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__PUAirPlayScreenDetector__sceneWillConnect___block_invoke;
    v9[3] = &unk_1E5F22FC0;
    v9[4] = self;
    [(PUAirPlayScreenDetector *)self _performBlockWithDisplayInfoForScreen:v8 handler:v9];
  }
}

void __45__PUAirPlayScreenDetector__sceneWillConnect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldIgnoreScreen:displayInfo:") & 1) == 0) {
    [*(id *)(a1 + 32) _createAirPlayScreenAndNotifyDelegate:v3];
  }
}

- (void)_setUpSceneNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__sceneWillConnect_ name:*MEMORY[0x1E4FB2EA0] object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__sceneDidDisconnect_ name:*MEMORY[0x1E4FB2E88] object:0];
}

- (void)_enumerateAllScreensAndDisplayInfos:(id)a3
{
  id v4 = a3;
  externalDisplayService = self->_externalDisplayService;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PUAirPlayScreenDetector__enumerateAllScreensAndDisplayInfos___block_invoke;
  v7[3] = &unk_1E5F2B760;
  id v8 = v4;
  id v6 = v4;
  [(SBSExternalDisplayService *)externalDisplayService getConnectedDisplayInfoWithCompletionHandler:v7];
}

void __63__PUAirPlayScreenDetector__enumerateAllScreensAndDisplayInfos___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__PUAirPlayScreenDetector__enumerateAllScreensAndDisplayInfos___block_invoke_2;
  v5[3] = &unk_1E5F2EA60;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __63__PUAirPlayScreenDetector__enumerateAllScreensAndDisplayInfos___block_invoke_2(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v5 = [v4 connectedScenes];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [v11 screen];
          v13 = -[UIScreen pu_hardwareIdentifier](v12);
          [v2 setObject:v12 forKey:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v8);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v14 = *(id *)(a1 + 32);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v40;
    *(void *)&long long v16 = 138412290;
    long long v34 = v16;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(v14);
        }
        v20 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        v21 = objc_msgSend(v20, "identifier", v34);

        if (v21)
        {
          v22 = [v20 identifier];
          [v3 setObject:v20 forKey:v22];
        }
        else
        {
          v22 = PLAirPlayGetLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v34;
            v49 = v20;
            _os_log_fault_impl(&dword_1AE9F8000, v22, OS_LOG_TYPE_FAULT, "SBSConnectedDisplayInfo had a nil identifier: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v17 = [v14 countByEnumeratingWithState:&v39 objects:v50 count:16];
    }
    while (v17);
  }

  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v24 = [v2 allKeys];
  [v23 addObjectsFromArray:v24];

  v25 = [v3 allKeys];
  [v23 addObjectsFromArray:v25];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v26 = v23;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v36 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v35 + 1) + 8 * k);
        v32 = [v2 objectForKey:v31];
        v33 = [v3 objectForKey:v31];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v28);
  }
}

- (void)_performBlockWithScreenForDisplayInfo:(id)a3 handler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v5 = (void (**)(id, void *, id))a4;
  id v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v7 = [v6 connectedScenes];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v13;
          uint64_t v15 = [v14 screen];
          long long v16 = -[UIScreen pu_hardwareIdentifier](v15);
          uint64_t v17 = [v19 identifier];
          int v18 = [v16 isEqualToString:v17];

          if (v18)
          {

            goto LABEL_14;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = 0;
  }
LABEL_14:

  v5[2](v5, v15, v19);
}

- (void)_performBlockWithDisplayInfoForScreen:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = -[UIScreen pu_hardwareIdentifier](v6);
    externalDisplayService = self->_externalDisplayService;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__PUAirPlayScreenDetector__performBlockWithDisplayInfoForScreen_handler___block_invoke;
    v11[3] = &unk_1E5F22FE8;
    id v12 = v8;
    id v14 = v7;
    id v13 = v6;
    id v10 = v8;
    [(SBSExternalDisplayService *)externalDisplayService getConnectedDisplayInfoWithCompletionHandler:v11];
  }
}

void __73__PUAirPlayScreenDetector__performBlockWithDisplayInfoForScreen_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a2;
  id v4 = (id)[v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v8 = [v7 identifier];
        int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

        if (v9)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PUAirPlayScreenDetector__performBlockWithDisplayInfoForScreen_handler___block_invoke_2;
  block[3] = &unk_1E5F2EBC8;
  id v14 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 40);
  id v13 = v4;
  id v10 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__PUAirPlayScreenDetector__performBlockWithDisplayInfoForScreen_handler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_removeAirPlayScreenAndNotifyDelegate:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [v4 screen];
    -[UIScreen pu_hardwareIdentifier](v5);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    [(NSMutableDictionary *)self->_detectedScreensMap removeObjectForKey:v7];
    id v6 = [(PUAirPlayScreenDetector *)self receiver];
    [v6 screenDetector:self didLoseScreen:v4];
  }
}

- (void)_createAirPlayScreenAndNotifyDelegate:(id)a3
{
  id v4 = a3;
  -[UIScreen pu_hardwareIdentifier](v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [[PUAirPlayScreen alloc] initWithScreen:v4];

  [(NSMutableDictionary *)self->_detectedScreensMap setObject:v5 forKey:v7];
  id v6 = [(PUAirPlayScreenDetector *)self receiver];
  [v6 screenDetector:self didDetectScreen:v5];
}

- (void)_handleUpdatedDisplayInfo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PLAirPlayGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 identifier];
    *(_DWORD *)buf = 138543362;
    id v14 = v6;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_INFO, "Received update info for screen: %{public}@", buf, 0xCu);
  }
  detectedScreensMap = self->_detectedScreensMap;
  id v8 = [v4 identifier];
  int v9 = [(NSMutableDictionary *)detectedScreensMap objectForKey:v8];

  if (v9)
  {
    id v10 = [v9 screen];
    BOOL v11 = [(PUAirPlayScreenDetector *)self shouldIgnoreScreen:v10 displayInfo:v4];

    if (v11) {
      [(PUAirPlayScreenDetector *)self _removeAirPlayScreenAndNotifyDelegate:v9];
    }
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__PUAirPlayScreenDetector__handleUpdatedDisplayInfo___block_invoke;
    v12[3] = &unk_1E5F22FC0;
    v12[4] = self;
    [(PUAirPlayScreenDetector *)self _performBlockWithScreenForDisplayInfo:v4 handler:v12];
  }
}

void __53__PUAirPlayScreenDetector__handleUpdatedDisplayInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6 && ([*(id *)(a1 + 32) shouldIgnoreScreen:v6 displayInfo:v5] & 1) == 0) {
    [*(id *)(a1 + 32) _createAirPlayScreenAndNotifyDelegate:v6];
  }
}

- (void)_scanForAvailableScreens
{
  id v3 = PLAirPlayGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "Scanning for available AirPlay screens.", buf, 2u);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PUAirPlayScreenDetector__scanForAvailableScreens__block_invoke;
  v4[3] = &unk_1E5F22FC0;
  v4[4] = self;
  [(PUAirPlayScreenDetector *)self _enumerateAllScreensAndDisplayInfos:v4];
}

void __51__PUAirPlayScreenDetector__scanForAvailableScreens__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && ([*(id *)(a1 + 32) shouldIgnoreScreen:v5 displayInfo:v6] & 1) == 0)
  {
    id v7 = -[UIScreen pu_hardwareIdentifier](v5);
    id v8 = PLAirPlayGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      BOOL v11 = v7;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "Found AirPlay screen: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    int v9 = [[PUAirPlayScreen alloc] initWithScreen:v5];
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v9 forKey:v7];
  }
}

- (BOOL)shouldIgnoreScreen:(id)a3 displayInfo:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 3)
  {
    int v9 = PLAirPlayGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = -[UIScreen pu_hardwareIdentifier](v5);
      int v21 = 138543362;
      long long v22 = v10;
      BOOL v11 = "Ignoring CarPlay screen: %{public}@";
LABEL_17:
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v21, 0xCu);

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  uint64_t v12 = [v5 displayConfiguration];
  int v13 = [v12 isMainDisplay];

  if (v13)
  {
    int v9 = PLAirPlayGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = -[UIScreen pu_hardwareIdentifier](v5);
      int v21 = 138543362;
      long long v22 = v10;
      BOOL v11 = "Ignoring main screen: %{public}@";
      goto LABEL_17;
    }
LABEL_18:

    BOOL v19 = 1;
    goto LABEL_19;
  }
  if ((PLIsCamera() & 1) != 0 || PLIsPhotosApp())
  {
    id v14 = [v5 displayConfiguration];
    uint64_t v15 = [v14 name];
    long long v16 = [MEMORY[0x1E4F39B60] TVOutDisplay];
    long long v17 = [v16 name];
    int v18 = [v15 isEqualToString:v17];

    if (v18)
    {
      int v9 = PLAirPlayGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = -[UIScreen pu_hardwareIdentifier](v5);
        int v21 = 138543362;
        long long v22 = v10;
        BOOL v11 = "Ignoring TVOut screen: %{public}@";
        goto LABEL_17;
      }
      goto LABEL_18;
    }
  }
  if (v6 && ([v6 isMirrored] & 1) == 0)
  {
    int v9 = PLAirPlayGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = -[UIScreen pu_hardwareIdentifier](v5);
      int v21 = 138543362;
      long long v22 = v10;
      BOOL v11 = "Ignoring non-mirrored screen: %{public}@";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  BOOL v19 = 0;
LABEL_19:

  return v19;
}

- (NSArray)availableScreens
{
  id v2 = [(NSMutableDictionary *)self->_detectedScreensMap objectEnumerator];
  id v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (PUAirPlayScreenDetector)init
{
  v8.receiver = self;
  v8.super_class = (Class)PUAirPlayScreenDetector;
  id v2 = [(PUAirPlayScreenDetector *)&v8 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    detectedScreensMap = v2->_detectedScreensMap;
    v2->_detectedScreensMap = v3;

    id v5 = (SBSExternalDisplayService *)objc_alloc_init(MEMORY[0x1E4FA6A80]);
    externalDisplayService = v2->_externalDisplayService;
    v2->_externalDisplayService = v5;

    [(SBSExternalDisplayService *)v2->_externalDisplayService addObserver:v2];
    [(PUAirPlayScreenDetector *)v2 _setUpSceneNotifications];
    [(PUAirPlayScreenDetector *)v2 _scanForAvailableScreens];
  }
  return v2;
}

@end
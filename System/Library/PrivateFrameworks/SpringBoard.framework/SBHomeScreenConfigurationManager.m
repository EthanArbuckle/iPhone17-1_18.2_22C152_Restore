@interface SBHomeScreenConfigurationManager
- (SBHomeScreenConfigurationManager)init;
- (id)focusModeManager;
- (id)iconForApp:(void *)a3 iconModel:(void *)a4 rootFolder:;
- (id)iconForItem:(void *)a3 iconModel:(void *)a4 rootFolder:;
- (void)applyDockItems:(void *)a3 toFocusMode:(void *)a4 iconModel:(void *)a5 rootFolder:;
- (void)applyHomeScreenItems:(void *)a3 toFocusMode:(void *)a4 iconModel:(void *)a5 rootFolder:;
- (void)configurationServer:(id)a3 didReceiveConfiguration:(id)a4 completion:(id)a5;
- (void)configurationServerDidBeginConfigurationSession:(id)a3 completion:(id)a4;
- (void)configurationServerDidEndConfigurationSession:(id)a3 completion:(id)a4;
- (void)iconModelDidLayout:(uint64_t)a1;
- (void)teardownFocusMode:(void *)a3 rootFolder:;
- (void)updateHomeScreenWithConfiguration:(void *)a3 completion:;
@end

@implementation SBHomeScreenConfigurationManager

- (SBHomeScreenConfigurationManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)SBHomeScreenConfigurationManager;
  v2 = [(SBHomeScreenConfigurationManager *)&v13 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    server = v2->_server;
    v2->_server = (SBHomeScreenConfigurationServer *)v3;

    -[SBHomeScreenConfigurationServer setDelegate:]((id *)&v2->_server->super.isa, v2);
    -[SBHomeScreenConfigurationServer activate]((uint64_t)v2->_server);
    objc_initWeak(&location, v2);
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v6 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v7 = *MEMORY[0x1E4FA66F0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__SBHomeScreenConfigurationManager_init__block_invoke;
    v10[3] = &unk_1E6B01728;
    objc_copyWeak(&v11, &location);
    id v8 = (id)[v5 addObserverForName:v7 object:0 queue:v6 usingBlock:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __40__SBHomeScreenConfigurationManager_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  -[SBHomeScreenConfigurationManager iconModelDidLayout:]((uint64_t)WeakRetained);
}

- (void)iconModelDidLayout:(uint64_t)a1
{
  if (a1 && *(void *)(a1 + 16))
  {
    v2 = SBLogHomeScreenConfiguration();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Updating installed focus mode because icon model laid out", v3, 2u);
    }

    -[SBHomeScreenConfigurationManager updateHomeScreenWithConfiguration:completion:](a1, *(void **)(a1 + 16), &__block_literal_global_199);
  }
}

void __55__SBHomeScreenConfigurationManager_iconModelDidLayout___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = SBLogHomeScreenConfiguration();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __55__SBHomeScreenConfigurationManager_iconModelDidLayout___block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
}

- (void)updateHomeScreenWithConfiguration:(void *)a3 completion:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = a3;
  if (a1)
  {
    BSDispatchQueueAssertMain();
    uint64_t v7 = +[SBIconController sharedInstance];
    id v8 = [v7 rootFolder];

    v9 = [v8 model];
    if (v9)
    {
      id v10 = *(id *)(a1 + 24);
      if (v10) {
        -[SBHomeScreenConfigurationManager teardownFocusMode:rootFolder:](a1, v10, v8);
      }
      if (v5)
      {
        id v11 = NSString;
        v12 = [MEMORY[0x1E4F29128] UUID];
        objc_super v13 = [v12 UUIDString];
        uint64_t v14 = [v11 stringWithFormat:@"com.apple.SpringBoard.HomeScreenConfigurationService.configuration.%@", v13];

        v24 = (void *)v14;
        v15 = (void *)[objc_alloc(MEMORY[0x1E4FA6268]) initWithIdentifier:v14 folder:v8];
        objc_storeStrong((id *)(a1 + 24), v15);
        v16 = [v5 layout];
        v17 = [v16 dockItems];
        if (v17) {
          -[SBHomeScreenConfigurationManager applyDockItems:toFocusMode:iconModel:rootFolder:](a1, v17, v15, v9, v8);
        }
        v18 = [v16 items];
        -[SBHomeScreenConfigurationManager applyHomeScreenItems:toFocusMode:iconModel:rootFolder:](a1, v18, v15, v9, v8);

        v19 = -[SBHomeScreenConfigurationManager focusModeManager](a1);
        [v19 donateFocusMode:v15 fromSource:2];

        v20 = SBLogHomeScreenConfiguration();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v24;
          _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "Installed focus mode with ID: %@", buf, 0xCu);
        }
      }
      else
      {
        v22 = -[SBHomeScreenConfigurationManager focusModeManager](a1);
        [v22 donateFocusMode:0 fromSource:2];

        v23 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = 0;
      }
      v6[2](v6, 0);
    }
    else
    {
      v21 = SBLogHomeScreenConfiguration();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[SBHomeScreenConfigurationManager updateHomeScreenWithConfiguration:completion:](v21);
      }

      v6[2](v6, 0);
    }
  }
}

- (void)configurationServerDidBeginConfigurationSession:(id)a3 completion:(id)a4
{
  v4 = (void (**)(id, void))a4;
  id v5 = SBLogHomeScreenConfiguration();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Beginning configuration session", v6, 2u);
  }

  v4[2](v4, 0);
}

- (void)configurationServer:(id)a3 didReceiveConfiguration:(id)a4 completion:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a5;
  id v8 = SBLogHomeScreenConfiguration();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v6;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Received configuration %{public}@", buf, 0xCu);
  }

  id v11 = v6;
  id v9 = v7;
  id v10 = v6;
  BSDispatchMain();
}

void __91__SBHomeScreenConfigurationManager_configurationServer_didReceiveConfiguration_completion___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  -[SBHomeScreenConfigurationManager updateHomeScreenWithConfiguration:completion:](v2, v3, v4);
}

- (void)configurationServerDidEndConfigurationSession:(id)a3 completion:(id)a4
{
  id v4 = a4;
  id v5 = SBLogHomeScreenConfiguration();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Ending configuration session", buf, 2u);
  }

  id v6 = v4;
  BSDispatchMain();
}

void __93__SBHomeScreenConfigurationManager_configurationServerDidEndConfigurationSession_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  -[SBHomeScreenConfigurationManager updateHomeScreenWithConfiguration:completion:](v4, 0, v5);
}

- (void)teardownFocusMode:(void *)a3 rootFolder:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = SBLogHomeScreenConfiguration();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v5 identifier];
      *(_DWORD *)buf = 138412290;
      v25 = v8;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Tearing down focus mode with ID: %@", buf, 0xCu);
    }
    id v9 = [v5 lists];
    id v10 = (void *)[v9 copy];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          objc_msgSend(v16, "removeAllIcons", (void)v19);
          [v5 removeFromList:v16];
          [v6 removeList:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    v17 = [v5 dockList];
    v18 = v17;
    if (v17)
    {
      [v17 removeAllIcons];
      [v5 setDockList:0];
    }
  }
}

- (id)focusModeManager
{
  if (a1)
  {
    v1 = +[SBIconController sharedInstance];
    uint64_t v2 = [v1 iconManager];
    id v3 = [v2 focusModeManager];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)applyDockItems:(void *)a3 toFocusMode:(void *)a4 iconModel:(void *)a5 rootFolder:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    uint64_t v13 = [v10 dockList];
    if (!v13)
    {
      uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA6400]), "initWithFolder:maxIconCount:", v12, objc_msgSend(v11, "maxIconCountForDock"));
      [v10 setDockList:v13];
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __84__SBHomeScreenConfigurationManager_applyDockItems_toFocusMode_iconModel_rootFolder___block_invoke;
    v15[3] = &unk_1E6B04A10;
    v15[4] = a1;
    id v16 = v11;
    id v17 = v12;
    uint64_t v14 = objc_msgSend(v9, "bs_compactMap:", v15);
    [v13 setIcons:v14];
  }
}

- (void)applyHomeScreenItems:(void *)a3 toFocusMode:(void *)a4 iconModel:(void *)a5 rootFolder:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    v32 = [v10 lists];
    uint64_t v13 = objc_msgSend(v32, "bs_reverse");
    uint64_t v14 = (void *)[v13 mutableCopy];

    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __90__SBHomeScreenConfigurationManager_applyHomeScreenItems_toFocusMode_iconModel_rootFolder___block_invoke;
    v38[3] = &unk_1E6B04A10;
    v38[4] = a1;
    id v39 = v11;
    id v15 = v12;
    id v40 = v15;
    id v16 = objc_msgSend(v9, "bs_compactMap:", v38);
    if ([v16 count])
    {
      do
      {
        uint64_t v17 = [v14 lastObject];
        if (v17)
        {
          v18 = (void *)v17;
          [v14 removeLastObject];
        }
        else
        {
          v18 = [v15 addEmptyList];
          [v18 setHidden:1];
          [v10 addToList:v18];
        }
        long long v19 = [v18 setIcons:v16 gridCellInfoOptions:0];

        id v16 = v19;
      }
      while ([v19 count]);
    }
    else
    {
      long long v19 = v16;
    }
    id v33 = v12;
    id v20 = v9;
    long long v21 = SBLogHomeScreenConfiguration();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      long long v22 = [v10 lists];
      uint64_t v23 = [v22 count];
      uint64_t v24 = v23 - [v14 count];
      uint64_t v25 = [v14 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v43 = v24;
      __int16 v44 = 2048;
      uint64_t v45 = v25;
      _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "Finished configuring %ld pages, %ld unused pages will be deleted", buf, 0x16u);
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v26 = v14;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          [v10 removeFromList:v31];
          [v15 removeList:v31];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v28);
    }

    id v9 = v20;
    id v12 = v33;
  }
}

id __84__SBHomeScreenConfigurationManager_applyDockItems_toFocusMode_iconModel_rootFolder___block_invoke(void **a1, void *a2)
{
  return -[SBHomeScreenConfigurationManager iconForItem:iconModel:rootFolder:](a1[4], a2, a1[5], a1[6]);
}

- (id)iconForItem:(void *)a3 iconModel:(void *)a4 rootFolder:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    if ([v7 kind] == 1)
    {
      a1 = -[SBHomeScreenConfigurationManager iconForApp:iconModel:rootFolder:]((uint64_t)a1, v7, v8, v9);
    }
    else
    {
      id v10 = SBLogHomeScreenConfiguration();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SBHomeScreenConfigurationManager iconForItem:iconModel:rootFolder:]((uint64_t)v7, v10);
      }

      a1 = 0;
    }
  }

  return a1;
}

id __90__SBHomeScreenConfigurationManager_applyHomeScreenItems_toFocusMode_iconModel_rootFolder___block_invoke(void **a1, void *a2)
{
  return -[SBHomeScreenConfigurationManager iconForItem:iconModel:rootFolder:](a1[4], a2, a1[5], a1[6]);
}

- (id)iconForApp:(void *)a3 iconModel:(void *)a4 rootFolder:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    id v9 = [a2 bundleIdentifier];
    id v10 = SBLogHomeScreenConfiguration();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      v18 = v9;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Creating icon for app with bundle identifier: %{public}@", (uint8_t *)&v17, 0xCu);
    }

    id v11 = [v7 applicationIconForBundleIdentifier:v9];
    if (v11)
    {
      id v12 = [v8 indexPathForIcon:v11 includingPlaceholders:0];

      if (v12)
      {
        id v13 = [v7 addAdditionalIconMatchingIcon:v11];
      }
      else
      {
        id v13 = v11;
      }
      id v15 = v13;
    }
    else
    {
      uint64_t v14 = SBLogHomeScreenConfiguration();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[SBHomeScreenConfigurationManager iconForApp:iconModel:rootFolder:]((uint64_t)v9, v14);
      }

      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFocusMode, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

void __55__SBHomeScreenConfigurationManager_iconModelDidLayout___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "An error occurred updating the installed focus mode: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)updateHomeScreenWithConfiguration:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Failed to construct focus mode from configuration: icon model was nil", v1, 2u);
}

- (void)iconForItem:(uint64_t)a1 iconModel:(NSObject *)a2 rootFolder:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Unsupported home screen item type: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)iconForApp:(uint64_t)a1 iconModel:(NSObject *)a2 rootFolder:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_FAULT, "Unable to create app icon for suggested bundle identifier: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
@interface SFExtensionsProfilesDataSource
- (NSDictionary)profileServerIDToContentBlockerManagers;
- (NSDictionary)profileServerIDToWebExtensionsControllers;
- (SFExtensionsProfilesDataSource)initWithTabGroupManager:(id)a3;
- (WBTabGroupManager)tabGroupManager;
@end

@implementation SFExtensionsProfilesDataSource

- (SFExtensionsProfilesDataSource)initWithTabGroupManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFExtensionsProfilesDataSource;
  v6 = [(SFExtensionsProfilesDataSource *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tabGroupManager, a3);
    v8 = v7;
  }

  return v7;
}

- (NSDictionary)profileServerIDToWebExtensionsControllers
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = -[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers;
  if (!-[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    v4 = (void *)-[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers;
    -[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers = v3;

    id v5 = [SFWebExtensionsController alloc];
    uint64_t v6 = *MEMORY[0x1E4F980C8];
    v7 = [(WBSExtensionsController *)v5 initWithProfileServerID:*MEMORY[0x1E4F980C8] userContentController:0 forceExtensionLoadingAfterDiscovery:1];
    sharedProfileDelegate = self->_sharedProfileDelegate;
    if (!sharedProfileDelegate)
    {
      v9 = [[SFSafariProfileDelegate alloc] initWithDataSource:self];
      objc_super v10 = self->_sharedProfileDelegate;
      self->_sharedProfileDelegate = v9;

      sharedProfileDelegate = self->_sharedProfileDelegate;
    }
    [(SFWebExtensionsController *)v7 setProfileDelegate:sharedProfileDelegate];
    [(id)-[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers setObject:v7 forKeyedSubscript:v6];
    [(WBSExtensionsController *)v7 findExtensions];
    v11 = [MEMORY[0x1E4F98A18] sharedManager];
    [v11 addProvider:v7];
  }
  v12 = [(WBTabGroupManager *)self->_tabGroupManager profiles];
  v13 = objc_msgSend(v12, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_9);

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = (id)[(id)-[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers copy];
  char v14 = 0;
  uint64_t v15 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        if (([v13 containsObject:v18] & 1) == 0)
        {
          v19 = [(id)-[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers objectForKeyedSubscript:v18];
          if (v19)
          {
            v20 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138477827;
              uint64_t v49 = v18;
              _os_log_impl(&dword_18C354000, v20, OS_LOG_TYPE_INFO, "Deleting web extension state for profile with server ID %{private}@", buf, 0xCu);
            }
            [v19 unloadAndDeleteStateForAllExtensions];
            v21 = [MEMORY[0x1E4F98A18] sharedManager];
            [v21 removeProvider:v19];

            [(id)-[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers removeObjectForKey:v18];
            char v14 = 1;
          }
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v15);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v22 = v13;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v40 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = *(void *)(*((void *)&v39 + 1) + 8 * j);
        v27 = [(id)-[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers objectForKeyedSubscript:v26];
        BOOL v28 = v27 == 0;

        if (v28)
        {
          v29 = [(WBSExtensionsController *)[SFWebExtensionsController alloc] initWithProfileServerID:v26 userContentController:0 forceExtensionLoadingAfterDiscovery:1];
          v30 = self->_sharedProfileDelegate;
          if (!v30)
          {
            v31 = [[SFSafariProfileDelegate alloc] initWithDataSource:self];
            v32 = self->_sharedProfileDelegate;
            self->_sharedProfileDelegate = v31;

            v30 = self->_sharedProfileDelegate;
          }
          [(SFWebExtensionsController *)v29 setProfileDelegate:v30];
          [(id)-[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers setObject:v29 forKeyedSubscript:v26];
          [(WBSExtensionsController *)v29 findExtensions];
          v33 = [MEMORY[0x1E4F98A18] sharedManager];
          [v33 addProvider:v29];

          char v14 = 1;
        }
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v23);
  }

  if (((v37 != 0) & v14) == 1)
  {
    v34 = [MEMORY[0x1E4F98A18] sharedManager];
    [v34 localExtensionStateDidChange];
  }
  v35 = (void *)[(id)-[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers copy];

  return (NSDictionary *)v35;
}

id __75__SFExtensionsProfilesDataSource_profileServerIDToWebExtensionsControllers__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifierForExtensions];

  return v2;
}

- (NSDictionary)profileServerIDToContentBlockerManagers
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v41 = -[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers;
  if (!-[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    v4 = (void *)-[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers;
    -[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers = v3;

    id v5 = objc_alloc((Class)getSFContentBlockerManagerClass());
    uint64_t v6 = [(SFExtensionsProfilesDataSource *)self profileServerIDToWebExtensionsControllers];
    uint64_t v7 = *MEMORY[0x1E4F980C8];
    v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F980C8]];
    v9 = (void *)[v5 initWithUserContentController:0 webExtensionsController:v8];

    sharedProfileDelegate = self->_sharedProfileDelegate;
    if (!sharedProfileDelegate)
    {
      v11 = [[SFSafariProfileDelegate alloc] initWithDataSource:self];
      v12 = self->_sharedProfileDelegate;
      self->_sharedProfileDelegate = v11;

      sharedProfileDelegate = self->_sharedProfileDelegate;
    }
    [v9 setDelegate:sharedProfileDelegate];
    [(id)-[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers setObject:v9 forKeyedSubscript:v7];
    v13 = [MEMORY[0x1E4F98A18] sharedManager];
    [v13 addProvider:v9];
  }
  char v14 = [(WBTabGroupManager *)self->_tabGroupManager profiles];
  uint64_t v15 = objc_msgSend(v14, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_5_0);

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = (id)[(id)-[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers copy];
  char v16 = 0;
  uint64_t v17 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        if (([v15 containsObject:v20] & 1) == 0)
        {
          v21 = [(id)-[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers objectForKeyedSubscript:v20];
          if (v21)
          {
            id v22 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138477827;
              uint64_t v54 = v20;
              _os_log_impl(&dword_18C354000, v22, OS_LOG_TYPE_INFO, "Deleting content blocker state for profile with server ID %{private}@", buf, 0xCu);
            }
            [v21 unloadAndDeleteStateForAllExtensions];
            uint64_t v23 = [MEMORY[0x1E4F98A18] sharedManager];
            [v23 removeProvider:v21];

            [(id)-[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers removeObjectForKey:v20];
            char v16 = 1;
          }
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v17);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v42 = v15;
  uint64_t v24 = [v42 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v45 != v25) {
          objc_enumerationMutation(v42);
        }
        uint64_t v27 = *(void *)(*((void *)&v44 + 1) + 8 * j);
        BOOL v28 = [(id)-[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers objectForKeyedSubscript:v27];
        BOOL v29 = v28 == 0;

        if (v29)
        {
          id v30 = objc_alloc((Class)getSFContentBlockerManagerClass());
          v31 = [(SFExtensionsProfilesDataSource *)self profileServerIDToWebExtensionsControllers];
          v32 = [v31 objectForKeyedSubscript:v27];
          v33 = (void *)[v30 initWithUserContentController:0 webExtensionsController:v32];

          v34 = self->_sharedProfileDelegate;
          if (!v34)
          {
            v35 = [[SFSafariProfileDelegate alloc] initWithDataSource:self];
            v36 = self->_sharedProfileDelegate;
            self->_sharedProfileDelegate = v35;

            v34 = self->_sharedProfileDelegate;
          }
          [v33 setDelegate:v34];
          [(id)-[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers setObject:v33 forKeyedSubscript:v27];
          uint64_t v37 = [MEMORY[0x1E4F98A18] sharedManager];
          [v37 addProvider:v33];

          char v16 = 1;
        }
      }
      uint64_t v24 = [v42 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v24);
  }

  if (((v41 != 0) & v16) == 1)
  {
    v38 = [MEMORY[0x1E4F98A18] sharedManager];
    [v38 localExtensionStateDidChange];
  }
  long long v39 = (void *)[(id)-[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers copy];

  return (NSDictionary *)v39;
}

id __73__SFExtensionsProfilesDataSource_profileServerIDToContentBlockerManagers__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifierForExtensions];

  return v2;
}

- (WBTabGroupManager)tabGroupManager
{
  return self->_tabGroupManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabGroupManager, 0);

  objc_storeStrong((id *)&self->_sharedProfileDelegate, 0);
}

@end
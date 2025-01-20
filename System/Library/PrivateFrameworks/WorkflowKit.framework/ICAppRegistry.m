@interface ICAppRegistry
+ (id)bundleIdentifierForLegacyAppIdentifier:(id)a3;
+ (id)legacyAppIdentifierForBundleIdentifier:(id)a3;
+ (id)sharedRegistry;
- (BOOL)isFilled;
- (BOOL)refreshesInBackground;
- (ICApp)currentApp;
- (ICAppRegistry)initWithBackgroundRefresh:(BOOL)a3;
- (NSArray)allActions;
- (NSArray)apps;
- (NSDictionary)actions;
- (NSDictionary)appsDictionary;
- (NSLock)observersLock;
- (NSLock)registryLock;
- (NSMutableDictionary)observersByIdentifier;
- (id)_appsWithIdentifiers:(id)a3;
- (id)actionsWithIdentifiers:(id)a3;
- (id)appWithBundleIdentifier:(id)a3;
- (id)appWithIdentifier:(id)a3;
- (id)appWithURLScheme:(id)a3;
- (id)appsWithIdentifiers:(id)a3;
- (id)description;
- (int)urlTypesToken;
- (void)addInstallStatusObserver:(id)a3 forAppIdentifiers:(id)a4;
- (void)dealloc;
- (void)fillRegistry;
- (void)refreshInstalledApps;
- (void)removeInstallStatusObserver:(id)a3 forAppIdentifiers:(id)a4;
- (void)setActions:(id)a3;
- (void)setAppsDictionary:(id)a3;
- (void)setObserversByIdentifier:(id)a3;
- (void)setObserversLock:(id)a3;
- (void)setRefreshesInBackground:(BOOL)a3;
- (void)setRegistryLock:(id)a3;
- (void)setUrlTypesToken:(int)a3;
- (void)updateRegistry;
@end

@implementation ICAppRegistry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersByIdentifier, 0);
  objc_storeStrong((id *)&self->_observersLock, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_appsDictionary, 0);
  objc_storeStrong((id *)&self->_registryLock, 0);
  objc_storeStrong((id *)&self->_currentApp, 0);
}

- (void)setUrlTypesToken:(int)a3
{
  self->_urlTypesToken = a3;
}

- (int)urlTypesToken
{
  return self->_urlTypesToken;
}

- (void)setObserversByIdentifier:(id)a3
{
}

- (NSMutableDictionary)observersByIdentifier
{
  return self->_observersByIdentifier;
}

- (void)setObserversLock:(id)a3
{
}

- (NSLock)observersLock
{
  return self->_observersLock;
}

- (void)setActions:(id)a3
{
}

- (void)setAppsDictionary:(id)a3
{
}

- (void)setRegistryLock:(id)a3
{
}

- (NSLock)registryLock
{
  return self->_registryLock;
}

- (void)setRefreshesInBackground:(BOOL)a3
{
  self->_refreshesInBackground = a3;
}

- (BOOL)refreshesInBackground
{
  return self->_refreshesInBackground;
}

- (BOOL)isFilled
{
  return self->_isFilled;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICAppRegistry;
  v4 = [(ICAppRegistry *)&v8 description];
  v5 = [(ICAppRegistry *)self apps];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)refreshInstalledApps
{
  v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__ICAppRegistry_refreshInstalledApps__block_invoke;
  block[3] = &unk_1E6558B28;
  block[4] = self;
  dispatch_async(v3, block);
}

void __37__ICAppRegistry_refreshInstalledApps__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) registryLock];
  [v2 lock];

  v3 = [*(id *)(a1 + 32) appsDictionary];
  v4 = (void *)[v3 mutableCopy];

  v5 = [*(id *)(a1 + 32) registryLock];
  [v5 unlock];

  v6 = [*(id *)(a1 + 32) observersLock];
  [v6 lock];

  id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  objc_super v8 = [*(id *)(a1 + 32) observersByIdentifier];
  v9 = (void *)[v7 initWithDictionary:v8 copyItems:1];

  v10 = [*(id *)(a1 + 32) observersLock];
  [v10 unlock];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__ICAppRegistry_refreshInstalledApps__block_invoke_2;
  block[3] = &unk_1E65556E0;
  id v14 = v9;
  id v15 = v4;
  uint64_t v16 = *(void *)(a1 + 32);
  id v11 = v4;
  id v12 = v9;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __37__ICAppRegistry_refreshInstalledApps__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __37__ICAppRegistry_refreshInstalledApps__block_invoke_3;
  v10 = &unk_1E654F5C0;
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v11 = v3;
  uint64_t v12 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:&v7];
  v5 = objc_msgSend(*(id *)(a1 + 40), "allValues", v7, v8, v9, v10);
  [v5 makeObjectsPerformSelector:sel_resetInstalledStatus];
  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"ICAppRegistryInstalledAppsDidChangeNotification" object:*(void *)(a1 + 48)];
}

void __37__ICAppRegistry_refreshInstalledApps__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) objectForKey:v5];
  [*(id *)(a1 + 32) removeObjectForKey:v5];
  int v8 = [v7 isInstalled];
  [v7 updateInstalledStatus];
  if (v8 != [v7 isInstalled])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = v6;
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
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "appRegistry:installStatusChangedForApp:", *(void *)(a1 + 40), v7, (void)v14);
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)removeInstallStatusObserver:(id)a3 forAppIdentifiers:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(ICAppRegistry *)self observersLock];
  [v8 lock];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
        long long v15 = [(ICAppRegistry *)self observersByIdentifier];
        long long v16 = [v15 objectForKey:v14];
        if ([v16 count] == 1 && objc_msgSend(v16, "containsObject:", v6)) {
          [v15 removeObjectForKey:v14];
        }
        else {
          [v16 removeObject:v6];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  long long v17 = [(ICAppRegistry *)self observersLock];
  [v17 unlock];
}

- (void)addInstallStatusObserver:(id)a3 forAppIdentifiers:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(ICAppRegistry *)self appsWithIdentifiers:v7];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * v12++) isInstalled];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }
  uint64_t v13 = [(ICAppRegistry *)self observersLock];
  [v13 lock];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v7;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * v18);
        long long v20 = [(ICAppRegistry *)self observersByIdentifier];
        long long v21 = [v20 objectForKey:v19];
        if (!v21)
        {
          long long v21 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
          [v20 setObject:v21 forKey:v19];
        }
        [v21 addObject:v6];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v16);
  }

  v22 = [(ICAppRegistry *)self observersLock];
  [v22 unlock];
}

- (void)fillRegistry
{
  id v3 = [(ICAppRegistry *)self registryLock];
  int v4 = [v3 tryLock];

  if (v4)
  {
    id v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"ICAppRegistry Locking Exception" reason:@"The registry must be locked while it is being filled." userInfo:0];
    objc_exception_throw(v15);
  }
  self->_isFilled = 1;
  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  id v7 = +[ICAppDefinitionRegistry registeredDefinitions];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __29__ICAppRegistry_fillRegistry__block_invoke;
  v16[3] = &unk_1E654F598;
  int v8 = v5;
  uint64_t v17 = v8;
  uint64_t v9 = v6;
  uint64_t v18 = v9;
  [v7 enumerateKeysAndObjectsUsingBlock:v16];
  actions = self->_actions;
  self->_actions = v9;
  uint64_t v11 = v9;

  appsDictionary = self->_appsDictionary;
  self->_appsDictionary = v8;
  uint64_t v13 = v8;

  currentApp = self->_currentApp;
  self->_currentApp = 0;
}

void __29__ICAppRegistry_fillRegistry__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v34 = (*(void (**)(uint64_t))(a3 + 16))(a3);
  id v6 = [[ICApp alloc] initWithIdentifier:v5 definition:v34];
  v35 = v5;
  [*(id *)(a1 + 32) setObject:v6 forKey:v5];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v33 = v6;
  obuint64_t j = [(ICApp *)v6 schemes];
  uint64_t v7 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v37 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v47 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        uint64_t v11 = [v10 actions];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v51 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v43;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v43 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void **)(*((void *)&v42 + 1) + 8 * j);
              uint64_t v17 = *(void **)(a1 + 40);
              uint64_t v18 = [v16 identifier];
              uint64_t v19 = [v17 objectForKey:v18];

              if (!v19)
              {
                long long v20 = *(void **)(a1 + 40);
                long long v21 = [v16 identifier];
                [v20 setObject:v16 forKey:v21];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v51 count:16];
          }
          while (v13);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v8);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v22 = [(ICApp *)v33 documentActions];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v39 != v25) {
          objc_enumerationMutation(v22);
        }
        long long v27 = *(void **)(*((void *)&v38 + 1) + 8 * k);
        long long v28 = *(void **)(a1 + 40);
        long long v29 = [v27 identifier];
        long long v30 = [v28 objectForKey:v29];

        if (!v30)
        {
          v31 = *(void **)(a1 + 40);
          v32 = [v27 identifier];
          [v31 setObject:v27 forKey:v32];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v24);
  }
}

- (void)updateRegistry
{
  id v3 = [(ICAppRegistry *)self registryLock];
  [v3 lock];

  if (self->_isFilled)
  {
    [(ICAppRegistry *)self fillRegistry];
    id v8 = [(ICAppRegistry *)self registryLock];
    [v8 unlock];
  }
  else
  {
    int v4 = [(ICAppRegistry *)self appsDictionary];
    id v8 = [v4 allKeys];

    appsDictionary = self->_appsDictionary;
    self->_appsDictionary = 0;

    if ([v8 count]) {
      id v6 = [(ICAppRegistry *)self _appsWithIdentifiers:v8];
    }
    uint64_t v7 = [(ICAppRegistry *)self registryLock];
    [v7 unlock];
  }
}

- (id)actionsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAppRegistry *)self registryLock];
  [v5 lock];

  id v6 = [(ICAppRegistry *)self actions];
  if (v6)
  {
    uint64_t v7 = [(ICAppRegistry *)self registryLock];
    [v7 unlock];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __40__ICAppRegistry_actionsWithIdentifiers___block_invoke;
    v17[3] = &unk_1E654F570;
    id v18 = v6;
    id v8 = objc_msgSend(v4, "if_map:", v17);
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __40__ICAppRegistry_actionsWithIdentifiers___block_invoke_2;
    v16[3] = &unk_1E6557BC8;
    void v16[4] = self;
    uint64_t v9 = objc_msgSend(v4, "if_map:", v16);
    uint64_t v10 = [(ICAppRegistry *)self _appsWithIdentifiers:v9];
    uint64_t v11 = [(ICAppRegistry *)self registryLock];
    [v11 unlock];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __40__ICAppRegistry_actionsWithIdentifiers___block_invoke_3;
    v14[3] = &unk_1E654F570;
    id v15 = v10;
    id v12 = v10;
    id v8 = objc_msgSend(v4, "if_map:", v14);
  }
  return v8;
}

uint64_t __40__ICAppRegistry_actionsWithIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKey:a2];
}

id __40__ICAppRegistry_actionsWithIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 stringByDeletingPathExtension];
  id v3 = [(id)objc_opt_class() legacyAppIdentifierForBundleIdentifier:v2];

  return v3;
}

id __40__ICAppRegistry_actionsWithIdentifiers___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) objectAtIndex:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = 0;
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v8 = [v6 schemes];
    uint64_t v28 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v28)
    {
      uint64_t v9 = *(void *)v38;
      uint64_t v26 = *(void *)v38;
      long long v27 = v6;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v38 != v9) {
            objc_enumerationMutation(v8);
          }
          uint64_t v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v12 = [v11 actions];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v42 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v34;
            while (2)
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v34 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void **)(*((void *)&v33 + 1) + 8 * j);
                id v18 = [v17 identifier];
                char v19 = [v18 isEqualToString:v5];

                if (v19)
                {
                  id v7 = v17;

                  id v6 = v27;
                  goto LABEL_29;
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v42 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }

          uint64_t v9 = v26;
        }
        id v6 = v27;
        uint64_t v28 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v28);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v8 = [v6 documentActions];
    id v7 = (id)[v8 countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v7)
    {
      uint64_t v20 = *(void *)v30;
      while (2)
      {
        for (uint64_t k = 0; k != v7; uint64_t k = (char *)k + 1)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v8);
          }
          v22 = *(void **)(*((void *)&v29 + 1) + 8 * (void)k);
          uint64_t v23 = [v22 identifier];
          char v24 = [v23 isEqualToString:v5];

          if (v24)
          {
            id v7 = v22;
            goto LABEL_29;
          }
        }
        id v7 = (id)[v8 countByEnumeratingWithState:&v29 objects:v41 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_29:
  }
  return v7;
}

- (NSArray)allActions
{
  id v3 = [(ICAppRegistry *)self registryLock];
  [v3 lock];

  if (!self->_isFilled) {
    [(ICAppRegistry *)self fillRegistry];
  }
  id v4 = [(ICAppRegistry *)self actions];
  id v5 = [v4 allValues];

  id v6 = [(ICAppRegistry *)self registryLock];
  [v6 unlock];

  return (NSArray *)v5;
}

- (NSDictionary)actions
{
  id v3 = [(ICAppRegistry *)self registryLock];
  int v4 = [v3 tryLock];

  if (v4)
  {
    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"ICAppRegistry Locking Exception" reason:@"The registry must be locked while the actions dictionary is being accessed." userInfo:0];
    objc_exception_throw(v7);
  }
  actions = self->_actions;
  return actions;
}

- (id)appWithURLScheme:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAppRegistry *)self apps];
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = [v4 lowercaseString];

  id v8 = [v6 predicateWithFormat:@"%@ IN schemes.scheme", v7];
  uint64_t v9 = [v5 filteredArrayUsingPredicate:v8];
  uint64_t v10 = [v9 firstObject];

  return v10;
}

- (id)appWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAppRegistry *)self apps];
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ IN allBundleIdentifiers", v4];

  id v7 = [v5 filteredArrayUsingPredicate:v6];
  id v8 = [v7 firstObject];

  return v8;
}

- (id)appWithIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v11 count:1];
  id v7 = -[ICAppRegistry appsWithIdentifiers:](self, "appsWithIdentifiers:", v6, v11, v12);
  id v8 = [v7 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (id)appsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAppRegistry *)self registryLock];
  [v5 lock];

  id v6 = [(ICAppRegistry *)self _appsWithIdentifiers:v4];

  id v7 = [(ICAppRegistry *)self registryLock];
  [v7 unlock];

  return v6;
}

- (id)_appsWithIdentifiers:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v48 = self;
  id v5 = [(ICAppRegistry *)self appsDictionary];
  id v6 = objc_opt_new();
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v59 objects:v69 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v60 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v59 + 1) + 8 * i);
        uint64_t v13 = [(NSDictionary *)v5 objectForKey:v12];

        if (!v13) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v59 objects:v69 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    uint64_t v14 = getWFInterchangeLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v66 = "-[ICAppRegistry _appsWithIdentifiers:]";
      __int16 v67 = 2112;
      v68 = v6;
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_DEFAULT, "%s Loading apps: %@", buf, 0x16u);
    }

    uint64_t v15 = (void *)[(NSDictionary *)v5 mutableCopy];
    uint64_t v16 = v15;
    if (v15) {
      id v17 = v15;
    }
    else {
      id v17 = (id)objc_opt_new();
    }
    id v18 = v17;
    long long v45 = v5;
    id v46 = v7;

    long long v47 = v6;
    if (v48->_isFilled)
    {
      char v19 = 0;
    }
    else
    {
      uint64_t v20 = v18;
      long long v21 = +[ICAppDefinitionRegistry registeredDefinitions];
      char v19 = objc_opt_new();
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v22 = v6;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v55 objects:v64 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v56;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v56 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v55 + 1) + 8 * j);
            uint64_t v28 = [v21 objectForKey:v27];
            long long v29 = (void *)v28;
            if (v28)
            {
              long long v30 = (*(void (**)(uint64_t))(v28 + 16))(v28);
              [v19 setObject:v30 forKey:v27];
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v55 objects:v64 count:16];
        }
        while (v24);
      }

      id v6 = v47;
      id v18 = v20;
    }
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v31 = v6;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v51 objects:v63 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v52;
      do
      {
        for (uint64_t k = 0; k != v33; ++k)
        {
          if (*(void *)v52 != v34) {
            objc_enumerationMutation(v31);
          }
          long long v36 = *(void **)(*((void *)&v51 + 1) + 8 * k);
          long long v37 = objc_msgSend(v19, "objectForKey:", v36, v45);
          if (!v37)
          {
            long long v38 = v18;
            long long v39 = getWFInterchangeLogObject();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v66 = "-[ICAppRegistry _appsWithIdentifiers:]";
              __int16 v67 = 2114;
              v68 = v36;
              _os_log_impl(&dword_1C7F0A000, v39, OS_LOG_TYPE_ERROR, "%s Failed to load a definition for %{public}@", buf, 0x16u);
            }

            id v18 = v38;
          }
          long long v40 = [[ICApp alloc] initWithIdentifier:v36 definition:v37];
          [v18 setObject:v40 forKey:v36];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v51 objects:v63 count:16];
      }
      while (v33);
    }

    id v5 = v18;
    appsDictionary = v48->_appsDictionary;
    v48->_appsDictionary = v5;

    id v7 = v46;
    id v6 = v47;
  }
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __38__ICAppRegistry__appsWithIdentifiers___block_invoke;
  v49[3] = &unk_1E654F548;
  v50 = v5;
  long long v42 = v5;
  long long v43 = objc_msgSend(v7, "if_map:", v49);

  return v43;
}

uint64_t __38__ICAppRegistry__appsWithIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKey:a2];
}

- (ICApp)currentApp
{
  currentApp = self->_currentApp;
  if (!currentApp)
  {
    id v4 = [MEMORY[0x1E4F5A7A0] sharedContext];
    id v5 = [v4 applicationBundle];
    uint64_t v6 = [v5 bundleIdentifier];
    id v7 = (void *)v6;
    uint64_t v8 = (void *)*MEMORY[0x1E4FB4BE8];
    if (v6) {
      uint64_t v8 = (void *)v6;
    }
    id v9 = v8;

    uint64_t v10 = [(ICAppRegistry *)self appWithIdentifier:v9];

    id v11 = self->_currentApp;
    self->_currentApp = v10;

    currentApp = self->_currentApp;
  }
  return currentApp;
}

- (NSArray)apps
{
  id v3 = [(ICAppRegistry *)self registryLock];
  [v3 lock];

  if (!self->_isFilled) {
    [(ICAppRegistry *)self fillRegistry];
  }
  id v4 = [(ICAppRegistry *)self appsDictionary];
  id v5 = [v4 allValues];

  uint64_t v6 = [(ICAppRegistry *)self registryLock];
  [v6 unlock];

  return (NSArray *)v5;
}

- (NSDictionary)appsDictionary
{
  id v3 = [(ICAppRegistry *)self registryLock];
  int v4 = [v3 tryLock];

  if (v4)
  {
    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"ICAppRegistry Locking Exception" reason:@"The registry must be locked while the apps dictionary is being accessed." userInfo:0];
    objc_exception_throw(v7);
  }
  appsDictionary = self->_appsDictionary;
  return appsDictionary;
}

- (void)dealloc
{
  notify_cancel([(ICAppRegistry *)self urlTypesToken]);
  v3.receiver = self;
  v3.super_class = (Class)ICAppRegistry;
  [(ICAppRegistry *)&v3 dealloc];
}

- (ICAppRegistry)initWithBackgroundRefresh:(BOOL)a3
{
  v22.receiver = self;
  v22.super_class = (Class)ICAppRegistry;
  int v4 = [(ICAppRegistry *)&v22 init];
  id v5 = v4;
  if (v4)
  {
    v4->_refreshesInBackground = a3;
    uint64_t v6 = objc_opt_new();
    observersByIdentifier = v5->_observersByIdentifier;
    v5->_observersByIdentifier = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    registryLocuint64_t k = v5->_registryLock;
    v5->_registryLocuint64_t k = (NSLock *)v8;

    uint64_t v10 = objc_opt_new();
    observersLocuint64_t k = v5->_observersLock;
    v5->_observersLocuint64_t k = (NSLock *)v10;

    objc_initWeak(&location, v5);
    v5->_urlTypesToken = -1;
    uint64_t v12 = (const char *)[(id)*MEMORY[0x1E4F22318] UTF8String];
    uint64_t v13 = MEMORY[0x1E4F14428];
    id v14 = MEMORY[0x1E4F14428];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __43__ICAppRegistry_initWithBackgroundRefresh___block_invoke;
    handler[3] = &unk_1E654F520;
    uint64_t v15 = v5;
    char v19 = v15;
    objc_copyWeak(&v20, &location);
    notify_register_dispatch(v12, &v5->_urlTypesToken, v13, handler);

    uint64_t v16 = v15;
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
  }

  return v5;
}

void __43__ICAppRegistry_initWithBackgroundRefresh___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F5A7A0] sharedContext];
  if ([v2 applicationState])
  {
    char v3 = [*(id *)(a1 + 32) refreshesInBackground];

    if ((v3 & 1) == 0)
    {
      uint64_t v12 = 0;
      uint64_t v13 = &v12;
      uint64_t v14 = 0x3032000000;
      uint64_t v15 = __Block_byref_object_copy__15908;
      uint64_t v16 = __Block_byref_object_dispose__15909;
      id v17 = 0;
      int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v5 = getUIApplicationDidBecomeActiveNotification();
      uint64_t v6 = [MEMORY[0x1E4F28F08] mainQueue];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __43__ICAppRegistry_initWithBackgroundRefresh___block_invoke_174;
      v10[3] = &unk_1E654F4F8;
      objc_copyWeak(&v11, (id *)(a1 + 40));
      v10[4] = &v12;
      uint64_t v7 = [v4 addObserverForName:v5 object:0 queue:v6 usingBlock:v10];
      uint64_t v8 = (void *)v13[5];
      v13[5] = v7;

      objc_destroyWeak(&v11);
      _Block_object_dispose(&v12, 8);

      return;
    }
  }
  else
  {
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained refreshInstalledApps];
}

void __43__ICAppRegistry_initWithBackgroundRefresh___block_invoke_174(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained refreshInstalledApps];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

+ (id)bundleIdentifierForLegacyAppIdentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = [&unk_1F2317DC8 objectForKeyedSubscript:v3];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = [v4 arrayByAddingObject:v3];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v13 = objc_alloc(MEMORY[0x1E4F223C8]);
          uint64_t v14 = objc_msgSend(v13, "initWithBundleIdentifier:allowPlaceholder:error:", v12, 0, 0, (void)v20);
          uint64_t v15 = v14;
          if (v14)
          {
            uint64_t v16 = [v14 applicationState];
            char v17 = [v16 isInstalled];

            if (v17)
            {
              id v18 = v12;

              goto LABEL_14;
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v18 = [v7 firstObject];
LABEL_14:
  }
  else
  {
    id v18 = v3;
  }

  return v18;
}

+ (id)legacyAppIdentifierForBundleIdentifier:(id)a3
{
  id v3 = a3;
  int v4 = [&unk_1F2317DA0 objectForKeyedSubscript:v3];
  id v5 = v4;
  if (!v4) {
    int v4 = v3;
  }
  id v6 = v4;

  return v6;
}

+ (id)sharedRegistry
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__ICAppRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedRegistry_onceToken_16096 != -1) {
    dispatch_once(&sharedRegistry_onceToken_16096, block);
  }
  v2 = (void *)sharedRegistry_sharedRegistry_16097;
  return v2;
}

void __31__ICAppRegistry_sharedRegistry__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedRegistry_sharedRegistry_16097;
  sharedRegistry_sharedRegistry_16097 = (uint64_t)v1;
}

@end
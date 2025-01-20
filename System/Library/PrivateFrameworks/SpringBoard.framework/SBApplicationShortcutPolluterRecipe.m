@interface SBApplicationShortcutPolluterRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBApplicationShortcutPolluterRecipe

- (id)title
{
  return @"Application Shortcut Polluter";
}

- (void)handleVolumeIncrease
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v27 = +[SBApplicationController sharedInstance];
  v2 = +[SBApplicationShortcutStoreManager sharedManager];
  v3 = SBLogAppShortcuts();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Populating mock shortcuts...", buf, 2u);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [MEMORY[0x1E4F628D8] applicationsWithAvailableStores];
  uint64_t v28 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v30;
    unint64_t v5 = 0x1E4F1C000uLL;
    *(void *)&long long v4 = 138412290;
    long long v24 = v4;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v8 = objc_msgSend(v27, "applicationWithBundleIdentifier:", v7, v24);
        v9 = [v8 info];

        uint64_t v10 = [v9 dynamicApplicationShortcutItemsVersion];
        v11 = v2;
        v12 = [v2 applicationShortcutItemsForBundleIdentifier:v7 withVersion:v10];
        v13 = (void *)[v12 mutableCopy];
        v14 = v13;
        if (v13) {
          id v15 = v13;
        }
        else {
          id v15 = (id)objc_opt_new();
        }
        v16 = v15;

        unint64_t v17 = v5;
        v18 = objc_opt_new();
        uint64_t v19 = 20;
        do
        {
          v20 = __mockShortcutPlist();
          [v18 addObject:v20];

          --v19;
        }
        while (v19);
        v21 = SBLogAppShortcuts();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v24;
          uint64_t v34 = v7;
          _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_INFO, "Populated mock shortcuts for %@", buf, 0xCu);
        }

        v22 = [MEMORY[0x1E4FA69D0] _staticApplicationShortcutItemsFromInfoPlistEntry:v18];
        [v16 addObjectsFromArray:v22];

        v2 = v11;
        [v11 setApplicationShortcutItems:v16 forBundleIdentifier:v7 withVersion:v10];

        unint64_t v5 = v17;
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v28);
  }

  [v2 saveSynchronously];
  v23 = SBLogAppShortcuts();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_INFO, "Populated mock shortcuts", buf, 2u);
  }
}

- (void)handleVolumeDecrease
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v2 = +[SBDefaults localDefaults];
  v3 = [v2 iconDefaults];
  [v3 setSuppressAppShortcutTruncation:0];

  long long v4 = __mockShortcutPlist();
  unint64_t v5 = [v4 objectForKey:@"UIApplicationShortcutItemType"];

  v6 = __mockShortcutPlist();
  v38 = [v6 objectForKey:@"UIApplicationShortcutItemTitle"];

  long long v32 = +[SBApplicationController sharedInstance];
  uint64_t v7 = +[SBApplicationShortcutStoreManager sharedManager];
  v8 = SBLogAppShortcuts();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "Removing mock shortcuts...", buf, 2u);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [MEMORY[0x1E4F628D8] applicationsWithAvailableStores];
  uint64_t v33 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v33)
  {
    uint64_t v30 = *(void *)v44;
    long long v31 = v7;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v44 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v43 + 1) + 8 * v9);
        v11 = [v32 applicationWithBundleIdentifier:v10];
        v12 = [v11 info];

        uint64_t v13 = [v12 dynamicApplicationShortcutItemsVersion];
        uint64_t v37 = v10;
        v14 = [v7 applicationShortcutItemsForBundleIdentifier:v10 withVersion:v13];
        id v15 = (void *)[v14 mutableCopy];
        v16 = v15;
        v35 = v12;
        uint64_t v36 = v9;
        uint64_t v34 = v13;
        if (v15) {
          id v17 = v15;
        }
        else {
          id v17 = (id)objc_opt_new();
        }
        v18 = v17;

        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        uint64_t v19 = (void *)[v18 copy];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v49 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v40 != v22) {
                objc_enumerationMutation(v19);
              }
              long long v24 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              v25 = [v24 type];
              if ([v25 isEqualToString:v5])
              {
                uint64_t v26 = [v24 localizedTitle];
                int v27 = [v26 isEqualToString:v38];

                if (!v27) {
                  continue;
                }
                [v18 removeObject:v24];
                v25 = SBLogAppShortcuts();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v48 = v37;
                  _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_INFO, "Removing mock shortcut from %@", buf, 0xCu);
                }
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v39 objects:v49 count:16];
          }
          while (v21);
        }

        uint64_t v7 = v31;
        [v31 setApplicationShortcutItems:v18 forBundleIdentifier:v37 withVersion:v34];

        uint64_t v9 = v36 + 1;
      }
      while (v36 + 1 != v33);
      uint64_t v33 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v33);
  }

  [v7 saveSynchronously];
  uint64_t v28 = SBLogAppShortcuts();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_INFO, "Removed all mock shortcuts.", buf, 2u);
  }
}

@end
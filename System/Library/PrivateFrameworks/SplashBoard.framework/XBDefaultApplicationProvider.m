@interface XBDefaultApplicationProvider
- (id)_allApplicationsFilteredBySystem:(BOOL)a3 bySplashBoard:(BOOL)a4;
- (id)allInstalledApplications;
- (id)allSplashBoardApplications;
- (id)recentlyUsedBundleIDs;
- (id)splashBoardSystemApplications;
@end

@implementation XBDefaultApplicationProvider

- (id)allSplashBoardApplications
{
  return [(XBDefaultApplicationProvider *)self _allApplicationsFilteredBySystem:0 bySplashBoard:1];
}

- (id)splashBoardSystemApplications
{
  return [(XBDefaultApplicationProvider *)self _allApplicationsFilteredBySystem:1 bySplashBoard:1];
}

- (id)allInstalledApplications
{
  return [(XBDefaultApplicationProvider *)self _allApplicationsFilteredBySystem:0 bySplashBoard:0];
}

- (id)recentlyUsedBundleIDs
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)_allApplicationsFilteredBySystem:(BOOL)a3 bySplashBoard:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  v6 = [MEMORY[0x263EFF980] array];
  v21 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"UILaunchStoryboards", @"UILaunchScreen", 0);
  [MEMORY[0x263F01878] enumeratorWithOptions:v5];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        v12 = [v11 compatibilityObject];
        if (v5)
        {
          uint64_t v13 = [MEMORY[0x263F1CBD8] _applicationTypeForProxy:v12];
          if (v13 != 1 || !v4)
          {
            if (v13 == 1) {
              goto LABEL_15;
            }
            goto LABEL_16;
          }
        }
        else if (!v4)
        {
          goto LABEL_15;
        }
        v14 = [v11 infoDictionary];
        v15 = [v14 objectsForKeys:v21];

        v16 = [v15 objectForKey:@"UILaunchStoryboardName" ofClass:objc_opt_class()];
        if (v16
          || ([v15 objectForKey:@"UILaunchStoryboards" ofClass:objc_opt_class()],
              (v16 = objc_claimAutoreleasedReturnValue()) != 0))
        {

LABEL_15:
          v17 = (void *)[objc_alloc(MEMORY[0x263F1CBD8]) initWithApplicationProxy:v12];
          [v6 addObject:v17];

          goto LABEL_16;
        }
        v18 = [v15 objectForKey:@"UILaunchScreen" ofClass:objc_opt_class()];

        if (v18) {
          goto LABEL_15;
        }
LABEL_16:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v19 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v8 = v19;
    }
    while (v19);
  }

  return v6;
}

@end
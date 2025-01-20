@interface CACApplicationUtilities
+ (id)installedApplications;
+ (void)installedApplications;
+ (void)launchApplicationWithIdentifier:(id)a3;
+ (void)terminateApplicationWithIdentifier:(id)a3;
@end

@implementation CACApplicationUtilities

+ (id)installedApplications
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v22 = [MEMORY[0x263EFF980] array];
  v2 = [MEMORY[0x263F21668] systemApplication];
  [v2 updateCache:1508];

  if (installedApplications_onceToken != -1) {
    dispatch_once(&installedApplications_onceToken, &__block_literal_global_43);
  }
  v3 = +[CACDisplayManager sharedManager];
  int v4 = [v3 carPlayConnected];

  if (v4)
  {
    v5 = +[CACDisplayManager sharedManager];
    v6 = [v5 carPlayApplications];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __48__CACApplicationUtilities_installedApplications__block_invoke_2;
    v27[3] = &unk_264D12510;
    id v28 = v22;
    [v6 enumerateKeysAndObjectsUsingBlock:v27];

    id v7 = v28;
  }
  else
  {
    v8 = [MEMORY[0x263F21668] systemApplication];
    v9 = [v8 uiElement];
    v10 = [v9 objectWithAXAttribute:1508];

    if (![v10 count])
    {
      v11 = CACLogGeneral();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[CACApplicationUtilities installedApplications](v11);
      }
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v10;
    uint64_t v12 = [v7 countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v7);
          }
          v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v17 = [v16 stringByTrimmingCharactersInSet:installedApplications_sFilterSet];
          v18 = [v7 objectForKey:v16];
          v19 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v17, @"TargetAppName", v18, @"TargetAppIdentifier", 0);
          [v22 addObject:v19];
        }
        uint64_t v13 = [v7 countByEnumeratingWithState:&v23 objects:v33 count:16];
      }
      while (v13);
    }

    v20 = CACLogGeneral();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v22;
      __int16 v31 = 2112;
      id v32 = v7;
      _os_log_impl(&dword_238377000, v20, OS_LOG_TYPE_INFO, "Installed applications: %@ \n From dictionary: %@", buf, 0x16u);
    }
  }
  return v22;
}

void __48__CACApplicationUtilities_installedApplications__block_invoke()
{
  id v3 = [MEMORY[0x263F089C0] alphanumericCharacterSet];
  v0 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  [v3 formUnionWithCharacterSet:v0];

  uint64_t v1 = [v3 invertedSet];
  v2 = (void *)installedApplications_sFilterSet;
  installedApplications_sFilterSet = v1;
}

void __48__CACApplicationUtilities_installedApplications__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"TargetAppName";
  uint64_t v5 = installedApplications_sFilterSet;
  id v6 = a3;
  id v7 = [a2 stringByTrimmingCharactersInSet:v5];
  v9[1] = @"TargetAppIdentifier";
  v10[0] = v7;
  v10[1] = v6;
  v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  [*(id *)(a1 + 32) addObject:v8];
}

+ (void)launchApplicationWithIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = CACLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_238377000, v4, OS_LOG_TYPE_INFO, "Asking system application to launch app with identifier: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CACApplicationUtilities_launchApplicationWithIdentifier___block_invoke;
  block[3] = &unk_264D115D0;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __59__CACApplicationUtilities_launchApplicationWithIdentifier___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  v2 = +[CACDisplayManager sharedManager];
  int v3 = [v2 carPlayConnected];

  if (v3)
  {
    int v4 = [MEMORY[0x263F3F790] dashboardService];
    if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F31298]])
    {
      uint64_t v10 = *MEMORY[0x263F3F5E0];
      id v5 = [NSURL URLWithString:*MEMORY[0x263F312A0]];
      v11[0] = v5;
      id v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];

      id v7 = [MEMORY[0x263F3F778] optionsWithDictionary:v6];
      [v4 openApplication:@"com.apple.CarPlayApp" withOptions:v7 completion:&__block_literal_global_97];
    }
    else
    {
      [v4 openApplication:*(void *)(a1 + 32) withOptions:0 completion:0];
    }
  }
  else
  {
    id v9 = [MEMORY[0x263F21668] systemApplication];
    v8 = [v9 uiElement];
    [v8 performAXAction:5012 withValue:*(void *)(a1 + 32)];
  }
}

void __59__CACApplicationUtilities_launchApplicationWithIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  int v4 = CACLogGeneral();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __59__CACApplicationUtilities_launchApplicationWithIdentifier___block_invoke_2_cold_1((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_238377000, v5, OS_LOG_TYPE_INFO, "Launched now playing successfully!", v6, 2u);
  }
}

+ (void)terminateApplicationWithIdentifier:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = CACLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_238377000, v4, OS_LOG_TYPE_INFO, "Asking system application to terminate app with identifier: %@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_99);
}

+ (void)installedApplications
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_238377000, log, OS_LOG_TYPE_ERROR, "[installedApplications] Warning: AXElement systemApplication kAXLaunchableAppsAttribute is empty.", v1, 2u);
}

void __59__CACApplicationUtilities_launchApplicationWithIdentifier___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_238377000, a2, OS_LOG_TYPE_ERROR, "Failed to launch now playing with: %@", (uint8_t *)&v2, 0xCu);
}

@end
@interface PXAnalyticsURLNavigationUtilities
+ (void)sendNavigationEndEventForURL:(id)a3;
+ (void)sendNavigationStartEventForURL:(id)a3;
@end

@implementation PXAnalyticsURLNavigationUtilities

+ (void)sendNavigationEndEventForURL:(id)a3
{
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  v4 = MEMORY[0x1E4F14428];
  dispatch_after(v3, v4, &__block_literal_global_205149);
}

uint64_t __66__PXAnalyticsURLNavigationUtilities_sendNavigationEndEventForURL___block_invoke()
{
  return [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.URLNavigationDidFinish" withPayload:MEMORY[0x1E4F1CC08]];
}

+ (void)sendNavigationStartEventForURL:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 path];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v36 = [MEMORY[0x1E4F1CA60] dictionary];
    id v38 = v3;
    v6 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:0];
    v34 = [v6 host];
    v35 = v6;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v7 = [v6 queryItems];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (!v8)
    {
      v10 = 0;
      v11 = 0;
      goto LABEL_18;
    }
    uint64_t v9 = v8;
    v10 = 0;
    v11 = 0;
    uint64_t v12 = *(void *)v40;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(v7);
        }
        v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v15 = [v14 name];
        int v16 = [v15 isEqualToString:PXDeeplinkURLPathComponentQueryKeySource];

        if (v16)
        {
          uint64_t v17 = [v14 value];
          v18 = v11;
          v11 = (void *)v17;
        }
        else
        {
          v19 = [v14 name];
          int v20 = [v19 isEqualToString:PXDeeplinkURLPathComponentQueryKeyIdentifier];

          if (!v20) {
            continue;
          }
          uint64_t v21 = [v14 value];
          v18 = v10;
          v10 = (void *)v21;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (!v9)
      {
LABEL_18:

        if ([v11 isEqualToString:@"notification"])
        {
          uint64_t v23 = 3;
        }
        else if ([v11 isEqualToString:@"widget"])
        {
          uint64_t v23 = 4;
        }
        else
        {
          uint64_t v23 = 5;
        }
        v22 = v36;
        v24 = v10;
        v25 = [NSNumber numberWithInteger:v23];
        [v36 setObject:v25 forKeyedSubscript:@"URLNavigationKind"];

        unint64_t v26 = 0x1E4F56000;
        if (v10 && [v11 isEqualToString:PXDeeplinkURLPathComponentSourceWidget])
        {
          id v27 = [v36 mutableCopy];
          [MEMORY[0x1E4F39228] systemPhotoLibraryURL];
          v37 = v24 = v10;
          v28 = (void *)[objc_alloc(MEMORY[0x1E4F39228]) initWithPhotoLibraryURL:v37];
          v29 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:v28 orObject:0];
          [v29 setFetchLimit:1];
          v30 = (void *)MEMORY[0x1E4F38EE8];
          v43 = v10;
          v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
          v32 = [v30 fetchAssetCollectionsWithLocalIdentifiers:v31 options:v29];

          v33 = [v32 firstObject];
          [v27 setObject:v34 forKeyedSubscript:@"widgetType"];
          if (v33) {
            [v27 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F56548]];
          }
          [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.widget.open" withPayload:v27];

          unint64_t v26 = 0x1E4F56000uLL;
        }
        [*(id *)(v26 + 1624) sendEvent:@"com.apple.photos.CPAnalytics.URLNavigationDidStart" withPayload:v22];

        id v3 = v38;
        goto LABEL_29;
      }
    }
  }
  v22 = PLUIGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v46 = v3;
    _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_INFO, "Navigation Analytics: Destination URL has empty path, returning early without logging: %@", buf, 0xCu);
  }
LABEL_29:
}

@end
@interface WLKUpNextWidgetCacheManager
+ (BOOL)consumePendingInvalidation;
+ (void)requestInvalidation;
+ (void)requestReload;
@end

@implementation WLKUpNextWidgetCacheManager

+ (BOOL)consumePendingInvalidation
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.WatchListKit"];
  v4 = [v3 objectForKey:@"UpNextWidgetPendingInvalidation"];
  if (v4)
  {
    v5 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKUpNextWidgetCacheManager - Found pending invalidation. Consuming: %@", (uint8_t *)&v7, 0xCu);
    }

    [v3 removeObjectForKey:@"UpNextWidgetPendingInvalidation"];
  }

  objc_sync_exit(v2);
  return v4 != 0;
}

+ (void)requestInvalidation
{
  id v2 = a1;
  objc_sync_enter(v2);
  v3 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKUpNextWidgetCacheManager - Processed invalidation request", v6, 2u);
  }

  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.WatchListKit"];
  v5 = [MEMORY[0x1E4F1C9C8] date];
  [v4 setObject:v5 forKey:@"UpNextWidgetPendingInvalidation"];

  objc_sync_exit(v2);
}

+ (void)requestReload
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = [(id)requestReload__sTimelineController extensionBundleIdentifier];
  int v5 = 138412546;
  v6 = v4;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  _os_log_error_impl(&dword_1BA2E8000, a2, OS_LOG_TYPE_ERROR, "WLKUpNextWidgetCacheManager - An error occured reloading timeline: [%@] %@", (uint8_t *)&v5, 0x16u);
}

void __44__WLKUpNextWidgetCacheManager_requestReload__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F58DA0]);
  WLKTVAppBundleID();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 initWithExtensionBundleIdentifier:@"com.apple.tv.TVWidgetExtension" kind:v3];
  id v2 = (void *)requestReload__sTimelineController;
  requestReload__sTimelineController = v1;
}

@end
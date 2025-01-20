@interface WebBookmarkCloudKitSyncCollection
- (void)dealloc;
@end

@implementation WebBookmarkCloudKitSyncCollection

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[WebBookmarkCloudKitSyncCollection dealloc]";
    __int16 v9 = 2114;
    v10 = self;
    _os_log_impl(&dword_21C043000, v3, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", buf, 0x16u);
  }
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[WebBookmarkCloudKitSyncCollection dealloc]";
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "@@ %s: Unlocking bookmark database", buf, 0xCu);
  }
  [(id)objc_opt_class() unlockSyncAsynchronously];
  v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[WebBookmarkCloudKitSyncCollection dealloc]";
    _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_INFO, "<- %s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)WebBookmarkCloudKitSyncCollection;
  [(WebBookmarkCollection *)&v6 dealloc];
}

@end
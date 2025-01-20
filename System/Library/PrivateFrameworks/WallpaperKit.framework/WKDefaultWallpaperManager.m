@interface WKDefaultWallpaperManager
+ (WKDefaultWallpaperManager)defaultWallpaperManager;
+ (id)defaultWallpaperLookupURL;
- (NSDictionary)_defaultWallpaperLookup;
- (WKDefaultWallpaperManager)initWithCollectionsManager:(id)a3;
- (WKWallpaperBundle)_defaultWallpaperBundle;
- (WKWallpaperRepresentingCollectionsManager)_collectionsManager;
- (id)_wallpaperRepresentingWithIdentifier:(id)a3;
- (id)deviceColor;
- (id)deviceEnclosureColor;
- (id)deviceLogicalScreenClass;
- (id)deviceProductType;
- (void)_loadDefaultWallpaperFile;
- (void)_loadDefaultWallpaperInformation;
- (void)set_collectionsManager:(id)a3;
- (void)set_defaultWallpaperBundle:(id)a3;
- (void)set_defaultWallpaperLookup:(id)a3;
@end

@implementation WKDefaultWallpaperManager

- (WKDefaultWallpaperManager)initWithCollectionsManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WKDefaultWallpaperManager;
  v6 = [(WKDefaultWallpaperManager *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__collectionsManager, a3);
    [(WKDefaultWallpaperManager *)v7 _loadDefaultWallpaperFile];
    [(WKDefaultWallpaperManager *)v7 _loadDefaultWallpaperInformation];
  }

  return v7;
}

+ (WKDefaultWallpaperManager)defaultWallpaperManager
{
  if (defaultWallpaperManager_onceToken[0] != -1) {
    dispatch_once(defaultWallpaperManager_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)defaultWallpaperManager__defaultManager;
  return (WKDefaultWallpaperManager *)v2;
}

void __52__WKDefaultWallpaperManager_defaultWallpaperManager__block_invoke()
{
  v2 = [[WKWallpaperRepresentingCollectionsManager alloc] initWithDownloadManager:0];
  v0 = [[WKDefaultWallpaperManager alloc] initWithCollectionsManager:v2];
  v1 = (void *)defaultWallpaperManager__defaultManager;
  defaultWallpaperManager__defaultManager = (uint64_t)v0;
}

- (void)_loadDefaultWallpaperFile
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [a2 path];
  int v8 = 138543618;
  objc_super v9 = v6;
  __int16 v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_1BE13A000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Default wallpaper lookup file does not exist at path '%{public}@'", (uint8_t *)&v8, 0x16u);
}

- (void)_loadDefaultWallpaperInformation
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  v4 = "-[WKDefaultWallpaperManager _loadDefaultWallpaperInformation]";
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1BE13A000, log, OS_LOG_TYPE_ERROR, "%s: No compatible wallpaper found on disk (wallpaperIdentifier: '%{public}@'; collectionIdentifier: '%{public}@'.); "
    "falling back to synthesized wallpaper.",
    (uint8_t *)&v3,
    0x20u);
}

void __61__WKDefaultWallpaperManager__loadDefaultWallpaperInformation__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = WKLogForCategory(2uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[WKDefaultWallpaperManager _loadDefaultWallpaperInformation]_block_invoke";
    _os_log_impl(&dword_1BE13A000, v0, OS_LOG_TYPE_DEFAULT, "%s: Complete.", (uint8_t *)&v1, 0xCu);
  }
}

+ (id)defaultWallpaperLookupURL
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = WKWallpapersBaseURL();
  v4 = (void *)MGCopyAnswer();
  __int16 v5 = WKLogForCategory(2uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromClass((Class)a1);
    *(_DWORD *)buf = 138543618;
    v16 = v6;
    __int16 v17 = 2114;
    v18 = v4;
    _os_log_impl(&dword_1BE13A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Resolving default wallpaper for device name '%{public}@'", buf, 0x16u);
  }
  __int16 v7 = NSString;
  uint64_t v8 = [v4 lowercaseString];
  uint64_t v9 = [v7 stringWithFormat:@"DefaultWallpapers~%@.plist", v8];
  __int16 v10 = [v3 URLByAppendingPathComponent:v9];

  v11 = WKLogForCategory(2uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = NSStringFromClass((Class)a1);
    v13 = [v10 path];
    *(_DWORD *)buf = 138543618;
    v16 = v12;
    __int16 v17 = 2114;
    v18 = v13;
    _os_log_impl(&dword_1BE13A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Resolved to default wallpaper look up file at path '%{public}@'", buf, 0x16u);
  }
  return v10;
}

- (id)deviceProductType
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

- (id)deviceLogicalScreenClass
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = WKLogicalScreenClassString();
  uint64_t v3 = WKLogForCategory(2uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    __int16 v5 = NSStringFromClass(v4);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    __int16 v10 = v2;
    _os_log_impl(&dword_1BE13A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Resolved to logical screen class '%{public}@'", (uint8_t *)&v7, 0x16u);
  }
  return v2;
}

- (id)deviceColor
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

- (id)deviceEnclosureColor
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

- (id)_wallpaperRepresentingWithIdentifier:(id)a3
{
  id v4 = a3;
  __int16 v5 = [(WKDefaultWallpaperManager *)self _collectionsManager];
  uint64_t v6 = [v5 numberOfWallpaperCollections];

  if (v6 < 1)
  {
LABEL_5:
    __int16 v10 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = [(WKDefaultWallpaperManager *)self _collectionsManager];
      __int16 v9 = [v8 wallpaperCollectionAtIndex:v7];

      __int16 v10 = [v9 wallpaperRepresentingWithIdentifier:v4];

      if (v10) {
        break;
      }
      ++v7;
      uint64_t v11 = [(WKDefaultWallpaperManager *)self _collectionsManager];
      uint64_t v12 = [v11 numberOfWallpaperCollections];

      if (v7 >= v12) {
        goto LABEL_5;
      }
    }
  }

  return v10;
}

- (NSDictionary)_defaultWallpaperLookup
{
  return self->__defaultWallpaperLookup;
}

- (void)set_defaultWallpaperLookup:(id)a3
{
}

- (WKWallpaperRepresentingCollectionsManager)_collectionsManager
{
  return self->__collectionsManager;
}

- (void)set_collectionsManager:(id)a3
{
}

- (WKWallpaperBundle)_defaultWallpaperBundle
{
  return self->__defaultWallpaperBundle;
}

- (void)set_defaultWallpaperBundle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__defaultWallpaperBundle, 0);
  objc_storeStrong((id *)&self->__collectionsManager, 0);
  objc_storeStrong((id *)&self->__defaultWallpaperLookup, 0);
}

@end
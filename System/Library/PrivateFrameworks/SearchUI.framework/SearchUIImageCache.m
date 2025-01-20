@interface SearchUIImageCache
+ (id)cachedTlkImageForSFImage:(id)a3;
+ (id)sharedCache;
+ (void)cacheTLKImage:(id)a3 forSFImage:(id)a4;
- (BSInvalidatable)homeScreenIconStyleObserver;
- (NSCache)imageCache;
- (SearchUIImageCache)init;
- (int64_t)cachedUserInterfaceStyle;
- (void)appIconImageDidChange:(id)a3;
- (void)clearCacheAndPostNotificationForChangedIconForBundleIdentifier:(id)a3;
- (void)clearImagesWithNotification:(id)a3;
- (void)dateDidChange;
- (void)dealloc;
- (void)homeScreenService:(id)a3 homeScreenIconStyleConfigurationDidChange:(id)a4;
- (void)setCachedUserInterfaceStyle:(int64_t)a3;
- (void)setHomeScreenIconStyleObserver:(id)a3;
- (void)setImageCache:(id)a3;
@end

@implementation SearchUIImageCache

+ (id)sharedCache
{
  if (sharedCache_onceToken_0 != -1) {
    dispatch_once(&sharedCache_onceToken_0, &__block_literal_global_32);
  }
  v2 = (void *)sharedCache_imageCache;
  return v2;
}

uint64_t __33__SearchUIImageCache_sharedCache__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedCache_imageCache;
  sharedCache_imageCache = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (SearchUIImageCache)init
{
  v14.receiver = self;
  v14.super_class = (Class)SearchUIImageCache;
  v2 = [(SearchUIImageCache *)&v14 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(SearchUIImageCache *)v2 setImageCache:v3];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)appDatabaseChanged, @"com.apple.LaunchServices.DatabaseChange", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel_clearImagesWithNotification_ name:@"SearchUIClearImageCacheNotification" object:0];

    v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    v7 = [v6 traitCollection];
    -[SearchUIImageCache setCachedUserInterfaceStyle:](v2, "setCachedUserInterfaceStyle:", [v7 userInterfaceStyle]);

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v2 selector:sel_dateDidChange name:*MEMORY[0x1E4FB2708] object:0];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel_appIconImageDidChange_ name:*MEMORY[0x1E4FB32A8] object:0];

    v10 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v10 addObserver:v2 selector:sel_appIconImageDidChange_ name:@"com.apple.LaunchServices.applicationIconChanged" object:0];

    v11 = +[SearchUIAppIconImage homeScreenService];
    v12 = [v11 addHomeScreenIconStyleObserver:v2];
    [(SearchUIImageCache *)v2 setHomeScreenIconStyleObserver:v12];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(SearchUIImageCache *)self homeScreenIconStyleObserver];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)SearchUIImageCache;
  [(SearchUIImageCache *)&v4 dealloc];
}

- (void)clearImagesWithNotification:(id)a3
{
  id v6 = a3;
  objc_super v4 = (void *)MEMORY[0x1E4E84260]();
  v5 = [(SearchUIImageCache *)self imageCache];
  [v5 removeAllObjects];
}

- (void)clearCacheAndPostNotificationForChangedIconForBundleIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__SearchUIImageCache_clearCacheAndPostNotificationForChangedIconForBundleIdentifier___block_invoke;
  v6[3] = &unk_1E6E72620;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  +[SearchUIUtilities dispatchMainIfNecessary:v6];
}

void __85__SearchUIImageCache_clearCacheAndPostNotificationForChangedIconForBundleIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) imageCache];
  [v2 removeAllObjects];

  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"SearchUIAppIconImageDidChangeNotification" object:*(void *)(a1 + 40)];
}

- (void)homeScreenService:(id)a3 homeScreenIconStyleConfigurationDidChange:(id)a4
{
}

- (void)appIconImageDidChange:(id)a3
{
  id v12 = a3;
  id v4 = [v12 name];
  if (![v4 isEqualToString:*MEMORY[0x1E4FB32A8]])
  {
LABEL_5:

    goto LABEL_6;
  }
  id v5 = [v12 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v4 = [v12 object];
    int64_t v7 = [(SearchUIImageCache *)self cachedUserInterfaceStyle];
    v8 = [v4 traitCollection];
    uint64_t v9 = [v8 userInterfaceStyle];

    if (v7 == v9) {
      goto LABEL_7;
    }
    v10 = [v4 traitCollection];
    -[SearchUIImageCache setCachedUserInterfaceStyle:](self, "setCachedUserInterfaceStyle:", [v10 userInterfaceStyle]);

    goto LABEL_5;
  }
LABEL_6:
  id v4 = [v12 userInfo];
  v11 = [v4 objectForKeyedSubscript:@"CFBundleIdentifier"];
  [(SearchUIImageCache *)self clearCacheAndPostNotificationForChangedIconForBundleIdentifier:v11];

LABEL_7:
}

- (void)dateDidChange
{
  id v3 = +[SearchUIUtilities bundleIdentifierForApp:4];
  [(SearchUIImageCache *)self clearCacheAndPostNotificationForChangedIconForBundleIdentifier:v3];
}

+ (id)cachedTlkImageForSFImage:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedCache];
  id v6 = [v5 imageCache];
  int64_t v7 = [v6 objectForKey:v4];

  return v7;
}

+ (void)cacheTLKImage:(id)a3 forSFImage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [a1 sharedCache];
  v8 = [v9 imageCache];
  [v8 setObject:v7 forKey:v6];
}

- (NSCache)imageCache
{
  return (NSCache *)objc_getProperty(self, a2, 8, 1);
}

- (void)setImageCache:(id)a3
{
}

- (int64_t)cachedUserInterfaceStyle
{
  return self->_cachedUserInterfaceStyle;
}

- (void)setCachedUserInterfaceStyle:(int64_t)a3
{
  self->_cachedUserInterfaceStyle = a3;
}

- (BSInvalidatable)homeScreenIconStyleObserver
{
  return self->_homeScreenIconStyleObserver;
}

- (void)setHomeScreenIconStyleObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenIconStyleObserver, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end
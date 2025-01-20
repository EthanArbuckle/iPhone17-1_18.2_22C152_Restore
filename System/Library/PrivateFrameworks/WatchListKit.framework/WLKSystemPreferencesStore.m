@interface WLKSystemPreferencesStore
+ (BOOL)isSystemPreferencesStoreInitializing;
+ (id)sharedPreferences;
+ (void)_synchronizeSettingsDefaultsForKeys:(id)a3;
- (BOOL)downloadsCompatibleWithAVAdapter;
- (BOOL)hasAVAdapterEvenBeenConnected;
- (BOOL)hasPostPlayAutoPlayNextVideoPreferences;
- (BOOL)postPlayAutoPlayNextVideo;
- (BOOL)privateModeEnabled;
- (BOOL)sportsScoreSpoilersAllowed;
- (BOOL)subtitleDefaultLanguageEnabledDownload;
- (BOOL)upNextLockupsUseCoverArt;
- (BOOL)useCellularDataDownload;
- (BOOL)useCellularDataPlayback;
- (NSArray)selectedAudioLanguagesDownload;
- (NSArray)subtitleAudioLanguagesDownload;
- (NSArray)supplementaryAvailableAudioLanguages;
- (NSNumber)preferredPlaybackDimensionality;
- (NSString)audioLanguageCode;
- (NSString)audioLanguageCodeIncludingSentinel;
- (NSString)cellularQualityDownload;
- (NSString)cellularQualityPlayback;
- (NSString)purchaseResolution;
- (NSString)wifiQualityDownload;
- (NSString)wifiQualityPlayback;
- (WLKSystemPreferencesStore)init;
- (id)_getPreferencesValue:(id)a3 fallbackValue:(id)a4;
- (void)_publishCrossProcessPreferencesChangedNotification;
- (void)_setDefaultsValue:(id)a3 key:(id)a4 syncNPS:(BOOL)a5;
- (void)_setPreferencesValue:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)migratePrivateModeFromDiskIfNeeded:(id)a3;
- (void)migrateSportsSpoilersFromDiskIfNeeded:(id)a3;
- (void)removePostPlayAutoPlayNextVideoPreferences;
- (void)setAudioLanguageCode:(id)a3;
- (void)setCellularQualityDownload:(id)a3;
- (void)setCellularQualityPlayback:(id)a3;
- (void)setDownloadsCompatibleWithAVAdapter:(BOOL)a3;
- (void)setHasAVAdapterEvenBeenConnected:(BOOL)a3;
- (void)setPostPlayAutoPlayNextVideo:(BOOL)a3;
- (void)setPreferredPlaybackDimensionality:(id)a3;
- (void)setPrivateModeEnabled:(BOOL)a3;
- (void)setPurchaseResolution:(id)a3;
- (void)setSelectedAudioLanguagesDownload:(id)a3;
- (void)setSportsScoreSpoilersAllowed:(BOOL)a3;
- (void)setSubtitleAudioLanguagesDownload:(id)a3;
- (void)setSubtitleDefaultLanguageEnabledDownload:(BOOL)a3;
- (void)setSupplementaryAvailableAudioLanguages:(id)a3;
- (void)setUpNextLockupsUseCoverArt:(BOOL)a3;
- (void)setUseCellularDataDownload:(BOOL)a3;
- (void)setUseCellularDataPlayback:(BOOL)a3;
- (void)setWifiQualityDownload:(id)a3;
- (void)setWifiQualityPlayback:(id)a3;
@end

@implementation WLKSystemPreferencesStore

- (BOOL)useCellularDataDownload
{
  v2 = [(WLKSystemPreferencesStore *)self _getPreferencesValue:@"DownloadUseCellular" fallbackValue:MEMORY[0x1E4F1CC28]];
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (id)sharedPreferences
{
  if (sharedPreferences___once != -1) {
    dispatch_once(&sharedPreferences___once, &__block_literal_global_27);
  }
  v2 = (void *)sharedPreferences___singleInstance;

  return v2;
}

- (void)migratePrivateModeFromDiskIfNeeded:(id)a3
{
  id v8 = a3;
  v4 = [(WLKSystemPreferencesStore *)self _getPreferencesValue:@"PrivateModeEnabled" fallbackValue:0];
  if (!v4)
  {
    v5 = [v8 objectForKeyedSubscript:@"PrivateModeEnabled"];

    if (!v5) {
      goto LABEL_5;
    }
    v6 = NSNumber;
    v4 = [v8 objectForKeyedSubscript:@"PrivateModeEnabled"];
    v7 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));
    [(WLKSystemPreferencesStore *)self _setPreferencesValue:v7 forKey:@"PrivateModeEnabled"];
  }
LABEL_5:
}

- (void)migrateSportsSpoilersFromDiskIfNeeded:(id)a3
{
  id v8 = a3;
  v4 = [(WLKSystemPreferencesStore *)self _getPreferencesValue:@"SportsScoreSpoilersAllowed" fallbackValue:0];
  if (!v4)
  {
    v5 = [v8 objectForKeyedSubscript:@"SportsScoreSpoilersAllowed"];

    if (!v5) {
      goto LABEL_5;
    }
    v6 = NSNumber;
    v4 = [v8 objectForKeyedSubscript:@"SportsScoreSpoilersAllowed"];
    v7 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));
    [(WLKSystemPreferencesStore *)self _setPreferencesValue:v7 forKey:@"SportsScoreSpoilersAllowed"];
  }
LABEL_5:
}

- (id)_getPreferencesValue:(id)a3 fallbackValue:(id)a4
{
  id v5 = a4;
  v6 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.videos-preferences");
  if (v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
    if ([v6 isEqual:v7]) {
      id v8 = v5;
    }
    else {
      id v8 = v6;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

- (BOOL)hasPostPlayAutoPlayNextVideoPreferences
{
  v2 = [(NSUserDefaults *)self->_defaultsAccessor objectForKey:@"PostPlayAutoPlayNextVideo"];
  BOOL v3 = v2 != 0;

  return v3;
}

void __46__WLKSystemPreferencesStore_sharedPreferences__block_invoke()
{
  os_unfair_lock_lock(&__initLock);
  __isInitializing = 1;
  v0 = objc_alloc_init(WLKSystemPreferencesStore);
  v1 = (void *)sharedPreferences___singleInstance;
  sharedPreferences___singleInstance = (uint64_t)v0;

  __isInitializing = 0;

  os_unfair_lock_unlock(&__initLock);
}

- (WLKSystemPreferencesStore)init
{
  v15.receiver = self;
  v15.super_class = (Class)WLKSystemPreferencesStore;
  v2 = [(WLKSystemPreferencesStore *)&v15 init];
  if (v2)
  {
    BOOL v3 = WLKSystemLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKSystemPreferencesStore - init", buf, 2u);
    }

    dispatch_queue_t v4 = dispatch_queue_create("WLKPreferencesQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v4;

    if (WLKIsTVApp())
    {
      uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      defaultsAccessor = v2->_defaultsAccessor;
      v2->_defaultsAccessor = (NSUserDefaults *)v6;
    }
    else
    {
      id v8 = objc_alloc(MEMORY[0x1E4F1CB18]);
      defaultsAccessor = WLKTVAppBundleID();
      uint64_t v9 = [v8 initWithSuiteName:defaultsAccessor];
      v10 = v2->_defaultsAccessor;
      v2->_defaultsAccessor = (NSUserDefaults *)v9;
    }
    v2->_preferencesDidChangeNotificationToken = 0;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __33__WLKSystemPreferencesStore_init__block_invoke;
    handler[3] = &unk_1E620AE50;
    v13 = v2;
    notify_register_dispatch("com.apple.WatchListKit.WLKPreferencesDidChangeNotification", &v2->_preferencesDidChangeNotificationToken, MEMORY[0x1E4F14428], handler);
  }
  return v2;
}

- (BOOL)upNextLockupsUseCoverArt
{
  BOOL v3 = [(NSUserDefaults *)self->_defaultsAccessor objectForKey:@"UpNextLockupsUseCoverArt"];

  if (!v3) {
    return 0;
  }
  defaultsAccessor = self->_defaultsAccessor;

  return [(NSUserDefaults *)defaultsAccessor BOOLForKey:@"UpNextLockupsUseCoverArt"];
}

- (BOOL)sportsScoreSpoilersAllowed
{
  BOOL v3 = [(NSUserDefaults *)self->_defaultsAccessor objectForKey:@"SportsScoreSpoilersAllowed"];

  if (!v3) {
    return 1;
  }
  defaultsAccessor = self->_defaultsAccessor;

  return [(NSUserDefaults *)defaultsAccessor BOOLForKey:@"SportsScoreSpoilersAllowed"];
}

- (NSString)audioLanguageCode
{
  return (NSString *)[(WLKSystemPreferencesStore *)self _getPreferencesValue:@"PreferredAudioLanguageCodeV2" fallbackValue:0];
}

- (NSString)wifiQualityPlayback
{
  return (NSString *)[(WLKSystemPreferencesStore *)self _getPreferencesValue:@"PlaybackQuality" fallbackValue:@"BestQuality"];
}

- (NSString)wifiQualityDownload
{
  return (NSString *)[(WLKSystemPreferencesStore *)self _getPreferencesValue:@"DownloadQualityWifi" fallbackValue:@"GoodQualityDownload"];
}

- (NSString)cellularQualityPlayback
{
  return (NSString *)[(WLKSystemPreferencesStore *)self _getPreferencesValue:@"PlaybackQualityCellular" fallbackValue:@"GoodQuality"];
}

- (NSString)cellularQualityDownload
{
  return (NSString *)[(WLKSystemPreferencesStore *)self _getPreferencesValue:@"DownloadQualityCellular" fallbackValue:@"GoodQualityDownload"];
}

+ (BOOL)isSystemPreferencesStoreInitializing
{
  os_unfair_lock_lock(&__initLock);
  char v2 = __isInitializing;
  os_unfair_lock_unlock(&__initLock);
  return v2;
}

- (BOOL)useCellularDataPlayback
{
  char v2 = [(WLKSystemPreferencesStore *)self _getPreferencesValue:@"CellularDataMode" fallbackValue:MEMORY[0x1E4F1CC28]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)subtitleDefaultLanguageEnabledDownload
{
  char v2 = [(WLKSystemPreferencesStore *)self _getPreferencesValue:@"UseDefaultSubtitleLanguages" fallbackValue:MEMORY[0x1E4F1CC38]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)downloadsCompatibleWithAVAdapter
{
  char v2 = [(WLKSystemPreferencesStore *)self _getPreferencesValue:@"DownloadsCompatibleWithAVAdapter" fallbackValue:MEMORY[0x1E4F1CC28]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSArray)subtitleAudioLanguagesDownload
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  dispatch_queue_t v4 = [(WLKSystemPreferencesStore *)self _getPreferencesValue:@"PreferredSubtitleLanguages" fallbackValue:v3];

  return (NSArray *)v4;
}

- (NSArray)selectedAudioLanguagesDownload
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  dispatch_queue_t v4 = [(WLKSystemPreferencesStore *)self _getPreferencesValue:@"PreferredAudioLanguages" fallbackValue:v3];

  return (NSArray *)v4;
}

void __33__WLKSystemPreferencesStore_init__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 8), &state64);
  if (state64 != getpid())
  {
    v1 = WLKSystemLogObject();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v5 = @"WLKSettingsDidChangeNotification";
      _os_log_impl(&dword_1BA2E8000, v1, OS_LOG_TYPE_DEFAULT, "WLKSystemPreferencesStore - Preferences did change - Firing local notification %@", buf, 0xCu);
    }

    char v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:@"WLKSettingsDidChangeNotification" object:0];
  }
}

- (void)dealloc
{
  int preferencesDidChangeNotificationToken = self->_preferencesDidChangeNotificationToken;
  if (preferencesDidChangeNotificationToken) {
    notify_cancel(preferencesDidChangeNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)WLKSystemPreferencesStore;
  [(WLKSystemPreferencesStore *)&v4 dealloc];
}

- (void)setUseCellularDataPlayback:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WLKSystemPreferencesStore *)self _setPreferencesValue:v4 forKey:@"CellularDataMode"];
}

- (void)setCellularQualityPlayback:(id)a3
{
}

- (void)setWifiQualityPlayback:(id)a3
{
}

- (void)setUseCellularDataDownload:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WLKSystemPreferencesStore *)self _setPreferencesValue:v4 forKey:@"DownloadUseCellular"];
}

- (void)setCellularQualityDownload:(id)a3
{
}

- (void)setWifiQualityDownload:(id)a3
{
}

- (void)setSelectedAudioLanguagesDownload:(id)a3
{
}

- (void)setSubtitleAudioLanguagesDownload:(id)a3
{
}

- (void)setSubtitleDefaultLanguageEnabledDownload:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WLKSystemPreferencesStore *)self _setPreferencesValue:v4 forKey:@"UseDefaultSubtitleLanguages"];
}

- (void)setAudioLanguageCode:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"AUTO_SENTINEL_VALUE"])
  {

    id v4 = 0;
  }
  else
  {
    id v4 = v5;
  }
  id v6 = v4;
  [(WLKSystemPreferencesStore *)self _setPreferencesValue:v4 forKey:@"PreferredAudioLanguageCodeV2"];
}

- (NSString)audioLanguageCodeIncludingSentinel
{
  char v2 = [(WLKSystemPreferencesStore *)self audioLanguageCode];
  if (!v2) {
    char v2 = @"AUTO_SENTINEL_VALUE";
  }

  return (NSString *)v2;
}

- (void)setSupplementaryAvailableAudioLanguages:(id)a3
{
}

- (NSArray)supplementaryAvailableAudioLanguages
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  id v4 = [(WLKSystemPreferencesStore *)self _getPreferencesValue:@"SupplementaryAvailableAudioLanguages" fallbackValue:v3];

  return (NSArray *)v4;
}

- (void)setPurchaseResolution:(id)a3
{
}

- (NSString)purchaseResolution
{
  return (NSString *)[(WLKSystemPreferencesStore *)self _getPreferencesValue:@"PreferredPurchaseResolution" fallbackValue:@"0"];
}

- (void)setHasAVAdapterEvenBeenConnected:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WLKSystemPreferencesStore *)self _setPreferencesValue:v4 forKey:@"HasAVAdapterEverBeenConnected"];
}

- (BOOL)hasAVAdapterEvenBeenConnected
{
  char v2 = [(WLKSystemPreferencesStore *)self _getPreferencesValue:@"HasAVAdapterEverBeenConnected" fallbackValue:MEMORY[0x1E4F1CC28]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setDownloadsCompatibleWithAVAdapter:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WLKSystemPreferencesStore *)self _setPreferencesValue:v4 forKey:@"DownloadsCompatibleWithAVAdapter"];
}

- (void)setPreferredPlaybackDimensionality:(id)a3
{
}

- (NSNumber)preferredPlaybackDimensionality
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  id v11 = &unk_1F13D9860;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__WLKSystemPreferencesStore_preferredPlaybackDimensionality__block_invoke;
  v5[3] = &unk_1E620B250;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

uint64_t __60__WLKSystemPreferencesStore_preferredPlaybackDimensionality__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:@"PreferredPlaybackDimensionality"];

  if (v2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "integerForKey:", @"PreferredPlaybackDimensionality"));
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = &unk_1F13D9860;
  }

  return MEMORY[0x1F41817F8]();
}

- (void)setPrivateModeEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WLKSystemPreferencesStore *)self _setDefaultsValue:v4 key:@"PrivateModeEnabled" syncNPS:0];
}

- (BOOL)privateModeEnabled
{
  id v3 = [(NSUserDefaults *)self->_defaultsAccessor objectForKey:@"PrivateModeEnabled"];

  if (!v3) {
    return 0;
  }
  defaultsAccessor = self->_defaultsAccessor;

  return [(NSUserDefaults *)defaultsAccessor BOOLForKey:@"PrivateModeEnabled"];
}

- (void)setSportsScoreSpoilersAllowed:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WLKSystemPreferencesStore *)self _setDefaultsValue:v4 key:@"SportsScoreSpoilersAllowed" syncNPS:1];
}

- (void)setPostPlayAutoPlayNextVideo:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WLKSystemPreferencesStore *)self _setDefaultsValue:v4 key:@"PostPlayAutoPlayNextVideo" syncNPS:1];
}

- (BOOL)postPlayAutoPlayNextVideo
{
  id v3 = [(NSUserDefaults *)self->_defaultsAccessor objectForKey:@"PostPlayAutoPlayNextVideo"];

  if (!v3) {
    return 1;
  }
  defaultsAccessor = self->_defaultsAccessor;

  return [(NSUserDefaults *)defaultsAccessor BOOLForKey:@"PostPlayAutoPlayNextVideo"];
}

- (void)setUpNextLockupsUseCoverArt:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WLKSystemPreferencesStore *)self _setDefaultsValue:v4 key:@"UpNextLockupsUseCoverArt" syncNPS:0];
}

- (void)removePostPlayAutoPlayNextVideoPreferences
{
  id v3 = [(NSUserDefaults *)self->_defaultsAccessor objectForKey:@"PostPlayAutoPlayNextVideo"];

  if (v3)
  {
    defaultsAccessor = self->_defaultsAccessor;
    [(NSUserDefaults *)defaultsAccessor removeObjectForKey:@"PostPlayAutoPlayNextVideo"];
  }
}

- (void)_publishCrossProcessPreferencesChangedNotification
{
  objc_initWeak(&location, self);
  char v2 = dispatch_get_global_queue(0, 0);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__WLKSystemPreferencesStore__publishCrossProcessPreferencesChangedNotification__block_invoke;
  v3[3] = &unk_1E620A550;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __79__WLKSystemPreferencesStore__publishCrossProcessPreferencesChangedNotification__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v2 = WeakRetained[2];
    id v4 = WeakRetained;
    pid_t v3 = getpid();
    notify_set_state(v2, v3);
    notify_post("com.apple.WatchListKit.WLKPreferencesDidChangeNotification");
    WeakRetained = v4;
  }
}

- (void)_setDefaultsValue:(id)a3 key:(id)a4 syncNPS:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  accessQueue = self->_accessQueue;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  objc_super v15 = __59__WLKSystemPreferencesStore__setDefaultsValue_key_syncNPS___block_invoke;
  v16 = &unk_1E620B278;
  v17 = self;
  id v18 = v8;
  id v19 = v9;
  BOOL v20 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(accessQueue, &v13);
  [(WLKSystemPreferencesStore *)self _publishCrossProcessPreferencesChangedNotification];
}

void __59__WLKSystemPreferencesStore__setDefaultsValue_key_syncNPS___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  int v2 = WLKSystemLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    _os_log_impl(&dword_1BA2E8000, v2, OS_LOG_TYPE_DEFAULT, "WLKSystemPreferencesStore - set UserDefaults value %@ for key %@", buf, 0x16u);
  }

  if (*(unsigned char *)(a1 + 56))
  {
    id v5 = objc_opt_class();
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = *(void *)(a1 + 48);
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
    id v8 = [v6 setWithArray:v7];
    [v5 _synchronizeSettingsDefaultsForKeys:v8];
  }
}

- (void)_setPreferencesValue:(id)a3 forKey:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (__CFString *)a4;
  CFPreferencesSetAppValue(v7, v6, @"com.apple.videos-preferences");
  CFPreferencesAppSynchronize(@"com.apple.videos-preferences");
  id v8 = WLKSystemLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    id v10 = v6;
    __int16 v11 = 2112;
    __int16 v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = @"com.apple.videos-preferences";
    _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKSystemPreferencesStore - set CFPrefs value %@ for key %@ in domain %@", (uint8_t *)&v9, 0x20u);
  }

  [(WLKSystemPreferencesStore *)self _publishCrossProcessPreferencesChangedNotification];
}

+ (void)_synchronizeSettingsDefaultsForKeys:(id)a3
{
  id v3 = a3;
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__WLKSystemPreferencesStore__synchronizeSettingsDefaultsForKeys___block_invoke;
  block[3] = &unk_1E620A708;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __65__WLKSystemPreferencesStore__synchronizeSettingsDefaultsForKeys___block_invoke(uint64_t a1)
{
  int v2 = WLKSystemLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA2E8000, v2, OS_LOG_TYPE_DEFAULT, "WLKSystemPreferencesStore - NPSManager sync begin", buf, 2u);
  }

  id v3 = objc_alloc_init(MEMORY[0x1E4F79CE0]);
  uint64_t v4 = WLKTVAppBundleID();
  [v3 synchronizeUserDefaultsDomain:v4 keys:*(void *)(a1 + 32)];

  id v5 = WLKSystemLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKSystemPreferencesStore - NPSManager sync end", v6, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_defaultsAccessor, 0);
}

@end
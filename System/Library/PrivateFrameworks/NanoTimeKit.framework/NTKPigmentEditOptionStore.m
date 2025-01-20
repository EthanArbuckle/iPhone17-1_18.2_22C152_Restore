@interface NTKPigmentEditOptionStore
+ (NTKPigmentEditOptionStore)sharedInstance;
- (BOOL)hasAddableCollectionsForDomain:(id)a3 bundle:(id)a4 slot:(id)a5;
- (BOOL)isCacheRussiaLocaleStateChanged;
- (BOOL)isOptionVisible:(id)a3;
- (BOOL)persistenceCacheEnabled;
- (BOOL)prewarmed;
- (BOOL)shouldClearPersistanceStoreCache;
- (BOOL)shouldForceResetingPersistentCache;
- (CLKDevice)device;
- (NSCache)cache;
- (NSDictionary)sharedCollections;
- (NSMutableDictionary)listenersByDomain;
- (NTKFaceColorPalette)palette;
- (NTKPigmentEditOptionStore)init;
- (NTKPigmentPersistentStorageController)storageController;
- (NTKPigmentPreferenceManager)preferenceManager;
- (NTKPlistPigmentEditOptionLoader)plistLoader;
- (OS_dispatch_queue)privateQueue;
- (id)_companion_loadPigmentSetForDomain:(id)a3 bundle:(id)a4;
- (id)_loadPigmentSetForDomain:(id)a3 bundle:(id)a4;
- (id)_migratedOptionForInvalidOption:(id)a3 collection:(id)a4;
- (id)_normalizeOptionForOption:(id)a3 domain:(id)a4 bundle:(id)a5 slot:(id)a6;
- (id)_threadunsafe_sharedCollections;
- (id)_watch_loadPigmentSetForDomain:(id)a3 bundle:(id)a4;
- (id)colorOptionsForDomain:(id)a3 bundle:(id)a4 slot:(id)a5;
- (id)defaultColorOptionForDomain:(id)a3 bundle:(id)a4 slot:(id)a5;
- (id)defaultGalleryColorsForDomain:(id)a3 bundle:(id)a4;
- (id)fulfilledOptionForOption:(id)a3 domain:(id)a4 bundle:(id)a5 slot:(id)a6;
- (id)migratedOptionForInvalidOption:(id)a3 domain:(id)a4 bundle:(id)a5 slot:(id)a6;
- (id)optionAtIndex:(unint64_t)a3 domain:(id)a4 bundle:(id)a5 slot:(id)a6;
- (id)pigmentSetForDomain:(id)a3 bundle:(id)a4;
- (os_unfair_lock_s)lock;
- (unint64_t)indexOfOption:(id)a3 domain:(id)a4 bundle:(id)a5 slot:(id)a6;
- (unint64_t)numberOfOptionsForDomain:(id)a3 bundle:(id)a4 slot:(id)a5;
- (void)_autoSelectPigmentsForSharedCollections:(id)a3;
- (void)_autoSelectPigmentsFromFacePigmentSet:(id)a3;
- (void)_companion_setupPersistentStorage;
- (void)_setupPlistLoader;
- (void)_threadunsafe_resetCache;
- (void)_threadunsafe_sharedCollections;
- (void)addListener:(id)a3 forDomain:(id)a4;
- (void)colorBundleContentChanged;
- (void)deletePersistenceLayerCache;
- (void)faceBundlesUpdated;
- (void)handleActiveDeviceChangedNotification;
- (void)notifyListenersStoreContentChanged;
- (void)removeListener:(id)a3 forDomain:(id)a4;
- (void)resetCacheAndNotifyListeners;
- (void)savePersistentCacheVersion;
- (void)sensitiveUIStateChanged;
- (void)setCache:(id)a3;
- (void)setDevice:(id)a3;
- (void)setIgnoreSensitiveUIItems:(BOOL)a3;
- (void)setIncludesAllDeviceSpecificColors:(BOOL)a3;
- (void)setListenersByDomain:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setOption:(id)a3 visible:(BOOL)a4;
- (void)setPalette:(id)a3;
- (void)setPersistenceCacheEnabled:(BOOL)a3;
- (void)setPlistLoader:(id)a3;
- (void)setPreferenceManager:(id)a3;
- (void)setPrewarmed:(BOOL)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setSharedCollections:(id)a3;
- (void)setStorageController:(id)a3;
@end

@implementation NTKPigmentEditOptionStore

- (void)removeListener:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  v7 = (__CFString *)a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__NTKPigmentEditOptionStore_removeListener_forDomain___block_invoke;
  v12[3] = &unk_1E62C04F0;
  if (v7) {
    v8 = v7;
  }
  else {
    v8 = @"AllDomains";
  }
  p_lock = &self->_lock;
  v12[4] = self;
  v13 = v8;
  id v14 = v6;
  id v10 = v6;
  v11 = v8;
  _executeWithLock(p_lock, v12);
}

void __54__NTKPigmentEditOptionStore_removeListener_forDomain___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v2 removeObject:*(void *)(a1 + 48)];
  if (![v2 count])
  {
    v3 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v9 = 138543362;
      uint64_t v10 = v4;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_INFO, "#store No more listeners for domain  %{public}@. Purging memory cache.", (uint8_t *)&v9, 0xCu);
    }

    v5 = [*(id *)(a1 + 32) cache];
    [v5 removeObjectForKey:*(void *)(a1 + 40)];
  }
  if (![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    id v6 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_INFO, "#store No more listeners. Purging shared collections.", (uint8_t *)&v9, 2u);
    }

    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = 0;
  }
}

+ (NTKPigmentEditOptionStore)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__NTKPigmentEditOptionStore_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_8 != -1) {
    dispatch_once(&sharedInstance_onceToken_8, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return (NTKPigmentEditOptionStore *)v2;
}

void __43__NTKPigmentEditOptionStore_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v1;
}

- (NTKPigmentEditOptionStore)init
{
  v17.receiver = self;
  v17.super_class = (Class)NTKPigmentEditOptionStore;
  v2 = [(NTKPigmentEditOptionStore *)&v17 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    uint64_t v5 = [v4 device];
    device = v3->_device;
    v3->_device = (CLKDevice *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    listenersByDomain = v3->_listenersByDomain;
    v3->_listenersByDomain = (NSMutableDictionary *)v7;

    int v9 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    cache = v3->_cache;
    v3->_cache = v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.NanoTimeKit.NTKPigmentEditOptionStore", 0);
    privateQueue = v3->_privateQueue;
    v3->_privateQueue = (OS_dispatch_queue *)v11;

    v13 = objc_alloc_init(NTKPigmentPreferenceManager);
    preferenceManager = v3->_preferenceManager;
    v3->_preferenceManager = v13;

    [(NTKPigmentPreferenceManager *)v3->_preferenceManager setDelegate:v3];
    v3->_persistenceCacheEnabled = CLKIsClockFaceApp();
    [(NTKPigmentEditOptionStore *)v3 _setupPlistLoader];
    [(NTKPigmentEditOptionStore *)v3 _companion_setupPersistentStorage];
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v3 selector:sel_colorBundleContentChanged name:@"NTKColorBundleContentChangedNotificationName" object:0];
  }
  return v3;
}

- (void)_setupPlistLoader
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(NTKPlistPigmentEditOptionLoader);
  plistLoader = self->_plistLoader;
  self->_plistLoader = v3;

  uint64_t v5 = [MEMORY[0x1E4F19A98] sharedMonitor];
  -[NTKPlistPigmentEditOptionLoader setIgnoreSensitiveUIItems:](self->_plistLoader, "setIgnoreSensitiveUIItems:", [v5 isSensitiveUIEnabled] ^ 1);

  id v6 = [MEMORY[0x1E4F19A98] sharedMonitor];
  [v6 addSensitiveUIObserver:self];

  uint64_t v7 = [(CLKDevice *)self->_device deviceBrand];
  v8 = v7;
  if (v7 && [v7 integerValue])
  {
    [(NTKPlistPigmentEditOptionLoader *)self->_plistLoader setSku:v8];
    int v9 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(NTKPlistPigmentEditOptionLoader *)self->_plistLoader sku];
      int v23 = 138543362;
      v24 = v10;
      _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "#store Plist loader configured with deviceBrand %{public}@", (uint8_t *)&v23, 0xCu);
    }
  }
  uint64_t v11 = [(CLKDevice *)self->_device materialType];
  if (v11)
  {
    v12 = [NSNumber numberWithUnsignedInteger:v11];
    [(NTKPlistPigmentEditOptionLoader *)self->_plistLoader setClhs:v12];

    v13 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(NTKPlistPigmentEditOptionLoader *)self->_plistLoader clhs];
      int v23 = 138543362;
      v24 = v14;
      _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_DEFAULT, "#store Plist loader configured with material %{public}@", (uint8_t *)&v23, 0xCu);
    }
  }
  uint64_t v15 = [(CLKDevice *)self->_device productFamilyType];
  if (v15 != -1)
  {
    v16 = [NSNumber numberWithInteger:v15];
    [(NTKPlistPigmentEditOptionLoader *)self->_plistLoader setFamily:v16];

    objc_super v17 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [(NTKPlistPigmentEditOptionLoader *)self->_plistLoader family];
      int v23 = 138543362;
      v24 = v18;
      _os_log_impl(&dword_1BC5A9000, v17, OS_LOG_TYPE_DEFAULT, "#store Plist loader configured with family %{public}@", (uint8_t *)&v23, 0xCu);
    }
  }
  [(NTKPlistPigmentEditOptionLoader *)self->_plistLoader setIncludesAllDeviceSpecificColors:NTKShowHardwareSpecificFaces()];
  v19 = +[NTKColorBundleLoader sharedInstance];
  v20 = [v19 loadColorBundles];
  [(NTKPlistPigmentEditOptionLoader *)self->_plistLoader setAdditionalBundles:v20];

  v21 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = [(NTKPlistPigmentEditOptionLoader *)self->_plistLoader additionalBundles];
    int v23 = 138543362;
    v24 = v22;
    _os_log_impl(&dword_1BC5A9000, v21, OS_LOG_TYPE_DEFAULT, "#store Additional color bundles loaded: %{public}@", (uint8_t *)&v23, 0xCu);
  }
}

- (void)setIncludesAllDeviceSpecificColors:(BOOL)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__NTKPigmentEditOptionStore_setIncludesAllDeviceSpecificColors___block_invoke;
  v4[3] = &unk_1E62C1BF0;
  v4[4] = self;
  BOOL v5 = a3;
  _executeWithLock(&self->_lock, v4);
  [(NTKPigmentEditOptionStore *)self resetCacheAndNotifyListeners];
}

void __64__NTKPigmentEditOptionStore_setIncludesAllDeviceSpecificColors___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) plistLoader];
  [v2 setIncludesAllDeviceSpecificColors:v1];
}

- (void)setIgnoreSensitiveUIItems:(BOOL)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__NTKPigmentEditOptionStore_setIgnoreSensitiveUIItems___block_invoke;
  v4[3] = &unk_1E62C1BF0;
  v4[4] = self;
  BOOL v5 = a3;
  _executeWithLock(&self->_lock, v4);
  [(NTKPigmentEditOptionStore *)self resetCacheAndNotifyListeners];
}

void __55__NTKPigmentEditOptionStore_setIgnoreSensitiveUIItems___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) plistLoader];
  [v2 setIgnoreSensitiveUIItems:v1];
}

- (void)setPersistenceCacheEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__NTKPigmentEditOptionStore_setPersistenceCacheEnabled___block_invoke;
  v3[3] = &unk_1E62C1BF0;
  v3[4] = self;
  BOOL v4 = a3;
  _executeWithLock(&self->_lock, v3);
}

uint64_t __56__NTKPigmentEditOptionStore_setPersistenceCacheEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)isCacheRussiaLocaleStateChanged
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v4 = [v3 objectForKey:@"NTKPigmentEditOptionStoreLocaleRussia"];

  int v5 = NTKGizmoOrCompanionAreRussian(self->_device);
  if (v4) {
    int v6 = v5 ^ [v4 BOOLValue];
  }
  else {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (BOOL)shouldClearPersistanceStoreCache
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_persistenceCacheEnabled)
  {
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    BOOL v4 = [v3 objectForKey:@"NTKPigmentEditOptionStoreBuildVersion"];

    int v5 = NTKBuildVersion();
    uint64_t v6 = [v4 isEqualToString:v5] ^ 1;
    BOOL v7 = [(NTKPigmentEditOptionStore *)self shouldForceResetingPersistentCache];
    BOOL v8 = [(NTKPigmentEditOptionStore *)self isCacheRussiaLocaleStateChanged];
    int v9 = v6 | (v7 || v8);
    if (v9 == 1)
    {
      BOOL v10 = v8;
      if (v7) {
        [(NTKPigmentEditOptionStore *)self savePersistentCacheVersion];
      }
      uint64_t v11 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v16 = 134218496;
        uint64_t v17 = v6;
        __int16 v18 = 2048;
        BOOL v19 = v7;
        __int16 v20 = 2048;
        BOOL v21 = v10;
        _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_INFO, "#store It should clear persistent cache. versionChanged: %lu, force: %lu, LocaleChanged: %lu", (uint8_t *)&v16, 0x20u);
      }

      v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v12 setObject:v5 forKey:@"NTKPigmentEditOptionStoreBuildVersion"];

      if (!v10)
      {
        LOBYTE(v9) = 1;
        goto LABEL_14;
      }
      v13 = [NSNumber numberWithBool:NTKGizmoOrCompanionAreRussian(self->_device)];
      id v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v14 setObject:v13 forKey:@"NTKPigmentEditOptionStoreLocaleRussia"];
    }
    else
    {
      v13 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_INFO, "#store Persistent pigment cache won't be reset.", (uint8_t *)&v16, 2u);
      }
    }

LABEL_14:
    return v9;
  }
  LOBYTE(v9) = 0;
  return v9;
}

- (void)savePersistentCacheVersion
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v2 = [NSNumber numberWithInteger:0];
  [v3 setObject:v2 forKey:@"NTKPigmentPersistentCacheVersionKey"];
}

- (BOOL)shouldForceResetingPersistentCache
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"NTKPigmentPersistentCacheVersionKey"];
  uint64_t v4 = [v3 integerValue];

  if (v4) {
    return 1;
  }

  return NTKShowHardwareSpecificFaces();
}

- (void)_companion_setupPersistentStorage
{
  id v3 = objc_alloc_init(NTKPigmentPersistentStorageController);
  storageController = self->_storageController;
  self->_storageController = v3;

  int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_handleActiveDeviceChangedNotification name:*MEMORY[0x1E4F19620] object:0];

  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel_faceBundlesUpdated name:@"NTKFaceBundleManagerDidUpdateBundlesNotificationName" object:0];

  objc_initWeak(&location, self);
  BOOL v7 = +[NTKDarwinNotificationCenter defaultCenter];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__NTKPigmentEditOptionStore__companion_setupPersistentStorage__block_invoke;
  v8[3] = &unk_1E62C0068;
  objc_copyWeak(&v9, &location);
  [v7 addObserver:self notificationName:@"NTKColorSyncDataUpdatedNotificationName" usingBlock:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __62__NTKPigmentEditOptionStore__companion_setupPersistentStorage__block_invoke(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_INFO, "#store received darwin notification pigment sync data updated from daemon.", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained resetCache];
  }
}

- (id)pigmentSetForDomain:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v17 = 0;
    __int16 v18 = &v17;
    uint64_t v19 = 0x3032000000;
    __int16 v20 = __Block_byref_object_copy__20;
    BOOL v21 = __Block_byref_object_dispose__20;
    id v22 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__NTKPigmentEditOptionStore_pigmentSetForDomain_bundle___block_invoke;
    v14[3] = &unk_1E62C2810;
    int v16 = &v17;
    v14[4] = self;
    id v8 = v6;
    id v15 = v8;
    _executeWithLock(&self->_lock, v14);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = 0;
    }
    else
    {
      BOOL v10 = (void *)v18[5];
      if (!v10)
      {
        uint64_t v11 = [(NTKPigmentEditOptionStore *)self _loadPigmentSetForDomain:v8 bundle:v7];
        v12 = (void *)v18[5];
        v18[5] = v11;

        BOOL v10 = (void *)v18[5];
      }
      id v9 = v10;
    }

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __56__NTKPigmentEditOptionStore_pigmentSetForDomain_bundle___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 40) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)colorOptionsForDomain:(id)a3 bundle:(id)a4 slot:(id)a5
{
  id v8 = a5;
  id v9 = [(NTKPigmentEditOptionStore *)self pigmentSetForDomain:a3 bundle:a4];
  BOOL v10 = [v9 collectionForSlot:v8];

  uint64_t v11 = [v10 allItems];

  return v11;
}

- (NSDictionary)sharedCollections
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__20;
  id v9 = __Block_byref_object_dispose__20;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__NTKPigmentEditOptionStore_sharedCollections__block_invoke;
  v4[3] = &unk_1E62C3040;
  v4[4] = self;
  void v4[5] = &v5;
  _executeWithLock(&self->_lock, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDictionary *)v2;
}

void __46__NTKPigmentEditOptionStore_sharedCollections__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_threadunsafe_sharedCollections");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_threadunsafe_sharedCollections
{
  sharedCollections = self->_sharedCollections;
  if (!sharedCollections)
  {
    uint64_t v4 = [(NTKPigmentPersistentStorageController *)self->_storageController sharedCollections];
    if (!v4)
    {
      id v5 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[NTKPigmentEditOptionStore _threadunsafe_sharedCollections](v5);
      }

      id v6 = [(NTKPigmentEditOptionStore *)self plistLoader];
      uint64_t v4 = [v6 loadSharedCollections];
    }
    uint64_t v7 = self->_sharedCollections;
    self->_sharedCollections = v4;

    sharedCollections = self->_sharedCollections;
  }

  return sharedCollections;
}

- (id)_loadPigmentSetForDomain:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(NTKPigmentEditOptionStore *)self _companion_loadPigmentSetForDomain:v6 bundle:a4];
  p_lock = &self->_lock;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__NTKPigmentEditOptionStore__loadPigmentSetForDomain_bundle___block_invoke;
  v14[3] = &unk_1E62C04F0;
  id v9 = v7;
  id v15 = v9;
  int v16 = self;
  id v17 = v6;
  id v10 = v6;
  _executeWithLock(p_lock, v14);
  uint64_t v11 = v17;
  id v12 = v9;

  return v12;
}

void __61__NTKPigmentEditOptionStore__loadPigmentSetForDomain_bundle___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void **)(v2 + 40);
  if (a1[4])
  {
    uint64_t v4 = *(void **)(v2 + 40);
    objc_msgSend(v4, "setObject:forKey:");
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    [v3 setObject:v5 forKey:a1[6]];
  }
}

- (id)_watch_loadPigmentSetForDomain:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NTKPigmentEditOptionStore *)self sharedCollections];
  id v9 = [(NTKPigmentPersistentStorageController *)self->_storageController facePigmentSetForDomain:v6 sharedCollections:v8];
  if (!v9)
  {
    id v10 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[NTKPigmentEditOptionStore _watch_loadPigmentSetForDomain:bundle:]((uint64_t)v6, v10);
    }

    id v9 = [(NTKPlistPigmentEditOptionLoader *)self->_plistLoader parseColorOptionsForDomain:v6 bundle:v7 sharedCollections:v8];
    if (self->_persistenceCacheEnabled)
    {
      privateQueue = self->_privateQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__NTKPigmentEditOptionStore__watch_loadPigmentSetForDomain_bundle___block_invoke;
      block[3] = &unk_1E62C04F0;
      id v14 = v6;
      id v15 = self;
      id v9 = v9;
      id v16 = v9;
      dispatch_async(privateQueue, block);
    }
  }

  return v9;
}

uint64_t __67__NTKPigmentEditOptionStore__watch_loadPigmentSetForDomain_bundle___block_invoke(uint64_t a1)
{
  uint64_t v2 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __67__NTKPigmentEditOptionStore__watch_loadPigmentSetForDomain_bundle___block_invoke_cold_1(a1, v2);
  }

  [*(id *)(a1 + 40) _autoSelectPigmentsFromFacePigmentSet:*(void *)(a1 + 48)];
  return [*(id *)(*(void *)(a1 + 40) + 64) persistFacePigmentSet:*(void *)(a1 + 48) deviceUUID:0];
}

- (id)_companion_loadPigmentSetForDomain:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NTKPigmentEditOptionStore *)self sharedCollections];
  id v9 = [(NTKPigmentPersistentStorageController *)self->_storageController facePigmentSetForDomain:v6 sharedCollections:v8];
  id v10 = v9;
  if (!v9 || ![v9 numberOfItemsForAllSlots])
  {
    uint64_t v11 = [(CLKDevice *)self->_device nrDevice];

    if (v11)
    {
      id v12 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[NTKPigmentEditOptionStore _companion_loadPigmentSetForDomain:bundle:]((uint64_t)v6, v12);
      }
    }
    uint64_t v13 = [(NTKPlistPigmentEditOptionLoader *)self->_plistLoader parseColorOptionsForDomain:v6 bundle:v7 sharedCollections:v8];

    id v10 = (void *)v13;
  }

  return v10;
}

- (void)_autoSelectPigmentsFromFacePigmentSet:(id)a3
{
  id v7 = a3;
  if (CLKIsClockFaceApp())
  {
    uint64_t v4 = [v7 pigmentsFromMostRecentAddableCollectionForSlot:0];
    preferenceManager = self->_preferenceManager;
    id v6 = [v7 domain];
    [(NTKPigmentPreferenceManager *)preferenceManager setAutoSelectedPigments:v4 forCollectionName:v6];
  }
}

- (void)_autoSelectPigmentsForSharedCollections:(id)a3
{
  id v4 = a3;
  if (CLKIsClockFaceApp())
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __69__NTKPigmentEditOptionStore__autoSelectPigmentsForSharedCollections___block_invoke;
    v5[3] = &unk_1E62C3C50;
    v5[4] = self;
    [v4 enumerateKeysAndObjectsUsingBlock:v5];
  }
}

void __69__NTKPigmentEditOptionStore__autoSelectPigmentsForSharedCollections___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if ([v7 isRootCollection])
  {
    id v4 = [v7 pigmentsFromMostRecentAddableCollection];
    id v5 = *(void **)(*(void *)(a1 + 32) + 72);
    id v6 = [v7 collectionName];
    [v5 setAutoSelectedPigments:v4 forCollectionName:v6];
  }
}

- (id)defaultColorOptionForDomain:(id)a3 bundle:(id)a4 slot:(id)a5
{
  id v8 = a5;
  id v9 = [(NTKPigmentEditOptionStore *)self pigmentSetForDomain:a3 bundle:a4];
  id v10 = [v9 collectionForSlot:v8];

  uint64_t v11 = [v10 defaultOption];

  return v11;
}

- (unint64_t)numberOfOptionsForDomain:(id)a3 bundle:(id)a4 slot:(id)a5
{
  id v8 = a5;
  id v9 = [(NTKPigmentEditOptionStore *)self pigmentSetForDomain:a3 bundle:a4];
  id v10 = [v9 collectionForSlot:v8];

  unint64_t v11 = [v10 count];
  return v11;
}

- (unint64_t)indexOfOption:(id)a3 domain:(id)a4 bundle:(id)a5 slot:(id)a6
{
  id v10 = a3;
  unint64_t v11 = [(NTKPigmentEditOptionStore *)self colorOptionsForDomain:a4 bundle:a5 slot:a6];
  unint64_t v12 = [v11 indexOfObject:v10];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[NTKPigmentEditOption defaultFraction];
    uint64_t v13 = objc_msgSend(v10, "copyWithColorFraction:");
    unint64_t v12 = [v11 indexOfObject:v13];
  }
  return v12;
}

- (id)optionAtIndex:(unint64_t)a3 domain:(id)a4 bundle:(id)a5 slot:(id)a6
{
  id v7 = [(NTKPigmentEditOptionStore *)self colorOptionsForDomain:a4 bundle:a5 slot:a6];
  if ([v7 count] <= a3)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v7 objectAtIndex:a3];
  }

  return v8;
}

- (id)defaultGalleryColorsForDomain:(id)a3 bundle:(id)a4
{
  id v4 = [(NTKPigmentEditOptionStore *)self pigmentSetForDomain:a3 bundle:a4];
  id v5 = [v4 defaultGalleryColors];

  return v5;
}

- (BOOL)hasAddableCollectionsForDomain:(id)a3 bundle:(id)a4 slot:(id)a5
{
  id v8 = a5;
  id v9 = [(NTKPigmentEditOptionStore *)self pigmentSetForDomain:a3 bundle:a4];
  id v10 = [v9 collectionForSlot:v8];

  LOBYTE(self) = [v10 hasAddableCollection];
  return (char)self;
}

- (id)fulfilledOptionForOption:(id)a3 domain:(id)a4 bundle:(id)a5 slot:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 isFromStore])
  {
    id v14 = v10;
  }
  else
  {
    unint64_t v15 = [(NTKPigmentEditOptionStore *)self indexOfOption:v10 domain:v11 bundle:v12 slot:v13];
    if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
      [(NTKPigmentEditOptionStore *)self _normalizeOptionForOption:v10 domain:v11 bundle:v12 slot:v13];
    }
    else {
    id v16 = [(NTKPigmentEditOptionStore *)self optionAtIndex:v15 domain:v11 bundle:v12 slot:v13];
    }
    id v14 = v16;
    if (!v16
      || ([v16 colorFraction], double v18 = v17, objc_msgSend(v10, "colorFraction"), v18 != v19)
      && ([v10 colorFraction],
          uint64_t v20 = objc_msgSend(v14, "copyWithColorFraction:"),
          v14,
          (id v14 = (id)v20) == 0))
    {
      BOOL v21 = [(NTKPigmentEditOptionStore *)self pigmentSetForDomain:v11 bundle:v12];
      id v22 = [v21 collectionForSlot:v13];

      int v23 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[NTKPigmentEditOptionStore fulfilledOptionForOption:domain:bundle:slot:]((uint64_t)v10, (uint64_t)v22, v23);
      }

      id v14 = v10;
    }
  }

  return v14;
}

- (id)migratedOptionForInvalidOption:(id)a3 domain:(id)a4 bundle:(id)a5 slot:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(NTKPigmentEditOptionStore *)self pigmentSetForDomain:v11 bundle:a5];
  id v14 = [v13 collectionForSlot:v12];

  unint64_t v15 = [(NTKPigmentEditOptionStore *)self _migratedOptionForInvalidOption:v10 collection:v14];
  id v16 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  double v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543874;
      id v23 = v10;
      __int16 v24 = 2114;
      id v25 = v15;
      __int16 v26 = 2114;
      id v27 = v11;
      _os_log_impl(&dword_1BC5A9000, v17, OS_LOG_TYPE_DEFAULT, "#store Pigment option migrated from %{public}@ to %{public}@ - domain %{public}@", (uint8_t *)&v22, 0x20u);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    double v19 = [v14 allItems];
    uint64_t v20 = [v14 config];
    BOOL v21 = [v20 migration];
    int v22 = 138544130;
    id v23 = v10;
    __int16 v24 = 2114;
    id v25 = v11;
    __int16 v26 = 2114;
    id v27 = v19;
    __int16 v28 = 2114;
    v29 = v21;
    _os_log_error_impl(&dword_1BC5A9000, v17, OS_LOG_TYPE_ERROR, "#store Failed to migrate pigment option %{public}@ - domain %{public}@ - items:%{public}@ - migration: %{public}@", (uint8_t *)&v22, 0x2Au);
  }

  return v15;
}

- (id)_migratedOptionForInvalidOption:(id)a3 collection:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 migration];
  id v8 = [v5 identifier];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9) {
    goto LABEL_4;
  }
  id v10 = [v5 optionName];
  id v9 = [v7 objectForKeyedSubscript:v10];

  if (v9
    || (id v33 = 0,
        [v5 extractEffectiveCollectionName:0 effectiveOptionName:&v33],
        id v11 = v33,
        [v7 objectForKeyedSubscript:v11],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v11,
        v9))
  {
LABEL_4:
    id v31 = 0;
    id v32 = 0;
    +[NTKPigmentEditOption effectiveNamesFromName:v9 effectiveCollectionName:&v32 effectiveOptionName:&v31];
    id v12 = v32;
    id v13 = v31;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v14 = [v6 allItems];
    id v15 = (id)[v14 countByEnumeratingWithState:&v27 objects:v34 count:16];
    if (v15)
    {
      int v22 = v7;
      id v23 = v6;
      id v24 = v5;
      uint64_t v16 = *(void *)v28;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v14);
          }
          double v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v25 = 0;
          id v26 = 0;
          [v18 extractEffectiveCollectionName:&v26 effectiveOptionName:&v25];
          id v19 = v26;
          id v20 = v25;
          if ((!v12 || [v19 isEqualToString:v12])
            && [v20 isEqualToString:v13])
          {
            id v15 = v18;

            goto LABEL_16;
          }
        }
        id v15 = (id)[v14 countByEnumeratingWithState:&v27 objects:v34 count:16];
        if (v15) {
          continue;
        }
        break;
      }
LABEL_16:
      id v6 = v23;
      id v5 = v24;
      id v7 = v22;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_normalizeOptionForOption:(id)a3 domain:(id)a4 bundle:(id)a5 slot:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [(NTKPigmentEditOptionStore *)self pigmentSetForDomain:a4 bundle:a5];
  id v13 = [v12 collectionForSlot:v10];

  id v14 = [v11 fullname];

  id v15 = [v13 pigmentWithFullname:v14];

  return v15;
}

- (BOOL)isOptionVisible:(id)a3
{
  return [(NTKPigmentPreferenceManager *)self->_preferenceManager isOptionVisible:a3];
}

- (void)setOption:(id)a3 visible:(BOOL)a4
{
}

- (void)addListener:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__NTKPigmentEditOptionStore_addListener_forDomain___block_invoke;
  v12[3] = &unk_1E62C04F0;
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = @"AllDomains";
  }
  p_lock = &self->_lock;
  v12[4] = self;
  id v13 = v8;
  id v14 = v6;
  id v10 = v6;
  id v11 = v8;
  _executeWithLock(p_lock, v12);
}

void __51__NTKPigmentEditOptionStore_addListener_forDomain___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  if (!v2)
  {
    id v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [*(id *)(a1[4] + 32) setObject:v3 forKeyedSubscript:a1[5]];
    uint64_t v2 = v3;
  }
  id v4 = v2;
  [v2 addObject:a1[6]];
}

- (void)colorBundleContentChanged
{
  id v3 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "#store Color bundles updated. Reseting Pigment Store cache", v4, 2u);
  }

  [(NTKPigmentEditOptionStore *)self resetCacheAndNotifyListeners];
}

- (void)faceBundlesUpdated
{
  id v3 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "#store Face bundles updated. Reseting Pigment Store cache", v4, 2u);
  }

  [(NTKPigmentEditOptionStore *)self resetCacheAndNotifyListeners];
}

- (void)handleActiveDeviceChangedNotification
{
  id v3 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "#store Active device chanced. Reseting Pigment Store cache", v4, 2u);
  }

  [(NTKPigmentPreferenceManager *)self->_preferenceManager handlePairedDeviceChanged];
  [(NTKPigmentEditOptionStore *)self resetCacheAndNotifyListeners];
}

- (void)deletePersistenceLayerCache
{
}

- (void)resetCacheAndNotifyListeners
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__NTKPigmentEditOptionStore_resetCacheAndNotifyListeners__block_invoke;
  v3[3] = &unk_1E62BFF20;
  v3[4] = self;
  _executeWithLock(&self->_lock, v3);
  [(NTKPigmentEditOptionStore *)self notifyListenersStoreContentChanged];
}

uint64_t __57__NTKPigmentEditOptionStore_resetCacheAndNotifyListeners__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_threadunsafe_resetCache");
}

- (void)_threadunsafe_resetCache
{
  [(NSCache *)self->_cache removeAllObjects];
  [(NTKPigmentPersistentStorageController *)self->_storageController resetCache];
  sharedCollections = self->_sharedCollections;
  self->_sharedCollections = 0;

  self->_prewarmed = 0;
}

- (void)notifyListenersStoreContentChanged
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__NTKPigmentEditOptionStore_notifyListenersStoreContentChanged__block_invoke;
  v11[3] = &unk_1E62C04F0;
  v11[4] = self;
  id v12 = v3;
  id v5 = v4;
  id v13 = v5;
  id v6 = v3;
  _executeWithLock(&self->_lock, v11);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__NTKPigmentEditOptionStore_notifyListenersStoreContentChanged__block_invoke_3;
  v8[3] = &unk_1E62C3CC8;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];
}

void __63__NTKPigmentEditOptionStore_notifyListenersStoreContentChanged__block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] listenersByDomain];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__NTKPigmentEditOptionStore_notifyListenersStoreContentChanged__block_invoke_2;
  v3[3] = &unk_1E62C3CA0;
  id v4 = a1[5];
  id v5 = a1[6];
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void __63__NTKPigmentEditOptionStore_notifyListenersStoreContentChanged__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = objc_msgSend(a3, "objectEnumerator", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(a1 + 32) addObject:*(void *)(*((void *)&v11 + 1) + 8 * v10)];
        [*(id *)(a1 + 40) addObject:v5];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

void __63__NTKPigmentEditOptionStore_notifyListenersStoreContentChanged__block_invoke_3(uint64_t a1, void *a2, unint64_t a3)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) count] > a3)
  {
    id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    if ([v5 isEqualToString:@"AllDomains"])
    {

      id v5 = 0;
    }
    [v6 colorEditOptionStore:*(void *)(a1 + 40) didChangeForDomain:v5];
  }
}

- (void)sensitiveUIStateChanged
{
  [(NTKPigmentEditOptionStore *)self deletePersistenceLayerCache];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__NTKPigmentEditOptionStore_sensitiveUIStateChanged__block_invoke;
  v3[3] = &unk_1E62BFF20;
  void v3[4] = self;
  _executeWithLock(&self->_lock, v3);
  [(NTKPigmentEditOptionStore *)self resetCacheAndNotifyListeners];
}

void __52__NTKPigmentEditOptionStore_sensitiveUIStateChanged__block_invoke(uint64_t a1)
{
  uint64_t v2 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_INFO, "#store Sensitive UI changed, resetting cache", v6, 2u);
  }

  id v3 = [MEMORY[0x1E4F19A98] sharedMonitor];
  uint64_t v4 = [v3 isSensitiveUIEnabled] ^ 1;
  id v5 = [*(id *)(a1 + 32) plistLoader];
  [v5 setIgnoreSensitiveUIItems:v4];
}

- (void)setSharedCollections:(id)a3
{
}

- (NTKPlistPigmentEditOptionLoader)plistLoader
{
  return self->_plistLoader;
}

- (void)setPlistLoader:(id)a3
{
}

- (NSMutableDictionary)listenersByDomain
{
  return self->_listenersByDomain;
}

- (void)setListenersByDomain:(id)a3
{
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NTKFaceColorPalette)palette
{
  return self->_palette;
}

- (void)setPalette:(id)a3
{
}

- (NTKPigmentPersistentStorageController)storageController
{
  return self->_storageController;
}

- (void)setStorageController:(id)a3
{
}

- (NTKPigmentPreferenceManager)preferenceManager
{
  return self->_preferenceManager;
}

- (void)setPreferenceManager:(id)a3
{
}

- (OS_dispatch_queue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (BOOL)persistenceCacheEnabled
{
  return self->_persistenceCacheEnabled;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (BOOL)prewarmed
{
  return self->_prewarmed;
}

- (void)setPrewarmed:(BOOL)a3
{
  self->_prewarmed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_preferenceManager, 0);
  objc_storeStrong((id *)&self->_storageController, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_listenersByDomain, 0);
  objc_storeStrong((id *)&self->_plistLoader, 0);

  objc_storeStrong((id *)&self->_sharedCollections, 0);
}

- (void)_threadunsafe_sharedCollections
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "#store Failed to loaded shared collections from persistence layer", v1, 2u);
}

- (void)_watch_loadPigmentSetForDomain:(uint64_t)a1 bundle:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_DEBUG, "#store Failed to loaded pigment set for domain %{public}@ from persistence layer cache", (uint8_t *)&v2, 0xCu);
}

void __67__NTKPigmentEditOptionStore__watch_loadPigmentSetForDomain_bundle___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_DEBUG, "#store Persisting pigment set for domain %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)_companion_loadPigmentSetForDomain:(uint64_t)a1 bundle:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "#store synced color data not found for domain %{public}@. Loading from color.plist file", (uint8_t *)&v2, 0xCu);
}

- (void)fulfilledOptionForOption:(os_log_t)log domain:bundle:slot:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "#store Could not fulfill pigment. It may fail to localize its name. Returning original unfulfilled pigment: %{public}@ - Store Collection: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
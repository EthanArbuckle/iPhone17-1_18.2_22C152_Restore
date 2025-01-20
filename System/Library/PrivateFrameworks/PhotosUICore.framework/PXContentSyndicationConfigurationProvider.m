@interface PXContentSyndicationConfigurationProvider
+ (PXContentSyndicationConfigurationProvider)contentSyndicationConfigurationProviderWithPhotoLibrary:(id)a3;
+ (PXContentSyndicationConfigurationProvider)sharedInstance;
+ (void)preloadResourcesForPhotoLibrary:(id)a3;
- (BOOL)contentSyndicationIsAvailable;
- (BOOL)readyToLoadActualDataSourceManager;
- (BOOL)showContentSyndicationItemInSidebar;
- (BOOL)showUnsavedSyndicatedContentInFeaturedPhotos;
- (BOOL)showUnsavedSyndicatedContentInMemories;
- (BOOL)showUnsavedSyndicatedContentInPhotosGrids;
- (NSNumber)testingOverride_contentSyndicationEnabled;
- (PHPhotoLibrary)photoLibrary;
- (PHPhotoLibrary)syndicationPhotoLibrary;
- (PXContentSyndicationConfigurationProvider)init;
- (PXContentSyndicationConfigurationProvider)initWithPhotoLibrary:(id)a3;
- (PXContentSyndicationDataSourceManager)syndicationItemsDataSourceManager;
- (PXLibraryFilterState)libraryFilterState;
- (id)_dataSourceManagerForDataSourceType:(int64_t)a3;
- (int)systemLibraryChangeToken;
- (int64_t)dataSourceType;
- (void)_createDataSourceManagerIfNeeded;
- (void)_initializeSocialHighlightCenter;
- (void)_invalidateDataSourceManager;
- (void)_markDataSourceManagerAsReadyToLoad;
- (void)_updateContentSyndicationAvailability;
- (void)_updateDataSourceType;
- (void)_updateEverything;
- (void)_updateShowContentSyndicationItemInSidebar;
- (void)_updateShowUnsavedSyndicatedContentInFeaturedPhotos;
- (void)_updateShowUnsavedSyndicatedContentInMemories;
- (void)_updateShowUnsavedSyndicatedContentInPhotosGrids;
- (void)contentSyndicationHighlightCenterDidChange:(id)a3;
- (void)dealloc;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setContentSyndicationIsAvailable:(BOOL)a3;
- (void)setDataSourceType:(int64_t)a3;
- (void)setReadyToLoadActualDataSourceManager:(BOOL)a3;
- (void)setShowContentSyndicationItemInSidebar:(BOOL)a3;
- (void)setShowUnsavedSyndicatedContentInFeaturedPhotos:(BOOL)a3;
- (void)setShowUnsavedSyndicatedContentInMemories:(BOOL)a3;
- (void)setShowUnsavedSyndicatedContentInPhotosGrids:(BOOL)a3;
- (void)setSyndicationItemsDataSourceManager:(id)a3;
- (void)setSyndicationPhotoLibrary:(id)a3;
- (void)setSystemLibraryChangeToken:(int)a3;
- (void)setTestingOverride_contentSyndicationEnabled:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation PXContentSyndicationConfigurationProvider

+ (PXContentSyndicationConfigurationProvider)contentSyndicationConfigurationProviderWithPhotoLibrary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = [NSString stringWithUTF8String:"+[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:]"];
    [v12 handleFailureInFunction:v13, @"PXContentSyndicationConfigurationProvider.m", 300, @"Invalid parameter not satisfying: %@", @"photoLibrary" file lineNumber description];
  }
  os_unfair_lock_lock((os_unfair_lock_t)&contentSyndicationConfigurationProviderWithPhotoLibrary___statusProvidersMapTableLock);
  v4 = (void *)contentSyndicationConfigurationProviderWithPhotoLibrary___statusProvidersMapTable;
  if (!contentSyndicationConfigurationProviderWithPhotoLibrary___statusProvidersMapTable)
  {
    uint64_t v5 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    v6 = (void *)contentSyndicationConfigurationProviderWithPhotoLibrary___statusProvidersMapTable;
    contentSyndicationConfigurationProviderWithPhotoLibrary___statusProvidersMapTable = v5;

    v4 = (void *)contentSyndicationConfigurationProviderWithPhotoLibrary___statusProvidersMapTable;
  }
  uint64_t v7 = [v4 objectForKey:v3];
  if (v7)
  {
    v8 = (PXContentSyndicationConfigurationProvider *)v7;
    v9 = PLSyndicationUIGetLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138412546;
    id v15 = v3;
    __int16 v16 = 2048;
    v17 = v8;
    v10 = "%@ Reusing existing content syndication configuration provider: %p";
  }
  else
  {
    v8 = [[PXContentSyndicationConfigurationProvider alloc] initWithPhotoLibrary:v3];
    [(id)contentSyndicationConfigurationProviderWithPhotoLibrary___statusProvidersMapTable setObject:v8 forKey:v3];
    v9 = PLSyndicationUIGetLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138412546;
    id v15 = v3;
    __int16 v16 = 2048;
    v17 = v8;
    v10 = "%@ Creating new content syndication configuration provider: %p";
  }
  _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEBUG, v10, buf, 0x16u);
LABEL_11:

  os_unfair_lock_unlock((os_unfair_lock_t)&contentSyndicationConfigurationProviderWithPhotoLibrary___statusProvidersMapTableLock);
  return v8;
}

- (PXContentSyndicationConfigurationProvider)initWithPhotoLibrary:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PXContentSyndicationConfigurationProvider.m", 211, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v26.receiver = self;
  v26.super_class = (Class)PXContentSyndicationConfigurationProvider;
  uint64_t v7 = [(PXContentSyndicationConfigurationProvider *)&v26 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
    v9 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v8->_photoLibrary];
    v10 = [[PXLibraryFilterState alloc] initWithSharedLibraryStatusProvider:v9];
    libraryFilterState = v8->_libraryFilterState;
    v8->_libraryFilterState = v10;

    v12 = +[PXContentSyndicationSettings sharedInstance];
    [v12 addDeferredKeyObserver:v8];
    if (_isContentSyndicationPossible())
    {
      objc_initWeak(location, v8);
      v13 = +[PXPreloadScheduler sharedScheduler];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __66__PXContentSyndicationConfigurationProvider_initWithPhotoLibrary___block_invoke;
      v23[3] = &unk_1E5DD32D0;
      objc_copyWeak(&v24, location);
      [v13 scheduleTaskWithQoS:1 block:v23];

      objc_destroyWeak(&v24);
      objc_destroyWeak(location);
    }
    [(PXLibraryFilterState *)v8->_libraryFilterState registerChangeObserver:v8 context:PXLibraryFilterStateObservationContext_239883];
    if (([v12 delayLoadingActualDataSourceUntilAfterLaunch] & 1) == 0) {
      v8->_readyToLoadActualDataSourceManager = 1;
    }
    [(PXContentSyndicationConfigurationProvider *)v8 _updateEverything];
    if ([(PXContentSyndicationConfigurationProvider *)v8 contentSyndicationIsAvailable]
      && [v12 delayLoadingActualDataSourceUntilAfterLaunch])
    {
      v14 = PLSyndicationUIGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "ContentSyndicationConfiguration: Beginning delayed load of real data source manager. Loading syndication photo library in background thread.", (uint8_t *)location, 2u);
      }

      id v15 = [MEMORY[0x1E4F1C9C8] date];
      __int16 v16 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__PXContentSyndicationConfigurationProvider_initWithPhotoLibrary___block_invoke_210;
      block[3] = &unk_1E5DD32A8;
      v21 = v8;
      id v22 = v15;
      id v17 = v15;
      dispatch_async(v16, block);
    }
    else
    {
      [(PXContentSyndicationConfigurationProvider *)v8 _markDataSourceManagerAsReadyToLoad];
    }
  }
  return v8;
}

- (void)_updateEverything
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __62__PXContentSyndicationConfigurationProvider__updateEverything__block_invoke;
  v2[3] = &unk_1E5DD0FA8;
  v2[4] = self;
  [(PXContentSyndicationConfigurationProvider *)self performChanges:v2];
}

- (void)_markDataSourceManagerAsReadyToLoad
{
  id v3 = PLSyndicationUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "ContentSyndicationConfiguration: Loading real data source manager.", buf, 2u);
  }

  if (!self->_readyToLoadActualDataSourceManager)
  {
    self->_readyToLoadActualDataSourceManager = 1;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __80__PXContentSyndicationConfigurationProvider__markDataSourceManagerAsReadyToLoad__block_invoke;
    v4[3] = &unk_1E5DD0FA8;
    v4[4] = self;
    [(PXContentSyndicationConfigurationProvider *)self performChanges:v4];
  }
}

- (BOOL)showUnsavedSyndicatedContentInPhotosGrids
{
  return self->_showUnsavedSyndicatedContentInPhotosGrids;
}

+ (PXContentSyndicationConfigurationProvider)sharedInstance
{
  if (sharedInstance_onceToken_239968 != -1) {
    dispatch_once(&sharedInstance_onceToken_239968, &__block_literal_global_239969);
  }
  v2 = (void *)sharedInstance_provider;
  return (PXContentSyndicationConfigurationProvider *)v2;
}

- (void)_updateShowContentSyndicationItemInSidebar
{
  if ([(PXContentSyndicationConfigurationProvider *)self showContentSyndicationItemInSidebar])
  {
    [(PXContentSyndicationConfigurationProvider *)self setShowContentSyndicationItemInSidebar:0];
    [(PXContentSyndicationConfigurationProvider *)self signalChange:32];
  }
}

- (BOOL)showContentSyndicationItemInSidebar
{
  return self->_showContentSyndicationItemInSidebar;
}

- (void)_invalidateDataSourceManager
{
  id v3 = [(PXContentSyndicationConfigurationProvider *)self syndicationItemsDataSourceManager];
  [v3 unregisterChangeObserver:self context:PXContentSyndicationConfigurationProviderDataSourceObservationContext];

  [(PXContentSyndicationConfigurationProvider *)self setSyndicationItemsDataSourceManager:0];
}

uint64_t __80__PXContentSyndicationConfigurationProvider__markDataSourceManagerAsReadyToLoad__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateDataSourceManager];
  [*(id *)(a1 + 32) _createDataSourceManagerIfNeeded];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateShowContentSyndicationItemInSidebar];
}

- (void)_createDataSourceManagerIfNeeded
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXContentSyndicationConfigurationProvider *)self syndicationItemsDataSourceManager];

  if (!v3)
  {
    v4 = [(PXContentSyndicationConfigurationProvider *)self syndicationItemsDataSourceManager];
    if ([(PXContentSyndicationConfigurationProvider *)self readyToLoadActualDataSourceManager])
    {
      uint64_t v5 = [(PXContentSyndicationConfigurationProvider *)self _dataSourceManagerForDataSourceType:[(PXContentSyndicationConfigurationProvider *)self dataSourceType]];
    }
    else
    {
      id v6 = PLSyndicationUIGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "ContentSyndicationConfiguration: Not yet ready to load the real data source manager, so loading an empty one instead.", (uint8_t *)&v18, 2u);
      }

      uint64_t v5 = objc_alloc_init(PXContentSyndicationEmptyDataSourceManager);
    }
    uint64_t v7 = v5;
    [(PXContentSyndicationConfigurationProvider *)self setSyndicationItemsDataSourceManager:v5];

    v8 = [(PXContentSyndicationConfigurationProvider *)self syndicationItemsDataSourceManager];
    [v8 registerChangeObserver:self context:PXContentSyndicationConfigurationProviderDataSourceObservationContext];

    uint64_t v9 = objc_opt_class();
    v10 = [(PXContentSyndicationConfigurationProvider *)self syndicationItemsDataSourceManager];
    uint64_t v11 = objc_opt_class();

    if (v9 != v11)
    {
      v12 = PLSyndicationUIGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        id v15 = [(PXContentSyndicationConfigurationProvider *)self syndicationItemsDataSourceManager];
        __int16 v16 = (objc_class *)objc_opt_class();
        id v17 = NSStringFromClass(v16);
        int v18 = 138543618;
        v19 = v14;
        __int16 v20 = 2114;
        v21 = v17;
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "ContentSyndicationConfiguration: Content syndication data source manager changed from %{public}@ to %{public}@", (uint8_t *)&v18, 0x16u);
      }
      [(PXContentSyndicationConfigurationProvider *)self signalChange:2];
    }
  }
}

- (PXContentSyndicationDataSourceManager)syndicationItemsDataSourceManager
{
  return self->_syndicationItemsDataSourceManager;
}

- (void)setSyndicationItemsDataSourceManager:(id)a3
{
}

- (BOOL)readyToLoadActualDataSourceManager
{
  return self->_readyToLoadActualDataSourceManager;
}

uint64_t __62__PXContentSyndicationConfigurationProvider__updateEverything__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateContentSyndicationAvailability];
  [*(id *)(a1 + 32) _updateDataSourceType];
  [*(id *)(a1 + 32) _createDataSourceManagerIfNeeded];
  [*(id *)(a1 + 32) _updateShowUnsavedSyndicatedContentInPhotosGrids];
  [*(id *)(a1 + 32) _updateShowUnsavedSyndicatedContentInMemories];
  [*(id *)(a1 + 32) _updateShowUnsavedSyndicatedContentInFeaturedPhotos];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateShowContentSyndicationItemInSidebar];
}

- (void)setShowUnsavedSyndicatedContentInPhotosGrids:(BOOL)a3
{
  if (self->_showUnsavedSyndicatedContentInPhotosGrids != a3)
  {
    self->_showUnsavedSyndicatedContentInPhotosGrids = a3;
    [(PXContentSyndicationConfigurationProvider *)self signalChange:4];
  }
}

- (void)setShowUnsavedSyndicatedContentInMemories:(BOOL)a3
{
  if (self->_showUnsavedSyndicatedContentInMemories != a3)
  {
    self->_showUnsavedSyndicatedContentInMemories = a3;
    [(PXContentSyndicationConfigurationProvider *)self signalChange:8];
  }
}

- (void)setShowUnsavedSyndicatedContentInFeaturedPhotos:(BOOL)a3
{
  if (self->_showUnsavedSyndicatedContentInFeaturedPhotos != a3)
  {
    self->_showUnsavedSyndicatedContentInFeaturedPhotos = a3;
    [(PXContentSyndicationConfigurationProvider *)self signalChange:16];
  }
}

- (void)setContentSyndicationIsAvailable:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_contentSyndicationIsAvailable != a3)
  {
    self->_contentSyndicationIsAvailable = a3;
    v4 = PLSyndicationUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_contentSyndicationIsAvailable) {
        uint64_t v5 = @"YES";
      }
      else {
        uint64_t v5 = @"NO";
      }
      id v6 = v5;
      int v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "ContentSyndicationConfiguration: Content syndication availability changed to %{public}@", (uint8_t *)&v7, 0xCu);
    }
    [(PXContentSyndicationConfigurationProvider *)self _invalidateDataSourceManager];
    [(PXContentSyndicationConfigurationProvider *)self signalChange:1];
  }
}

- (void)_updateShowUnsavedSyndicatedContentInMemories
{
  photoLibrary = self->_photoLibrary;
  v4 = [(PXContentSyndicationConfigurationProvider *)self testingOverride_contentSyndicationEnabled];
  uint64_t isContentSyndicationAvailable = _isContentSyndicationAvailable(photoLibrary, v4);

  [(PXContentSyndicationConfigurationProvider *)self setShowUnsavedSyndicatedContentInMemories:isContentSyndicationAvailable];
}

- (void)_updateShowUnsavedSyndicatedContentInFeaturedPhotos
{
  photoLibrary = self->_photoLibrary;
  v4 = [(PXContentSyndicationConfigurationProvider *)self testingOverride_contentSyndicationEnabled];
  uint64_t isContentSyndicationAvailable = _isContentSyndicationAvailable(photoLibrary, v4);

  [(PXContentSyndicationConfigurationProvider *)self setShowUnsavedSyndicatedContentInFeaturedPhotos:isContentSyndicationAvailable];
}

- (void)_updateDataSourceType
{
  id v3 = +[PXContentSyndicationSettings sharedInstance];
  uint64_t v4 = [v3 dataSourceType];

  if (v4 != [(PXContentSyndicationConfigurationProvider *)self dataSourceType])
  {
    [(PXContentSyndicationConfigurationProvider *)self _invalidateDataSourceManager];
    [(PXContentSyndicationConfigurationProvider *)self setDataSourceType:v4];
    [(PXContentSyndicationConfigurationProvider *)self _createDataSourceManagerIfNeeded];
  }
}

- (int64_t)dataSourceType
{
  return self->_dataSourceType;
}

- (void)_updateContentSyndicationAvailability
{
  photoLibrary = self->_photoLibrary;
  uint64_t v4 = [(PXContentSyndicationConfigurationProvider *)self testingOverride_contentSyndicationEnabled];
  uint64_t isContentSyndicationAvailable = _isContentSyndicationAvailable(photoLibrary, v4);

  [(PXContentSyndicationConfigurationProvider *)self setContentSyndicationIsAvailable:isContentSyndicationAvailable];
}

- (id)_dataSourceManagerForDataSourceType:(int64_t)a3
{
  photoLibrary = self->_photoLibrary;
  id v6 = [(PXContentSyndicationConfigurationProvider *)self testingOverride_contentSyndicationEnabled];
  LODWORD(photoLibrary) = _isContentSyndicationAvailable(photoLibrary, v6);

  if (photoLibrary)
  {
    switch(a3)
    {
      case 0:
      case 4:
      case 5:
        int v7 = [(PXContentSyndicationConfigurationProvider *)self syndicationPhotoLibrary];

        v8 = PLSyndicationUIGetLog();
        BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
        if (!v7)
        {
          if (v9)
          {
            *(_WORD *)uint64_t v22 = 0;
            _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "ContentSyndicationConfiguration: Syndication photo library wasn't loaded in the background loading directly with data source manager instantiation.", v22, 2u);
          }

          int v18 = PXContentSyndicationPhotoKitDataSourceManager;
          goto LABEL_16;
        }
        if (v9)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "ContentSyndicationConfiguration: Using already-created syndication photo library instance for data source manager.", buf, 2u);
        }

        v10 = [PXContentSyndicationPhotoKitDataSourceManager alloc];
        uint64_t v11 = [(PXContentSyndicationConfigurationProvider *)self syndicationPhotoLibrary];
        v12 = [(PXContentSyndicationPhotoKitDataSourceManager *)v10 initWithPhotoLibrary:v11];

        if (!v12) {
          goto LABEL_17;
        }
        goto LABEL_21;
      case 1:
      case 2:
      case 3:
        int v18 = PXContentSyndicationMockSingleAssetsDataSourceManager;
        goto LABEL_16;
      case 6:
        int v18 = PXContentSyndicationMockCMMDataSourceManager;
        goto LABEL_16;
      case 7:
        int v18 = PXContentSyndicationMockSharedAlbumsDataSourceManager;
LABEL_16:
        v12 = (PXContentSyndicationEmptyDataSourceManager *)objc_alloc_init(v18);
        if (!v12) {
          goto LABEL_17;
        }
        goto LABEL_21;
      default:
LABEL_17:
        v13 = PLSyndicationUIGetLog();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          goto LABEL_20;
        }
        *(_WORD *)v21 = 0;
        v14 = "ContentSyndicationConfiguration: Data Source Manager could not be created, falling back to empty data sour"
              "ce manager. The syndication library may not exist, or could not be opened.";
        id v15 = v21;
        __int16 v16 = v13;
        os_log_type_t v17 = OS_LOG_TYPE_ERROR;
        break;
    }
    goto LABEL_19;
  }
  v13 = PLSyndicationUIGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v20 = 0;
    v14 = "ContentSyndicationConfiguration: Using empty data source manager, as content syndication is not available.";
    id v15 = (uint8_t *)&v20;
    __int16 v16 = v13;
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
LABEL_19:
    _os_log_impl(&dword_1A9AE7000, v16, v17, v14, v15, 2u);
  }
LABEL_20:

  v12 = objc_alloc_init(PXContentSyndicationEmptyDataSourceManager);
LABEL_21:
  return v12;
}

- (void)_updateShowUnsavedSyndicatedContentInPhotosGrids
{
  photoLibrary = self->_photoLibrary;
  uint64_t v4 = [(PXContentSyndicationConfigurationProvider *)self testingOverride_contentSyndicationEnabled];
  if (_isContentSyndicationAvailable(photoLibrary, v4))
  {
    uint64_t v5 = +[PXContentSyndicationSettings sharedInstance];
    uint64_t v6 = [v5 showSyndicatedContentInLibrary];
  }
  else
  {
    uint64_t v6 = 0;
  }

  [(PXContentSyndicationConfigurationProvider *)self setShowUnsavedSyndicatedContentInPhotosGrids:v6];
}

- (NSNumber)testingOverride_contentSyndicationEnabled
{
  return self->_testingOverride_contentSyndicationEnabled;
}

+ (void)preloadResourcesForPhotoLibrary:(id)a3
{
  id v3 = a3;
  if (_isContentSyndicationPossible()) {
    _isContentSyndicationAvailable(v3, 0);
  }
}

void __59__PXContentSyndicationConfigurationProvider_sharedInstance__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:v2];
  v1 = (void *)sharedInstance_provider;
  sharedInstance_provider = v0;
}

- (BOOL)contentSyndicationIsAvailable
{
  return self->_contentSyndicationIsAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testingOverride_contentSyndicationEnabled, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_syndicationPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_syndicationItemsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_socialLayerHighlightCenter, 0);
}

- (void)setSystemLibraryChangeToken:(int)a3
{
  self->_systemLibraryChangeToken = a3;
}

- (int)systemLibraryChangeToken
{
  return self->_systemLibraryChangeToken;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setSyndicationPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)syndicationPhotoLibrary
{
  return self->_syndicationPhotoLibrary;
}

- (void)setReadyToLoadActualDataSourceManager:(BOOL)a3
{
  self->_readyToLoadActualDataSourceManager = a3;
}

- (void)setShowContentSyndicationItemInSidebar:(BOOL)a3
{
  self->_showContentSyndicationItemInSidebar = a3;
}

- (BOOL)showUnsavedSyndicatedContentInFeaturedPhotos
{
  return self->_showUnsavedSyndicatedContentInFeaturedPhotos;
}

- (BOOL)showUnsavedSyndicatedContentInMemories
{
  return self->_showUnsavedSyndicatedContentInMemories;
}

- (void)setDataSourceType:(int64_t)a3
{
  self->_dataSourceType = a3;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXContentSyndicationConfigurationProviderDataSourceObservationContext == a5)
  {
    if (v6)
    {
      v10 = v15;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      uint64_t v11 = __74__PXContentSyndicationConfigurationProvider_observable_didChange_context___block_invoke;
      goto LABEL_7;
    }
  }
  else
  {
    if ((void *)PXLibraryFilterStateObservationContext_239883 != a5)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PXContentSyndicationConfigurationProvider.m" lineNumber:607 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if (v6)
    {
      v10 = &v13;
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      uint64_t v11 = __74__PXContentSyndicationConfigurationProvider_observable_didChange_context___block_invoke_2;
LABEL_7:
      v10[2] = (uint64_t)v11;
      v10[3] = (uint64_t)&unk_1E5DD0FA8;
      v10[4] = (uint64_t)self;
      -[PXContentSyndicationConfigurationProvider performChanges:](self, "performChanges:", v13, v14);
    }
  }
}

uint64_t __74__PXContentSyndicationConfigurationProvider_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateShowContentSyndicationItemInSidebar];
}

uint64_t __74__PXContentSyndicationConfigurationProvider_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateShowContentSyndicationItemInSidebar];
}

- (void)contentSyndicationHighlightCenterDidChange:(id)a3
{
  uint64_t v4 = PLSyndicationUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "ContentSyndicationConfiguration: SLHighlightCenter reports that Shared with You enablement has changed.", v5, 2u);
  }

  [(PXContentSyndicationConfigurationProvider *)self _updateEverything];
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5 = a4;
  char v6 = NSStringFromSelector(sel_contentSyndicationEnabled);
  if ([v5 isEqualToString:v6]) {
    goto LABEL_6;
  }
  int v7 = NSStringFromSelector(sel_showSyndicatedContentInLibrary);
  if ([v5 isEqualToString:v7])
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  v8 = NSStringFromSelector(sel_ignoreSocialLayerEnablement);
  if ([v5 isEqualToString:v8])
  {

    goto LABEL_5;
  }
  id v9 = NSStringFromSelector(sel_showContentSyndicationInSystemPhotoLibraryOnly);
  char v10 = [v5 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = NSStringFromSelector(sel_dataSourceType);
    int v12 = [v5 isEqualToString:v11];

    if (v12)
    {
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __73__PXContentSyndicationConfigurationProvider_settings_changedValueForKey___block_invoke;
      id v24 = &unk_1E5DD0FA8;
      v25 = self;
      uint64_t v13 = &v21;
    }
    else
    {
      uint64_t v14 = NSStringFromSelector(sel_showSidebarItemEvenIfNoSyndicatedContentAvailable);
      int v15 = [v5 isEqualToString:v14];

      if (!v15) {
        goto LABEL_8;
      }
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      int v18 = __73__PXContentSyndicationConfigurationProvider_settings_changedValueForKey___block_invoke_2;
      v19 = &unk_1E5DD0FA8;
      __int16 v20 = self;
      uint64_t v13 = &v16;
    }
    -[PXContentSyndicationConfigurationProvider performChanges:](self, "performChanges:", v13, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_8;
  }
LABEL_7:
  [(PXContentSyndicationConfigurationProvider *)self _updateEverything];
LABEL_8:
}

uint64_t __73__PXContentSyndicationConfigurationProvider_settings_changedValueForKey___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateDataSourceType];
  id v2 = *(void **)(a1 + 32);
  return [v2 _updateShowContentSyndicationItemInSidebar];
}

uint64_t __73__PXContentSyndicationConfigurationProvider_settings_changedValueForKey___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateShowContentSyndicationItemInSidebar];
}

- (void)_initializeSocialHighlightCenter
{
  id v3 = +[PXContentSyndicationHighlightCenter shared];
  socialLayerHighlightCenter = self->_socialLayerHighlightCenter;
  self->_socialLayerHighlightCenter = v3;

  id v5 = self->_socialLayerHighlightCenter;
  [(PXContentSyndicationHighlightCenter *)v5 registerObserver:self];
}

- (void)dealloc
{
  id v3 = +[PXContentSyndicationSettings sharedInstance];
  [v3 removeKeyObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PXContentSyndicationConfigurationProvider;
  [(PXContentSyndicationConfigurationProvider *)&v4 dealloc];
}

void __66__PXContentSyndicationConfigurationProvider_initWithPhotoLibrary___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _initializeSocialHighlightCenter];
}

void __66__PXContentSyndicationConfigurationProvider_initWithPhotoLibrary___block_invoke_210(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1 + 32) dataSourceType];
  if (v2 > 5 || ((1 << v2) & 0x31) == 0)
  {
    uint64_t v14 = PLSyndicationUIGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "ContentSyndicationConfiguration: Syndication photo library loading not needed. Must be using a mock/internal data source type. Dispatching to main.", buf, 2u);
    }
    int v21 = 0;
  }
  else
  {
    objc_super v4 = PLSyndicationGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    char v6 = [MEMORY[0x1E4F1C9C8] date];
    int v7 = v4;
    v8 = v7;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PXContentSyndicationConfigurationProvider.syndicationLibraryLoad", "", buf, 2u);
    }

    id v25 = 0;
    id v9 = [MEMORY[0x1E4F39228] openPhotoLibraryWithWellKnownIdentifier:3 error:&v25];
    double v10 = COERCE_DOUBLE(v25);
    [*(id *)(a1 + 32) setSyndicationPhotoLibrary:v9];

    uint64_t v11 = [*(id *)(a1 + 32) syndicationPhotoLibrary];

    if (!v11)
    {
      int v12 = PLSyndicationUIGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        double v27 = v10;
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "ContentSyndicationConfiguration: Unable to open syndication library: %@", buf, 0xCu);
      }
    }
    uint64_t v13 = v8;
    uint64_t v14 = v13;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v14, OS_SIGNPOST_INTERVAL_END, v5, "PXContentSyndicationConfigurationProvider.syndicationLibraryLoad", "", buf, 2u);
    }

    int v15 = [MEMORY[0x1E4F1C9C8] date];
    [v15 timeIntervalSinceDate:v6];
    double v17 = v16;
    [v15 timeIntervalSinceDate:*(void *)(a1 + 40)];
    double v19 = v18;
    __int16 v20 = PLSyndicationUIGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v27 = v17 * 1000.0;
      __int16 v28 = 2048;
      double v29 = v19 * 1000.0;
      _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEFAULT, "ContentSyndicationConfiguration: Syndication photo library took %.2fms to load, total time %.2fms. Dispatching to main.", buf, 0x16u);
    }

    int v21 = 1;
  }

  uint64_t v22 = [*(id *)(a1 + 32) syndicationPhotoLibrary];

  if (!v21 || v22)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __66__PXContentSyndicationConfigurationProvider_initWithPhotoLibrary___block_invoke_211;
    v23[3] = &unk_1E5DD36F8;
    id v24 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v23);
  }
}

uint64_t __66__PXContentSyndicationConfigurationProvider_initWithPhotoLibrary___block_invoke_211(uint64_t a1)
{
  return [*(id *)(a1 + 32) _markDataSourceManagerAsReadyToLoad];
}

- (PXContentSyndicationConfigurationProvider)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXContentSyndicationConfigurationProvider.m", 207, @"%s is not available as initializer", "-[PXContentSyndicationConfigurationProvider init]");

  abort();
}

- (void)setTestingOverride_contentSyndicationEnabled:(id)a3
{
  v8 = (NSNumber *)a3;
  os_signpost_id_t v5 = self->_testingOverride_contentSyndicationEnabled;
  if (v5 == v8)
  {
  }
  else
  {
    char v6 = v5;
    char v7 = [(NSNumber *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_testingOverride_contentSyndicationEnabled, a3);
      [(PXContentSyndicationConfigurationProvider *)self _updateEverything];
    }
  }
}

@end
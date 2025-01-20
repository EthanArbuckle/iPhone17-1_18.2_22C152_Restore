@interface PXPhotoKitAssetsDataSourceManager
+ (BOOL)_includeUnsavedSyndicatedAssetsForAssetCollection:(id)a3 photoLibrary:(id)a4;
+ (PXPhotoKitAssetsDataSourceManager)dataSourceManagerWithAsset:(id)a3;
+ (PXPhotoKitAssetsDataSourceManager)dataSourceManagerWithAsset:(id)a3 options:(unint64_t)a4;
+ (PXPhotoKitAssetsDataSourceManager)dataSourceManagerWithAssets:(id)a3;
+ (PXPhotoKitAssetsDataSourceManager)dataSourceManagerWithAssets:(id)a3 containerTitle:(id)a4 options:(unint64_t)a5;
+ (id)dataSourceManagerForAssetCollection:(id)a3;
+ (id)dataSourceManagerForAssetCollection:(id)a3 configuration:(id)a4;
+ (id)dataSourceManagerForAssetCollection:(id)a3 existingAssetsFetchResult:(id)a4;
+ (id)dataSourceManagerForAssetCollection:(id)a3 existingAssetsFetchResult:(id)a4 existingKeyAssetsFetchResult:(id)a5 fetchPropertySets:(id)a6 basePredicate:(id)a7 options:(unint64_t)a8 ignoreSharedLibraryFilters:(BOOL)a9;
+ (id)dataSourceManagerForAssetCollection:(id)a3 existingAssetsFetchResult:(id)a4 existingKeyAssetsFetchResult:(id)a5 fetchPropertySets:(id)a6 basePredicate:(id)a7 options:(unint64_t)a8 ignoreSharedLibraryFilters:(BOOL)a9 reverseSortOrder:(BOOL)a10;
- (BOOL)_isLoadingInitialPhotosDataSource;
- (BOOL)forceAccurateSection:(int64_t)a3 andSectionsBeforeAndAfter:(int64_t)a4;
- (BOOL)forceAccurateSectionsIfNeeded:(id)a3;
- (BOOL)ignoreSharedLibraryFilters;
- (BOOL)includeAllBurstAssets;
- (BOOL)includeOthersInSocialGroupAssets;
- (BOOL)isBackgroundFetching;
- (BOOL)isLoadingInitialDataSource;
- (BOOL)supportsCurationToggling;
- (BOOL)supportsFiltering;
- (NSArray)sortDescriptors;
- (NSPredicate)filterPredicate;
- (OS_dispatch_queue)_utilityWorkQueue;
- (PHPhotoLibrary)photoLibrary;
- (PXPhotoKitAssetsDataSourceManager)init;
- (PXPhotoKitAssetsDataSourceManager)initWithPhotosDataSource:(id)a3;
- (PXPhotoKitAssetsDataSourceManager)initWithPhotosDataSourceProvider:(id)a3;
- (PXPhotosDataSource)photosDataSource;
- (PXPhotosDataSource)photosDataSourceIfExists;
- (PXPhotosDataSourceProvider)photosDataSourceProvider;
- (id)_createAssetsDataSourceWithPhotosDataSource:(id)a3 withChangeDetails:(id)a4;
- (id)createDataSourceManagerForAsset:(id)a3;
- (id)createDataSourceManagerForAssetsInSectionOfAsset:(id)a3 usingNewTransientAssetCollection:(BOOL)a4;
- (id)createInitialDataSource;
- (id)localizedEmptyPlaceholderAttributedMessage;
- (id)localizedEmptyPlaceholderTitle;
- (id)localizedLoadingInitialDataSourceMessage;
- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4;
- (id)photosDataSourceInterestingAssetReferences:(id)a3;
- (id)px_sharedLibrarySharingSuggestionsCountsManager;
- (id)sharedLibraryStatusProvider;
- (int64_t)backgroundFetchOriginSection;
- (int64_t)libraryFilter;
- (void)_didFinishLoadingInitialPhotosDataSource;
- (void)_ensurePhotosDataSource;
- (void)_markFeaturedPhotosAsViewed;
- (void)_markSharedAlbumAsViewed:(id)a3;
- (void)_setLoadingInitialPhotosDataSource:(BOOL)a3;
- (void)dealloc;
- (void)excludeAssetsAtIndexPaths:(id)a3;
- (void)forceIncludeAssetsAtIndexPaths:(id)a3;
- (void)markContentAsViewed;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photosDataSource:(id)a3 didChange:(id)a4;
- (void)photosDataSourceDidFinishBackgroundFetching:(id)a3;
- (void)refreshResultsForAssetCollection:(id)a3;
- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3;
- (void)setAllowedUUIDs:(id)a3;
- (void)setAllowedUUIDs:(id)a3 manualOrderUUIDs:(id)a4 forAssetCollections:(id)a5;
- (void)setBackgroundFetchOriginSection:(int64_t)a3;
- (void)setCurationEnabled:(BOOL)a3 forAssetCollection:(id)a4;
- (void)setCurationEnabledForAllCollections:(BOOL)a3 curationLength:(int64_t)a4 collectionsToDiff:(id)a5;
- (void)setFilterPredicate:(id)a3;
- (void)setFilterPredicate:(id)a3 provideIncrementalChangeDetailsForAssetCollections:(id)a4;
- (void)setFilteringDisabled:(BOOL)a3 forAssetCollection:(id)a4;
- (void)setIgnoreSharedLibraryFilters:(BOOL)a3;
- (void)setIncludeAllBurstAssets:(BOOL)a3;
- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3 provideIncrementalChangeDetailsForAssetCollections:(id)a4;
- (void)setLibraryFilter:(int64_t)a3;
- (void)setPhotosDataSource:(id)a3;
- (void)setPhotosDataSource:(id)a3 changeDetails:(id)a4;
- (void)setPhotosDataSource:(id)a3 publishIntermediateEmptySnapshot:(BOOL)a4;
- (void)setPhotosDataSourceProvider:(id)a3;
- (void)setSortDescriptors:(id)a3;
- (void)set_utilityWorkQueue:(id)a3;
- (void)startBackgroundFetchIfNeeded;
- (void)stopExcludingAssets:(id)a3;
- (void)stopForceIncludingAllAssets;
- (void)updateWithPhotosDataSource:(id)a3 andDataSourceChange:(id)a4;
- (void)updateWithPhotosDataSource:(id)a3 sectionedDataSourceChangeDetails:(id)a4;
@end

@implementation PXPhotoKitAssetsDataSourceManager

- (void)startBackgroundFetchIfNeeded
{
  id v2 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  [v2 startBackgroundFetchIfNeeded];
}

- (id)createInitialDataSource
{
  [(PXPhotoKitAssetsDataSourceManager *)self _ensurePhotosDataSource];
  photosDataSource = self->_photosDataSource;
  return [(PXPhotoKitAssetsDataSourceManager *)self _createAssetsDataSourceWithPhotosDataSource:photosDataSource withChangeDetails:0];
}

- (BOOL)isBackgroundFetching
{
  id v2 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  if ([v2 isBackgroundFetching])
  {
    LOBYTE(v3) = 1;
  }
  else if (([v2 options] & 0x10000) != 0 && objc_msgSend(v2, "isEmpty"))
  {
    int v3 = [v2 areAllSectionsConsideredAccurate] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (void)photosDataSource:(id)a3 didChange:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];

  if (v7 == v8) {
    [(PXPhotoKitAssetsDataSourceManager *)self updateWithPhotosDataSource:v8 andDataSourceChange:v6];
  }
}

- (void)updateWithPhotosDataSource:(id)a3 andDataSourceChange:(id)a4
{
  id v6 = a3;
  id v7 = [a4 sectionedDataSourceChangeDetails];
  [(PXPhotoKitAssetsDataSourceManager *)self updateWithPhotosDataSource:v6 sectionedDataSourceChangeDetails:v7];
}

- (void)updateWithPhotosDataSource:(id)a3 sectionedDataSourceChangeDetails:(id)a4
{
  id v6 = a4;
  id v9 = v6;
  if (a3)
  {
    id v7 = [(PXPhotoKitAssetsDataSourceManager *)self _createAssetsDataSourceWithPhotosDataSource:a3 withChangeDetails:v6];
    id v8 = v9;
    a3 = v7;
  }
  else
  {
    id v8 = v6;
  }
  [(PXSectionedDataSourceManager *)self setDataSource:a3 changeDetails:v8];
}

- (int64_t)libraryFilter
{
  return self->_libraryFilter;
}

- (PXPhotosDataSource)photosDataSource
{
  [(PXPhotoKitAssetsDataSourceManager *)self _ensurePhotosDataSource];
  photosDataSource = self->_photosDataSource;
  return photosDataSource;
}

- (void)_ensurePhotosDataSource
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  p_photosDataSource = &self->_photosDataSource;
  if (!self->_photosDataSource)
  {
    v4 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSourceProvider];
    v5 = [v4 createInitialPhotosDataSourceForDataSourceManager:self];
    id v6 = [v5 filterPredicate];
    id v7 = self->_filterPredicate;
    if (v6 == v7)
    {
    }
    else
    {
      id v8 = v7;
      char v9 = [(NSPredicate *)v6 isEqual:v7];

      if ((v9 & 1) == 0) {
        PXAssertGetLog();
      }
    }
    v10 = [v5 sortDescriptors];
    v11 = self->_sortDescriptors;
    if (v10 == v11)
    {
    }
    else
    {
      v12 = v11;
      char v13 = [(NSArray *)v10 isEqual:v11];

      if ((v13 & 1) == 0) {
        PXAssertGetLog();
      }
    }
    uint64_t v14 = [v5 libraryFilter];
    if (v14 != [(PXPhotoKitAssetsDataSourceManager *)self libraryFilter]) {
      PXAssertGetLog();
    }
    v15 = [v5 photoLibrary];
    v16 = +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:v15];
    contentSyndicationConfigurationProvider = self->_contentSyndicationConfigurationProvider;
    self->_contentSyndicationConfigurationProvider = v16;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [(PXContentSyndicationConfigurationProvider *)self->_contentSyndicationConfigurationProvider registerChangeObserver:self context:PXContentSyndicationConfigurationObservationContext];
    }
    [v5 registerChangeObserver:self];
    backgroundFetchOriginSection = self->_backgroundFetchOriginSection;
    if (backgroundFetchOriginSection)
    {
      objc_msgSend(v5, "setBackgroundFetchOriginSection:", -[NSNumber integerValue](backgroundFetchOriginSection, "integerValue"));
      v19 = self->_backgroundFetchOriginSection;
      self->_backgroundFetchOriginSection = 0;
    }
    objc_storeStrong((id *)p_photosDataSource, v5);
    if (objc_opt_respondsToSelector())
    {
      if (!self->_initialDataSourceLoadingQueue)
      {
        v20 = (OS_dispatch_queue *)dispatch_queue_create("Initial Data Source Loading Queue", 0);
        initialDataSourceLoadingQueue = self->_initialDataSourceLoadingQueue;
        self->_initialDataSourceLoadingQueue = v20;
      }
      [(PXPhotoKitAssetsDataSourceManager *)self _setLoadingInitialPhotosDataSource:1];
      v22 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSourceProvider];
      if (objc_opt_respondsToSelector())
      {
        v23 = [v22 localizedInitialLoadingStatusMessageForDataSourceManager:self];
        localizedLoadingInitialDataSourceMessage = self->_localizedLoadingInitialDataSourceMessage;
        self->_localizedLoadingInitialDataSourceMessage = v23;
      }
      v25 = self->_initialDataSourceLoadingQueue;
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __60__PXPhotoKitAssetsDataSourceManager__ensurePhotosDataSource__block_invoke;
      v30 = &unk_1E5DD32A8;
      id v31 = v22;
      v32 = self;
      id v26 = v22;
      dispatch_async(v25, &v27);
    }
    -[PXPhotoKitAssetsDataSourceManager setPhotosDataSourceProvider:](self, "setPhotosDataSourceProvider:", 0, v27, v28, v29, v30);
  }
}

- (id)_createAssetsDataSourceWithPhotosDataSource:(id)a3 withChangeDetails:(id)a4
{
  id v5 = a4;
  id v6 = [a3 immutableCopy];
  id v7 = [[PXPhotoKitAssetsDataSource alloc] initWithImmutablePhotosDataSource:v6 withChangeDetails:v5];

  return v7;
}

- (void)setBackgroundFetchOriginSection:(int64_t)a3
{
  photosDataSource = self->_photosDataSource;
  if (photosDataSource)
  {
    [(PXPhotosDataSource *)photosDataSource setBackgroundFetchOriginSection:a3];
  }
  else
  {
    id v5 = [NSNumber numberWithInteger:a3];
    backgroundFetchOriginSection = self->_backgroundFetchOriginSection;
    self->_backgroundFetchOriginSection = v5;
  }
}

- (PXPhotoKitAssetsDataSourceManager)initWithPhotosDataSourceProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXPhotoKitAssetsDataSourceManager;
  id v5 = [(PXSectionedDataSourceManager *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(PXPhotoKitAssetsDataSourceManager *)v5 setPhotosDataSourceProvider:v4];
  }

  return v6;
}

- (void)setPhotosDataSourceProvider:(id)a3
{
}

- (PXPhotosDataSourceProvider)photosDataSourceProvider
{
  return self->_photosDataSourceProvider;
}

- (void)photosDataSourceDidFinishBackgroundFetching:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81__PXPhotoKitAssetsDataSourceManager_photosDataSourceDidFinishBackgroundFetching___block_invoke;
  v3[3] = &unk_1E5DBA818;
  v3[4] = self;
  [(PXPhotoKitAssetsDataSourceManager *)self enumerateObserversUsingBlock:v3];
}

- (void)setLibraryFilter:(int64_t)a3
{
  if (self->_libraryFilter != a3)
  {
    self->_libraryFilter = a3;
    -[PXPhotosDataSource setLibraryFilter:](self->_photosDataSource, "setLibraryFilter:");
  }
}

- (NSPredicate)filterPredicate
{
  int v3 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSourceIfExists];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 filterPredicate];
  }
  else
  {
    id v5 = self->_filterPredicate;
  }
  id v6 = v5;

  return v6;
}

- (PXPhotosDataSource)photosDataSourceIfExists
{
  return self->_photosDataSource;
}

- (void)setFilterPredicate:(id)a3 provideIncrementalChangeDetailsForAssetCollections:(id)a4
{
  id v10 = a4;
  filterPredicate = (NSPredicate *)a3;
  id v7 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSourceIfExists];
  objc_super v8 = v7;
  if (v7)
  {
    [v7 setFilterPredicate:filterPredicate provideIncrementalChangeDetailsForAssetCollections:v10];
  }
  else
  {
    char v9 = (NSPredicate *)[(NSPredicate *)filterPredicate copy];

    filterPredicate = self->_filterPredicate;
    self->_filterPredicate = v9;
  }
}

- (void)setFilterPredicate:(id)a3
{
}

- (NSArray)sortDescriptors
{
  int v3 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSourceIfExists];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 sortDescriptors];
  }
  else
  {
    id v5 = self->_sortDescriptors;
  }
  id v6 = v5;

  return v6;
}

- (void)setSortDescriptors:(id)a3
{
  sortDescriptors = (NSArray *)a3;
  id v5 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSourceIfExists];
  id v7 = v5;
  if (v5)
  {
    [v5 setSortDescriptors:sortDescriptors];
  }
  else
  {
    id v6 = (NSArray *)[(NSArray *)sortDescriptors copy];

    sortDescriptors = self->_sortDescriptors;
    self->_sortDescriptors = v6;
  }
}

void __81__PXPhotoKitAssetsDataSourceManager_photosDataSourceDidFinishBackgroundFetching___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assetsDataSourceManagerDidFinishBackgroundFetching:*(void *)(a1 + 32)];
  }
}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  return [(PXPhotosDataSource *)self->_photosDataSource pauseChangeDeliveryAndBackgroundLoadingWithTimeout:a4 identifier:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__utilityWorkQueue, 0);
  objc_storeStrong((id *)&self->_photosDataSourceProvider, 0);
  objc_storeStrong((id *)&self->_contentSyndicationConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_localizedLoadingInitialDataSourceMessage, 0);
  objc_storeStrong((id *)&self->_initialDataSourceLoadingQueue, 0);
  objc_storeStrong((id *)&self->_backgroundFetchOriginSection, 0);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
}

- (void)set_utilityWorkQueue:(id)a3
{
}

- (BOOL)_isLoadingInitialPhotosDataSource
{
  return self->__isLoadingInitialPhotosDataSource;
}

- (void)setIgnoreSharedLibraryFilters:(BOOL)a3
{
  self->_ignoreSharedLibraryFilters = a3;
}

- (BOOL)ignoreSharedLibraryFilters
{
  return self->_ignoreSharedLibraryFilters;
}

- (void)_didFinishLoadingInitialPhotosDataSource
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __77__PXPhotoKitAssetsDataSourceManager__didFinishLoadingInitialPhotosDataSource__block_invoke;
  v2[3] = &unk_1E5DBA818;
  v2[4] = self;
  [(PXPhotoKitAssetsDataSourceManager *)self enumerateObserversUsingBlock:v2];
}

void __77__PXPhotoKitAssetsDataSourceManager__didFinishLoadingInitialPhotosDataSource__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assetsDataSourceManagerDidFinishLoadingInitialDataSource:*(void *)(a1 + 32)];
  }
}

- (id)photosDataSourceInterestingAssetReferences:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];

  if (v5 == v4)
  {
    id v7 = [(PXSectionedDataSourceManager *)self queryObserversInterestingObjectReferences];
    objc_super v8 = [v7 indexesOfObjectsPassingTest:&__block_literal_global_108736];
    id v6 = [v7 objectsAtIndexes:v8];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

uint64_t __80__PXPhotoKitAssetsDataSourceManager_photosDataSourceInterestingAssetReferences___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXContentSyndicationConfigurationObservationContext != a5)
  {
    char v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXPhotoKitAssetsDataSourceManager.m" lineNumber:655 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 5) != 0)
  {
    id v14 = v9;
    id v10 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
    v11 = [v10 containerAssetCollection];
    v12 = [v10 photoLibrary];
    objc_msgSend(v10, "setCanIncludeUnsavedSyndicatedAssets:", +[PXPhotoKitAssetsDataSourceManager _includeUnsavedSyndicatedAssetsForAssetCollection:photoLibrary:](PXPhotoKitAssetsDataSourceManager, "_includeUnsavedSyndicatedAssetsForAssetCollection:photoLibrary:", v11, v12));

    id v9 = v14;
  }
}

- (void)_markSharedAlbumAsViewed:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotoKitAssetsDataSourceManager *)self photoLibrary];
  char v6 = [(PXPhotoKitAssetsDataSourceManager *)self _utilityWorkQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PXPhotoKitAssetsDataSourceManager__markSharedAlbumAsViewed___block_invoke;
  v9[3] = &unk_1E5DD32A8;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, v9);
}

void __62__PXPhotoKitAssetsDataSourceManager__markSharedAlbumAsViewed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) photoLibraryForCurrentQueueQoS];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__PXPhotoKitAssetsDataSourceManager__markSharedAlbumAsViewed___block_invoke_2;
  v4[3] = &unk_1E5DD32A8;
  id v5 = *(id *)(a1 + 40);
  id v6 = v2;
  id v3 = v2;
  [v3 performBlockAndWait:v4];
}

void __62__PXPhotoKitAssetsDataSourceManager__markSharedAlbumAsViewed___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F8A720];
  id v3 = [*(id *)(a1 + 32) cloudGUID];
  id v4 = [v2 cloudSharedAlbumWithGUID:v3 inLibrary:*(void *)(a1 + 40)];

  if (v4)
  {
    [MEMORY[0x1E4F8AC68] userDidNavigateIntoSharedAlbum:v4];
  }
  else
  {
    id v5 = PLSharedAlbumsGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) cloudGUID];
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Could not find plSharedAlbum to mark as viewed, for cloudGUID: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_markFeaturedPhotosAsViewed
{
  id v3 = [(PXPhotoKitAssetsDataSourceManager *)self photoLibrary];
  id v4 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSourceIfExists];
  __int16 v5 = PXSharingFilterFromLibraryFilterViewMode([v4 libraryFilter]);

  id v6 = dispatch_get_global_queue(21, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__PXPhotoKitAssetsDataSourceManager__markFeaturedPhotosAsViewed__block_invoke;
  v8[3] = &unk_1E5DC2E78;
  id v9 = v3;
  __int16 v10 = v5;
  id v7 = v3;
  dispatch_async(v6, v8);
}

void __64__PXPhotoKitAssetsDataSourceManager__markFeaturedPhotosAsViewed__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v3 = +[PXPhotosIntelligenceFetcher fetchFeaturedPhotoSuggestionsInPhotoLibrary:*(void *)(a1 + 32) sharingFilter:*(unsigned __int16 *)(a1 + 40) currentlyFeaturedOnly:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (![v8 state]) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  if ([v2 count])
  {
    id v9 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__PXPhotoKitAssetsDataSourceManager__markFeaturedPhotosAsViewed__block_invoke_2;
    v10[3] = &unk_1E5DD36F8;
    id v11 = v2;
    [v9 performChanges:v10 completionHandler:0];
  }
}

void __64__PXPhotoKitAssetsDataSourceManager__markFeaturedPhotosAsViewed__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = objc_msgSend(MEMORY[0x1E4F39318], "changeRequestForSuggestion:", *(void *)(*((void *)&v7 + 1) + 8 * v5), (void)v7);
        [v6 markActive];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)markContentAsViewed
{
  uint64_t v3 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  id v7 = [v3 containerCollection];

  if (objc_msgSend(v7, "px_isFeaturedPhotosCollection")) {
    [(PXPhotoKitAssetsDataSourceManager *)self _markFeaturedPhotosAsViewed];
  }
  uint64_t v4 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  uint64_t v5 = [v4 containerAssetCollection];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v6 = v5;

    if (v6) {
      [(PXPhotoKitAssetsDataSourceManager *)self _markSharedAlbumAsViewed:v6];
    }
  }
  else
  {

    id v6 = 0;
  }
}

- (void)refreshResultsForAssetCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  [v5 refetchResultsForAssetCollection:v4];
}

- (void)stopExcludingAssets:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  [v5 stopExcludingAssets:v4];
}

- (void)excludeAssetsAtIndexPaths:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  [v5 forceExcludeAssetsAtIndexes:v4];
}

- (void)stopForceIncludingAllAssets
{
  id v2 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  [v2 stopForceIncludingAllAssets];
}

- (void)forceIncludeAssetsAtIndexPaths:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  [v5 forceIncludeAssetsAtIndexes:v4];
}

- (id)localizedLoadingInitialDataSourceMessage
{
  id v2 = (void *)[(NSString *)self->_localizedLoadingInitialDataSourceMessage copy];
  return v2;
}

- (id)localizedEmptyPlaceholderAttributedMessage
{
  uint64_t v3 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  id v4 = [v3 collectionListFetchResult];

  if ([v4 count]) {
    goto LABEL_3;
  }
  id v5 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  id v6 = [v5 containerCollection];
  id v7 = PXPhotoKitLocalizedMessageForEmptyContainerCollection(v6);

  if (!v7)
  {
LABEL_3:
    id v7 = PXPhotoKitLocalizedMessageForEmptyCollectionListFetchResult(v4, 0);
  }

  return v7;
}

- (id)localizedEmptyPlaceholderTitle
{
  id v2 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  uint64_t v3 = [v2 collectionListFetchResult];
  if ([v3 count]
    || ([v2 containerCollection],
        id v4 = objc_claimAutoreleasedReturnValue(),
        PXPhotoKitLocalizedTitleForEmptyContainerCollection(v4),
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    id v6 = [v2 container];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0
      || ([v2 container],
          long long v8 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "px_fetchEmptyContentString"),
          id v5 = objc_claimAutoreleasedReturnValue(),
          v8,
          !v5))
    {
      id v5 = PXPhotoKitLocalizedTitleForEmptyCollectionListFetchResult(v3, 0);
    }
  }

  return v5;
}

- (void)setAllowedUUIDs:(id)a3 manualOrderUUIDs:(id)a4 forAssetCollections:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  [v11 setAllowedUUIDs:v10 manualOrderUUIDs:v9 forAssetCollections:v8];
}

- (void)setAllowedUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  [v5 setAllowedUUIDs:v4];
}

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3 provideIncrementalChangeDetailsForAssetCollections:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  id v6 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  int v7 = [v6 includeOthersInSocialGroupAssets];

  if (v7 != v4)
  {
    id v8 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
    [v8 setIncludeOthersInSocialGroupAssets:v4 provideIncrementalChangeDetailsForAssetCollections:v9];
  }
}

- (BOOL)includeOthersInSocialGroupAssets
{
  id v2 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  char v3 = [v2 includeOthersInSocialGroupAssets];

  return v3;
}

- (void)setFilteringDisabled:(BOOL)a3 forAssetCollection:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  [v7 setDisableFilters:v4 forAssetCollection:v6];
}

- (BOOL)supportsCurationToggling
{
  id v2 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  char v3 = [v2 supportsCurationToggling];

  return v3;
}

- (BOOL)supportsFiltering
{
  return 1;
}

- (int64_t)backgroundFetchOriginSection
{
  if (self->_photosDataSource) {
    return [(PXPhotosDataSource *)self->_photosDataSource backgroundFetchOriginSection];
  }
  else {
    return [(NSNumber *)self->_backgroundFetchOriginSection integerValue];
  }
}

- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3
{
}

- (BOOL)forceAccurateSection:(int64_t)a3 andSectionsBeforeAndAfter:(int64_t)a4
{
  id v6 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  [v6 setBackgroundFetchOriginSection:a3];
  LOBYTE(a4) = [v6 forceAccurateSection:a3 andSectionsBeforeAndAfter:a4];

  return a4;
}

- (BOOL)forceAccurateSectionsIfNeeded:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
    objc_msgSend(v5, "setBackgroundFetchOriginSection:", objc_msgSend(v4, "lastIndex"));
    char v6 = [v5 forceAccurateSectionsIfNeeded:v4 reloadChanges:0];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)setCurationEnabled:(BOOL)a3 forAssetCollection:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  [v7 setWantsCuration:v4 forAssetCollection:v6];
}

- (void)setCurationEnabledForAllCollections:(BOOL)a3 curationLength:(int64_t)a4 collectionsToDiff:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  [v9 setWantsCurationForAllCollections:v6 collectionsToDiff:v8];

  [v9 setWantsCurationByDefault:v6];
  [v9 setCurationLength:a4];
}

- (id)sharedLibraryStatusProvider
{
  id v2 = [(PXPhotoKitAssetsDataSourceManager *)self photoLibrary];
  char v3 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v2];

  return v3;
}

- (OS_dispatch_queue)_utilityWorkQueue
{
  utilityWorkQueue = self->__utilityWorkQueue;
  if (!utilityWorkQueue)
  {
    BOOL v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    id v5 = (OS_dispatch_queue *)dispatch_queue_create("PXPhotoKitAssetsDataSourceManager_background", v4);
    BOOL v6 = self->__utilityWorkQueue;
    self->__utilityWorkQueue = v5;

    utilityWorkQueue = self->__utilityWorkQueue;
  }
  return utilityWorkQueue;
}

- (PHPhotoLibrary)photoLibrary
{
  id v2 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  char v3 = [v2 photoLibrary];

  return (PHPhotoLibrary *)v3;
}

- (void)setPhotosDataSource:(id)a3 publishIntermediateEmptySnapshot:(BOOL)a4
{
  id v7 = (PXPhotosDataSource *)a3;
  photosDataSource = self->_photosDataSource;
  if (photosDataSource != v7)
  {
    id v10 = v7;
    [(PXPhotosDataSource *)photosDataSource unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_photosDataSource, a3);
    [(PXPhotosDataSource *)self->_photosDataSource registerChangeObserver:self];
    if (a4
      || ![(PXPhotosDataSource *)v10 isEmpty]
      || (v9 = [(PXPhotosDataSource *)v10 isBackgroundFetching], id v7 = v10, !v9))
    {
      [(PXPhotoKitAssetsDataSourceManager *)self updateWithPhotosDataSource:v10 andDataSourceChange:0];
      id v7 = v10;
    }
  }
}

- (void)setPhotosDataSource:(id)a3 changeDetails:(id)a4
{
  id v7 = (PXPhotosDataSource *)a3;
  photosDataSource = self->_photosDataSource;
  id v10 = v7;
  if (photosDataSource != v7)
  {
    id v9 = a4;
    [(PXPhotosDataSource *)photosDataSource unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_photosDataSource, a3);
    [(PXPhotosDataSource *)self->_photosDataSource registerChangeObserver:self];
    [(PXPhotoKitAssetsDataSourceManager *)self updateWithPhotosDataSource:v10 sectionedDataSourceChangeDetails:v9];
  }
}

- (void)setPhotosDataSource:(id)a3
{
}

- (void)setIncludeAllBurstAssets:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  int v6 = [v5 includeAllBurstAssets];

  if (v6 != v3)
  {
    PXPreferencesSetIsStacksEnabled(v3);
    id v7 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
    [v7 setIncludeAllBurstAssets:v3];
  }
}

- (BOOL)includeAllBurstAssets
{
  id v2 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
  char v3 = [v2 includeAllBurstAssets];

  return v3;
}

- (void)_setLoadingInitialPhotosDataSource:(BOOL)a3
{
  if (self->__isLoadingInitialPhotosDataSource != a3)
  {
    self->__isLoadingInitialPhotosDataSource = a3;
    if (!a3) {
      [(PXPhotoKitAssetsDataSourceManager *)self _didFinishLoadingInitialPhotosDataSource];
    }
  }
}

- (BOOL)isLoadingInitialDataSource
{
  if ([(PXPhotoKitAssetsDataSourceManager *)self _isLoadingInitialPhotosDataSource]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)PXPhotoKitAssetsDataSourceManager;
  return [(PXPhotoKitAssetsDataSourceManager *)&v4 isLoadingInitialDataSource];
}

void __60__PXPhotoKitAssetsDataSourceManager__ensurePhotosDataSource__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) loadInitialPhotosDataSourceForDataSourceManager:*(void *)(a1 + 40)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__PXPhotoKitAssetsDataSourceManager__ensurePhotosDataSource__block_invoke_2;
  v5[3] = &unk_1E5DD32A8;
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = v2;
  uint64_t v7 = v3;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __60__PXPhotoKitAssetsDataSourceManager__ensurePhotosDataSource__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundFetchOriginSection:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 168), "backgroundFetchOriginSection"));
  if ([*(id *)(a1 + 32) isBackgroundFetching]) {
    [*(id *)(a1 + 32) startBackgroundFetchIfNeeded];
  }
  [*(id *)(a1 + 40) _setLoadingInitialPhotosDataSource:0];
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  return [v2 setPhotosDataSource:v3 publishIntermediateEmptySnapshot:1];
}

- (id)createDataSourceManagerForAsset:(id)a3
{
  id v5 = [a3 asset];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      id v11 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
      [v8 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSourceManager.m", 229, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"assetReference.asset", v10, v11 object file lineNumber description];
    }
    id v6 = +[PXPhotoKitAssetsDataSourceManager dataSourceManagerWithAsset:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)createDataSourceManagerForAssetsInSectionOfAsset:(id)a3 usingNewTransientAssetCollection:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    id v6 = a3;
    uint64_t v7 = [(PXPhotoKitAssetsDataSourceManager *)self photosDataSource];
    id v8 = [v7 createDataSourceWithAssetsInSectionOfAsset:v6 usingNewTransientAssetCollection:v4];

    id v9 = [[PXPhotoKitAssetsDataSourceManager alloc] initWithPhotosDataSource:v8];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (void)dealloc
{
  [(PXPhotosDataSource *)self->_photosDataSource unregisterChangeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PXPhotoKitAssetsDataSourceManager;
  [(PXPhotoKitAssetsDataSourceManager *)&v3 dealloc];
}

- (PXPhotoKitAssetsDataSourceManager)init
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotoKitAssetsDataSourceManager.m", 211, @"%s is not available as initializer", "-[PXPhotoKitAssetsDataSourceManager init]");

  abort();
}

- (PXPhotoKitAssetsDataSourceManager)initWithPhotosDataSource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXPhotoKitAssetsDataSourceManager;
  id v5 = [(PXSectionedDataSourceManager *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(PXPhotoKitAssetsDataSourceManager *)v5 setPhotosDataSource:v4];
  }

  return v6;
}

+ (BOOL)_includeUnsavedSyndicatedAssetsForAssetCollection:(id)a3 photoLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetsDataSourceManager.m", 182, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  id v9 = +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:v8];
  int v10 = [v9 showUnsavedSyndicatedContentInPhotosGrids];
  char ShouldShowUnsavedAssetsInGridForAssetCollection = v10;
  if (v7 && v10) {
    char ShouldShowUnsavedAssetsInGridForAssetCollection = PXContentSyndicationShouldShowUnsavedAssetsInGridForAssetCollection(v7);
  }

  return ShouldShowUnsavedAssetsInGridForAssetCollection;
}

+ (id)dataSourceManagerForAssetCollection:(id)a3 configuration:(id)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 existingAssetsFetchResult];
  id v8 = [v6 existingKeyAssetsFetchResult];
  v34 = [v6 fetchPropertySets];
  uint64_t v33 = [v6 basePredicate];
  uint64_t v9 = [v6 options];
  char v32 = [v6 ignoreSharedLibraryFilters];
  unsigned int v31 = [v6 reverseSortOrder];
  uint64_t v10 = [v6 canIncludeUnsavedSyndicatedAssets];

  id v11 = [v5 photoLibrary];
  uint64_t v12 = [v11 librarySpecificFetchOptions];
  if ([v5 isTransient])
  {
    long long v13 = (void *)MEMORY[0x1E4F39008];
    v40[0] = v5;
    long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    long long v15 = [v5 localizedTitle];
    v16 = [v13 transientCollectionListWithCollections:v14 title:v15 identifier:0 photoLibrary:v11];

    uint64_t v17 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v16 options:v12];
  }
  else
  {
    [v12 setIncludeScreenRecordingsSmartAlbum:1];
    [v12 setIncludeUserSmartAlbums:1];
    BOOL v18 = [v5 assetCollectionType] == 2 && objc_msgSend(v5, "assetCollectionSubtype") == 1000000211;
    [v12 setIncludeProResSmartAlbum:v18];
    BOOL v19 = [v5 assetCollectionType] == 2 && objc_msgSend(v5, "assetCollectionSubtype") == 1000000214;
    [v12 setIncludeSharedLibrarySharingSuggestionsSmartAlbum:v19];
    [v12 setIncludePendingMemories:1];
    [v12 setIncludeLocalMemories:1];
    [v12 setIncludeStoryMemories:1];
    v20 = (void *)MEMORY[0x1E4F38EE8];
    v16 = [v5 localIdentifier];
    v39 = v16;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    uint64_t v17 = [v20 fetchAssetCollectionsWithLocalIdentifiers:v21 options:v12];
  }
  v22 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:v17 containerCollection:0 options:v9];
  [(PXPhotosDataSourceConfiguration *)v22 setFetchPropertySets:v34];
  [(PXPhotosDataSourceConfiguration *)v22 setBasePredicate:v33];
  v23 = +[PXContentFilterState defaultFilterStateForContainerCollection:v5 photoLibrary:v11];
  v24 = [v23 predicateForUseCase:0];
  [(PXPhotosDataSourceConfiguration *)v22 setFilterPredicate:v24];

  -[PXPhotosDataSourceConfiguration setIncludeOthersInSocialGroupAssets:](v22, "setIncludeOthersInSocialGroupAssets:", [v23 includeOthersInSocialGroupAssets]);
  [(PXPhotosDataSourceConfiguration *)v22 setReverseSortOrder:v31];
  [(PXPhotosDataSourceConfiguration *)v22 setCanIncludeUnsavedSyndicatedAssets:v10];
  if (v7)
  {
    id v37 = v5;
    v38 = v7;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    [(PXPhotosDataSourceConfiguration *)v22 setExistingAssetCollectionFetchResults:v25];
  }
  if (v8)
  {
    id v35 = v5;
    v36 = v8;
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    [(PXPhotosDataSourceConfiguration *)v22 setExistingKeyAssetsFetchResults:v26];
  }
  if ((v32 & 1) != 0
    || (objc_msgSend(v5, "px_isSharedAlbum") & 1) != 0
    || (objc_msgSend(v5, "px_isMyPhotoStreamAlbum") & 1) != 0)
  {
    uint64_t v27 = 1;
  }
  else
  {
    uint64_t v27 = objc_msgSend(v5, "px_isUnableToUploadSmartAlbum");
  }
  [(PXPhotosDataSourceConfiguration *)v22 setIgnoreSharedLibraryFilters:v27];
  if ([(PXPhotosDataSourceConfiguration *)v22 ignoreSharedLibraryFilters])
  {
    [(PXPhotosDataSourceConfiguration *)v22 setLibraryFilterState:0];
    [(PXPhotosDataSourceConfiguration *)v22 setLibraryFilter:0];
  }
  uint64_t v28 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v22];
  v29 = [[PXPhotoKitAssetsDataSourceManager alloc] initWithPhotosDataSource:v28];

  return v29;
}

+ (id)dataSourceManagerForAssetCollection:(id)a3 existingAssetsFetchResult:(id)a4 existingKeyAssetsFetchResult:(id)a5 fetchPropertySets:(id)a6 basePredicate:(id)a7 options:(unint64_t)a8 ignoreSharedLibraryFilters:(BOOL)a9 reverseSortOrder:(BOOL)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  if (!v17)
  {
    uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetsDataSourceManager.m", 105, @"Invalid parameter not satisfying: %@", @"assetCollection" object file lineNumber description];
  }
  v22 = [v17 photoLibrary];
  uint64_t v23 = [a1 _includeUnsavedSyndicatedAssetsForAssetCollection:v17 photoLibrary:v22];

  v24 = objc_alloc_init(PXPhotoKitAssetsDataSourceManagerConfiguration);
  [(PXPhotoKitAssetsDataSourceManagerConfiguration *)v24 setExistingAssetsFetchResult:v18];
  [(PXPhotoKitAssetsDataSourceManagerConfiguration *)v24 setExistingKeyAssetsFetchResult:v19];
  [(PXPhotoKitAssetsDataSourceManagerConfiguration *)v24 setFetchPropertySets:v20];
  [(PXPhotoKitAssetsDataSourceManagerConfiguration *)v24 setBasePredicate:v21];
  [(PXPhotoKitAssetsDataSourceManagerConfiguration *)v24 setOptions:a8];
  [(PXPhotoKitAssetsDataSourceManagerConfiguration *)v24 setIgnoreSharedLibraryFilters:a9];
  [(PXPhotoKitAssetsDataSourceManagerConfiguration *)v24 setReverseSortOrder:a10];
  [(PXPhotoKitAssetsDataSourceManagerConfiguration *)v24 setCanIncludeUnsavedSyndicatedAssets:v23];
  v25 = [a1 dataSourceManagerForAssetCollection:v17 configuration:v24];

  return v25;
}

+ (id)dataSourceManagerForAssetCollection:(id)a3 existingAssetsFetchResult:(id)a4 existingKeyAssetsFetchResult:(id)a5 fetchPropertySets:(id)a6 basePredicate:(id)a7 options:(unint64_t)a8 ignoreSharedLibraryFilters:(BOOL)a9
{
  LOWORD(v10) = a9;
  return (id)objc_msgSend(a1, "dataSourceManagerForAssetCollection:existingAssetsFetchResult:existingKeyAssetsFetchResult:fetchPropertySets:basePredicate:options:ignoreSharedLibraryFilters:reverseSortOrder:", a3, a4, a5, a6, a7, a8, v10);
}

+ (id)dataSourceManagerForAssetCollection:(id)a3 existingAssetsFetchResult:(id)a4
{
  LOBYTE(v5) = 0;
  return (id)[a1 dataSourceManagerForAssetCollection:a3 existingAssetsFetchResult:a4 existingKeyAssetsFetchResult:0 fetchPropertySets:0 basePredicate:0 options:0 ignoreSharedLibraryFilters:v5];
}

+ (id)dataSourceManagerForAssetCollection:(id)a3
{
  return (id)[a1 dataSourceManagerForAssetCollection:a3 existingAssetsFetchResult:0];
}

+ (PXPhotoKitAssetsDataSourceManager)dataSourceManagerWithAssets:(id)a3 containerTitle:(id)a4 options:(unint64_t)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:a3 title:a4];
  id v7 = (void *)MEMORY[0x1E4F39008];
  v15[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  uint64_t v9 = [v7 transientCollectionListWithCollections:v8 title:0];

  uint64_t v10 = [MEMORY[0x1E4F38EE8] fetchCollectionsInCollectionList:v9 options:0];
  id v11 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:v10 options:a5];
  uint64_t v12 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v11];
  long long v13 = [[PXPhotoKitAssetsDataSourceManager alloc] initWithPhotosDataSource:v12];

  return v13;
}

+ (PXPhotoKitAssetsDataSourceManager)dataSourceManagerWithAssets:(id)a3
{
  return (PXPhotoKitAssetsDataSourceManager *)[a1 dataSourceManagerWithAssets:a3 containerTitle:0 options:0];
}

+ (PXPhotoKitAssetsDataSourceManager)dataSourceManagerWithAsset:(id)a3 options:(unint64_t)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F38EE8];
  v20[0] = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  id v8 = [v6 arrayWithObjects:v20 count:1];
  uint64_t v9 = [v5 transientAssetCollectionWithAssets:v8 title:0];

  uint64_t v10 = (void *)MEMORY[0x1E4F39008];
  id v19 = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  uint64_t v12 = [v10 transientCollectionListWithCollections:v11 title:0];

  long long v13 = [MEMORY[0x1E4F38EE8] fetchCollectionsInCollectionList:v12 options:0];
  long long v14 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:v13 options:a4 | 4];
  long long v15 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v14];
  v16 = [PXPhotoKitAssetsDataSourceManager alloc];

  id v17 = [(PXPhotoKitAssetsDataSourceManager *)v16 initWithPhotosDataSource:v15];
  return v17;
}

+ (PXPhotoKitAssetsDataSourceManager)dataSourceManagerWithAsset:(id)a3
{
  return (PXPhotoKitAssetsDataSourceManager *)[a1 dataSourceManagerWithAsset:a3 options:0];
}

- (id)px_sharedLibrarySharingSuggestionsCountsManager
{
  id v2 = [(PXPhotoKitAssetsDataSourceManager *)self photoLibrary];
  objc_super v3 = objc_msgSend(v2, "px_sharedLibrarySharingSuggestionsCountsManager");

  return v3;
}

@end
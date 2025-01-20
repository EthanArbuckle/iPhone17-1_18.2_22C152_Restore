@interface PXSwitchableAssetsDataSourceManager
- (BOOL)forceAccurateAllSectionsIfNeeded;
- (BOOL)forceAccurateSection:(int64_t)a3 andSectionsBeforeAndAfter:(int64_t)a4;
- (BOOL)forceAccurateSectionsIfNeeded:(id)a3;
- (BOOL)includeOthersInSocialGroupAssets;
- (BOOL)isBackgroundFetching;
- (BOOL)isLoadingInitialDataSource;
- (BOOL)supportsCurationToggling;
- (BOOL)supportsFiltering;
- (BOOL)supportsLens:(id)a3;
- (NSCopying)currentDataSourceKey;
- (NSCopying)currentKey;
- (NSDictionary)dataSourceManagerByKey;
- (NSSet)allKeys;
- (NSString)description;
- (PXAssetsDataSource)currentDataSource;
- (PXAssetsDataSourceManager)currentDataSourceManager;
- (PXPhotosViewLens)currentLens;
- (PXSwitchableAssetsDataSourceManager)init;
- (PXSwitchableAssetsDataSourceManager)initWithDataSourceManagerByKey:(id)a3 currentKey:(id)a4;
- (PXUpdater)updater;
- (id)createDataSourceManagerForAsset:(id)a3;
- (id)createDataSourceManagerForAssetsInSectionOfAsset:(id)a3 usingNewTransientAssetCollection:(BOOL)a4;
- (id)createInitialDataSource;
- (id)dataSourceManagerForKey:(id)a3;
- (id)filterPredicate;
- (id)localizedEmptyPlaceholderAttributedMessage;
- (id)localizedEmptyPlaceholderTitle;
- (id)localizedLoadingInitialDataSourceMessage;
- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4;
- (id)sharedLibraryStatusProvider;
- (id)sortDescriptors;
- (int64_t)backgroundFetchOriginSection;
- (void)_enumerateAllDataSourceManagers:(id)a3;
- (void)_invalidateCurrentDataSource;
- (void)_setNeedsUpdate;
- (void)_updateCurrentDataSource;
- (void)assetsDataSourceManagerDidFinishBackgroundFetching:(id)a3;
- (void)assetsDataSourceManagerDidFinishLoadingInitialDataSource:(id)a3;
- (void)didPerformChanges;
- (void)ensureLastSectionHasContent;
- (void)ensureStartingSectionHasContent;
- (void)excludeAssetsAtIndexPaths:(id)a3;
- (void)forceIncludeAssetsAtIndexPaths:(id)a3;
- (void)markContentAsViewed;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)refreshResultsForAssetCollection:(id)a3;
- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3;
- (void)setAllowedUUIDs:(id)a3;
- (void)setAllowedUUIDs:(id)a3 manualOrderUUIDs:(id)a4 forAssetCollections:(id)a5;
- (void)setBackgroundFetchOriginSection:(int64_t)a3;
- (void)setCurationEnabled:(BOOL)a3 forAssetCollection:(id)a4;
- (void)setCurationEnabledForAllCollections:(BOOL)a3 curationLength:(int64_t)a4 collectionsToDiff:(id)a5;
- (void)setCurrentDataSource:(id)a3;
- (void)setCurrentDataSourceKey:(id)a3;
- (void)setCurrentKey:(id)a3;
- (void)setFilterPredicate:(id)a3;
- (void)setFilterPredicate:(id)a3 provideIncrementalChangeDetailsForAssetCollections:(id)a4;
- (void)setFilteringDisabled:(BOOL)a3 forAssetCollection:(id)a4;
- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3;
- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3 provideIncrementalChangeDetailsForAssetCollections:(id)a4;
- (void)setSortDescriptors:(id)a3;
- (void)startBackgroundFetchIfNeeded;
- (void)stopExcludingAssets:(id)a3;
- (void)stopForceIncludingAllAssets;
- (void)waitForAvailabilityOfAsset:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
@end

@implementation PXSwitchableAssetsDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDataSource, 0);
  objc_storeStrong((id *)&self->_currentDataSourceKey, 0);
  objc_storeStrong((id *)&self->_allKeys, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_dataSourceManagerByKey, 0);
  objc_storeStrong((id *)&self->_currentKey, 0);
}

- (void)setCurrentDataSource:(id)a3
{
}

- (PXAssetsDataSource)currentDataSource
{
  return self->_currentDataSource;
}

- (void)setCurrentDataSourceKey:(id)a3
{
}

- (NSCopying)currentDataSourceKey
{
  return self->_currentDataSourceKey;
}

- (NSSet)allKeys
{
  return self->_allKeys;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (NSDictionary)dataSourceManagerByKey
{
  return self->_dataSourceManagerByKey;
}

- (NSCopying)currentKey
{
  return self->_currentKey;
}

- (void)assetsDataSourceManagerDidFinishLoadingInitialDataSource:(id)a3
{
  id v4 = a3;
  id v5 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];

  if (v5 == v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __96__PXSwitchableAssetsDataSourceManager_assetsDataSourceManagerDidFinishLoadingInitialDataSource___block_invoke;
    v6[3] = &unk_1E5DBA818;
    v6[4] = self;
    [(PXSwitchableAssetsDataSourceManager *)self enumerateObserversUsingBlock:v6];
  }
}

void __96__PXSwitchableAssetsDataSourceManager_assetsDataSourceManagerDidFinishLoadingInitialDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assetsDataSourceManagerDidFinishLoadingInitialDataSource:*(void *)(a1 + 32)];
  }
}

- (void)assetsDataSourceManagerDidFinishBackgroundFetching:(id)a3
{
  id v4 = a3;
  id v5 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];

  if (v5 == v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __90__PXSwitchableAssetsDataSourceManager_assetsDataSourceManagerDidFinishBackgroundFetching___block_invoke;
    v6[3] = &unk_1E5DBA818;
    v6[4] = self;
    [(PXSwitchableAssetsDataSourceManager *)self enumerateObserversUsingBlock:v6];
  }
}

void __90__PXSwitchableAssetsDataSourceManager_assetsDataSourceManagerDidFinishBackgroundFetching___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assetsDataSourceManagerDidFinishBackgroundFetching:*(void *)(a1 + 32)];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXChildDataSourceManagerObservationContext != a5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXSwitchableAssetsDataSourceManager.m" lineNumber:341 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v10 = v9;
  if (v6)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__PXSwitchableAssetsDataSourceManager_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E5DD1458;
    v12[4] = self;
    [(PXSwitchableAssetsDataSourceManager *)self performChanges:v12];
  }
}

uint64_t __68__PXSwitchableAssetsDataSourceManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateCurrentDataSource];
}

- (void)_updateCurrentDataSource
{
  id v10 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSource];
  id v3 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  id v4 = [v3 dataSource];
  [(PXSwitchableAssetsDataSourceManager *)self setCurrentDataSource:v4];
  id v5 = [(PXSwitchableAssetsDataSourceManager *)self currentKey];
  [(PXSwitchableAssetsDataSourceManager *)self setCurrentDataSourceKey:v5];

  id v6 = v4;
  v7 = v10;
  if (v10 != v6)
  {
    char v8 = [v10 isEqual:v6];

    if (v8) {
      goto LABEL_5;
    }
    id v9 = [v3 changeHistory];
    v7 = objc_msgSend(v9, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v10, "identifier"), objc_msgSend(v6, "identifier"));

    [(PXSectionedDataSourceManager *)self setDataSource:v6 changeDetailsArray:v7];
  }

LABEL_5:
}

- (void)_invalidateCurrentDataSource
{
  id v2 = [(PXSwitchableAssetsDataSourceManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentDataSource];
}

- (void)_setNeedsUpdate
{
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXSwitchableAssetsDataSourceManager;
  [(PXSwitchableAssetsDataSourceManager *)&v4 didPerformChanges];
  id v3 = [(PXSwitchableAssetsDataSourceManager *)self updater];
  [v3 updateIfNeeded];
}

- (void)_enumerateAllDataSourceManagers:(id)a3
{
  id v4 = a3;
  dataSourceManagerByKey = self->_dataSourceManagerByKey;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__PXSwitchableAssetsDataSourceManager__enumerateAllDataSourceManagers___block_invoke;
  v7[3] = &unk_1E5DB6158;
  id v8 = v4;
  id v6 = v4;
  [(NSDictionary *)dataSourceManagerByKey enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __71__PXSwitchableAssetsDataSourceManager__enumerateAllDataSourceManagers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PXAssetsDataSourceManager)currentDataSourceManager
{
  dataSourceManagerByKey = self->_dataSourceManagerByKey;
  id v3 = [(PXSwitchableAssetsDataSourceManager *)self currentKey];
  id v4 = [(NSDictionary *)dataSourceManagerByKey objectForKeyedSubscript:v3];

  return (PXAssetsDataSourceManager *)v4;
}

- (void)setAllowedUUIDs:(id)a3 manualOrderUUIDs:(id)a4 forAssetCollections:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  [v11 setAllowedUUIDs:v10 manualOrderUUIDs:v9 forAssetCollections:v8];
}

- (void)setAllowedUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  [v5 setAllowedUUIDs:v4];
}

- (void)setFilteringDisabled:(BOOL)a3 forAssetCollection:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  [v7 setFilteringDisabled:v4 forAssetCollection:v6];
}

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3 provideIncrementalChangeDetailsForAssetCollections:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  [v7 setIncludeOthersInSocialGroupAssets:v4 provideIncrementalChangeDetailsForAssetCollections:v6];
}

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  [v4 setIncludeOthersInSocialGroupAssets:v3];
}

- (void)setFilterPredicate:(id)a3 provideIncrementalChangeDetailsForAssetCollections:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  [v8 setFilterPredicate:v7 provideIncrementalChangeDetailsForAssetCollections:v6];
}

- (void)setSortDescriptors:(id)a3
{
  id v4 = a3;
  id v5 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  [v5 setSortDescriptors:v4];
}

- (void)setFilterPredicate:(id)a3
{
  id v4 = a3;
  id v5 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  [v5 setFilterPredicate:v4];
}

- (void)refreshResultsForAssetCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  [v5 refreshResultsForAssetCollection:v4];
}

- (void)stopExcludingAssets:(id)a3
{
  id v4 = a3;
  id v5 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  [v5 stopExcludingAssets:v4];
}

- (void)excludeAssetsAtIndexPaths:(id)a3
{
  id v4 = a3;
  id v5 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  [v5 excludeAssetsAtIndexPaths:v4];
}

- (void)stopForceIncludingAllAssets
{
}

uint64_t __66__PXSwitchableAssetsDataSourceManager_stopForceIncludingAllAssets__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 stopForceIncludingAllAssets];
}

- (void)forceIncludeAssetsAtIndexPaths:(id)a3
{
  id v4 = a3;
  id v5 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  [v5 forceIncludeAssetsAtIndexPaths:v4];
}

- (void)startBackgroundFetchIfNeeded
{
}

uint64_t __67__PXSwitchableAssetsDataSourceManager_startBackgroundFetchIfNeeded__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 startBackgroundFetchIfNeeded];
}

- (int64_t)backgroundFetchOriginSection
{
  id v2 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  int64_t v3 = [v2 backgroundFetchOriginSection];

  return v3;
}

- (void)setBackgroundFetchOriginSection:(int64_t)a3
{
  id v4 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  [v4 setBackgroundFetchOriginSection:a3];
}

- (void)ensureStartingSectionHasContent
{
  id v2 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  [v2 ensureStartingSectionHasContent];
}

- (void)ensureLastSectionHasContent
{
  id v2 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  [v2 ensureLastSectionHasContent];
}

- (BOOL)forceAccurateSection:(int64_t)a3 andSectionsBeforeAndAfter:(int64_t)a4
{
  id v6 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  LOBYTE(a4) = [v6 forceAccurateSection:a3 andSectionsBeforeAndAfter:a4];

  return a4;
}

- (BOOL)forceAccurateSectionsIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  char v6 = [v5 forceAccurateSectionsIfNeeded:v4];

  return v6;
}

- (BOOL)forceAccurateAllSectionsIfNeeded
{
  id v2 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  char v3 = [v2 forceAccurateAllSectionsIfNeeded];

  return v3;
}

- (void)setCurationEnabled:(BOOL)a3 forAssetCollection:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  [v7 setCurationEnabled:v4 forAssetCollection:v6];
}

- (void)setCurationEnabledForAllCollections:(BOOL)a3 curationLength:(int64_t)a4 collectionsToDiff:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  [v9 setCurationEnabledForAllCollections:v6 curationLength:a4 collectionsToDiff:v8];
}

- (void)markContentAsViewed
{
  id v2 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  [v2 markContentAsViewed];
}

- (id)createDataSourceManagerForAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  BOOL v6 = [v5 createDataSourceManagerForAsset:v4];

  return v6;
}

- (id)createDataSourceManagerForAssetsInSectionOfAsset:(id)a3 usingNewTransientAssetCollection:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  id v8 = [v7 createDataSourceManagerForAssetsInSectionOfAsset:v6 usingNewTransientAssetCollection:v4];

  return v8;
}

- (void)waitForAvailabilityOfAsset:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  [v10 waitForAvailabilityOfAsset:v9 timeout:v8 completionHandler:a4];
}

- (id)sortDescriptors
{
  id v2 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  char v3 = [v2 sortDescriptors];

  return v3;
}

- (BOOL)includeOthersInSocialGroupAssets
{
  id v2 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  char v3 = [v2 includeOthersInSocialGroupAssets];

  return v3;
}

- (id)filterPredicate
{
  id v2 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  char v3 = [v2 filterPredicate];

  return v3;
}

- (BOOL)supportsFiltering
{
  id v2 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  char v3 = [v2 supportsFiltering];

  return v3;
}

- (BOOL)supportsCurationToggling
{
  id v2 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  char v3 = [v2 supportsCurationToggling];

  return v3;
}

- (BOOL)isBackgroundFetching
{
  id v2 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  char v3 = [v2 isBackgroundFetching];

  return v3;
}

- (BOOL)isLoadingInitialDataSource
{
  id v2 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  char v3 = [v2 isLoadingInitialDataSource];

  return v3;
}

- (id)localizedLoadingInitialDataSourceMessage
{
  id v2 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  char v3 = [v2 localizedLoadingInitialDataSourceMessage];

  return v3;
}

- (id)localizedEmptyPlaceholderAttributedMessage
{
  id v2 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  char v3 = [v2 localizedEmptyPlaceholderAttributedMessage];

  return v3;
}

- (id)localizedEmptyPlaceholderTitle
{
  id v2 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  char v3 = [v2 localizedEmptyPlaceholderTitle];

  return v3;
}

- (id)sharedLibraryStatusProvider
{
  BOOL v4 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 sharedLibraryStatusProvider];
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v6 = [MEMORY[0x1E4F28B00] currentHandler];
        id v7 = (objc_class *)objc_opt_class();
        id v8 = NSStringFromClass(v7);
        id v9 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
        [v6 handleFailureInMethod:a2, self, @"PXSwitchableAssetsDataSourceManager.m", 128, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[(id<_PXStatusProviderWorkaround>)currentDataSourceManager sharedLibraryStatusProvider]", v8, v9 object file lineNumber description];
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    [v6 handleFailureInMethod:a2, self, @"PXSwitchableAssetsDataSourceManager.m", 112, @"%@ should be an instance inheriting from %@, but it is nil", @"token", v8 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v9);
    id v10 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v6 handleFailureInMethod:a2, self, @"PXSwitchableAssetsDataSourceManager.m", 112, @"%@ should be an instance inheriting from %@, but it is %@", @"token", v8, v10 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__PXSwitchableAssetsDataSourceManager_resumeChangeDeliveryAndBackgroundLoading___block_invoke;
  v11[3] = &unk_1E5DB6110;
  v11[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v11];
}

void __80__PXSwitchableAssetsDataSourceManager_resumeChangeDeliveryAndBackgroundLoading___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [v4 dataSourceManagerForKey:a2];
  [v6 resumeChangeDeliveryAndBackgroundLoading:v5];
}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__PXSwitchableAssetsDataSourceManager_pauseChangeDeliveryWithTimeout_identifier___block_invoke;
  v13[3] = &unk_1E5DB60E8;
  id v8 = v7;
  double v16 = a3;
  id v14 = v8;
  id v15 = v6;
  id v9 = v6;
  [(PXSwitchableAssetsDataSourceManager *)self _enumerateAllDataSourceManagers:v13];
  id v10 = v15;
  id v11 = v8;

  return v11;
}

void __81__PXSwitchableAssetsDataSourceManager_pauseChangeDeliveryWithTimeout_identifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5 = *(double *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a2;
  id v8 = [a3 pauseChangeDeliveryWithTimeout:v6 identifier:v5];
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
}

- (id)createInitialDataSource
{
  char v3 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  BOOL v4 = [v3 dataSource];

  objc_storeStrong((id *)&self->_currentDataSource, v4);
  return v4;
}

- (BOOL)supportsLens:(id)a3
{
  return [(NSSet *)self->_allKeys containsObject:a3];
}

- (PXPhotosViewLens)currentLens
{
  BOOL v4 = [(PXSwitchableAssetsDataSourceManager *)self currentKey];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      id v9 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v6 handleFailureInMethod:a2, self, @"PXSwitchableAssetsDataSourceManager.m", 86, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.currentKey", v8, v9 object file lineNumber description];
    }
  }
  return (PXPhotosViewLens *)v4;
}

- (void)setCurrentKey:(id)a3
{
  double v5 = (NSCopying *)a3;
  uint64_t v6 = self->_currentKey;
  if (v6 == v5)
  {
  }
  else
  {
    id v7 = v6;
    char v8 = [(NSCopying *)v6 isEqual:v5];

    if ((v8 & 1) == 0)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __53__PXSwitchableAssetsDataSourceManager_setCurrentKey___block_invoke;
      v9[3] = &unk_1E5DB60C0;
      v9[4] = self;
      id v10 = v5;
      SEL v11 = a2;
      [(PXSwitchableAssetsDataSourceManager *)self performChanges:v9];
    }
  }
}

uint64_t __53__PXSwitchableAssetsDataSourceManager_setCurrentKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataSourceManagerForKey:*(void *)(a1 + 40)];

  if (!v2)
  {
    char v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"PXSwitchableAssetsDataSourceManager.m", 73, @"Invalid parameter not satisfying: %@", @"[self dataSourceManagerForKey:currentKey] != nil" object file lineNumber description];
  }
  uint64_t v3 = [*(id *)(a1 + 40) copyWithZone:0];
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(void **)(v4 + 168);
  *(void *)(v4 + 168) = v3;

  uint64_t v6 = *(void **)(a1 + 32);
  return [v6 _invalidateCurrentDataSource];
}

- (id)dataSourceManagerForKey:(id)a3
{
  return [(NSDictionary *)self->_dataSourceManagerByKey objectForKeyedSubscript:a3];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  uint64_t v6 = [(PXSwitchableAssetsDataSourceManager *)self currentDataSourceManager];
  id v7 = [v3 stringWithFormat:@"<%@:%p; currentDataSourceManager:%@>", v5, self, v6];

  return (NSString *)v7;
}

- (PXSwitchableAssetsDataSourceManager)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSwitchableAssetsDataSourceManager.m", 55, @"%s is not available as initializer", "-[PXSwitchableAssetsDataSourceManager init]");

  abort();
}

- (PXSwitchableAssetsDataSourceManager)initWithDataSourceManagerByKey:(id)a3 currentKey:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)PXSwitchableAssetsDataSourceManager;
  id v9 = [(PXSectionedDataSourceManager *)&v32 init];
  if (!v9) {
    goto LABEL_12;
  }
  if (![v7 count])
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, v9, @"PXSwitchableAssetsDataSourceManager.m", 39, @"Invalid parameter not satisfying: %@", @"dataSourceManagers.count >= 1" object file lineNumber description];

    if (v8) {
      goto LABEL_4;
    }
LABEL_14:
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, v9, @"PXSwitchableAssetsDataSourceManager.m", 40, @"Invalid parameter not satisfying: %@", @"currentKey != nil" object file lineNumber description];

    goto LABEL_4;
  }
  if (!v8) {
    goto LABEL_14;
  }
LABEL_4:
  uint64_t v10 = [v7 copy];
  dataSourceManagerByKey = v9->_dataSourceManagerByKey;
  v9->_dataSourceManagerByKey = (NSDictionary *)v10;

  uint64_t v12 = [v8 copyWithZone:0];
  currentKey = v9->_currentKey;
  v9->_currentKey = (NSCopying *)v12;

  id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v15 = [v7 allKeys];
  uint64_t v16 = [v14 initWithArray:v15];
  allKeys = v9->_allKeys;
  v9->_allKeys = (NSSet *)v16;

  uint64_t v18 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v9 needsUpdateSelector:sel__setNeedsUpdate];
  updater = v9->_updater;
  v9->_updater = (PXUpdater *)v18;

  [(PXUpdater *)v9->_updater addUpdateSelector:sel__updateCurrentDataSource];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v20 = [v7 allValues];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v29;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * v24++) registerChangeObserver:v9 context:PXChildDataSourceManagerObservationContext];
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v22);
  }

LABEL_12:
  return v9;
}

@end
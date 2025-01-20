@interface PXCuratedLibraryAssetsDataSourceManager
- (BOOL)canIncludeUnsavedSyndicatedAssets;
- (BOOL)canLoadData;
- (BOOL)enableDays;
- (BOOL)forceAccurateAllSectionsIfNeeded;
- (BOOL)forceAccurateSection:(int64_t)a3 andSectionsBeforeAndAfter:(int64_t)a4;
- (BOOL)forceAccurateSectionsIfNeeded:(id)a3;
- (BOOL)forceAccurateSectionsIfNeeded:(id)a3 inZoomLevel:(int64_t)a4;
- (BOOL)forceAllPhotosAccurateIfNeeded;
- (BOOL)wantsCuration;
- (NSArray)allPhotosSortDescriptors;
- (NSPredicate)allPhotosFilterPredicate;
- (PXAssetsDataSource)currentDataSource;
- (PXAssetsDataSourceManager)currentAssetsDataSourceManager;
- (PXCuratedLibraryAssetsDataSourceManager)init;
- (PXCuratedLibraryAssetsDataSourceManager)initWithConfiguration:(id)a3;
- (PXCuratedLibraryAssetsDataSourceManagerConfiguration)configuration;
- (PXCuratedLibraryAssetsDataSourceManagerDelegate)delegate;
- (PXPhotoKitAssetsDataSourceManager)currentPhotoKitAssetsDataSourceManager;
- (PXUpdater)updater;
- (PXVisualPositionsChangeDetails)lastVisualPositionsChangeDetails;
- (id)_photosDataSourceForZoomLevel:(int64_t)a3;
- (id)assetCollectionReferencesInDataSourceForZoomLevel:(int64_t)a3 withParentAssetCollectionReference:(id)a4;
- (id)assetCollectionReferencesInDataSourceForZoomLevel:(int64_t)a3 withParentAssetCollectionReference:(id)a4 assetCollectionReferenceWithSameKeyAssetAsParent:(id *)a5;
- (id)assetsInAssetCollection:(id)a3;
- (id)createInitialDataSource;
- (id)dataSourceForZoomLevel:(int64_t)a3;
- (id)dataSourceManagerForZoomLevel:(int64_t)a3;
- (id)firstAssetCollectionReferenceInDataSourceForZoomLevel:(int64_t)a3 withParent:(id)a4;
- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4;
- (id)visualPositionsChangeDetailsFromDataSourceIdentifier:(int64_t)a3 toDataSourceIdentifier:(int64_t)a4;
- (int64_t)currentDataSourceZoomLevel;
- (int64_t)lastTransitionType;
- (int64_t)lastVisualPositionsChangeFromDataSourceIdentifier;
- (int64_t)lastVisualPositionsChangeToDataSourceIdentifier;
- (int64_t)libraryFilter;
- (int64_t)transitionTypeFromDataSourceIdentifier:(int64_t)a3 toDataSourceIdentifier:(int64_t)a4;
- (int64_t)zoomLevel;
- (int64_t)zoomLevelForCurrentDataSourceManager;
- (unint64_t)libraryStateForZoomLevel:(int64_t)a3;
- (void)_enumeratePhotoKitDataDataSourceManagers:(id)a3;
- (void)_invalidateCuration;
- (void)_invalidateDataSource;
- (void)_invalidateDataSourceManagers;
- (void)_invalidateDataSourceProperties;
- (void)_invalidatePropertiesDerivedFromZoomLevel;
- (void)_updateCuration;
- (void)_updateDataSource;
- (void)_updateDataSourceManagers;
- (void)_updateDataSourceProperties;
- (void)_updatePropertiesDerivedFromZoomLevel;
- (void)didPerformChanges;
- (void)loadIfNeeded;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)resumeChangeDelivery:(id)a3;
- (void)setAllPhotosFilterPredicate:(id)a3;
- (void)setAllPhotosSortDescriptors:(id)a3;
- (void)setCanIncludeUnsavedSyndicatedAssets:(BOOL)a3;
- (void)setCanLoadData:(BOOL)a3;
- (void)setCurationEnabled:(BOOL)a3 forAssetCollection:(id)a4;
- (void)setCurrentDataSource:(id)a3;
- (void)setCurrentDataSourceZoomLevel:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLastTransitionType:(int64_t)a3;
- (void)setLastVisualPositionsChangeDetails:(id)a3;
- (void)setLastVisualPositionsChangeFromDataSourceIdentifier:(int64_t)a3;
- (void)setLastVisualPositionsChangeToDataSourceIdentifier:(int64_t)a3;
- (void)setLibraryFilter:(int64_t)a3;
- (void)setNeedsUpdate;
- (void)setTransientKeyAsset:(id)a3 forAssetCollection:(id)a4 zoomLevel:(int64_t)a5;
- (void)setWantsCuration:(BOOL)a3;
- (void)setZoomLevel:(int64_t)a3;
- (void)setZoomLevelForCurrentDataSourceManager:(int64_t)a3;
@end

@implementation PXCuratedLibraryAssetsDataSourceManager

uint64_t __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) performChanges:&__block_literal_global_245_290887];
}

- (void)setNeedsUpdate
{
}

uint64_t __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 startBackgroundFetchIfNeeded];
}

- (void)setLastVisualPositionsChangeToDataSourceIdentifier:(int64_t)a3
{
  self->_lastVisualPositionsChangeToDataSourceIdentifier = a3;
}

- (void)_updateDataSourceProperties
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __70__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceProperties__block_invoke;
  v2[3] = &unk_1E5DD1530;
  v2[4] = self;
  [(PXCuratedLibraryAssetsDataSourceManager *)self _enumeratePhotoKitDataDataSourceManagers:v2];
}

- (unint64_t)libraryStateForZoomLevel:(int64_t)a3
{
  dataSourceManagerByZoomLevel = self->_dataSourceManagerByZoomLevel;
  v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  v7 = [(NSDictionary *)dataSourceManagerByZoomLevel objectForKeyedSubscript:v6];
  v8 = [v7 dataSource];

  v9 = [(PXCuratedLibraryAssetsDataSourceManager *)self _photosDataSourceForZoomLevel:a3];
  unint64_t v10 = [v9 isBackgroundFetching];
  if (v8 && [v8 containsAnyItems]) {
    v10 |= 2uLL;
  }

  return v10;
}

- (id)_photosDataSourceForZoomLevel:(int64_t)a3
{
  dataSourceManagerByZoomLevel = self->_dataSourceManagerByZoomLevel;
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSDictionary *)dataSourceManagerByZoomLevel objectForKeyedSubscript:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 photosDataSource];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  v4 = +[PXPreloadScheduler sharedScheduler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke_6;
  v6[3] = &unk_1E5DD36F8;
  id v7 = v3;
  id v5 = v3;
  [v4 scheduleMainQueueTask:v6];
}

void __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setBackgroundFetchOriginSection:0x7FFFFFFFFFFFFFFFLL];
  if (*(void *)(a1 + 40) == 4)
  {
    id v3 = [*(id *)(a1 + 32) allPhotosFilterPredicate];
    [v4 setFilterPredicate:v3];
  }
}

- (void)_enumeratePhotoKitDataDataSourceManagers:(id)a3
{
  v8 = (void (**)(id, uint64_t, void *))a3;
  for (uint64_t i = 1; i != 5; ++i)
  {
    dataSourceManagerByZoomLevel = self->_dataSourceManagerByZoomLevel;
    v6 = [NSNumber numberWithInteger:i];
    id v7 = [(NSDictionary *)dataSourceManagerByZoomLevel objectForKeyedSubscript:v6];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8[2](v8, i, v7);
    }
  }
}

uint64_t __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setLibraryFilter:*(void *)(a1 + 32)];
}

void __70__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceProperties__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = [v5 photosDataSourceIfExists];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __70__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceProperties__block_invoke_2;
  v14 = &unk_1E5DD1508;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v5;
  uint64_t v18 = a2;
  id v7 = v6;
  id v17 = v7;
  id v8 = v5;
  v9 = _Block_copy(&v11);
  unint64_t v10 = v9;
  if (v7) {
    objc_msgSend(v7, "performChanges:", v9, v11, v12, v13, v14, v15, v16, v17, v18);
  }
  else {
    (*((void (**)(void *))v9 + 2))(v9);
  }
}

void __70__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceProperties__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) libraryFilter];
  if (v2 != [*(id *)(a1 + 40) libraryFilter])
  {
    [*(id *)(a1 + 40) setLibraryFilter:v2];
    uint64_t v3 = *(void *)(a1 + 56);
    if (v3 != 4)
    {
      id v4 = *(void **)(a1 + 48);
      if (v4)
      {
        id v5 = [v4 photoLibrary];
        v6 = PXCuratedLibraryFetchHighlights(v3, v5, v2);

        [*(id *)(a1 + 48) setCollectionListFetchResult:v6];
      }
    }
  }
  if (*(void *)(a1 + 56) == 4)
  {
    [*(id *)(a1 + 40) setFilterPredicate:*(void *)(*(void *)(a1 + 32) + 224)];
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 232);
    [v7 setSortDescriptors:v8];
  }
}

- (int64_t)libraryFilter
{
  return self->_libraryFilter;
}

- (NSPredicate)allPhotosFilterPredicate
{
  return self->_allPhotosFilterPredicate;
}

uint64_t __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 startBackgroundFetchIfNeeded];
}

uint64_t __60__PXCuratedLibraryAssetsDataSourceManager__updateDataSource__block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 currentDataSource];
  [v2 setDataSource:v3 changeDetailsArray:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) setLastVisualPositionsChangeDetails:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setLastTransitionType:*(void *)(a1 + 72)];
  objc_msgSend(*(id *)(a1 + 32), "setLastVisualPositionsChangeFromDataSourceIdentifier:", objc_msgSend(*(id *)(a1 + 56), "identifier"));
  uint64_t v4 = [*(id *)(a1 + 64) identifier];
  id v5 = *(void **)(a1 + 32);
  return [v5 setLastVisualPositionsChangeToDataSourceIdentifier:v4];
}

- (void)setLastVisualPositionsChangeFromDataSourceIdentifier:(int64_t)a3
{
  self->_lastVisualPositionsChangeFromDataSourceIdentifier = a3;
}

- (void)setLastVisualPositionsChangeDetails:(id)a3
{
}

- (void)setLastTransitionType:(int64_t)a3
{
  self->_lastTransitionType = a3;
}

- (void)_updateDataSourceManagers
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ([(PXCuratedLibraryAssetsDataSourceManager *)self canLoadData])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    int64_t v27 = [(PXCuratedLibraryAssetsDataSourceManager *)self libraryFilter];
    for (uint64_t i = 1; i != 5; ++i)
    {
      id v5 = [(PXCuratedLibraryAssetsDataSourceManager *)self configuration];
      v6 = [v5 configurationForZoomLevel:i];

      id v7 = [v6 assetsDataSourceManager];
      uint64_t v8 = [NSNumber numberWithInteger:i];
      [v3 setObject:v7 forKeyedSubscript:v8];

      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke;
      v39[3] = &unk_1E5DD1480;
      v39[4] = self;
      v39[5] = i;
      [v7 performChanges:v39];
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v9 = [(NSDictionary *)self->_dataSourceManagerByZoomLevel objectEnumerator];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v36;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v36 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v35 + 1) + 8 * v13++) unregisterChangeObserver:self context:PXZoomLevelDataSourceManagerObservationContext];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v11);
    }

    [(PXContentSyndicationConfigurationProvider *)self->_contentSyndicationConfigurationProvider unregisterChangeObserver:self context:PXContentSyndicationConfigurationObservationContext_290853];
    contentSyndicationConfigurationProvider = self->_contentSyndicationConfigurationProvider;
    self->_contentSyndicationConfigurationProvider = 0;

    uint64_t v15 = (NSDictionary *)[v3 copy];
    dataSourceManagerByZoomLevel = self->_dataSourceManagerByZoomLevel;
    self->_dataSourceManagerByZoomLevel = v15;

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke_2;
    v34[3] = &__block_descriptor_40_e46_v24__0q8__PXPhotoKitAssetsDataSourceManager_16l;
    v34[4] = v27;
    [(PXCuratedLibraryAssetsDataSourceManager *)self _enumeratePhotoKitDataDataSourceManagers:v34];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v17 = [(NSDictionary *)self->_dataSourceManagerByZoomLevel objectEnumerator];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * v21++) registerChangeObserver:self context:PXZoomLevelDataSourceManagerObservationContext];
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v40 count:16];
      }
      while (v19);
    }

    v22 = [(PXCuratedLibraryAssetsDataSourceManagerConfiguration *)self->_configuration photoLibrary];
    v23 = +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:v22];
    v24 = self->_contentSyndicationConfigurationProvider;
    self->_contentSyndicationConfigurationProvider = v23;

    [(PXContentSyndicationConfigurationProvider *)self->_contentSyndicationConfigurationProvider registerChangeObserver:self context:PXContentSyndicationConfigurationObservationContext_290853];
    v25 = +[PXPreloadScheduler sharedScheduler];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke_3;
    v28[3] = &unk_1E5DD32A8;
    v28[4] = self;
    id v29 = v3;
    id v26 = v3;
    [v25 scheduleTaskAfterCATransactionCommits:v28];

    [(PXCuratedLibraryAssetsDataSourceManager *)self _invalidateDataSource];
  }
}

- (PXCuratedLibraryAssetsDataSourceManagerConfiguration)configuration
{
  return self->_configuration;
}

uint64_t __72__PXCuratedLibraryAssetsDataSourceManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateDataSource];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 signalChange:4];
}

- (PXPhotoKitAssetsDataSourceManager)currentPhotoKitAssetsDataSourceManager
{
  dataSourceManagerByZoomLevel = self->_dataSourceManagerByZoomLevel;
  id v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[PXCuratedLibraryAssetsDataSourceManager zoomLevelForCurrentDataSourceManager](self, "zoomLevelForCurrentDataSourceManager"));
  uint64_t v4 = [(NSDictionary *)dataSourceManagerByZoomLevel objectForKeyedSubscript:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (void)_updateDataSource
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  if ([(PXCuratedLibraryAssetsDataSourceManager *)self canLoadData])
  {
    uint64_t v4 = [(PXCuratedLibraryAssetsDataSourceManager *)self zoomLevelForCurrentDataSourceManager];
    uint64_t v5 = [(PXCuratedLibraryAssetsDataSourceManager *)self currentDataSourceZoomLevel];
    [(PXCuratedLibraryAssetsDataSourceManager *)self setCurrentDataSourceZoomLevel:v4];
    if (v4 == 4 && (v5 | 4) != 4)
    {
      BOOL isForcingSections = self->_isForcingSections;
      self->_BOOL isForcingSections = 1;
      if ([(PXCuratedLibraryAssetsDataSourceManager *)self forceAllPhotosAccurateIfNeeded])
      {
        [(PXCuratedLibraryAssetsDataSourceManager *)self signalChange:4];
      }
      self->_BOOL isForcingSections = isForcingSections;
    }
    dataSourceManagerByZoomLevel = self->_dataSourceManagerByZoomLevel;
    uint64_t v8 = [NSNumber numberWithInteger:v4];
    v9 = [(NSDictionary *)dataSourceManagerByZoomLevel objectForKeyedSubscript:v8];

    if (!v9)
    {
      v52 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryAssetsDataSourceManager.m", 557, @"missing data source manager for zoom level %li", v4);
    }
    id v10 = [(PXCuratedLibraryAssetsDataSourceManager *)self currentDataSource];
    uint64_t v11 = [v9 dataSource];
    [(PXCuratedLibraryAssetsDataSourceManager *)self setCurrentDataSource:v11];
    id v12 = v11;
    if (v10 == v12)
    {

      id v13 = v10;
    }
    else
    {
      id v13 = v12;
      char v14 = [v10 isEqual:v12];

      if ((v14 & 1) == 0)
      {
        if (v5 == v4)
        {
          uint64_t v15 = [v9 changeHistory];
          id v16 = objc_msgSend(v15, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v10, "identifier"), objc_msgSend(v13, "identifier"));

          uint64_t v17 = 0;
          uint64_t v18 = 0;
LABEL_131:
          v92[0] = MEMORY[0x1E4F143A8];
          v92[1] = 3221225472;
          v92[2] = __60__PXCuratedLibraryAssetsDataSourceManager__updateDataSource__block_invoke_5;
          v92[3] = &unk_1E5DD1580;
          v92[4] = self;
          id v93 = v16;
          id v94 = v18;
          uint64_t v97 = v17;
          id v95 = v10;
          id v13 = v13;
          id v96 = v13;
          id v68 = v16;
          id v69 = v18;
          [(PXCuratedLibraryAssetsDataSourceManager *)self performChanges:v92];

          goto LABEL_132;
        }
        uint64_t v17 = 0;
        if (v4 == 4 || v5 == 4)
        {
          uint64_t v18 = 0;
          id v16 = 0;
          goto LABEL_131;
        }
        v88 = [(PXCuratedLibraryAssetsDataSourceManager *)self delegate];
        if (self->_delegateRespondsTo.willTransitionFromZoomLevelToZoomLevel) {
          [v88 curatedLibraryAssetsDataSourceManager:self willTransitionFromZoomLevel:v5 toZoomLevel:v4];
        }
        if (!self->_delegateRespondsTo.dominantAssetCollectionReferenceForZoomLevel
          || ([v88 curatedLibraryAssetsDataSourceManager:self dominantAssetCollectionReferenceForZoomLevel:v5], (v85 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          uint64_t v86 = 0;
          uint64_t v18 = 0;
          id v16 = 0;
LABEL_128:
          if (self->_delegateRespondsTo.didTransitionFromZoomLevelToZoomLevel) {
            [v88 curatedLibraryAssetsDataSourceManager:self didTransitionFromZoomLevel:v5 toZoomLevel:v4];
          }

          uint64_t v17 = v86;
          goto LABEL_131;
        }
        if (!self->_delegateRespondsTo.dominantAssetCollectionReferenceForZoomLevel
          || ([v88 curatedLibraryAssetsDataSourceManager:self dominantAssetCollectionReferenceForZoomLevel:v4], (oslog = objc_claimAutoreleasedReturnValue()) == 0))
        {
          uint64_t v19 = [(PXCuratedLibraryAssetsDataSourceManager *)self configuration];
          oslog = [v19 keyAssetCollectionReferenceInDataSource:v13 zoomLevel:v4 matchingAssetCollectionReference:v85 fromDataSource:v10 zoomLevel:v5];

          if (!oslog)
          {
            oslog = PLCuratedLibraryGetLog();
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v85;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v4;
              _os_log_impl(&dword_1A9AE7000, oslog, OS_LOG_TYPE_DEFAULT, "Couldn't find a match for %@ in zoom level %li. Transitions might not work as expected.", buf, 0x16u);
            }
            uint64_t v86 = 0;
            uint64_t v18 = 0;
            id v16 = 0;
            goto LABEL_127;
          }
        }
        memset(buf, 0, 32);
        if (v10) {
          [v10 indexPathForAssetCollectionReference:v85];
        }
        long long v114 = 0u;
        long long v115 = 0u;
        if (v13)
        {
          [v13 indexPathForAssetCollectionReference:oslog];
          uint64_t v20 = v114;
        }
        else
        {
          uint64_t v20 = 0;
        }
        uint64_t v86 = 0;
        if (*(void *)buf == *(void *)off_1E5DAAED8
          || (uint64_t v81 = *(void *)off_1E5DAAED8, v20 == *(void *)off_1E5DAAED8))
        {
          id v16 = 0;
          uint64_t v18 = 0;
LABEL_127:

          goto LABEL_128;
        }
        uint64_t v79 = [v10 numberOfSections];
        uint64_t v82 = [v13 numberOfSections];
        uint64_t v89 = *((void *)&v114 + 1);
        uint64_t v90 = *(void *)&buf[8];
        if (!self->_delegateRespondsTo.transitionTypeFromZoomLevelToZoomLevel
          || (uint64_t v86 = [v88 curatedLibraryAssetsDataSourceManager:self transitionTypeFromZoomLevel:v5 toZoomLevel:v4]) == 0)
        {
          PXAssertGetLog();
        }
        BOOL v21 = self->_isForcingSections;
        self->_BOOL isForcingSections = 1;
        if (v5) {
          uint64_t v22 = 5;
        }
        else {
          uint64_t v22 = 0;
        }
        *(void *)v117 = 0;
        v118 = v117;
        uint64_t v119 = 0x2020000000;
        char v120 = 0;
        v113[0] = MEMORY[0x1E4F143A8];
        v113[1] = 3221225472;
        v113[2] = __60__PXCuratedLibraryAssetsDataSourceManager__updateDataSource__block_invoke;
        v113[3] = &unk_1E5DD13B8;
        v113[4] = v117;
        v113[5] = v89;
        v113[6] = v22;
        [v9 performChanges:v113];
        if (v118[24])
        {
          v87 = [v9 dataSource];

          [(PXCuratedLibraryAssetsDataSourceManager *)self setCurrentDataSource:v87];
          if ([v87 numberOfSections] != v82)
          {
            v23 = [MEMORY[0x1E4F28B00] currentHandler];
            objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryAssetsDataSourceManager.m", 616, @"Faulting in section:%ld +- %ld should not change the number of sections:%ld != %ld", v89, v22, v82, objc_msgSend(v87, "numberOfSections"));
          }
        }
        else
        {
          v87 = v13;
        }
        self->_BOOL isForcingSections = v21;
        v74 = __60__PXCuratedLibraryAssetsDataSourceManager__updateDataSource__block_invoke_2(v10, v5, v90);
        v73 = __60__PXCuratedLibraryAssetsDataSourceManager__updateDataSource__block_invoke_2(v87, v4, v89);
        if (v5 >= v4) {
          uint64_t v24 = v4;
        }
        else {
          uint64_t v24 = v5;
        }
        if (v5 <= v4) {
          uint64_t v25 = v4;
        }
        else {
          uint64_t v25 = v5;
        }
        if (v24 != 2 || v25 != 3)
        {
          if (v5 == 1 && v4 == 2)
          {
            uint64_t v36 = 1;
          }
          else
          {
            uint64_t v38 = v5 == 2 && v4 == 1;
            uint64_t v36 = v38 << 63 >> 63;
          }
          goto LABEL_103;
        }
        if (v5 == 2) {
          id v26 = v85;
        }
        else {
          id v26 = oslog;
        }
        if (v5 == 2) {
          int64_t v27 = oslog;
        }
        else {
          int64_t v27 = v85;
        }
        v28 = v26;
        id v29 = v27;
        long long v30 = [v28 assetCollection];
        v75 = v29;
        long long v31 = [v29 keyAssetReference];
        long long v32 = [v31 asset];
        v77 = [v32 creationDate];

        if (PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v30, 2))
        {
          if (v5 != 2 || *(void *)&buf[8] + 1 >= v79) {
            goto LABEL_76;
          }
          v111[0] = *(void *)buf;
          v111[1] = *(void *)&buf[8] + 1;
          int64x2_t v112 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
          long long v33 = [v10 assetCollectionAtSectionIndexPath:v111];
          v34 = [oslog assetCollection];
          char v35 = [v33 isEqual:v34];
        }
        else
        {
          v39 = [v30 startDate];
          v40 = [v30 endDate];
          char v35 = objc_msgSend(v77, "px_isBetweenDate:andDate:", v39, v40);
        }
        if ((v35 & 1) == 0)
        {
          v41 = [v30 startDate];
          [v77 timeIntervalSinceDate:v41];
          double v43 = v42;
          BOOL v44 = v42 >= 0.0;

          if (v5 == 2)
          {
            int v45 = [v74 containsIndex:v90];
            uint64_t v46 = -1;
            if (v43 >= 0.0) {
              uint64_t v46 = 1;
            }
            if (!v45) {
              uint64_t v46 = 0;
            }
            uint64_t v47 = v46 + v90;
            if (v86 == 1)
            {
              if (v45) {
                BOOL v53 = v43 < 0.0;
              }
              else {
                BOOL v53 = v44;
              }
              uint64_t v48 = +[PXVisualPositionsChangeDetails changeDetailsWithCountBeforeChanges:v79 anchorInserted:v53 indexBeforeChanges:v47 headerIndexesBeforeChanges:v74 countAfterChanges:v82 anchorIndexAfterChanges:v89 headerIndexesAfterChanges:v73];
            }
            else
            {
              uint64_t v18 = 0;
              if (v86 != 2) {
                goto LABEL_101;
              }
              LOBYTE(v70) = 1;
              uint64_t v48 = +[PXVisualPositionsChangeDetails changeDetailsWithCountBeforeChanges:v79 anchorIndexBeforeChanges:v47 headerIndexesBeforeChanges:v74 countAfterChanges:v82 anchorIndexAfterChanges:v89 headerIndexesAfterChanges:v73 reloadAllIncludingAnchor:v70];
            }
          }
          else
          {
            int v49 = [v73 containsIndex:v89];
            uint64_t v50 = -1;
            if (v43 >= 0.0) {
              uint64_t v50 = 1;
            }
            if (!v49) {
              uint64_t v50 = 0;
            }
            uint64_t v51 = v50 + v89;
            if (v86 == 1)
            {
              if (v49) {
                BOOL v54 = v43 < 0.0;
              }
              else {
                BOOL v54 = v44;
              }
              uint64_t v48 = +[PXVisualPositionsChangeDetails changeDetailsWithCountBeforeChanges:v79 anchorIndexBeforeChanges:v90 headerIndexesBeforeChanges:v74 countAfterChanges:v82 anchorRemoved:v54 indexAfterChanges:v51 headerIndexesAfterChanges:v73];
            }
            else
            {
              uint64_t v18 = 0;
              if (v86 != 2) {
                goto LABEL_101;
              }
              LOBYTE(v70) = 1;
              uint64_t v48 = +[PXVisualPositionsChangeDetails changeDetailsWithCountBeforeChanges:v79 anchorIndexBeforeChanges:v90 headerIndexesBeforeChanges:v74 countAfterChanges:v82 anchorIndexAfterChanges:v51 headerIndexesAfterChanges:v73 reloadAllIncludingAnchor:v70];
            }
          }
          uint64_t v18 = (void *)v48;
          goto LABEL_101;
        }
LABEL_76:
        uint64_t v18 = 0;
LABEL_101:

        if (v18) {
          goto LABEL_109;
        }
        uint64_t v36 = 0;
LABEL_103:
        if (v86 == 1)
        {
          uint64_t v55 = +[PXVisualPositionsChangeDetails changeDetailsWithCountBeforeChanges:v79 anchorIndexBeforeChanges:v90 headerIndexesBeforeChanges:v74 countAfterChanges:v82 anchorIndexAfterChanges:v89 headerIndexesAfterChanges:v73 anchorFan:v36 anchorReload:0];
        }
        else
        {
          if (v86 != 2)
          {
            uint64_t v18 = 0;
LABEL_109:
            v91 = [v18 arrayChangeDetailsWithItemsChanged:1];
            id v56 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            v57 = [off_1E5DA5568 changeDetailsWithNoIncrementalChanges];
            v58 = [v91 changedIndexes];
            v108[0] = MEMORY[0x1E4F143A8];
            v108[1] = 3221225472;
            v108[2] = __60__PXCuratedLibraryAssetsDataSourceManager__updateDataSource__block_invoke_4;
            v108[3] = &unk_1E5DD1558;
            id v76 = v56;
            id v109 = v76;
            id v72 = v57;
            id v110 = v72;
            [v58 enumerateIndexesUsingBlock:v108];

            uint64_t v59 = -1;
            int64x2_t v83 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
            do
            {
              uint64_t v60 = v89 + v59;
              uint64_t v61 = [v91 indexAfterRevertingChangesFromIndex:v89 + v59];
              if ((unint64_t)v61 <= 0x7FFFFFFFFFFFFFFELL)
              {
                uint64_t v62 = [v10 numberOfSections];
                if ((v60 & 0x8000000000000000) == 0 && v61 < v62 && v60 < [v87 numberOfSections])
                {
                  long long v106 = 0u;
                  long long v107 = 0u;
                  v104[0] = [v10 identifier];
                  v104[1] = v61;
                  int64x2_t v105 = v83;
                  if (v10)
                  {
                    [v10 keyAssetIndexPathForSectionIndexPath:v104];
                  }
                  else
                  {
                    long long v106 = 0u;
                    long long v107 = 0u;
                  }
                  long long v102 = 0u;
                  long long v103 = 0u;
                  v100[0] = [v87 identifier];
                  v100[1] = v89 + v59;
                  int64x2_t v101 = v83;
                  if (v87)
                  {
                    [v87 keyAssetIndexPathForSectionIndexPath:v100];
                    uint64_t v63 = v102;
                  }
                  else
                  {
                    uint64_t v63 = 0;
                    long long v102 = 0u;
                    long long v103 = 0u;
                  }
                  if ((void)v106 != v81 && v63 != v81)
                  {
                    long long v98 = v106;
                    long long v99 = v107;
                    v80 = [v10 assetAtItemIndexPath:&v98];
                    long long v98 = v102;
                    long long v99 = v103;
                    v78 = [v87 assetAtItemIndexPath:&v98];
                    if ([v80 isEqual:v78])
                    {
                      uint64_t v71 = v107;
                      uint64_t v64 = [v10 numberOfItemsInSection:*((void *)&v106 + 1)];
                      v65 = objc_msgSend(off_1E5DA5568, "changeDetailsWithOldKeyItemIndex:oldCount:newKeyItemIndex:newCount:", v71, v64, (void)v103, objc_msgSend(v87, "numberOfItemsInSection:", *((void *)&v102 + 1)));
                      v66 = [NSNumber numberWithInteger:v60];
                      [v76 setObject:v65 forKeyedSubscript:v66];
                    }
                  }
                }
              }
              ++v59;
            }
            while (v59 != 2);
            v67 = objc_msgSend(objc_alloc((Class)off_1E5DA8488), "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", objc_msgSend(v10, "identifier"), objc_msgSend(v87, "identifier"), v91, v76, 0);
            v116 = v67;
            id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];

            _Block_object_dispose(v117, 8);
            id v13 = v87;
            goto LABEL_127;
          }
          LOBYTE(v70) = 0;
          uint64_t v55 = +[PXVisualPositionsChangeDetails changeDetailsWithCountBeforeChanges:v79 anchorIndexBeforeChanges:v90 headerIndexesBeforeChanges:v74 countAfterChanges:v82 anchorIndexAfterChanges:v89 headerIndexesAfterChanges:v73 reloadAllIncludingAnchor:v70];
        }
        uint64_t v18 = (void *)v55;
        goto LABEL_109;
      }
    }
LABEL_132:
  }
}

- (int64_t)zoomLevelForCurrentDataSourceManager
{
  return self->_zoomLevelForCurrentDataSourceManager;
}

- (PXAssetsDataSource)currentDataSource
{
  return self->_currentDataSource;
}

- (id)dataSourceManagerForZoomLevel:(int64_t)a3
{
  dataSourceManagerByZoomLevel = self->_dataSourceManagerByZoomLevel;
  id v7 = objc_msgSend(NSNumber, "numberWithInteger:");
  uint64_t v8 = [(NSDictionary *)dataSourceManagerByZoomLevel objectForKeyedSubscript:v7];

  if (!v8)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryAssetsDataSourceManager.m", 233, @"missing data source manager for zoom level %li", a3);
  }
  return v8;
}

- (BOOL)canLoadData
{
  return self->_canLoadData;
}

- (BOOL)enableDays
{
  return self->_enableDays;
}

- (void)setCurrentDataSourceZoomLevel:(int64_t)a3
{
  self->_currentDataSourceZoomLevel = a3;
}

- (void)setCurrentDataSource:(id)a3
{
}

- (int64_t)currentDataSourceZoomLevel
{
  return self->_currentDataSourceZoomLevel;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->isSelectingAssets = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->visibleAssetCollections = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->willTransitionFromZoomLevelToZoomLevel = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->didTransitionFromZoomLevelToZoomLevel = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->dominantAssetCollectionReferenceForZoomLevel = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->transitionTypeFromZoomLevelToZoomLevel = objc_opt_respondsToSelector() & 1;
  }
}

- (PXCuratedLibraryAssetsDataSourceManager)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXCuratedLibraryAssetsDataSourceManager;
  v6 = [(PXSectionedDataSourceManager *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v7->_enableDays = [v5 enableDays];
    v7->_libraryFilter = 0;
    uint64_t v8 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v7 needsUpdateSelector:sel_setNeedsUpdate];
    updater = v7->_updater;
    v7->_updater = (PXUpdater *)v8;

    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updateDataSourceManagers];
    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updateDataSourceProperties];
    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updatePropertiesDerivedFromZoomLevel];
    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updateCuration];
    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updateDataSource];
  }

  return v7;
}

- (id)createInitialDataSource
{
  return (id)[off_1E5DA5630 emptyDataSource];
}

- (void)setWantsCuration:(BOOL)a3
{
  if (self->_wantsCuration != a3)
  {
    self->_wantsCuration = a3;
    [(PXCuratedLibraryAssetsDataSourceManager *)self _invalidateCuration];
    [(PXCuratedLibraryAssetsDataSourceManager *)self _invalidateDataSource];
  }
}

- (void)_invalidateCuration
{
  id v2 = [(PXCuratedLibraryAssetsDataSourceManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCuration];
}

uint64_t __55__PXCuratedLibraryAssetsDataSourceManager_loadIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCanLoadData:1];
  id v2 = *(void **)(a1 + 32);
  return [v2 _invalidatePropertiesDerivedFromZoomLevel];
}

- (void)setCanLoadData:(BOOL)a3
{
  if (self->_canLoadData != a3)
  {
    self->_canLoadData = a3;
    [(PXCuratedLibraryAssetsDataSourceManager *)self _invalidateDataSourceManagers];
    [(PXCuratedLibraryAssetsDataSourceManager *)self signalChange:8];
  }
}

- (void)_invalidateDataSourceManagers
{
  id v2 = [(PXCuratedLibraryAssetsDataSourceManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDataSourceManagers];
}

- (void)_updatePropertiesDerivedFromZoomLevel
{
  [(PXCuratedLibraryAssetsDataSourceManager *)self setZoomLevelForCurrentDataSourceManager:[(PXCuratedLibraryAssetsDataSourceManager *)self zoomLevel]];
  [(PXCuratedLibraryAssetsDataSourceManager *)self setWantsCuration:1];
}

uint64_t __68__PXCuratedLibraryAssetsDataSourceManager__updateDataSourceManagers__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) zoomLevel];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = [NSNumber numberWithInteger:v2];
  id v5 = [v3 objectForKeyedSubscript:v4];
  [v5 performChanges:&__block_literal_global_290885];

  v6 = *(void **)(a1 + 40);
  return [v6 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_243];
}

- (int64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setZoomLevelForCurrentDataSourceManager:(int64_t)a3
{
  if (self->_zoomLevelForCurrentDataSourceManager != a3)
  {
    self->_zoomLevelForCurrentDataSourceManager = a3;
    [(PXCuratedLibraryAssetsDataSourceManager *)self _invalidateDataSource];
  }
}

- (void)_invalidatePropertiesDerivedFromZoomLevel
{
  id v2 = [(PXCuratedLibraryAssetsDataSourceManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePropertiesDerivedFromZoomLevel];
}

- (void)setZoomLevel:(int64_t)a3
{
  if (self->_zoomLevel != a3)
  {
    self->_zoomLevel = a3;
    [(PXCuratedLibraryAssetsDataSourceManager *)self signalChange:2];
    [(PXCuratedLibraryAssetsDataSourceManager *)self _invalidatePropertiesDerivedFromZoomLevel];
  }
}

- (void)setLibraryFilter:(int64_t)a3
{
  if (self->_libraryFilter != a3)
  {
    self->_libraryFilter = a3;
    [(PXCuratedLibraryAssetsDataSourceManager *)self _invalidateDataSourceProperties];
  }
}

- (void)setCanIncludeUnsavedSyndicatedAssets:(BOOL)a3
{
  if (self->_canIncludeUnsavedSyndicatedAssets != a3)
  {
    self->_canIncludeUnsavedSyndicatedAssets = a3;
    id v8 = [(PXCuratedLibraryAssetsDataSourceManager *)self _photosDataSourceForZoomLevel:4];
    [v8 setCanIncludeUnsavedSyndicatedAssets:self->_canIncludeUnsavedSyndicatedAssets];
    uint64_t v4 = +[PXContentSyndicationSettings sharedInstance];
    int v5 = [v4 enableFilteringCuratedGridsForContentSyndication];

    if (v5)
    {
      for (uint64_t i = 1; i != 4; ++i)
      {
        id v7 = [(PXCuratedLibraryAssetsDataSourceManager *)self _photosDataSourceForZoomLevel:i];
        [v7 setCanIncludeUnsavedSyndicatedAssets:self->_canIncludeUnsavedSyndicatedAssets];
      }
    }
    [(PXCuratedLibraryAssetsDataSourceManager *)self signalChange:64];
  }
}

- (void)setAllPhotosSortDescriptors:(id)a3
{
  id v8 = (NSArray *)a3;
  uint64_t v4 = self->_allPhotosSortDescriptors;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)[(NSArray *)v8 copy];
      allPhotosSortDescriptors = self->_allPhotosSortDescriptors;
      self->_allPhotosSortDescriptors = v6;

      [(PXCuratedLibraryAssetsDataSourceManager *)self _invalidateDataSourceProperties];
      [(PXCuratedLibraryAssetsDataSourceManager *)self signalChange:32];
    }
  }
}

- (void)setAllPhotosFilterPredicate:(id)a3
{
  id v8 = (NSPredicate *)a3;
  uint64_t v4 = self->_allPhotosFilterPredicate;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSPredicate *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      v6 = (NSPredicate *)[(NSPredicate *)v8 copy];
      allPhotosFilterPredicate = self->_allPhotosFilterPredicate;
      self->_allPhotosFilterPredicate = v6;

      [(PXCuratedLibraryAssetsDataSourceManager *)self _invalidateDataSourceProperties];
      [(PXCuratedLibraryAssetsDataSourceManager *)self signalChange:16];
    }
  }
}

- (void)loadIfNeeded
{
  if (![(PXCuratedLibraryAssetsDataSourceManager *)self canLoadData])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __55__PXCuratedLibraryAssetsDataSourceManager_loadIfNeeded__block_invoke;
    v3[3] = &unk_1E5DD1390;
    v3[4] = self;
    [(PXCuratedLibraryAssetsDataSourceManager *)self performChanges:v3];
  }
}

- (void)_invalidateDataSourceProperties
{
  id v2 = [(PXCuratedLibraryAssetsDataSourceManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDataSourceProperties];
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryAssetsDataSourceManager;
  [(PXCuratedLibraryAssetsDataSourceManager *)&v4 didPerformChanges];
  id v3 = [(PXCuratedLibraryAssetsDataSourceManager *)self updater];
  [v3 updateIfNeeded];
}

- (void)_invalidateDataSource
{
  id v2 = [(PXCuratedLibraryAssetsDataSourceManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDataSource];
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (id)dataSourceForZoomLevel:(int64_t)a3
{
  id v3 = [(PXCuratedLibraryAssetsDataSourceManager *)self dataSourceManagerForZoomLevel:a3];
  objc_super v4 = [v3 dataSource];

  return v4;
}

- (void)_updateCuration
{
  p_delegateRespondsTo = &self->_delegateRespondsTo;
  if (self->_delegateRespondsTo.isSelectingAssets
    && ([(PXCuratedLibraryAssetsDataSourceManager *)self delegate],
        objc_super v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isSelectingAssetsFromCuratedLibraryAssetsDataSourceManager:self],
        v4,
        (v5 & 1) != 0)
    || !p_delegateRespondsTo->visibleAssetCollections)
  {
    id v8 = 0;
  }
  else
  {
    v6 = [(PXCuratedLibraryAssetsDataSourceManager *)self delegate];
    id v8 = [v6 visibleAssetCollectionsFromCuratedLibraryAssetsDataSourceManager:self];
  }
  id v7 = [(PXCuratedLibraryAssetsDataSourceManager *)self _photosDataSourceForZoomLevel:3];
  objc_msgSend(v7, "setWantsCurationForAllCollections:collectionsToDiff:", -[PXCuratedLibraryAssetsDataSourceManager wantsCuration](self, "wantsCuration"), v8);
}

- (PXCuratedLibraryAssetsDataSourceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXCuratedLibraryAssetsDataSourceManagerDelegate *)WeakRetained;
}

- (BOOL)wantsCuration
{
  return self->_wantsCuration;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXZoomLevelDataSourceManagerObservationContext == a5)
  {
    if ((v6 & 1) != 0 && !self->_isForcingSections)
    {
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      uint64_t v19 = __72__PXCuratedLibraryAssetsDataSourceManager_observable_didChange_context___block_invoke;
      uint64_t v20 = &unk_1E5DD1390;
      BOOL v21 = self;
      id v10 = &v17;
      goto LABEL_5;
    }
  }
  else
  {
    if ((void *)PXContentSyndicationConfigurationObservationContext_290853 != a5)
    {
      objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryAssetsDataSourceManager.m" lineNumber:816 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((v6 & 5) != 0)
    {
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      char v14 = __72__PXCuratedLibraryAssetsDataSourceManager_observable_didChange_context___block_invoke_2;
      uint64_t v15 = &unk_1E5DD1390;
      id v16 = self;
      id v10 = &v12;
LABEL_5:
      -[PXCuratedLibraryAssetsDataSourceManager performChanges:](self, "performChanges:", v10, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastVisualPositionsChangeDetails, 0);
  objc_storeStrong((id *)&self->_currentDataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_allPhotosSortDescriptors, 0);
  objc_storeStrong((id *)&self->_allPhotosFilterPredicate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentSyndicationConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_dataSourceManagerByZoomLevel, 0);
}

- (int64_t)lastVisualPositionsChangeToDataSourceIdentifier
{
  return self->_lastVisualPositionsChangeToDataSourceIdentifier;
}

- (int64_t)lastVisualPositionsChangeFromDataSourceIdentifier
{
  return self->_lastVisualPositionsChangeFromDataSourceIdentifier;
}

- (int64_t)lastTransitionType
{
  return self->_lastTransitionType;
}

- (PXVisualPositionsChangeDetails)lastVisualPositionsChangeDetails
{
  return self->_lastVisualPositionsChangeDetails;
}

- (BOOL)canIncludeUnsavedSyndicatedAssets
{
  return self->_canIncludeUnsavedSyndicatedAssets;
}

- (NSArray)allPhotosSortDescriptors
{
  return self->_allPhotosSortDescriptors;
}

void __72__PXCuratedLibraryAssetsDataSourceManager_observable_didChange_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 192);
  id v3 = a2;
  objc_msgSend(v3, "setCanIncludeUnsavedSyndicatedAssets:", objc_msgSend(v2, "showUnsavedSyndicatedContentInPhotosGrids"));
}

uint64_t __60__PXCuratedLibraryAssetsDataSourceManager__updateDataSource__block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 forceAccurateSection:a1[5] andSectionsBeforeAndAfter:a1[6]];
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

id __60__PXCuratedLibraryAssetsDataSourceManager__updateDataSource__block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v7 = [v5 numberOfSections];
  uint64_t v8 = [v5 identifier];
  uint64_t v9 = a3 - 6;
  int64x2_t v13 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  do
  {
    if (v9 + 1 >= 0 && v9 + 1 < v7)
    {
      v14[0] = v8;
      v14[1] = v9 + 1;
      int64x2_t v15 = v13;
      id v10 = [v5 assetCollectionAtSectionIndexPath:v14];
      if (PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v10, a2)) {
        [v6 addIndex:v9 + 1];
      }
    }
    ++v9;
  }
  while (v9 < a3 + 5);
  objc_super v11 = (void *)[v6 copy];

  return v11;
}

void __60__PXCuratedLibraryAssetsDataSourceManager__updateDataSource__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [NSNumber numberWithUnsignedInteger:a2];
  [v3 setObject:v2 forKeyedSubscript:v4];
}

- (void)resumeChangeDelivery:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __64__PXCuratedLibraryAssetsDataSourceManager_resumeChangeDelivery___block_invoke;
    v5[3] = &unk_1E5DD30D8;
    v5[4] = self;
    [v4 enumerateKeysAndObjectsUsingBlock:v5];
  }
}

void __64__PXCuratedLibraryAssetsDataSourceManager_resumeChangeDelivery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = objc_msgSend(*(id *)(a1 + 32), "dataSourceManagerForZoomLevel:", objc_msgSend(a2, "integerValue"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__PXCuratedLibraryAssetsDataSourceManager_resumeChangeDelivery___block_invoke_2;
  v8[3] = &unk_1E5DD1458;
  id v9 = v5;
  id v7 = v5;
  [v6 performChanges:v8];
}

uint64_t __64__PXCuratedLibraryAssetsDataSourceManager_resumeChangeDelivery___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 resumeChangeDeliveryAndBackgroundLoading:*(void *)(a1 + 32)];
}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  dataSourceManagerByZoomLevel = self->_dataSourceManagerByZoomLevel;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __85__PXCuratedLibraryAssetsDataSourceManager_pauseChangeDeliveryWithTimeout_identifier___block_invoke;
  v14[3] = &unk_1E5DD1430;
  double v17 = a3;
  id v15 = v6;
  id v9 = v7;
  id v16 = v9;
  id v10 = v6;
  [(NSDictionary *)dataSourceManagerByZoomLevel enumerateKeysAndObjectsUsingBlock:v14];
  objc_super v11 = v16;
  id v12 = v9;

  return v12;
}

void __85__PXCuratedLibraryAssetsDataSourceManager_pauseChangeDeliveryWithTimeout_identifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__PXCuratedLibraryAssetsDataSourceManager_pauseChangeDeliveryWithTimeout_identifier___block_invoke_2;
  v7[3] = &unk_1E5DD1408;
  uint64_t v11 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  id v6 = v5;
  [a3 performChanges:v7];
}

void __85__PXCuratedLibraryAssetsDataSourceManager_pauseChangeDeliveryWithTimeout_identifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 pauseChangeDeliveryWithTimeout:*(void *)(a1 + 32) identifier:*(double *)(a1 + 56)];
  [*(id *)(a1 + 40) setObject:v3 forKeyedSubscript:*(void *)(a1 + 48)];
}

- (BOOL)forceAccurateSectionsIfNeeded:(id)a3 inZoomLevel:(int64_t)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v7 = [(PXCuratedLibraryAssetsDataSourceManager *)self dataSourceManagerForZoomLevel:a4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__PXCuratedLibraryAssetsDataSourceManager_forceAccurateSectionsIfNeeded_inZoomLevel___block_invoke;
  v10[3] = &unk_1E5DD13E0;
  id v12 = &v13;
  id v8 = v6;
  id v11 = v8;
  [v7 performChanges:v10];
  LOBYTE(self) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

uint64_t __85__PXCuratedLibraryAssetsDataSourceManager_forceAccurateSectionsIfNeeded_inZoomLevel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 forceAccurateSectionsIfNeeded:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)forceAccurateAllSectionsIfNeeded
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [(NSDictionary *)self->_dataSourceManagerByZoomLevel objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __75__PXCuratedLibraryAssetsDataSourceManager_forceAccurateAllSectionsIfNeeded__block_invoke;
        v9[3] = &unk_1E5DD1368;
        v9[4] = &v14;
        [v6 performChanges:v9];
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v18 count:16];
    }
    while (v3);
  }

  char v7 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __75__PXCuratedLibraryAssetsDataSourceManager_forceAccurateAllSectionsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 forceAccurateAllSectionsIfNeeded];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)forceAccurateSection:(int64_t)a3 andSectionsBeforeAndAfter:(int64_t)a4
{
  id v6 = [(PXCuratedLibraryAssetsDataSourceManager *)self currentAssetsDataSourceManager];
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__PXCuratedLibraryAssetsDataSourceManager_forceAccurateSection_andSectionsBeforeAndAfter___block_invoke;
  v8[3] = &unk_1E5DD13B8;
  void v8[4] = &v9;
  v8[5] = a3;
  v8[6] = a4;
  [v6 performChanges:v8];
  LOBYTE(a4) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return a4;
}

uint64_t __90__PXCuratedLibraryAssetsDataSourceManager_forceAccurateSection_andSectionsBeforeAndAfter___block_invoke(void *a1, void *a2)
{
  uint64_t result = [a2 forceAccurateSection:a1[5] andSectionsBeforeAndAfter:a1[6]];
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

- (BOOL)forceAccurateSectionsIfNeeded:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(PXCuratedLibraryAssetsDataSourceManager *)self forceAccurateSectionsIfNeeded:v4 inZoomLevel:[(PXCuratedLibraryAssetsDataSourceManager *)self currentDataSourceZoomLevel]];

  return (char)self;
}

- (void)setTransientKeyAsset:(id)a3 forAssetCollection:(id)a4 zoomLevel:(int64_t)a5
{
  id v11 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    long long v10 = [(PXCuratedLibraryAssetsDataSourceManager *)self _photosDataSourceForZoomLevel:a5];
    [v10 setKeyAsset:v11 forAssetCollection:v9];
  }
}

- (id)firstAssetCollectionReferenceInDataSourceForZoomLevel:(int64_t)a3 withParent:(id)a4
{
  id v4 = [(PXCuratedLibraryAssetsDataSourceManager *)self assetCollectionReferencesInDataSourceForZoomLevel:a3 withParentAssetCollectionReference:a4];
  id v5 = [v4 firstObject];

  return v5;
}

- (id)assetCollectionReferencesInDataSourceForZoomLevel:(int64_t)a3 withParentAssetCollectionReference:(id)a4 assetCollectionReferenceWithSameKeyAssetAsParent:(id *)a5
{
  id v8 = a4;
  id v9 = [(PXCuratedLibraryAssetsDataSourceManager *)self dataSourceForZoomLevel:a3];
  long long v10 = [v9 assetCollectionReferencesWithParentAssetCollectionReference:v8 assetCollectionReferenceWithSameKeyAssetAsParent:a5];

  return v10;
}

- (id)assetCollectionReferencesInDataSourceForZoomLevel:(int64_t)a3 withParentAssetCollectionReference:(id)a4
{
  id v6 = a4;
  char v7 = [(PXCuratedLibraryAssetsDataSourceManager *)self dataSourceForZoomLevel:a3];
  id v8 = [v7 assetCollectionReferencesWithParentAssetCollectionReference:v6];

  return v8;
}

- (BOOL)forceAllPhotosAccurateIfNeeded
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v2 = [(PXCuratedLibraryAssetsDataSourceManager *)self dataSourceManagerForZoomLevel:4];
  uint64_t v3 = [v2 dataSource];
  char v4 = [v3 areAllSectionsConsideredAccurate];

  if ((v4 & 1) == 0)
  {
    id v5 = PLCuratedLibraryGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Forcing all photos to be accurate.", buf, 2u);
    }

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__PXCuratedLibraryAssetsDataSourceManager_forceAllPhotosAccurateIfNeeded__block_invoke;
    v8[3] = &unk_1E5DD1368;
    void v8[4] = &v10;
    [v2 performChanges:v8];
  }
  char v6 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __73__PXCuratedLibraryAssetsDataSourceManager_forceAllPhotosAccurateIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 forceAccurateAllSectionsIfNeeded];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (PXAssetsDataSourceManager)currentAssetsDataSourceManager
{
  dataSourceManagerByZoomLevel = self->_dataSourceManagerByZoomLevel;
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[PXCuratedLibraryAssetsDataSourceManager zoomLevelForCurrentDataSourceManager](self, "zoomLevelForCurrentDataSourceManager"));
  char v4 = [(NSDictionary *)dataSourceManagerByZoomLevel objectForKeyedSubscript:v3];

  return (PXAssetsDataSourceManager *)v4;
}

- (int64_t)transitionTypeFromDataSourceIdentifier:(int64_t)a3 toDataSourceIdentifier:(int64_t)a4
{
  if ([(PXCuratedLibraryAssetsDataSourceManager *)self lastVisualPositionsChangeFromDataSourceIdentifier] != a3|| [(PXCuratedLibraryAssetsDataSourceManager *)self lastVisualPositionsChangeToDataSourceIdentifier] != a4)
  {
    return 0;
  }
  return [(PXCuratedLibraryAssetsDataSourceManager *)self lastTransitionType];
}

- (id)visualPositionsChangeDetailsFromDataSourceIdentifier:(int64_t)a3 toDataSourceIdentifier:(int64_t)a4
{
  if ([(PXCuratedLibraryAssetsDataSourceManager *)self lastVisualPositionsChangeFromDataSourceIdentifier] == a3&& [(PXCuratedLibraryAssetsDataSourceManager *)self lastVisualPositionsChangeToDataSourceIdentifier] == a4)
  {
    char v6 = [(PXCuratedLibraryAssetsDataSourceManager *)self lastVisualPositionsChangeDetails];
  }
  else
  {
    char v6 = 0;
  }
  return v6;
}

- (id)assetsInAssetCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(PXCuratedLibraryAssetsDataSourceManager *)self dataSourceManagerForZoomLevel:3];
  char v6 = [v5 dataSource];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = objc_alloc((Class)off_1E5DA55C0);
    long long v8 = *((_OWORD *)off_1E5DAB028 + 1);
    long long v13 = *(_OWORD *)off_1E5DAB028;
    long long v14 = v8;
    id v9 = (void *)[v7 initWithAssetCollection:v4 keyAssetReference:0 indexPath:&v13];
    long long v13 = 0u;
    long long v14 = 0u;
    [v6 indexPathForAssetCollectionReference:v9];
    uint64_t v10 = 0;
    if ((void)v13 != *(void *)off_1E5DAAED8)
    {
      v12[0] = v13;
      v12[1] = v14;
      uint64_t v10 = [v6 assetsInSectionIndexPath:v12];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)setCurationEnabled:(BOOL)a3 forAssetCollection:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(PXCuratedLibraryAssetsDataSourceManager *)self _photosDataSourceForZoomLevel:3];
  [v7 setWantsCuration:v4 forAssetCollection:v6];
}

- (PXCuratedLibraryAssetsDataSourceManager)init
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryAssetsDataSourceManager.m", 77, @"%s is not available as initializer", "-[PXCuratedLibraryAssetsDataSourceManager init]");

  abort();
}

@end
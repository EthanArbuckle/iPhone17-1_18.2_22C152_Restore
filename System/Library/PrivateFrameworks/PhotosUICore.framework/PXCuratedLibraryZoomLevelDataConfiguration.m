@interface PXCuratedLibraryZoomLevelDataConfiguration
- (BOOL)enableDays;
- (PHPhotoLibrary)photoLibrary;
- (PXAssetsDataSourceManager)assetsDataSourceManager;
- (PXCuratedLibraryZoomLevelDataConfiguration)init;
- (PXCuratedLibraryZoomLevelDataConfiguration)initWithZoomLevel:(int64_t)a3;
- (PXCuratedLibraryZoomLevelDataConfiguration)initWithZoomLevel:(int64_t)a3 assetsDataSourceManager:(id)a4;
- (PXCuratedLibraryZoomLevelDataConfiguration)initWithZoomLevel:(int64_t)a3 assetsDataSourceManager:(id)a4 enableDays:(BOOL)a5;
- (id)createInitialPhotosDataSourceForDataSourceManager:(id)a3;
- (int64_t)zoomLevel;
- (void)setEnableDays:(BOOL)a3;
- (void)setPhotoLibrary:(id)a3;
@end

@implementation PXCuratedLibraryZoomLevelDataConfiguration

void __96__PXCuratedLibraryZoomLevelDataConfiguration_createInitialPhotosDataSourceForDataSourceManager___block_invoke_2(uint64_t a1)
{
  v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, objc_msgSend(v2, "count"));
  [v2 prefetchObjectsAtIndexes:v3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __96__PXCuratedLibraryZoomLevelDataConfiguration_createInitialPhotosDataSourceForDataSourceManager___block_invoke_3;
  v5[3] = &unk_1E5DD32A8;
  id v6 = v2;
  id v7 = *(id *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

id __96__PXCuratedLibraryZoomLevelDataConfiguration_createInitialPhotosDataSourceForDataSourceManager___block_invoke_288(uint64_t a1)
{
  return PXCuratedLibraryFetchHighlights(*(void *)(a1 + 40), *(void **)(a1 + 32), *(void *)(a1 + 48));
}

- (id)createInitialPhotosDataSourceForDataSourceManager:(id)a3
{
  v80[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(PHPhotoLibrary *)self->_photoLibrary px_standardLibrarySpecificFetchOptions];
  [v6 setPhotoLibrary:self->_photoLibrary];
  v69 = v6;
  if ([(PXCuratedLibraryZoomLevelDataConfiguration *)self zoomLevel] == 4)
  {
    [v6 setIncludeAllPhotosSmartAlbum:1];
    id v7 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:2 subtype:1000000205 options:v6];
    v8 = +[PXZoomablePhotosSettings sharedInstance];
    uint64_t v9 = [v8 simulateMinimumPhotoCount];
    unint64_t v10 = 0x1E4F1C000;
    if (v9 > 0 || [v8 simulateEmptyLibrary])
    {
      v67 = v7;
      id v68 = v5;
      v11 = (void *)MEMORY[0x1E4F38EB8];
      v12 = [v7 firstObject];
      v13 = [v11 fetchAssetsInAssetCollection:v12 options:v6];

      v14 = [v13 fetchedObjectIDs];
      v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
      if (v9 >= 1)
      {
        for (unint64_t i = 0; i != v9; ++i)
        {
          v17 = objc_msgSend(v14, "objectAtIndexedSubscript:", i % objc_msgSend(v14, "count"));
          [v15 addObject:v17];
        }
      }
      id v18 = objc_alloc(MEMORY[0x1E4F39150]);
      v19 = (void *)[v18 initWithOids:v15 photoLibrary:self->_photoLibrary fetchType:*MEMORY[0x1E4F39648] fetchPropertySets:0 identifier:0 registerIfNeeded:1];
      v20 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v19 title:@"All Photos"];
      v21 = (void *)MEMORY[0x1E4F38EE8];
      v22 = (void *)MEMORY[0x1E4F39008];
      v80[0] = v20;
      unint64_t v10 = 0x1E4F1C000uLL;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:1];
      v24 = [v22 transientCollectionListWithCollections:v23 title:0];
      uint64_t v25 = [v21 fetchCollectionsInCollectionList:v24 options:v69];

      id v7 = (id)v25;
      id v5 = v68;
    }
    v26 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:v7 options:33921];
    v27 = [v5 filterPredicate];
    [(PXPhotosDataSourceConfiguration *)v26 setFilterPredicate:v27];

    -[PXPhotosDataSourceConfiguration setLibraryFilter:](v26, "setLibraryFilter:", [v5 libraryFilter]);
    [(PXPhotosDataSourceConfiguration *)v26 setLibraryFilterState:0];
    v28 = [v5 sortDescriptors];
    [(PXPhotosDataSourceConfiguration *)v26 setSortDescriptors:v28];

    uint64_t v79 = *MEMORY[0x1E4F39558];
    v29 = [*(id *)(v10 + 2424) arrayWithObjects:&v79 count:1];
    v30 = +[PXUserDefaults standardUserDefaults];
    v31 = [v30 allPhotosCaptionsVisible];
    int v32 = [v31 BOOLValue];

    if (v32)
    {
      uint64_t v33 = [v29 arrayByAddingObject:*MEMORY[0x1E4F39488]];

      v29 = (void *)v33;
    }
    [(PXPhotosDataSourceConfiguration *)v26 setFetchPropertySets:v29];
    v34 = +[PXContentSyndicationConfigurationProvider sharedInstance];
    -[PXPhotosDataSourceConfiguration setCanIncludeUnsavedSyndicatedAssets:](v26, "setCanIncludeUnsavedSyndicatedAssets:", [v34 showUnsavedSyndicatedContentInPhotosGrids]);

    v35 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v26];
    uint64_t v36 = [v8 maxPhotoCount];
    if (v36) {
      [(PXPhotosDataSource *)v35 setFetchLimit:v36];
    }
    if ([v8 onlyPhotosFromToday])
    {
      id v37 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v37 setDay:-1];
      v38 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      v39 = [MEMORY[0x1E4F1C9C8] date];
      v40 = [v38 dateByAddingComponents:v37 toDate:v39 options:0];

      v41 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dateCreated >= %@", v40];
      [(PXPhotosDataSource *)v35 setFilterPredicate:v41];
    }
    v42 = [(PXPhotosDataSource *)v35 assetsInSection:0];
    v43 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__PXCuratedLibraryZoomLevelDataConfiguration_createInitialPhotosDataSourceForDataSourceManager___block_invoke;
    block[3] = &unk_1E5DD36F8;
    id v78 = v42;
    id v44 = v42;
    dispatch_async(v43, block);
  }
  else
  {
    BOOL enableDays = self->_enableDays;
    switch([(PXCuratedLibraryZoomLevelDataConfiguration *)self zoomLevel])
    {
      case 0:
        v62 = [MEMORY[0x1E4F28B00] currentHandler];
        v63 = v62;
        SEL v64 = a2;
        v65 = self;
        uint64_t v66 = 259;
        goto LABEL_34;
      case 1:
        uint64_t v46 = -1;
        uint64_t v47 = 6641;
        goto LABEL_23;
      case 2:
        uint64_t v46 = -1;
        uint64_t v47 = 7153;
        goto LABEL_23;
      case 3:
        if (enableDays) {
          uint64_t v46 = -1;
        }
        else {
          uint64_t v46 = -49;
        }
        uint64_t v47 = 6385;
        goto LABEL_23;
      case 4:
        v62 = [MEMORY[0x1E4F28B00] currentHandler];
        v63 = v62;
        SEL v64 = a2;
        v65 = self;
        uint64_t v66 = 277;
LABEL_34:
        [v62 handleFailureInMethod:v64 object:v65 file:@"PXCuratedLibraryAssetsDataSourceManagerConfiguration.m" lineNumber:v66 description:@"Code which should be unreachable has been reached"];

        abort();
      default:
        uint64_t v46 = -1;
        uint64_t v47 = 6321;
LABEL_23:
        int64_t v48 = [(PXCuratedLibraryZoomLevelDataConfiguration *)self zoomLevel];
        v49 = [(PXCuratedLibraryZoomLevelDataConfiguration *)self photoLibrary];
        uint64_t v50 = [v5 libraryFilter];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __96__PXCuratedLibraryZoomLevelDataConfiguration_createInitialPhotosDataSourceForDataSourceManager___block_invoke_288;
        aBlock[3] = &unk_1E5DD0C30;
        int64_t v75 = v48;
        id v7 = v49;
        id v74 = v7;
        uint64_t v76 = v50;
        v51 = _Block_copy(aBlock);
        v52 = v51;
        if (enableDays)
        {
          v53 = (*((void (**)(void *))v51 + 2))(v51);
        }
        else
        {
          id v54 = objc_alloc(MEMORY[0x1E4F39150]);
          photoLibrary = self->_photoLibrary;
          v56 = [MEMORY[0x1E4F39238] fetchType];
          v53 = (void *)[v54 initWithOids:MEMORY[0x1E4F1CBF0] photoLibrary:photoLibrary fetchType:v56 fetchPropertySets:0 identifier:0 registerIfNeeded:0];
        }
        v57 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:v53 options:v46 & v47];
        v58 = [v5 filterPredicate];
        [(PXPhotosDataSourceConfiguration *)v57 setFilterPredicate:v58];

        -[PXPhotosDataSourceConfiguration setLibraryFilter:](v57, "setLibraryFilter:", [v5 libraryFilter]);
        [(PXPhotosDataSourceConfiguration *)v57 setLibraryFilterState:0];
        [(PXPhotosDataSourceConfiguration *)v57 setWantsCurationByDefault:1];
        v59 = +[PXContentSyndicationConfigurationProvider sharedInstance];
        -[PXPhotosDataSourceConfiguration setCanIncludeUnsavedSyndicatedAssets:](v57, "setCanIncludeUnsavedSyndicatedAssets:", [v59 showUnsavedSyndicatedContentInPhotosGrids]);

        v35 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v57];
        if (!enableDays)
        {
          v60 = +[PXPreloadScheduler sharedScheduler];
          v70[0] = MEMORY[0x1E4F143A8];
          v70[1] = 3221225472;
          v70[2] = __96__PXCuratedLibraryZoomLevelDataConfiguration_createInitialPhotosDataSourceForDataSourceManager___block_invoke_2;
          v70[3] = &unk_1E5DD3280;
          id v72 = v52;
          v71 = v35;
          [v60 scheduleTaskWithQoS:0 block:v70];
        }
        v8 = v74;
        break;
    }
  }

  return v35;
}

- (int64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PXCuratedLibraryZoomLevelDataConfiguration)initWithZoomLevel:(int64_t)a3 assetsDataSourceManager:(id)a4 enableDays:(BOOL)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXCuratedLibraryZoomLevelDataConfiguration;
  unint64_t v10 = [(PXCuratedLibraryZoomLevelDataConfiguration *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_zoomLevel = a3;
    objc_storeStrong((id *)&v10->_assetsDataSourceManager, a4);
    v11->_BOOL enableDays = a5;
  }

  return v11;
}

- (PXAssetsDataSourceManager)assetsDataSourceManager
{
  v3 = self->_assetsDataSourceManager;
  if (!v3) {
    v3 = [[PXPhotoKitAssetsDataSourceManager alloc] initWithPhotosDataSourceProvider:self];
  }
  return (PXAssetsDataSourceManager *)v3;
}

void __96__PXCuratedLibraryZoomLevelDataConfiguration_createInitialPhotosDataSourceForDataSourceManager___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = PLCuratedLibraryGetLog();
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
  id v4 = v2;
  id v5 = v4;
  if (v3 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    [*(id *)(a1 + 40) setCollectionListFetchResult:*(void *)(a1 + 32)];
    v8 = v5;
  }
  else
  {
    if (os_signpost_enabled(v4))
    {
      uint64_t v6 = [*(id *)(a1 + 32) count];
      int v9 = 134217984;
      uint64_t v10 = v6;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CuratedLibrary.setCollectionListFetchResult", "count: %lu", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 40) setCollectionListFetchResult:*(void *)(a1 + 32)];
    id v7 = v5;
    if (os_signpost_enabled(v7))
    {
      LOWORD(v9) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_END, v3, "CuratedLibrary.setCollectionListFetchResult", "", (uint8_t *)&v9, 2u);
    }
  }
}

void __96__PXCuratedLibraryZoomLevelDataConfiguration_createInitialPhotosDataSourceForDataSourceManager___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    v2 = PLCuratedLibraryGetLog();
    os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
    id v4 = v2;
    id v5 = v4;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CuratedLibrary.PrefetchAssets", "", buf, 2u);
    }

    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 32), "count") - 1);
    [*(id *)(a1 + 32) prefetchObjectsAtIndexes:v6];
    [*(id *)(a1 + 32) prefetchThumbnailAssetsAtIndexes:v6];
    id v7 = v5;
    v8 = v7;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)int v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_END, v3, "CuratedLibrary.PrefetchAssets", "", v9, 2u);
    }
  }
}

- (void)setEnableDays:(BOOL)a3
{
  self->_BOOL enableDays = a3;
}

- (BOOL)enableDays
{
  return self->_enableDays;
}

- (PXCuratedLibraryZoomLevelDataConfiguration)initWithZoomLevel:(int64_t)a3
{
  return [(PXCuratedLibraryZoomLevelDataConfiguration *)self initWithZoomLevel:a3 assetsDataSourceManager:0];
}

- (PXCuratedLibraryZoomLevelDataConfiguration)initWithZoomLevel:(int64_t)a3 assetsDataSourceManager:(id)a4
{
  return [(PXCuratedLibraryZoomLevelDataConfiguration *)self initWithZoomLevel:a3 assetsDataSourceManager:a4 enableDays:1];
}

- (PXCuratedLibraryZoomLevelDataConfiguration)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryAssetsDataSourceManagerConfiguration.m", 149, @"%s is not available as initializer", "-[PXCuratedLibraryZoomLevelDataConfiguration init]");

  abort();
}

@end
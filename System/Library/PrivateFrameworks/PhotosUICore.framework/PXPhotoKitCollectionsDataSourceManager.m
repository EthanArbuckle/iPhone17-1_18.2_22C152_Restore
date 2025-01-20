@interface PXPhotoKitCollectionsDataSourceManager
+ (OS_dispatch_queue)sharedKeyAssetsFetchQueue;
+ (OS_dispatch_queue)sharedSubCollectionsFetchQueue;
+ (id)standardDataSourceManagerForCollectionList:(id)a3;
- (BOOL)_containsAnyAlbumsWithAssets:(id)a3;
- (BOOL)_containsAnyAssets:(id)a3;
- (BOOL)_isEmpty;
- (BOOL)_isImportsAssetCollection:(id)a3;
- (BOOL)_isPlacesAlbumAssetCollection:(id)a3;
- (BOOL)_needsFetchResultForCollection:(id)a3;
- (BOOL)_needsKeyAssetsFetchResultForCollection:(id)a3;
- (BOOL)_shouldIncludeCollection:(id)a3;
- (BOOL)_updateCachedSubCollectionFetchResultsForChange:(id)a3 fetchResultChangeDetails:(id)a4;
- (BOOL)canDeleteCollection:(id)a3;
- (BOOL)canEditAlbums;
- (BOOL)canRenameCollection:(id)a3;
- (BOOL)canReorderCollection:(id)a3;
- (BOOL)hasAssetsFetchResultForCollection:(id)a3;
- (BOOL)isBackgroundFetching;
- (BOOL)isCachedFetchResultOutdatedForCollection:(id)a3;
- (BOOL)isChangeProcessingPaused;
- (BOOL)isInitialDuplicateDetectorProcessingCompleted;
- (NSArray)_collectionListBySection;
- (NSArray)_collectionsFetchResultBySection;
- (NSArray)_virtualCollections;
- (NSMutableDictionary)_subCollectionActiveCountFetchOperations;
- (NSMutableDictionary)_subCollectionActiveKeyAssetsFetchOperations;
- (NSPredicate)collectionFilterPredicate;
- (NSString)description;
- (OS_os_log)dataSourceManagerLog;
- (PHCollectionList)collectionList;
- (PHFetchResult)collectionsFetchResult;
- (PXLibraryFilterState)libraryFilterState;
- (PXPhotoKitCollectionsDataSourceManager)initWithConfiguration:(id)a3;
- (PXPhotoKitCollectionsDataSourceManagerConfiguration)configuration;
- (id)_changedSubCollectionIndexesBySections;
- (id)_filterFetchResult:(id)a3;
- (id)_getSectionedCollectionListAndFetchResultsFromFetchResult:(id)a3;
- (id)_keyAssetFetchResultForSubCollection:(id)a3 fetchIfNeeded:(BOOL)a4;
- (id)_newDataSource;
- (id)_subitemChangeDetailsByItemBySection;
- (id)assetsFetchResultForCollection:(id)a3 fetchIfNeeded:(BOOL)a4;
- (id)createInitialDataSource;
- (id)customFetchOptionsForCollection:(id)a3;
- (id)displayableAssetsForCollectionList:(id)a3 maximumCount:(int64_t)a4 useCache:(BOOL)a5 correspondingCollections:(id *)a6;
- (id)fetchResultForSubCollection:(id)a3;
- (id)indexPathForCollection:(id)a3;
- (id)keyAssetsFetchResultForCollection:(id)a3;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (id)uncachedFetchResultForSubCollection:(id)a3;
- (id)uncachedKeyAssetFetchResultForSubCollection:(id)a3;
- (int64_t)estimatedCountForAssetCollection:(id)a3;
- (int64_t)numberOfPendingKeyAssetFetches;
- (unint64_t)_fixedOrderPriorityForVirtualCollection:(id)a3;
- (unint64_t)indexOfFirstReorderableCollection;
- (void)_cancelAllBackgroundFetches;
- (void)_endSignpostForFetchOperation:(id)a3;
- (void)_enqueueFetchCountsOperationForCollection:(id)a3;
- (void)_enqueueFetchKeyAssetsOperationForCollection:(id)a3;
- (void)_enumerateAllPhotoKitCollectionsUsingBlock:(id)a3;
- (void)_prepareBackgroundFetchingIfNeeded;
- (void)_prepareBackgroundFetchingIfNeededForCollection:(id)a3;
- (void)_publishPendingCollectionChanges;
- (void)_recursivelyCollectCollectionsIn:(id)a3 fetchResult:(id)a4;
- (void)_recursivelyEnumerateAssetCollectionsInFetchResult:(id)a3 block:(id)a4;
- (void)_registerContentSyndicationConfigurationProviderChangeObserver;
- (void)_reloadAndRestartBackgroundFetchesIfNeeded;
- (void)_setCollectionListBySection:(id)a3;
- (void)_setCollectionsFetchResultBySection:(id)a3;
- (void)_updateCollectionIndexMappingForFilteredFetchResults;
- (void)_updateDataSourceForChangeOnCollection:(id)a3;
- (void)_updateFilteredCollectionsFetchResults;
- (void)_updateKeyAssetsCacheForCollection:(id)a3 withFetchResult:(id)a4 otherFetchResultsByAssetCollection:(id)a5;
- (void)_updateVisibleCountsForCollection:(id)a3 withWithFetchResult:(id)a4;
- (void)collectionFetchOperationDidBegin:(id)a3;
- (void)collectionFetchOperationDidComplete:(id)a3;
- (void)dealloc;
- (void)getDisplayableAssets:(id *)a3 indexes:(id *)a4 forCollection:(id)a5 maximumCount:(int64_t)a6 useCache:(BOOL)a7;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseBackgroundFetching;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
- (void)prepareBackgroundFetchingIfNeeded;
- (void)setChangeProcessingPaused:(BOOL)a3 forReason:(id)a4;
- (void)setCollectionFilterPredicate:(id)a3;
- (void)setDataSource:(id)a3 changeDetailsArray:(id)a4;
- (void)setIsChangeProcessingPaused:(BOOL)a3;
- (void)setIsInitialDuplicateDetectorProcessingCompleted:(BOOL)a3;
- (void)set_virtualCollections:(id)a3;
- (void)startBackgroundFetchingIfNeeded;
- (void)startCoalescingFetchResultChanges;
- (void)waitUntilBackgroundFetchingFinishedWithCompletionBlock:(id)a3;
@end

@implementation PXPhotoKitCollectionsDataSourceManager

- (id)displayableAssetsForCollectionList:(id)a3 maximumCount:(int64_t)a4 useCache:(BOOL)a5 correspondingCollections:(id *)a6
{
  BOOL v6 = a5;
  id v9 = a3;
  v10 = self;
  v11 = v10;
  v22 = v9;
  if (v6) {
    [(PXPhotoKitCollectionsDataSourceManager *)v10 keyAssetsFetchResultForCollection:v9];
  }
  else {
  v12 = [(PXPhotoKitCollectionsDataSourceManager *)v10 uncachedKeyAssetFetchResultForSubCollection:v9];
  }
  if ([v12 count] <= (unint64_t)a4) {
    a4 = [v12 count];
  }
  v13 = [MEMORY[0x1E4F1CA48] array];
  v14 = [MEMORY[0x1E4F1CA48] array];
  if ([v12 count])
  {
    uint64_t v15 = 0;
    while (1)
    {
      v16 = [v12 objectAtIndex:v15];
      id v23 = 0;
      [(PXPhotoKitCollectionsDataSourceManager *)v11 getDisplayableAssets:&v23 indexes:0 forCollection:v16 maximumCount:1 useCache:v6];
      id v17 = v23;
      v18 = v17;
      if (v17)
      {
        if ([v17 count])
        {
          v19 = [v18 firstObject];
          [v13 addObject:v19];

          [v14 addObject:v16];
          if ([v13 count] == a4) {
            break;
          }
        }
      }

      if (++v15 >= (unint64_t)[v12 count]) {
        goto LABEL_14;
      }
    }
  }
LABEL_14:
  if (a6) {
    *a6 = v14;
  }

  return v13;
}

- (void)getDisplayableAssets:(id *)a3 indexes:(id *)a4 forCollection:(id)a5 maximumCount:(int64_t)a6 useCache:(BOOL)a7
{
  v85[1] = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  if (!((unint64_t)a3 | (unint64_t)a4))
  {
    v62 = [MEMORY[0x1E4F28B00] currentHandler];
    [v62 handleFailureInMethod:a2 object:self file:@"PXPhotoKitCollectionsDataSourceManager+KeyAssets.m" lineNumber:19 description:@"expected out param"];
  }
  v14 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(PXPhotoKitCollectionsDataSourceManager *)v14 containsAnyAssets:v13])
  {
    v64 = a4;
    if (a7) {
      [(PXPhotoKitCollectionsDataSourceManager *)v14 keyAssetsFetchResultForCollection:v13];
    }
    else {
    v68 = [(PXPhotoKitCollectionsDataSourceManager *)v14 uncachedKeyAssetFetchResultForSubCollection:v13];
    }
    v77[0] = 0;
    v77[1] = v77;
    v77[2] = 0x3032000000;
    v77[3] = __Block_byref_object_copy__131856;
    v77[4] = __Block_byref_object_dispose__131857;
    id v78 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __118__PXPhotoKitCollectionsDataSourceManager_KeyAssets__getDisplayableAssets_indexes_forCollection_maximumCount_useCache___block_invoke;
    aBlock[3] = &unk_1E5DBD730;
    v75 = v77;
    BOOL v76 = a7;
    v73 = v14;
    id v63 = v13;
    id v74 = v63;
    v71 = (void (**)(void))_Block_copy(aBlock);
    unint64_t v15 = [v68 count];
    if (v15)
    {
      v16 = [v68 objectAtIndex:0];
      v69 = 0;
      if (a6 >= 2 && v15 >= 2)
      {
        v69 = [v68 objectAtIndex:1];
      }
      if (a6 <= 2 || v15 < 3)
      {
        BOOL v18 = v16 != 0;
        if (a6 == 1 && v16)
        {
          if (a3)
          {
            v85[0] = v16;
            *a3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:1];
          }
          v65 = v16;
          if (!a4)
          {

LABEL_90:
            _Block_object_dispose(v77, 8);

            goto LABEL_91;
          }
          v29 = (void *)MEMORY[0x1E4F1C978];
          v30 = NSNumber;
          v22 = v71[2]();
          objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v22, "indexOfObject:", v16));
          id v70 = (id)objc_claimAutoreleasedReturnValue();
          id v31 = [v29 arrayWithObject:v70];
          v66 = 0;
          goto LABEL_48;
        }
        v66 = 0;
        BOOL v20 = a6 == 3;
        BOOL v19 = v69 != 0;
LABEL_31:
        v32 = v71[2]();
        uint64_t v67 = [v32 count];
        v65 = v16;

        if (!v67)
        {
LABEL_89:

          goto LABEL_90;
        }
        BOOL v33 = v67 == 2 && v20;
        if (v33 && v18 && v19)
        {
          v34 = v16;
          if (a3)
          {
            v82[0] = v16;
            v82[1] = v69;
            *a3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:2];
            v34 = v16;
          }
          if (!v64) {
            goto LABEL_89;
          }
          v35 = NSNumber;
          v22 = v71[2]();
          objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v22, "indexOfObject:", v34));
          id v70 = (id)objc_claimAutoreleasedReturnValue();
          v81[0] = v70;
          v36 = NSNumber;
          v37 = v71[2]();
          v38 = objc_msgSend(v36, "numberWithUnsignedInteger:", objc_msgSend(v37, "indexOfObject:", v69));
          v81[1] = v38;
          id *v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];

          goto LABEL_88;
        }
        uint64_t v39 = v67 - 1;
        BOOL v40 = v67 == 1 && v20;
        if (!v40 || !v18)
        {
          if (a3)
          {
            v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a6];
          }
          else
          {
            v22 = 0;
          }
          if (v64)
          {
            id v70 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a6];
          }
          else
          {
            id v70 = 0;
          }
          if (v18
            && (v71[2](),
                v42 = objc_claimAutoreleasedReturnValue(),
                [v42 objectAtIndex:0],
                v43 = objc_claimAutoreleasedReturnValue(),
                int v44 = [v16 isEqual:v43],
                v43,
                v42,
                !v44))
          {
            v45 = v71[2]();
            v46 = [v45 objectAtIndex:v39];
            char v47 = [v65 isEqual:v46];

            if ((v47 & 1) == 0)
            {
              v48 = v71[2]();
              uint64_t v49 = [v48 indexOfObject:v65];

              if (v49 == 0x7FFFFFFFFFFFFFFFLL) {
                uint64_t v39 = 0;
              }
              else {
                uint64_t v39 = v49;
              }
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (![v63 keyAssetsAtEnd]) {
                uint64_t v39 = 0;
              }
            }
            else
            {
              uint64_t v39 = 0;
            }
          }
          int64_t v50 = 0;
          if (a6 >= 1 && v39 < v67)
          {
            uint64_t v51 = v39;
            do
            {
              v52 = v71[2]();
              v53 = [v52 objectAtIndex:v51];

              [v22 addObject:v53];
              v54 = [NSNumber numberWithInteger:v51];
              [v70 addObject:v54];

              if (v22) {
                uint64_t v55 = [v22 count];
              }
              else {
                uint64_t v55 = [v70 count];
              }
              int64_t v50 = v55;

              if (v50 >= a6) {
                break;
              }
              ++v51;
            }
            while (v51 < v67);
          }
          if (v50 < a6 && v39 >= 1 && v39 <= v67)
          {
            do
            {
              v56 = v71[2]();
              uint64_t v57 = v39 - 1;
              v58 = [v56 objectAtIndex:v39 - 1];

              [v22 addObject:v58];
              v59 = [NSNumber numberWithInteger:v39 - 1];
              [v70 addObject:v59];

              if (v22) {
                uint64_t v60 = [v22 count];
              }
              else {
                uint64_t v60 = [v70 count];
              }
              int64_t v61 = v60;

              if (v61 >= a6) {
                break;
              }
              if ((unint64_t)v39 < 2) {
                break;
              }
              --v39;
            }
            while (v57 <= v67);
          }
          if (a3) {
            *a3 = v22;
          }
          if (v64)
          {
            id v70 = v70;
            id *v64 = v70;
          }
          goto LABEL_88;
        }
        if (a3)
        {
          v80 = v16;
          *a3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
        }
        if (!v64) {
          goto LABEL_89;
        }
        v41 = NSNumber;
        v22 = v71[2]();
        objc_msgSend(v41, "numberWithUnsignedInteger:", objc_msgSend(v22, "indexOfObject:", v16));
        id v70 = (id)objc_claimAutoreleasedReturnValue();
        id v79 = v70;
        id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
LABEL_48:
        id *v64 = v31;
LABEL_88:

        goto LABEL_89;
      }
      v66 = [v68 objectAtIndex:2];
      id v17 = v69;
    }
    else
    {
      v66 = 0;
      id v17 = 0;
      v16 = 0;
    }
    BOOL v18 = v16 != 0;
    v69 = v17;
    BOOL v19 = v17 != 0;
    BOOL v20 = a6 == 3;
    if (a6 == 3 && v16 && v17 && v66)
    {
      if (a3)
      {
        v84[0] = v16;
        v84[1] = v17;
        v84[2] = v66;
        *a3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:3];
      }
      v65 = v16;
      if (!v64) {
        goto LABEL_89;
      }
      v21 = NSNumber;
      v22 = v71[2]();
      objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "indexOfObject:", v16));
      id v70 = (id)objc_claimAutoreleasedReturnValue();
      v83[0] = v70;
      id v23 = NSNumber;
      v24 = v71[2]();
      v25 = objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "indexOfObject:", v69));
      v83[1] = v25;
      v26 = NSNumber;
      v27 = v71[2]();
      v28 = objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "indexOfObject:", v66));
      v83[2] = v28;
      id *v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:3];

      goto LABEL_88;
    }
    goto LABEL_31;
  }
LABEL_91:
}

id __118__PXPhotoKitCollectionsDataSourceManager_KeyAssets__getDisplayableAssets_indexes_forCollection_maximumCount_useCache___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 56)) {
      [v3 assetsFetchResultForCollection:v4];
    }
    else {
    v5 = [v3 uncachedFetchResultForSubCollection:v4];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);

    v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionFilterPredicate, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->__virtualCollections, 0);
  objc_storeStrong((id *)&self->__collectionsFetchResultBySection, 0);
  objc_storeStrong((id *)&self->__collectionListBySection, 0);
  objc_storeStrong((id *)&self->__subCollectionActiveKeyAssetsFetchOperations, 0);
  objc_storeStrong((id *)&self->__subCollectionActiveCountFetchOperations, 0);
  objc_storeStrong((id *)&self->_lastDuplicatesProcessingCheckDate, 0);
  objc_storeStrong((id *)&self->_changesDetailsWhilePaused, 0);
  objc_storeStrong((id *)&self->_changeProcessingPausedReasons, 0);
  objc_storeStrong((id *)&self->_changedSubCollections, 0);
  objc_storeStrong((id *)&self->_pendingChangedCollections, 0);
  objc_storeStrong((id *)&self->_subCollectionKeyAssetsFetchOperationQueue, 0);
  objc_storeStrong((id *)&self->_subCollectionFetchOperationQueue, 0);
  objc_storeStrong((id *)&self->_collectionIndexPathByCollection, 0);
  objc_storeStrong((id *)&self->_subCollectionKeyAssetFetchResultsCache, 0);
  objc_storeStrong((id *)&self->_subCollectionFetchResultsCache, 0);
  objc_storeStrong((id *)&self->_contentSyndicationConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_collectionsFetchResult, 0);
  objc_storeStrong((id *)&self->_collectionList, 0);
}

- (NSPredicate)collectionFilterPredicate
{
  return self->_collectionFilterPredicate;
}

- (PXPhotoKitCollectionsDataSourceManagerConfiguration)configuration
{
  return self->_configuration;
}

- (PHFetchResult)collectionsFetchResult
{
  return self->_collectionsFetchResult;
}

- (PHCollectionList)collectionList
{
  return self->_collectionList;
}

- (void)setIsInitialDuplicateDetectorProcessingCompleted:(BOOL)a3
{
  self->_isInitialDuplicateDetectorProcessingCompleted = a3;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void)set_virtualCollections:(id)a3
{
}

- (void)_setCollectionsFetchResultBySection:(id)a3
{
}

- (void)_setCollectionListBySection:(id)a3
{
}

- (NSArray)_collectionListBySection
{
  return self->__collectionListBySection;
}

- (NSMutableDictionary)_subCollectionActiveKeyAssetsFetchOperations
{
  return self->__subCollectionActiveKeyAssetsFetchOperations;
}

- (NSMutableDictionary)_subCollectionActiveCountFetchOperations
{
  return self->__subCollectionActiveCountFetchOperations;
}

- (BOOL)isChangeProcessingPaused
{
  return self->_isChangeProcessingPaused;
}

- (OS_os_log)dataSourceManagerLog
{
  if (dataSourceManagerLog_onceToken != -1) {
    dispatch_once(&dataSourceManagerLog_onceToken, &__block_literal_global_282_301109);
  }
  v2 = (void *)dataSourceManagerLog_dataSourceManagerLog;
  return (OS_os_log *)v2;
}

void __62__PXPhotoKitCollectionsDataSourceManager_dataSourceManagerLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.ui", "PhotoKitDataSourceManager");
  v1 = (void *)dataSourceManagerLog_dataSourceManagerLog;
  dataSourceManagerLog_dataSourceManagerLog = (uint64_t)v0;
}

- (int64_t)numberOfPendingKeyAssetFetches
{
  return [(NSOperationQueue *)self->_subCollectionKeyAssetsFetchOperationQueue operationCount];
}

- (void)waitUntilBackgroundFetchingFinishedWithCompletionBlock:(id)a3
{
  id v4 = a3;
  subCollectionFetchOperationQueue = self->_subCollectionFetchOperationQueue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __97__PXPhotoKitCollectionsDataSourceManager_waitUntilBackgroundFetchingFinishedWithCompletionBlock___block_invoke;
  v10 = &unk_1E5DD3280;
  v11 = self;
  id v12 = v4;
  id v6 = v4;
  [(NSOperationQueue *)subCollectionFetchOperationQueue addOperationWithBlock:&v7];
  -[NSOperationQueue setSuspended:](self->_subCollectionFetchOperationQueue, "setSuspended:", 0, v7, v8, v9, v10, v11);
  [(NSOperationQueue *)self->_subCollectionFetchOperationQueue waitUntilAllOperationsAreFinished];
}

void __97__PXPhotoKitCollectionsDataSourceManager_waitUntilBackgroundFetchingFinishedWithCompletionBlock___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 184);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __97__PXPhotoKitCollectionsDataSourceManager_waitUntilBackgroundFetchingFinishedWithCompletionBlock___block_invoke_2;
  v3[3] = &unk_1E5DD3128;
  id v4 = *(id *)(a1 + 40);
  [v2 addOperationWithBlock:v3];
  [*(id *)(*(void *)(a1 + 32) + 184) setSuspended:0];
  [*(id *)(*(void *)(a1 + 32) + 184) waitUntilAllOperationsAreFinished];
}

void __97__PXPhotoKitCollectionsDataSourceManager_waitUntilBackgroundFetchingFinishedWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__PXPhotoKitCollectionsDataSourceManager_waitUntilBackgroundFetchingFinishedWithCompletionBlock___block_invoke_3;
  block[3] = &unk_1E5DD3128;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __97__PXPhotoKitCollectionsDataSourceManager_waitUntilBackgroundFetchingFinishedWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)startCoalescingFetchResultChanges
{
  self->_publishChangesScheduledOnRunLoop = 1;
}

- (unint64_t)indexOfFirstReorderableCollection
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  v3 = [(PXPhotoKitCollectionsDataSourceManager *)self collectionsFetchResult];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__PXPhotoKitCollectionsDataSourceManager_indexOfFirstReorderableCollection__block_invoke;
  v6[3] = &unk_1E5DD3100;
  v6[4] = self;
  v6[5] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  unint64_t v4 = v8[3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = [v3 count];
    v8[3] = v4;
  }

  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __75__PXPhotoKitCollectionsDataSourceManager_indexOfFirstReorderableCollection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) canReorderCollection:a2];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (BOOL)canReorderCollection:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v4, "px_isSharedAlbum") & 1) == 0)
  {
    uint64_t v6 = [(PXPhotoKitCollectionsDataSourceManager *)self configuration];
    uint64_t v7 = [(id)v6 collectionList];
    int v8 = [v7 canPerformEditOperation:5];

    LODWORD(v6) = [v4 collectionHasFixedOrder];
    int v9 = (v6 | [v4 isTransient]) ^ 1;
    if (v8) {
      BOOL v5 = v9;
    }
    else {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)canRenameCollection:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 canPerformEditOperation:7];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)canDeleteCollection:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 canPerformEditOperation:6];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)canEditAlbums
{
  id v3 = [(PXPhotoKitCollectionsDataSourceManager *)self collectionList];
  char v4 = v3;
  if (v3 && ([v3 isTransient] & 1) == 0)
  {
    char v7 = 1;
    if (([v4 canPerformEditOperation:1] & 1) == 0)
    {
      if (([v4 canPerformEditOperation:3] & 1) != 0
        || ([v4 canPerformEditOperation:4] & 1) != 0)
      {
        char v7 = 1;
      }
      else
      {
        char v7 = [v4 canPerformEditOperation:5];
      }
    }
  }
  else
  {
    BOOL v5 = [(PXPhotoKitCollectionsDataSourceManager *)self collectionsFetchResult];
    uint64_t v6 = [v5 fetchType];

    char v7 = [v6 isEqualToString:*MEMORY[0x1E4F39658]];
  }

  return v7;
}

- (BOOL)_isImportsAssetCollection:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && [v3 assetCollectionType] == 9;

  return v4;
}

- (BOOL)_isPlacesAlbumAssetCollection:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && [v3 assetCollectionSubtype] == 1000000203;

  return v4;
}

- (BOOL)_needsFetchResultForCollection:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXPhotoKitCollectionsDataSourceManager *)self configuration];
  char v6 = [v5 skipAssetFetches];

  if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 assetCollectionType] == 2) {
      int v8 = ![(PXPhotoKitCollectionsDataSourceManager *)self _isPlacesAlbumAssetCollection:v4];
    }
    else {
      int v8 = 0;
    }
    BOOL v9 = [(PXPhotoKitCollectionsDataSourceManager *)self _isImportsAssetCollection:v4];
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
    v11 = [(PXPhotoKitCollectionsDataSourceManager *)self configuration];
    id v12 = [v11 assetsFilterPredicate];

    if (v12) {
      char v13 = objc_msgSend(v4, "px_isRegularAlbum");
    }
    else {
      char v13 = 0;
    }
    v14 = [(PXPhotoKitCollectionsDataSourceManager *)self libraryFilterState];
    int v15 = [v14 sharingFilter];

    if ((v8 | v9 | isKindOfClass))
    {
      BOOL v7 = 1;
    }
    else if (v15 == 2)
    {
      BOOL v7 = v13;
    }
    else
    {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (BOOL)_needsKeyAssetsFetchResultForCollection:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXPhotoKitCollectionsDataSourceManager *)self configuration];
  if ([v5 skipKeyAssetFetches])
  {

LABEL_4:
    BOOL v7 = 0;
    goto LABEL_5;
  }
  BOOL v6 = [(PXPhotoKitCollectionsDataSourceManager *)self _isPlacesAlbumAssetCollection:v4];

  if (v6) {
    goto LABEL_4;
  }
  BOOL v9 = [(PXPhotoKitCollectionsDataSourceManager *)self configuration];
  int v10 = [v9 skipKeyAssetFetchesForSmartAlbums];

  BOOL v7 = !v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || [v4 assetCollectionType] != 2;
LABEL_5:

  return v7;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 changeDetailsForFetchResult:self->_collectionsFetchResult];
  BOOL v6 = [v4 changeDetailsForObject:self->_collectionList];
  BOOL v7 = [(PXPhotoKitCollectionsDataSourceManager *)self _updateCachedSubCollectionFetchResultsForChange:v4 fetchResultChangeDetails:v5];
  if (v5) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (!v8 || v7)
  {
    BOOL v10 = v7;
    v11 = self->_collectionList;
    id v12 = self->_collectionsFetchResult;
    char v13 = [(PXPhotoKitCollectionsDataSourceManager *)self _collectionListBySection];
    v14 = [(PXPhotoKitCollectionsDataSourceManager *)self _collectionsFetchResultBySection];
    v65 = v6;
    if (v6)
    {
      uint64_t v15 = [v6 objectAfterChanges];

      int64_t v61 = (PHCollectionList *)v15;
    }
    else
    {
      int64_t v61 = v11;
    }
    unint64_t v16 = 0x1E4F1C000uLL;
    v69 = v14;
    v66 = v5;
    v64 = self;
    if (v5)
    {
      id v60 = v4;
      id v17 = v14;
      uint64_t v18 = [v5 fetchResultAfterChanges];

      uint64_t v57 = (PHFetchResult *)v18;
      BOOL v19 = [(PXPhotoKitCollectionsDataSourceManager *)self _getSectionedCollectionListAndFetchResultsFromFetchResult:v18];
      uint64_t v58 = [v19 first];

      v59 = v19;
      BOOL v20 = [v19 second];
      uint64_t v67 = [v5 changedObjects];
      v21 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v22 = [(NSArray *)v17 count];
      if (v22 | [(NSArray *)v20 count])
      {
        unint64_t v23 = 0;
        do
        {
          if (v23 >= [(NSArray *)v17 count])
          {
            v24 = 0;
          }
          else
          {
            v24 = [(NSArray *)v17 objectAtIndexedSubscript:v23];
          }
          if (v23 >= [(NSArray *)v20 count])
          {
            v26 = 0;
            v27 = 0;
          }
          else
          {
            uint64_t v25 = [(NSArray *)v20 objectAtIndexedSubscript:v23];
            v26 = (void *)v25;
            v27 = 0;
            if (v24 && v25)
            {
              v27 = [MEMORY[0x1E4F390B8] changeDetailsFromFetchResult:v24 toFetchResult:v25 changedObjects:v67];
            }
          }
          v28 = [off_1E5DA5568 changeDetailsFromFetchResultChangeDetails:v27];
          v29 = [NSNumber numberWithInteger:v23];
          [v21 setObject:v28 forKeyedSubscript:v29];

          ++v23;
          unint64_t v30 = [(NSArray *)v17 count];
          unint64_t v31 = [(NSArray *)v20 count];
          if (v30 <= v31) {
            unint64_t v32 = v31;
          }
          else {
            unint64_t v32 = v30;
          }
        }
        while (v23 < v32);
      }

      id v12 = v57;
      unint64_t v16 = 0x1E4F1C000uLL;
      v14 = v69;
    }
    else
    {
      if (!v10)
      {
        v21 = 0;
        BOOL v33 = v61;
        goto LABEL_28;
      }
      id v60 = v4;
      v46 = [(PXPhotoKitCollectionsDataSourceManager *)self _getSectionedCollectionListAndFetchResultsFromFetchResult:v12];
      uint64_t v58 = [v46 first];

      v59 = v46;
      BOOL v20 = [v46 second];
      v21 = [MEMORY[0x1E4F1CA60] dictionary];
      unint64_t v47 = [(NSArray *)v14 count];
      unint64_t v48 = [(NSArray *)v20 count];
      if (v47 <= v48) {
        uint64_t v49 = v48;
      }
      else {
        uint64_t v49 = v47;
      }
      if (v49 >= 1)
      {
        for (unint64_t i = 0; i != v49; ++i)
        {
          if (i >= [(NSArray *)v14 count])
          {
            uint64_t v51 = 0;
          }
          else
          {
            uint64_t v51 = [(NSArray *)v14 objectAtIndexedSubscript:i];
          }
          if (i >= [(NSArray *)v20 count])
          {
            v53 = 0;
            v54 = 0;
          }
          else
          {
            uint64_t v52 = [(NSArray *)v20 objectAtIndexedSubscript:i];
            v53 = (void *)v52;
            v54 = 0;
            if (v51 && v52)
            {
              v54 = [MEMORY[0x1E4F390B8] changeDetailsFromFetchResult:v51 toFetchResult:v52 changedObjects:MEMORY[0x1E4F1CBF0]];
            }
          }
          uint64_t v55 = [off_1E5DA5568 changeDetailsFromFetchResultChangeDetails:v54];
          v56 = [NSNumber numberWithInteger:i];
          [v21 setObject:v55 forKeyedSubscript:v56];

          v14 = v69;
        }
        unint64_t v16 = 0x1E4F1C000;
      }
    }
    BOOL v33 = v61;

    v14 = v20;
    char v13 = (NSArray *)v58;
    id v4 = v60;
LABEL_28:
    collectionList = v64->_collectionList;
    v64->_collectionList = v33;
    id v70 = v33;

    collectionsFetchResult = v64->_collectionsFetchResult;
    v64->_collectionsFetchResult = v12;
    v68 = v12;

    collectionListBySection = v64->__collectionListBySection;
    v64->__collectionListBySection = v13;
    id v63 = v13;

    collectionsFetchResultBySection = v64->__collectionsFetchResultBySection;
    v64->__collectionsFetchResultBySection = v14;
    v62 = v14;

    [(PXPhotoKitCollectionsDataSourceManager *)v64 _updateCollectionIndexMappingForFilteredFetchResults];
    id v38 = [(PXPhotoKitCollectionsDataSourceManager *)v64 _newDataSource];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __75__PXPhotoKitCollectionsDataSourceManager_photoLibraryDidChangeOnMainQueue___block_invoke;
    v73[3] = &unk_1E5DD30B0;
    id v74 = v38;
    v75 = v64;
    id v39 = v38;
    [v21 enumerateKeysAndObjectsUsingBlock:v73];
    BOOL v40 = [off_1E5DA5568 changeDetailsWithNoChanges];
    v41 = [*(id *)(v16 + 2656) dictionary];
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __75__PXPhotoKitCollectionsDataSourceManager_photoLibraryDidChangeOnMainQueue___block_invoke_3;
    v71[3] = &unk_1E5DD30D8;
    id v72 = v41;
    id v42 = v41;
    [v21 enumerateKeysAndObjectsUsingBlock:v71];
    v43 = [(PXPhotoKitCollectionsDataSourceManager *)v64 _subitemChangeDetailsByItemBySection];
    [(NSMutableSet *)v64->_changedSubCollections removeAllObjects];
    int v44 = [(PXSectionedDataSourceManager *)v64 dataSource];
    v45 = -[PXSectionedDataSourceChangeDetails initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:]([PXCollectionsDataSourceChangeDetails alloc], "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", [v44 identifier], objc_msgSend(v39, "identifier"), v40, v42, v43);
    [(PXSectionedDataSourceManager *)v64 setDataSource:v39 changeDetails:v45];

    BOOL v6 = v65;
    BOOL v5 = v66;
  }
}

void __75__PXPhotoKitCollectionsDataSourceManager_photoLibraryDidChangeOnMainQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  BOOL v6 = [a3 insertedIndexes];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__PXPhotoKitCollectionsDataSourceManager_photoLibraryDidChangeOnMainQueue___block_invoke_2;
  v8[3] = &unk_1E5DD3088;
  id v9 = *(id *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = *(void *)(a1 + 40);
  id v7 = v5;
  [v6 enumerateIndexesUsingBlock:v8];
}

void __75__PXPhotoKitCollectionsDataSourceManager_photoLibraryDidChangeOnMainQueue___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [off_1E5DA5568 changeDetailsFromFetchResultChangeDetails:v8];
LABEL_5:
    id v7 = v6;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v8;
    goto LABEL_5;
  }
  id v7 = 0;
LABEL_7:
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
}

void __75__PXPhotoKitCollectionsDataSourceManager_photoLibraryDidChangeOnMainQueue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", a2, objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  id v5 = [v3 collectionAtIndexPath:v4];

  [*(id *)(a1 + 48) _prepareBackgroundFetchingIfNeededForCollection:v5];
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  return 0;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((void *)PXContentSyndicationConfigurationObservationContext_301124 == a5)
  {
    if ((v6 & 5) != 0)
    {
      subCollectionFetchResultsCache = self->_subCollectionFetchResultsCache;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __71__PXPhotoKitCollectionsDataSourceManager_observable_didChange_context___block_invoke;
      v10[3] = &unk_1E5DD3060;
      v10[4] = self;
      [(NSMutableDictionary *)subCollectionFetchResultsCache enumerateKeysAndObjectsUsingBlock:v10];
      [(NSMutableDictionary *)self->_subCollectionFetchResultsCache removeAllObjects];
    }
  }
  else if ((v6 & 1) != 0 && (void *)PXLibraryFilterStateObservationContext_301125 == a5)
  {
    [(PXPhotoKitCollectionsDataSourceManager *)self _reloadAndRestartBackgroundFetchesIfNeeded];
  }
}

uint64_t __71__PXPhotoKitCollectionsDataSourceManager_observable_didChange_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _enqueueFetchCountsOperationForCollection:a2];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  if ((void *)PXUserDefaultsObservationContext_301127 == a6)
  {
    id v12 = (void *)MEMORY[0x1E4F1CB18];
    id v13 = a4;
    v14 = [v12 standardUserDefaults];
    int v15 = [v13 isEqual:v14];

    if (v15)
    {
      int v16 = [v10 isEqual:@"IncludeSharedWithYou"];

      if (v16)
      {
        uint64_t v18 = MEMORY[0x1E4F143A8];
        uint64_t v19 = 3221225472;
        BOOL v20 = __89__PXPhotoKitCollectionsDataSourceManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
        v21 = &unk_1E5DD36F8;
        uint64_t v22 = self;
        px_dispatch_on_main_queue();
      }
    }
    else
    {
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PXPhotoKitCollectionsDataSourceManager;
    id v11 = a4;
    [(PXPhotoKitCollectionsDataSourceManager *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:a5 context:a6];
  }
}

uint64_t __89__PXPhotoKitCollectionsDataSourceManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAndRestartBackgroundFetchesIfNeeded];
}

- (id)_subitemChangeDetailsByItemBySection
{
  id v2 = [(PXPhotoKitCollectionsDataSourceManager *)self _changedSubCollectionIndexesBySections];
  if ([v2 count])
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __78__PXPhotoKitCollectionsDataSourceManager__subitemChangeDetailsByItemBySection__block_invoke;
    v6[3] = &unk_1E5DD3038;
    id v4 = v3;
    id v7 = v4;
    [v2 enumerateKeysAndObjectsUsingBlock:v6];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __78__PXPhotoKitCollectionsDataSourceManager__subitemChangeDetailsByItemBySection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v7 = a2;
  id v8 = objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__PXPhotoKitCollectionsDataSourceManager__subitemChangeDetailsByItemBySection__block_invoke_2;
  v10[3] = &unk_1E5DD3010;
  id v11 = v8;
  id v9 = v8;
  [v6 enumerateIndexesUsingBlock:v10];

  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v7];
}

void __78__PXPhotoKitCollectionsDataSourceManager__subitemChangeDetailsByItemBySection__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc((Class)off_1E5DA5568);
  id v8 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  id v5 = (void *)[v4 initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:0 movesToIndexes:0 movesFromIndexes:0 changedIndexes:v8];
  id v6 = *(void **)(a1 + 32);
  id v7 = [NSNumber numberWithUnsignedInteger:a2];
  [v6 setObject:v5 forKeyedSubscript:v7];
}

- (id)_changedSubCollectionIndexesBySections
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  changedSubCollections = self->_changedSubCollections;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__PXPhotoKitCollectionsDataSourceManager__changedSubCollectionIndexesBySections__block_invoke;
  v9[3] = &unk_1E5DD2FE8;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [(NSMutableSet *)changedSubCollections enumerateObjectsUsingBlock:v9];
  id v6 = v10;
  id v7 = v5;

  return v7;
}

void __80__PXPhotoKitCollectionsDataSourceManager__changedSubCollectionIndexesBySections__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 168) objectForKeyedSubscript:a2];
  if (v3)
  {
    id v4 = *(void **)(a1 + 40);
    id v9 = v3;
    id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "section"));
    id v6 = [v4 objectForKeyedSubscript:v5];

    if (!v6)
    {
      id v6 = [MEMORY[0x1E4F28E60] indexSet];
      id v7 = *(void **)(a1 + 40);
      id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "section"));
      [v7 setObject:v6 forKeyedSubscript:v8];
    }
    objc_msgSend(v6, "addIndex:", objc_msgSend(v9, "item"));

    id v3 = v9;
  }
}

- (BOOL)_updateCachedSubCollectionFetchResultsForChange:(id)a3 fetchResultChangeDetails:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v39 = 0;
  BOOL v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v25 = [v7 removedObjects];
  v24 = v7;
  id v8 = [v7 changedObjects];
  if ([v25 count])
  {
    [(NSMutableDictionary *)self->_subCollectionFetchResultsCache removeObjectsForKeys:v25];
    [(NSMutableDictionary *)self->_subCollectionKeyAssetFetchResultsCache removeObjectsForKeys:v25];
  }
  subCollectionFetchResultsCache = self->_subCollectionFetchResultsCache;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __115__PXPhotoKitCollectionsDataSourceManager__updateCachedSubCollectionFetchResultsForChange_fetchResultChangeDetails___block_invoke;
  v35[3] = &unk_1E5DD2FC0;
  id v10 = v6;
  id v36 = v10;
  v37 = self;
  id v38 = &v39;
  [(NSMutableDictionary *)subCollectionFetchResultsCache enumerateKeysAndObjectsUsingBlock:v35];
  subCollectionKeyAssetFetchResultsCache = self->_subCollectionKeyAssetFetchResultsCache;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __115__PXPhotoKitCollectionsDataSourceManager__updateCachedSubCollectionFetchResultsForChange_fetchResultChangeDetails___block_invoke_2;
  v31[3] = &unk_1E5DD2FC0;
  id v26 = v10;
  id v32 = v26;
  BOOL v33 = self;
  v34 = &v39;
  [(NSMutableDictionary *)subCollectionKeyAssetFetchResultsCache enumerateKeysAndObjectsUsingBlock:v31];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v12);
        }
        int v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || [v16 assetCollectionType] != 2)
        {
          objc_super v17 = [(PXPhotoKitCollectionsDataSourceManager *)self configuration];
          int v18 = [v17 updateKeyAssetFetchesInBackground];

          if (v18)
          {
            if ([(PXPhotoKitCollectionsDataSourceManager *)self _needsKeyAssetsFetchResultForCollection:v16])
            {
              uint64_t v19 = [v16 objectID];
              if (v19)
              {
                BOOL v20 = [v16 objectID];
                int v21 = [v26 keyAssetsChangedForPHAssetCollectionOID:v20];

                if (v21)
                {
                  [(NSMutableDictionary *)self->_subCollectionKeyAssetFetchResultsCache removeObjectForKey:v16];
                  [(PXPhotoKitCollectionsDataSourceManager *)self _enqueueFetchKeyAssetsOperationForCollection:v16];
                }
              }
            }
          }
          else
          {
            [(NSMutableDictionary *)self->_subCollectionKeyAssetFetchResultsCache removeObjectForKey:v16];
          }
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v13);
  }

  BOOL v22 = *((unsigned char *)v40 + 24) != 0;
  _Block_object_dispose(&v39, 8);

  return v22;
}

void __115__PXPhotoKitCollectionsDataSourceManager__updateCachedSubCollectionFetchResultsForChange_fetchResultChangeDetails___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id v5 = [*(id *)(a1 + 32) changeDetailsForFetchResult:a3];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 fetchResultAfterChanges];
    [*(id *)(*(void *)(a1 + 40) + 152) setObject:v7 forKeyedSubscript:v8];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(*(void *)(a1 + 40) + 216) addObject:v8];
  }
}

void __115__PXPhotoKitCollectionsDataSourceManager__updateCachedSubCollectionFetchResultsForChange_fetchResultChangeDetails___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 changeDetailsForObject:v10];
  uint64_t v8 = [*(id *)(a1 + 32) changeDetailsForFetchResult:v6];

  if (v7 | v8)
  {
    id v9 = [(id)v8 fetchResultAfterChanges];
    if (v9) {
      [*(id *)(*(void *)(a1 + 40) + 160) setObject:v9 forKeyedSubscript:v10];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(*(void *)(a1 + 40) + 216) addObject:v10];
  }
}

- (id)uncachedKeyAssetFetchResultForSubCollection:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PXPhotoKitCollectionsDataSourceManager *)self dataSourceManagerLog];
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  uint64_t v7 = v5;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    id v9 = [v4 localizedTitle];
    int v18 = 138543362;
    uint64_t v19 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "FetchKeyAsset", "%{public}@", (uint8_t *)&v18, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v11 = 0;
      goto LABEL_13;
    }
    id v12 = v4;
    uint64_t v13 = [v12 photoLibrary];
    objc_msgSend(v13, "px_standardLibrarySpecificFetchOptions");
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setReverseSortOrder:", objc_msgSend(v12, "keyCollectionsAtEnd"));
    uint64_t v14 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v12 options:v10];
    goto LABEL_10;
  }
  id v10 = v4;
  if ([v10 assetCollectionType] != 4)
  {
    id v12 = [(PXPhotoKitCollectionsDataSourceManager *)self customFetchOptionsForCollection:v10];
    [v12 setSuppressSlowFetchReports:1];
    uint64_t v14 = [MEMORY[0x1E4F38EB8] fetchKeyAssetsInAssetCollection:v10 options:v12];
LABEL_10:
    id v11 = (void *)v14;

    goto LABEL_11;
  }
  id v11 = [MEMORY[0x1E4F38EB8] fetchKeyCuratedAssetInAssetCollection:v10 referenceAsset:0];
LABEL_11:

LABEL_13:
  int v15 = v8;
  int v16 = v15;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v16, OS_SIGNPOST_INTERVAL_END, v6, "FetchKeyAsset", "", (uint8_t *)&v18, 2u);
  }

  return v11;
}

- (id)_keyAssetFetchResultForSubCollection:(id)a3 fetchIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotoKitCollectionsDataSourceManager.m", 1023, @"%s must be called on the main thread", "-[PXPhotoKitCollectionsDataSourceManager _keyAssetFetchResultForSubCollection:fetchIfNeeded:]");
  }
  uint64_t v8 = [(NSMutableDictionary *)self->_subCollectionKeyAssetFetchResultsCache objectForKey:v7];
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = !v4;
  }
  if (!v9)
  {
    uint64_t v8 = [(PXPhotoKitCollectionsDataSourceManager *)self uncachedKeyAssetFetchResultForSubCollection:v7];
    if (v8)
    {
      [(NSMutableDictionary *)self->_subCollectionKeyAssetFetchResultsCache setObject:v8 forKeyedSubscript:v7];
      id v10 = [(PXPhotoKitCollectionsDataSourceManager *)self _subCollectionActiveKeyAssetsFetchOperations];
      id v11 = [v10 objectForKeyedSubscript:v7];

      if (v11)
      {
        [v11 cancel];
        id v12 = [(PXPhotoKitCollectionsDataSourceManager *)self _subCollectionActiveKeyAssetsFetchOperations];
        [v12 removeObjectForKey:v7];
      }
    }
  }

  return v8;
}

- (BOOL)isCachedFetchResultOutdatedForCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotoKitCollectionsDataSourceManager *)self fetchResultForSubCollection:v4];
  os_signpost_id_t v6 = [(PXPhotoKitCollectionsDataSourceManager *)self uncachedFetchResultForSubCollection:v4];

  id v7 = [v5 fetchedObjectIDs];
  uint64_t v8 = [v6 fetchedObjectIDs];
  char v9 = [v7 isEqualToArray:v8] ^ 1;

  return v9;
}

- (id)uncachedFetchResultForSubCollection:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PXPhotoKitCollectionsDataSourceManager *)self dataSourceManagerLog];
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    char v9 = [v4 localizedTitle];
    int v15 = 138543362;
    int v16 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "FetchCollectionFetchResult", "%{public}@", (uint8_t *)&v15, 0xCu);
  }
  if ([v4 canContainAssets])
  {
    id v10 = [(PXPhotoKitCollectionsDataSourceManager *)self customFetchOptionsForCollection:v4];
    id v11 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v4 options:v10];
  }
  else if ([v4 canContainCollections])
  {
    id v11 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v4 options:0];
  }
  else
  {
    id v11 = 0;
  }
  id v12 = v8;
  uint64_t v13 = v12;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v13, OS_SIGNPOST_INTERVAL_END, v6, "FetchCollectionFetchResult", "", (uint8_t *)&v15, 2u);
  }

  return v11;
}

- (id)assetsFetchResultForCollection:(id)a3 fetchIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_subCollectionFetchResultsCache objectForKey:v6];
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    id v7 = [(PXPhotoKitCollectionsDataSourceManager *)self uncachedFetchResultForSubCollection:v6];
    if (v7) {
      [(NSMutableDictionary *)self->_subCollectionFetchResultsCache setObject:v7 forKeyedSubscript:v6];
    }
  }

  return v7;
}

- (id)fetchResultForSubCollection:(id)a3
{
  return [(PXPhotoKitCollectionsDataSourceManager *)self assetsFetchResultForCollection:a3 fetchIfNeeded:1];
}

- (BOOL)hasAssetsFetchResultForCollection:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_subCollectionFetchResultsCache objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)keyAssetsFetchResultForCollection:(id)a3
{
  return [(PXPhotoKitCollectionsDataSourceManager *)self keyAssetsFetchResultForCollection:a3 fetchIfNeeded:1];
}

- (void)_endSignpostForFetchOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotoKitCollectionsDataSourceManager *)self dataSourceManagerLog];
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, v4);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  BOOL v8 = v5;
  char v9 = v8;
  if (isKindOfClass)
  {
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      __int16 v13 = 0;
      id v10 = "FetchKeyAssetOperation";
      id v11 = (uint8_t *)&v13;
LABEL_8:
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_INTERVAL_END, v6, v10, "", v11, 2u);
    }
  }
  else if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    __int16 v12 = 0;
    id v10 = "FetchCollectionOperation";
    id v11 = (uint8_t *)&v12;
    goto LABEL_8;
  }
}

- (void)collectionFetchOperationDidComplete:(id)a3
{
  id v15 = a3;
  [(PXPhotoKitCollectionsDataSourceManager *)self _endSignpostForFetchOperation:v15];
  id v4 = [v15 collection];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(PXPhotoKitCollectionsDataSourceManager *)self _subCollectionActiveKeyAssetsFetchOperations];
    id v6 = [v5 objectForKeyedSubscript:v4];

    if (v6 == v15)
    {
      id v7 = [(PXPhotoKitCollectionsDataSourceManager *)self _subCollectionActiveKeyAssetsFetchOperations];
      [v7 removeObjectForKey:v4];

      BOOL v8 = [v15 outputFetchResult];
      char v9 = [v15 outputOtherFetchResultsByAssetCollection];
      [(PXPhotoKitCollectionsDataSourceManager *)self _updateKeyAssetsCacheForCollection:v4 withFetchResult:v8 otherFetchResultsByAssetCollection:v9];

      id v10 = [(PXPhotoKitCollectionsDataSourceManager *)self configuration];
      LODWORD(v9) = [v10 updateKeyAssetFetchesInBackground];

      if (v9) {
        [(PXPhotoKitCollectionsDataSourceManager *)self _updateDataSourceForChangeOnCollection:v4];
      }
    }
  }
  else
  {
    id v11 = [(PXPhotoKitCollectionsDataSourceManager *)self _subCollectionActiveCountFetchOperations];
    id v12 = [v11 objectForKeyedSubscript:v4];

    if (v12 == v15)
    {
      __int16 v13 = [(PXPhotoKitCollectionsDataSourceManager *)self _subCollectionActiveCountFetchOperations];
      [v13 removeObjectForKey:v4];

      uint64_t v14 = [v15 outputFetchResult];
      [(PXPhotoKitCollectionsDataSourceManager *)self _updateVisibleCountsForCollection:v4 withWithFetchResult:v14];
    }
  }
}

- (void)collectionFetchOperationDidBegin:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 collection];
  id v6 = [(PXPhotoKitCollectionsDataSourceManager *)self dataSourceManagerLog];
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, v4);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  char v9 = v6;
  id v10 = v9;
  if (isKindOfClass)
  {
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      id v11 = [v5 localizedTitle];
      int v13 = 138543362;
      uint64_t v14 = v11;
      id v12 = "FetchKeyAssetOperation";
LABEL_8:
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, v12, "%{public}@", (uint8_t *)&v13, 0xCu);
    }
  }
  else if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    id v11 = [v5 localizedTitle];
    int v13 = 138543362;
    uint64_t v14 = v11;
    id v12 = "FetchCollectionOperation";
    goto LABEL_8;
  }
}

- (void)_publishPendingCollectionChanges
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  self->_publishChangesScheduledOnRunLoop = 0;
  id v26 = [(PXPhotoKitCollectionsDataSourceManager *)self _newDataSource];
  uint64_t v25 = [off_1E5DA5568 changeDetailsWithNoChanges];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v4 = self->_pendingChangedCollections;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = [(PXPhotoKitCollectionsDataSourceManager *)self indexPathForCollection:*(void *)(*((void *)&v31 + 1) + 8 * i)];
        id v10 = v9;
        if (v9)
        {
          id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "section"));
          id v12 = [v3 objectForKeyedSubscript:v11];
          if (!v12)
          {
            id v12 = objc_alloc_init(MEMORY[0x1E4F28E60]);
            [v3 setObject:v12 forKeyedSubscript:v11];
          }
          objc_msgSend(v12, "addIndex:", objc_msgSend(v10, "item"));
        }
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v6);
  }

  int v13 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = v3;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * j);
        id v20 = objc_alloc((Class)off_1E5DA5568);
        int v21 = [v14 objectForKeyedSubscript:v19];
        BOOL v22 = (void *)[v20 initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:0 movesToIndexes:0 movesFromIndexes:0 changedIndexes:v21];
        [v13 setObject:v22 forKeyedSubscript:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v16);
  }

  unint64_t v23 = [(PXSectionedDataSourceManager *)self dataSource];
  v24 = -[PXSectionedDataSourceChangeDetails initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:]([PXCollectionsDataSourceChangeDetails alloc], "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", [v23 identifier], objc_msgSend(v26, "identifier"), v25, v13, 0);
  [(PXCollectionsDataSourceChangeDetails *)v24 setCountUpdateChange:1];
  [(PXSectionedDataSourceManager *)self setDataSource:v26 changeDetails:v24];
  [(NSMutableSet *)self->_pendingChangedCollections removeAllObjects];
  self->_lastPublishChangesTime = CFAbsoluteTimeGetCurrent();
}

- (void)_updateDataSourceForChangeOnCollection:(id)a3
{
  [(NSMutableSet *)self->_pendingChangedCollections addObject:a3];
  if (!self->_publishChangesScheduledOnRunLoop)
  {
    self->_publishChangesScheduledOnRunLoop = 1;
    double v4 = CFAbsoluteTimeGetCurrent() - self->_lastPublishChangesTime;
    if (v4 <= 0.0) {
      double v5 = 0.5;
    }
    else {
      double v5 = 0.5 - v4;
    }
    objc_initWeak(&location, self);
    double v6 = 100000000.0;
    if (v5 >= 0.1) {
      double v6 = v5 * 1000000000.0;
    }
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)v6);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __81__PXPhotoKitCollectionsDataSourceManager__updateDataSourceForChangeOnCollection___block_invoke;
    v8[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v9, &location);
    dispatch_after(v7, MEMORY[0x1E4F14428], v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __81__PXPhotoKitCollectionsDataSourceManager__updateDataSourceForChangeOnCollection___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = *MEMORY[0x1E4F1C3A0];
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [WeakRetained performSelectorOnMainThread:sel__publishPendingCollectionChanges withObject:0 waitUntilDone:0 modes:v2];
}

- (void)_updateKeyAssetsCacheForCollection:(id)a3 withFetchResult:(id)a4 otherFetchResultsByAssetCollection:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(PXPhotoKitCollectionsDataSourceManager *)self indexPathForCollection:v8];
  id v12 = (void *)v11;
  if (v9 && v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v13 = [(NSMutableDictionary *)self->_subCollectionKeyAssetFetchResultsCache objectForKeyedSubscript:v8];

      if (!v13) {
        [(NSMutableDictionary *)self->_subCollectionKeyAssetFetchResultsCache setObject:v9 forKeyedSubscript:v8];
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v23 = v12;
        id v14 = [(NSMutableDictionary *)self->_subCollectionKeyAssetFetchResultsCache objectForKeyedSubscript:v8];

        if (!v14) {
          [(NSMutableDictionary *)self->_subCollectionKeyAssetFetchResultsCache setObject:v9 forKeyedSubscript:v8];
        }
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v24 = v10;
        id v15 = v10;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v26 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * i);
              int v21 = [(NSMutableDictionary *)self->_subCollectionKeyAssetFetchResultsCache objectForKeyedSubscript:v20];

              if (!v21)
              {
                BOOL v22 = [v15 objectForKeyedSubscript:v20];
                [(NSMutableDictionary *)self->_subCollectionKeyAssetFetchResultsCache setObject:v22 forKeyedSubscript:v20];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
          }
          while (v17);
        }

        id v12 = v23;
        id v10 = v24;
      }
    }
  }
}

- (void)_enqueueFetchKeyAssetsOperationForCollection:(id)a3
{
  id v10 = a3;
  double v4 = [(PXPhotoKitCollectionsDataSourceManager *)self _subCollectionActiveKeyAssetsFetchOperations];
  double v5 = [v4 objectForKeyedSubscript:v10];

  if (v5)
  {
    [v5 cancel];
    double v6 = [(PXPhotoKitCollectionsDataSourceManager *)self _subCollectionActiveKeyAssetsFetchOperations];
    [v6 removeObjectForKey:v10];
  }
  dispatch_time_t v7 = +[PXCollectionFetchOperation fetchOperationWithCollection:v10 delegate:self];

  if (v7)
  {
    id v8 = [(PXPhotoKitCollectionsDataSourceManager *)self customFetchOptionsForCollection:v10];
    [v7 setFetchOptions:v8];
    [v7 setMaxKeyAssets:9];
    id v9 = [(PXPhotoKitCollectionsDataSourceManager *)self _subCollectionActiveKeyAssetsFetchOperations];
    [v9 setObject:v7 forKeyedSubscript:v10];

    [(NSOperationQueue *)self->_subCollectionKeyAssetsFetchOperationQueue addOperation:v7];
  }
}

- (void)_updateVisibleCountsForCollection:(id)a3 withWithFetchResult:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  dispatch_time_t v7 = [(PXPhotoKitCollectionsDataSourceManager *)self indexPathForCollection:v9];
  if (v7)
  {
    if (v6)
    {
      id v8 = [(NSMutableDictionary *)self->_subCollectionFetchResultsCache objectForKeyedSubscript:v9];

      if (!v8) {
        [(NSMutableDictionary *)self->_subCollectionFetchResultsCache setObject:v6 forKeyedSubscript:v9];
      }
    }
    [(PXPhotoKitCollectionsDataSourceManager *)self _updateDataSourceForChangeOnCollection:v9];
  }
}

- (void)_enqueueFetchCountsOperationForCollection:(id)a3
{
  id v10 = a3;
  double v4 = [(PXPhotoKitCollectionsDataSourceManager *)self _subCollectionActiveCountFetchOperations];
  double v5 = [v4 objectForKeyedSubscript:v10];

  if (v5)
  {
    [v5 cancel];
    id v6 = [(PXPhotoKitCollectionsDataSourceManager *)self _subCollectionActiveCountFetchOperations];
    [v6 removeObjectForKey:v10];
  }
  dispatch_time_t v7 = +[PXCollectionFetchOperation fetchOperationWithCollection:v10 delegate:self];

  if (v7)
  {
    id v8 = [(PXPhotoKitCollectionsDataSourceManager *)self customFetchOptionsForCollection:v10];
    [v7 setFetchOptions:v8];
    id v9 = [(PXPhotoKitCollectionsDataSourceManager *)self _subCollectionActiveCountFetchOperations];
    [v9 setObject:v7 forKeyedSubscript:v10];

    [(NSOperationQueue *)self->_subCollectionFetchOperationQueue addOperation:v7];
  }
}

- (BOOL)isBackgroundFetching
{
  if ([(NSOperationQueue *)self->_subCollectionFetchOperationQueue isSuspended]) {
    return ![(NSOperationQueue *)self->_subCollectionKeyAssetsFetchOperationQueue isSuspended];
  }
  else {
    return 1;
  }
}

- (void)pauseBackgroundFetching
{
  [(NSOperationQueue *)self->_subCollectionFetchOperationQueue setSuspended:1];
  subCollectionKeyAssetsFetchOperationQueue = self->_subCollectionKeyAssetsFetchOperationQueue;
  [(NSOperationQueue *)subCollectionKeyAssetsFetchOperationQueue setSuspended:1];
}

- (void)startBackgroundFetchingIfNeeded
{
  [(NSOperationQueue *)self->_subCollectionFetchOperationQueue setSuspended:0];
  subCollectionKeyAssetsFetchOperationQueue = self->_subCollectionKeyAssetsFetchOperationQueue;
  [(NSOperationQueue *)subCollectionKeyAssetsFetchOperationQueue setSuspended:0];
}

- (void)_cancelAllBackgroundFetches
{
  id v3 = [(PXPhotoKitCollectionsDataSourceManager *)self _subCollectionActiveCountFetchOperations];
  [v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_257_301163];

  double v4 = [(PXPhotoKitCollectionsDataSourceManager *)self _subCollectionActiveCountFetchOperations];
  [v4 removeAllObjects];

  double v5 = [(PXPhotoKitCollectionsDataSourceManager *)self _subCollectionActiveKeyAssetsFetchOperations];
  [v5 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_260_301164];

  id v6 = [(PXPhotoKitCollectionsDataSourceManager *)self _subCollectionActiveKeyAssetsFetchOperations];
  [v6 removeAllObjects];
}

uint64_t __69__PXPhotoKitCollectionsDataSourceManager__cancelAllBackgroundFetches__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 cancel];
}

uint64_t __69__PXPhotoKitCollectionsDataSourceManager__cancelAllBackgroundFetches__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 cancel];
}

- (void)_reloadAndRestartBackgroundFetchesIfNeeded
{
  [(NSMutableDictionary *)self->_subCollectionFetchResultsCache removeAllObjects];
  [(NSMutableDictionary *)self->_subCollectionKeyAssetFetchResultsCache removeAllObjects];
  if (self->_preparedBackgroundFetching) {
    [(PXPhotoKitCollectionsDataSourceManager *)self _cancelAllBackgroundFetches];
  }
  if (self->__collectionsFetchResultBySection) {
    [(PXPhotoKitCollectionsDataSourceManager *)self _updateFilteredCollectionsFetchResults];
  }
  if (self->_preparedBackgroundFetching) {
    [(PXPhotoKitCollectionsDataSourceManager *)self _prepareBackgroundFetchingIfNeeded];
  }
  id v9 = [(PXSectionedDataSourceManager *)self dataSourceIfExists];
  if (v9)
  {
    id v3 = [(PXPhotoKitCollectionsDataSourceManager *)self _newDataSource];
    double v4 = [PXCollectionsDataSourceChangeDetails alloc];
    uint64_t v5 = [v9 identifier];
    uint64_t v6 = [v3 identifier];
    dispatch_time_t v7 = [off_1E5DA5568 changeDetailsWithNoIncrementalChanges];
    id v8 = [(PXSectionedDataSourceChangeDetails *)v4 initWithFromDataSourceIdentifier:v5 toDataSourceIdentifier:v6 sectionChanges:v7 itemChangeDetailsBySection:0 subitemChangeDetailsByItemBySection:0];

    [(PXSectionedDataSourceManager *)self setDataSource:v3 changeDetails:v8];
  }
}

- (void)_prepareBackgroundFetchingIfNeededForCollection:(id)a3
{
  id v4 = a3;
  if (-[PXPhotoKitCollectionsDataSourceManager _needsFetchResultForCollection:](self, "_needsFetchResultForCollection:"))
  {
    [(PXPhotoKitCollectionsDataSourceManager *)self _enqueueFetchCountsOperationForCollection:v4];
  }
  if ([(PXPhotoKitCollectionsDataSourceManager *)self _needsKeyAssetsFetchResultForCollection:v4])
  {
    [(PXPhotoKitCollectionsDataSourceManager *)self _enqueueFetchKeyAssetsOperationForCollection:v4];
  }
}

- (void)_prepareBackgroundFetchingIfNeeded
{
  id v3 = [(PXPhotoKitCollectionsDataSourceManager *)self configuration];
  if (![v3 skipKeyAssetFetches] || (objc_msgSend(v3, "skipAssetFetches") & 1) == 0)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __76__PXPhotoKitCollectionsDataSourceManager__prepareBackgroundFetchingIfNeeded__block_invoke;
    v4[3] = &unk_1E5DD2F58;
    v4[4] = self;
    [(PXPhotoKitCollectionsDataSourceManager *)self _enumerateAllPhotoKitCollectionsUsingBlock:v4];
  }
}

uint64_t __76__PXPhotoKitCollectionsDataSourceManager__prepareBackgroundFetchingIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _prepareBackgroundFetchingIfNeededForCollection:a2];
}

- (void)prepareBackgroundFetchingIfNeeded
{
  if (!self->_preparedBackgroundFetching)
  {
    self->_preparedBackgroundFetching = 1;
    [(PXPhotoKitCollectionsDataSourceManager *)self _prepareBackgroundFetchingIfNeeded];
  }
}

- (void)_recursivelyCollectCollectionsIn:(id)a3 fetchResult:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v12 canContainCollections])
        {
          int v13 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v12 options:0];
          [(PXPhotoKitCollectionsDataSourceManager *)self _recursivelyCollectCollectionsIn:v6 fetchResult:v13];
        }
        else if ([v12 canContainAssets])
        {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)_recursivelyEnumerateAssetCollectionsInFetchResult:(id)a3 block:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  BOOL v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v8);
      }
      id v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
      if ([v12 canContainCollections])
      {
        int v13 = [(PXPhotoKitCollectionsDataSourceManager *)self fetchResultForSubCollection:v12];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __99__PXPhotoKitCollectionsDataSourceManager__recursivelyEnumerateAssetCollectionsInFetchResult_block___block_invoke;
        v14[3] = &unk_1E5DD2F30;
        id v15 = v7;
        long long v16 = &v21;
        [(PXPhotoKitCollectionsDataSourceManager *)self _recursivelyEnumerateAssetCollectionsInFetchResult:v13 block:v14];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          (*((void (**)(id, void *, uint64_t *))v7 + 2))(v7, v12, v22 + 3);
        }
      }
      if (*((unsigned char *)v22 + 24)) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v21, 8);
}

uint64_t __99__PXPhotoKitCollectionsDataSourceManager__recursivelyEnumerateAssetCollectionsInFetchResult_block___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (id)indexPathForCollection:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_collectionIndexPathByCollection objectForKeyedSubscript:a3];
}

- (BOOL)_containsAnyAlbumsWithAssets:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v5 = [(PXPhotoKitCollectionsDataSourceManager *)self fetchResultForSubCollection:v4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__PXPhotoKitCollectionsDataSourceManager__containsAnyAlbumsWithAssets___block_invoke;
  v7[3] = &unk_1E5DD2F08;
  v7[4] = self;
  v7[5] = &v8;
  [(PXPhotoKitCollectionsDataSourceManager *)self _recursivelyEnumerateAssetCollectionsInFetchResult:v5 block:v7];
  LOBYTE(self) = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)self;
}

uint64_t __71__PXPhotoKitCollectionsDataSourceManager__containsAnyAlbumsWithAssets___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) _containsAnyAssets:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)_containsAnyAssets:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXPhotoKitCollectionsDataSourceManager *)self libraryFilterState];
  int v6 = [v5 isFiltering];

  if (!v6)
  {
    int64_t v9 = [(PXPhotoKitCollectionsDataSourceManager *)self estimatedCountForAssetCollection:v4];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v8 = v9 > 0;
      goto LABEL_9;
    }
    uint64_t v10 = [(NSMutableDictionary *)self->_subCollectionKeyAssetFetchResultsCache objectForKeyedSubscript:v4];
    if (![v10 count])
    {
      char v11 = [(NSMutableDictionary *)self->_subCollectionFetchResultsCache objectForKeyedSubscript:v4];
      if (![v11 count])
      {
        BOOL v8 = 1;
        int v13 = [(PXPhotoKitCollectionsDataSourceManager *)self _keyAssetFetchResultForSubCollection:v4 fetchIfNeeded:1];
        uint64_t v14 = [v13 count];

        if (v14) {
          goto LABEL_9;
        }
        if ((objc_msgSend(v4, "px_isHiddenSmartAlbum") & 1) == 0
          && (objc_msgSend(v4, "px_isRecoveredSmartAlbum") & 1) == 0
          && !objc_msgSend(v4, "px_isImportSessionCollection"))
        {
          BOOL v8 = 0;
          goto LABEL_9;
        }
        goto LABEL_2;
      }
    }
    BOOL v8 = 1;
    goto LABEL_9;
  }
LABEL_2:
  id v7 = [(PXPhotoKitCollectionsDataSourceManager *)self fetchResultForSubCollection:v4];
  BOOL v8 = [v7 count] != 0;

LABEL_9:
  return v8;
}

- (int64_t)estimatedCountForAssetCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXPhotoKitCollectionsDataSourceManager *)self libraryFilterState];
  int v6 = [v5 sharingFilter];

  if (v6 == 2)
  {
    id v7 = [(PXPhotoKitCollectionsDataSourceManager *)self configuration];
    int64_t v8 = +[PXPhotoKitCollectionsDataSource estimatedCountForAssetCollection:v4 withConfiguration:v7];
  }
  else
  {
    int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (void)_enumerateAllPhotoKitCollectionsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXPhotoKitCollectionsDataSourceManager *)self _collectionsFetchResultBySection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__PXPhotoKitCollectionsDataSourceManager__enumerateAllPhotoKitCollectionsUsingBlock___block_invoke;
  v7[3] = &unk_1E5DD2EE0;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

uint64_t __85__PXPhotoKitCollectionsDataSourceManager__enumerateAllPhotoKitCollectionsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 enumerateObjectsUsingBlock:*(void *)(a1 + 32)];
}

- (void)_updateCollectionIndexMappingForFilteredFetchResults
{
  [(NSMutableDictionary *)self->_collectionIndexPathByCollection removeAllObjects];
  if (self->_collectionsFetchResult)
  {
    id v3 = [(PXPhotoKitCollectionsDataSourceManager *)self _collectionsFetchResultBySection];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __94__PXPhotoKitCollectionsDataSourceManager__updateCollectionIndexMappingForFilteredFetchResults__block_invoke;
    v4[3] = &unk_1E5DD2EB8;
    v4[4] = self;
    [v3 enumerateObjectsUsingBlock:v4];
  }
}

uint64_t __94__PXPhotoKitCollectionsDataSourceManager__updateCollectionIndexMappingForFilteredFetchResults__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __94__PXPhotoKitCollectionsDataSourceManager__updateCollectionIndexMappingForFilteredFetchResults__block_invoke_2;
  v4[3] = &unk_1E5DD2E90;
  v4[4] = *(void *)(a1 + 32);
  void v4[5] = a3;
  return [a2 enumerateObjectsUsingBlock:v4];
}

void __94__PXPhotoKitCollectionsDataSourceManager__updateCollectionIndexMappingForFilteredFetchResults__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a2;
  id v8 = [v5 indexPathForItem:a3 inSection:v6];
  [*(id *)(*(void *)(a1 + 32) + 168) setObject:v8 forKeyedSubscript:v7];
}

- (BOOL)_shouldIncludeCollection:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self->_configuration collectionTypesToInclude];
  unint64_t v7 = [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self->_configuration assetTypesToInclude];
  BOOL v8 = [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self->_configuration shouldExcludePrivacySensitiveAlbums];
  int64_t v9 = [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self->_configuration assetsFilterPredicate];
  uint64_t v10 = [(PXPhotoKitCollectionsDataSourceManager *)self collectionFilterPredicate];
  char v11 = v10;
  if (v10)
  {
    LOBYTE(v12) = 0;
    if (![v10 evaluateWithObject:v5] || !v6) {
      goto LABEL_89;
    }
  }
  else if (!v6)
  {
    goto LABEL_86;
  }
  if ((objc_msgSend(v5, "px_isUnableToUploadSmartAlbum") & 1) != 0
    || (objc_msgSend(v5, "px_isRecoveredSmartAlbum") & 1) != 0)
  {
    int v13 = 1;
  }
  else
  {
    if (objc_msgSend(v5, "px_isAllLibraryDuplicatesSmartAlbum")) {
      int v13 = [(PXPhotoKitCollectionsDataSourceManager *)self isInitialDuplicateDetectorProcessingCompleted];
    }
    else {
      int v13 = 0;
    }
    if (v6 == -1 && v7 == -1 && v13 == 0) {
      goto LABEL_88;
    }
  }
  if (([v5 isTransient] & 1) == 0
    && (objc_msgSend(v5, "px_isSmartAlbum") & 1) == 0
    && (objc_msgSend(v5, "px_isSmartFolder") & 1) == 0
    && !objc_msgSend(v5, "px_isMyPhotoStreamAlbum"))
  {
    if (objc_msgSend(v5, "px_isUserCreated"))
    {
      if ((~v6 & 0x4C0000) == 0)
      {
LABEL_14:
        LODWORD(v12) = 1;
        if (!v8) {
          goto LABEL_75;
        }
        goto LABEL_74;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = (v6 >> 18) & 1;
        goto LABEL_73;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = (v6 >> 19) & 1;
        goto LABEL_73;
      }
    }
    else
    {
      if ((objc_msgSend(v5, "px_isMacSyncedAlbum") & 1) != 0
        || (objc_msgSend(v5, "px_isMacSyncedFacesFolder") & 1) != 0
        || objc_msgSend(v5, "px_isMacSyncedEventsFolder"))
      {
        uint64_t v12 = (v6 >> 21) & 1;
        if (!v8) {
          goto LABEL_75;
        }
        goto LABEL_74;
      }
      if (objc_msgSend(v5, "px_isSharedAlbum"))
      {
        uint64_t v12 = (v6 >> 20) & 1;
        goto LABEL_73;
      }
    }
    goto LABEL_98;
  }
  if ((~v6 & 0x1DFDCLL) == 0) {
    goto LABEL_14;
  }
  if (objc_msgSend(v5, "px_isAllPhotosSmartAlbum"))
  {
    uint64_t v12 = (v6 >> 2) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isRecentlyAddedSmartAlbum"))
  {
    uint64_t v12 = (v6 >> 3) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isFavoritesSmartAlbum"))
  {
    uint64_t v12 = (v6 >> 4) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isRecentsSmartAlbum"))
  {
    uint64_t v12 = (v6 >> 11) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isRecentlyEditedSmartAlbum"))
  {
    uint64_t v12 = (v6 >> 12) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isPlacesSmartAlbum"))
  {
    uint64_t v12 = (v6 >> 6) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isMediaTypeSmartAlbum"))
  {
    uint64_t v12 = (uint64_t)v5;
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_54:
        uint64_t v16 = [(id)v12 assetCollectionSubtype];
        if (v9
          || (v7 & 2) != 0
          || (unint64_t)(v16 - 202) > 6
          || ((1 << (v16 + 54)) & 0x45) == 0)
        {
          uint64_t v17 = (v6 >> 7) & 1;
        }
        else
        {
          LODWORD(v17) = 0;
        }

        LODWORD(v12) = v17;
        if (!v8) {
          goto LABEL_75;
        }
        goto LABEL_74;
      }
      uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v20 = (objc_class *)objc_opt_class();
      BOOL v22 = NSStringFromClass(v20);
      uint64_t v21 = objc_msgSend((id)v12, "px_descriptionForAssertionMessage");
      [v23 handleFailureInMethod:a2, self, @"PXPhotoKitCollectionsDataSourceManager.m", 522, @"%@ should be an instance inheriting from %@, but it is %@", @"collection", v22, v21 object file lineNumber description];
    }
    else
    {
      uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v19 = (objc_class *)objc_opt_class();
      BOOL v22 = NSStringFromClass(v19);
      [v23 handleFailureInMethod:a2, self, @"PXPhotoKitCollectionsDataSourceManager.m", 522, @"%@ should be an instance inheriting from %@, but it is nil", @"collection", v22 object file lineNumber description];
    }

    goto LABEL_54;
  }
  if (objc_msgSend(v5, "px_isMyPhotoStreamAlbum"))
  {
    uint64_t v12 = (v6 >> 10) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isHiddenSmartAlbum"))
  {
    uint64_t v12 = (v6 >> 8) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isRecentlyDeletedSmartAlbum"))
  {
    uint64_t v12 = (v6 >> 9) & 1;
    goto LABEL_73;
  }
  if ((objc_msgSend(v5, "px_isMacSyncedFacesFolder") & 1) != 0
    || objc_msgSend(v5, "px_isMacSyncedEventsFolder"))
  {
    uint64_t v12 = (v6 >> 21) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isUserCreated"))
  {
    uint64_t v12 = (v6 >> 22) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isImportSessionCollection"))
  {
    uint64_t v12 = (v6 >> 14) & 1;
    goto LABEL_73;
  }
  if (objc_msgSend(v5, "px_isUnableToUploadSmartAlbum"))
  {
    uint64_t v12 = (v6 >> 15) & 1;
    goto LABEL_73;
  }
  if (!objc_msgSend(v5, "px_isAllLibraryDuplicatesSmartAlbum"))
  {
LABEL_98:
    LODWORD(v12) = 0;
    if (!v8) {
      goto LABEL_75;
    }
    goto LABEL_74;
  }
  uint64_t v12 = (v6 >> 16) & 1;
LABEL_73:
  if (v8) {
LABEL_74:
  }
    LODWORD(v12) = v12 & ~objc_msgSend(v5, "px_isPrivacySensitiveAlbum");
LABEL_75:
  if ((v9 || v7 != -1) && (objc_msgSend(v5, "px_isRecentsSmartAlbum") & 1) == 0) {
    v13 |= objc_msgSend(v5, "px_isFavoritesSmartAlbum") ^ 1;
  }
  if (v12 && ((v13 ^ 1) & (v6 >> 1) & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(PXPhotoKitCollectionsDataSourceManager *)self _containsAnyAssets:v5])
      {
LABEL_87:
        self->_isPhotoLibraryEmpty = 0;
LABEL_88:
        LOBYTE(v12) = 1;
        goto LABEL_89;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || [(PXPhotoKitCollectionsDataSourceManager *)self _containsAnyAlbumsWithAssets:v5])
      {
        goto LABEL_87;
      }
    }
LABEL_86:
    LOBYTE(v12) = 0;
  }
LABEL_89:

  return v12;
}

- (BOOL)isInitialDuplicateDetectorProcessingCompleted
{
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  id v4 = v3;
  if (!self->_lastDuplicatesProcessingCheckDate || (objc_msgSend(v3, "timeIntervalSinceDate:"), v5 > 300.0))
  {
    self->_BOOL isInitialDuplicateDetectorProcessingCompleted = [(PHPhotoLibrary *)self->_photoLibrary isInitialDuplicateDetectorProcessingCompleted];
    objc_storeStrong((id *)&self->_lastDuplicatesProcessingCheckDate, v4);
  }
  BOOL isInitialDuplicateDetectorProcessingCompleted = self->_isInitialDuplicateDetectorProcessingCompleted;

  return isInitialDuplicateDetectorProcessingCompleted;
}

- (id)_filterFetchResult:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self->_configuration separateSectionsForSmartAndUserCollections];
  unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    id v9 = (id)v8;
  }
  else
  {
    id v9 = v6;
    uint64_t v8 = 0;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__PXPhotoKitCollectionsDataSourceManager__filterFetchResult___block_invoke;
  v19[3] = &unk_1E5DD2E18;
  v19[4] = self;
  id v10 = v7;
  id v20 = v10;
  id v11 = v9;
  id v21 = v11;
  [v4 enumerateObjectsUsingBlock:v19];
  uint64_t v12 = [(PXPhotoKitCollectionsDataSourceManager *)self _virtualCollections];
  if ([v12 count] && !-[PXPhotoKitCollectionsDataSourceManager _isEmpty](self, "_isEmpty"))
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61__PXPhotoKitCollectionsDataSourceManager__filterFetchResult___block_invoke_2;
    v15[3] = &unk_1E5DD2E68;
    id v16 = v11;
    id v17 = v12;
    long long v18 = self;
    [v17 enumerateObjectsUsingBlock:v15];
  }
  int v13 = (void *)[objc_alloc((Class)off_1E5DA9668) initWithFirst:v8 second:v10];

  return v13;
}

void __61__PXPhotoKitCollectionsDataSourceManager__filterFetchResult___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldIncludeCollection:"))
  {
    int v3 = objc_msgSend(v5, "px_isUserCreated");
    uint64_t v4 = 48;
    if (v3) {
      uint64_t v4 = 40;
    }
    [*(id *)(a1 + v4) addObject:v5];
  }
}

void __61__PXPhotoKitCollectionsDataSourceManager__filterFetchResult___block_invoke_2(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 count];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __61__PXPhotoKitCollectionsDataSourceManager__filterFetchResult___block_invoke_3;
  uint64_t v12 = &unk_1E5DD2E40;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v13 = v6;
  uint64_t v14 = v7;
  uint64_t v8 = objc_msgSend(v3, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, v5, 1024, &v9);
  objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v4, v8, v9, v10, v11, v12);
}

uint64_t __61__PXPhotoKitCollectionsDataSourceManager__filterFetchResult___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  if ([v6 containsObject:v7]) {
    uint64_t v8 = [*(id *)(a1 + 40) _fixedOrderPriorityForVirtualCollection:v7];
  }
  else {
    uint64_t v8 = [v7 collectionFixedOrderPriority];
  }
  unint64_t v9 = v8;

  if ([*(id *)(a1 + 32) containsObject:v5]) {
    unint64_t v10 = [*(id *)(a1 + 40) _fixedOrderPriorityForVirtualCollection:v5];
  }
  else {
    unint64_t v10 = [v5 collectionFixedOrderPriority];
  }
  if (v9 < v10) {
    uint64_t v11 = -1;
  }
  else {
    uint64_t v11 = v9 > v10;
  }

  return v11;
}

- (id)_getSectionedCollectionListAndFetchResultsFromFetchResult:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    id v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = [(PXPhotoKitCollectionsDataSourceManager *)self _filterFetchResult:v4];
    uint64_t v8 = [v7 first];
    if (v8)
    {
      unint64_t v9 = (void *)MEMORY[0x1E4F39008];
      unint64_t v10 = [v4 photoLibrary];
      uint64_t v11 = [v9 transientCollectionListWithCollections:v8 title:0 identifier:0 photoLibrary:v10];

      uint64_t v12 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v11 options:0];
      [v5 addObject:v11];
      [v6 addObject:v12];
    }
    id v13 = [v7 second];
    BOOL v14 = [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self->_configuration separateSectionsForSmartAndUserCollections];
    id v15 = &stru_1F00B0030;
    if (v14) {
      id v15 = @"PXUserCollectionsSectionTitle";
    }
    id v16 = (void *)MEMORY[0x1E4F39008];
    id v17 = v15;
    long long v18 = [v4 photoLibrary];
    long long v19 = [v16 transientCollectionListWithCollections:v13 title:v17 identifier:0 photoLibrary:v18];

    id v20 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v19 options:0];
    [v5 addObject:v19];
    [v6 addObject:v20];
    id v21 = (void *)[objc_alloc((Class)off_1E5DA9668) initWithFirst:v5 second:v6];
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (BOOL)_isEmpty
{
  if (!self->_isPhotoLibraryEmpty) {
    return 0;
  }
  int v3 = [(PHPhotoLibrary *)self->_photoLibrary px_standardLibrarySpecificFetchOptions];
  [v3 setFetchLimit:1];
  [v3 setIncludeAllBurstAssets:1];
  [v3 setIncludeAssetSourceTypes:7];
  [v3 setWantsIncrementalChangeDetails:0];
  id v4 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v3];
  self->_isPhotoLibraryEmpty = [v4 count] == 0;

  return self->_isPhotoLibraryEmpty;
}

- (unint64_t)_fixedOrderPriorityForVirtualCollection:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "px_isPeopleVirtualCollection"))
  {
    unint64_t v4 = 40;
  }
  else if (objc_msgSend(v3, "px_isMemoriesVirtualCollection"))
  {
    unint64_t v4 = 53;
  }
  else
  {
    unint64_t v4 = -1;
  }

  return v4;
}

- (NSArray)_virtualCollections
{
  virtualCollections = self->__virtualCollections;
  if (!virtualCollections)
  {
    unint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    if ([(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self->_configuration includePeopleAlbum])
    {
      id v5 = [(PHPhotoLibrary *)self->_photoLibrary px_virtualCollections];
      id v6 = [v5 peopleCollection];
      [(NSArray *)v4 addObject:v6];
    }
    id v7 = self->__virtualCollections;
    self->__virtualCollections = v4;

    virtualCollections = self->__virtualCollections;
  }
  return virtualCollections;
}

- (id)customFetchOptionsForCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotoKitCollectionsDataSourceManager *)self configuration];
  id v6 = [v5 customFetchOptionsForCollection:v4];

  if ([v6 includeGuestAssets])
  {
    id v7 = +[PXUserDefaults standardUserDefaults];
    uint64_t v8 = [v7 includeSharedWithYou];
    objc_msgSend(v6, "setIncludeGuestAssets:", objc_msgSend(v8, "BOOLValue"));
  }
  else
  {
    [v6 setIncludeGuestAssets:0];
  }
  if ((objc_msgSend(v4, "px_isSharedAlbum") & 1) == 0)
  {
    unint64_t v9 = [(PXPhotoKitCollectionsDataSourceManager *)self libraryFilterState];
    objc_msgSend(v6, "setSharingFilter:", objc_msgSend(v9, "sharingFilter"));
  }
  return v6;
}

- (id)createInitialDataSource
{
  id v2 = [(PXPhotoKitCollectionsDataSourceManager *)self _newDataSource];
  return v2;
}

- (void)_updateFilteredCollectionsFetchResults
{
  id v5 = [(PXPhotoKitCollectionsDataSourceManager *)self _getSectionedCollectionListAndFetchResultsFromFetchResult:self->_collectionsFetchResult];
  id v3 = [v5 first];
  [(PXPhotoKitCollectionsDataSourceManager *)self _setCollectionListBySection:v3];

  id v4 = [v5 second];
  [(PXPhotoKitCollectionsDataSourceManager *)self _setCollectionsFetchResultBySection:v4];

  [(PXPhotoKitCollectionsDataSourceManager *)self _updateCollectionIndexMappingForFilteredFetchResults];
}

- (NSArray)_collectionsFetchResultBySection
{
  collectionsFetchResultBySection = self->__collectionsFetchResultBySection;
  if (!collectionsFetchResultBySection)
  {
    [(PXPhotoKitCollectionsDataSourceManager *)self _updateFilteredCollectionsFetchResults];
    collectionsFetchResultBySection = self->__collectionsFetchResultBySection;
  }
  return collectionsFetchResultBySection;
}

- (id)_newDataSource
{
  long long v18 = [(PXPhotoKitCollectionsDataSourceManager *)self _collectionsFetchResultBySection];
  subCollectionKeyAssetFetchResultsCache = self->_subCollectionKeyAssetFetchResultsCache;
  collectionIndexPathByCollection = self->_collectionIndexPathByCollection;
  id v5 = self->_subCollectionFetchResultsCache;
  id v17 = collectionIndexPathByCollection;
  id v6 = subCollectionKeyAssetFetchResultsCache;
  id v7 = [PXPhotoKitCollectionsDataSource alloc];
  uint64_t v8 = [(PXPhotoKitCollectionsDataSourceManager *)self collectionList];
  unint64_t v9 = [(PXPhotoKitCollectionsDataSourceManager *)self _collectionListBySection];
  unint64_t v10 = [(PXPhotoKitCollectionsDataSourceManager *)self _virtualCollections];
  collectionsFetchResult = self->_collectionsFetchResult;
  uint64_t v12 = [(PXPhotoKitCollectionsDataSourceManager *)self libraryFilterState];
  LOWORD(subCollectionKeyAssetFetchResultsCache) = [v12 sharingFilter];
  id v13 = [(PXPhotoKitCollectionsDataSourceManager *)self configuration];
  LOWORD(v16) = (_WORD)subCollectionKeyAssetFetchResultsCache;
  BOOL v14 = [(PXPhotoKitCollectionsDataSource *)v7 initWithRootCollectionList:v8 collectionListBySection:v9 collectionsFetchResultBySection:v18 keyAssetsFetchResultsByCollection:v6 collectionsIndexPathsByCollection:v17 itemFetchResultByCollection:v5 virtualCollections:v10 collectionsFetchResult:collectionsFetchResult sharingFilter:v16 dataSourceConfiguration:v13];

  return v14;
}

- (void)setDataSource:(id)a3 changeDetailsArray:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (self->_simulateNonIncrementalChanges && [v7 count])
  {
    id v13 = [v8 firstObject];
    uint64_t v14 = [v13 fromDataSourceIdentifier];
    id v15 = [v8 lastObject];
    uint64_t v16 = objc_msgSend(off_1E5DA8488, "changeDetailsWithoutIncrementalChangesFromDataSourceIdentifier:toDataSourceIdentifier:", v14, objc_msgSend(v15, "toDataSourceIdentifier"));
    v19[0] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];

    uint64_t v8 = (void *)v17;
  }
  if (self->_isChangeProcessingPaused)
  {
    if (self->_changesOccurredWhilePaused)
    {
      if (!v8) {
        goto LABEL_9;
      }
    }
    else
    {
      self->_changesOccurredWhilePaused = 1;
      unint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      changesDetailsWhilePaused = self->_changesDetailsWhilePaused;
      self->_changesDetailsWhilePaused = v9;

      if (!v8)
      {
LABEL_9:
        uint64_t v12 = self->_changesDetailsWhilePaused;
        self->_changesDetailsWhilePaused = 0;

        goto LABEL_11;
      }
    }
    uint64_t v11 = [(NSMutableArray *)self->_changesDetailsWhilePaused count];
    if ((unint64_t)([v8 count] + v11) <= self->_pausedChangeDetailsBufferLength)
    {
      [(NSMutableArray *)self->_changesDetailsWhilePaused addObjectsFromArray:v8];
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  v18.receiver = self;
  v18.super_class = (Class)PXPhotoKitCollectionsDataSourceManager;
  [(PXSectionedDataSourceManager *)&v18 setDataSource:v6 changeDetailsArray:v8];
LABEL_11:
}

- (void)setCollectionFilterPredicate:(id)a3
{
  id v7 = (NSPredicate *)a3;
  id v5 = self->_collectionFilterPredicate;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(NSPredicate *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_collectionFilterPredicate, a3);
      [(PXPhotoKitCollectionsDataSourceManager *)self _reloadAndRestartBackgroundFetchesIfNeeded];
    }
  }
}

- (void)setIsChangeProcessingPaused:(BOOL)a3
{
  if (self->_isChangeProcessingPaused != a3)
  {
    self->_isChangeProcessingPaused = a3;
    if (!a3 && self->_changesOccurredWhilePaused)
    {
      id v5 = [(PXPhotoKitCollectionsDataSourceManager *)self _newDataSource];
      [(PXPhotoKitCollectionsDataSourceManager *)self setDataSource:v5 changeDetailsArray:self->_changesDetailsWhilePaused];
      self->_changesOccurredWhilePaused = 0;
      changesDetailsWhilePaused = self->_changesDetailsWhilePaused;
      self->_changesDetailsWhilePaused = 0;
    }
  }
}

- (void)setChangeProcessingPaused:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  changeProcessingPausedReasons = self->_changeProcessingPausedReasons;
  id v10 = v6;
  if (!changeProcessingPausedReasons)
  {
    uint64_t v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    unint64_t v9 = self->_changeProcessingPausedReasons;
    self->_changeProcessingPausedReasons = v8;

    id v6 = v10;
    changeProcessingPausedReasons = self->_changeProcessingPausedReasons;
  }
  if (v4) {
    [(NSMutableSet *)changeProcessingPausedReasons addObject:v6];
  }
  else {
    [(NSMutableSet *)changeProcessingPausedReasons removeObject:v6];
  }
  [(PXPhotoKitCollectionsDataSourceManager *)self setIsChangeProcessingPaused:[(NSMutableSet *)self->_changeProcessingPausedReasons count] != 0];
}

- (NSString)description
{
  id v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  collectionList = self->_collectionList;
  id v7 = [(PXSectionedDataSourceManager *)self dataSourceIfExists];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p, collectionList:%@ dataSource:%@>", v5, self, collectionList, v7];

  return (NSString *)v8;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"IncludeSharedWithYou" context:PXUserDefaultsObservationContext_301127];
  [(PHPhotoLibrary *)self->_photoLibrary px_unregisterChangeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PXPhotoKitCollectionsDataSourceManager;
  [(PXPhotoKitCollectionsDataSourceManager *)&v4 dealloc];
}

- (void)_registerContentSyndicationConfigurationProviderChangeObserver
{
  id v3 = +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:self->_photoLibrary];
  contentSyndicationConfigurationProvider = self->_contentSyndicationConfigurationProvider;
  self->_contentSyndicationConfigurationProvider = v3;

  id v5 = self->_contentSyndicationConfigurationProvider;
  uint64_t v6 = PXContentSyndicationConfigurationObservationContext_301124;
  [(PXContentSyndicationConfigurationProvider *)v5 registerChangeObserver:self context:v6];
}

- (PXPhotoKitCollectionsDataSourceManager)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PXPhotoKitCollectionsDataSourceManager;
  uint64_t v6 = [(PXSectionedDataSourceManager *)&v45 init];
  id v7 = v6;
  if (v6)
  {
    v6->_isPhotoLibraryEmpty = 1;
    objc_storeStrong((id *)&v6->_configuration, a3);
    uint64_t v8 = [v5 collectionList];
    collectionList = v7->_collectionList;
    v7->_collectionList = (PHCollectionList *)v8;

    uint64_t v10 = [v5 collectionsFetchResult];
    collectionsFetchResult = v7->_collectionsFetchResult;
    v7->_collectionsFetchResult = (PHFetchResult *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    subCollectionKeyAssetFetchResultsCache = v7->_subCollectionKeyAssetFetchResultsCache;
    v7->_subCollectionKeyAssetFetchResultsCache = (NSMutableDictionary *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    subCollectionFetchResultsCache = v7->_subCollectionFetchResultsCache;
    v7->_subCollectionFetchResultsCache = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    collectionIndexPathByCollection = v7->_collectionIndexPathByCollection;
    v7->_collectionIndexPathByCollection = (NSMutableDictionary *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    subCollectionActiveCountFetchOperations = v7->__subCollectionActiveCountFetchOperations;
    v7->__subCollectionActiveCountFetchOperations = (NSMutableDictionary *)v18;

    id v20 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    subCollectionFetchOperationQueue = v7->_subCollectionFetchOperationQueue;
    v7->_subCollectionFetchOperationQueue = v20;

    [(NSOperationQueue *)v7->_subCollectionFetchOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v7->_subCollectionFetchOperationQueue setQualityOfService:25];
    [(NSOperationQueue *)v7->_subCollectionFetchOperationQueue setName:@"PXCollectionsDataSourceManager-subCollectionsFetchQueue"];
    BOOL v22 = v7->_subCollectionFetchOperationQueue;
    uint64_t v23 = +[PXPhotoKitCollectionsDataSourceManager sharedSubCollectionsFetchQueue];
    [(NSOperationQueue *)v22 setUnderlyingQueue:v23];

    [(NSOperationQueue *)v7->_subCollectionFetchOperationQueue setSuspended:1];
    uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
    subCollectionActiveKeyAssetsFetchOperations = v7->__subCollectionActiveKeyAssetsFetchOperations;
    v7->__subCollectionActiveKeyAssetsFetchOperations = (NSMutableDictionary *)v24;

    uint64_t v26 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    subCollectionKeyAssetsFetchOperationQueue = v7->_subCollectionKeyAssetsFetchOperationQueue;
    v7->_subCollectionKeyAssetsFetchOperationQueue = v26;

    [(NSOperationQueue *)v7->_subCollectionKeyAssetsFetchOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v7->_subCollectionKeyAssetsFetchOperationQueue setQualityOfService:17];
    [(NSOperationQueue *)v7->_subCollectionKeyAssetsFetchOperationQueue setName:@"PXCollectionsDataSourceManager-subCollectionsKeyAssetsFetchQueue"];
    long long v28 = v7->_subCollectionKeyAssetsFetchOperationQueue;
    long long v29 = +[PXPhotoKitCollectionsDataSourceManager sharedKeyAssetsFetchQueue];
    [(NSOperationQueue *)v28 setUnderlyingQueue:v29];

    [(NSOperationQueue *)v7->_subCollectionKeyAssetsFetchOperationQueue setSuspended:1];
    v7->_simulateNonIncrementalChanges = [v5 simulateNonIncrementalChanges];
    v7->_pausedChangeDetailsBufferLength = [v5 pausedChangeDetailsBufferLength];
    uint64_t v30 = [MEMORY[0x1E4F1CA80] set];
    changedSubCollections = v7->_changedSubCollections;
    v7->_changedSubCollections = (NSMutableSet *)v30;

    uint64_t v32 = [MEMORY[0x1E4F1CA80] set];
    pendingChangedCollections = v7->_pendingChangedCollections;
    v7->_pendingChangedCollections = (NSMutableSet *)v32;

    long long v34 = [(PHCollectionList *)v7->_collectionList photoLibrary];
    v35 = v34;
    if (!v34)
    {
      v35 = [(PHFetchResult *)v7->_collectionsFetchResult photoLibrary];
    }
    p_photoLibrary = (id *)&v7->_photoLibrary;
    objc_storeStrong((id *)&v7->_photoLibrary, v35);
    if (!v34) {

    }
    uint64_t v37 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v37 addObserver:v7 forKeyPath:@"IncludeSharedWithYou" options:0 context:PXUserDefaultsObservationContext_301127];
    id v38 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:*p_photoLibrary];
    uint64_t v39 = [[PXLibraryFilterState alloc] initWithSharedLibraryStatusProvider:v38];
    libraryFilterState = v7->_libraryFilterState;
    v7->_libraryFilterState = v39;

    [(PXLibraryFilterState *)v7->_libraryFilterState registerChangeObserver:v7 context:PXLibraryFilterStateObservationContext_301125];
    if (([v5 shouldIgnoreLibraryChanges] & 1) == 0) {
      objc_msgSend(*p_photoLibrary, "px_registerChangeObserver:", v7);
    }
    objc_initWeak(&location, v7);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __64__PXPhotoKitCollectionsDataSourceManager_initWithConfiguration___block_invoke;
    v42[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v43, &location);
    dispatch_async(MEMORY[0x1E4F14428], v42);
    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __64__PXPhotoKitCollectionsDataSourceManager_initWithConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _registerContentSyndicationConfigurationProviderChangeObserver];
}

+ (id)standardDataSourceManagerForCollectionList:(id)a3
{
  id v4 = a3;
  id v5 = [[PXPhotoKitCollectionsDataSourceManagerConfiguration alloc] initWithCollectionList:v4];

  uint64_t v6 = (void *)[objc_alloc((Class)a1) initWithConfiguration:v5];
  return v6;
}

+ (OS_dispatch_queue)sharedKeyAssetsFetchQueue
{
  if (sharedKeyAssetsFetchQueue_onceToken != -1) {
    dispatch_once(&sharedKeyAssetsFetchQueue_onceToken, &__block_literal_global_193_301222);
  }
  id v2 = (void *)sharedKeyAssetsFetchQueue_queue;
  return (OS_dispatch_queue *)v2;
}

void __67__PXPhotoKitCollectionsDataSourceManager_sharedKeyAssetsFetchQueue__block_invoke()
{
  os_log_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);

  dispatch_queue_t v1 = dispatch_queue_create("PXCollectionsDataSourceManager-subCollectionsKeyAssetsFetchQueue-shared", attr);
  id v2 = (void *)sharedKeyAssetsFetchQueue_queue;
  sharedKeyAssetsFetchQueue_queue = (uint64_t)v1;
}

+ (OS_dispatch_queue)sharedSubCollectionsFetchQueue
{
  if (sharedSubCollectionsFetchQueue_onceToken != -1) {
    dispatch_once(&sharedSubCollectionsFetchQueue_onceToken, &__block_literal_global_301225);
  }
  id v2 = (void *)sharedSubCollectionsFetchQueue_queue;
  return (OS_dispatch_queue *)v2;
}

void __72__PXPhotoKitCollectionsDataSourceManager_sharedSubCollectionsFetchQueue__block_invoke()
{
  os_log_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("PXCollectionsDataSourceManager-subCollectionsFetchQueue-shared", attr);
  id v2 = (void *)sharedSubCollectionsFetchQueue_queue;
  sharedSubCollectionsFetchQueue_queue = (uint64_t)v1;
}

@end
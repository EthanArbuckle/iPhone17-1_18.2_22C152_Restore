@interface PXPhotosDataSource
+ (OS_dispatch_group)backgroundFetchingGroup;
+ (OS_dispatch_queue)sharedPrefetchQueue;
+ (id)_curationSharedBackgroundQueue;
+ (int64_t)limitedInitialFetchCountLimit;
+ (void)waitForAllBackgroundFetchingToFinish;
- (BOOL)_addResultTuple:(id)a3 forAssetCollection:(id)a4 preparedResultRecord:(id)a5 toMutableResultRecord:(id)a6;
- (BOOL)_allSectionsConsideredAccurate;
- (BOOL)_areFiltersDisabledForAssetCollection:(id)a3;
- (BOOL)_areSecondaryFetchesEnabled;
- (BOOL)_forceAccurateSection:(int64_t)a3 andNumberOfSurroundingSectionsWithContent:(int64_t)a4;
- (BOOL)_isFiltering;
- (BOOL)_isResultTupleApplicable:(id)a3 forAssetCollection:(id)a4;
- (BOOL)_reverseSortOrderForAssetCollection:(id)a3;
- (BOOL)allowNextChangeDeliveryOnAllRunLoopModes;
- (BOOL)allowSlowFetchesOnClientQueue;
- (BOOL)canIncludeUnsavedSyndicatedAssets;
- (BOOL)containsMultipleAssets;
- (BOOL)forceAccurateAllSectionsIfNeeded;
- (BOOL)forceAccurateAssetCollectionsIfNeeded:(id)a3 reloadChanges:(BOOL)a4;
- (BOOL)forceAccurateIndexPath:(id)a3 andAssetsBeforeAndAfter:(int64_t)a4;
- (BOOL)forceAccurateSection:(int64_t)a3 andSectionsBeforeAndAfter:(int64_t)a4;
- (BOOL)forceAccurateSectionsIfNeeded:(id)a3;
- (BOOL)forceAccurateSectionsIfNeeded:(id)a3 reloadChanges:(BOOL)a4;
- (BOOL)hasCurationForAssetCollection:(id)a3;
- (BOOL)ignoreSharedLibraryFilters;
- (BOOL)includeAllBurstAssets;
- (BOOL)includeOthersInSocialGroupAssets;
- (BOOL)isAssetAtIndexPathPartOfCuratedSet:(PXSimpleIndexPath *)a3;
- (BOOL)isBackgroundFetching;
- (BOOL)isCuratedAssetsEmptyForAssetCollection:(id)a3;
- (BOOL)isCuratedAssetsFutilelyForAssetCollection:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isImmutable;
- (BOOL)isSectionConsideredAccurate:(int64_t)a3;
- (BOOL)reverseSortOrder;
- (BOOL)supportsCurationToggling;
- (BOOL)supportsDynamicBackgroundFetching;
- (BOOL)wantsCurationByDefault;
- (BOOL)wantsCurationForAssetCollection:(id)a3;
- (BOOL)wantsCurationForFirstAssetCollection;
- (NSArray)filterPersons;
- (NSArray)sortDescriptors;
- (NSPredicate)basePredicate;
- (NSPredicate)filterPredicate;
- (NSSet)allowedOIDs;
- (NSSet)allowedUUIDs;
- (NSString)description;
- (OS_dispatch_queue)clientQueue;
- (OS_os_log)dataSourceLog;
- (PHAsset)referenceAsset;
- (PHAssetCollection)containerAssetCollection;
- (PHCollection)containerCollection;
- (PHFetchResult)collectionListFetchResult;
- (PHFetchResult)emptyAssetsFetchResult;
- (PHPhotoLibrary)photoLibrary;
- (PHSocialGroup)filterSocialGroup;
- (PXLibraryFilterState)libraryFilterState;
- (PXPhotosAssetsFetcher)fetcher;
- (PXPhotosDataSource)initWithPhotosDataSource:(id)a3 options:(unint64_t)a4;
- (PXPhotosDataSource)initWithPhotosDataSourceConfiguration:(id)a3;
- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider;
- (double)weightForAsset:(id)a3;
- (id)_allowedOIDsForAssetCollection:(id)a3;
- (id)_allowedUUIDsForAssetCollection:(id)a3;
- (id)_assetContainerForAssetCollection:(id)a3;
- (id)_assetOidsByAssetCollectionForAssetsAtIndexPathsInSet:(id)a3;
- (id)_assetsForAssetCollection:(id)a3;
- (id)_closestIndexPathToIndexPath:(id)a3;
- (id)_createDataSourceWithAssetsCollections:(id)a3 existingAssetCollectionFetchResults:(id)a4;
- (id)_createResultRecordForAssetCollection:(id)a3;
- (id)_fetchAssetsStartingAtIndexPath:(id)a3;
- (id)_fetchTupleForAssetCollection:(id)a3 calledOnClientQueue:(BOOL)a4 isLimitedInitialFetch:(BOOL)a5;
- (id)_fetcherConfigurationForAssetCollection:(id)a3 useCase:(int64_t)a4 isLimitedInitialFetch:(BOOL)a5;
- (id)_filterPredicateForAssetCollection:(id)a3;
- (id)_finalFilterPredicateForAssetCollection:(id)a3;
- (id)_inaccurateAssetCollections;
- (id)_inclusionPredicateForAssetCollection:(id)a3;
- (id)_indexPathForAssetWithUUID:(id)a3 orBurstIdentifier:(id)a4 orSyndicationIdentifier:(id)a5 hintIndexPath:(id)a6 hintCollections:(id)a7;
- (id)_keyAssetsForAssetCollection:(id)a3;
- (id)_mutableResultRecordForAssetCollection:(id)a3;
- (id)_observerInterestingAssetReferences;
- (id)_resultRecordForAssetCollection:(id)a3;
- (id)_sectionCache;
- (id)approximateAssetsAtIndexPaths:(id)a3;
- (id)assetAtIndexPath:(id)a3;
- (id)assetAtSimpleIndexPath:(PXSimpleIndexPath *)a3;
- (id)assetCollectionForSection:(int64_t)a3;
- (id)assetContainerProvider;
- (id)assetReferenceAtIndexPath:(id)a3;
- (id)assetReferenceForAsset:(id)a3 containedInAssetCollectionWithType:(int64_t)a4;
- (id)assetsAtIndexPaths:(id)a3;
- (id)assetsInSection:(int64_t)a3;
- (id)assetsStartingAtIndexPath:(id)a3;
- (id)container;
- (id)createDataSourceWithAssetsAtIndexPaths:(id)a3;
- (id)createDataSourceWithAssetsInSectionOfAsset:(id)a3 usingNewTransientAssetCollection:(BOOL)a4;
- (id)curatedAssetsForAssetCollection:(id)a3;
- (id)curatedAssetsInSection:(int64_t)a3;
- (id)facesAtSimpleIndexPath:(PXSimpleIndexPath *)a3;
- (id)fetchResultWithAssetsAtIndexPaths:(id)a3;
- (id)fetchResultWithAssetsInSections:(id)a3;
- (id)fetchResultsByAssetCollection;
- (id)firstAssetCollection;
- (id)immutableCopy;
- (id)indexPathForAsset:(id)a3 hintIndexPath:(id)a4 hintCollection:(id)a5;
- (id)indexPathForAsset:(id)a3 hintIndexPath:(id)a4 hintCollections:(id)a5;
- (id)indexPathForAsset:(id)a3 inCollection:(id)a4;
- (id)indexPathForAssetReference:(id)a3;
- (id)indexPathForAssetWithUUID:(id)a3 orBurstIdentifier:(id)a4 hintIndexPath:(id)a5 hintCollection:(id)a6;
- (id)indexPathForAssetWithUUID:(id)a3 orSyndicationIdentifier:(id)a4 hintIndexPath:(id)a5 hintCollection:(id)a6;
- (id)indexPathForFirstAsset;
- (id)indexPathForLastAsset;
- (id)infoForAssetCollection:(id)a3;
- (id)keyAssetsInSection:(int64_t)a3;
- (id)lastAssetCollection;
- (id)pauseChangeDeliveryAndBackgroundLoadingWithTimeout:(double)a3 identifier:(id)a4;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (id)sectionsForAssetCollections:(id)a3;
- (id)uncuratedAssetsForAssetCollection:(id)a3;
- (id)uncuratedAssetsInSection:(int64_t)a3;
- (int64_t)_nextBackgroundFetchId;
- (int64_t)backgroundFetchOriginSection;
- (int64_t)curationLength;
- (int64_t)estimatedAssetsCountWithEnrichmentState:(unsigned __int16)a3;
- (int64_t)estimatedOtherCount;
- (int64_t)estimatedPhotosCount;
- (int64_t)estimatedVideosCount;
- (int64_t)indexForAsset:(id)a3 inCollection:(id)a4 hintIndex:(int64_t)a5;
- (int64_t)keyAssetIndexInSection:(int64_t)a3;
- (int64_t)libraryFilter;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfSectionsWithEnrichmentState:(unsigned __int16)a3;
- (int64_t)versionIdentifier;
- (unint64_t)_assetCollectionFetchStatus:(id)a3;
- (unint64_t)_cachedSectionForAssetCollection:(id)a3;
- (unint64_t)_previousCollectionsCount;
- (unint64_t)fetchLimit;
- (unint64_t)options;
- (unint64_t)signpostIntervalId;
- (void)_adoptExistingAssetCollectionFetchResults:(id)a3;
- (void)_bringFetchResultsUpToDateWithFetcherCacheForAssetCollection:(id)a3;
- (void)_cancelBackgroundFetchIfNeeded;
- (void)_childDataSourceDidUpdateFetchesForAssetCollection:(id)a3;
- (void)_commonInit;
- (void)_didChange:(id)a3;
- (void)_didFinishBackgroundFetchingForId:(int64_t)a3;
- (void)_distributeChange:(id)a3;
- (void)_endFilterPredicateChangedForCollection:(id)a3;
- (void)_endLibraryFilterChangedSignpostForCollection:(id)a3;
- (void)_enumerateChangeObserversWithBlock:(id)a3;
- (void)_fetchRemainingCollectionsBackgroundLoopWithId:(int64_t)a3;
- (void)_getFetchLimit:(unint64_t *)a3 fetchWithReverseSortOrder:(BOOL *)a4 forAssetCollection:(id)a5 isLimitedInitialFetch:(BOOL)a6;
- (void)_incrementVersionIdentifier;
- (void)_initResultRecordsWithOldOptions:(unint64_t)a3 newOptions:(unint64_t)a4;
- (void)_internalSetLibraryFilter:(int64_t)a3;
- (void)_interruptBackgroundFetch;
- (void)_observersQueue_copyChangeObserversForWriteIfNeeded;
- (void)_performManualChangesForAssetCollections:(id)a3 changeBlock:(id)a4;
- (void)_performManualChangesForAssetCollections:(id)a3 collectionsToDiff:(id)a4 changeBlock:(id)a5;
- (void)_performManualChangesForAssetCollections:(id)a3 collectionsToDiff:(id)a4 collectionsToChange:(id)a5 changeBlock:(id)a6;
- (void)_performManualReloadWithChangeBlock:(id)a3;
- (void)_performProcessAndPublishSelectorInDefaultRunLoopMode;
- (void)_prefetchIndexesByFetchResult:(id)a3 onlyThumbnails:(BOOL)a4;
- (void)_prepareDiffsForPendingResultsWithCompletion:(id)a3;
- (void)_processAndPublishPendingCollectionFetchResults;
- (void)_processAndPublishPendingCollectionFetchResultsWhenAppropriate;
- (void)_publishDidReceivePhotoLibraryChange:(id)a3;
- (void)_publishReloadChange;
- (void)_restartBackgroundFetchWithAssetCollectionsToDiff:(id)a3;
- (void)_setPreviousCollectionsCount:(unint64_t)a3;
- (void)_startFilterPredicateChangedSignpostForCollection:(id)a3;
- (void)_startLibraryFilterChangedSignpostForCollection:(id)a3;
- (void)_updateInaccurateAssetCollectionsIfNeeded;
- (void)_willChange;
- (void)clearResultsForAssetCollection:(id)a3;
- (void)clearResultsForAssetCollections:(id)a3;
- (void)dealloc;
- (void)enumerateStartingAtIndexPath:(id)a3 reverseDirection:(BOOL)a4 usingBlock:(id)a5;
- (void)forceExcludeAssetsAtIndexPaths:(id)a3;
- (void)forceExcludeAssetsAtIndexes:(id)a3;
- (void)forceIncludeAssetsAtIndexPaths:(id)a3;
- (void)forceIncludeAssetsAtIndexes:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)pauseChangeDeliveryFor:(double)a3 identifier:(id)a4;
- (void)performChanges:(id)a3;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
- (void)prefetchApproximateAssetsAtIndexPaths:(id)a3;
- (void)prefetchApproximateAssetsAtIndexPaths:(id)a3 reverseOrder:(BOOL)a4;
- (void)prefetchAssetsAtIndexPaths:(id)a3 onlyThumbnailAssets:(BOOL)a4;
- (void)prefetchAssetsInSections:(id)a3;
- (void)refetchResultsForAssetCollection:(id)a3;
- (void)registerChangeObserver:(id)a3;
- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3;
- (void)setAllowNextChangeDeliveryOnAllRunLoopModes:(BOOL)a3;
- (void)setAllowSlowFetchesOnClientQueue:(BOOL)a3;
- (void)setAllowedOIDs:(id)a3;
- (void)setAllowedUUIDs:(id)a3;
- (void)setAllowedUUIDs:(id)a3 manualOrderUUIDs:(id)a4 forAssetCollections:(id)a5;
- (void)setBackgroundFetchOriginSection:(int64_t)a3;
- (void)setCanIncludeUnsavedSyndicatedAssets:(BOOL)a3;
- (void)setCollectionListFetchResult:(id)a3;
- (void)setCurationLength:(int64_t)a3;
- (void)setDisableFilters:(BOOL)a3 forAssetCollection:(id)a4;
- (void)setFetchLimit:(unint64_t)a3;
- (void)setFilterPredicate:(id)a3;
- (void)setFilterPredicate:(id)a3 provideIncrementalChangeDetailsForAssetCollections:(id)a4;
- (void)setIgnoreSharedLibraryFilters:(BOOL)a3;
- (void)setIncludeAllBurstAssets:(BOOL)a3;
- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3;
- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3 provideIncrementalChangeDetailsForAssetCollections:(id)a4;
- (void)setIsBackgroundFetching:(BOOL)a3;
- (void)setKeyAsset:(id)a3 forAssetCollection:(id)a4;
- (void)setLibraryFilter:(int64_t)a3;
- (void)setReverseSortOrder:(BOOL)a3;
- (void)setSignpostIntervalId:(unint64_t)a3;
- (void)setSortDescriptors:(id)a3;
- (void)setWantsCuration:(BOOL)a3 forAssetCollection:(id)a4;
- (void)setWantsCurationByDefault:(BOOL)a3;
- (void)setWantsCurationForAllCollections:(BOOL)a3 collectionsToDiff:(id)a4;
- (void)startBackgroundFetchIfNeeded;
- (void)stopExcludingAssets:(id)a3;
- (void)stopForceIncludingAllAssets;
- (void)unregisterChangeObserver:(id)a3;
@end

@implementation PXPhotosDataSource

- (id)_allowedUUIDsForAssetCollection:(id)a3
{
  id v4 = a3;
  if ([(PXPhotosDataSource *)self _areFiltersDisabledForAssetCollection:v4])
  {
    v5 = 0;
  }
  else
  {
    v6 = [(PXPhotosDataSource *)self infoForAssetCollection:v4];
    v7 = [v6 allowedUUIDs];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [(PXPhotosDataSource *)self allowedUUIDs];
    }
    v5 = v9;
  }
  return v5;
}

- (id)_finalFilterPredicateForAssetCollection:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = [(PXPhotosDataSource *)self _filterPredicateForAssetCollection:a3];
  v5 = [(PXPhotosDataSource *)self allowedUUIDs];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid in %@", v5];
    v7 = v6;
    if (v4)
    {
      v8 = (void *)MEMORY[0x1E4F28BA0];
      v19[0] = v4;
      v19[1] = v6;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
      uint64_t v10 = [v8 andPredicateWithSubpredicates:v9];

      id v4 = (id)v10;
    }
    else
    {
      id v4 = v6;
    }
  }
  v11 = [(PXPhotosDataSource *)self allowedOIDs];
  if (v11)
  {
    v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", v11];
    v13 = v12;
    if (v4)
    {
      v14 = (void *)MEMORY[0x1E4F28BA0];
      v18[0] = v4;
      v18[1] = v12;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
      uint64_t v16 = [v14 andPredicateWithSubpredicates:v15];

      id v4 = (id)v16;
    }
    else
    {
      id v4 = v12;
    }
  }
  return v4;
}

- (NSSet)allowedUUIDs
{
  return self->_allowedUUIDs;
}

- (NSSet)allowedOIDs
{
  return self->_allowedOIDs;
}

- (id)_filterPredicateForAssetCollection:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if ([(PXPhotosDataSource *)self _areFiltersDisabledForAssetCollection:a3])
  {
    id v4 = 0;
    goto LABEL_12;
  }
  v5 = [(PXPhotosDataSource *)self basePredicate];
  v6 = [(PXPhotosDataSource *)self filterPredicate];
  v7 = v6;
  if (v5 && v6)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28BA0]);
    v12[0] = v5;
    v12[1] = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    id v4 = (void *)[v8 initWithType:1 subpredicates:v9];
  }
  else
  {
    if (v5)
    {
      id v10 = v5;
    }
    else
    {
      if (!v6)
      {
        id v4 = 0;
        goto LABEL_11;
      }
      id v10 = v6;
    }
    id v4 = v10;
  }
LABEL_11:

LABEL_12:
  return v4;
}

- (BOOL)_areFiltersDisabledForAssetCollection:(id)a3
{
  v3 = [(PXPhotosDataSource *)self infoForAssetCollection:a3];
  char v4 = [v3 explicitlyDisableFilters];

  return v4;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (NSPredicate)basePredicate
{
  return self->_basePredicate;
}

uint64_t __69__PXPhotosDataSource__fetchRemainingCollectionsBackgroundLoopWithId___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 objectForKeyedSubscript:a2];
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (id)infoForAssetCollection:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_infoForAssetCollection objectForKeyedSubscript:v4];
  if (!v5)
  {
    v5 = objc_alloc_init(PXAssetCollectionDataSourceInfo);
    [(NSMutableDictionary *)self->_infoForAssetCollection setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (id)_resultRecordForAssetCollection:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_resultRecordByAssetCollection objectForKeyedSubscript:v4];
  if (!v5)
  {
    v5 = [(PXPhotosDataSource *)self _createResultRecordForAssetCollection:v4];
    [(NSMutableDictionary *)self->_resultRecordByAssetCollection setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

void __41__PXPhotosDataSource_sharedPrefetchQueue__block_invoke_2()
{
}

- (void)_fetchRemainingCollectionsBackgroundLoopWithId:(int64_t)a3
{
  unsigned int v3 = atomic_load((unsigned int *)&self->_backgroundFetchId);
  if (v3 == a3)
  {
    objc_initWeak(location, self);
    if (self->_backgroundFetchOriginSectionChanged)
    {
      self->_backgroundFetchOriginSectionChanged = 0;
      id v6 = self->_collectionListFetchResult;
      if (v6)
      {
        int64_t v7 = [(PXPhotosDataSource *)self backgroundFetchOriginSection];
        id v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[PHFetchResult count](v6, "count"));
        uint64_t v9 = [(PHFetchResult *)v6 count];
        if (v9 >= 1)
        {
          uint64_t v10 = 0;
          int64_t v11 = -v7;
          do
          {
            v12 = [(PHFetchResult *)v6 objectAtIndexedSubscript:v10];
            if (v11 + v10 >= 0) {
              int64_t v13 = v11 + v10;
            }
            else {
              int64_t v13 = -(v11 + v10);
            }
            v14 = [NSNumber numberWithInteger:v13];
            [v8 setObject:v14 forKeyedSubscript:v12];

            ++v10;
          }
          while (v9 != v10);
        }
        v15 = [MEMORY[0x1E4F28E60] indexSet];
        queuedAssetCollectionsToFetch = self->_queuedAssetCollectionsToFetch;
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __69__PXPhotosDataSource__fetchRemainingCollectionsBackgroundLoopWithId___block_invoke;
        v66[3] = &unk_1E5DCA408;
        id v17 = v8;
        id v67 = v17;
        id v18 = v15;
        id v68 = v18;
        [(NSMutableOrderedSet *)queuedAssetCollectionsToFetch enumerateObjectsUsingBlock:v66];
        [(NSMutableOrderedSet *)self->_queuedAssetCollectionsToFetch removeObjectsAtIndexes:v18];
        v19 = self->_queuedAssetCollectionsToFetch;
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __69__PXPhotosDataSource__fetchRemainingCollectionsBackgroundLoopWithId___block_invoke_2;
        v64[3] = &unk_1E5DCA430;
        id v20 = v17;
        id v65 = v20;
        [(NSMutableOrderedSet *)v19 sortUsingComparator:v64];
      }
    }
    v21 = [MEMORY[0x1E4F1C9C8] date];
    if (!self->_interruptBackgroundFetch)
    {
      uint64_t v25 = 0;
      do
      {
        unsigned int v26 = atomic_load((unsigned int *)&self->_backgroundFetchId);
        if (v26 != a3) {
          break;
        }
        if (v25)
        {
          v27 = [MEMORY[0x1E4F1C9C8] date];
          [v27 timeIntervalSinceDate:v21];
          double v29 = v28;

          if (v29 >= 1.0) {
            break;
          }
        }
        if (![(NSMutableOrderedSet *)self->_queuedAssetCollectionsToFetch count])
        {
          [(PXPhotosDataSource *)self _interruptBackgroundFetch];
          break;
        }
        v30 = [(NSMutableOrderedSet *)self->_queuedAssetCollectionsToFetch objectAtIndex:0];
        [(NSMutableOrderedSet *)self->_queuedAssetCollectionsToFetch removeObjectAtIndex:0];
        v31 = [(PXPhotosDataSource *)self _fetchTupleForAssetCollection:v30 calledOnClientQueue:0 isLimitedInitialFetch:0];
        v32 = [v31 fetchResult];
        [v32 count];

        if ((self->_options & 0x400) != 0)
        {
          v33 = [v31 fetchResult];
          uint64_t v34 = [v33 count];

          if (v34)
          {
            if ([v30 keyAssetsAtEnd])
            {
              v35 = [v31 fetchResult];
              uint64_t v36 = [v35 count] - 1;
            }
            else
            {
              uint64_t v36 = 0;
            }
            v37 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v36];
            v38 = [v31 fetchResult];
            [v38 prefetchObjectsAtIndexes:v37];

            v39 = [v31 fetchResult];
            [v39 prefetchThumbnailAssetsAtIndexes:v37];
          }
        }
        if ((self->_options & 0x8000) != 0)
        {
          v40 = [(PXPhotosDataSource *)self _createResultRecordForAssetCollection:v30];
          v41 = [v31 fetchResult];
          objc_msgSend(v40, "setFetchResult:reverseSortOrder:", v41, objc_msgSend(v31, "fetchedWithReverseSortOrder"));

          v42 = [v31 keyAssetsFetchResult];
          [v40 setKeyAssetsFetchResult:v42];

          v43 = [v31 curatedFetchResult];
          [v40 setCuratedFetchResult:v43];

          v44 = [v31 curatedRefetchCondition];
          [v40 setCuratedRefetchCondition:v44];

          v45 = [v40 exposedFetchResult];
          objc_msgSend(v45, "px_safelyPrefetchObjectAtIndex:", 0);

          v46 = [v40 fetchResult];
          objc_msgSend(v46, "px_safelyPrefetchObjectAtIndex:", 0);

          v47 = [v40 keyAssetsFetchResult];
          objc_msgSend(v47, "px_safelyPrefetchObjectAtIndex:", 0);

          v48 = [v40 curatedFetchResult];
          objc_msgSend(v48, "px_safelyPrefetchObjectAtIndex:", 0);
        }
        else
        {
          v40 = 0;
        }
        pendingResultsIsolationQueue = self->_pendingResultsIsolationQueue;
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __69__PXPhotosDataSource__fetchRemainingCollectionsBackgroundLoopWithId___block_invoke_3;
        v60[3] = &unk_1E5DCAEC8;
        v60[4] = self;
        id v50 = v30;
        id v61 = v50;
        id v51 = v31;
        id v62 = v51;
        id v52 = v40;
        id v63 = v52;
        dispatch_sync(pendingResultsIsolationQueue, v60);
        v53 = +[PXPhotosDataSourceSettings sharedInstance];
        int v54 = [v53 slowBackgroundFetch];

        if (v54) {
          sleep(3u);
        }

        --v25;
      }
      while (!self->_interruptBackgroundFetch);
    }
    self->_interruptBackgroundFetch = 0;
    uint64_t v22 = [(NSMutableOrderedSet *)self->_queuedAssetCollectionsToFetch count];
    v23 = [(PXPhotosDataSource *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__PXPhotosDataSource__fetchRemainingCollectionsBackgroundLoopWithId___block_invoke_4;
    block[3] = &unk_1E5DCA458;
    BOOL v59 = v22 != 0;
    objc_copyWeak(v58, location);
    v58[1] = (id)a3;
    dispatch_async(v23, block);

    if (v22)
    {
      backgroundQueue = self->_backgroundQueue;
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __69__PXPhotosDataSource__fetchRemainingCollectionsBackgroundLoopWithId___block_invoke_5;
      v55[3] = &unk_1E5DD0260;
      objc_copyWeak(v56, location);
      v56[1] = (id)a3;
      dispatch_async(backgroundQueue, v55);
      objc_destroyWeak(v56);
    }
    objc_destroyWeak(v58);

    objc_destroyWeak(location);
  }
}

- (BOOL)_addResultTuple:(id)a3 forAssetCollection:(id)a4 preparedResultRecord:(id)a5 toMutableResultRecord:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = [(PXPhotosDataSource *)self _isResultTupleApplicable:v10 forAssetCollection:v11];
  if (v14)
  {
    v15 = [v13 fetchResult];
    if (!v15 || (unint64_t v16 = self->_options & 0x800400, v15, v16))
    {
      if ([v10 fetchedWithReverseSortOrder]) {
        uint64_t v17 = [(PXPhotosDataSource *)self reverseSortOrder] ^ 1;
      }
      else {
        uint64_t v17 = 0;
      }
      id v18 = [v10 fetchResult];
      [v13 setFetchResult:v18 reverseSortOrder:v17];
    }
    v19 = [v13 keyAssetsFetchResult];

    if (!v19)
    {
      id v20 = [v10 keyAssetsFetchResult];
      [v13 setKeyAssetsFetchResult:v20];
    }
    v21 = [v13 curatedFetchResult];

    if (v21)
    {
      if (!v12)
      {
LABEL_13:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_parentDataSource);
        [WeakRetained _childDataSourceDidUpdateFetchesForAssetCollection:v11];

        goto LABEL_14;
      }
    }
    else
    {
      v24 = [v10 curatedFetchResult];
      [v13 setCuratedFetchResult:v24];

      uint64_t v25 = [v10 curatedRefetchCondition];
      [v13 setCuratedRefetchCondition:v25];

      if (!v12) {
        goto LABEL_13;
      }
    }
    [v13 adoptPreparedFilteredFetchResultFromRecord:v12];
    goto LABEL_13;
  }
LABEL_14:

  return v14;
}

- (id)_assetsForAssetCollection:(id)a3
{
  id v4 = a3;
  v5 = [(PXPhotosDataSource *)self _resultRecordForAssetCollection:v4];
  unint64_t v6 = [(PXPhotosDataSource *)self _assetCollectionFetchStatus:v4];
  if (v6 - 1 > 2)
  {
    uint64_t v9 = 0;
  }
  else
  {
    unint64_t v7 = v6;
    uint64_t v8 = [v5 exposedFetchResult];
    uint64_t v9 = (void *)v8;
    if (v7 != 2 && !v8)
    {
      id v10 = [(PXPhotosDataSource *)self _fetchTupleForAssetCollection:v4 calledOnClientQueue:1 isLimitedInitialFetch:v7 == 1];
      id v11 = [(PXPhotosDataSource *)self _mutableResultRecordForAssetCollection:v4];
      [(PXPhotosDataSource *)self _addResultTuple:v10 forAssetCollection:v4 preparedResultRecord:0 toMutableResultRecord:v11];
      uint64_t v9 = [v11 exposedFetchResult];
    }
  }

  return v9;
}

- (unint64_t)_assetCollectionFetchStatus:(id)a3
{
  id v4 = a3;
  v5 = [(PXPhotosDataSource *)self _inaccurateAssetCollections];
  if (![v5 count])
  {

    goto LABEL_7;
  }
  unint64_t v6 = [(PXPhotosDataSource *)self _inaccurateAssetCollections];
  int v7 = [v6 containsObject:v4];

  if (!v7)
  {
LABEL_7:
    id v10 = [(PXPhotosDataSource *)self _resultRecordForAssetCollection:v4];
    if ([v10 wantsCuration] && (objc_msgSend(v4, "px_supportsFastCuration") & 1) == 0)
    {
      id v11 = [v10 exposedFetchResult];
      if (v11)
      {
      }
      else if (![(PXPhotosDataSource *)self allowSlowFetchesOnClientQueue])
      {
        unint64_t v9 = 0;
        goto LABEL_13;
      }
    }
    unint64_t v9 = 3;
LABEL_13:

    goto LABEL_14;
  }
  unint64_t options = self->_options;
  if ((options & 0x400) != 0) {
    unint64_t v9 = 1;
  }
  else {
    unint64_t v9 = (options >> 22) & 2;
  }
LABEL_14:

  return v9;
}

- (id)_inaccurateAssetCollections
{
  [(PXPhotosDataSource *)self _updateInaccurateAssetCollectionsIfNeeded];
  inaccurateAssetCollections = self->__inaccurateAssetCollections;
  return inaccurateAssetCollections;
}

- (id)_fetcherConfigurationForAssetCollection:(id)a3 useCase:(int64_t)a4 isLimitedInitialFetch:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  switch(a4)
  {
    case 3:
      id v10 = +[PXPhotosDataSourceSettings sharedInstance];
      int v11 = [v10 disableKeyAssetCuration];

      if (v11) {
        int64_t curationKind = 4;
      }
      else {
        int64_t curationKind = 5;
      }
      break;
    case 2:
      int64_t curationKind = 4;
      break;
    case 1:
      int64_t curationKind = self->_curationKind;
      break;
    default:
      int64_t curationKind = 0;
      break;
  }
  if (self->_canIncludeUnsavedSyndicatedAssets) {
    unint64_t v12 = (self->_options >> 15) & 0x10 | (self->_options >> 12) & 2 | (self->_options >> 8) & 1 | (self->_options >> 15) & 0x28 | (self->_options >> 16) & 0x40 | 4;
  }
  else {
    unint64_t v12 = (self->_options >> 15) & 0x10 | (self->_options >> 12) & 2 | (self->_options >> 8) & 1 | (self->_options >> 15) & 0x28 | (self->_options >> 16) & 0x40;
  }
  uint64_t v20 = 0;
  unsigned __int8 v19 = 0;
  [(PXPhotosDataSource *)self _getFetchLimit:&v20 fetchWithReverseSortOrder:&v19 forAssetCollection:v8 isLimitedInitialFetch:v5];
  id v13 = objc_alloc_init(PXPhotosAssetsFetcherConfiguration);
  [(PXPhotosAssetsFetcherConfiguration *)v13 setCurationKind:curationKind];
  [(PXPhotosAssetsFetcherConfiguration *)v13 setCurationLength:self->_curationLength];
  [(PXPhotosAssetsFetcherConfiguration *)v13 setOptions:v12];
  [(PXPhotosAssetsFetcherConfiguration *)v13 setLibraryFilter:self->_libraryFilter];
  [(PXPhotosAssetsFetcherConfiguration *)v13 setFetchLimit:v20];
  BOOL v14 = [(PXPhotosDataSource *)self _finalFilterPredicateForAssetCollection:v8];
  [(PXPhotosAssetsFetcherConfiguration *)v13 setFilterPredicate:v14];

  v15 = [(PXPhotosDataSource *)self _inclusionPredicateForAssetCollection:v8];
  [(PXPhotosAssetsFetcherConfiguration *)v13 setInclusionPredicate:v15];

  unint64_t v16 = [(PXPhotosDataSource *)self sortDescriptors];
  [(PXPhotosAssetsFetcherConfiguration *)v13 setSortDescriptors:v16];

  [(PXPhotosAssetsFetcherConfiguration *)v13 setIncludeUnsavedSyndicatedAssets:self->_canIncludeUnsavedSyndicatedAssets];
  [(PXPhotosAssetsFetcherConfiguration *)v13 setIncludeAllBurstAssets:self->_includeAllBurstAssets];
  [(PXPhotosAssetsFetcherConfiguration *)v13 setReverseSortOrder:v19];
  [(PXPhotosAssetsFetcherConfiguration *)v13 setHideHiddenAssets:self->_hideHiddenAssets];
  [(PXPhotosAssetsFetcherConfiguration *)v13 setFetchPropertySets:self->_fetchPropertySets];
  [(PXPhotosAssetsFetcherConfiguration *)v13 setReferencePersons:self->_filterPersons];
  [(PXPhotosAssetsFetcherConfiguration *)v13 setCurationType:self->_curationType];
  uint64_t v17 = [(PXPhotosDataSource *)self referenceAsset];
  [(PXPhotosAssetsFetcherConfiguration *)v13 setReferenceAsset:v17];

  [(PXPhotosAssetsFetcherConfiguration *)v13 setIncludeOthersInSocialGroupAssets:self->_includeOthersInSocialGroupAssets];
  return v13;
}

- (id)_createResultRecordForAssetCollection:(id)a3
{
  id v4 = objc_alloc_init(PXPhotosMutableResultRecord);
  [(PXPhotosMutableResultRecord *)v4 setWantsCuration:[(PXPhotosDataSource *)self wantsCurationByDefault]];
  [(PXPhotosMutableResultRecord *)v4 setPreloadAssetTypeCounts:(self->_options >> 1) & 1];
  [(PXPhotosMutableResultRecord *)v4 setEnsureKeyAssetAtBeginning:(self->_options >> 14) & 1];
  [(PXPhotosMutableResultRecord *)v4 setCurationLength:[(PXPhotosDataSource *)self curationLength]];
  BOOL v5 = [(PXPhotosDataSource *)self sortDescriptors];
  [(PXPhotosMutableResultRecord *)v4 setSortDescriptors:v5];

  return v4;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (BOOL)wantsCurationByDefault
{
  return self->_wantsCurationByDefault;
}

- (int64_t)curationLength
{
  return self->_curationLength;
}

- (void)_getFetchLimit:(unint64_t *)a3 fetchWithReverseSortOrder:(BOOL *)a4 forAssetCollection:(id)a5 isLimitedInitialFetch:(BOOL)a6
{
  BOOL v6 = a6;
  id v17 = a5;
  unint64_t v10 = [(PXPhotosDataSource *)self fetchLimit];
  if (![(PXPhotosDataSource *)self _reverseSortOrderForAssetCollection:v17])
  {
    BOOL v11 = [(PXPhotosDataSource *)self reverseSortOrder];
    if (!v6) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v13 = +[PXPhotosDataSource limitedInitialFetchCountLimit];
    if (v10 >= v13) {
      unint64_t v14 = v13;
    }
    else {
      unint64_t v14 = v10;
    }
    if (v10) {
      unint64_t v10 = v14;
    }
    else {
      unint64_t v10 = v13;
    }
    if (v11) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = [v17 keyAssetsAtEnd];
    }
    BOOL v16 = +[PXPhotosAssetsFetcher _adjustedReverseSortOrderForCollection:v17 reverseSortOrder:v15 fetcherOptions:(self->_options >> 15) & 0x10 | (self->_options >> 12) & 2 | (self->_options >> 8) & 1 | (self->_options >> 15) & 0x28 | (self->_options >> 16) & 0x40];
    unint64_t v12 = v17;
    BOOL v11 = v16;
    goto LABEL_15;
  }
  BOOL v11 = 1;
  if (v6) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v12 = v17;
LABEL_15:
  *a3 = v10;
  *a4 = v11;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (BOOL)reverseSortOrder
{
  return self->_reverseSortOrder;
}

- (BOOL)_reverseSortOrderForAssetCollection:(id)a3
{
  id v4 = a3;
  if ([(PXPhotosDataSource *)self fetchLimit]) {
    char v5 = [v4 keyAssetsAtEnd];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (PHAsset)referenceAsset
{
  return self->_referenceAsset;
}

- (id)_inclusionPredicateForAssetCollection:(id)a3
{
  unsigned int v3 = [(PXPhotosDataSource *)self _resultRecordForAssetCollection:a3];
  id v4 = [v3 inclusionPredicate];

  return v4;
}

- (id)_fetchTupleForAssetCollection:(id)a3 calledOnClientQueue:(BOOL)a4 isLimitedInitialFetch:(BOOL)a5
{
  BOOL v81 = a5;
  BOOL v83 = a4;
  uint64_t v171 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t options = self->_options;
  uint64_t v157 = 0;
  v158 = &v157;
  uint64_t v159 = 0x3032000000;
  v160 = __Block_byref_object_copy__244672;
  v161 = __Block_byref_object_dispose__244673;
  id v162 = 0;
  uint64_t v151 = 0;
  v152 = &v151;
  uint64_t v153 = 0x3032000000;
  v154 = __Block_byref_object_copy__244672;
  v155 = __Block_byref_object_dispose__244673;
  id v156 = 0;
  uint64_t v145 = 0;
  v146 = &v145;
  uint64_t v147 = 0x3032000000;
  v148 = __Block_byref_object_copy__244672;
  v149 = __Block_byref_object_dispose__244673;
  id v150 = 0;
  uint64_t v141 = 0;
  v142 = &v141;
  uint64_t v143 = 0x2020000000;
  char v144 = 0;
  uint64_t v135 = 0;
  v136 = &v135;
  uint64_t v137 = 0x3032000000;
  v138 = __Block_byref_object_copy__244672;
  v139 = __Block_byref_object_dispose__244673;
  id v140 = 0;
  uint64_t v129 = 0;
  v130 = &v129;
  uint64_t v131 = 0x3032000000;
  v132 = __Block_byref_object_copy__244672;
  v133 = __Block_byref_object_dispose__244673;
  id v134 = 0;
  uint64_t v123 = 0;
  v124 = &v123;
  uint64_t v125 = 0x3032000000;
  v126 = __Block_byref_object_copy__244672;
  v127 = __Block_byref_object_dispose__244673;
  id v128 = 0;
  id v116 = 0;
  uint64_t v117 = 0;
  v118 = &v117;
  uint64_t v119 = 0x3032000000;
  v120 = __Block_byref_object_copy__244672;
  v121 = __Block_byref_object_dispose__244673;
  id v122 = 0;
  uint64_t v114 = 0;
  v115[0] = &v114;
  v115[1] = 0x3032000000;
  v115[2] = __Block_byref_object_copy__244672;
  v115[3] = __Block_byref_object_dispose__244673;
  uint64_t v111 = 0;
  v112[0] = &v111;
  v112[1] = 0x3032000000;
  v112[2] = __Block_byref_object_copy__244672;
  v112[3] = __Block_byref_object_dispose__244673;
  id v113 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PXPhotosDataSource__fetchTupleForAssetCollection_calledOnClientQueue_isLimitedInitialFetch___block_invoke;
  aBlock[3] = &unk_1E5DCA0C8;
  v99 = &v157;
  aBlock[4] = self;
  id v98 = v6;
  v100 = &v151;
  v101 = &v145;
  v102 = &v141;
  v103 = &v135;
  BOOL v109 = (options & 0x20) != 0;
  v104 = &v129;
  v105 = &v123;
  BOOL v110 = v81;
  v106 = &v117;
  v107 = &v114;
  id v7 = v98;
  id v8 = self;
  v108 = &v111;
  block = (void (**)(void))_Block_copy(aBlock);
  if (v83)
  {
    block[2]();
  }
  else
  {
    unint64_t v9 = [(PXPhotosDataSource *)self clientQueue];
    dispatch_sync(v9, block);
  }
  id v84 = (id)v136[5];
  v78 = [(PXPhotosDataSource *)self fetcher];
  v79 = [(PXPhotosDataSource *)self _assetContainerForAssetCollection:v7];
  if ((self->_options & 0x40) != 0) {
    goto LABEL_11;
  }
  unint64_t v10 = (void *)v158[5];
  if (v10 && ![v10 count] || (BOOL v11 = (void *)v152[5]) != 0 && !objc_msgSend(v11, "count"))
  {
    v82 = self->_emptyAssetsFetchResult;
    BOOL v76 = 1;
    goto LABEL_45;
  }
  unint64_t v12 = self->_options;
  if (v81 && (v12 & 0x10000) != 0)
  {
LABEL_11:
    v82 = self->_emptyAssetsFetchResult;
LABEL_12:
    BOOL v76 = 0;
    goto LABEL_45;
  }
  if ((v12 & 8) != 0)
  {
    v82 = [v78 fetchAssetsInContainer:v79 configuration:v124[5]];
    goto LABEL_12;
  }
  unint64_t v13 = (void *)[(id)v124[5] copy];
  [v13 setFilterPredicate:v130[5]];
  v82 = [v78 fetchAssetsInContainer:v79 configuration:v13];
  if (v152[5])
  {
    unint64_t v14 = [(PHFetchResult *)v82 fetchedObjectIDs];
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v95 = 0u;
    long long v96 = 0u;
    long long v94 = 0u;
    long long v93 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v93 objects:v170 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v94;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v94 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void *)(*((void *)&v93 + 1) + 8 * i);
          if ([(id)v152[5] containsObject:v20]) {
            [v15 addObject:v20];
          }
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v93 objects:v170 count:16];
      }
      while (v17);
    }

    id v21 = objc_alloc(MEMORY[0x1E4F39150]);
    photoLibrary = v8->_photoLibrary;
    v23 = [(PHFetchResult *)v82 fetchType];
    v24 = [(PHFetchResult *)v82 fetchPropertySets];
    uint64_t v25 = (PHFetchResult *)[v21 initWithOids:v15 photoLibrary:photoLibrary fetchType:v23 fetchPropertySets:v24 identifier:0 registerIfNeeded:1];

    unint64_t v26 = [(PHFetchResult *)v25 count];
    BOOL v76 = v26 < [(PHFetchResult *)v82 count];
LABEL_43:

    v82 = v25;
    goto LABEL_44;
  }
  if (v158[5])
  {
    if ((self->_options & 0x1000000) != 0)
    {
      v27 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v28 = [(PHFetchResult *)v82 count];
      if (v28 >= 1)
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          v30 = (void *)MEMORY[0x1AD10CB00]();
          v31 = [(PHFetchResult *)v82 objectAtIndexedSubscript:j];
          v32 = [v31 uuid];
          if ([(id)v158[5] containsObject:v32]) {
            [v27 addObject:v32];
          }
        }
      }
      id v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid in %@", v27];
    }
    else
    {
      id v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid in %@", v158[5]];
    }
    if (v130[5])
    {
      v33 = (void *)MEMORY[0x1E4F28BA0];
      v169[0] = v130[5];
      v169[1] = v16;
      uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v169 count:2];
      id v15 = [v33 andPredicateWithSubpredicates:v34];
    }
    else
    {
      id v15 = v16;
    }
    v35 = (PHFetchResult *)[(id)v124[5] copy];
    [(PHFetchResult *)v35 setFilterPredicate:v15];
    uint64_t v25 = [v78 fetchAssetsInContainer:v79 configuration:v35];
    unint64_t v36 = [(PHFetchResult *)v25 count];
    BOOL v76 = v36 < [(PHFetchResult *)v82 count];
    if (v146[5])
    {
      v37 = objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithArray:");
      v38 = [(PHFetchResult *)v25 px_fetchedObjectIDsSortedByUUIDs:v37];

      id v74 = objc_alloc(MEMORY[0x1E4F39150]);
      v73 = v8->_photoLibrary;
      v39 = [(PHFetchResult *)v25 fetchType];
      v40 = [(PHFetchResult *)v25 fetchPropertySets];
      uint64_t v75 = [v74 initWithOids:v38 photoLibrary:v73 fetchType:v39 fetchPropertySets:v40 identifier:0 registerIfNeeded:1];

      uint64_t v25 = (PHFetchResult *)v75;
    }

    v82 = v35;
    goto LABEL_43;
  }
  BOOL v76 = 0;
LABEL_44:

LABEL_45:
  BOOL v41 = (objc_msgSend(v7, "px_supportsFastCuration") & 1) != 0 || objc_msgSend((id)v118[5], "curationKind") == 3;
  v43 = !v83 || (*((unsigned char *)v142 + 24) ? (char v42 = 1) : (char v42 = v41), (v42 & 1) != 0) || !v8->_isBackgroundFetching;
  unint64_t v44 = v8->_options;
  if ((v44 & 0x10) == 0)
  {
    v45 = 0;
    goto LABEL_57;
  }
  if (v43)
  {
    if (v83)
    {
      if (*((unsigned char *)v142 + 24)) {
        char v47 = 1;
      }
      else {
        char v47 = v41;
      }
      unint64_t v48 = v8->_options;
      if ((v47 & 1) == 0)
      {
        v49 = PLUIGetLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v164 = v8;
          __int16 v165 = 2112;
          id v166 = v7;
          _os_log_impl(&dword_1A9AE7000, v49, OS_LOG_TYPE_DEFAULT, "%@ fetching curated assets for %@ on the main queue. This can block for a long time and should never happen.", buf, 0x16u);
        }

        unint64_t v48 = v8->_options;
      }
      if ((v48 & 0x2000) == 0) {
        goto LABEL_80;
      }
    }
    else if ((v44 & 0x2000) == 0)
    {
      goto LABEL_80;
    }
    if ([v7 assetCollectionType] == 4)
    {
      v46 = [v78 fetchAssetsInContainer:v79 configuration:v118[5]];
      if ([v46 count])
      {
        v45 = 0;
      }
      else
      {
        v88[0] = MEMORY[0x1E4F143A8];
        v88[1] = 3221225472;
        v88[2] = __94__PXPhotosDataSource__fetchTupleForAssetCollection_calledOnClientQueue_isLimitedInitialFetch___block_invoke_305;
        v88[3] = &unk_1E5DCA0F0;
        id v89 = v7;
        id v90 = v78;
        id v91 = v79;
        v92 = &v117;
        v45 = _Block_copy(v88);
      }
      goto LABEL_81;
    }
LABEL_80:
    v45 = 0;
    v46 = 0;
LABEL_81:
    if ([v46 count])
    {
      if (v46) {
        goto LABEL_83;
      }
    }
    else
    {
      v69 = (void *)[(id)v118[5] copy];
      objc_msgSend(v69, "setOptions:", objc_msgSend(v69, "options") & 0xFFFFFFFFFFFFFFFDLL);
      uint64_t v70 = [v78 fetchAssetsInContainer:v79 configuration:v69];

      v46 = (void *)v70;
      if (v70) {
        goto LABEL_83;
      }
    }
    v71 = PLUIGetLog();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v164 = v8;
      __int16 v165 = 2112;
      id v166 = v7;
      __int16 v167 = 2112;
      unint64_t v168 = (unint64_t)v79;
      _os_log_impl(&dword_1A9AE7000, v71, OS_LOG_TYPE_ERROR, "%@ failed to fetch curated assets for assetCollection:%@ assetContainer:%@", buf, 0x20u);
    }

LABEL_57:
    v46 = 0;
LABEL_83:
    if ((options & 0x20) == 0 || v84) {
      goto LABEL_104;
    }
    if (v43)
    {
      if (v83)
      {
        char v52 = *((unsigned char *)v142 + 24) || v41;
        if ((v52 & 1) == 0)
        {
          v53 = PLUIGetLog();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v164 = v8;
            __int16 v165 = 2112;
            id v166 = v7;
            _os_log_impl(&dword_1A9AE7000, v53, OS_LOG_TYPE_DEFAULT, "%@ fetching key assets for %@ on the main queue. This can block for a long time and should never happen.", buf, 0x16u);
          }
        }
      }
      if ((v8->_options & 0x200000) != 0)
      {
        +[PXPhotoKitFetcher fetchAssetsWithCurationKind:container:libraryFilter:curationContext:](_TtC12PhotosUICore17PXPhotoKitFetcher, "fetchAssetsWithCurationKind:container:libraryFilter:curationContext:", 4, v79, [(id)v118[5] libraryFilter], 1);
        id v84 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        int v54 = v112;
        if ((v44 & 0x10) == 0) {
          int v54 = v115;
        }
        id v84 = [v78 fetchAssetsInContainer:v79 configuration:*(void *)(*v54 + 40)];
      }
      if (v84) {
        goto LABEL_104;
      }
      v55 = PLUIGetLog();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        unint64_t v72 = v8->_options;
        *(_DWORD *)buf = 138412802;
        v164 = v8;
        __int16 v165 = 2112;
        id v166 = v79;
        __int16 v167 = 2048;
        unint64_t v168 = v72;
        v56 = "%@ failed to fetch key curated assets for %@ options %ti";
        v57 = v55;
        os_log_type_t v58 = OS_LOG_TYPE_ERROR;
        uint32_t v59 = 32;
        goto LABEL_100;
      }
      goto LABEL_101;
    }
LABEL_98:
    v55 = PLUIGetLog();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v164 = v8;
      __int16 v165 = 2112;
      id v166 = v7;
      v56 = "%@ not allowed to fetch key assets for %@ on the main queue.";
      v57 = v55;
      os_log_type_t v58 = OS_LOG_TYPE_DEBUG;
      uint32_t v59 = 22;
LABEL_100:
      _os_log_impl(&dword_1A9AE7000, v57, v58, v56, buf, v59);
    }
LABEL_101:

    id v84 = 0;
    goto LABEL_104;
  }
  id v50 = PLUIGetLog();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v164 = v8;
    __int16 v165 = 2112;
    id v166 = v7;
    _os_log_impl(&dword_1A9AE7000, v50, OS_LOG_TYPE_DEBUG, "%@ not allowed to fetch curated assets for %@ on the main queue.", buf, 0x16u);
  }

  v45 = 0;
  v46 = 0;
  if (v84) {
    BOOL v51 = 0;
  }
  else {
    BOOL v51 = (options & 0x20) != 0;
  }
  if (v51) {
    goto LABEL_98;
  }
LABEL_104:
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __94__PXPhotosDataSource__fetchTupleForAssetCollection_calledOnClientQueue_isLimitedInitialFetch___block_invoke_308;
  v85[3] = &unk_1E5DD21E8;
  v85[4] = v8;
  id v60 = v7;
  id v86 = v60;
  BOOL v87 = v76;
  id v61 = _Block_copy(v85);
  id v62 = v61;
  if (v83)
  {
    (*((void (**)(void *))v61 + 2))(v61);
  }
  else
  {
    id v63 = [(PXPhotosDataSource *)v8 clientQueue];
    dispatch_sync(v63, v62);
  }
  v64 = [PXPhotosResultTuple alloc];
  uint64_t v65 = [(id)v124[5] reverseSortOrder];
  v66 = [(id)v124[5] filterPredicate];
  id v67 = [(PXPhotosResultTuple *)v64 initWithFetchResult:v82 fetchedWithReverseSortOrder:v65 curatedFetchResult:v46 curatedRefetchCondition:v45 keyAssetsFetchResult:v84 filterPredicate:v66];

  _Block_object_dispose(&v111, 8);
  _Block_object_dispose(&v114, 8);

  _Block_object_dispose(&v117, 8);
  _Block_object_dispose(&v123, 8);

  _Block_object_dispose(&v129, 8);
  _Block_object_dispose(&v135, 8);

  _Block_object_dispose(&v141, 8);
  _Block_object_dispose(&v145, 8);

  _Block_object_dispose(&v151, 8);
  _Block_object_dispose(&v157, 8);

  return v67;
}

- (PXPhotosAssetsFetcher)fetcher
{
  return (PXPhotosAssetsFetcher *)+[PXPhotosAssetsFetcher sharedFetcherForPhotoLibrary:self->_photoLibrary];
}

- (id)_assetContainerForAssetCollection:(id)a3
{
  id v4 = a3;
  assetContainerProvider = (void (**)(id, id))self->_assetContainerProvider;
  if (!assetContainerProvider
    || (assetContainerProvider[2](assetContainerProvider, v4), (id v6 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v6 = v4;
  }

  return v6;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

void __94__PXPhotosDataSource__fetchTupleForAssetCollection_calledOnClientQueue_isLimitedInitialFetch___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _allowedUUIDsForAssetCollection:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) _allowedOIDsForAssetCollection:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = [*(id *)(a1 + 32) infoForAssetCollection:*(void *)(a1 + 40)];
  uint64_t v9 = [v8 manualOrderUUIDs];
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  BOOL v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 32) allowSlowFetchesOnClientQueue];
  int v12 = *(unsigned __int8 *)(a1 + 128);
  if (*(unsigned char *)(a1 + 128))
  {
    id v8 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:*(void *)(a1 + 40)];
    unint64_t v13 = [v8 keyAssetsFetchResult];
  }
  else
  {
    unint64_t v13 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v13);
  if (v12)
  {
  }
  uint64_t v14 = [*(id *)(a1 + 32) _filterPredicateForAssetCollection:*(void *)(a1 + 40)];
  uint64_t v15 = *(void *)(*(void *)(a1 + 88) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  uint64_t v17 = [*(id *)(a1 + 32) _fetcherConfigurationForAssetCollection:*(void *)(a1 + 40) useCase:0 isLimitedInitialFetch:*(unsigned __int8 *)(a1 + 129)];
  uint64_t v18 = *(void *)(*(void *)(a1 + 96) + 8);
  unsigned __int8 v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  uint64_t v20 = [*(id *)(a1 + 32) _fetcherConfigurationForAssetCollection:*(void *)(a1 + 40) useCase:1 isLimitedInitialFetch:*(unsigned __int8 *)(a1 + 129)];
  uint64_t v21 = *(void *)(*(void *)(a1 + 104) + 8);
  uint64_t v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  uint64_t v23 = [*(id *)(a1 + 32) _fetcherConfigurationForAssetCollection:*(void *)(a1 + 40) useCase:2 isLimitedInitialFetch:*(unsigned __int8 *)(a1 + 129)];
  uint64_t v24 = *(void *)(*(void *)(a1 + 112) + 8);
  uint64_t v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;

  uint64_t v26 = [*(id *)(a1 + 32) _fetcherConfigurationForAssetCollection:*(void *)(a1 + 40) useCase:3 isLimitedInitialFetch:*(unsigned __int8 *)(a1 + 129)];
  uint64_t v27 = *(void *)(*(void *)(a1 + 120) + 8);
  uint64_t v28 = *(void **)(v27 + 40);
  *(void *)(v27 + 40) = v26;
}

- (BOOL)allowSlowFetchesOnClientQueue
{
  return self->_allowSlowFetchesOnClientQueue;
}

- (id)_allowedOIDsForAssetCollection:(id)a3
{
  if ([(PXPhotosDataSource *)self _areFiltersDisabledForAssetCollection:a3])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(PXPhotosDataSource *)self allowedOIDs];
  }
  return v4;
}

- (BOOL)_isResultTupleApplicable:(id)a3 forAssetCollection:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v6 = a3;
  id v7 = [(PXPhotosDataSource *)self _finalFilterPredicateForAssetCollection:a4];
  id v8 = [v6 filterPredicate];

  if (v7 == v8) {
    char v9 = 1;
  }
  else {
    char v9 = [v7 isEqual:v8];
  }

  return v9;
}

- (id)_mutableResultRecordForAssetCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_resultRecordByAssetCollection objectForKeyedSubscript:v4];
  id v6 = (void *)[v5 copy];

  if (!v6)
  {
    id v6 = [(PXPhotosDataSource *)self _createResultRecordForAssetCollection:v4];
  }
  [(NSMutableDictionary *)self->_resultRecordByAssetCollection setObject:v6 forKeyedSubscript:v4];

  return v6;
}

+ (int64_t)limitedInitialFetchCountLimit
{
  return 1000;
}

- (int64_t)backgroundFetchOriginSection
{
  return self->_backgroundFetchOriginSection;
}

void __69__PXPhotosDataSource__fetchRemainingCollectionsBackgroundLoopWithId___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (!v5)
  {
    [*(id *)(a1 + 40) addIndex:a3];
    uint64_t v5 = 0;
  }
}

- (void)_updateInaccurateAssetCollectionsIfNeeded
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_inaccurateAssetCollectionsNeedsUpdate)
  {
    self->_inaccurateAssetCollectionsNeedsUpdate = 0;
    unint64_t options = self->_options;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v5 = self->_collectionListFetchResult;
    uint64_t v6 = [(PHFetchResult *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (!v6) {
      goto LABEL_30;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        BOOL v11 = -[PXPhotosDataSource _resultRecordForAssetCollection:](self, "_resultRecordForAssetCollection:", v10, (void)v17);
        if ((options & 1) == 0)
        {
          if ((options & 0x10) != 0)
          {
            if (objc_msgSend(v10, "px_supportsFastCuration")) {
              BOOL v12 = (options & 0x20) == 0;
            }
            else {
              BOOL v12 = 0;
            }
            if (v12) {
              goto LABEL_28;
            }
          }
          else if ((options & 0x20) == 0)
          {
            goto LABEL_28;
          }
        }
        unint64_t v13 = [v11 fetchResult];

        if (!v13)
        {
          [(NSMutableOrderedSet *)self->_queuedAssetCollectionsToFetch addObject:v10];
          inaccurateAssetCollections = self->__inaccurateAssetCollections;
LABEL_27:
          [inaccurateAssetCollections addObject:v10];
          goto LABEL_28;
        }
        if ((options & 0x10) != 0)
        {
          uint64_t v15 = [v11 curatedFetchResult];
          uint64_t v2 = v15;
          if (!v15) {
            goto LABEL_26;
          }
          if ((options & 0x20) == 0)
          {

            goto LABEL_28;
          }
        }
        else if ((options & 0x20) == 0)
        {
          goto LABEL_28;
        }
        id v16 = [v11 keyAssetsFetchResult];

        if ((options & 0x10) != 0) {
        if (!v16)
        }
        {
LABEL_26:
          inaccurateAssetCollections = self->_queuedAssetCollectionsToFetch;
          goto LABEL_27;
        }
LABEL_28:
      }
      uint64_t v7 = [(PHFetchResult *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (!v7)
      {
LABEL_30:

        return;
      }
    }
  }
}

- (id)assetAtSimpleIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXPhotosDataSource *)self versionIdentifier])
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    objc_claimAutoreleasedReturnValue();
    PXSimpleIndexPathDescription();
  }
  uint64_t v6 = [(PXPhotosDataSource *)self assetsInSection:a3->section];
  if (!v6)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    objc_claimAutoreleasedReturnValue();
    PXSimpleIndexPathDescription();
  }
  uint64_t v7 = [v6 objectAtIndexedSubscript:a3->item];

  return v7;
}

- (id)assetsInSection:(int64_t)a3
{
  id v4 = [(PXPhotosDataSource *)self assetCollectionForSection:a3];
  uint64_t v5 = [(PXPhotosDataSource *)self _assetsForAssetCollection:v4];

  return v5;
}

- (id)assetCollectionForSection:(int64_t)a3
{
  id v4 = [(PXPhotosDataSource *)self _sectionCache];
  uint64_t v5 = [v4 assetCollections];
  uint64_t v6 = [v5 objectAtIndexedSubscript:a3];

  return v6;
}

- (id)_sectionCache
{
  sectionCache = self->__sectionCache;
  if (!sectionCache
    || (collectionListFetchResult = self->_collectionListFetchResult,
        [(PXPhotosDataSourceSectionCache *)sectionCache collectionListFetchResult],
        uint64_t v5 = (PHFetchResult *)objc_claimAutoreleasedReturnValue(),
        v5,
        collectionListFetchResult != v5))
  {
    uint64_t v6 = [[PXPhotosDataSourceSectionCache alloc] initWithCollectionListFetchResult:self->_collectionListFetchResult];
    uint64_t v7 = self->__sectionCache;
    self->__sectionCache = v6;
  }
  uint64_t v8 = self->__sectionCache;
  return v8;
}

- (int64_t)versionIdentifier
{
  return self->_versionIdentifier;
}

uint64_t __69__PXPhotosDataSource__fetchRemainingCollectionsBackgroundLoopWithId___block_invoke_3(void *a1)
{
  [*(id *)(a1[4] + 160) setObject:a1[6] forKeyedSubscript:a1[5]];
  uint64_t v2 = a1[7];
  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 168);
  return [v4 setObject:v2 forKeyedSubscript:v3];
}

void *__57__PXPhotosDataSource__enumerateChangeObserversWithBlock___block_invoke_2(void *result)
{
  uint64_t v1 = result[4];
  if (*(void *)(*(void *)(result[5] + 8) + 40) == *(void *)(v1 + 24)) {
    *(unsigned char *)(v1 + 16) = *(unsigned char *)(*(void *)(result[6] + 8) + 24);
  }
  return result;
}

- (void)startBackgroundFetchIfNeeded
{
  if (self->_needToStartBackgroundFetch)
  {
    self->_needToStartBackgroundFetch = 0;
    if (!self->_backgroundFetchToken)
    {
      uint64_t v3 = objc_alloc_init(PXBackgroundFetchToken);
      backgroundFetchToken = self->_backgroundFetchToken;
      self->_backgroundFetchToken = v3;
    }
    [(PXPhotosDataSource *)self _updateInaccurateAssetCollectionsIfNeeded];
    uint64_t v5 = [(PXPhotosDataSource *)self _nextBackgroundFetchId];
    objc_initWeak(&location, self);
    uint64_t v6 = [(PXPhotosDataSource *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__PXPhotosDataSource_startBackgroundFetchIfNeeded__block_invoke;
    block[3] = &unk_1E5DD0260;
    objc_copyWeak(v8, &location);
    v8[1] = v5;
    dispatch_async(v6, block);

    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
  }
}

- (int64_t)_nextBackgroundFetchId
{
  return (int)(atomic_fetch_add(&self->_backgroundFetchId, 1u) + 1);
}

- (void)_willChange
{
  int64_t nestedChanges = self->_nestedChanges;
  self->_int64_t nestedChanges = nestedChanges + 1;
  if (!nestedChanges)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __33__PXPhotosDataSource__willChange__block_invoke;
    v4[3] = &unk_1E5DCA118;
    v4[4] = self;
    [(PXPhotosDataSource *)self _enumerateChangeObserversWithBlock:v4];
    [(PXPhotosDataSource *)self _setPreviousCollectionsCount:[(PHFetchResult *)self->_collectionListFetchResult count]];
    [(PXPhotosDataSource *)self _incrementVersionIdentifier];
  }
}

- (void)_distributeChange:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __40__PXPhotosDataSource__distributeChange___block_invoke;
  char v9 = &unk_1E5DCA140;
  uint64_t v10 = self;
  id v11 = v4;
  id v5 = v4;
  [(PXPhotosDataSource *)self _enumerateChangeObserversWithBlock:&v6];
  [(PXPhotosDataSource *)self _setPreviousCollectionsCount:[(PHFetchResult *)self->_collectionListFetchResult count]];
}

- (void)_enumerateChangeObserversWithBlock:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__244672;
  uint64_t v23 = __Block_byref_object_dispose__244673;
  id v24 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PXPhotosDataSource__enumerateChangeObserversWithBlock___block_invoke;
  block[3] = &unk_1E5DCCE38;
  void block[4] = self;
  block[5] = &v19;
  block[6] = v17;
  dispatch_sync(observersQueue, block);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = (id)v20[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v25 count:16];
    }
    while (v7);
  }

  uint64_t v10 = self->_observersQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__PXPhotosDataSource__enumerateChangeObserversWithBlock___block_invoke_2;
  v11[3] = &unk_1E5DCCE38;
  v11[4] = self;
  v11[5] = &v19;
  v11[6] = v17;
  dispatch_sync(v10, v11);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);
}

- (void)_setPreviousCollectionsCount:(unint64_t)a3
{
  self->__previousCollectionsCount = a3;
}

void __40__PXPhotosDataSource__distributeChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 photosDataSource:*(void *)(a1 + 32) didChange:*(void *)(a1 + 40)];
  }
}

void __33__PXPhotosDataSource__willChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 photosDataSourceWillChange:*(void *)(a1 + 32)];
  }
}

- (PXPhotosDataSource)initWithPhotosDataSourceConfiguration:(id)a3
{
  id v5 = a3;
  v68.receiver = self;
  v68.super_class = (Class)PXPhotosDataSource;
  id v6 = [(PXPhotosDataSource *)&v68 init];
  if (v6)
  {
    obuint64_t j = [v5 collectionListFetchResult];
    id v58 = [v5 containerCollection];
    id v61 = [v5 existingAssetCollectionFetchResults];
    id v60 = [v5 existingKeyAssetsFetchResults];
    uint32_t v59 = [v5 referenceAsset];
    uint64_t v7 = [v5 filterPredicate];
    char v8 = [v5 includeOthersInSocialGroupAssets];
    uint64_t v9 = [v5 sortDescriptors];
    char v10 = [v5 canIncludeUnsavedSyndicatedAssets];
    id v65 = [v5 allowedUUIDs];
    id v64 = [v5 allowedOIDs];
    uint64_t v57 = [v5 options];
    id v63 = [v5 filterPersons];
    id v62 = [v5 filterSocialGroup];
    char v56 = [v5 hideHiddenAssets];
    id v11 = [v5 photoLibrary];
    long long v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    long long v14 = v13;

    uint64_t v54 = [v5 curationType];
    char v15 = [v5 reverseSortOrder];
    char v53 = [v5 includeAllBurstAssets];
    if (v65 && v64)
    {
      char v52 = [MEMORY[0x1E4F28B00] currentHandler];
      [v52 handleFailureInMethod:a2, v6, @"PXPhotosDataSource.m", 300, @"It is invalid to combine allowedUUIDs with allowedOIDs, pick one." object file lineNumber description];
    }
    id v16 = [v5 clientQueue];
    long long v17 = v16;
    if (v16)
    {
      char v18 = v16;
      clientQueue = v6->_clientQueue;
      v6->_clientQueue = v18;
    }
    else
    {
      long long v20 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v21 = MEMORY[0x1E4F14428];
      clientQueue = v6->_clientQueue;
      v6->_clientQueue = v20;
    }

    objc_storeStrong((id *)&v6->_photoLibrary, v14);
    objc_storeStrong((id *)&v6->_collectionListFetchResult, obj);
    objc_storeStrong((id *)&v6->_containerCollection, v58);
    uint64_t v22 = [v5 basePredicate];
    basePredicate = v6->_basePredicate;
    v6->_basePredicate = (NSPredicate *)v22;

    objc_storeStrong((id *)&v6->_filterPredicate, v7);
    v6->_includeOthersInSocialGroupAssets = v8;
    objc_storeStrong((id *)&v6->_sortDescriptors, v9);
    v6->_canIncludeUnsavedSyndicatedAssets = v10;
    v6->_ignoreSharedLibraryFilters = [v5 ignoreSharedLibraryFilters];
    uint64_t v24 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v14];
    sharedLibraryStatusProvider = v6->_sharedLibraryStatusProvider;
    v6->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v24;

    uint64_t v26 = [v5 libraryFilterState];
    libraryFilterState = v6->_libraryFilterState;
    v6->_libraryFilterState = (PXLibraryFilterState *)v26;

    uint64_t v28 = v6->_libraryFilterState;
    if (v28) {
      uint64_t v29 = [(PXLibraryFilterState *)v28 viewMode];
    }
    else {
      uint64_t v29 = [v5 libraryFilter];
    }
    v6->_libraryFilter = v29;
    objc_storeStrong((id *)&v6->_allowedUUIDs, v65);
    objc_storeStrong((id *)&v6->_allowedOIDs, v64);
    objc_storeStrong((id *)&v6->_referenceAsset, v59);
    objc_storeStrong((id *)&v6->_filterPersons, v63);
    objc_storeStrong((id *)&v6->_filterSocialGroup, v62);
    v6->_hideHiddenAssets = v56;
    uint64_t v30 = [v5 fetchPropertySets];
    fetchPropertySets = v6->_fetchPropertySets;
    v6->_fetchPropertySets = (NSArray *)v30;

    v6->_wantsCurationByDefault = [v5 wantsCurationByDefault];
    v6->_curationType = v54;
    v6->_int64_t curationKind = [v5 curationKind];
    v6->_curationLength = 0;
    v6->_reverseSortOrder = v15;
    v6->_includeAllBurstAssets = v53;
    v32 = [v5 assetContainerProvider];
    uint64_t v33 = [v32 copy];
    id assetContainerProvider = v6->_assetContainerProvider;
    v6->_id assetContainerProvider = (id)v33;

    uint64_t v35 = [MEMORY[0x1E4F1CA60] dictionary];
    resultRecordByAssetCollection = v6->_resultRecordByAssetCollection;
    v6->_resultRecordByAssetCollection = (NSMutableDictionary *)v35;

    uint64_t v37 = [MEMORY[0x1E4F1CA60] dictionary];
    preparedChangeDetailsByAssetCollection = v6->_preparedChangeDetailsByAssetCollection;
    v6->_preparedChangeDetailsByAssetCollection = (NSMutableDictionary *)v37;

    uint64_t v39 = [MEMORY[0x1E4F1CA60] dictionary];
    hintIndexPathByAssetReferenceCache = v6->_hintIndexPathByAssetReferenceCache;
    v6->_hintIndexPathByAssetReferenceCache = (NSDictionary *)v39;

    uint64_t v41 = [MEMORY[0x1E4F1CA60] dictionary];
    facesByAssetCache = v6->_facesByAssetCache;
    v6->_facesByAssetCache = (NSMutableDictionary *)v41;

    uint64_t v43 = [MEMORY[0x1E4F1CA60] dictionary];
    weightByAssetCache = v6->_weightByAssetCache;
    v6->_weightByAssetCache = (NSMutableDictionary *)v43;

    uint64_t v45 = [MEMORY[0x1E4F1CA80] set];
    inaccurateAssetCollections = v6->__inaccurateAssetCollections;
    v6->__inaccurateAssetCollections = (NSMutableSet *)v45;

    uint64_t v47 = [MEMORY[0x1E4F1CA80] set];
    pauseLibraryChangeDeliveryTokens = v6->_pauseLibraryChangeDeliveryTokens;
    v6->_pauseLibraryChangeDeliveryTokens = (NSMutableSet *)v47;

    uint64_t v49 = [MEMORY[0x1E4F1CA60] dictionary];
    infoForAssetCollection = v6->_infoForAssetCollection;
    v6->_infoForAssetCollection = (NSMutableDictionary *)v49;

    v6->_unint64_t options = v57;
    [(PXPhotosDataSource *)v6 _incrementVersionIdentifier];
    if (v61) {
      [(PXPhotosDataSource *)v6 _adoptExistingAssetCollectionFetchResults:v61];
    }
    if (v60)
    {
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __60__PXPhotosDataSource_initWithPhotosDataSourceConfiguration___block_invoke;
      v66[3] = &unk_1E5DCA020;
      id v67 = v6;
      [v60 enumerateKeysAndObjectsUsingBlock:v66];
    }
    [(PXPhotosDataSource *)v6 _commonInit];
  }
  return v6;
}

- (void)_incrementVersionIdentifier
{
}

- (PXPhotosDataSource)initWithPhotosDataSource:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PXPhotosDataSource;
  uint64_t v7 = [(PXPhotosDataSource *)&v42 init];
  if (v7)
  {
    uint64_t v8 = [v6 photoLibrary];
    photoLibrary = v7->_photoLibrary;
    v7->_photoLibrary = (PHPhotoLibrary *)v8;

    uint64_t v10 = [v6 collectionListFetchResult];
    collectionListFetchResult = v7->_collectionListFetchResult;
    v7->_collectionListFetchResult = (PHFetchResult *)v10;

    uint64_t v12 = [v6 containerCollection];
    containerCollection = v7->_containerCollection;
    v7->_containerCollection = (PHCollection *)v12;

    uint64_t v14 = [v6 basePredicate];
    basePredicate = v7->_basePredicate;
    v7->_basePredicate = (NSPredicate *)v14;

    uint64_t v16 = [v6 filterPredicate];
    filterPredicate = v7->_filterPredicate;
    v7->_filterPredicate = (NSPredicate *)v16;

    v7->_canIncludeUnsavedSyndicatedAssets = [v6 canIncludeUnsavedSyndicatedAssets];
    v7->_includeAllBurstAssets = [v6 includeAllBurstAssets];
    v7->_includeOthersInSocialGroupAssets = [v6 includeOthersInSocialGroupAssets];
    v7->_ignoreSharedLibraryFilters = [v6 ignoreSharedLibraryFilters];
    uint64_t v18 = [v6 sharedLibraryStatusProvider];
    sharedLibraryStatusProvider = v7->_sharedLibraryStatusProvider;
    v7->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v18;

    uint64_t v20 = [v6 libraryFilterState];
    libraryFilterState = v7->_libraryFilterState;
    v7->_libraryFilterState = (PXLibraryFilterState *)v20;

    v7->_libraryFilter = [v6 libraryFilter];
    uint64_t v22 = [v6 allowedUUIDs];
    allowedUUIDs = v7->_allowedUUIDs;
    v7->_allowedUUIDs = (NSSet *)v22;

    uint64_t v24 = [v6 allowedOIDs];
    allowedOIDs = v7->_allowedOIDs;
    v7->_allowedOIDs = (NSSet *)v24;

    uint64_t v26 = [*((id *)v6 + 9) mutableCopy];
    resultRecordByAssetCollection = v7->_resultRecordByAssetCollection;
    v7->_resultRecordByAssetCollection = (NSMutableDictionary *)v26;

    uint64_t v28 = [MEMORY[0x1E4F1CA60] dictionary];
    preparedChangeDetailsByAssetCollection = v7->_preparedChangeDetailsByAssetCollection;
    v7->_preparedChangeDetailsByAssetCollection = (NSMutableDictionary *)v28;

    uint64_t v30 = [*((id *)v6 + 6) copy];
    hintIndexPathByAssetReferenceCache = v7->_hintIndexPathByAssetReferenceCache;
    v7->_hintIndexPathByAssetReferenceCache = (NSDictionary *)v30;

    v32 = [v6 _inaccurateAssetCollections];
    uint64_t v33 = [v32 mutableCopy];
    inaccurateAssetCollections = v7->__inaccurateAssetCollections;
    v7->__inaccurateAssetCollections = (NSMutableSet *)v33;

    uint64_t v35 = [*((id *)v6 + 14) mutableCopy];
    infoForAssetCollection = v7->_infoForAssetCollection;
    v7->_infoForAssetCollection = (NSMutableDictionary *)v35;

    v7->__previousCollectionsCount = [(PHFetchResult *)v7->_collectionListFetchResult count];
    v7->_fetchLimit = *((void *)v6 + 56);
    uint64_t v37 = [*((id *)v6 + 57) copy];
    sortDescriptors = v7->_sortDescriptors;
    v7->_sortDescriptors = (NSArray *)v37;

    v7->_reverseSortOrder = *((unsigned char *)v6 + 324);
    v7->_versionIdentifier = *((void *)v6 + 45);
    objc_storeStrong((id *)&v7->_facesByAssetCache, *((id *)v6 + 28));
    objc_storeStrong((id *)&v7->_weightByAssetCache, *((id *)v6 + 29));
    objc_storeStrong((id *)&v7->_filterPersons, *((id *)v6 + 48));
    v7->_hideHiddenAssets = *((unsigned char *)v6 + 240);
    v7->_wantsCurationByDefault = *((unsigned char *)v6 + 325);
    objc_storeStrong((id *)&v7->_fetchPropertySets, *((id *)v6 + 31));
    v7->_curationType = *((void *)v6 + 32);
    v7->_int64_t curationKind = *((void *)v6 + 33);
    v7->_curationLength = *((void *)v6 + 34);
    v7->_allowSlowFetchesOnClientQueue = *((unsigned char *)v6 + 328);
    objc_storeStrong((id *)&v7->_clientQueue, *((id *)v6 + 59));
    uint64_t v39 = [*((id *)v6 + 63) copy];
    id assetContainerProvider = v7->_assetContainerProvider;
    v7->_id assetContainerProvider = (id)v39;

    objc_storeWeak((id *)&v7->_parentDataSource, v6);
    v7->_unint64_t options = a4;
    -[PXPhotosDataSource _initResultRecordsWithOldOptions:newOptions:](v7, "_initResultRecordsWithOldOptions:newOptions:", [v6 options], a4);
    [(PXPhotosDataSource *)v7 _commonInit];
  }

  return v7;
}

- (PHCollection)containerCollection
{
  containerCollection = self->_containerCollection;
  if (containerCollection)
  {
    id v3 = containerCollection;
  }
  else if ([(PXPhotosDataSource *)self numberOfSections] == 1)
  {
    id v3 = [(PXPhotosDataSource *)self firstAssetCollection];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (int64_t)libraryFilter
{
  return self->_libraryFilter;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (BOOL)ignoreSharedLibraryFilters
{
  return self->_ignoreSharedLibraryFilters;
}

- (PHFetchResult)collectionListFetchResult
{
  return self->_collectionListFetchResult;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (BOOL)includeOthersInSocialGroupAssets
{
  return self->_includeOthersInSocialGroupAssets;
}

- (BOOL)includeAllBurstAssets
{
  return self->_includeAllBurstAssets;
}

- (BOOL)canIncludeUnsavedSyndicatedAssets
{
  return self->_canIncludeUnsavedSyndicatedAssets;
}

- (void)_initResultRecordsWithOldOptions:(unint64_t)a3 newOptions:(unint64_t)a4
{
  if ((a3 & a4 & 0x20) != 0 && ((a3 >> 4) & 1) != ((a4 >> 4) & 1))
  {
    id v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Clearing key assets fetches for fetch type change", buf, 2u);
    }

    resultRecordByAssetCollection = self->_resultRecordByAssetCollection;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __66__PXPhotosDataSource__initResultRecordsWithOldOptions_newOptions___block_invoke;
    v7[3] = &unk_1E5DCA078;
    id v8 = 0;
    [(NSMutableDictionary *)resultRecordByAssetCollection enumerateKeysAndObjectsUsingBlock:v7];
    [(NSMutableDictionary *)self->_resultRecordByAssetCollection addEntriesFromDictionary:0];
  }
}

- (BOOL)isBackgroundFetching
{
  return self->_isBackgroundFetching;
}

- (void)_commonInit
{
  BOOL v3 = [(PXPhotosDataSource *)self _areSecondaryFetchesEnabled];
  if (v3)
  {
    id v4 = +[PXPhotosDataSource _curationSharedBackgroundQueue];
  }
  else
  {
    if ((self->_options & 0x1400) != 0) {
      dispatch_qos_class_t v5 = QOS_CLASS_USER_INITIATED;
    }
    else {
      dispatch_qos_class_t v5 = QOS_CLASS_UTILITY;
    }
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v7 = dispatch_queue_attr_make_with_qos_class(v6, v5, 0);

    id v8 = [PXLIFOQueue alloc];
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.photos.datasource.background-queue", v7);
    id v4 = [(PXLIFOQueue *)v8 initWithTargetQueue:v9];
  }
  objc_storeStrong((id *)&self->_backgroundLIFOQueue, v4);
  uint64_t v10 = [(PXLIFOQueue *)v4 targetQueue];
  backgroundQueue = self->_backgroundQueue;
  self->_backgroundQueue = v10;

  uint64_t v12 = +[PXPhotosDataSource sharedPrefetchQueue];
  prefetchQueue = self->_prefetchQueue;
  self->_prefetchQueue = v12;

  uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  coalescedChanges = self->_coalescedChanges;
  self->_coalescedChanges = v14;

  uint64_t v16 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.photos.datasource.observers-queue", 0);
  observersQueue = self->_observersQueue;
  self->_observersQueue = v16;

  id v18 = objc_alloc(MEMORY[0x1E4F39150]);
  photoLibrary = self->_photoLibrary;
  uint64_t v20 = [MEMORY[0x1E4F38EB8] fetchType];
  id v21 = (PHFetchResult *)[v18 initWithOids:MEMORY[0x1E4F1CBF0] photoLibrary:photoLibrary fetchType:v20 fetchPropertySets:0 identifier:0 registerIfNeeded:0];
  emptyAssetsFetchResult = self->_emptyAssetsFetchResult;
  self->_emptyAssetsFetchResult = v21;

  unint64_t options = self->_options;
  if (options & 4) == 0 && ((v3 | options))
  {
    uint64_t v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingResultsByAssetCollection = self->_pendingResultsByAssetCollection;
    self->_pendingResultsByAssetCollection = v24;

    uint64_t v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingPreparedResultRecordByAssetCollection = self->_pendingPreparedResultRecordByAssetCollection;
    self->_pendingPreparedResultRecordByAssetCollection = v26;

    uint64_t v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v29 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.photos.datasource.pending-results-queue", v28);
    pendingResultsIsolationQueue = self->_pendingResultsIsolationQueue;
    self->_pendingResultsIsolationQueue = v29;

    v31 = [MEMORY[0x1E4F1CA70] orderedSet];
    queuedAssetCollectionsToFetch = self->_queuedAssetCollectionsToFetch;
    self->_queuedAssetCollectionsToFetch = v31;

    self->_needToStartBackgroundFetch = 1;
    self->_isBackgroundFetching = 1;
    self->_inaccurateAssetCollectionsNeedsUpdate = 1;
    uint64_t v33 = objc_alloc_init(PXBackgroundFetchToken);
    uint64_t v34 = +[PXPreloadScheduler sharedScheduler];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __33__PXPhotosDataSource__commonInit__block_invoke;
    v38[3] = &unk_1E5DD36F8;
    uint64_t v39 = v33;
    uint64_t v35 = v33;
    [v34 scheduleDeferredTaskWithQoS:1 block:v38];

    if ((self->_options & 4) != 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  self->_needToStartBackgroundFetch = 0;
  self->_isBackgroundFetching = 0;
  if ((options & 4) == 0)
  {
LABEL_12:
    [(PHPhotoLibrary *)self->_photoLibrary px_registerChangeObserver:self];
    unint64_t v36 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observersQueue_observers = self->_observersQueue_observers;
    self->_observersQueue_observers = v36;
  }
LABEL_13:
  if (![(PXPhotosDataSource *)self isImmutable]
    && ![(PXPhotosDataSource *)self ignoreSharedLibraryFilters])
  {
    [(PXSharedLibraryStatusProvider *)self->_sharedLibraryStatusProvider registerChangeObserver:self context:PXSharedLibraryStatusProviderObservationContext_244644];
    [(PXLibraryFilterState *)self->_libraryFilterState registerChangeObserver:self context:PXLibraryFilterStateObservationContext_244645];
  }
}

- (BOOL)isEmpty
{
  if ([(PXPhotosDataSource *)self isImmutable] && (BOOL v3 = self->_cachedIsEmpty) != 0)
  {
    return [(NSNumber *)v3 BOOLValue];
  }
  else
  {
    int64_t v5 = [(PXPhotosDataSource *)self numberOfSections];
    BOOL v6 = 1;
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v16 = 0;
      long long v17 = &v16;
      uint64_t v18 = 0x2020000000;
      char v19 = 1;
      if ([(PXPhotosDataSource *)self numberOfItemsInSection:0] > 0
        || v7 >= 2 && [(PXPhotosDataSource *)self numberOfItemsInSection:v7 - 1] >= 1)
      {
        *((unsigned char *)v17 + 24) = 0;
      }
      id v8 = v17;
      if (*((unsigned char *)v17 + 24))
      {
        int64_t v9 = [(PXPhotosDataSource *)self backgroundFetchOriginSection];
        if (v9 < 0 || v9 >= v7)
        {
          id v8 = v17;
        }
        else
        {
          uint64_t v10 = [(PXPhotosDataSource *)self numberOfItemsInSection:v9];
          id v8 = v17;
          if (v10 >= 1) {
            *((unsigned char *)v17 + 24) = 0;
          }
        }
      }
      if (*((unsigned char *)v8 + 24))
      {
        resultRecordByAssetCollection = self->_resultRecordByAssetCollection;
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __29__PXPhotosDataSource_isEmpty__block_invoke;
        v15[3] = &unk_1E5DCA250;
        v15[4] = &v16;
        [(NSMutableDictionary *)resultRecordByAssetCollection enumerateKeysAndObjectsUsingBlock:v15];
        if (*((unsigned char *)v17 + 24))
        {
          if (v7 >= 1)
          {
            uint64_t v12 = 0;
            while (![(PXPhotosDataSource *)self numberOfItemsInSection:v12])
            {
              if (v7 == ++v12) {
                goto LABEL_25;
              }
            }
            *((unsigned char *)v17 + 24) = 0;
          }
        }
      }
LABEL_25:
      if ([(PXPhotosDataSource *)self isImmutable])
      {
        id v13 = [NSNumber numberWithBool:*((unsigned __int8 *)v17 + 24)];
        cachedIsEmpty = self->_cachedIsEmpty;
        self->_cachedIsEmpty = v13;
      }
      BOOL v6 = *((unsigned char *)v17 + 24) != 0;
      _Block_object_dispose(&v16, 8);
    }
    return v6;
  }
}

- (BOOL)isImmutable
{
  return (LOBYTE(self->_options) >> 2) & 1;
}

- (BOOL)_areSecondaryFetchesEnabled
{
  return (self->_options & 0x30) != 0;
}

+ (OS_dispatch_queue)sharedPrefetchQueue
{
  if (sharedPrefetchQueue_onceToken != -1) {
    dispatch_once(&sharedPrefetchQueue_onceToken, &__block_literal_global_214_244888);
  }
  uint64_t v2 = (void *)sharedPrefetchQueue_sharedPrefetchQueue;
  return (OS_dispatch_queue *)v2;
}

- (id)immutableCopy
{
  uint64_t v2 = [[PXPhotosDataSource alloc] initWithPhotosDataSource:self options:[(PXPhotosDataSource *)self options] & 0xFFFFFFFFFFFFFFFALL | 4];
  return v2;
}

- (unint64_t)options
{
  return self->_options;
}

+ (OS_dispatch_group)backgroundFetchingGroup
{
  if (backgroundFetchingGroup_onceToken != -1) {
    dispatch_once(&backgroundFetchingGroup_onceToken, &__block_literal_global_220_244886);
  }
  uint64_t v2 = (void *)backgroundFetchingGroup__sharedGroup;
  return (OS_dispatch_group *)v2;
}

- (void)_interruptBackgroundFetch
{
  if (!self->_needToStartBackgroundFetch) {
    self->_interruptBackgroundFetch = 1;
  }
}

- (void)setBackgroundFetchOriginSection:(int64_t)a3
{
  if (self->_backgroundFetchOriginSection != a3)
  {
    self->_backgroundFetchOriginSection = a3;
    self->_backgroundFetchOriginSectionChanged = 1;
    [(PXPhotosDataSource *)self _interruptBackgroundFetch];
  }
}

- (void)registerChangeObserver:(id)a3
{
  id v4 = a3;
  observersQueue = self->_observersQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__PXPhotosDataSource_registerChangeObserver___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observersQueue, v7);
}

+ (id)_curationSharedBackgroundQueue
{
  if (_curationSharedBackgroundQueue_onceToken != -1) {
    dispatch_once(&_curationSharedBackgroundQueue_onceToken, &__block_literal_global_244891);
  }
  uint64_t v2 = (void *)_curationSharedBackgroundQueue_sharedCurationBackgroundQueue;
  return v2;
}

void __69__PXPhotosDataSource__processAndPublishPendingCollectionFetchResults__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 photosDataSourceDidFinishBackgroundFetching:*(void *)(a1 + 32)];
  }
}

uint64_t __45__PXPhotosDataSource_registerChangeObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_observersQueue_copyChangeObserversForWriteIfNeeded");
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 24);
  return [v3 addObject:v2];
}

- (void)_observersQueue_copyChangeObserversForWriteIfNeeded
{
  if (self->_observersQueue_shouldCopyChangeObserversOnWrite)
  {
    id v3 = (NSHashTable *)[(NSHashTable *)self->_observersQueue_observers copy];
    observersQueue_observers = self->_observersQueue_observers;
    self->_observersQueue_observers = v3;

    self->_observersQueue_shouldCopyChangeObserversOnWrite = 0;
  }
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  id v3 = [(PXPhotosDataSource *)self assetsInSection:a3];
  int64_t v4 = [v3 count];

  return v4;
}

- (BOOL)_allSectionsConsideredAccurate
{
  uint64_t v2 = [(PXPhotosDataSource *)self _inaccurateAssetCollections];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (int64_t)numberOfSections
{
  return [(PHFetchResult *)self->_collectionListFetchResult count];
}

void __57__PXPhotosDataSource__enumerateChangeObserversWithBlock___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(unsigned char *)(a1[4] + 16);
  *(unsigned char *)(a1[4] + 16) = 1;
}

uint64_t __84__PXPhotosDataSource__processAndPublishPendingCollectionFetchResultsWhenAppropriate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performProcessAndPublishSelectorInDefaultRunLoopMode];
}

- (id)firstAssetCollection
{
  return [(PHFetchResult *)self->_collectionListFetchResult firstObject];
}

- (int64_t)numberOfSectionsWithEnrichmentState:(unsigned __int16)a3
{
  int v3 = a3;
  id v6 = [(PXPhotosDataSource *)self _sectionCache];
  uint64_t v7 = v6;
  switch(v3)
  {
    case 0:
      uint64_t v8 = [v6 numberOfEnrichmentStateNotEnrichedAssetCollections];
      break;
    case 1:
      uint64_t v8 = [v6 numberOfEnrichmentStateAssetMetadataOnlyAssetCollections];
      break;
    case 2:
      uint64_t v8 = [v6 numberOfEnrichmentStateAssetMetadataAndScoreAssetCollections];
      break;
    case 3:
      uint64_t v8 = [v6 numberOfEnrichmentStateAssetMetadataAndScenesProcessedAssetCollections];
      break;
    case 4:
      uint64_t v8 = [v6 numberOfEnrichmentStateCompleteAssetCollections];
      break;
    default:
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PXPhotosDataSource.m" lineNumber:1516 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  int64_t v9 = v8;

  return v9;
}

- (int64_t)estimatedAssetsCountWithEnrichmentState:(unsigned __int16)a3
{
  int v3 = a3;
  id v6 = [(PXPhotosDataSource *)self _sectionCache];
  uint64_t v7 = v6;
  switch(v3)
  {
    case 0:
      uint64_t v8 = [v6 estimatedAssetCountWithEnrichmentStateNotEnriched];
      break;
    case 1:
      uint64_t v8 = [v6 estimatedAssetCountWithEnrichmentStateAssetMetadataOnly];
      break;
    case 2:
      uint64_t v8 = [v6 estimatedAssetCountWithEnrichmentStateAssetMetadataAndScore];
      break;
    case 3:
      uint64_t v8 = [v6 estimatedAssetCountWithEnrichmentStateAssetMetadataAndScenesProcessed];
      break;
    case 4:
      uint64_t v8 = [v6 estimatedAssetCountWithEnrichmentStateComplete];
      break;
    default:
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PXPhotosDataSource.m" lineNumber:1533 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  int64_t v9 = v8;

  return v9;
}

- (void)prefetchAssetsAtIndexPaths:(id)a3 onlyThumbnailAssets:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = a3;
  int64_t v9 = [v7 dictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__PXPhotosDataSource_prefetchAssetsAtIndexPaths_onlyThumbnailAssets___block_invoke;
  v11[3] = &unk_1E5DCA390;
  id v12 = v9;
  SEL v13 = a2;
  v11[4] = self;
  id v10 = v9;
  [v8 enumerateItemIndexSetsUsingBlock:v11];

  [(PXPhotosDataSource *)self _prefetchIndexesByFetchResult:v10 onlyThumbnails:v4];
}

- (void)_prefetchIndexesByFetchResult:(id)a3 onlyThumbnails:(BOOL)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__PXPhotosDataSource__prefetchIndexesByFetchResult_onlyThumbnails___block_invoke;
    v7[3] = &unk_1E5DCA3E0;
    BOOL v8 = a4;
    void v7[4] = self;
    [v6 enumerateKeysAndObjectsUsingBlock:v7];
  }
}

void __69__PXPhotosDataSource_prefetchAssetsAtIndexPaths_onlyThumbnailAssets___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v8 = [v6 assetsInSection:a3];
  [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v8];
}

- (void)dealloc
{
  [(PHPhotoLibrary *)self->_photoLibrary px_unregisterChangeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDataSource;
  [(PXPhotosDataSource *)&v3 dealloc];
}

void __50__PXPhotosDataSource_startBackgroundFetchIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fetchRemainingCollectionsBackgroundLoopWithId:*(void *)(a1 + 40)];
}

void __50__PXPhotosDataSource_startBackgroundFetchIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    int64_t v5 = (void *)*((void *)WeakRetained + 25);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__PXPhotosDataSource_startBackgroundFetchIfNeeded__block_invoke_2;
    v6[3] = &unk_1E5DD0260;
    objc_copyWeak(v7, v2);
    v7[1] = *(id *)(a1 + 40);
    [v5 dispatchAsync:v6];
    objc_destroyWeak(v7);
  }
}

void __67__PXPhotosDataSource__prefetchIndexesByFetchResult_onlyThumbnails___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PXPhotosDataSource__prefetchIndexesByFetchResult_onlyThumbnails___block_invoke_2;
  block[3] = &unk_1E5DD21E8;
  id v11 = v5;
  id v12 = v6;
  char v13 = *(unsigned char *)(a1 + 40);
  id v7 = v6;
  id v8 = v5;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
  dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 216), v9);
}

uint64_t __67__PXPhotosDataSource__prepareDiffsForPendingResultsWithCompletion___block_invoke_5(void *a1)
{
  [*(id *)(a1[4] + 96) addEntriesFromDictionary:a1[5]];
  uint64_t v2 = *(uint64_t (**)(void))(a1[6] + 16);
  return v2();
}

- (void)_processAndPublishPendingCollectionFetchResults
{
  self->_processAndPublishScheduledOnRunloop = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  char v13 = __Block_byref_object_copy__244672;
  uint64_t v14 = __Block_byref_object_dispose__244673;
  id v15 = 0;
  v8[0] = 0;
  v8[1] = v8;
  id v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__244672;
  v8[4] = __Block_byref_object_dispose__244673;
  id v9 = 0;
  pendingResultsIsolationQueue = self->_pendingResultsIsolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PXPhotosDataSource__processAndPublishPendingCollectionFetchResults__block_invoke;
  block[3] = &unk_1E5DCCE38;
  void block[4] = self;
  block[5] = &v10;
  block[6] = v8;
  dispatch_sync(pendingResultsIsolationQueue, block);
  if (![(PXPhotosDataSource *)self _allSectionsConsideredAccurate]
    || (self->_options & 0x800000) != 0
    || [(PXPhotosDataSource *)self _areSecondaryFetchesEnabled])
  {
    BOOL v4 = [(id)v11[5] allKeys];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__PXPhotosDataSource__processAndPublishPendingCollectionFetchResults__block_invoke_2;
    v6[3] = &unk_1E5DCCE38;
    void v6[4] = self;
    v6[5] = &v10;
    v6[6] = v8;
    [(PXPhotosDataSource *)self _performManualChangesForAssetCollections:v4 changeBlock:v6];

    [(NSMutableDictionary *)self->_preparedChangeDetailsByAssetCollection removeAllObjects];
  }
  else
  {
    [(NSMutableDictionary *)self->_preparedChangeDetailsByAssetCollection removeAllObjects];
  }
  if (self->_didFinishBackgroundFetch && [(PXPhotosDataSource *)self isBackgroundFetching])
  {
    [(PXPhotosDataSource *)self setIsBackgroundFetching:0];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __69__PXPhotosDataSource__processAndPublishPendingCollectionFetchResults__block_invoke_4;
    v5[3] = &unk_1E5DCA118;
    v5[4] = self;
    [(PXPhotosDataSource *)self _enumerateChangeObserversWithBlock:v5];
  }
  _Block_object_dispose(v8, 8);

  _Block_object_dispose(&v10, 8);
}

- (void)setIsBackgroundFetching:(BOOL)a3
{
  if (self->_isBackgroundFetching != a3)
  {
    self->_isBackgroundFetching = a3;
    if (a3)
    {
      self->_didFinishBackgroundFetch = 0;
    }
    else
    {
      [(PXBackgroundFetchToken *)self->_backgroundFetchToken finish];
      backgroundFetchToken = self->_backgroundFetchToken;
      self->_backgroundFetchToken = 0;
    }
  }
}

- (void)_performManualChangesForAssetCollections:(id)a3 collectionsToDiff:(id)a4 changeBlock:(id)a5
{
}

- (void)_performManualChangesForAssetCollections:(id)a3 changeBlock:(id)a4
{
}

- (void)setWantsCurationForAllCollections:(BOOL)a3 collectionsToDiff:(id)a4
{
  int v4 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(PXPhotosDataSource *)self _sectionCache];
  id v8 = [v7 assetCollectionToSection];
  id v9 = [v8 allKeys];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  uint64_t v12 = v10;
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = [(PXPhotosDataSource *)self _resultRecordForAssetCollection:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        if ([v16 isCurated] != v4
          || [v16 wantsCuration] != v4)
        {

          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __74__PXPhotosDataSource_setWantsCurationForAllCollections_collectionsToDiff___block_invoke;
          void v17[3] = &unk_1E5DD21E8;
          id v18 = v10;
          char v19 = self;
          char v20 = v4;
          [(PXPhotosDataSource *)self _performManualChangesForAssetCollections:v18 collectionsToDiff:v6 changeBlock:v17];
          uint64_t v12 = v18;
          goto LABEL_12;
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13) {
        continue;
      }
      break;
    }
    uint64_t v12 = v10;
  }
LABEL_12:
}

- (void)setCollectionListFetchResult:(id)a3
{
  int v4 = (PHFetchResult *)a3;
  id v5 = v4;
  if (self->_collectionListFetchResult != v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__PXPhotosDataSource_setCollectionListFetchResult___block_invoke;
    v6[3] = &unk_1E5DD32A8;
    void v6[4] = self;
    id v7 = v4;
    [(PXPhotosDataSource *)self _performManualReloadWithChangeBlock:v6];
  }
}

- (void)_performManualReloadWithChangeBlock:(id)a3
{
  int v4 = (void (**)(void))a3;
  [(PXPhotosDataSource *)self _willChange];
  v4[2](v4);

  sectionCache = self->__sectionCache;
  self->__sectionCache = 0;

  if (self->_needToStartBackgroundFetch)
  {
    [(NSMutableDictionary *)self->_resultRecordByAssetCollection removeAllObjects];
    [(NSMutableSet *)self->__inaccurateAssetCollections removeAllObjects];
    [(NSMutableOrderedSet *)self->_queuedAssetCollectionsToFetch removeAllObjects];
    self->_inaccurateAssetCollectionsNeedsUpdate = 1;
    [(PXPhotosDataSource *)self _updateInaccurateAssetCollectionsIfNeeded];
  }
  else
  {
    [(PXPhotosDataSource *)self _cancelBackgroundFetchIfNeeded];
    id v6 = [(PXPhotosDataSource *)self _inaccurateAssetCollections];
    [v6 removeAllObjects];

    [(NSMutableDictionary *)self->_resultRecordByAssetCollection removeAllObjects];
  }
  [(PXPhotosDataSource *)self _publishReloadChange];
}

void __51__PXPhotosDataSource_setCollectionListFetchResult___block_invoke(uint64_t a1)
{
}

void __69__PXPhotosDataSource__processAndPublishPendingCollectionFetchResults__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) _mutableResultRecordForAssetCollection:v9];
  if ([*(id *)(a1 + 32) sectionForAssetCollection:v9] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v9];
    if ([*(id *)(a1 + 32) _addResultTuple:v5 forAssetCollection:v9 preparedResultRecord:v7 toMutableResultRecord:v6])
    {
      id v8 = [*(id *)(a1 + 32) _inaccurateAssetCollections];
      [v8 removeObject:v9];
    }
  }
}

- (void)_performManualChangesForAssetCollections:(id)a3 collectionsToDiff:(id)a4 collectionsToChange:(id)a5 changeBlock:(id)a6
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v70 = a5;
  uint64_t v12 = (void (**)(void))a6;
  if ([v10 count])
  {
    if (self->_nestedCoalesceChanges >= 1 && [(NSMutableArray *)self->_coalescedChanges count])
    {
      [(PXPhotosDataSource *)self _performManualReloadWithChangeBlock:v12];
      goto LABEL_73;
    }
    id v61 = v12;
    unint64_t v72 = self;
    unint64_t options = self->_options;
    int64_t v59 = [(PXPhotosDataSource *)self versionIdentifier];
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v60 = v10;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v83 objects:v89 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v84 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v83 + 1) + 8 * i);
          if ([(PXPhotosDataSource *)v72 sectionForAssetCollection:v19] != 0x7FFFFFFFFFFFFFFFLL) {
            [v13 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v83 objects:v89 count:16];
      }
      while (v16);
    }

    id v74 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
    if ((options & 0x20) != 0)
    {
      v69 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
    }
    else
    {
      v69 = 0;
    }
    p_isa = (id *)&v72->super.isa;
    uint64_t v58 = [(PXPhotosDataSource *)v72 collectionListFetchResult];
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v21 = v13;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v79 objects:v88 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v80;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v80 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v79 + 1) + 8 * j);
          uint64_t v27 = [p_isa _assetsForAssetCollection:v26];
          [v74 setObject:v27 forKeyedSubscript:v26];
          if ((options & 0x20) != 0)
          {
            uint64_t v28 = [p_isa _keyAssetsForAssetCollection:v26];
            [v69 setObject:v28 forKeyedSubscript:v26];

            p_isa = (id *)&v72->super.isa;
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v79 objects:v88 count:16];
      }
      while (v23);
    }

    [p_isa _willChange];
    v61[2]();
    v66 = [MEMORY[0x1E4F1CA60] dictionary];
    id v63 = [MEMORY[0x1E4F28E60] indexSet];
    id v62 = [MEMORY[0x1E4F1CA48] array];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    obuint64_t j = v21;
    uint64_t v71 = [obj countByEnumeratingWithState:&v75 objects:v87 count:16];
    if (v71)
    {
      uint64_t v68 = *(void *)v76;
      id v64 = v11;
      do
      {
        for (uint64_t k = 0; k != v71; ++k)
        {
          if (*(void *)v76 != v68) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = *(void **)(*((void *)&v75 + 1) + 8 * k);
          id v31 = [p_isa _assetsForAssetCollection:v30];
          uint64_t v32 = [v74 objectForKeyedSubscript:v30];
          if (v31 == (id)v32)
          {
            id v33 = v31;
            goto LABEL_60;
          }
          id v33 = (id)v32;
          if (v31)
          {
            if (v32) {
              goto LABEL_34;
            }
          }
          else
          {
            id v31 = p_isa[64];
            if (v33)
            {
LABEL_34:
              if (!v11) {
                goto LABEL_40;
              }
              goto LABEL_39;
            }
          }
          id v33 = p_isa[64];
          if (!v11) {
            goto LABEL_40;
          }
LABEL_39:
          if ([v11 containsObject:v30])
          {
LABEL_40:
            uint64_t v34 = [p_isa[12] objectForKeyedSubscript:v30];
            id v35 = [v34 fetchResultBeforeChanges];
            if (v35 == v33)
            {
              int v67 = 1;
            }
            else
            {
              unint64_t v36 = [v34 fetchResultBeforeChanges];
              uint64_t v37 = [v36 fetchedObjectIDs];
              v38 = [v33 fetchedObjectIDs];
              if (v37 == v38) {
                int v67 = 1;
              }
              else {
                int v67 = [v37 isEqual:v38];
              }
            }
            id v41 = [v34 fetchResultAfterChanges];
            if (v41 == v31)
            {
              int v45 = 1;
            }
            else
            {
              objc_super v42 = [v34 fetchResultAfterChanges];
              uint64_t v43 = [v42 fetchedObjectIDs];
              unint64_t v44 = [v31 fetchedObjectIDs];
              if (v43 == v44) {
                int v45 = 1;
              }
              else {
                int v45 = [v43 isEqual:v44];
              }

              p_isa = (id *)&v72->super.isa;
            }

            if ((v67 & v45) == 1)
            {
              id v46 = v34;
            }
            else
            {
              id v46 = [MEMORY[0x1E4F390B8] changeDetailsFromFetchResult:v33 toFetchResult:v31 changedObjects:MEMORY[0x1E4F1CBF0]];
            }
            v40 = v46;
            if (([v46 hasAnyChanges] & 1) == 0)
            {

              v40 = 0;
            }

            id v11 = v64;
            goto LABEL_59;
          }
          id v39 = objc_alloc(MEMORY[0x1E4F390B8]);
          v40 = (void *)[v39 initWithFetchResult:v33 currentFetchResult:v31 changedIdentifiers:MEMORY[0x1E4F1CBF0] unknownMergeEvent:1];
LABEL_59:
          [v66 setObject:v40 forKeyedSubscript:v30];

LABEL_60:
          [v74 setObject:v31 forKeyedSubscript:v30];
          if ((options & 0x20) != 0)
          {
            uint64_t v47 = [p_isa _keyAssetsForAssetCollection:v30];
            unint64_t v48 = [v69 objectForKeyedSubscript:v30];
            if (v47 != v48) {
              objc_msgSend(v63, "addIndex:", objc_msgSend(p_isa, "sectionForAssetCollection:", v30));
            }
          }
          if ([v70 containsObject:v30])
          {
            uint64_t v49 = [v30 objectID];

            if (v49)
            {
              id v50 = [v30 objectID];
              [v62 addObject:v50];
            }
          }
        }
        uint64_t v71 = [obj countByEnumeratingWithState:&v75 objects:v87 count:16];
      }
      while (v71);
    }

    if ([v62 count])
    {
      BOOL v51 = [p_isa collectionListFetchResult];
      char v52 = (void *)v58;
      char v53 = (void *)[objc_alloc(MEMORY[0x1E4F390B8]) initWithFetchResult:v58 currentFetchResult:v51 changedIdentifiers:v62 unknownMergeEvent:0];
    }
    else
    {
      char v53 = 0;
      char v52 = (void *)v58;
    }
    uint64_t v54 = [p_isa versionIdentifier];
    v55 = [p_isa _sectionCache];
    char v56 = [v55 assetCollectionToSection];

    uint64_t v57 = -[PXPhotosDataSourceChange initWithIncrementalChanges:assetCollectionChangeDetails:sectionsWithKeyAssetChanges:previousCollectionsCount:assetCollectionToSectionCache:originatingPhotoLibraryChange:fromIdentifier:toIdentifier:]([PXPhotosDataSourceChange alloc], "initWithIncrementalChanges:assetCollectionChangeDetails:sectionsWithKeyAssetChanges:previousCollectionsCount:assetCollectionToSectionCache:originatingPhotoLibraryChange:fromIdentifier:toIdentifier:", v53, v66, v63, [p_isa _previousCollectionsCount], v56, 0, v59, v54);
    [p_isa _didChange:v57];

    id v10 = v60;
    uint64_t v12 = v61;
  }
LABEL_73:
}

- (unint64_t)_previousCollectionsCount
{
  return self->__previousCollectionsCount;
}

- (void)_publishReloadChange
{
  objc_super v3 = objc_alloc_init(PXPhotosDataSourceChange);
  [(PXPhotosDataSource *)self _didChange:v3];
}

- (void)_didChange:(id)a3
{
  if (self->_nestedCoalesceChanges < 1) {
    [(PXPhotosDataSource *)self _distributeChange:a3];
  }
  else {
    [(NSMutableArray *)self->_coalescedChanges addObject:a3];
  }
  --self->_nestedChanges;
}

- (unint64_t)_cachedSectionForAssetCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosDataSource *)self _sectionCache];
  id v6 = [v5 assetCollectionToSection];

  id v7 = [v6 objectForKeyedSubscript:v4];

  if (v7) {
    unint64_t v8 = [v7 unsignedIntegerValue];
  }
  else {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

uint64_t __69__PXPhotosDataSource__processAndPublishPendingCollectionFetchResults__block_invoke_2(void *a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1[5] + 8) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__PXPhotosDataSource__processAndPublishPendingCollectionFetchResults__block_invoke_3;
  v4[3] = &unk_1E5DCA4F8;
  uint64_t v2 = a1[6];
  v4[4] = a1[4];
  void v4[5] = v2;
  return [v1 enumerateKeysAndObjectsUsingBlock:v4];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXSharedLibraryStatusProviderObservationContext_244644 == a5)
  {
    if ((v6 & 3) == 0) {
      goto LABEL_11;
    }
    id v15 = v9;
    id v11 = [(PXPhotosDataSource *)self sharedLibraryStatusProvider];
    int v12 = [v11 hasPreview];

    if (v12) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 0;
    }
    [(PXPhotosDataSource *)self _internalSetLibraryFilter:v13];
    goto LABEL_10;
  }
  if ((void *)PXLibraryFilterStateObservationContext_244645 != a5)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PXPhotosDataSource.m" lineNumber:4129 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v15 = v9;
    id v10 = [(PXPhotosDataSource *)self libraryFilterState];
    -[PXPhotosDataSource _internalSetLibraryFilter:](self, "_internalSetLibraryFilter:", [v10 viewMode]);

LABEL_10:
    id v9 = v15;
  }
LABEL_11:
}

void __45__PXPhotosDataSource_backgroundFetchingGroup__block_invoke()
{
  dispatch_group_t v0 = dispatch_group_create();
  uint64_t v1 = (void *)backgroundFetchingGroup__sharedGroup;
  backgroundFetchingGroup__sharedGroup = (uint64_t)v0;
}

- (id)pauseChangeDeliveryAndBackgroundLoadingWithTimeout:(double)a3 identifier:(id)a4
{
  double v6 = fmax(a3 + a3, 0.1);
  id v7 = a4;
  unint64_t v8 = [(PXPhotosDataSource *)self photoLibrary];
  id v9 = objc_msgSend(v8, "px_beginPausingChangesWithTimeout:identifier:", v7, v6);

  [(NSMutableSet *)self->_pauseLibraryChangeDeliveryTokens addObject:v9];
  self->_pauseBackgroundFetchResultsDelivery = 1;
  objc_initWeak(&location, self);
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__PXPhotosDataSource_pauseChangeDeliveryAndBackgroundLoadingWithTimeout_identifier___block_invoke;
  v16[3] = &unk_1E5DD2548;
  objc_copyWeak(&v19, &location);
  id v11 = v9;
  id v17 = v11;
  id v18 = v8;
  id v12 = v8;
  dispatch_after(v10, MEMORY[0x1E4F14428], v16);
  uint64_t v13 = v18;
  id v14 = v11;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  return v14;
}

void __67__PXPhotosDataSource__prepareDiffsForPendingResultsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 160) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_performProcessAndPublishSelectorInDefaultRunLoopMode
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F1C3A0];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [(PXPhotosDataSource *)self performSelectorOnMainThread:sel__processAndPublishPendingCollectionFetchResults withObject:0 waitUntilDone:0 modes:v3];
}

void __67__PXPhotosDataSource__prepareDiffsForPendingResultsWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v6 = a3;
  id v7 = a2;
  id v10 = [v5 objectForKeyedSubscript:v7];
  unint64_t v8 = [v10 fetchResult];
  id v9 = [MEMORY[0x1E4F390B8] changeDetailsFromFetchResult:v6 toFetchResult:v8 changedObjects:MEMORY[0x1E4F1CBF0]];

  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v7];
}

void __67__PXPhotosDataSource__prepareDiffsForPendingResultsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 _assetsForAssetCollection:v4];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
}

void __69__PXPhotosDataSource__fetchRemainingCollectionsBackgroundLoopWithId___block_invoke_4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _didFinishBackgroundFetchingForId:*(void *)(a1 + 40)];
  }
  id v3 = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 _processAndPublishPendingCollectionFetchResultsWhenAppropriate];
}

- (void)_processAndPublishPendingCollectionFetchResultsWhenAppropriate
{
  if (self->_allowNextChangeDeliveryOnAllRunLoopModes)
  {
    self->_allowNextChangeDeliveryOnAllRunLoopModes = 0;
    [(PXPhotosDataSource *)self _processAndPublishPendingCollectionFetchResults];
  }
  else if (!self->_processAndPublishScheduledOnRunloop && !self->_pauseBackgroundFetchResultsDelivery)
  {
    self->_processAndPublishScheduledOnRunloop = 1;
    if ((self->_options & 0x400) != 0)
    {
      v2[0] = MEMORY[0x1E4F143A8];
      v2[1] = 3221225472;
      v2[2] = __84__PXPhotosDataSource__processAndPublishPendingCollectionFetchResultsWhenAppropriate__block_invoke;
      v2[3] = &unk_1E5DD36F8;
      v2[4] = self;
      [(PXPhotosDataSource *)self _prepareDiffsForPendingResultsWithCompletion:v2];
    }
    else
    {
      [(PXPhotosDataSource *)self _performProcessAndPublishSelectorInDefaultRunLoopMode];
    }
  }
}

- (void)_prepareDiffsForPendingResultsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__244672;
  uint64_t v28 = __Block_byref_object_dispose__244673;
  id v29 = 0;
  pendingResultsIsolationQueue = self->_pendingResultsIsolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PXPhotosDataSource__prepareDiffsForPendingResultsWithCompletion___block_invoke;
  block[3] = &unk_1E5DD0588;
  void block[4] = self;
  block[5] = &v24;
  dispatch_sync(pendingResultsIsolationQueue, block);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = (void *)v25[5];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__PXPhotosDataSource__prepareDiffsForPendingResultsWithCompletion___block_invoke_2;
  v20[3] = &unk_1E5DCA480;
  id v8 = v6;
  id v21 = v8;
  uint64_t v22 = self;
  [v7 enumerateKeysAndObjectsUsingBlock:v20];
  id v9 = [(PXPhotosDataSource *)self clientQueue];
  backgroundQueue = self->_backgroundQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__PXPhotosDataSource__prepareDiffsForPendingResultsWithCompletion___block_invoke_3;
  v14[3] = &unk_1E5DCA4D0;
  id v18 = v4;
  id v19 = &v24;
  id v15 = v8;
  id v16 = v9;
  id v17 = self;
  id v11 = v4;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(backgroundQueue, v14);

  _Block_object_dispose(&v24, 8);
}

- (void)_didFinishBackgroundFetchingForId:(int64_t)a3
{
  unsigned int v3 = atomic_load((unsigned int *)&self->_backgroundFetchId);
  if (v3 == a3) {
    self->_didFinishBackgroundFetch = 1;
  }
}

uint64_t __69__PXPhotosDataSource__processAndPublishPendingCollectionFetchResults__block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 160) copy];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1[4] + 168) copy];
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(a1[4] + 160) removeAllObjects];
  id v8 = *(void **)(a1[4] + 168);
  return [v8 removeAllObjects];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emptyAssetsFetchResult, 0);
  objc_storeStrong(&self->_assetContainerProvider, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_allowedOIDs, 0);
  objc_storeStrong((id *)&self->_allowedUUIDs, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_basePredicate, 0);
  objc_storeStrong((id *)&self->_filterSocialGroup, 0);
  objc_storeStrong((id *)&self->_filterPersons, 0);
  objc_storeStrong((id *)&self->_referenceAsset, 0);
  objc_storeStrong((id *)&self->_collectionListFetchResult, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_containerCollection, 0);
  objc_destroyWeak((id *)&self->_parentDataSource);
  objc_storeStrong((id *)&self->_coalescedChanges, 0);
  objc_storeStrong((id *)&self->_cachedIsEmpty, 0);
  objc_storeStrong((id *)&self->_fetchPropertySets, 0);
  objc_storeStrong((id *)&self->_weightByAssetCache, 0);
  objc_storeStrong((id *)&self->_facesByAssetCache, 0);
  objc_storeStrong((id *)&self->_prefetchQueue, 0);
  objc_storeStrong((id *)&self->_queuedAssetCollectionsToFetch, 0);
  objc_storeStrong((id *)&self->_backgroundLIFOQueue, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_pendingResultsIsolationQueue, 0);
  objc_storeStrong((id *)&self->_pendingPreparedResultRecordByAssetCollection, 0);
  objc_storeStrong((id *)&self->_pendingResultsByAssetCollection, 0);
  objc_storeStrong((id *)&self->_pauseLibraryChangeDeliveryTokens, 0);
  objc_storeStrong((id *)&self->_backgroundFetchToken, 0);
  objc_storeStrong((id *)&self->_infoForAssetCollection, 0);
  objc_storeStrong((id *)&self->_preparedContainerChangeDetails, 0);
  objc_storeStrong((id *)&self->_preparedChangeDetailsByAssetCollection, 0);
  objc_storeStrong((id *)&self->__inaccurateAssetCollections, 0);
  objc_storeStrong((id *)&self->_resultRecordByAssetCollection, 0);
  objc_storeStrong((id *)&self->_preparedResultRecordChangeDetailsByAssetCollection, 0);
  objc_storeStrong((id *)&self->_preparedIndexPathByAssetReferenceCache, 0);
  objc_storeStrong((id *)&self->_hintIndexPathByAssetReferenceCache, 0);
  objc_storeStrong((id *)&self->__preparedSectionCache, 0);
  objc_storeStrong((id *)&self->__sectionCache, 0);
  objc_storeStrong((id *)&self->_observersQueue_observers, 0);
  objc_storeStrong((id *)&self->_observersQueue, 0);
}

void __52__PXPhotosDataSource__curationSharedBackgroundQueue__block_invoke()
{
  dispatch_group_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.photos.datasource.curation-shared-background-queue", attr);
  uint64_t v2 = [[PXLIFOQueue alloc] initWithTargetQueue:v1];
  uint64_t v3 = (void *)_curationSharedBackgroundQueue_sharedCurationBackgroundQueue;
  _curationSharedBackgroundQueue_sharedCurationBackgroundQueue = (uint64_t)v2;
}

void __41__PXPhotosDataSource_sharedPrefetchQueue__block_invoke()
{
  dispatch_group_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  attr = dispatch_queue_attr_make_initially_inactive(v1);

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.photos.datasource.shared-prefetch-queue", attr);
  uint64_t v3 = (void *)sharedPrefetchQueue_sharedPrefetchQueue;
  sharedPrefetchQueue_sharedPrefetchQueue = (uint64_t)v2;

  id v4 = +[PXPreloadScheduler sharedScheduler];
  [v4 scheduleMainQueueTask:&__block_literal_global_218];
}

void __67__PXPhotosDataSource__prepareDiffsForPendingResultsWithCompletion___block_invoke_3(void *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = (void *)a1[4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__PXPhotosDataSource__prepareDiffsForPendingResultsWithCompletion___block_invoke_4;
  v11[3] = &unk_1E5DCA4A8;
  uint64_t v13 = a1[8];
  id v4 = v2;
  id v12 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v11];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PXPhotosDataSource__prepareDiffsForPendingResultsWithCompletion___block_invoke_5;
  block[3] = &unk_1E5DD0E78;
  uint64_t v5 = a1[5];
  uint64_t v6 = (void *)a1[7];
  void block[4] = a1[6];
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  dispatch_async(v5, block);
}

- (PHFetchResult)emptyAssetsFetchResult
{
  return self->_emptyAssetsFetchResult;
}

- (void)setAllowSlowFetchesOnClientQueue:(BOOL)a3
{
  self->_allowSlowFetchesOnClientQueue = a3;
}

- (void)setAllowNextChangeDeliveryOnAllRunLoopModes:(BOOL)a3
{
  self->_allowNextChangeDeliveryOnAllRunLoopModes = a3;
}

- (BOOL)allowNextChangeDeliveryOnAllRunLoopModes
{
  return self->_allowNextChangeDeliveryOnAllRunLoopModes;
}

- (id)assetContainerProvider
{
  return self->_assetContainerProvider;
}

- (void)setSignpostIntervalId:(unint64_t)a3
{
  self->_signpostIntervalId = a3;
}

- (unint64_t)signpostIntervalId
{
  return self->_signpostIntervalId;
}

- (void)setWantsCurationByDefault:(BOOL)a3
{
  self->_wantsCurationByDefault = a3;
}

- (void)setIgnoreSharedLibraryFilters:(BOOL)a3
{
  self->_ignoreSharedLibraryFilters = a3;
}

- (PHSocialGroup)filterSocialGroup
{
  return self->_filterSocialGroup;
}

- (NSArray)filterPersons
{
  return self->_filterPersons;
}

- (OS_os_log)dataSourceLog
{
  if (dataSourceLog_onceToken != -1) {
    dispatch_once(&dataSourceLog_onceToken, &__block_literal_global_411_244640);
  }
  id v2 = (void *)dataSourceLog_dataSourceLog;
  return (OS_os_log *)v2;
}

void __35__PXPhotosDataSource_dataSourceLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.ui", "PXPhotosDataSource");
  dispatch_queue_t v1 = (void *)dataSourceLog_dataSourceLog;
  dataSourceLog_dataSourceLog = (uint64_t)v0;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  uint64_t v6 = self->_collectionListFetchResult;
  uint64_t v7 = [(PHFetchResult *)v6 countByEnumeratingWithState:&v88 objects:v93 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v89 != v8) {
          objc_enumerationMutation(v6);
        }
        [(PXPhotosDataSource *)self _bringFetchResultsUpToDateWithFetcherCacheForAssetCollection:*(void *)(*((void *)&v88 + 1) + 8 * i)];
      }
      uint64_t v7 = [(PHFetchResult *)v6 countByEnumeratingWithState:&v88 objects:v93 count:16];
    }
    while (v7);
  }

  objc_storeStrong((id *)&self->_hintIndexPathByAssetReferenceCache, self->_preparedIndexPathByAssetReferenceCache);
  id v10 = [v5 changeDetailsForFetchResult:self->_collectionListFetchResult];
  id v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_resultRecordByAssetCollection, "count"));
  resultRecordByAssetCollection = self->_resultRecordByAssetCollection;
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __55__PXPhotosDataSource_photoLibraryDidChangeOnMainQueue___block_invoke;
  v85[3] = &unk_1E5DCA548;
  v85[4] = self;
  id v86 = v5;
  id v13 = v11;
  id v14 = v86;
  id v15 = v13;
  id v87 = v13;
  id v16 = resultRecordByAssetCollection;
  id v17 = v15;
  [(NSMutableDictionary *)v16 enumerateKeysAndObjectsUsingBlock:v85];
  v69 = self->_preparedContainerChangeDetails;
  if (!v69) {
    goto LABEL_11;
  }
  id v18 = [(PXPhotosDataSource *)self container];
  id v19 = [(PHObjectChangeDetails *)v69 objectBeforeChanges];
  BOOL v20 = v19 == v18;

  if (v20)
  {

LABEL_13:
    uint64_t v22 = [(PHObjectChangeDetails *)self->_preparedContainerChangeDetails objectAfterChanges];
    uint64_t v23 = v22;
    if (self->_assetContainerProvider)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __55__PXPhotosDataSource_photoLibraryDidChangeOnMainQueue___block_invoke_2;
      aBlock[3] = &unk_1E5DCBE68;
      long long v84 = v22;
      uint64_t v24 = _Block_copy(aBlock);
      id assetContainerProvider = self->_assetContainerProvider;
      self->_id assetContainerProvider = v24;

      containerCollection = v84;
LABEL_15:

      int v67 = 1;
LABEL_22:

      goto LABEL_23;
    }
    if (!self->_containerCollection || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      int v67 = 0;
      goto LABEL_22;
    }
    uint64_t v27 = v23;
    if (v27)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_20:
        containerCollection = self->_containerCollection;
        self->_containerCollection = v27;
        goto LABEL_15;
      }
      uint64_t v68 = [MEMORY[0x1E4F28B00] currentHandler];
      id v62 = (objc_class *)objc_opt_class();
      id v61 = NSStringFromClass(v62);
      id v63 = [(PHCollection *)v27 px_descriptionForAssertionMessage];
      [v68 handleFailureInMethod:a2, self, @"PXPhotosDataSource.m", 4002, @"%@ should be an instance inheriting from %@, but it is %@", @"containerAfterChange", v61, v63 object file lineNumber description];
    }
    else
    {
      uint64_t v68 = [MEMORY[0x1E4F28B00] currentHandler];
      id v60 = (objc_class *)objc_opt_class();
      id v61 = NSStringFromClass(v60);
      [v68 handleFailureInMethod:a2, self, @"PXPhotosDataSource.m", 4002, @"%@ should be an instance inheriting from %@, but it is nil", @"containerAfterChange", v61 object file lineNumber description];
    }

    goto LABEL_20;
  }
  uint64_t v21 = [v14 changeDetailsForObject:v18];

  v69 = (PHObjectChangeDetails *)v21;
  if (v21) {
    goto LABEL_13;
  }
LABEL_11:
  v69 = 0;
  int v67 = 0;
LABEL_23:
  if (!v10 && (([v17 count] == 0) & ~v67) != 0)
  {
    id v10 = 0;
    goto LABEL_47;
  }
  int64_t v66 = [(PXPhotosDataSource *)self versionIdentifier];
  uint64_t v79 = 0;
  long long v80 = &v79;
  uint64_t v81 = 0x2020000000;
  char v82 = 0;
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __55__PXPhotosDataSource_photoLibraryDidChangeOnMainQueue___block_invoke_3;
  v78[3] = &unk_1E5DD0588;
  v78[4] = self;
  v78[5] = &v79;
  uint64_t v28 = _Block_copy(v78);
  id v29 = v28;
  if (v10)
  {
    (*((void (**)(void *))v28 + 2))(v28);
    if ([v10 hasIncrementalChanges])
    {
      uint64_t v30 = self->_resultRecordByAssetCollection;
      id v31 = [v10 removedObjects];
      [(NSMutableDictionary *)v30 removeObjectsForKeys:v31];

      infoForAssetCollection = self->_infoForAssetCollection;
      id v33 = [v10 removedObjects];
      [(NSMutableDictionary *)infoForAssetCollection removeObjectsForKeys:v33];
    }
    else
    {
      if (!self->_collectionListFetchResult)
      {
LABEL_40:
        objc_super v42 = [v10 fetchResultAfterChanges];
        collectionListFetchResult = self->_collectionListFetchResult;
        self->_collectionListFetchResult = v42;

        objc_storeStrong((id *)&self->__sectionCache, self->__preparedSectionCache);
        goto LABEL_41;
      }
      id v33 = [v10 fetchResultAfterChanges];
      uint64_t v34 = (void *)MEMORY[0x1E4F1CAD0];
      id v35 = [v33 fetchedObjects];
      unint64_t v36 = [v34 setWithArray:v35];

      id v64 = v17;
      id v65 = v14;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      uint64_t v37 = self->_collectionListFetchResult;
      uint64_t v38 = [(PHFetchResult *)v37 countByEnumeratingWithState:&v74 objects:v92 count:16];
      if (v38)
      {
        uint64_t v39 = *(void *)v75;
        do
        {
          for (uint64_t j = 0; j != v38; ++j)
          {
            if (*(void *)v75 != v39) {
              objc_enumerationMutation(v37);
            }
            uint64_t v41 = *(void *)(*((void *)&v74 + 1) + 8 * j);
            if (([v36 containsObject:v41] & 1) == 0)
            {
              [(NSMutableDictionary *)self->_resultRecordByAssetCollection removeObjectForKey:v41];
              [(NSMutableDictionary *)self->_infoForAssetCollection removeObjectForKey:v41];
            }
          }
          uint64_t v38 = [(PHFetchResult *)v37 countByEnumeratingWithState:&v74 objects:v92 count:16];
        }
        while (v38);
      }

      id v17 = v64;
      id v14 = v65;
    }
    goto LABEL_40;
  }
LABEL_41:
  unint64_t v44 = [MEMORY[0x1E4F28E60] indexSet];
  int v45 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __55__PXPhotosDataSource_photoLibraryDidChangeOnMainQueue___block_invoke_4;
  v70[3] = &unk_1E5DCA570;
  v70[4] = self;
  id v46 = v29;
  id v73 = v46;
  id v47 = v45;
  id v71 = v47;
  id v48 = v44;
  id v72 = v48;
  [v17 enumerateKeysAndObjectsUsingBlock:v70];
  if (v67)
  {
    v46[2](v46);
    if (!v10)
    {
      id v49 = objc_alloc(MEMORY[0x1E4F390B8]);
      id v50 = [(PXPhotosDataSource *)self collectionListFetchResult];
      BOOL v51 = [(PXPhotosDataSource *)self collectionListFetchResult];
      id v10 = (void *)[v49 initWithFetchResult:v50 currentFetchResult:v51 changedIdentifiers:MEMORY[0x1E4F1CBF0] unknownMergeEvent:0];
    }
  }
  if (*((unsigned char *)v80 + 24))
  {
    int64_t v52 = [(PXPhotosDataSource *)self versionIdentifier];
    char v53 = [(PXPhotosDataSource *)self _sectionCache];
    uint64_t v54 = [v53 assetCollectionToSection];

    v55 = [[PXPhotosDataSourceChange alloc] initWithIncrementalChanges:v10 assetCollectionChangeDetails:v47 sectionsWithKeyAssetChanges:v48 previousCollectionsCount:[(PXPhotosDataSource *)self _previousCollectionsCount] assetCollectionToSectionCache:v54 originatingPhotoLibraryChange:v14 fromIdentifier:v66 toIdentifier:v52];
    [(PXPhotosDataSource *)self _didChange:v55];
  }
  _Block_object_dispose(&v79, 8);
LABEL_47:
  preparedIndexPathByAssetReferenceCache = self->_preparedIndexPathByAssetReferenceCache;
  self->_preparedIndexPathByAssetReferenceCache = 0;

  preparedResultRecordChangeDetailsByAssetCollection = self->_preparedResultRecordChangeDetailsByAssetCollection;
  self->_preparedResultRecordChangeDetailsByAssetCollection = 0;

  preparedSectionCache = self->__preparedSectionCache;
  self->__preparedSectionCache = 0;

  preparedContainerChangeDetails = self->_preparedContainerChangeDetails;
  self->_preparedContainerChangeDetails = 0;

  [(PXPhotosDataSource *)self _publishDidReceivePhotoLibraryChange:v14];
}

void __55__PXPhotosDataSource_photoLibraryDidChangeOnMainQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:v11];
  id v7 = [v6 resultRecordBeforeChanges];

  if (v7 == v5)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = +[PXPhotosResultRecordChangeDetails resultRecordChangeDetailsFor:v5 withChange:*(void *)(a1 + 40)];
  }
  id v9 = v8;
  id v10 = [v8 resultRecordAfterChanges];

  if (v10 != v5) {
    [*(id *)(a1 + 48) setObject:v9 forKeyedSubscript:v11];
  }
}

id __55__PXPhotosDataSource_photoLibraryDidChangeOnMainQueue___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __55__PXPhotosDataSource_photoLibraryDidChangeOnMainQueue___block_invoke_3(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return [*(id *)(result + 32) _willChange];
  }
  return result;
}

void __55__PXPhotosDataSource_photoLibraryDidChangeOnMainQueue___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:v11];
  if (v6)
  {
    id v7 = [v5 exposedFetchResultChangeDetails];

    if (v7)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      id v8 = [v5 exposedFetchResultChangeDetails];
      [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v11];
    }
    id v9 = [v5 keyAssetsFetchResultChangeDetails];

    if (v9)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(*(id *)(a1 + 32), "sectionForAssetCollection:", v11));
    }
    id v10 = [v5 resultRecordAfterChanges];
    [*(id *)(*(void *)(a1 + 32) + 72) setObject:v10 forKeyedSubscript:v11];
  }
}

- (void)_bringFetchResultsUpToDateWithFetcherCacheForAssetCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosDataSource *)self _resultRecordForAssetCollection:v4];
  uint64_t v6 = [(PXPhotosDataSource *)self _inaccurateAssetCollections];
  int v7 = [v6 containsObject:v4];

  if (v7) {
    uint64_t v8 = (BYTE1(self->_options) >> 2) & 1;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = [(PXPhotosDataSource *)self fetcher];
  id v10 = [(PXPhotosDataSource *)self _assetContainerForAssetCollection:v4];
  if (v7 && !v8) {
    goto LABEL_38;
  }
  id v11 = [v5 fetchResult];
  if (!v11)
  {
    uint64_t v29 = 0;
    char v28 = 0;
    [(PXPhotosDataSource *)self _getFetchLimit:&v29 fetchWithReverseSortOrder:&v28 forAssetCollection:v4 isLimitedInitialFetch:v8];
    unint64_t options = self->_options;
    if ((options & 0x40) != 0) {
      goto LABEL_12;
    }
    BOOL v13 = (options & 0x10000) == 0;
    char v14 = v8 ^ 1;
    if (v13) {
      char v14 = 1;
    }
    if (v14)
    {
      id v15 = [(PXPhotosDataSource *)self _fetcherConfigurationForAssetCollection:v4 useCase:0 isLimitedInitialFetch:v8];
      id v11 = [v9 existingAssetsFetchResultForContainer:v10 configuration:v15];

      if (!v11) {
        goto LABEL_19;
      }
    }
    else
    {
LABEL_12:
      id v11 = self->_emptyAssetsFetchResult;
      if (!v11) {
        goto LABEL_19;
      }
    }
    id v16 = [(PXPhotosDataSource *)self _mutableResultRecordForAssetCollection:v4];
    if (v28) {
      uint64_t v17 = [(PXPhotosDataSource *)self reverseSortOrder] ^ 1;
    }
    else {
      uint64_t v17 = 0;
    }
    [v16 setFetchResult:v11 reverseSortOrder:v17];
  }
LABEL_19:
  unint64_t v18 = self->_options;
  if ((v18 & 0x10) != 0 && objc_msgSend(v4, "px_supportsFastCuration"))
  {
    id v19 = [v5 curatedFetchResult];
    if (!v19)
    {
      BOOL v20 = [(PXPhotosDataSource *)self _fetcherConfigurationForAssetCollection:v4 useCase:1 isLimitedInitialFetch:v8];
      id v19 = [v9 existingAssetsFetchResultForContainer:v10 configuration:v20];
      if (v19)
      {
        [(PXPhotosDataSource *)self _mutableResultRecordForAssetCollection:v4];
        uint64_t v21 = v27 = v20;
        [v21 setCuratedFetchResult:v19];

        BOOL v20 = v27;
      }
    }
  }
  if ((self->_options & 0x20) != 0)
  {
    int v22 = objc_msgSend(v4, "px_supportsFastCuration");
    if ((v18 & 0x10) == 0 || v22)
    {
      uint64_t v23 = [v5 keyAssetsFetchResult];
      if (!v23)
      {
        if ((v18 & 0x10) != 0) {
          uint64_t v24 = 3;
        }
        else {
          uint64_t v24 = 2;
        }
        uint64_t v25 = [(PXPhotosDataSource *)self _fetcherConfigurationForAssetCollection:v4 useCase:v24 isLimitedInitialFetch:v8];
        uint64_t v23 = [v9 existingAssetsFetchResultForContainer:v10 configuration:v25];
        if (v23)
        {
          uint64_t v26 = [(PXPhotosDataSource *)self _mutableResultRecordForAssetCollection:v4];
          [v26 setKeyAssetsFetchResult:v23];
        }
      }
    }
  }

LABEL_38:
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  pendingResultsIsolationQueue = self->_pendingResultsIsolationQueue;
  id v50 = self;
  if (pendingResultsIsolationQueue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke;
    block[3] = &unk_1E5DD32A8;
    void block[4] = self;
    id v93 = v4;
    dispatch_sync(pendingResultsIsolationQueue, block);
  }
  uint64_t v86 = 0;
  id v87 = &v86;
  uint64_t v88 = 0x3032000000;
  long long v89 = __Block_byref_object_copy__244672;
  long long v90 = __Block_byref_object_dispose__244673;
  id v91 = 0;
  uint64_t v80 = 0;
  uint64_t v81 = &v80;
  uint64_t v82 = 0x3032000000;
  long long v83 = __Block_byref_object_copy__244672;
  long long v84 = __Block_byref_object_dispose__244673;
  id v85 = 0;
  uint64_t v74 = 0;
  long long v75 = &v74;
  uint64_t v76 = 0x3032000000;
  long long v77 = __Block_byref_object_copy__244672;
  long long v78 = __Block_byref_object_dispose__244673;
  id v79 = 0;
  int v7 = [(PXPhotosDataSource *)self clientQueue];
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke_4;
  v73[3] = &unk_1E5DCA520;
  v73[4] = self;
  v73[5] = &v80;
  v73[6] = &v86;
  v73[7] = &v74;
  dispatch_sync(v7, v73);

  id v49 = [v5 changeDetailsForFetchResult:v87[5]];
  if (v49)
  {
    uint64_t v8 = [v49 fetchResultAfterChanges];
    id v9 = [[PXPhotosDataSourceSectionCache alloc] initWithCollectionListFetchResult:v8];
    preparedSectionCache = self->__preparedSectionCache;
    self->__preparedSectionCache = v9;

    id v11 = (void *)v87[5];
    v87[5] = v8;
  }
  id v12 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v13 = (void *)v81[5];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke_5;
  v69[3] = &unk_1E5DCA548;
  id v48 = v5;
  id v70 = v48;
  id v71 = self;
  id v14 = v12;
  id v72 = v14;
  [v13 enumerateKeysAndObjectsUsingBlock:v69];
  id v15 = (NSDictionary *)[v14 copy];
  int64_t v52 = v14;
  preparedResultRecordChangeDetailsByAssetCollection = self->_preparedResultRecordChangeDetailsByAssetCollection;
  self->_preparedResultRecordChangeDetailsByAssetCollection = v15;

  BOOL v51 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend((id)v75[5], "count"));
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = (id)v75[5];
  uint64_t v17 = [obj countByEnumeratingWithState:&v65 objects:v94 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v66 != v18) {
          objc_enumerationMutation(obj);
        }
        BOOL v20 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        uint64_t v21 = [v20 assetCollection];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v22 = [v20 asset];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0) {
            continue;
          }
          uint64_t v21 = [v20 assetCollection];
          if (v20)
          {
            [v20 simpleIndexPath];
            unint64_t v24 = *((void *)&v63 + 1);
          }
          else
          {
            unint64_t v24 = 0;
            long long v63 = 0u;
            long long v64 = 0u;
          }
          if (v24 >= [(id)v87[5] count]
            || ([(id)v87[5] objectAtIndexedSubscript:v24],
                uint64_t v25 = objc_claimAutoreleasedReturnValue(),
                char v26 = [v25 isEqual:v21],
                v25,
                (v26 & 1) == 0))
          {
            unint64_t v24 = [(id)v87[5] indexOfObject:v21];
          }
          if (v24 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v27 = [v52 objectForKeyedSubscript:v21];
            char v28 = [v27 resultRecordAfterChanges];
            uint64_t v29 = [v28 exposedFetchResult];

            if (v29)
            {
              uint64_t v30 = [v20 asset];
              if (v20)
              {
                [v20 simpleIndexPath];
                unint64_t v31 = v62;
              }
              else
              {
                unint64_t v31 = 0;
                long long v61 = 0u;
                long long v62 = 0u;
              }
              if (v31 < [v29 count]
                && (uint64_t v32 = objc_msgSend(v29, "indexOfObject:inRange:", v30, v31, 1), v32 != 0x7FFFFFFFFFFFFFFFLL)
                || (uint64_t v32 = [v29 indexOfObject:v30], v32 != 0x7FFFFFFFFFFFFFFFLL))
              {
                id v33 = (id)[v29 objectAtIndex:v32];
                uint64_t v34 = [MEMORY[0x1E4F28D58] indexPathForItem:v32 inSection:v24];
                [v51 setObject:v34 forKeyedSubscript:v20];
              }
            }
          }
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v65 objects:v94 count:16];
    }
    while (v17);
  }

  uint64_t v35 = [v51 copy];
  preparedIndexPathByAssetReferenceCache = v50->_preparedIndexPathByAssetReferenceCache;
  v50->_preparedIndexPathByAssetReferenceCache = (NSDictionary *)v35;

  uint64_t v55 = 0;
  char v56 = &v55;
  uint64_t v57 = 0x3032000000;
  uint64_t v58 = __Block_byref_object_copy__244672;
  int64_t v59 = __Block_byref_object_dispose__244673;
  id v60 = 0;
  uint64_t v37 = [(PXPhotosDataSource *)v50 clientQueue];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke_6;
  v54[3] = &unk_1E5DD0588;
  v54[4] = v50;
  v54[5] = &v55;
  dispatch_sync(v37, v54);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v39 = 0;
    goto LABEL_37;
  }
  id v38 = (id)v56[5];
  if (!v38)
  {
    objc_super v42 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v43 = (objc_class *)objc_opt_class();
    unint64_t v44 = NSStringFromClass(v43);
    [v42 handleFailureInMethod:a2, v50, @"PXPhotosDataSource.m", 3884, @"%@ should be an instance inheriting from %@, but it is nil", @"container", v44 object file lineNumber description];
LABEL_40:

    goto LABEL_35;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v42 = [MEMORY[0x1E4F28B00] currentHandler];
    int v45 = (objc_class *)objc_opt_class();
    unint64_t v44 = NSStringFromClass(v45);
    id v46 = objc_msgSend(v38, "px_descriptionForAssertionMessage");
    [v42 handleFailureInMethod:a2, v50, @"PXPhotosDataSource.m", 3884, @"%@ should be an instance inheriting from %@, but it is %@", @"container", v44, v46 object file lineNumber description];

    goto LABEL_40;
  }
LABEL_35:
  uint64_t v39 = [v48 changeDetailsForObject:v38];

LABEL_37:
  preparedContainerChangeDetails = v50->_preparedContainerChangeDetails;
  v50->_preparedContainerChangeDetails = (PHObjectChangeDetails *)v39;

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v74, 8);

  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v86, 8);

  return 0;
}

void __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 160) copy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke_2;
  v11[3] = &unk_1E5DCA480;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v12 = v3;
  uint64_t v13 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v11];
  id v5 = (void *)[*(id *)(*(void *)(a1 + 32) + 168) copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke_3;
  v8[3] = &unk_1E5DCA228;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
}

void __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 368));
  uint64_t v5 = [*(id *)(a1 + 32) _observerInterestingAssetReferences];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v13 = a2;
  uint64_t v5 = +[PXPhotosResultRecordChangeDetails resultRecordChangeDetailsFor:a3 withChange:*(void *)(a1 + 32)];
  uint64_t v6 = v5;
  if ((*(unsigned char *)(*(void *)(a1 + 40) + 344) & 2) != 0)
  {
    uint64_t v7 = [v5 resultRecordBeforeChanges];
    uint64_t v8 = [v7 exposedFetchResult];
    id v9 = [v6 resultRecordAfterChanges];
    uint64_t v10 = [v9 exposedFetchResult];

    if (v8 != v10)
    {
      id v11 = [v6 resultRecordAfterChanges];
      id v12 = [v11 exposedFetchResult];
      [v12 countOfAssetsWithMediaType:1];
    }
  }
  [*(id *)(a1 + 48) setObject:v6 forKeyedSubscript:v13];
}

void __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) container];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = [v6 resultTupleUpdatedWithChange:v5];

  if (v7 != v6) {
    [*(id *)(*(void *)(a1 + 40) + 160) setObject:v7 forKeyedSubscript:v8];
  }
}

void __51__PXPhotosDataSource_prepareForPhotoLibraryChange___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  uint64_t v5 = +[PXPhotosResultRecordChangeDetails resultRecordChangeDetailsFor:a3 withChange:*(void *)(a1 + 32)];
  id v6 = [v5 resultRecordBeforeChanges];
  id v7 = [v5 resultRecordAfterChanges];

  if (v6 != v7)
  {
    id v8 = [v5 resultRecordAfterChanges];
    [*(id *)(*(void *)(a1 + 40) + 168) setObject:v8 forKeyedSubscript:v9];
  }
}

- (void)_restartBackgroundFetchWithAssetCollectionsToDiff:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXPhotosDataSource *)self _sectionCache];
  id v6 = [v5 assetCollections];

  BOOL v7 = [(PXPhotosDataSource *)self supportsDynamicBackgroundFetching];
  if (self->_needToStartBackgroundFetch)
  {
    [(NSMutableOrderedSet *)self->_queuedAssetCollectionsToFetch addObjectsFromArray:v6];
  }
  else if (v7)
  {
    self->_needToStartBackgroundFetch = 1;
    self->_isBackgroundFetching = 1;
    [(PXPhotosDataSource *)self startBackgroundFetchIfNeeded];
    backgroundQueue = self->_backgroundQueue;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    BOOL v20 = __72__PXPhotosDataSource__restartBackgroundFetchWithAssetCollectionsToDiff___block_invoke;
    uint64_t v21 = &unk_1E5DD32A8;
    int v22 = self;
    id v9 = v6;
    id v23 = v9;
    dispatch_async(backgroundQueue, &v18);
    -[NSMutableSet addObjectsFromArray:](self->__inaccurateAssetCollections, "addObjectsFromArray:", v9, v18, v19, v20, v21, v22);
    if ([v4 count])
    {
      uint64_t v10 = [v4 allObjects];
      [(PXPhotosDataSource *)self forceAccurateAssetCollectionsIfNeeded:v10 reloadChanges:0];
    }
    id v11 = [v4 allObjects];
    id v12 = [(PXPhotosDataSource *)self sectionsForAssetCollections:v11];

    uint64_t v13 = objc_msgSend(v12, "px_coveringRange");
    if (!v14 || v13 == 0x7FFFFFFFFFFFFFFFLL || (int64_t v15 = v13 + (v14 >> 1), v15 == 0x7FFFFFFFFFFFFFFFLL)) {
      int64_t v15 = [(PXPhotosDataSource *)self backgroundFetchOriginSection];
    }
    if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v16 = 0;
    }
    else {
      int64_t v16 = v15;
    }
    [(PXPhotosDataSource *)self _forceAccurateSection:v16 andNumberOfSurroundingSectionsWithContent:10];
  }
  else
  {
    [(PXPhotosDataSource *)self _cancelBackgroundFetchIfNeeded];
    uint64_t v17 = [(PXPhotosDataSource *)self _inaccurateAssetCollections];
    [v17 removeAllObjects];

    [(NSMutableDictionary *)self->_resultRecordByAssetCollection removeAllObjects];
  }
}

uint64_t __72__PXPhotosDataSource__restartBackgroundFetchWithAssetCollectionsToDiff___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) addObjectsFromArray:*(void *)(a1 + 40)];
}

- (void)_childDataSourceDidUpdateFetchesForAssetCollection:(id)a3
{
  id v5 = a3;
  if (-[PXPhotosDataSource sectionForAssetCollection:](self, "sectionForAssetCollection:") != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(PXPhotosDataSource *)self _bringFetchResultsUpToDateWithFetcherCacheForAssetCollection:v5];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentDataSource);
    [WeakRetained _childDataSourceDidUpdateFetchesForAssetCollection:v5];
  }
}

void __69__PXPhotosDataSource__fetchRemainingCollectionsBackgroundLoopWithId___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fetchRemainingCollectionsBackgroundLoopWithId:*(void *)(a1 + 40)];
}

- (void)_cancelBackgroundFetchIfNeeded
{
  if (self->_isBackgroundFetching || self->_needToStartBackgroundFetch)
  {
    [(PXPhotosDataSource *)self setIsBackgroundFetching:0];
    self->_needToStartBackgroundFetch = 0;
    backgroundQueue = self->_backgroundQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__PXPhotosDataSource__cancelBackgroundFetchIfNeeded__block_invoke;
    block[3] = &unk_1E5DD36F8;
    void block[4] = self;
    dispatch_async(backgroundQueue, block);
    [(PXPhotosDataSource *)self _interruptBackgroundFetch];
  }
}

uint64_t __52__PXPhotosDataSource__cancelBackgroundFetchIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) removeAllObjects];
}

uint64_t __67__PXPhotosDataSource__prefetchIndexesByFetchResult_onlyThumbnails___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) prefetchThumbnailAssetsAtIndexes:*(void *)(a1 + 40)];
  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 prefetchObjectsAtIndexes:v4];
  }
  return result;
}

- (void)prefetchAssetsInSections:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = [v4 dictionary];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __47__PXPhotosDataSource_prefetchAssetsInSections___block_invoke;
  id v11 = &unk_1E5DCA3B8;
  id v12 = self;
  id v13 = v6;
  id v7 = v6;
  [v5 enumerateSectionIndexPathsUsingBlock:&v8];

  -[PXPhotosDataSource _prefetchIndexesByFetchResult:onlyThumbnails:](self, "_prefetchIndexesByFetchResult:onlyThumbnails:", v7, 0, v8, v9, v10, v11, v12);
}

void __47__PXPhotosDataSource_prefetchAssetsInSections___block_invoke(uint64_t a1, uint64_t a2)
{
  id v8 = [*(id *)(a1 + 32) assetsInSection:*(void *)(a2 + 8)];
  if (v8)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v8, "count"));
    [*(id *)(a1 + 40) setObject:v4 forKeyedSubscript:v8];
  }
  id v5 = [*(id *)(a1 + 32) keyAssetsInSection:*(void *)(a2 + 8)];
  id v6 = v5;
  if (v5)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v6];
  }
}

- (void)prefetchApproximateAssetsAtIndexPaths:(id)a3 reverseOrder:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6 && [v6 count])
  {
    BOOL v26 = v4;
    uint64_t v27 = self;
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(v9);
          }
          unint64_t v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          int64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "section"));
          int64_t v16 = [v8 objectForKeyedSubscript:v15];

          if (v16)
          {
            objc_msgSend(v16, "addIndex:", objc_msgSend(v14, "item"));
          }
          else
          {
            int64_t v16 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndex:", objc_msgSend(v14, "item"));
            uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "section"));
            [v8 setObject:v16 forKeyedSubscript:v17];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v11);
    }

    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    BOOL v20 = [MEMORY[0x1E4F28E60] indexSet];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __73__PXPhotosDataSource_prefetchApproximateAssetsAtIndexPaths_reverseOrder___block_invoke;
    v34[3] = &unk_1E5DCA368;
    v34[4] = v27;
    id v21 = v18;
    id v35 = v21;
    id v22 = v19;
    id v36 = v22;
    id v23 = v20;
    id v37 = v23;
    [v8 enumerateKeysAndObjectsUsingBlock:v34];
    if ([v21 count])
    {
      if (v26) {
        uint64_t v24 = 2;
      }
      else {
        uint64_t v24 = 0;
      }
      prefetchQueue = v27->_prefetchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__PXPhotosDataSource_prefetchApproximateAssetsAtIndexPaths_reverseOrder___block_invoke_2;
      block[3] = &unk_1E5DCE038;
      id v29 = v23;
      uint64_t v33 = v24;
      id v30 = v22;
      id v31 = v21;
      uint64_t v32 = v27;
      dispatch_async(prefetchQueue, block);
    }
  }
}

void __73__PXPhotosDataSource_prefetchApproximateAssetsAtIndexPaths_reverseOrder___block_invoke(id *a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = objc_msgSend(a1[4], "assetsInSection:", objc_msgSend(v12, "integerValue"));
  if (v6)
  {
    NSUInteger v7 = objc_msgSend(v5, "px_coveringRange");
    NSUInteger v9 = v8;
    v15.length = [v6 count];
    v14.id location = v7;
    v14.length = v9;
    v15.id location = 0;
    NSRange v10 = NSIntersectionRange(v14, v15);
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v10.location, v10.length);
    [a1[5] setObject:v11 forKeyedSubscript:v6];
    [a1[6] setObject:v6 forKeyedSubscript:v12];
    objc_msgSend(a1[7], "addIndex:", objc_msgSend(v12, "integerValue"));
  }
}

void __73__PXPhotosDataSource_prefetchApproximateAssetsAtIndexPaths_reverseOrder___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__PXPhotosDataSource_prefetchApproximateAssetsAtIndexPaths_reverseOrder___block_invoke_3;
  v6[3] = &unk_1E5DD3088;
  uint64_t v3 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v8 = v4;
  uint64_t v9 = v5;
  [v3 enumerateIndexesWithOptions:v2 usingBlock:v6];
}

void __73__PXPhotosDataSource_prefetchApproximateAssetsAtIndexPaths_reverseOrder___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  uint64_t v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    uint64_t v9 = *(NSObject **)(*(void *)(a1 + 48) + 216);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__PXPhotosDataSource_prefetchApproximateAssetsAtIndexPaths_reverseOrder___block_invoke_4;
    v11[3] = &unk_1E5DD32A8;
    id v12 = v5;
    id v13 = v7;
    dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v11);
    dispatch_async(v9, v10);
  }
}

uint64_t __73__PXPhotosDataSource_prefetchApproximateAssetsAtIndexPaths_reverseOrder___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) prefetchObjectsAtIndexes:*(void *)(a1 + 40)];
}

- (void)prefetchApproximateAssetsAtIndexPaths:(id)a3
{
}

- (BOOL)forceAccurateIndexPath:(id)a3 andAssetsBeforeAndAfter:(int64_t)a4
{
  id v6 = a3;
  if ([(PXPhotosDataSource *)self _allSectionsConsideredAccurate]
    && ![(PXPhotosDataSource *)self _areSecondaryFetchesEnabled])
  {
    BOOL v22 = 0;
  }
  else
  {
    uint64_t v7 = [v6 section];
    BOOL v8 = [MEMORY[0x1E4F28E60] indexSetWithIndex:v7];
    uint64_t v24 = [(PXPhotosDataSource *)self assetCollectionForSection:v7];
    uint64_t v9 = [v24 estimatedAssetCount];
    uint64_t v10 = [v6 item];
    int64_t v11 = (v9 + ~v10) & ~((v9 + ~v10) >> 63);
    int64_t v12 = [(PXPhotosDataSource *)self numberOfSections];
    if (v11 < a4 && v7 + 1 < v12)
    {
      int64_t v14 = v12;
      uint64_t v15 = v7 + 2;
      do
      {
        int64_t v16 = [(PXPhotosDataSource *)self assetCollectionForSection:v15 - 1];
        v11 += [v16 estimatedAssetCount];
        [v8 addIndex:v15 - 1];
      }
      while (v11 < a4 && v15++ < v14);
    }
    uint64_t v18 = [v6 item];
    if (v7 >= 1)
    {
      int64_t v19 = v18 & ~(v18 >> 63);
      while (v19 < a4)
      {
        BOOL v20 = [(PXPhotosDataSource *)self assetCollectionForSection:v7 - 1];
        uint64_t v21 = [v20 estimatedAssetCount];
        [v8 addIndex:v7 - 1];

        if ((unint64_t)v7 < 2) {
          break;
        }
        v19 += v21;
        --v7;
      }
    }
    BOOL v22 = [(PXPhotosDataSource *)self forceAccurateSectionsIfNeeded:v8];
  }
  return v22;
}

- (BOOL)forceAccurateAssetCollectionsIfNeeded:(id)a3 reloadChanges:(BOOL)a4
{
  BOOL v35 = a4;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  if ([(PXPhotosDataSource *)self _allSectionsConsideredAccurate]
    && ![(PXPhotosDataSource *)self _areSecondaryFetchesEnabled])
  {
    BOOL v23 = 0;
  }
  else
  {
    uint64_t v54 = 0;
    uint64_t v55 = &v54;
    uint64_t v56 = 0x3032000000;
    uint64_t v57 = __Block_byref_object_copy__244672;
    uint64_t v58 = __Block_byref_object_dispose__244673;
    id v59 = 0;
    pendingResultsIsolationQueue = self->_pendingResultsIsolationQueue;
    if (pendingResultsIsolationQueue)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__PXPhotosDataSource_forceAccurateAssetCollectionsIfNeeded_reloadChanges___block_invoke;
      block[3] = &unk_1E5DD0588;
      void block[4] = self;
      void block[5] = &v54;
      dispatch_sync(pendingResultsIsolationQueue, block);
    }
    long long v38 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v50 = 0u;
    long long v49 = 0u;
    obuint64_t j = v37;
    uint64_t v6 = [obj countByEnumeratingWithState:&v49 objects:v64 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v50 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          uint64_t v10 = [(PXPhotosDataSource *)self _resultRecordForAssetCollection:v9];
          int64_t v11 = [v10 fetchResult];

          if (!v11)
          {
            int64_t v12 = [(id)v55[5] objectForKeyedSubscript:v9];
            if ([(PXPhotosDataSource *)self _isResultTupleApplicable:v12 forAssetCollection:v9])
            {
              id v13 = PLUIGetLog();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                unint64_t v14 = [(PXPhotosDataSource *)self sectionForAssetCollection:v9];
                *(_DWORD *)buf = 134217984;
                unint64_t v61 = v14;
                _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEBUG, "Forced section %lu, got result from pending", buf, 0xCu);
              }
            }
            else
            {
              uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
              [v15 timeIntervalSinceReferenceDate];
              double v17 = v16;

              uint64_t v18 = [(PXPhotosDataSource *)self _fetchTupleForAssetCollection:v9 calledOnClientQueue:1 isLimitedInitialFetch:0];

              id v13 = PLUIGetLog();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                unint64_t v19 = [(PXPhotosDataSource *)self sectionForAssetCollection:v9];
                BOOL v20 = [MEMORY[0x1E4F1C9C8] date];
                [v20 timeIntervalSinceReferenceDate];
                *(_DWORD *)buf = 134218240;
                unint64_t v61 = v19;
                __int16 v62 = 2048;
                double v63 = (v21 - v17) * 1000.0;
                _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEBUG, "Forced section %lu, fetched on demand, duration:%.2fms", buf, 0x16u);
              }
              int64_t v12 = (void *)v18;
            }

            [v38 setObject:v12 forKeyedSubscript:v9];
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v49 objects:v64 count:16];
      }
      while (v6);
    }

    uint64_t v22 = [v38 count];
    BOOL v23 = v22 != 0;
    if (v22)
    {
      unint64_t options = self->_options;
      uint64_t v25 = [MEMORY[0x1E4F1CA48] array];
      unsigned int v26 = (options >> 5) & 1;
      unsigned int v27 = (options >> 4) & 1;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __74__PXPhotosDataSource_forceAccurateAssetCollectionsIfNeeded_reloadChanges___block_invoke_383;
      aBlock[3] = &unk_1E5DCA340;
      id v28 = v38;
      id v43 = v28;
      char v47 = v26;
      char v48 = v27;
      id v29 = v25;
      id v44 = v29;
      int v45 = self;
      SEL v46 = a2;
      id v30 = (void (**)(void))_Block_copy(aBlock);
      id v31 = v30;
      if (self->_nestedChanges < 1)
      {
        if (v35)
        {
          [(PXPhotosDataSource *)self _willChange];
          v31[2](v31);
          [(PXPhotosDataSource *)self _publishReloadChange];
        }
        else
        {
          uint64_t v32 = [v28 allKeys];
          [(PXPhotosDataSource *)self _performManualChangesForAssetCollections:v32 changeBlock:v31];
        }
      }
      else
      {
        v30[2](v30);
      }
      if (self->_isBackgroundFetching && [v29 count])
      {
        backgroundQueue = self->_backgroundQueue;
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __74__PXPhotosDataSource_forceAccurateAssetCollectionsIfNeeded_reloadChanges___block_invoke_385;
        v40[3] = &unk_1E5DD32A8;
        v40[4] = self;
        id v41 = v29;
        dispatch_async(backgroundQueue, v40);
        [(PXPhotosDataSource *)self _interruptBackgroundFetch];
      }
    }

    _Block_object_dispose(&v54, 8);
  }

  return v23;
}

void __74__PXPhotosDataSource_forceAccurateAssetCollectionsIfNeeded_reloadChanges___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 160) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __74__PXPhotosDataSource_forceAccurateAssetCollectionsIfNeeded_reloadChanges___block_invoke_383(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__PXPhotosDataSource_forceAccurateAssetCollectionsIfNeeded_reloadChanges___block_invoke_2;
  v3[3] = &unk_1E5DCA318;
  __int16 v6 = *(_WORD *)(a1 + 64);
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 48);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __74__PXPhotosDataSource_forceAccurateAssetCollectionsIfNeeded_reloadChanges___block_invoke_385(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) removeObjectsInArray:*(void *)(a1 + 40)];
}

void __74__PXPhotosDataSource_forceAccurateAssetCollectionsIfNeeded_reloadChanges___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [v7 fetchResult];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    int v10 = *(unsigned __int8 *)(a1 + 56);
    if (*(unsigned char *)(a1 + 56))
    {
      int64_t v11 = [v7 keyAssetsFetchResult];
      if (!v11)
      {

        goto LABEL_14;
      }
      uint64_t v3 = v11;
      if (!*(unsigned char *)(a1 + 57))
      {

LABEL_11:
LABEL_12:
        [*(id *)(a1 + 32) addObject:v6];
        goto LABEL_14;
      }
    }
    else if (!*(unsigned char *)(a1 + 57))
    {
      goto LABEL_11;
    }
    int64_t v12 = [v7 curatedFetchResult];

    if (v10) {
    if (v12)
    }
      goto LABEL_12;
  }
LABEL_14:
  id v13 = [*(id *)(a1 + 40) _mutableResultRecordForAssetCollection:v6];
  if (([*(id *)(a1 + 40) _addResultTuple:v7 forAssetCollection:v6 preparedResultRecord:0 toMutableResultRecord:v13] & 1) == 0)PXAssertGetLog(); {
  unint64_t v14 = [*(id *)(a1 + 40) _inaccurateAssetCollections];
  }
  [v14 removeObject:v6];
}

- (BOOL)forceAccurateSectionsIfNeeded:(id)a3 reloadChanges:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ([(PXPhotosDataSource *)self _allSectionsConsideredAccurate]
    && ![(PXPhotosDataSource *)self _areSecondaryFetchesEnabled])
  {
    BOOL v10 = 0;
  }
  else
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__PXPhotosDataSource_forceAccurateSectionsIfNeeded_reloadChanges___block_invoke;
    void v12[3] = &unk_1E5DCA2F0;
    id v13 = v8;
    SEL v14 = a2;
    v12[4] = self;
    id v9 = v8;
    [v7 enumerateIndexesUsingBlock:v12];
    BOOL v10 = [(PXPhotosDataSource *)self forceAccurateAssetCollectionsIfNeeded:v9 reloadChanges:v4];
  }
  return v10;
}

void __66__PXPhotosDataSource_forceAccurateSectionsIfNeeded_reloadChanges___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 368) objectAtIndexedSubscript:a2];
  [v2 addObject:v3];
}

- (BOOL)forceAccurateSectionsIfNeeded:(id)a3
{
  return [(PXPhotosDataSource *)self forceAccurateSectionsIfNeeded:a3 reloadChanges:1];
}

- (BOOL)_forceAccurateSection:(int64_t)a3 andNumberOfSurroundingSectionsWithContent:(int64_t)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if ([(PXPhotosDataSource *)self _allSectionsConsideredAccurate]
    && ![(PXPhotosDataSource *)self _areSecondaryFetchesEnabled])
  {
    return 0;
  }
  uint64_t v38 = 0;
  long long v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  int64_t v7 = [(PXPhotosDataSource *)self numberOfSections];
  uint64_t v8 = [(PXPhotosDataSource *)self filterPredicate];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  id v28 = __86__PXPhotosDataSource__forceAccurateSection_andNumberOfSurroundingSectionsWithContent___block_invoke;
  id v29 = &unk_1E5DCA2C8;
  id v11 = v10;
  int64_t v35 = a3;
  uint64_t v36 = 0;
  int64_t v37 = v7;
  id v30 = v11;
  id v31 = self;
  uint64_t v33 = &v38;
  int64_t v34 = a4;
  id v12 = v9;
  id v32 = v12;
  id v13 = (void (**)(void *, uint64_t, void))_Block_copy(&v26);
  v13[2](v13, 50, 0);
  if (objc_msgSend(v11, "count", v26, v27, v28, v29) < (unint64_t)a4 && objc_msgSend(v12, "count") != v7)
  {
    id v14 = v8;
    if (_predicateByStrippingNoIndex_onceToken != -1) {
      dispatch_once(&_predicateByStrippingNoIndex_onceToken, &__block_literal_global_1028);
    }
    uint64_t v15 = [v14 predicateFormat];
    if ([v15 containsString:@"noindex:"])
    {
      double v16 = objc_msgSend((id)_predicateByStrippingNoIndex_regexp, "stringByReplacingMatchesInString:options:range:withTemplate:", v15, 0, 0, objc_msgSend(v15, "length"), @"$1");
      id v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:v16];
    }
    else
    {
      id v17 = v14;
    }

    if (v17
      && ([MEMORY[0x1E4F38FF8] fetchFilteredAssetCollections:self->_collectionListFetchResult containingAssetsMatchingPredicate:v17], v19 = objc_claimAutoreleasedReturnValue(), (BOOL v20 = v19) != 0))
    {
      if ([v19 count])
      {
        double v21 = [v20 fetchedObjects];
        uint64_t v22 = [(PXPhotosDataSource *)self sectionsForAssetCollections:v21];

        ((void (**)(void *, uint64_t, void *))v13)[2](v13, 0x7FFFFFFFFFFFFFFFLL, v22);
      }
    }
    else
    {
      BOOL v23 = PLUIGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [(PXPhotosDataSource *)self firstAssetCollection];
        *(_DWORD *)buf = 138412546;
        id v43 = self;
        __int16 v44 = 2112;
        int v45 = v24;
        _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_DEFAULT, "%@ forcing everything to find non-empty sections, this is slow, firstAssetCollection:%@", buf, 0x16u);
      }
      v13[2](v13, 0x7FFFFFFFFFFFFFFFLL, 0);
      BOOL v20 = 0;
    }
  }
  BOOL v18 = *((unsigned char *)v39 + 24) != 0;

  _Block_object_dispose(&v38, 8);
  return v18;
}

void __86__PXPhotosDataSource__forceAccurateSection_andNumberOfSurroundingSectionsWithContent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if (a2 >= 1 && (unint64_t)[*(id *)(a1 + 32) count] < *(void *)(a1 + 64))
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = *(void *)(a1 + 72);
      unint64_t v9 = *(void *)(a1 + 80);
      unint64_t v10 = v8 - v7;
      unint64_t v11 = v8 + v7;
      unint64_t v12 = *(void *)(a1 + 88);
      BOOL v13 = v10 < v9 || v10 - v9 >= v12;
      int v14 = !v13;
      BOOL v13 = v11 >= v9;
      unint64_t v15 = v11 - v9;
      int v17 = v13 && v15 < v12;
      if (v14 == 1)
      {
        if (v5 && ![v5 containsIndex:v10])
        {
          if ((v17 & 1) == 0) {
            goto LABEL_26;
          }
LABEL_24:
          if (![v5 containsIndex:v11]) {
            goto LABEL_26;
          }
          goto LABEL_25;
        }
        [v6 addIndex:v10];
      }
      if ((v17 & 1) == 0) {
        goto LABEL_26;
      }
      if (v5) {
        goto LABEL_24;
      }
LABEL_25:
      [v6 addIndex:v11];
LABEL_26:
      if ([v6 count])
      {
        char v18 = [*(id *)(a1 + 40) forceAccurateSectionsIfNeeded:v6 reloadChanges:1];
        uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
        if (*(unsigned char *)(v19 + 24)) {
          char v20 = 1;
        }
        else {
          char v20 = v18;
        }
        *(unsigned char *)(v19 + 24) = v20;
        [*(id *)(a1 + 48) addIndexes:v6];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __86__PXPhotosDataSource__forceAccurateSection_andNumberOfSurroundingSectionsWithContent___block_invoke_2;
        v24[3] = &unk_1E5DD1558;
        int8x16_t v23 = *(int8x16_t *)(a1 + 32);
        id v21 = (id)v23.i64[0];
        int8x16_t v25 = vextq_s8(v23, v23, 8uLL);
        [v6 enumerateIndexesUsingBlock:v24];
        [v6 removeAllIndexes];

        if (++v7 >= a2) {
          break;
        }
      }
      else
      {
        ++v7;
        if ((v14 | v17) != 1 || v7 >= a2) {
          break;
        }
      }
    }
    while ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count", *(_OWORD *)&v23) < *(void *)(a1 + 64));
  }
}

uint64_t __86__PXPhotosDataSource__forceAccurateSection_andNumberOfSurroundingSectionsWithContent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) numberOfItemsInSection:a2];
  if (result >= 1)
  {
    id v5 = *(void **)(a1 + 40);
    return [v5 addIndex:a2];
  }
  return result;
}

- (BOOL)forceAccurateSection:(int64_t)a3 andSectionsBeforeAndAfter:(int64_t)a4
{
  if ([(PXPhotosDataSource *)self _allSectionsConsideredAccurate]
    && ![(PXPhotosDataSource *)self _areSecondaryFetchesEnabled]
    || [(PXPhotosDataSource *)self numberOfSections] < 1)
  {
    return 0;
  }
  id v5 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:");
  BOOL v6 = [(PXPhotosDataSource *)self forceAccurateSectionsIfNeeded:v5 reloadChanges:0];

  return v6;
}

- (BOOL)forceAccurateAllSectionsIfNeeded
{
  if (![(PXPhotosDataSource *)self _allSectionsConsideredAccurate]
    || (BOOL v3 = [(PXPhotosDataSource *)self _areSecondaryFetchesEnabled]))
  {
    if (![(PXPhotosDataSource *)self _areSecondaryFetchesEnabled]) {
      [(PXPhotosDataSource *)self _cancelBackgroundFetchIfNeeded];
    }
    int64_t v4 = [(PXPhotosDataSource *)self numberOfSections];
    id v5 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v4);
    BOOL v6 = [(PXPhotosDataSource *)self forceAccurateSectionsIfNeeded:v5];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (void)setDisableFilters:(BOOL)a3 forAssetCollection:(id)a4
{
  BOOL v4 = a3;
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(PXPhotosDataSource *)self _areFiltersDisabledForAssetCollection:v6] != v4)
  {
    v14[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    id v13 = v6;
    unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__PXPhotosDataSource_setDisableFilters_forAssetCollection___block_invoke;
    v10[3] = &unk_1E5DD21E8;
    v10[4] = self;
    id v11 = v6;
    BOOL v12 = v4;
    [(PXPhotosDataSource *)self _performManualChangesForAssetCollections:v9 collectionsToDiff:0 collectionsToChange:v8 changeBlock:v10];
  }
}

void __59__PXPhotosDataSource_setDisableFilters_forAssetCollection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) infoForAssetCollection:*(void *)(a1 + 40)];
  [v2 _setExplicitlyDisableFilters:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 32) clearResultsForAssetCollection:*(void *)(a1 + 40)];
}

- (void)setIncludeAllBurstAssets:(BOOL)a3
{
  if (self->_includeAllBurstAssets != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __47__PXPhotosDataSource_setIncludeAllBurstAssets___block_invoke;
    v3[3] = &unk_1E5DCFE98;
    void v3[4] = self;
    BOOL v4 = a3;
    [(PXPhotosDataSource *)self _performManualReloadWithChangeBlock:v3];
  }
}

uint64_t __47__PXPhotosDataSource_setIncludeAllBurstAssets___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 323) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setCanIncludeUnsavedSyndicatedAssets:(BOOL)a3
{
  if (self->_canIncludeUnsavedSyndicatedAssets != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __59__PXPhotosDataSource_setCanIncludeUnsavedSyndicatedAssets___block_invoke;
    v3[3] = &unk_1E5DCFE98;
    void v3[4] = self;
    BOOL v4 = a3;
    [(PXPhotosDataSource *)self _performManualReloadWithChangeBlock:v3];
  }
}

uint64_t __59__PXPhotosDataSource_setCanIncludeUnsavedSyndicatedAssets___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 322) = *(unsigned char *)(result + 40);
  return result;
}

- (void)_internalSetLibraryFilter:(int64_t)a3
{
  if (self->_libraryFilter != a3)
  {
    id v5 = [(PXPhotosDataSource *)self _sectionCache];
    id v6 = [v5 assetCollections];

    if ([v6 count])
    {
      uint64_t v7 = [v6 objectAtIndexedSubscript:0];
      [(PXPhotosDataSource *)self _startLibraryFilterChangedSignpostForCollection:v7];
    }
    else
    {
      uint64_t v7 = 0;
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    id v8[2] = __48__PXPhotosDataSource__internalSetLibraryFilter___block_invoke;
    v8[3] = &unk_1E5DD08D8;
    void v8[4] = self;
    void v8[5] = a3;
    [(PXPhotosDataSource *)self _performManualReloadWithChangeBlock:v8];
    if (v7) {
      [(PXPhotosDataSource *)self _endLibraryFilterChangedSignpostForCollection:v7];
    }
  }
}

uint64_t __48__PXPhotosDataSource__internalSetLibraryFilter___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 424) = *(void *)(result + 40);
  return result;
}

- (void)setLibraryFilter:(int64_t)a3
{
  id v5 = [(PXPhotosDataSource *)self libraryFilterState];

  if (v5) {
    PXAssertGetLog();
  }
  id v6 = [(PXPhotosDataSource *)self libraryFilterState];

  if (!v6) {
    [(PXPhotosDataSource *)self _internalSetLibraryFilter:a3];
  }
}

- (void)_endLibraryFilterChangedSignpostForCollection:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(PXPhotosDataSource *)self signpostIntervalId];
  if (v5)
  {
    os_signpost_id_t v6 = v5;
    uint64_t v7 = [(PXPhotosDataSource *)self dataSourceLog];
    uint64_t v8 = v7;
    if (v6 != -1 && os_signpost_enabled(v7))
    {
      unint64_t v9 = [v4 localizedTitle];
      int v10 = 138543362;
      id v11 = v9;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_END, v6, "End Set Library Filter", "%{public}@", (uint8_t *)&v10, 0xCu);
    }
    [(PXPhotosDataSource *)self setSignpostIntervalId:0];
  }
}

- (void)_startLibraryFilterChangedSignpostForCollection:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(PXPhotosDataSource *)self signpostIntervalId])
  {
    unint64_t v5 = [(PXPhotosDataSource *)self dataSourceLog];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, v4);
    uint64_t v7 = v5;
    uint64_t v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      unint64_t v9 = [v4 localizedTitle];
      int v10 = 138543362;
      id v11 = v9;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Begin Set Library Filter", "%{public}@", (uint8_t *)&v10, 0xCu);
    }
    [(PXPhotosDataSource *)self setSignpostIntervalId:v6];
  }
}

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3 provideIncrementalChangeDetailsForAssetCollections:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (self->_includeOthersInSocialGroupAssets != v4)
  {
    uint64_t v7 = [(PXPhotosDataSource *)self _sectionCache];
    uint64_t v8 = [v7 assetCollections];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __109__PXPhotosDataSource_setIncludeOthersInSocialGroupAssets_provideIncrementalChangeDetailsForAssetCollections___block_invoke;
    v10[3] = &unk_1E5DCA2A0;
    v10[4] = self;
    id v11 = v8;
    BOOL v13 = v4;
    id v12 = v6;
    id v9 = v8;
    [(PXPhotosDataSource *)self _performManualChangesForAssetCollections:v9 collectionsToDiff:v12 changeBlock:v10];
  }
}

void *__109__PXPhotosDataSource_setIncludeOthersInSocialGroupAssets_provideIncrementalChangeDetailsForAssetCollections___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) clearResultsForAssetCollections:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 320) = *(unsigned char *)(a1 + 56);
  uint64_t result = *(void **)(a1 + 32);
  if (!result[37])
  {
    uint64_t v3 = *(void *)(a1 + 48);
    return (void *)[result _restartBackgroundFetchWithAssetCollectionsToDiff:v3];
  }
  return result;
}

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3
{
}

- (void)setFilterPredicate:(id)a3 provideIncrementalChangeDetailsForAssetCollections:(id)a4
{
  id v6 = (NSPredicate *)a3;
  id v7 = a4;
  uint64_t v8 = self->_filterPredicate;
  if (v8 == v6)
  {
  }
  else
  {
    id v9 = v8;
    char v10 = [(NSPredicate *)v8 isEqual:v6];

    if ((v10 & 1) == 0)
    {
      id v11 = [(PXPhotosDataSource *)self _sectionCache];
      id v12 = [v11 assetCollections];

      if ([v12 count])
      {
        BOOL v13 = [v12 objectAtIndexedSubscript:0];
        [(PXPhotosDataSource *)self _startFilterPredicateChangedSignpostForCollection:v13];
      }
      else
      {
        BOOL v13 = 0;
      }
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      int v17 = __92__PXPhotosDataSource_setFilterPredicate_provideIncrementalChangeDetailsForAssetCollections___block_invoke;
      char v18 = &unk_1E5DCAEC8;
      uint64_t v19 = self;
      id v20 = v12;
      id v21 = v6;
      id v22 = v7;
      id v14 = v12;
      [(PXPhotosDataSource *)self _performManualChangesForAssetCollections:v14 collectionsToDiff:v22 changeBlock:&v15];
      if (v13) {
        -[PXPhotosDataSource _endFilterPredicateChangedForCollection:](self, "_endFilterPredicateChangedForCollection:", v13, v15, v16, v17, v18, v19, v20, v21, v22);
      }
    }
  }
}

void *__92__PXPhotosDataSource_setFilterPredicate_provideIncrementalChangeDetailsForAssetCollections___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) clearResultsForAssetCollections:*(void *)(a1 + 40)];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 416), *(id *)(a1 + 48));
  uint64_t result = *(void **)(a1 + 32);
  if (!result[37])
  {
    uint64_t v3 = *(void *)(a1 + 56);
    return (void *)[result _restartBackgroundFetchWithAssetCollectionsToDiff:v3];
  }
  return result;
}

- (void)setFilterPredicate:(id)a3
{
}

- (void)_endFilterPredicateChangedForCollection:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(PXPhotosDataSource *)self signpostIntervalId];
  if (v5)
  {
    os_signpost_id_t v6 = v5;
    id v7 = [(PXPhotosDataSource *)self dataSourceLog];
    uint64_t v8 = v7;
    if (v6 != -1 && os_signpost_enabled(v7))
    {
      id v9 = [v4 localIdentifier];
      int v10 = 138543362;
      id v11 = v9;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_END, v6, "End Set Filter Predicate", "%{public}@", (uint8_t *)&v10, 0xCu);
    }
    [(PXPhotosDataSource *)self setSignpostIntervalId:0];
  }
}

- (void)_startFilterPredicateChangedSignpostForCollection:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(PXPhotosDataSource *)self signpostIntervalId])
  {
    unint64_t v5 = [(PXPhotosDataSource *)self dataSourceLog];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, v4);
    id v7 = v5;
    uint64_t v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      id v9 = [v4 localIdentifier];
      int v10 = 138543362;
      id v11 = v9;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Begin Set Filter Predicate", "%{public}@", (uint8_t *)&v10, 0xCu);
    }
    [(PXPhotosDataSource *)self setSignpostIntervalId:v6];
  }
}

- (BOOL)supportsCurationToggling
{
  return (self->_options & 0x20050) == 16;
}

- (BOOL)supportsDynamicBackgroundFetching
{
  return (self->_options & 0x1400) == 4096;
}

- (PHAssetCollection)containerAssetCollection
{
  uint64_t v3 = self->_containerCollection;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
LABEL_5:
    unint64_t v5 = v4;
    goto LABEL_7;
  }
  if ([(PXPhotosDataSource *)self numberOfSections] == 1)
  {
    id v4 = [(PXPhotosDataSource *)self firstAssetCollection];
    goto LABEL_5;
  }
  unint64_t v5 = 0;
LABEL_7:

  return (PHAssetCollection *)v5;
}

- (id)container
{
  if (!self->_assetContainerProvider
    || ([(PXPhotosDataSource *)self containerAssetCollection],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) == 0)
    || (id v4 = (void *)v3,
        (*((void (**)(void))self->_assetContainerProvider + 2))(),
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    unint64_t v5 = [(PXPhotosDataSource *)self containerCollection];
  }
  return v5;
}

- (id)assetsAtIndexPaths:(id)a3
{
  unint64_t v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = [v5 array];
  int64_t v8 = [(PXPhotosDataSource *)self versionIdentifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__PXPhotosDataSource_assetsAtIndexPaths___block_invoke;
  v13[3] = &unk_1E5DCA278;
  int64_t v15 = v8;
  SEL v16 = a2;
  v13[4] = self;
  id v9 = v7;
  id v14 = v9;
  [v6 enumerateItemIndexSetsUsingBlock:v13];

  int v10 = v14;
  id v11 = v9;

  return v11;
}

void __41__PXPhotosDataSource_assetsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (*(void *)(a1 + 48) != a2)
  {
    int v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 32), @"PXPhotosDataSource.m", 2804, @"Identifier must match (%lu != %lu)", *(void *)(a1 + 48), a2);
  }
  int64_t v8 = [*(id *)(a1 + 32) assetsInSection:a3];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__PXPhotosDataSource_assetsAtIndexPaths___block_invoke_2;
  v11[3] = &unk_1E5DD1558;
  id v12 = v8;
  id v13 = *(id *)(a1 + 40);
  id v9 = v8;
  [v7 enumerateIndexesUsingBlock:v11];
}

void __41__PXPhotosDataSource_assetsAtIndexPaths___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

- (id)fetchResultWithAssetsAtIndexPaths:(id)a3
{
  unint64_t v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = [v5 array];
  int64_t v8 = [(PXPhotosDataSource *)self versionIdentifier];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  int v17 = __56__PXPhotosDataSource_fetchResultWithAssetsAtIndexPaths___block_invoke;
  char v18 = &unk_1E5DCA278;
  int64_t v21 = v8;
  SEL v22 = a2;
  uint64_t v19 = self;
  id v20 = v7;
  id v9 = v7;
  [v6 enumerateItemIndexSetsUsingBlock:&v15];

  id v10 = objc_alloc(MEMORY[0x1E4F39150]);
  photoLibrary = self->_photoLibrary;
  id v12 = objc_msgSend(MEMORY[0x1E4F38EB8], "fetchType", v15, v16, v17, v18, v19);
  id v13 = (void *)[v10 initWithOids:v9 photoLibrary:photoLibrary fetchType:v12 fetchPropertySets:0 identifier:0 registerIfNeeded:1];

  return v13;
}

void __56__PXPhotosDataSource_fetchResultWithAssetsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v13 = a4;
  if (*(void *)(a1 + 48) != a2)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 32), @"PXPhotosDataSource.m", 2787, @"Identifier must match (%lu != %lu)", *(void *)(a1 + 48), a2);
  }
  id v7 = [*(id *)(a1 + 32) assetsInSection:a3];
  int64_t v8 = v7;
  if (v7)
  {
    id v9 = [v7 fetchedObjectIDs];
    if ([v9 count])
    {
      id v10 = *(void **)(a1 + 40);
      id v11 = [v9 objectsAtIndexes:v13];
      [v10 addObjectsFromArray:v11];
    }
  }
}

- (id)fetchResultWithAssetsInSections:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = [v4 array];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __54__PXPhotosDataSource_fetchResultWithAssetsInSections___block_invoke;
  uint64_t v16 = &unk_1E5DD1558;
  int v17 = self;
  id v18 = v6;
  id v7 = v6;
  [v5 enumerateIndexesUsingBlock:&v13];

  id v8 = objc_alloc(MEMORY[0x1E4F39150]);
  photoLibrary = self->_photoLibrary;
  id v10 = objc_msgSend(MEMORY[0x1E4F38EB8], "fetchType", v13, v14, v15, v16, v17);
  id v11 = (void *)[v8 initWithOids:v7 photoLibrary:photoLibrary fetchType:v10 fetchPropertySets:0 identifier:0 registerIfNeeded:1];

  return v11;
}

void __54__PXPhotosDataSource_fetchResultWithAssetsInSections___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) assetsInSection:a2];
  if (v3)
  {
    id v5 = v3;
    id v4 = [v3 fetchedObjectIDs];
    if ([v4 count]) {
      [*(id *)(a1 + 40) addObjectsFromArray:v4];
    }

    id v3 = v5;
  }
}

- (id)_fetchAssetsStartingAtIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PXPhotosDataSource *)self numberOfSections];
  uint64_t v6 = [v4 section];
  int8x16_t v23 = v4;
  uint64_t v7 = [v4 item];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  int64_t v9 = v5 - v6;
  if (v5 > v6)
  {
    uint64_t v10 = 0;
    do
    {
      id v11 = [(PXPhotosDataSource *)self assetsInSection:v6 + v10];
      id v12 = v11;
      if (v11)
      {
        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
        uint64_t v14 = [v12 count];
        if (v10 == 0 && v7 > 0) {
          uint64_t v15 = v7;
        }
        else {
          uint64_t v15 = 0;
        }
        uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v15, v14 - v15);
        int v17 = [v12 objectsAtIndexes:v16];
        [v13 addObjectsFromArray:v17];

        [v8 addObjectsFromArray:v13];
      }

      ++v10;
    }
    while (v9 != v10);
  }
  if ([v8 count])
  {
    id v18 = objc_alloc(MEMORY[0x1E4F39150]);
    photoLibrary = self->_photoLibrary;
    id v20 = [MEMORY[0x1E4F38EB8] fetchType];
    int64_t v21 = (void *)[v18 initWithObjects:v8 photoLibrary:photoLibrary fetchType:v20 fetchPropertySets:0 identifier:0 registerIfNeeded:1];
  }
  else
  {
    int64_t v21 = 0;
  }

  return v21;
}

- (id)assetsStartingAtIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PXPhotosDataSource *)self numberOfSections];
  uint64_t v6 = [v4 section];
  uint64_t v24 = v4;
  uint64_t v7 = [v4 item];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  int64_t v9 = v5 - v6;
  if (v5 <= v6)
  {
LABEL_12:
    id v20 = objc_alloc(MEMORY[0x1E4F39150]);
    photoLibrary = self->_photoLibrary;
    SEL v22 = [MEMORY[0x1E4F38EB8] fetchType];
    uint64_t v19 = (void *)[v20 initWithOids:v8 photoLibrary:photoLibrary fetchType:v22 fetchPropertySets:0 identifier:0 registerIfNeeded:1];

    goto LABEL_13;
  }
  uint64_t v10 = 0;
  while (1)
  {
    id v11 = [(PXPhotosDataSource *)self assetsInSection:v6 + v10];
    id v12 = v11;
    if (v11) {
      break;
    }
LABEL_9:

    if (v9 == ++v10) {
      goto LABEL_12;
    }
  }
  uint64_t v13 = [v11 fetchedObjectIDs];
  if ([v13 count])
  {
    id v14 = v13;
    uint64_t v15 = v14;
    uint64_t v16 = v14;
    if (!v10)
    {
      uint64_t v16 = v14;
      if (v7 >= 1)
      {
        uint64_t v17 = [v14 count];
        id v18 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v7, v17 - v7);
        uint64_t v16 = [v15 objectsAtIndexes:v18];
      }
    }
    [v8 addObjectsFromArray:v16];

    goto LABEL_9;
  }
  [v8 removeAllObjects];
  uint64_t v19 = [(PXPhotosDataSource *)self _fetchAssetsStartingAtIndexPath:v24];

  if (!v19) {
    goto LABEL_12;
  }
LABEL_13:

  return v19;
}

- (BOOL)containsMultipleAssets
{
  if ([(PXPhotosDataSource *)self isEmpty]) {
    return 0;
  }
  uint64_t v4 = [(PXPhotosDataSource *)self numberOfSections];
  uint64_t v5 = [(PXPhotosDataSource *)self numberOfItemsInSection:0];
  if (v4 >= 2) {
    v5 += [(PXPhotosDataSource *)self numberOfItemsInSection:v4 - 1];
  }
  if (v5 > 1) {
    return 1;
  }
  int64_t v6 = [(PXPhotosDataSource *)self backgroundFetchOriginSection];
  if (v6 >= v4 - 1) {
    uint64_t v7 = v4 - 1;
  }
  else {
    uint64_t v7 = v6;
  }
  uint64_t v8 = v7 & ~(v7 >> 63);
  if (v8 >= v4)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = v7 & ~(v7 >> 63);
    do
      v9 += [(PXPhotosDataSource *)self numberOfItemsInSection:v10++];
    while (v10 < v4 && v9 < 2);
  }
  if (v7 >= 1)
  {
    uint64_t v11 = v8 + 1;
    do
    {
      if (v8 > v4) {
        break;
      }
      if (v9 >= 2) {
        break;
      }
      v9 += [(PXPhotosDataSource *)self numberOfItemsInSection:v11 - 2];
      --v11;
    }
    while (v11 > 1);
  }
  return v9 > 1;
}

void __29__PXPhotosDataSource_isEmpty__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  int64_t v6 = [a3 exposedFetchResult];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (id)uncuratedAssetsInSection:(int64_t)a3
{
  uint64_t v4 = [(PXPhotosDataSource *)self assetCollectionForSection:a3];
  if (v4)
  {
    uint64_t v5 = [(PXPhotosDataSource *)self uncuratedAssetsForAssetCollection:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)curatedAssetsInSection:(int64_t)a3
{
  uint64_t v4 = [(PXPhotosDataSource *)self assetCollectionForSection:a3];
  if (v4)
  {
    uint64_t v5 = [(PXPhotosDataSource *)self curatedAssetsForAssetCollection:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)uncuratedAssetsForAssetCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosDataSource *)self _assetsForAssetCollection:v4];
  int64_t v6 = [(PXPhotosDataSource *)self _resultRecordForAssetCollection:v4];

  uint64_t v7 = [v6 fetchResult];

  return v7;
}

- (id)curatedAssetsForAssetCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosDataSource *)self _assetsForAssetCollection:v4];
  int64_t v6 = [(PXPhotosDataSource *)self _resultRecordForAssetCollection:v4];

  uint64_t v7 = [v6 curatedFetchResult];

  return v7;
}

- (BOOL)isCuratedAssetsFutilelyForAssetCollection:(id)a3
{
  id v4 = a3;
  if ([(PXPhotosDataSource *)self wantsCurationForAssetCollection:v4])
  {
    id v5 = [(PXPhotosDataSource *)self curatedAssetsForAssetCollection:v4];
    int64_t v6 = [(PXPhotosDataSource *)self uncuratedAssetsForAssetCollection:v4];
    unint64_t v7 = [v6 count];
    BOOL v8 = v7 <= [v5 count];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isCuratedAssetsEmptyForAssetCollection:(id)a3
{
  if (!a3) {
    return 1;
  }
  id v3 = -[PXPhotosDataSource curatedAssetsForAssetCollection:](self, "curatedAssetsForAssetCollection:");
  id v4 = v3;
  if (v3) {
    BOOL v5 = [v3 count] == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasCurationForAssetCollection:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = -[PXPhotosDataSource _resultRecordForAssetCollection:](self, "_resultRecordForAssetCollection:");
  char v4 = [v3 isCurated];

  return v4;
}

- (BOOL)wantsCurationForAssetCollection:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXPhotosDataSource *)self wantsCurationByDefault];
  if (v4)
  {
    int64_t v6 = [(PXPhotosDataSource *)self _resultRecordForAssetCollection:v4];
    char v7 = [v6 wantsCuration];
  }
  else
  {
    char v7 = v5;
  }

  return v7;
}

- (BOOL)wantsCurationForFirstAssetCollection
{
  id v2 = self;
  id v3 = [(PXPhotosDataSource *)self firstAssetCollection];
  LOBYTE(v2) = [(PXPhotosDataSource *)v2 wantsCurationForAssetCollection:v3];

  return (char)v2;
}

- (void)refetchResultsForAssetCollection:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(PXPhotosDataSource *)self sectionForAssetCollection:v4];
  if (![(PXPhotosDataSource *)self isImmutable] && v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v6 = (PHFetchResult *)[(PHFetchResult *)self->_collectionListFetchResult copyWithOptions:&unk_1F02DB860];
    collectionListFetchResult = self->_collectionListFetchResult;
    self->_collectionListFetchResult = v6;

    BOOL v8 = [(PXPhotosDataSource *)self assetCollectionForSection:v5];

    v12[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__PXPhotosDataSource_refetchResultsForAssetCollection___block_invoke;
    v10[3] = &unk_1E5DD32A8;
    v10[4] = self;
    id v4 = v8;
    id v11 = v4;
    [(PXPhotosDataSource *)self _performManualChangesForAssetCollections:v9 changeBlock:v10];
  }
}

void __55__PXPhotosDataSource_refetchResultsForAssetCollection___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _mutableResultRecordForAssetCollection:*(void *)(a1 + 40)];
  [v3 setFetchResult:0 reverseSortOrder:0];
  [v3 setKeyAssetsFetchResult:0];
  [v3 setCuratedFetchResult:0];
  id v2 = [*(id *)(a1 + 32) fetcher];
  [v2 clearFetchResultsForAssetCollection:*(void *)(a1 + 40)];
}

- (void)clearResultsForAssetCollections:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(PXPhotosDataSource *)self fetcher];
  [v5 clearFetchResultsForAssetCollections:v4];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [(PXPhotosDataSource *)self _mutableResultRecordForAssetCollection:*(void *)(*((void *)&v21 + 1) + 8 * v10)];
        [v11 setFetchResult:0 reverseSortOrder:0];
        [v11 setCuratedFetchResult:0];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  pendingResultsIsolationQueue = self->_pendingResultsIsolationQueue;
  if (pendingResultsIsolationQueue)
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __54__PXPhotosDataSource_clearResultsForAssetCollections___block_invoke;
    id v18 = &unk_1E5DD32A8;
    uint64_t v19 = self;
    id v20 = v6;
    dispatch_sync(pendingResultsIsolationQueue, &v15);
  }
  uint64_t v13 = (PHFetchResult *)-[PHFetchResult copyWithOptions:](self->_collectionListFetchResult, "copyWithOptions:", &unk_1F02DB838, v15, v16, v17, v18, v19);
  collectionListFetchResult = self->_collectionListFetchResult;
  self->_collectionListFetchResult = v13;
}

uint64_t __54__PXPhotosDataSource_clearResultsForAssetCollections___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 160) removeObjectsForKeys:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 168);
  return [v3 removeObjectsForKeys:v2];
}

- (void)clearResultsForAssetCollection:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = a3;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    id v6 = [v4 arrayWithObjects:&v7 count:1];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  -[PXPhotosDataSource clearResultsForAssetCollections:](self, "clearResultsForAssetCollections:", v6, v7, v8);
}

- (void)stopExcludingAssets:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count] && !-[PXPhotosDataSource isImmutable](self, "isImmutable"))
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [*(id *)(*((void *)&v23 + 1) + 8 * v10) objectID];
          [v5 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }

    id v12 = [MEMORY[0x1E4F1CA48] array];
    resultRecordByAssetCollection = self->_resultRecordByAssetCollection;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __42__PXPhotosDataSource_stopExcludingAssets___block_invoke;
    v20[3] = &unk_1E5DCA228;
    id v14 = v5;
    id v21 = v14;
    id v15 = v12;
    id v22 = v15;
    [(NSMutableDictionary *)resultRecordByAssetCollection enumerateKeysAndObjectsUsingBlock:v20];
    if ([v15 count])
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __42__PXPhotosDataSource_stopExcludingAssets___block_invoke_2;
      v16[3] = &unk_1E5DD0F30;
      id v17 = v15;
      id v18 = self;
      id v19 = v14;
      [(PXPhotosDataSource *)self _performManualChangesForAssetCollections:v17 changeBlock:v16];
    }
  }
}

void __42__PXPhotosDataSource_stopExcludingAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = [a3 excludedOids];
  int v6 = [v5 intersectsSet:*(void *)(a1 + 32)];

  if (v6) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

void __42__PXPhotosDataSource_stopExcludingAssets___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(a1 + 40), "_mutableResultRecordForAssetCollection:", *(void *)(*((void *)&v8 + 1) + 8 * v6), (void)v8);
        [v7 stopExcludingOids:*(void *)(a1 + 48)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)forceExcludeAssetsAtIndexPaths:(id)a3
{
  id v4 = a3;
  objc_msgSend(off_1E5DA6F50, "indexPathSetWithItemIndexPaths:dataSourceIdentifier:", v4, -[PXPhotosDataSource versionIdentifier](self, "versionIdentifier"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [(PXPhotosDataSource *)self forceExcludeAssetsAtIndexes:v5];
}

- (void)forceExcludeAssetsAtIndexes:(id)a3
{
  id v5 = a3;
  if ([v5 count] && !-[PXPhotosDataSource isImmutable](self, "isImmutable"))
  {
    int64_t v6 = [(PXPhotosDataSource *)self versionIdentifier];
    id v7 = objc_alloc_init((Class)off_1E5DA7430);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__PXPhotosDataSource_forceExcludeAssetsAtIndexes___block_invoke;
    v16[3] = &unk_1E5DCA0A0;
    int64_t v18 = v6;
    SEL v19 = a2;
    void v16[4] = self;
    id v8 = v7;
    id v17 = v8;
    [v5 enumerateItemIndexPathsUsingBlock:v16];
    if ([v8 count] >= 1)
    {
      long long v9 = (void *)[v5 mutableCopy];
      [v9 minusIndexPathSet:v8];

      id v5 = v9;
    }
    long long v10 = [(PXPhotosDataSource *)self _assetOidsByAssetCollectionForAssetsAtIndexPathsInSet:v5];
    long long v11 = [v10 allKeys];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__PXPhotosDataSource_forceExcludeAssetsAtIndexes___block_invoke_2;
    v13[3] = &unk_1E5DD32A8;
    id v14 = v10;
    id v15 = self;
    id v12 = v10;
    [(PXPhotosDataSource *)self _performManualChangesForAssetCollections:v11 changeBlock:v13];
  }
}

void __50__PXPhotosDataSource_forceExcludeAssetsAtIndexes___block_invoke(uint64_t a1, long long *a2)
{
  if (*(void *)a2 != *(void *)(a1 + 48)) {
    PXAssertGetLog();
  }
  id v4 = *(void **)(a1 + 32);
  long long v5 = a2[1];
  *(_OWORD *)buf = *a2;
  long long v16 = v5;
  int64_t v6 = [v4 assetAtSimpleIndexPath:buf];
  id v7 = [v6 burstIdentifier];

  if (v7)
  {
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = [*(id *)(a1 + 32) versionIdentifier];
    uint64_t v10 = *((void *)a2 + 1);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __50__PXPhotosDataSource_forceExcludeAssetsAtIndexes___block_invoke_364;
    void v12[3] = &__block_descriptor_64_e27_v16__0__NSMutableIndexSet_8l;
    long long v11 = a2[1];
    long long v13 = *a2;
    long long v14 = v11;
    [v8 modifyItemIndexSetForDataSourceIdentifier:v9 section:v10 usingBlock:v12];
  }
}

uint64_t __50__PXPhotosDataSource_forceExcludeAssetsAtIndexes___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__PXPhotosDataSource_forceExcludeAssetsAtIndexes___block_invoke_3;
  v3[3] = &unk_1E5DCA1E0;
  uint64_t v1 = *(void **)(a1 + 32);
  void v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

void __50__PXPhotosDataSource_forceExcludeAssetsAtIndexes___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [v4 _mutableResultRecordForAssetCollection:a2];
  [v6 excludeOids:v5];
}

uint64_t __50__PXPhotosDataSource_forceExcludeAssetsAtIndexes___block_invoke_364(uint64_t a1, void *a2)
{
  return [a2 addIndex:*(void *)(a1 + 48)];
}

- (void)stopForceIncludingAllAssets
{
  if (![(PXPhotosDataSource *)self isImmutable])
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    resultRecordByAssetCollection = self->_resultRecordByAssetCollection;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__PXPhotosDataSource_stopForceIncludingAllAssets__block_invoke;
    v10[3] = &unk_1E5DCA078;
    id v5 = v3;
    id v11 = v5;
    [(NSMutableDictionary *)resultRecordByAssetCollection enumerateKeysAndObjectsUsingBlock:v10];
    if ([v5 count])
    {
      id v6 = [v5 allKeys];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      id v7[2] = __49__PXPhotosDataSource_stopForceIncludingAllAssets__block_invoke_2;
      v7[3] = &unk_1E5DD32A8;
      id v8 = v5;
      uint64_t v9 = self;
      [(PXPhotosDataSource *)self _performManualChangesForAssetCollections:v6 changeBlock:v7];
    }
  }
}

void __49__PXPhotosDataSource_stopForceIncludingAllAssets__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [v5 includedOids];
  uint64_t v7 = [v6 count];

  if (v7) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v8];
  }
}

uint64_t __49__PXPhotosDataSource_stopForceIncludingAllAssets__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__PXPhotosDataSource_stopForceIncludingAllAssets__block_invoke_3;
  v3[3] = &unk_1E5DCA078;
  uint64_t v1 = *(void **)(a1 + 32);
  void v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

void __49__PXPhotosDataSource_stopForceIncludingAllAssets__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) _mutableResultRecordForAssetCollection:a2];
  [v2 stopIncludingAllOids];
}

- (void)forceIncludeAssetsAtIndexPaths:(id)a3
{
  id v4 = a3;
  objc_msgSend(off_1E5DA6F50, "indexPathSetWithItemIndexPaths:dataSourceIdentifier:", v4, -[PXPhotosDataSource versionIdentifier](self, "versionIdentifier"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [(PXPhotosDataSource *)self forceIncludeAssetsAtIndexes:v5];
}

- (void)forceIncludeAssetsAtIndexes:(id)a3
{
  id v4 = a3;
  if ([v4 count] && !-[PXPhotosDataSource isImmutable](self, "isImmutable"))
  {
    id v5 = [(PXPhotosDataSource *)self _assetOidsByAssetCollectionForAssetsAtIndexPathsInSet:v4];
    id v6 = [v5 allKeys];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    id v8[2] = __50__PXPhotosDataSource_forceIncludeAssetsAtIndexes___block_invoke;
    v8[3] = &unk_1E5DD32A8;
    id v9 = v5;
    uint64_t v10 = self;
    id v7 = v5;
    [(PXPhotosDataSource *)self _performManualChangesForAssetCollections:v6 changeBlock:v8];
  }
}

uint64_t __50__PXPhotosDataSource_forceIncludeAssetsAtIndexes___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__PXPhotosDataSource_forceIncludeAssetsAtIndexes___block_invoke_2;
  v3[3] = &unk_1E5DCA1E0;
  uint64_t v1 = *(void **)(a1 + 32);
  void v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

void __50__PXPhotosDataSource_forceIncludeAssetsAtIndexes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [v4 _mutableResultRecordForAssetCollection:a2];
  [v6 includeOids:v5];
}

- (id)fetchResultsByAssetCollection
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[PXPhotosDataSource numberOfSections](self, "numberOfSections"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(PXPhotosDataSource *)self collectionListFetchResult];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = [(PXPhotosDataSource *)self assetsInSection:[(PXPhotosDataSource *)self sectionForAssetCollection:v9]];
        [v3 setObject:v10 forKeyedSubscript:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)enumerateStartingAtIndexPath:(id)a3 reverseDirection:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  uint64_t v10 = (void (**)(id, void *, unsigned char *))a5;
  if (!v10)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXPhotosDataSource.m", 2342, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
  }
  if (v6) {
    uint64_t v11 = -1;
  }
  else {
    uint64_t v11 = 1;
  }
  int64_t v22 = [(PXPhotosDataSource *)self numberOfSections];
  uint64_t v12 = [v9 section];
  uint64_t v13 = [v9 item];
  char v23 = 0;
  if ((v12 & 0x8000000000000000) == 0)
  {
    uint64_t v14 = v13;
    uint64_t v15 = v12;
    do
    {
      if (v15 >= v22 || v23) {
        break;
      }
      long long v16 = self;
      int64_t v17 = [(PXPhotosDataSource *)self numberOfItemsInSection:v15];
      uint64_t v18 = v17 - 1;
      if (!v6) {
        uint64_t v18 = 0;
      }
      if (v15 != v12) {
        uint64_t v14 = v18;
      }
      if ((v14 & 0x8000000000000000) == 0)
      {
        int64_t v19 = v17;
        do
        {
          if (v14 >= v19) {
            break;
          }
          if (v23) {
            break;
          }
          id v20 = [MEMORY[0x1E4F28D58] indexPathForItem:v14 inSection:v15];
          v10[2](v10, v20, &v23);

          v14 += v11;
        }
        while (v14 >= 0);
      }
      v15 += v11;
      self = v16;
    }
    while (v15 >= 0);
  }
}

- (id)indexPathForLastAsset
{
  if (![(PXPhotosDataSource *)self isEmpty])
  {
    int64_t v4 = [(PXPhotosDataSource *)self numberOfSections];
    while (v4-- >= 1)
    {
      uint64_t v6 = [(PXPhotosDataSource *)self numberOfItemsInSection:v4];
      if (v6 >= 1)
      {
        uint64_t v3 = [MEMORY[0x1E4F28D58] indexPathForItem:v6 - 1 inSection:v4];
        goto LABEL_7;
      }
    }
  }
  uint64_t v3 = 0;
LABEL_7:
  return v3;
}

- (id)indexPathForFirstAsset
{
  if ([(PXPhotosDataSource *)self isEmpty]
    || [(PXPhotosDataSource *)self numberOfSections] < 1)
  {
LABEL_6:
    int64_t v4 = 0;
  }
  else
  {
    uint64_t v3 = 0;
    while ([(PXPhotosDataSource *)self numberOfItemsInSection:v3] < 1)
    {
      if (++v3 >= [(PXPhotosDataSource *)self numberOfSections]) {
        goto LABEL_6;
      }
    }
    int64_t v4 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v3];
  }
  return v4;
}

- (id)assetReferenceAtIndexPath:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(PXPhotosDataSource *)self assetAtIndexPath:v4];
    objc_claimAutoreleasedReturnValue();
    -[PXPhotosDataSource assetCollectionForSection:](self, "assetCollectionForSection:", [v4 section]);
    objc_claimAutoreleasedReturnValue();
    id v5 = objc_alloc((Class)off_1E5DA55E0);
    [(PXPhotosDataSource *)self versionIdentifier];
    PXSimpleIndexPathFromIndexPath();
  }
  return 0;
}

- (id)assetReferenceForAsset:(id)a3 containedInAssetCollectionWithType:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAsset:v6 withType:a4 options:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        unint64_t v13 = [(PXPhotosDataSource *)self sectionForAssetCollection:v12];
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v14 = v13;
          [(PXPhotosDataSource *)self forceAccurateSection:v13 andSectionsBeforeAndAfter:0];
          uint64_t v15 = [(PXPhotosDataSource *)self uncuratedAssetsInSection:v14];
          if ([v15 containsObject:v6])
          {
            id v17 = objc_alloc((Class)off_1E5DA55E0);
            long long v18 = *((_OWORD *)off_1E5DAB028 + 1);
            v20[0] = *(_OWORD *)off_1E5DAB028;
            v20[1] = v18;
            long long v16 = (void *)[v17 initWithSectionObject:v12 itemObject:v6 subitemObject:0 indexPath:v20];

            goto LABEL_13;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  long long v16 = 0;
LABEL_13:

  return v16;
}

- (id)indexPathForAssetReference:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 simpleIndexPath];
    if (v15 == [(PXPhotosDataSource *)self versionIdentifier])
    {
      [v5 simpleIndexPath];
      goto LABEL_10;
    }
  }
  else if (![(PXPhotosDataSource *)self versionIdentifier])
  {
LABEL_10:
    PXIndexPathFromSimpleIndexPath();
  }
  id v6 = [v5 asset];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v5 asset];

    if (!v7)
    {
      uint64_t v10 = 0;
      goto LABEL_19;
    }
    uint64_t v8 = [v5 assetCollection];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v5 assetCollection];
    }
    else
    {
      uint64_t v9 = 0;
    }

    uint64_t v11 = [(NSDictionary *)self->_hintIndexPathByAssetReferenceCache objectForKeyedSubscript:v5];
    uint64_t v12 = v11;
    if (!v11)
    {
      if (v5) {
        [v5 simpleIndexPath];
      }
      PXIndexPathFromSimpleIndexPath();
    }
    id v13 = v11;
    uint64_t v10 = [(PXPhotosDataSource *)self indexPathForAsset:v7 hintIndexPath:v13 hintCollection:v9];
  }
  else
  {
    uint64_t v10 = 0;
    id v7 = v6;
  }

LABEL_19:
  return v10;
}

- (id)_indexPathForAssetWithUUID:(id)a3 orBurstIdentifier:(id)a4 orSyndicationIdentifier:(id)a5 hintIndexPath:(id)a6 hintCollections:(id)a7
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [v12 length];
  if (v14 || v17)
  {
    uint64_t v45 = 0;
    uint64_t v46 = &v45;
    uint64_t v47 = 0x3032000000;
    char v48 = __Block_byref_object_copy__244672;
    long long v49 = __Block_byref_object_dispose__244673;
    id v50 = 0;
    int64_t v19 = [(PXPhotosDataSource *)self _closestIndexPathToIndexPath:v15];
    uint64_t v41 = 0;
    objc_super v42 = &v41;
    uint64_t v43 = 0x2020000000;
    uint64_t v44 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    v40[3] = 150;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __121__PXPhotosDataSource__indexPathForAssetWithUUID_orBurstIdentifier_orSyndicationIdentifier_hintIndexPath_hintCollections___block_invoke;
    aBlock[3] = &unk_1E5DCA1B8;
    int64_t v37 = &v41;
    void aBlock[4] = self;
    id v34 = v14;
    id v20 = v12;
    id v35 = v20;
    id v36 = v13;
    uint64_t v38 = &v45;
    long long v39 = v40;
    long long v21 = _Block_copy(aBlock);
    [(PXPhotosDataSource *)self enumerateStartingAtIndexPath:v19 reverseDirection:0 usingBlock:v21];
    long long v22 = (void *)v46[5];
    if (!v22)
    {
      v42[3] = 0;
      [(PXPhotosDataSource *)self enumerateStartingAtIndexPath:v19 reverseDirection:1 usingBlock:v21];
      long long v22 = (void *)v46[5];
      if (!v22)
      {
        id v32 = [MEMORY[0x1E4F38EB8] localIdentifierWithUUID:v20];
        long long v23 = [(PXPhotosDataSource *)self photoLibrary];
        id v31 = objc_msgSend(v23, "px_standardLibrarySpecificFetchOptions");

        long long v24 = (void *)MEMORY[0x1E4F38EB8];
        v51[0] = v32;
        long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
        uint64_t v26 = [v24 fetchAssetsWithLocalIdentifiers:v25 options:v31];

        uint64_t v27 = [v26 lastObject];
        if (v27)
        {
          uint64_t v28 = [(PXPhotosDataSource *)self indexPathForAsset:v27 hintIndexPath:v15 hintCollections:v16];
          id v29 = (void *)v46[5];
          v46[5] = v28;
        }
        long long v22 = (void *)v46[5];
      }
    }
    id v18 = v22;

    _Block_object_dispose(v40, 8);
    _Block_object_dispose(&v41, 8);

    _Block_object_dispose(&v45, 8);
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

void __121__PXPhotosDataSource__indexPathForAssetWithUUID_orBurstIdentifier_orSyndicationIdentifier_hintIndexPath_hintCollections___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  id v18 = v6;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "assetAtIndexPath:");
  uint64_t v8 = v7;
  if (*(void *)(a1 + 40))
  {
    [v7 fetchPropertySetsIfNeeded];
    uint64_t v9 = [v8 curationProperties];
    uint64_t v10 = [v9 syndicationIdentifier];
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = [v8 uuid];
  if ([v11 isEqualToString:*(void *)(a1 + 48)]) {
    goto LABEL_8;
  }
  uint64_t v12 = [v8 burstIdentifier];
  if (v12)
  {
    id v13 = (void *)v12;
    id v14 = *(void **)(a1 + 56);
    id v15 = [v8 burstIdentifier];
    if ([v14 isEqualToString:v15])
    {

LABEL_8:
LABEL_9:
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a2);
      *a3 = 1;
      goto LABEL_10;
    }
    if (v10)
    {
      char v17 = [*(id *)(a1 + 40) isEqualToString:v10];

      if (v17) {
        goto LABEL_9;
      }
      goto LABEL_10;
    }

LABEL_22:
    goto LABEL_10;
  }
  if (!v10) {
    goto LABEL_22;
  }
  char v16 = [*(id *)(a1 + 40) isEqualToString:v10];

  if (v16) {
    goto LABEL_9;
  }
LABEL_10:
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) > *(void *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                               + 24))
    *a3 = 1;
}

- (id)indexPathForAssetWithUUID:(id)a3 orSyndicationIdentifier:(id)a4 hintIndexPath:(id)a5 hintCollection:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6)
  {
    id v17 = a6;
    id v13 = (void *)MEMORY[0x1E4F1C978];
    id v14 = a6;
    a6 = [v13 arrayWithObjects:&v17 count:1];
  }
  id v15 = -[PXPhotosDataSource _indexPathForAssetWithUUID:orBurstIdentifier:orSyndicationIdentifier:hintIndexPath:hintCollections:](self, "_indexPathForAssetWithUUID:orBurstIdentifier:orSyndicationIdentifier:hintIndexPath:hintCollections:", v10, 0, v11, v12, a6, v17, v18);

  return v15;
}

- (id)indexPathForAssetWithUUID:(id)a3 orBurstIdentifier:(id)a4 hintIndexPath:(id)a5 hintCollection:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6)
  {
    id v17 = a6;
    id v13 = (void *)MEMORY[0x1E4F1C978];
    id v14 = a6;
    a6 = [v13 arrayWithObjects:&v17 count:1];
  }
  id v15 = -[PXPhotosDataSource _indexPathForAssetWithUUID:orBurstIdentifier:orSyndicationIdentifier:hintIndexPath:hintCollections:](self, "_indexPathForAssetWithUUID:orBurstIdentifier:orSyndicationIdentifier:hintIndexPath:hintCollections:", v10, v11, 0, v12, a6, v17, v18);

  return v15;
}

- (int64_t)indexForAsset:(id)a3 inCollection:(id)a4 hintIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = [(PXPhotosDataSource *)self numberOfSections];
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8)
  {
    int64_t v12 = v10;
    if (v10)
    {
      int64_t v13 = [(PXPhotosDataSource *)self sectionForAssetCollection:v9];
      if (v13 < v12)
      {
        id v14 = [(PXPhotosDataSource *)self assetsInSection:v13];
        if ([v14 count] > (unint64_t)a5)
        {
          id v15 = [v14 objectAtIndex:a5];
          if ([v15 isEqual:v8]) {
            uint64_t v11 = a5;
          }
        }
      }
      if (v9 && v11 == 0x7FFFFFFFFFFFFFFFLL)
      {
        char v16 = [(PXPhotosDataSource *)self indexPathForAsset:v8 inCollection:v9];
        id v17 = v16;
        if (v16) {
          uint64_t v11 = [v16 item];
        }
        else {
          uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
    }
  }

  return v11;
}

- (id)indexPathForAsset:(id)a3 hintIndexPath:(id)a4 hintCollections:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(PXPhotosDataSource *)self numberOfSections];
  int64_t v12 = 0;
  if (!v8) {
    goto LABEL_47;
  }
  uint64_t v13 = v11;
  if (!v11) {
    goto LABEL_47;
  }
  if (v9 && v11 > [v9 section])
  {
    id v14 = -[PXPhotosDataSource assetsInSection:](self, "assetsInSection:", [v9 section]);
    unint64_t v15 = [v9 item];
    if (v15 < [v14 count])
    {
      uint64_t v16 = objc_msgSend(v14, "indexOfObject:inRange:", v8, objc_msgSend(v9, "item"), 1);
      if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_13;
      }
      uint64_t v17 = [v9 item];
      uint64_t v18 = 250;
      if (v17 > 250) {
        uint64_t v18 = v17;
      }
      uint64_t v19 = v18 - 250;
      uint64_t v20 = [v14 count];
      uint64_t v21 = v20 - v19 >= 500 ? 500 : v20 - v19;
      uint64_t v16 = objc_msgSend(v14, "indexOfObject:inRange:", v8, v19, v21);
      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_13:
        long long v22 = [v14 objectAtIndex:v16];
        if ([v22 isEqual:v8])
        {
          int64_t v12 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v16, objc_msgSend(v9, "section"));

          if (v12) {
            goto LABEL_47;
          }
          goto LABEL_18;
        }
      }
    }
  }
LABEL_18:
  if ([v10 count])
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v23 = v10;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v43;
      while (2)
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v43 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = [(PXPhotosDataSource *)self indexPathForAsset:v8 inCollection:*(void *)(*((void *)&v42 + 1) + 8 * i)];
          if (v28)
          {
            int64_t v12 = (void *)v28;

            goto LABEL_47;
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PXPhotosDataSource_indexPathForAsset_hintIndexPath_hintCollections___block_invoke;
  aBlock[3] = &unk_1E5DCA190;
  uint64_t v41 = v13;
  void aBlock[4] = self;
  id v40 = v8;
  id v29 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  uint64_t v30 = [v9 section];
  if (v13 - 1 >= (v30 & ~(v30 >> 63))) {
    uint64_t v31 = v30 & ~(v30 >> 63);
  }
  else {
    uint64_t v31 = v13 - 1;
  }
  int64_t v12 = v29[2](v29, v31);
  if (!v12)
  {
    uint64_t v32 = v13 - 2;
    if (v13 < 2)
    {
      int64_t v12 = 0;
    }
    else
    {
      uint64_t v33 = v31 - 1;
      uint64_t v34 = v31 + 1;
      while (1)
      {
        uint64_t v35 = v32;
        uint64_t v36 = v29[2](v29, v34);
        if (v36) {
          break;
        }
        int64_t v12 = v29[2](v29, v33);
        if (!v12 && (v33 >= 0 || v34 < v13))
        {
          uint64_t v32 = v35 - 1;
          --v33;
          ++v34;
          if (v35) {
            continue;
          }
        }
        goto LABEL_46;
      }
      int64_t v12 = (void *)v36;
    }
  }
LABEL_46:

LABEL_47:
  return v12;
}

id __70__PXPhotosDataSource_indexPathForAsset_hintIndexPath_hintCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 < 0 || *(void *)(a1 + 48) <= a2)
  {
    id v7 = 0;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) assetsInSection:a2];
    id v5 = v4;
    if (v4 && (uint64_t v6 = [v4 indexOfObject:*(void *)(a1 + 40)], v6 != 0x7FFFFFFFFFFFFFFFLL))
    {
      id v7 = [MEMORY[0x1E4F28D58] indexPathForItem:v6 inSection:a2];
    }
    else
    {
      id v7 = 0;
    }
  }
  return v7;
}

- (id)indexPathForAsset:(id)a3 hintIndexPath:(id)a4 hintCollection:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    id v14 = a5;
    id v10 = (void *)MEMORY[0x1E4F1C978];
    id v11 = a5;
    a5 = [v10 arrayWithObjects:&v14 count:1];
  }
  int64_t v12 = -[PXPhotosDataSource indexPathForAsset:hintIndexPath:hintCollections:](self, "indexPathForAsset:hintIndexPath:hintCollections:", v8, v9, a5, v14, v15);

  return v12;
}

- (id)indexPathForAsset:(id)a3 inCollection:(id)a4
{
  id v6 = a3;
  unint64_t v7 = [(PXPhotosDataSource *)self sectionForAssetCollection:a4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    unint64_t v9 = v7;
    id v10 = [(PXPhotosDataSource *)self assetsInSection:v7];
    id v11 = v10;
    if (v10 && (uint64_t v12 = [v10 indexOfObject:v6], v12 != 0x7FFFFFFFFFFFFFFFLL))
    {
      id v8 = [MEMORY[0x1E4F28D58] indexPathForItem:v12 inSection:v9];
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

- (id)approximateAssetsAtIndexPaths:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 count];
  if (v5)
  {
    id v24 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v5];
    id v6 = [(PXPhotosDataSource *)self collectionListFetchResult];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v22 = v4;
    obuint64_t j = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v23 = self;
      id v9 = 0;
      unint64_t v10 = 0;
      uint64_t v11 = *(void *)v27;
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          unint64_t v15 = objc_msgSend(v14, "section", v22);
          if (v15 < [v6 count])
          {
            if (v15 != v12 || v9 == 0)
            {
              uint64_t v17 = [(PXPhotosDataSource *)v23 assetsInSection:v15];
              unint64_t v10 = [v17 count];
              id v18 = v17;

              uint64_t v12 = v15;
              id v9 = v18;
            }
            else
            {
              id v9 = v9;
            }
            if ([v14 item] < v10)
            {
              uint64_t v19 = [v9 fetchedObjects];
              uint64_t v20 = objc_msgSend(v19, "objectAtIndex:", objc_msgSend(v14, "item"));
              [v24 addObject:v20];
            }
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }

    id v4 = v22;
  }
  else
  {
    id v24 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v24;
}

- (BOOL)isAssetAtIndexPathPartOfCuratedSet:(PXSimpleIndexPath *)a3
{
  uint64_t v5 = [(PXPhotosDataSource *)self assetsInSection:a3->section];
  id v6 = [v5 fetchedObjectIDs];
  uint64_t v7 = [v6 objectAtIndexedSubscript:a3->item];

  if (v7
    || ([v5 objectAtIndex:a3->item],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v8 objectID],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7))
  {
    id v9 = [(PXPhotosDataSource *)self assetCollectionForSection:a3->section];
    unint64_t v10 = [(PXPhotosDataSource *)self _resultRecordForAssetCollection:v9];
    uint64_t v11 = [v10 curatedOids];
    char v12 = [v11 containsObject:v7];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)assetAtIndexPath:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 item];
  uint64_t v7 = -[PXPhotosDataSource assetsInSection:](self, "assetsInSection:", [v5 section]);
  uint64_t v8 = [v7 objectAtIndexedSubscript:v6];
  if (!v8)
  {
    unint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXPhotosDataSource.m", 1981, @"%@ nil asset at indexPath:%@. The indexPath is probably invalid.", self, v5 object file lineNumber description];
  }
  return v8;
}

- (id)facesAtSimpleIndexPath:(PXSimpleIndexPath *)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXPhotosDataSource *)self versionIdentifier])
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    objc_claimAutoreleasedReturnValue();
    long long v25 = *(_OWORD *)&a3->item;
    long long v27 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v28 = v25;
    PXSimpleIndexPathDescription();
  }
  uint64_t v6 = [(PXPhotosDataSource *)self assetsInSection:a3->section];
  uint64_t v7 = [v6 fetchedObjectIDs];
  uint64_t v8 = [v7 objectAtIndex:a3->item];

  if (!v8)
  {
    long long v9 = *(_OWORD *)&a3->item;
    long long v27 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v28 = v9;
    unint64_t v10 = [(PXPhotosDataSource *)self assetAtSimpleIndexPath:&v27];
    uint64_t v8 = [v10 objectID];

    if (!v8)
    {
      [MEMORY[0x1E4F28B00] currentHandler];
      objc_claimAutoreleasedReturnValue();
      long long v26 = *(_OWORD *)&a3->item;
      long long v27 = *(_OWORD *)&a3->dataSourceIdentifier;
      long long v28 = v26;
      PXSimpleIndexPathDescription();
    }
  }
  uint64_t v11 = [(NSMutableDictionary *)self->_facesByAssetCache objectForKey:v8];
  if (!v11)
  {
    char v12 = [(PXPhotosDataSource *)self photoLibrary];
    uint64_t v13 = objc_msgSend(v12, "px_standardLibrarySpecificFetchOptions");

    [v13 setWantsIncrementalChangeDetails:0];
    [v13 setIncludeTorsoAndFaceDetectionData:1];
    id v14 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
    [v13 setIncludedDetectionTypes:v14];

    unint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"assetForFace", v8];
    uint64_t v16 = [(NSArray *)self->_filterPersons firstObject];
    uint64_t v17 = v16;
    if (v16)
    {
      id v18 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v19 = [v16 objectID];
      uint64_t v20 = [v18 predicateWithFormat:@"noindex:(%K) = %@", @"personForFace", v19];

      uint64_t v21 = (void *)MEMORY[0x1E4F28BA0];
      v29[0] = v15;
      v29[1] = v20;
      id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
      id v23 = [v21 andPredicateWithSubpredicates:v22];

      [v13 setInternalPredicate:v23];
    }
    else
    {
      [v13 setInternalPredicate:v15];
    }
    uint64_t v11 = [MEMORY[0x1E4F39050] fetchFacesWithOptions:v13];
    if (v11) {
      [(NSMutableDictionary *)self->_facesByAssetCache setObject:v11 forKey:v8];
    }
  }
  return v11;
}

- (double)weightForAsset:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 objectID];
    uint64_t v7 = [(NSMutableDictionary *)self->_weightByAssetCache objectForKey:v6];
    if (!v7)
    {
      uint64_t v8 = NSNumber;
      [v5 weight];
      uint64_t v7 = objc_msgSend(v8, "numberWithDouble:");
      [(NSMutableDictionary *)self->_weightByAssetCache setObject:v7 forKey:v6];
    }
    [v7 floatValue];
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (int64_t)keyAssetIndexInSection:(int64_t)a3
{
  id v4 = [(PXPhotosDataSource *)self assetCollectionForSection:a3];
  id v5 = [(PXPhotosDataSource *)self _resultRecordForAssetCollection:v4];
  int64_t v6 = [v5 keyAssetIndex];

  return v6;
}

- (id)_keyAssetsForAssetCollection:(id)a3
{
  uint64_t v3 = [(PXPhotosDataSource *)self _resultRecordForAssetCollection:a3];
  id v4 = [v3 keyAssetsFetchResult];

  return v4;
}

- (id)keyAssetsInSection:(int64_t)a3
{
  id v4 = [(PXPhotosDataSource *)self assetCollectionForSection:a3];
  id v5 = [(PXPhotosDataSource *)self _keyAssetsForAssetCollection:v4];

  return v5;
}

- (id)sectionsForAssetCollections:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = -[PXPhotosDataSource sectionForAssetCollection:](self, "sectionForAssetCollection:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
          [v5 addIndex:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)lastAssetCollection
{
  return [(PHFetchResult *)self->_collectionListFetchResult lastObject];
}

void __74__PXPhotosDataSource_setWantsCurationForAllCollections_collectionsToDiff___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(a1 + 40), "_mutableResultRecordForAssetCollection:", *(void *)(*((void *)&v8 + 1) + 8 * v6), (void)v8);
        [v7 setWantsCuration:*(unsigned __int8 *)(a1 + 48)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)setWantsCuration:(BOOL)a3 forAssetCollection:(id)a4
{
  BOOL v4 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(PXPhotosDataSource *)self wantsCurationForAssetCollection:v6] != v4)
  {
    v11[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    id v8[2] = __58__PXPhotosDataSource_setWantsCuration_forAssetCollection___block_invoke;
    v8[3] = &unk_1E5DD21E8;
    void v8[4] = self;
    id v9 = v6;
    BOOL v10 = v4;
    [(PXPhotosDataSource *)self _performManualChangesForAssetCollections:v7 changeBlock:v8];
  }
}

void __58__PXPhotosDataSource_setWantsCuration_forAssetCollection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _mutableResultRecordForAssetCollection:*(void *)(a1 + 40)];
  [v2 setWantsCuration:*(unsigned __int8 *)(a1 + 48)];
}

- (void)setCurationLength:(int64_t)a3
{
  if (self->_curationLength != a3)
  {
    self->_curationLength = a3;
    uint64_t v5 = [(PXPhotosDataSource *)self _sectionCache];
    id v6 = [v5 assetCollectionToSection];
    uint64_t v7 = [v6 allKeys];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__PXPhotosDataSource_setCurationLength___block_invoke;
    v9[3] = &unk_1E5DD0D90;
    id v10 = v7;
    long long v11 = self;
    int64_t v12 = a3;
    id v8 = v7;
    [(PXPhotosDataSource *)self _performManualChangesForAssetCollections:v8 changeBlock:v9];
  }
}

uint64_t __40__PXPhotosDataSource_setCurationLength___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(a1 + 40), "_mutableResultRecordForAssetCollection:", *(void *)(*((void *)&v9 + 1) + 8 * v6), (void)v9);
        [v7 setCurationLength:*(void *)(a1 + 48)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) _restartBackgroundFetchWithAssetCollectionsToDiff:0];
}

- (void)setKeyAsset:(id)a3 forAssetCollection:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v14[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __53__PXPhotosDataSource_setKeyAsset_forAssetCollection___block_invoke;
  v11[3] = &unk_1E5DD0F30;
  void v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(PXPhotosDataSource *)self _performManualChangesForAssetCollections:v8 changeBlock:v11];
}

void __53__PXPhotosDataSource_setKeyAsset_forAssetCollection___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _mutableResultRecordForAssetCollection:*(void *)(a1 + 40)];
  id v3 = objc_alloc(MEMORY[0x1E4F39150]);
  v10[0] = *(void *)(a1 + 48);
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v5 = [*(id *)(a1 + 40) photoLibrary];
  uint64_t v6 = *MEMORY[0x1E4F39648];
  id v7 = [v2 keyAssetsFetchResult];
  id v8 = [v7 fetchPropertySets];
  id v9 = (void *)[v3 initWithObjects:v4 photoLibrary:v5 fetchType:v6 fetchPropertySets:v8 identifier:0 registerIfNeeded:1];

  [v2 setKeyAssetsFetchResult:v9];
  if ([*(id *)(a1 + 40) assetCollectionType] == 6
    && ([*(id *)(a1 + 40) assetCollectionSubtype] == 1000000303
     || [*(id *)(a1 + 40) assetCollectionSubtype] == 1000000302))
  {
    [v2 setFetchResult:v9 reverseSortOrder:0];
    [v2 setCuratedFetchResult:v9];
  }
}

- (void)setReverseSortOrder:(BOOL)a3
{
  if (self->_reverseSortOrder != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __42__PXPhotosDataSource_setReverseSortOrder___block_invoke;
    v3[3] = &unk_1E5DCFE98;
    void v3[4] = self;
    BOOL v4 = a3;
    [(PXPhotosDataSource *)self _performManualReloadWithChangeBlock:v3];
  }
}

uint64_t __42__PXPhotosDataSource_setReverseSortOrder___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 324) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setSortDescriptors:(id)a3
{
  uint64_t v5 = (NSArray *)a3;
  if (self->_sortDescriptors != v5)
  {
    if (self->_isBackgroundFetching
      && self->_needToStartBackgroundFetch
      && ![(NSMutableDictionary *)self->_resultRecordByAssetCollection count])
    {
      objc_storeStrong((id *)&self->_sortDescriptors, a3);
    }
    else
    {
      uint64_t v6 = [(PXPhotosDataSource *)self _sectionCache];
      id v7 = [v6 assetCollectionToSection];
      id v8 = [v7 allKeys];

      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      void v10[2] = __41__PXPhotosDataSource_setSortDescriptors___block_invoke;
      v10[3] = &unk_1E5DD0F30;
      void v10[4] = self;
      long long v11 = v5;
      id v12 = v8;
      id v9 = v8;
      [(PXPhotosDataSource *)self _performManualReloadWithChangeBlock:v10];
      [(PXPhotosDataSource *)self _restartBackgroundFetchWithAssetCollectionsToDiff:0];
    }
  }
}

void __41__PXPhotosDataSource_setSortDescriptors___block_invoke(id *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)a1[4] + 57, a1[5]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = a1[6];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(a1[4], "_mutableResultRecordForAssetCollection:", *(void *)(*((void *)&v8 + 1) + 8 * v6), (void)v8);
        [v7 setSortDescriptors:a1[5]];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)setFetchLimit:(unint64_t)a3
{
  if (self->_fetchLimit != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __36__PXPhotosDataSource_setFetchLimit___block_invoke;
    v3[3] = &unk_1E5DD08D8;
    void v3[4] = self;
    void v3[5] = a3;
    [(PXPhotosDataSource *)self _performManualReloadWithChangeBlock:v3];
  }
}

uint64_t __36__PXPhotosDataSource_setFetchLimit___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 448) = *(void *)(result + 40);
  return result;
}

- (void)setAllowedUUIDs:(id)a3
{
  uint64_t v4 = (NSSet *)a3;
  allowedUUIDs = self->_allowedUUIDs;
  if (allowedUUIDs != v4 && ([(NSSet *)allowedUUIDs isEqual:v4] & 1) == 0)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __38__PXPhotosDataSource_setAllowedUUIDs___block_invoke;
    aBlock[3] = &unk_1E5DD32A8;
    void aBlock[4] = self;
    uint64_t v6 = v4;
    id v12 = v6;
    id v7 = _Block_copy(aBlock);
    if ([(NSSet *)v6 count] && self->_allowedUUIDs)
    {
      long long v8 = [(PHFetchResult *)self->_collectionListFetchResult fetchedObjects];
      [(PXPhotosDataSource *)self _cancelBackgroundFetchIfNeeded];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __38__PXPhotosDataSource_setAllowedUUIDs___block_invoke_2;
      v9[3] = &unk_1E5DD3280;
      void v9[4] = self;
      id v10 = v7;
      [(PXPhotosDataSource *)self _performManualChangesForAssetCollections:v8 changeBlock:v9];
    }
    else
    {
      [(PXPhotosDataSource *)self _performManualReloadWithChangeBlock:v7];
    }
  }
}

void __38__PXPhotosDataSource_setAllowedUUIDs___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 432);
  *(void *)(v3 + 432) = v2;
}

uint64_t __38__PXPhotosDataSource_setAllowedUUIDs___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) _cancelBackgroundFetchIfNeeded];
  uint64_t v2 = [*(id *)(a1 + 32) _inaccurateAssetCollections];
  [v2 removeAllObjects];

  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 72);
  return [v3 removeAllObjects];
}

- (void)setAllowedOIDs:(id)a3
{
  uint64_t v4 = (NSSet *)a3;
  uint64_t v5 = self->_allowedOIDs;
  if (v5 == v4)
  {
  }
  else
  {
    uint64_t v6 = v5;
    char v7 = [(NSSet *)v5 isEqual:v4];

    if ((v7 & 1) == 0)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      id v8[2] = __37__PXPhotosDataSource_setAllowedOIDs___block_invoke;
      v8[3] = &unk_1E5DD32A8;
      void v8[4] = self;
      long long v9 = v4;
      [(PXPhotosDataSource *)self _performManualReloadWithChangeBlock:v8];
    }
  }
}

void __37__PXPhotosDataSource_setAllowedOIDs___block_invoke(uint64_t a1)
{
}

- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_pauseLibraryChangeDeliveryTokens containsObject:v4])
  {
    uint64_t v5 = [(PXPhotosDataSource *)self photoLibrary];
    objc_msgSend(v5, "px_endPausingChanges:", v4);

    [(NSMutableSet *)self->_pauseLibraryChangeDeliveryTokens removeObject:v4];
    if (![(NSMutableSet *)self->_pauseLibraryChangeDeliveryTokens count])
    {
      self->_pauseBackgroundFetchResultsDelivery = 0;
      pendingResultsIsolationQueue = self->_pendingResultsIsolationQueue;
      if (pendingResultsIsolationQueue)
      {
        uint64_t v12 = 0;
        uint64_t v13 = &v12;
        uint64_t v14 = 0x2020000000;
        char v15 = 0;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __63__PXPhotosDataSource_resumeChangeDeliveryAndBackgroundLoading___block_invoke;
        block[3] = &unk_1E5DD0588;
        void block[4] = self;
        void block[5] = &v12;
        dispatch_sync(pendingResultsIsolationQueue, block);
        if (*((unsigned char *)v13 + 24))
        {
          objc_initWeak(&location, self);
          dispatch_time_t v7 = dispatch_time(0, 500000000);
          v8[0] = MEMORY[0x1E4F143A8];
          v8[1] = 3221225472;
          id v8[2] = __63__PXPhotosDataSource_resumeChangeDeliveryAndBackgroundLoading___block_invoke_2;
          v8[3] = &unk_1E5DD32D0;
          objc_copyWeak(&v9, &location);
          dispatch_after(v7, MEMORY[0x1E4F14428], v8);
          objc_destroyWeak(&v9);
          objc_destroyWeak(&location);
        }
        _Block_object_dispose(&v12, 8);
      }
    }
  }
}

uint64_t __63__PXPhotosDataSource_resumeChangeDeliveryAndBackgroundLoading___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 160) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

void __63__PXPhotosDataSource_resumeChangeDeliveryAndBackgroundLoading___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _processAndPublishPendingCollectionFetchResultsWhenAppropriate];
}

void __84__PXPhotosDataSource_pauseChangeDeliveryAndBackgroundLoadingWithTimeout_identifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained resumeChangeDeliveryAndBackgroundLoading:*(void *)(a1 + 32)];
  }
  else {
    objc_msgSend(*(id *)(a1 + 40), "px_endPausingChanges:", *(void *)(a1 + 32));
  }
}

- (void)pauseChangeDeliveryFor:(double)a3 identifier:(id)a4
{
  id v6 = a4;
  dispatch_time_t v7 = [(PXPhotosDataSource *)self photoLibrary];
  long long v8 = objc_msgSend(v7, "px_beginPausingChangesWithTimeout:identifier:", v6, fmax(a3 + a3, 1.0));

  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __56__PXPhotosDataSource_pauseChangeDeliveryFor_identifier___block_invoke;
  void v12[3] = &unk_1E5DD32A8;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_after(v9, MEMORY[0x1E4F14428], v12);
}

uint64_t __56__PXPhotosDataSource_pauseChangeDeliveryFor_identifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "px_endPausingChanges:", *(void *)(a1 + 40));
}

- (void)unregisterChangeObserver:(id)a3
{
  id v4 = a3;
  observersQueue = self->_observersQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __47__PXPhotosDataSource_unregisterChangeObserver___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observersQueue, v7);
}

uint64_t __47__PXPhotosDataSource_unregisterChangeObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_observersQueue_copyChangeObserversForWriteIfNeeded");
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 24);
  return [v3 removeObject:v2];
}

- (int64_t)estimatedOtherCount
{
  if ([(PXPhotosDataSource *)self _isFiltering]) {
    return 0;
  }
  id v4 = [(PXPhotosDataSource *)self _sectionCache];
  int64_t v5 = [v4 estimatedOtherCount];

  return v5;
}

- (int64_t)estimatedVideosCount
{
  if ([(PXPhotosDataSource *)self _isFiltering]) {
    return 0;
  }
  id v4 = [(PXPhotosDataSource *)self _sectionCache];
  int64_t v5 = [v4 estimatedVideosCount];

  return v5;
}

- (int64_t)estimatedPhotosCount
{
  if ([(PXPhotosDataSource *)self _isFiltering]) {
    return 0;
  }
  id v4 = [(PXPhotosDataSource *)self _sectionCache];
  int64_t v5 = [v4 estimatedPhotosCount];

  return v5;
}

- (BOOL)_isFiltering
{
  id v3 = [(PXPhotosDataSource *)self filterPredicate];

  return v3 || [(PXPhotosDataSource *)self libraryFilter] != 0;
}

- (void)_adoptExistingAssetCollectionFetchResults:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__PXPhotosDataSource__adoptExistingAssetCollectionFetchResults___block_invoke;
  v3[3] = &unk_1E5DCA020;
  void v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

void __64__PXPhotosDataSource__adoptExistingAssetCollectionFetchResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) sectionForAssetCollection:v8] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [*(id *)(a1 + 32) _mutableResultRecordForAssetCollection:v8];
    if ([*(id *)(a1 + 32) _reverseSortOrderForAssetCollection:v8]) {
      uint64_t v7 = [*(id *)(a1 + 32) reverseSortOrder] ^ 1;
    }
    else {
      uint64_t v7 = 0;
    }
    [v6 setFetchResult:v5 reverseSortOrder:v7];
  }
}

- (id)_closestIndexPathToIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXPhotosDataSource *)self numberOfSections];
  if (!v5)
  {
    dispatch_time_t v9 = 0;
    goto LABEL_21;
  }
  uint64_t v6 = v5;
  if ([v4 section] < v5)
  {
    uint64_t v7 = -[PXPhotosDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", [v4 section]);
    if ([v4 item] < v7)
    {
      id v8 = v4;
      goto LABEL_8;
    }
    BOOL v10 = v7 < 1;
    uint64_t v11 = v7 - 1;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v11, objc_msgSend(v4, "section"));
      id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
      dispatch_time_t v9 = v8;
      if (v8) {
        goto LABEL_21;
      }
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PXPhotosDataSource__closestIndexPathToIndexPath___block_invoke;
  aBlock[3] = &unk_1E5DCA168;
  void aBlock[4] = self;
  uint64_t v12 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
  uint64_t v13 = [v4 section];
  uint64_t v14 = v6 - 1;
  if (v6 > 1)
  {
    uint64_t v15 = v13 - 1;
    uint64_t v16 = v13 + 1;
    while (v16 < v6 || (v15 & 0x8000000000000000) == 0)
    {
      if (v16 < v6 && (v12[2](v12, v16, 0), (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0)
        || (v15 & 0x8000000000000000) == 0
        && v15 < v6
        && (v12[2](v12, v15, 1), (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        dispatch_time_t v9 = (void *)v17;
        goto LABEL_20;
      }
      --v15;
      ++v16;
      if (!--v14) {
        break;
      }
    }
  }
  dispatch_time_t v9 = 0;
LABEL_20:

LABEL_21:
  return v9;
}

id __51__PXPhotosDataSource__closestIndexPathToIndexPath___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) numberOfItemsInSection:a2];
  if (v5 < 1)
  {
    uint64_t v7 = 0;
  }
  else
  {
    if (a3) {
      uint64_t v6 = v5 - 1;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = [MEMORY[0x1E4F28D58] indexPathForItem:v6 inSection:a2];
  }
  return v7;
}

- (id)_observerInterestingAssetReferences
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __57__PXPhotosDataSource__observerInterestingAssetReferences__block_invoke;
  v8[3] = &unk_1E5DCA140;
  void v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  [(PXPhotosDataSource *)self _enumerateChangeObserversWithBlock:v8];
  uint64_t v5 = v9;
  id v6 = v4;

  return v6;
}

void __57__PXPhotosDataSource__observerInterestingAssetReferences__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  char v3 = objc_opt_respondsToSelector();
  id v4 = v6;
  if (v3)
  {
    uint64_t v5 = [v6 photosDataSourceInterestingAssetReferences:*(void *)(a1 + 32)];
    if (v5) {
      [*(id *)(a1 + 40) addObjectsFromArray:v5];
    }

    id v4 = v6;
  }
}

- (void)_publishDidReceivePhotoLibraryChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__PXPhotosDataSource__publishDidReceivePhotoLibraryChange___block_invoke;
  v6[3] = &unk_1E5DCA140;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXPhotosDataSource *)self _enumerateChangeObserversWithBlock:v6];
}

void __59__PXPhotosDataSource__publishDidReceivePhotoLibraryChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 photosDataSource:*(void *)(a1 + 32) didReceivePhotoLibraryChange:*(void *)(a1 + 40)];
  }
}

id __94__PXPhotosDataSource__fetchTupleForAssetCollection_calledOnClientQueue_isLimitedInitialFetch___block_invoke_305(uint64_t a1, void *a2, char *a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) objectID];
  if ([v5 customUserAssetsChangedForPHMemoryOID:v6])
  {
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) objectID];
    int v8 = [v5 userCuratedAssetsChangedForPHMemoryOID:v7];

    if (!v8) {
      goto LABEL_7;
    }
  }
  id v9 = [*(id *)(a1 + 40) fetchAssetsInContainer:*(void *)(a1 + 48) configuration:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  if ([v9 count])
  {
    char v10 = 1;
    goto LABEL_8;
  }

LABEL_7:
  id v9 = 0;
  char v10 = 0;
LABEL_8:
  *a3 = v10;

  return v9;
}

void __94__PXPhotosDataSource__fetchTupleForAssetCollection_calledOnClientQueue_isLimitedInitialFetch___block_invoke_308(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) infoForAssetCollection:*(void *)(a1 + 40)];
  [v2 _setUUIDFilterHidesSomeAssets:*(unsigned __int8 *)(a1 + 48)];
}

- (void)performChanges:(id)a3
{
  ++self->_nestedCoalesceChanges;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  if (self->_nestedCoalesceChanges == 1 && [(NSMutableArray *)self->_coalescedChanges count]) {
    [(PXPhotosDataSource *)self _restartBackgroundFetchWithAssetCollectionsToDiff:0];
  }
  int64_t v4 = self->_nestedCoalesceChanges - 1;
  self->_nestedCoalesceChanges = v4;
  if (!v4 && [(NSMutableArray *)self->_coalescedChanges count])
  {
    if ([(NSMutableArray *)self->_coalescedChanges count] == 1)
    {
      id v5 = [(NSMutableArray *)self->_coalescedChanges firstObject];
    }
    else
    {
      id v5 = objc_alloc_init(PXPhotosDataSourceChange);
    }
    id v6 = v5;
    [(NSMutableArray *)self->_coalescedChanges removeAllObjects];
    [(PXPhotosDataSource *)self _distributeChange:v6];
  }
}

- (id)_assetOidsByAssetCollectionForAssetsAtIndexPathsInSet:(id)a3
{
  id v5 = a3;
  int64_t v6 = [(PXPhotosDataSource *)self versionIdentifier];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __76__PXPhotosDataSource__assetOidsByAssetCollectionForAssetsAtIndexPathsInSet___block_invoke;
  void v12[3] = &unk_1E5DCA0A0;
  int64_t v14 = v6;
  SEL v15 = a2;
  void v12[4] = self;
  id v8 = v7;
  id v13 = v8;
  [v5 enumerateItemIndexPathsUsingBlock:v12];

  id v9 = v13;
  id v10 = v8;

  return v10;
}

void __76__PXPhotosDataSource__assetOidsByAssetCollectionForAssetsAtIndexPathsInSet___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 != *(void *)(a1 + 48)) {
    PXAssertGetLog();
  }
  int64_t v4 = [*(id *)(a1 + 32) assetCollectionForSection:*(void *)(a2 + 8)];
  id v5 = *(void **)(a1 + 32);
  long long v6 = *(_OWORD *)(a2 + 16);
  v10[0] = *(_OWORD *)a2;
  v10[1] = v6;
  id v7 = [v5 assetAtSimpleIndexPath:v10];
  id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
  if (!v8)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v4];
  }
  id v9 = [v7 objectID];
  [v8 addObject:v9];
}

- (void)setAllowedUUIDs:(id)a3 manualOrderUUIDs:(id)a4 forAssetCollections:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosDataSource.m", 735, @"%s must be called on the main thread", "-[PXPhotosDataSource setAllowedUUIDs:manualOrderUUIDs:forAssetCollections:]");
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v18 = [(PXPhotosDataSource *)self infoForAssetCollection:v17];
        uint64_t v19 = [v9 objectForKeyedSubscript:v17];
        [v18 setAllowedUUIDs:v19];

        uint64_t v20 = [v10 objectForKeyedSubscript:v17];
        [v18 setManualOrderUUIDs:v20];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  [(PXPhotosDataSource *)self _restartBackgroundFetchWithAssetCollectionsToDiff:0];
}

- (BOOL)isSectionConsideredAccurate:(int64_t)a3
{
  int64_t v4 = [(PHFetchResult *)self->_collectionListFetchResult objectAtIndexedSubscript:a3];
  unint64_t v5 = [(PXPhotosDataSource *)self _assetCollectionFetchStatus:v4];
  if (v5 == 2)
  {
    long long v6 = [(PXPhotosDataSource *)self _resultRecordForAssetCollection:v4];
    id v7 = [v6 exposedFetchResult];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = v5 == 3;
  }

  return v8;
}

- (NSString)description
{
  uint64_t v3 = [(PXPhotosDataSource *)self numberOfSections];
  int64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v3];
  if (v3 >= 1)
  {
    uint64_t v5 = 0;
    while (1)
    {
      long long v6 = [(PXPhotosDataSource *)self assetCollectionForSection:v5];
      unint64_t v7 = [(PXPhotosDataSource *)self _assetCollectionFetchStatus:v6];
      unint64_t v8 = v7;
      if (v7 - 1 >= 3)
      {
        if (v7) {
          id v12 = 0;
        }
        else {
          id v12 = @"inacc.";
        }
        goto LABEL_16;
      }
      id v9 = [(PXPhotosDataSource *)self _resultRecordForAssetCollection:v6];
      id v10 = [v9 exposedFetchResult];
      id v11 = v10;
      if (v10)
      {
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
        id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v12 = @"unknown";
      }
      if (v8 == 1) {
        break;
      }
      if (v8 == 2)
      {
        uint64_t v13 = @"stale:%@";
LABEL_14:
        uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", v13, v12);

        id v12 = (__CFString *)v14;
      }

LABEL_16:
      [v4 addObject:v12];

      if (v3 == ++v5) {
        goto LABEL_17;
      }
    }
    uint64_t v13 = @"limited:%@";
    goto LABEL_14;
  }
LABEL_17:
  uint64_t v15 = [v4 componentsJoinedByString:@", "];
  uint64_t v16 = NSString;
  v20.receiver = self;
  v20.super_class = (Class)PXPhotosDataSource;
  uint64_t v17 = [(PXPhotosDataSource *)&v20 description];
  uint64_t v18 = [v16 stringWithFormat:@"<%@ sections:%ld sectionCounts:[%@]>", v17, v3, v15];

  return (NSString *)v18;
}

void __66__PXPhotosDataSource__initResultRecordsWithOldOptions_newOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  long long v6 = [v5 keyAssetsFetchResult];

  if (v6)
  {
    unint64_t v7 = (void *)[v5 copy];
    [v7 setKeyAssetsFetchResult:0];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
}

uint64_t __33__PXPhotosDataSource__commonInit__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

- (id)_createDataSourceWithAssetsCollections:(id)a3 existingAssetCollectionFetchResults:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  long long v6 = (void *)MEMORY[0x1E4F29008];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 sortDescriptorWithKey:@"transientIdentifier" ascending:1];
  v18[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v8 sortUsingDescriptors:v10];

  id v11 = [MEMORY[0x1E4F39008] transientCollectionListWithCollections:v8 title:0];

  id v12 = (void *)MEMORY[0x1E4F38EE8];
  uint64_t v13 = [(PXPhotosDataSource *)self collectionListFetchResult];
  uint64_t v14 = [v13 fetchOptions];
  uint64_t v15 = [v12 fetchCollectionsInCollectionList:v11 options:v14];

  uint64_t v16 = [[PXPhotosDataSource alloc] initWithPhotosDataSource:self options:0];
  [(PXPhotosDataSource *)v16 setCollectionListFetchResult:v15];
  [(PXPhotosDataSource *)v16 _adoptExistingAssetCollectionFetchResults:v7];

  [(PXPhotosDataSource *)v16 setWantsCurationByDefault:0];
  return v16;
}

- (id)createDataSourceWithAssetsAtIndexPaths:(id)a3
{
  int64_t v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [MEMORY[0x1E4F29128] UUID];
  id v8 = [v7 UUIDString];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__PXPhotosDataSource_createDataSourceWithAssetsAtIndexPaths___block_invoke;
  v13[3] = &unk_1E5DCA050;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v9 = v6;
  id v10 = v8;
  [v5 enumerateItemIndexSetsUsingBlock:v13];

  id v11 = [(PXPhotosDataSource *)self _createDataSourceWithAssetsCollections:v9 existingAssetCollectionFetchResults:0];

  return v11;
}

void __61__PXPhotosDataSource_createDataSourceWithAssetsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v14 = a4;
  id v6 = [*(id *)(a1 + 32) assetsInSection:a3];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 fetchedObjectIDs];
    id v9 = [v8 objectsAtIndexes:v14];

    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F390B0]) initWithExistingFetchResult:v7 filteredObjectIDs:v9];
    id v11 = (void *)MEMORY[0x1E4F38EE8];
    id v12 = [NSString stringWithFormat:@"%08ld-%@", a3, *(void *)(a1 + 40)];
    uint64_t v13 = [v11 transientAssetCollectionWithAssetFetchResult:v10 title:0 identifier:v12];

    [*(id *)(a1 + 48) addObject:v13];
  }
}

- (id)createDataSourceWithAssetsInSectionOfAsset:(id)a3 usingNewTransientAssetCollection:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v4)
  {
    id v8 = [MEMORY[0x1E4F29128] UUID];
    id v9 = [v8 UUIDString];

    id v10 = [v6 assetCollection];
    int v11 = objc_msgSend(v10, "px_isRecentlyViewedCollection");

    id v12 = [(PXPhotosDataSource *)self _sectionCache];
    uint64_t v13 = [v12 assetCollections];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      unint64_t v15 = 0;
      do
      {
        if (v6)
        {
          [v6 indexPath];
          if (v15 != *((void *)&v35 + 1)) {
            goto LABEL_13;
          }
          [v6 indexPath];
          uint64_t v16 = v34;
        }
        else
        {
          long long v35 = 0u;
          if (v15) {
            goto LABEL_13;
          }
          uint64_t v16 = 0;
          uint64_t v34 = 0;
        }
        uint64_t v17 = [(PXPhotosDataSource *)self assetCollectionForSection:v16];
        if (!v17
          || ([(PXPhotosDataSource *)self _assetsForAssetCollection:v17],
              (uint64_t v18 = objc_claimAutoreleasedReturnValue()) == 0))
        {

LABEL_13:
          long long v23 = (void *)MEMORY[0x1E4F38EE8];
          long long v24 = __98__PXPhotosDataSource_createDataSourceWithAssetsInSectionOfAsset_usingNewTransientAssetCollection___block_invoke((uint64_t)v9, v15, v11);
          uint64_t v17 = [v23 transientAssetCollectionWithAssets:MEMORY[0x1E4F1CBF0] title:0 identifier:v24 photoLibrary:self->_photoLibrary];

          long long v25 = [(PXPhotosDataSource *)self emptyAssetsFetchResult];
          [v7 setObject:v25 forKeyedSubscript:v17];

          [v32 addObject:v17];
          goto LABEL_14;
        }
        uint64_t v19 = (void *)v18;
        objc_super v20 = (void *)MEMORY[0x1E4F38EE8];
        uint64_t v21 = __98__PXPhotosDataSource_createDataSourceWithAssetsInSectionOfAsset_usingNewTransientAssetCollection___block_invoke((uint64_t)v9, v15, v11);
        long long v22 = [v20 transientAssetCollectionWithAssetFetchResult:v19 title:0 identifier:v21];

        [v32 addObject:v22];
        [v7 setObject:v19 forKeyedSubscript:v22];

LABEL_14:
        ++v15;
        long long v26 = [(PXPhotosDataSource *)self _sectionCache];
        uint64_t v27 = [v26 assetCollections];
        unint64_t v28 = [v27 count];
      }
      while (v15 < v28);
    }
  }
  else
  {
    if (v6)
    {
      [v6 indexPath];
      uint64_t v29 = v33;
    }
    else
    {
      uint64_t v29 = 0;
    }
    id v9 = [(PXPhotosDataSource *)self assetCollectionForSection:v29];
    if (v9) {
      [v32 addObject:v9];
    }
  }

  uint64_t v30 = [(PXPhotosDataSource *)self _createDataSourceWithAssetsCollections:v32 existingAssetCollectionFetchResults:v7];

  return v30;
}

__CFString *__98__PXPhotosDataSource_createDataSourceWithAssetsInSectionOfAsset_usingNewTransientAssetCollection___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    uint64_t v3 = @"PXRecentlyViewedVirtualCollection";
    BOOL v4 = @"PXRecentlyViewedVirtualCollection";
  }
  else
  {
    uint64_t v3 = [NSString stringWithFormat:@"%08ld-%@", a2, a1];
  }
  return v3;
}

void __60__PXPhotosDataSource_initWithPhotosDataSourceConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) sectionForAssetCollection:v7] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [*(id *)(a1 + 32) _mutableResultRecordForAssetCollection:v7];
    [v6 setKeyAssetsFetchResult:v5];
  }
}

+ (void)waitForAllBackgroundFetchingToFinish
{
  kdebug_trace();
  uint64_t v3 = [a1 backgroundFetchingGroup];
  dispatch_time_t v4 = dispatch_time(0, 120000000000);
  dispatch_group_wait(v3, v4);

  kdebug_trace();
}

@end
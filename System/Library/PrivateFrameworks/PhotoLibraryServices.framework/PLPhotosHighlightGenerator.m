@interface PLPhotosHighlightGenerator
+ (BOOL)_shouldUpdateKeyAssetForParentHighlight:(id)a3 withPrivateKeyAssetObjectID:(id)a4 andSharedKeyAssetObjectID:(id)a5;
+ (BOOL)assetEligibleForCuration:(id)a3;
+ (BOOL)assetEligibleForRecents:(id)a3;
+ (double)curationScoreForAsset:(id)a3;
+ (id)_bestAssetInAssets:(id)a3 fallback:(BOOL)a4;
+ (id)_provisionalKeyAssetForDayGroupHighlight:(id)a3 sharingConsideration:(int64_t)a4;
+ (id)_provisionalKeyAssetForDayHighlight:(id)a3 sharingConsideration:(int64_t)a4;
+ (id)_provisionalKeyAssetForMonthAndYearHighlight:(id)a3 sharingConsideration:(int64_t)a4;
+ (id)lastHighlightTitlesUpdateDay;
+ (id)lastRecentHighlightUpdateDate;
+ (id)provisionalKeyAssetForHighlight:(id)a3 sharingConsideration:(int64_t)a4;
+ (id)userDefaults;
+ (void)_updateMixedSharingCompositionKeyAssetRelationshipForHighlight:(id)a3;
+ (void)_updateParentHighlightNeedingNewKeyAsset:(id)a3 withProvisionalKeyAssetPrivate:(id)a4 andProvisionalKeyAssetShared:(id)a5 updatedHighlights:(id)a6;
+ (void)_updateTitlesForHighlight:(id)a3 dateRangeTitleGenerator:(id)a4 options:(unint64_t)a5 filter:(unsigned __int16)a6;
+ (void)setLastHighlightTitlesUpdateDay:(id)a3;
+ (void)setLastRecentHighlightUpdateDate:(id)a3;
+ (void)updateKeyAssetForHighlights:(id)a3;
+ (void)updateTitleForHighlights:(id)a3 forKind:(unsigned __int16)a4 forceUpdateLocale:(BOOL)a5 dateRangeTitleGenerator:(id)a6;
+ (void)updateTitlesForHighlight:(id)a3 dateRangeTitleGenerator:(id)a4 options:(unint64_t)a5;
- (BOOL)_highlightShouldNotBeVisible:(id)a3 sharingConsideration:(int64_t)a4;
- (BOOL)_highlightTypeSupportsVisibilityStateDayOnly:(unsigned __int16)a3;
- (BOOL)_setVisibilityStateForHighlight:(id)a3 shouldForceUpdate:(BOOL)a4 sharingConsideration:(int64_t)a5;
- (BOOL)_updateHighlightProperties:(id)a3 fromHighlightCluster:(id)a4;
- (BOOL)didCallBeginGeneration;
- (BOOL)setVisibilityStateForHighlight:(id)a3 shouldForceUpdate:(BOOL)a4;
- (BOOL)shouldForceVisibilityStateUpdateForHighlight:(id)a3 highlightCluster:(id)a4;
- (NSDateInterval)recentHighlightsDateInterval;
- (NSMutableSet)highlightsNeedingNewKeyAsset;
- (NSMutableSet)highlightsToDelete;
- (NSMutableSet)highlightsWithDeletedAssets;
- (NSMutableSet)upsertedHighlights;
- (PLDateRangeTitleGenerator)dateRangeTitleGenerator;
- (PLFrequentLocationManager)frequentLocationManager;
- (PLHighlightHierarchy)entitiesToUpdate;
- (PLLocalCreationDateCreator)localCreationDateCreator;
- (PLMomentGenerationDataManagement)dataManager;
- (PLPhotosHighlightClusterGenerator)highlightClusterGenerator;
- (PLPhotosHighlightGenerator)initWithDataManager:(id)a3 frequentLocationManager:(id)a4 localCreationDateCreator:(id)a5 dateRangeTitleGenerator:(id)a6;
- (id)_collectMomentsRequiringReprocessingFromMoments:(id)a3 withAllMoments:(id)a4;
- (id)_fetchAllMoments;
- (id)_fetchMomentsRequiringLocationProcessingWhenCoreRoutineIsAvailable;
- (id)_fetchMomentsRequiringLocationProcessingWhenFrequentLocationsAreAvailable;
- (id)_fetchMomentsRequiringLocationProcessingWhenFrequentLocationsChanged;
- (id)_highlightMomentClustersForMoments:(id)a3 excludingMomentIds:(id)a4;
- (id)_highlightToReuseForMoments:(id)a3;
- (id)_insertDayGroupPhotosHighlightCluster:(id)a3;
- (id)_recentHighlightsDateIntervalWithDate:(id)a3;
- (id)fetchAllOngoingTripDayGroupHighlights;
- (id)fetchAllRecentHighlights;
- (id)updateElectedEventForUpdatedMonths:(id)a3;
- (void)_consumeHighlightItemListChanges:(id)a3 forKind:(unsigned __int16)a4 rule:(id)a5 resultBlock:(id)a6;
- (void)_insertDayPhotosHighlightCluster:(id)a3;
- (void)_resetProperties;
- (void)_updateDayGroupHighlight:(id)a3 withNewAssets:(id)a4;
- (void)_updateDayHighlight:(id)a3 withNewAssets:(id)a4;
- (void)beginGenerationWithAssets:(id)a3 hiddenAssets:(id)a4;
- (void)cleanupEmptyHighlights;
- (void)finishGeneration;
- (void)generateHighlightListForUpdatedHighlights:(id)a3 deletedHighlights:(id)a4;
- (void)generateHighlightsForUpsertedMoments:(id)a3 frequentLocationsDidChange:(BOOL)a4;
- (void)markHighlightNeedingNewKeyAssetsWithAsset:(id)a3;
- (void)processCachedLocationOfInterest;
- (void)processRecentHighlights;
- (void)processUnprocessedMomentLocations;
- (void)registerHighlightsWithDeletedMoments:(id)a3;
- (void)resetDayGroupCurationForAsset:(id)a3;
- (void)resetPreviousRecentHighlightCurationForHighlight:(id)a3;
- (void)setDataManager:(id)a3;
- (void)setDidCallBeginGeneration:(BOOL)a3;
- (void)setEntitiesToUpdate:(id)a3;
- (void)setHighlightsNeedingNewKeyAsset:(id)a3;
- (void)setHighlightsToDelete:(id)a3;
- (void)setHighlightsWithDeletedAssets:(id)a3;
- (void)setUpsertedHighlights:(id)a3;
- (void)updateCurationForHighlight:(id)a3 withAssetsBelongingToCuration:(id)a4;
- (void)updateHighlightTitles;
- (void)updateRecentHighlightCurationForHighlight:(id)a3;
@end

@implementation PLPhotosHighlightGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightsNeedingNewKeyAsset, 0);
  objc_destroyWeak((id *)&self->_dataManager);
  objc_storeStrong((id *)&self->_highlightsToDelete, 0);
  objc_storeStrong((id *)&self->_upsertedHighlights, 0);
  objc_storeStrong((id *)&self->_highlightsWithDeletedAssets, 0);
  objc_storeStrong((id *)&self->_entitiesToUpdate, 0);
  objc_storeStrong((id *)&self->_dateRangeTitleGenerator, 0);
  objc_storeStrong((id *)&self->_localCreationDateCreator, 0);
  objc_storeStrong((id *)&self->_frequentLocationManager, 0);
  objc_storeStrong((id *)&self->_recentHighlightsDateInterval, 0);
}

- (void)setHighlightsNeedingNewKeyAsset:(id)a3
{
}

- (NSMutableSet)highlightsNeedingNewKeyAsset
{
  return self->_highlightsNeedingNewKeyAsset;
}

- (void)setDataManager:(id)a3
{
}

- (PLMomentGenerationDataManagement)dataManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataManager);
  return (PLMomentGenerationDataManagement *)WeakRetained;
}

- (void)setDidCallBeginGeneration:(BOOL)a3
{
  self->_didCallBeginGeneration = a3;
}

- (BOOL)didCallBeginGeneration
{
  return self->_didCallBeginGeneration;
}

- (void)setHighlightsToDelete:(id)a3
{
}

- (NSMutableSet)highlightsToDelete
{
  return self->_highlightsToDelete;
}

- (void)setUpsertedHighlights:(id)a3
{
}

- (NSMutableSet)upsertedHighlights
{
  return self->_upsertedHighlights;
}

- (void)setHighlightsWithDeletedAssets:(id)a3
{
}

- (NSMutableSet)highlightsWithDeletedAssets
{
  return self->_highlightsWithDeletedAssets;
}

- (void)setEntitiesToUpdate:(id)a3
{
}

- (PLHighlightHierarchy)entitiesToUpdate
{
  return self->_entitiesToUpdate;
}

- (PLDateRangeTitleGenerator)dateRangeTitleGenerator
{
  return self->_dateRangeTitleGenerator;
}

- (PLLocalCreationDateCreator)localCreationDateCreator
{
  return self->_localCreationDateCreator;
}

- (PLFrequentLocationManager)frequentLocationManager
{
  return self->_frequentLocationManager;
}

- (id)_collectMomentsRequiringReprocessingFromMoments:(id)a3 withAllMoments:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  double Current = CFAbsoluteTimeGetCurrent();
  id v43 = (id)[v5 mutableCopy];
  uint64_t v8 = [v6 count];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v5;
  uint64_t v45 = [obj countByEnumeratingWithState:&v46 objects:v62 count:16];
  if (v45)
  {
    uint64_t v9 = *(void *)v47;
    unint64_t v36 = v8 - 1;
    id v37 = v6;
    uint64_t v38 = *(void *)v47;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v46 + 1) + 8 * v10);
        v12 = [v11 highlight];
        if (v12)
        {
          v13 = PLMomentsGetLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v44 = [v11 uuid];
            v42 = [v11 startDate];
            v14 = [v42 debugDescription];
            v41 = [v11 endDate];
            v15 = [v41 debugDescription];
            v16 = [v12 uuid];
            v40 = [v12 startDate];
            v17 = [v40 debugDescription];
            v18 = [v12 endDate];
            v19 = [v18 debugDescription];
            *(_DWORD *)buf = 138544643;
            uint64_t v51 = (uint64_t)v44;
            __int16 v52 = 2113;
            uint64_t v53 = (uint64_t)v14;
            __int16 v54 = 2113;
            double v55 = *(double *)&v15;
            __int16 v56 = 2114;
            v57 = v16;
            __int16 v58 = 2113;
            v59 = v17;
            __int16 v60 = 2113;
            v61 = v19;
            _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Trying to reprocess a moment that is still connected to a highlight. Moment: %{public}@, %{private}@, %{private}@, Highlight: %{public}@, %{private}@, %{private}@", buf, 0x3Eu);

            uint64_t v9 = v38;
            id v6 = v37;
          }
          [v43 removeObject:v11];
        }
        else
        {
          uint64_t v20 = [v6 indexOfObject:v11];
          unint64_t v21 = v20;
          if (v20)
          {
            if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
              goto LABEL_10;
            }
            v22 = [v6 objectAtIndexedSubscript:v20 - 1];
            v23 = [v22 highlight];
            v24 = v23;
            if (v23 && ![v23 type])
            {
              v25 = [v24 moments];
              [v43 unionSet:v25];
            }
            uint64_t v9 = v38;
          }
          if (v21 < v36)
          {
            v26 = [v6 objectAtIndexedSubscript:v21 + 1];
            v27 = [v26 highlight];
            v28 = v27;
            if (v27 && ![v27 type])
            {
              v29 = [v28 moments];
              [v43 unionSet:v29];
            }
          }
        }
LABEL_10:

        ++v10;
      }
      while (v45 != v10);
      uint64_t v30 = [obj countByEnumeratingWithState:&v46 objects:v62 count:16];
      uint64_t v45 = v30;
    }
    while (v30);
  }

  double v31 = CFAbsoluteTimeGetCurrent();
  v32 = PLMomentsGetLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v33 = [v43 count];
    uint64_t v34 = [obj count];
    *(_DWORD *)buf = 134218496;
    uint64_t v51 = v33;
    __int16 v52 = 2048;
    uint64_t v53 = v34;
    __int16 v54 = 2048;
    double v55 = (v31 - Current) * 1000.0;
    _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Collected %lu moments requiring reprocessing from %lu moments without highlights took %f ms", buf, 0x20u);
  }

  return v43;
}

- (id)_highlightMomentClustersForMoments:(id)a3 excludingMomentIds:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v30 = [MEMORY[0x1E4F1CA48] array];
  v28 = v6;
  v7 = (void *)[v6 mutableCopy];
  uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    v29 = v7;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v15 = [v14 uniqueObjectID];
        if (([v7 containsObject:v15] & 1) == 0)
        {
          [v7 addObject:v15];
          v16 = [v14 highlight];
          v17 = v16;
          if (v16)
          {
            v18 = [v16 uniqueObjectID];
            if ([v8 containsObject:v18])
            {

              v19 = 0;
LABEL_16:

              goto LABEL_17;
            }
            [v8 addObject:v18];
            [v17 momentsSortedByTime];
            uint64_t v22 = v11;
            uint64_t v23 = v12;
            id v24 = v9;
            v26 = v25 = v8;
            v19 = [[PLMomentCluster alloc] initWithMoments:v26];

            uint64_t v8 = v25;
            id v9 = v24;
            uint64_t v12 = v23;
            uint64_t v11 = v22;
            v7 = v29;
          }
          else
          {
            uint64_t v20 = PLMomentsGetLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "[HighlightsGeneration] Fallback adding single moment to momentArray.", buf, 2u);
            }

            unint64_t v21 = [PLMomentCluster alloc];
            unint64_t v36 = v14;
            v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
            v19 = [(PLMomentCluster *)v21 initWithMoments:v18];
          }

          if (v19) {
            [v30 addObject:v19];
          }
          goto LABEL_16;
        }
LABEL_17:
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v11);
  }

  return v30;
}

- (id)_fetchMomentsRequiringLocationProcessingWhenFrequentLocationsChanged
{
  v2 = [(PLPhotosHighlightGenerator *)self dataManager];
  uint64_t v5 = 0;
  v3 = [v2 momentsRequiringLocationProcessingWhenFrequentLocationsChangedWithError:&v5];

  return v3;
}

- (id)_fetchMomentsRequiringLocationProcessingWhenFrequentLocationsAreAvailable
{
  v2 = [(PLPhotosHighlightGenerator *)self dataManager];
  uint64_t v5 = 0;
  v3 = [v2 momentsRequiringLocationProcessingWhenFrequentLocationsAreAvailable:&v5];

  return v3;
}

- (id)_fetchMomentsRequiringLocationProcessingWhenCoreRoutineIsAvailable
{
  v2 = [(PLPhotosHighlightGenerator *)self dataManager];
  uint64_t v5 = 0;
  v3 = [v2 momentsRequiringLocationProcessingWhenCoreRoutineIsAvailable:&v5];

  return v3;
}

- (id)_fetchAllMoments
{
  v2 = [(PLPhotosHighlightGenerator *)self dataManager];
  uint64_t v5 = 0;
  v3 = [v2 allMomentsWithError:&v5];

  return v3;
}

- (id)_recentHighlightsDateIntervalWithDate:(id)a3
{
  id v4 = a3;
  recentHighlightsDateInterval = self->_recentHighlightsDateInterval;
  if (!recentHighlightsDateInterval)
  {
    id v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v7 = objc_msgSend(v6, "pl_endOfPreviousDayForDate:", v4);
    uint64_t v8 = objc_msgSend(v6, "pl_dateByAddingDays:toDate:", 1, v4);
    id v9 = objc_msgSend(v6, "pl_endOfDayForDate:", v8);
    uint64_t v10 = (NSDateInterval *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 endDate:v9];
    uint64_t v11 = self->_recentHighlightsDateInterval;
    self->_recentHighlightsDateInterval = v10;

    recentHighlightsDateInterval = self->_recentHighlightsDateInterval;
  }
  uint64_t v12 = recentHighlightsDateInterval;

  return v12;
}

- (NSDateInterval)recentHighlightsDateInterval
{
  v3 = +[PLMomentGenerationUtils today];
  id v4 = [(PLPhotosHighlightGenerator *)self _recentHighlightsDateIntervalWithDate:v3];

  return (NSDateInterval *)v4;
}

- (void)cleanupEmptyHighlights
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  v3 = PLMomentsGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Running periodic maintenance task to cleanup empty highlights", buf, 2u);
  }

  id v4 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  v85 = [MEMORY[0x1E4F1CA80] set];
  id v6 = [(PLPhotosHighlightGenerator *)self dataManager];
  id v114 = 0;
  v7 = [v6 allEmptyPhotosHighlightsOfKind:0 error:&v114];
  id v8 = v114;

  if (v7)
  {
    id v9 = [(PLPhotosHighlightGenerator *)self dataManager];
    id v113 = v8;
    uint64_t v10 = [v9 allEmptyPhotosHighlightsOfKind:3 error:&v113];
    id v11 = v113;

    if (v10)
    {
      uint64_t v12 = [v7 count];
      v84 = v5;
      if (v12)
      {
        uint64_t v13 = v12;
        v79 = (void *)MEMORY[0x19F38D3B0]();
        v80 = v7;
        [v4 addObjectsFromArray:v7];
        v14 = PLMomentsGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v122 = v13;
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Found %lu empty days. Cleaning up.", buf, 0xCu);
        }

        uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY childPhotosHighlights IN (%@)", v4];
        v76 = self;
        v16 = [(PLPhotosHighlightGenerator *)self dataManager];
        id v112 = v11;
        v78 = (void *)v15;
        v17 = [v16 allPhotosHighlightsOfKind:1 withPredicate:v15 error:&v112];
        id v82 = v112;

        v81 = v4;
        v18 = objc_msgSend(v4, "_pl_map:", &__block_literal_global_48537);
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        id obj = v17;
        uint64_t v19 = [obj countByEnumeratingWithState:&v108 objects:v120 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v109;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v109 != v21) {
                objc_enumerationMutation(obj);
              }
              uint64_t v23 = *(void **)(*((void *)&v108 + 1) + 8 * i);
              id v24 = [v23 childPhotosHighlights];
              v25 = objc_msgSend(v24, "_pl_map:", &__block_literal_global_101_48538);

              if ([v25 isSubsetOfSet:v18])
              {
                v26 = PLMomentsGetLog();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  v27 = [v23 uuid];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v122 = (uint64_t)v27;
                  v28 = v26;
                  v29 = "[HighlightsGeneration] Month %@ will be empty. Cleaning up.";
LABEL_19:
                  _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);

                  uint64_t v5 = v84;
                }
              }
              else
              {
                if ([v25 count]) {
                  goto LABEL_21;
                }
                v26 = PLMomentsGetLog();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  v27 = [v23 uuid];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v122 = (uint64_t)v27;
                  v28 = v26;
                  v29 = "[HighlightsGeneration] Month %@ is empty. Cleaning up.";
                  goto LABEL_19;
                }
              }

              [v5 addObject:v23];
LABEL_21:
            }
            uint64_t v20 = [obj countByEnumeratingWithState:&v108 objects:v120 count:16];
          }
          while (v20);
        }

        uint64_t v30 = [v5 count];
        if (v30)
        {
          uint64_t v31 = v30;
          context = (void *)MEMORY[0x19F38D3B0]();
          long long v32 = PLMomentsGetLog();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v122 = v31;
            _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Found %lu empty months. Cleaning up.", buf, 0xCu);
          }

          uint64_t v33 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY childPhotosHighlights IN (%@)", v5];
          long long v34 = [(PLPhotosHighlightGenerator *)v76 dataManager];
          id v107 = v82;
          v77 = (void *)v33;
          [v34 allPhotosHighlightsOfKind:2 withPredicate:v33 error:&v107];
          unint64_t v36 = v35 = v5;
          id v74 = v107;

          id v37 = objc_msgSend(v35, "_pl_map:", &__block_literal_global_104_48542);
          long long v103 = 0u;
          long long v104 = 0u;
          long long v105 = 0u;
          long long v106 = 0u;
          id v83 = v36;
          uint64_t v38 = [v83 countByEnumeratingWithState:&v103 objects:v119 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v40 = *(void *)v104;
            do
            {
              for (uint64_t j = 0; j != v39; ++j)
              {
                if (*(void *)v104 != v40) {
                  objc_enumerationMutation(v83);
                }
                v42 = *(void **)(*((void *)&v103 + 1) + 8 * j);
                id v43 = [v42 childPhotosHighlights];
                v44 = objc_msgSend(v43, "_pl_map:", &__block_literal_global_107_48543);

                if ([v44 isSubsetOfSet:v37])
                {
                  uint64_t v45 = PLMomentsGetLog();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                  {
                    long long v46 = [v42 uuid];
                    *(_DWORD *)buf = 138412290;
                    uint64_t v122 = (uint64_t)v46;
                    long long v47 = v45;
                    long long v48 = "[HighlightsGeneration] Year %@ will be empty. Cleaning up.";
LABEL_37:
                    _os_log_impl(&dword_19B3C7000, v47, OS_LOG_TYPE_DEFAULT, v48, buf, 0xCu);
                  }
                }
                else
                {
                  if ([v44 count]) {
                    goto LABEL_39;
                  }
                  uint64_t v45 = PLMomentsGetLog();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                  {
                    long long v46 = [v42 uuid];
                    *(_DWORD *)buf = 138412290;
                    uint64_t v122 = (uint64_t)v46;
                    long long v47 = v45;
                    long long v48 = "[HighlightsGeneration] Year %@ is empty. Cleaning up.";
                    goto LABEL_37;
                  }
                }

                [v85 addObject:v42];
LABEL_39:
              }
              uint64_t v39 = [v83 countByEnumeratingWithState:&v103 objects:v119 count:16];
            }
            while (v39);
          }

          uint64_t v49 = [v85 count];
          id v4 = v81;
          if (v49)
          {
            uint64_t v50 = v49;
            uint64_t v51 = PLMomentsGetLog();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              uint64_t v122 = v50;
              _os_log_impl(&dword_19B3C7000, v51, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Found %lu empty years. Cleaning up.", buf, 0xCu);
            }
          }
          id v52 = v74;
        }
        else
        {
          id v4 = v81;
          id v52 = v82;
        }

        id v11 = v52;
        v7 = v80;
      }
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      id v55 = v4;
      uint64_t v56 = [v55 countByEnumeratingWithState:&v99 objects:v118 count:16];
      if (v56)
      {
        uint64_t v57 = v56;
        uint64_t v58 = *(void *)v100;
        do
        {
          for (uint64_t k = 0; k != v57; ++k)
          {
            if (*(void *)v100 != v58) {
              objc_enumerationMutation(v55);
            }
            [*(id *)(*((void *)&v99 + 1) + 8 * k) delete];
          }
          uint64_t v57 = [v55 countByEnumeratingWithState:&v99 objects:v118 count:16];
        }
        while (v57);
      }

      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      id v60 = v84;
      uint64_t v61 = [v60 countByEnumeratingWithState:&v95 objects:v117 count:16];
      if (v61)
      {
        uint64_t v62 = v61;
        uint64_t v63 = *(void *)v96;
        do
        {
          for (uint64_t m = 0; m != v62; ++m)
          {
            if (*(void *)v96 != v63) {
              objc_enumerationMutation(v60);
            }
            [*(id *)(*((void *)&v95 + 1) + 8 * m) delete];
          }
          uint64_t v62 = [v60 countByEnumeratingWithState:&v95 objects:v117 count:16];
        }
        while (v62);
      }

      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      id v65 = v85;
      uint64_t v66 = [v65 countByEnumeratingWithState:&v91 objects:v116 count:16];
      if (v66)
      {
        uint64_t v67 = v66;
        uint64_t v68 = *(void *)v92;
        do
        {
          for (uint64_t n = 0; n != v67; ++n)
          {
            if (*(void *)v92 != v68) {
              objc_enumerationMutation(v65);
            }
            [*(id *)(*((void *)&v91 + 1) + 8 * n) delete];
          }
          uint64_t v67 = [v65 countByEnumeratingWithState:&v91 objects:v116 count:16];
        }
        while (v67);
      }

      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      uint64_t v53 = v10;
      uint64_t v70 = [v53 countByEnumeratingWithState:&v87 objects:v115 count:16];
      if (v70)
      {
        uint64_t v71 = v70;
        uint64_t v72 = *(void *)v88;
        do
        {
          for (iuint64_t i = 0; ii != v71; ++ii)
          {
            if (*(void *)v88 != v72) {
              objc_enumerationMutation(v53);
            }
            [*(id *)(*((void *)&v87 + 1) + 8 * ii) delete];
          }
          uint64_t v71 = [v53 countByEnumeratingWithState:&v87 objects:v115 count:16];
        }
        while (v71);
      }

      uint64_t v5 = v84;
    }
    else
    {
      __int16 v54 = PLMomentsGetLog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v122 = (uint64_t)v11;
        _os_log_impl(&dword_19B3C7000, v54, OS_LOG_TYPE_ERROR, "Cleanup Empty Day Group Highlights error:%@", buf, 0xCu);
      }

      uint64_t v53 = 0;
    }
  }
  else
  {
    uint64_t v53 = PLMomentsGetLog();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v122 = (uint64_t)v8;
      _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_ERROR, "Cleanup Empty Day Highlights error:%@", buf, 0xCu);
    }
    id v11 = v8;
  }
}

uint64_t __52__PLPhotosHighlightGenerator_cleanupEmptyHighlights__block_invoke_2_105(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

uint64_t __52__PLPhotosHighlightGenerator_cleanupEmptyHighlights__block_invoke_102(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

uint64_t __52__PLPhotosHighlightGenerator_cleanupEmptyHighlights__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

uint64_t __52__PLPhotosHighlightGenerator_cleanupEmptyHighlights__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (void)updateHighlightTitles
{
  v48[2] = *MEMORY[0x1E4F143B8];
  v3 = PLMomentsGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Running periodic maintenance task to update highlight titles", buf, 2u);
  }

  id v4 = +[PLMomentGenerationUtils today];
  uint64_t v5 = [(id)objc_opt_class() lastHighlightTitlesUpdateDay];
  id v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v7 = [v6 components:4 fromDate:v4];
  id v8 = [v6 components:4 fromDate:v5];
  uint64_t v9 = [v7 year];
  long long v35 = v8;
  if (v9 == [v8 year])
  {
    id v10 = [v5 dateByAddingTimeInterval:-604800.0];
  }
  else
  {
    id v42 = 0;
    [v6 rangeOfUnit:4 startDate:&v42 interval:0 forDate:v5];
    id v10 = v42;
  }
  unint64_t v36 = v10;
  uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self.endDate >= %@", v10];
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind = %ld OR kind = %ld", 0, 3);
  uint64_t v13 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v33 = (void *)v12;
  long long v34 = (void *)v11;
  v48[0] = v11;
  v48[1] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  uint64_t v15 = [v13 andPredicateWithSubpredicates:v14];

  v16 = [(PLPhotosHighlightGenerator *)self dataManager];
  id v41 = 0;
  v17 = [v16 allPhotosHighlightsWithPredicate:v15 error:&v41];
  id v18 = v41;

  uint64_t v19 = PLMomentsGetLog();
  uint64_t v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v45 = (uint64_t)v18;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "[HighlightsGeneration] Error while fetching highlights needing title update: %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v30 = v7;
    uint64_t v31 = v5;
    long long v32 = v4;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [v17 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v45 = v21;
      __int16 v46 = 2112;
      long long v47 = v36;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Running on %lu highlights, since date %@", buf, 0x16u);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v29 = v17;
    id v22 = v17;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v38;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v38 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v37 + 1) + 8 * v26);
          v28 = (void *)MEMORY[0x19F38D3B0]();
          [(id)objc_opt_class() updateTitlesForHighlight:v27 dateRangeTitleGenerator:self->_dateRangeTitleGenerator options:1];
          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v24);
    }

    id v4 = v32;
    [(id)objc_opt_class() setLastHighlightTitlesUpdateDay:v32];
    v7 = v30;
    uint64_t v5 = v31;
    v17 = v29;
  }
}

- (void)processUnprocessedMomentLocations
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  PLMomentGenerationGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v5 = v3;
  id v6 = v5;
  unint64_t v85 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ProcessUnprocessedMomentLocations", "", buf, 2u);
  }
  os_signpost_id_t spid = v4;

  uint64_t v83 = mach_absolute_time();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataManager);
  [WeakRetained fetchLocationsOfInterestIfNeeded];
  long long v90 = WeakRetained;
  int v8 = [WeakRetained routineIsAvailable];
  long long v88 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v9 = [(PLFrequentLocationManager *)self->_frequentLocationManager currentFrequentLocations];

  v86 = v6;
  if (v9)
  {
    id v10 = [(PLPhotosHighlightGenerator *)self _fetchAllMoments];
    uint64_t v11 = [(PLPhotosHighlightGenerator *)self dataManager];
    uint64_t v12 = [(id)objc_opt_class() processingMomentsFromMoments:v10];

    BOOL v103 = [(PLFrequentLocationManager *)self->_frequentLocationManager frequentLocationsDidChangeFromUpdateWithMoments:v12];
    if (v103) {
      [(PLPhotosHighlightGenerator *)self _fetchMomentsRequiringLocationProcessingWhenFrequentLocationsChanged];
    }
    else {
    uint64_t v13 = [(PLPhotosHighlightGenerator *)self _fetchMomentsRequiringLocationProcessingWhenFrequentLocationsAreAvailable];
    }
    [v88 addObjectsFromArray:v13];
  }
  else
  {
    BOOL v103 = 0;
  }
  v14 = @"unavailable";
  if (v8)
  {
    uint64_t v15 = [(PLPhotosHighlightGenerator *)self _fetchMomentsRequiringLocationProcessingWhenCoreRoutineIsAvailable];
    [v88 addObjectsFromArray:v15];

    v14 = @"available";
  }
  v16 = @"available";
  if (!v9) {
    v16 = @"unavailable";
  }
  *(double *)&v17 = COERCE_DOUBLE(v16);
  id v18 = @"did not change";
  if (v103) {
    id v18 = @"changed";
  }
  uint64_t v19 = v18;
  uint64_t v20 = [v88 count];
  uint64_t v21 = PLMomentsGetLog();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  long long v87 = v19;
  if (v20)
  {
    if (v22)
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v123 = (const char *)v14;
      __int16 v124 = 2112;
      double v125 = *(double *)&v17;
      __int16 v126 = 2112;
      v127 = v19;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Running periodic maintenance task to update moment processed locations, routine %@ and frequent locations %@ (%@)", buf, 0x20u);
    }
    v84 = v17;

    v81 = self;
    uint64_t v21 = [(PLFrequentLocationManager *)self->_frequentLocationManager currentFrequentLocations];
    id v101 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id obj = v88;
    uint64_t v23 = [obj countByEnumeratingWithState:&v114 objects:v121 count:16];
    uint64_t v24 = v90;
    if (v23)
    {
      uint64_t v25 = v23;
      unint64_t v26 = 0;
      uint64_t v27 = *(void *)v115;
      long long v102 = v21;
      uint64_t v89 = *(void *)v115;
      do
      {
        uint64_t v28 = 0;
        uint64_t v91 = v25;
        do
        {
          if (*(void *)v115 != v27) {
            objc_enumerationMutation(obj);
          }
          v29 = *(void **)(*((void *)&v114 + 1) + 8 * v28);
          uint64_t v30 = MEMORY[0x19F38D3B0]();
          if (v26 >= 0x64)
          {
            if ([v24 hasChanges])
            {
              id v113 = 0;
              char v31 = [v24 save:&v113];
              long long v32 = (char *)v113;
              if ((v31 & 1) == 0)
              {
                uint64_t v33 = PLMomentsGetLog();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v123 = v32;
                  _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "[HighlightsGeneration] Error saving changes while processing location, error: %@", buf, 0xCu);
                }
              }
            }
            unint64_t v26 = 0;
          }
          long long v98 = (void *)v30;
          unint64_t v99 = v26;
          long long v34 = [v29 assets];
          long long v35 = [v34 anyObject];
          uint64_t v36 = [v35 assetComparisonSortDescriptors];
          long long v37 = (void *)v36;
          long long v38 = (void *)MEMORY[0x1E4F1CBF0];
          if (v36) {
            long long v38 = (void *)v36;
          }
          id v39 = v38;

          long long v96 = v39;
          long long v97 = v34;
          uint64_t v40 = [v34 sortedArrayUsingDescriptors:v39];
          long long v94 = [[PLCompactMomentClustering alloc] initWithDataManager:v24 frequentLocations:v21];
          long long v95 = (void *)v40;
          long long v100 = [(PLCompactMomentClustering *)v94 createAssetClustersForAssetsInDay:v40];
          uint64_t v41 = [v100 count];
          if (v41 == 1)
          {
            int v42 = [v29 processedLocation];
            +[PLMomentGenerationUtils processLocationIfNecessaryInMoment:v29 usingManager:v24 frequentLocations:v21 frequentLocationsDidChange:v103];
            BOOL v43 = v42 == [v29 processedLocation];
            uint64_t v45 = v98;
            unint64_t v44 = v99;
            if (v43) {
              goto LABEL_62;
            }
            uint64_t v93 = v28;
            __int16 v46 = [v29 uniqueObjectID];
            [v101 addObject:v46];
          }
          else
          {
            int v47 = v41;
            long long v48 = PLMomentsGetLog();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              uint64_t v49 = [v29 uuid];
              *(_DWORD *)buf = 138412546;
              uint64_t v123 = v49;
              __int16 v124 = 1024;
              LODWORD(v125) = v47;
              _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_INFO, "[HighlightsGeneration] Split assets in moment with uuid %@ into %d separate moments", buf, 0x12u);
            }
            uint64_t v93 = v28;

            long long v111 = 0u;
            long long v112 = 0u;
            long long v109 = 0u;
            long long v110 = 0u;
            id v50 = v100;
            uint64_t v51 = [v50 countByEnumeratingWithState:&v109 objects:v120 count:16];
            if (v51)
            {
              uint64_t v52 = v51;
              unint64_t v53 = 0;
              __int16 v46 = 0;
              uint64_t v54 = *(void *)v110;
              do
              {
                for (uint64_t i = 0; i != v52; ++i)
                {
                  if (*(void *)v110 != v54) {
                    objc_enumerationMutation(v50);
                  }
                  uint64_t v56 = *(void **)(*((void *)&v109 + 1) + 8 * i);
                  uint64_t v57 = [v56 assets];
                  unint64_t v58 = [v57 count];

                  if (v58 > v53)
                  {
                    id v59 = v56;

                    unint64_t v53 = v58;
                    __int16 v46 = v59;
                  }
                }
                uint64_t v52 = [v50 countByEnumeratingWithState:&v109 objects:v120 count:16];
              }
              while (v52);
            }
            else
            {
              __int16 v46 = 0;
            }

            long long v107 = 0u;
            long long v108 = 0u;
            long long v105 = 0u;
            long long v106 = 0u;
            id v60 = v50;
            uint64_t v61 = [v60 countByEnumeratingWithState:&v105 objects:v119 count:16];
            uint64_t v24 = v90;
            if (v61)
            {
              uint64_t v62 = v61;
              uint64_t v63 = *(void *)v106;
              do
              {
                for (uint64_t j = 0; j != v62; ++j)
                {
                  if (*(void *)v106 != v63) {
                    objc_enumerationMutation(v60);
                  }
                  id v65 = *(void **)(*((void *)&v105 + 1) + 8 * j);
                  if (v65 == v46) {
                    uint64_t v66 = v29;
                  }
                  else {
                    uint64_t v66 = 0;
                  }
                  id v67 = v66;
                  uint64_t v68 = +[PLAssetCollectionGenerator createMomentOrUpdateForAssetCluster:v65 affectedMoment:v67 dataManager:v90];
                  +[PLMomentGenerationUtils processLocationIfNecessaryInMoment:v68 usingManager:v90 frequentLocations:v102 frequentLocationsDidChange:v103];
                  v69 = [v29 uniqueObjectID];

                  [v101 addObject:v69];
                }
                uint64_t v62 = [v60 countByEnumeratingWithState:&v105 objects:v119 count:16];
              }
              while (v62);
            }

            uint64_t v21 = v102;
            uint64_t v27 = v89;
            uint64_t v25 = v91;
            uint64_t v45 = v98;
            unint64_t v44 = v99;
            long long v34 = v97;
          }

          uint64_t v28 = v93;
LABEL_62:
          unint64_t v26 = v44 + 1;

          ++v28;
        }
        while (v28 != v25);
        uint64_t v25 = [obj countByEnumeratingWithState:&v114 objects:v121 count:16];
      }
      while (v25);
    }

    id v104 = 0;
    uint64_t v70 = [v24 momentsWithUniqueIDs:v101 error:&v104];
    uint64_t v71 = (char *)v104;
    if (v70)
    {
      uint64_t v72 = [MEMORY[0x1E4F1CAD0] set];
      [(PLPhotosHighlightGenerator *)v81 beginGenerationWithAssets:v72 hiddenAssets:MEMORY[0x1E4F1CBF0]];

      v73 = [MEMORY[0x1E4F1CAD0] setWithArray:v70];
      [(PLPhotosHighlightGenerator *)v81 generateHighlightsForUpsertedMoments:v73 frequentLocationsDidChange:v103];

      [(PLPhotosHighlightGenerator *)v81 finishGeneration];
      uint64_t v74 = mach_absolute_time();
      uint32_t numer = info.numer;
      denouint64_t m = info.denom;
      v77 = v86;
      v78 = v86;
      v79 = v78;
      if (v85 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v79, OS_SIGNPOST_INTERVAL_END, spid, "ProcessUnprocessedMomentLocations", "", buf, 2u);
      }

      if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v123 = "ProcessUnprocessedMomentLocations";
        __int16 v124 = 2048;
        double v125 = (float)((float)((float)((float)(v74 - v83) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_19B3C7000, v79, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
    }
    else
    {
      v80 = PLMomentsGetLog();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v123 = v71;
        _os_log_impl(&dword_19B3C7000, v80, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Failed to fetch moments with updated locations with error: %@", buf, 0xCu);
      }

      v77 = v86;
    }

    v17 = v84;
  }
  else
  {
    v77 = v86;
    if (v22)
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v123 = (const char *)v14;
      __int16 v124 = 2112;
      double v125 = *(double *)&v17;
      __int16 v126 = 2112;
      v127 = v87;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Periodic maintenance task to update moment processed locations completed without processing any moments, routine %@ and frequent locations %@ (%@)", buf, 0x20u);
    }
  }
}

- (void)processCachedLocationOfInterest
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  PLMomentGenerationGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v5 = v3;
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ProcessCachedLocationOfInterest", "", buf, 2u);
  }

  uint64_t v7 = mach_absolute_time();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataManager);
  [WeakRetained fetchLocationsOfInterestIfNeeded];
  if ([WeakRetained routineIsAvailable])
  {
    uint64_t v9 = [WeakRetained locationsOfInterest];
    uint64_t v10 = [v9 count];
    if (!v10)
    {
      uint64_t v13 = PLMomentsGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Periodic maintenance task to update cached location of interest completed without any location of interest", buf, 2u);
      }
      goto LABEL_72;
    }
    double v11 = *(double *)&v10;
    unint64_t v61 = v4 - 1;
    id v85 = 0;
    uint64_t v12 = [WeakRetained momentsRequiringLocationOfInterestUpdateWithError:&v85];
    uint64_t v13 = v85;
    uint64_t v14 = [v12 count];
    uint64_t v62 = v12;
    if (!v12 || v13)
    {
      v16 = PLMomentsGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v92 = (const char *)v13;
        unint64_t v53 = "[HighlightsGeneration] Periodic maintenance task to update cached location of interest failed to fetch rel"
              "evant moments: %@";
        uint64_t v54 = v16;
        os_log_type_t v55 = OS_LOG_TYPE_ERROR;
        uint32_t v56 = 12;
LABEL_70:
        _os_log_impl(&dword_19B3C7000, v54, v55, v53, buf, v56);
      }
    }
    else
    {
      uint64_t v15 = (const char *)v14;
      uint64_t v60 = v7;
      os_signpost_id_t spid = v4;
      v16 = PLMomentsGetLog();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        id v58 = WeakRetained;
        id v59 = v6;
        if (v17)
        {
          *(_DWORD *)buf = 134218240;
          long long v92 = v15;
          __int16 v93 = 2048;
          double v94 = v11;
          _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Running periodic maintenance task to update cached location of interest on %tu moments, with %tu location of interest", buf, 0x16u);
        }

        id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id obj = v12;
        uint64_t v68 = [obj countByEnumeratingWithState:&v81 objects:v90 count:16];
        if (v68)
        {
          uint64_t v66 = *(void *)v82;
          double v18 = *MEMORY[0x1E4F1E568];
          v64 = v9;
          do
          {
            for (uint64_t i = 0; i != v68; ++i)
            {
              if (*(void *)v82 != v66) {
                objc_enumerationMutation(obj);
              }
              uint64_t v20 = *(void **)(*((void *)&v81 + 1) + 8 * i);
              uint64_t v21 = [v20 approximateLocation];
              BOOL v22 = v67;
              if (!v21) {
                goto LABEL_37;
              }
              long long v79 = 0u;
              long long v80 = 0u;
              long long v77 = 0u;
              long long v78 = 0u;
              uint64_t v23 = v9;
              uint64_t v24 = [v23 countByEnumeratingWithState:&v77 objects:v89 count:16];
              if (v24)
              {
                uint64_t v25 = v24;
                uint64_t v26 = *(void *)v78;
                unsigned __int16 v27 = 6;
                double v28 = v18;
                do
                {
                  for (uint64_t j = 0; j != v25; ++j)
                  {
                    if (*(void *)v78 != v26) {
                      objc_enumerationMutation(v23);
                    }
                    uint64_t v30 = *(void **)(*((void *)&v77 + 1) + 8 * j);
                    [v30 distanceFromLocation:v21];
                    double v32 = v31;
                    if (v31 <= 50.0 && v31 < v28)
                    {
                      uint64_t v34 = [v30 type];
                      if (v34 == 1)
                      {
                        unsigned __int16 v27 = 4;
                      }
                      else if (!v34)
                      {
                        unsigned __int16 v27 = 3;
                      }
                      double v28 = v32;
                    }
                  }
                  uint64_t v25 = [v23 countByEnumeratingWithState:&v77 objects:v89 count:16];
                }
                while (v25);
              }
              else
              {
                unsigned __int16 v27 = 6;
              }

              BOOL v35 = [v20 processedLocation] == v27;
              uint64_t v9 = v64;
              BOOL v22 = v65;
              if (!v35) {
LABEL_37:
              }
                [v22 addObject:v20];
            }
            uint64_t v68 = [obj countByEnumeratingWithState:&v81 objects:v90 count:16];
          }
          while (v68);
        }

        uint64_t v36 = PLMomentsGetLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v37 = [v65 count];
          double v38 = COERCE_DOUBLE([v67 count]);
          *(_DWORD *)buf = 134218240;
          long long v92 = (const char *)v37;
          __int16 v93 = 2048;
          double v94 = v38;
          _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Found %tu moments needing processed location reset, and %tu moment without location anymore", buf, 0x16u);
        }

        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        v16 = v65;
        uint64_t v39 = [v16 countByEnumeratingWithState:&v73 objects:v88 count:16];
        id v6 = v59;
        uint64_t v13 = 0;
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v74;
          do
          {
            for (uint64_t k = 0; k != v40; ++k)
            {
              if (*(void *)v74 != v41) {
                objc_enumerationMutation(v16);
              }
              [*(id *)(*((void *)&v73 + 1) + 8 * k) setProcessedLocation:0];
            }
            uint64_t v40 = [v16 countByEnumeratingWithState:&v73 objects:v88 count:16];
          }
          while (v40);
        }

        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v43 = v67;
        uint64_t v44 = [v43 countByEnumeratingWithState:&v69 objects:v87 count:16];
        id WeakRetained = v58;
        if (v44)
        {
          uint64_t v45 = v44;
          uint64_t v46 = *(void *)v70;
          do
          {
            for (uint64_t m = 0; m != v45; ++m)
            {
              if (*(void *)v70 != v46) {
                objc_enumerationMutation(v43);
              }
              [*(id *)(*((void *)&v69 + 1) + 8 * m) setProcessedLocation:2];
            }
            uint64_t v45 = [v43 countByEnumeratingWithState:&v69 objects:v87 count:16];
          }
          while (v45);
        }

        uint64_t v48 = mach_absolute_time();
        uint32_t numer = info.numer;
        denouint64_t m = info.denom;
        uint64_t v51 = v59;
        uint64_t v52 = v51;
        if (v61 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v52, OS_SIGNPOST_INTERVAL_END, spid, "ProcessCachedLocationOfInterest", "", buf, 2u);
        }

        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          long long v92 = "ProcessCachedLocationOfInterest";
          __int16 v93 = 2048;
          double v94 = (float)((float)((float)((float)(v48 - v60) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }

        goto LABEL_71;
      }
      if (v17)
      {
        *(_WORD *)buf = 0;
        unint64_t v53 = "[HighlightsGeneration] Periodic maintenance task to update cached location of interest completed without p"
              "rocessing any moments";
        uint64_t v54 = v16;
        os_log_type_t v55 = OS_LOG_TYPE_DEFAULT;
        uint32_t v56 = 2;
        goto LABEL_70;
      }
    }
LABEL_71:

LABEL_72:
    goto LABEL_73;
  }
  uint64_t v9 = PLMomentsGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Periodic maintenance task to update cached location of interest could not run: CoreRoutine is not available", buf, 2u);
  }
LABEL_73:
}

- (void)processRecentHighlights
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v3 = PLMomentsGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Running periodic maintenance task to update recent Highlights", buf, 2u);
  }

  uint64_t v41 = +[PLMomentGenerationUtils today];
  recentHighlightsDateInterval = self->_recentHighlightsDateInterval;
  self->_recentHighlightsDateInterval = 0;

  uint64_t v5 = [(PLPhotosHighlightGenerator *)self fetchAllRecentHighlights];
  id v6 = [MEMORY[0x1E4F1CA80] set];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v52 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v51 + 1) + 8 * i) moments];
        [v6 unionSet:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v51 objects:v58 count:16];
    }
    while (v9);
  }
  uint64_t v40 = v7;

  int v42 = self;
  uint64_t v13 = [(PLPhotosHighlightGenerator *)self fetchAllOngoingTripDayGroupHighlights];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v48 != v16) {
          objc_enumerationMutation(v13);
        }
        double v18 = *(void **)(*((void *)&v47 + 1) + 8 * j);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        uint64_t v19 = [v18 childDayGroupPhotosHighlights];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v43 objects:v56 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v44;
          do
          {
            for (uint64_t k = 0; k != v21; ++k)
            {
              if (*(void *)v44 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = [*(id *)(*((void *)&v43 + 1) + 8 * k) moments];
              [v6 unionSet:v24];
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v43 objects:v56 count:16];
          }
          while (v21);
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v47 objects:v57 count:16];
    }
    while (v15);
  }
  p_isa = (id *)&v42->super.isa;
  if (+[PLAggregationProcessor isEnabled])
  {
    uint64_t v26 = +[PLAggregationProcessor allowedStartDateToAggregate];
    unsigned __int16 v27 = [(id)objc_opt_class() lastRecentHighlightUpdateDate];
    double v28 = [MEMORY[0x1E4F1C9C8] distantPast];
    int v29 = [v27 isEqualToDate:v28];

    if (v29)
    {
      uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v26 endDate:v41];
      if (!v30) {
        goto LABEL_33;
      }
    }
    else
    {
      +[PLAggregationProcessor timeIntervalOfRecentContentToIgnore];
      double v32 = [v27 dateByAddingTimeInterval:-v31];
      if ([v32 compare:v26] == -1) {
        uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v32 endDate:v26];
      }
      else {
        uint64_t v30 = 0;
      }

      if (!v30) {
        goto LABEL_33;
      }
    }
    uint64_t v33 = [(PLPhotosHighlightGenerator *)v42 dataManager];
    uint64_t v34 = [v33 momentsIntersectingDateInterval:v30];

    [v6 addObjectsFromArray:v34];
    p_isa = (id *)&v42->super.isa;
LABEL_33:
  }
  BOOL v35 = [p_isa _fetchAllMoments];
  uint64_t v36 = [p_isa dataManager];
  uint64_t v37 = [(id)objc_opt_class() processingMomentsFromMoments:v35];

  uint64_t v38 = [p_isa[3] frequentLocationsDidChangeFromUpdateWithMoments:v37];
  uint64_t v39 = [MEMORY[0x1E4F1CAD0] set];
  [p_isa beginGenerationWithAssets:v39 hiddenAssets:MEMORY[0x1E4F1CBF0]];

  [p_isa generateHighlightsForUpsertedMoments:v6 frequentLocationsDidChange:v38];
  [p_isa finishGeneration];
  [(id)objc_opt_class() setLastRecentHighlightUpdateDate:v41];
}

- (void)finishGeneration
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [(PLPhotosHighlightGenerator *)self highlightsToDelete];
  uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        v3 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        os_signpost_id_t v4 = [v3 moments];
        uint64_t v5 = [v4 count];
        if (v5)
        {
          uint64_t v23 = v5;
          uint64_t v26 = v3;
          id v6 = (void *)[@"[" mutableCopy];
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v7 = v4;
          uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v41 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            char v10 = 0;
            uint64_t v11 = *(void *)v28;
            do
            {
              for (uint64_t j = 0; j != v9; ++j)
              {
                if (*(void *)v28 != v11) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * j);
                if (v10) {
                  [v6 appendString:@", "];
                }
                uint64_t v14 = [v13 uuid];
                [v6 appendString:v14];

                char v10 = 1;
              }
              uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v41 count:16];
            }
            while (v9);
          }

          [v6 appendString:@"]"];
          uint64_t v15 = PLMomentsGetLog();
          v3 = v26;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            uint64_t v16 = [v26 uuid];
            *(_DWORD *)buf = 138412802;
            uint64_t v36 = v16;
            __int16 v37 = 2048;
            uint64_t v38 = v23;
            __int16 v39 = 2112;
            uint64_t v40 = v6;
            _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_FAULT, "Highlight(%@) being deleted has %lu moments(%@)", buf, 0x20u);
          }
        }
        [v3 delete];
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v42 count:16];
    }
    while (v25);
  }

  BOOL v17 = [(PLPhotosHighlightGenerator *)self highlightsNeedingNewKeyAsset];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = [(PLPhotosHighlightGenerator *)self highlightsNeedingNewKeyAsset];
    [v19 updateKeyAssetForHighlights:v20];
  }
  [(PLPhotosHighlightGenerator *)self setDidCallBeginGeneration:0];
}

- (BOOL)_updateHighlightProperties:(id)a3 fromHighlightCluster:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v21 = [v5 startDate];
  uint64_t v20 = [v5 endDate];
  LODWORD(a4) = [v5 type];
  int v7 = [v5 kind];
  int v16 = [v5 category];
  int v18 = [v5 startTimeZoneOffset];
  int v19 = [v5 endTimeZoneOffset];
  uint64_t v8 = [v6 startDate];
  uint64_t v9 = [v6 endDate];
  uint64_t v10 = [v6 type];
  uint64_t v11 = [v6 kind];
  uint64_t v12 = [v6 category];
  uint64_t v13 = [v6 startTimeZoneOffset];
  int v17 = [v6 endTimeZoneOffset];

  BOOL v14 = a4 != v10;
  if (a4 != v10) {
    [v5 setType:v10];
  }
  if (v7 != v11)
  {
    [v5 setKind:v11];
    BOOL v14 = 1;
  }
  if (v16 != v12)
  {
    [v5 setCategory:v12];
    BOOL v14 = 1;
  }
  if (([v21 isEqualToDate:v8] & 1) == 0)
  {
    [v5 setStartDate:v8];
    BOOL v14 = 1;
  }
  if (([v20 isEqualToDate:v9] & 1) == 0)
  {
    [v5 setEndDate:v9];
    BOOL v14 = 1;
  }
  if (v18 != v13)
  {
    [v5 setStartTimeZoneOffset:v13];
    BOOL v14 = 1;
  }
  if (v19 != v17)
  {
    objc_msgSend(v5, "setEndTimeZoneOffset:");
    BOOL v14 = 1;
  }

  return v14;
}

- (id)_insertDayGroupPhotosHighlightCluster:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  os_signpost_id_t v4 = [v55 moments];
  id v56 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v62 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v61 + 1) + 8 * i) highlight];
        uint64_t v12 = v11;
        if (v11 && ([v11 isDeleted] & 1) == 0)
        {
          [v5 addObject:v12];
          uint64_t v13 = [v12 parentDayGroupPhotosHighlight];
          BOOL v14 = v13;
          if (v13)
          {
            if (([v13 isDeleted] & 1) == 0)
            {
              uint64_t v15 = [(PLPhotosHighlightGenerator *)self upsertedHighlights];
              char v16 = [v15 containsObject:v14];

              if ((v16 & 1) == 0) {
                [v56 addObject:v14];
              }
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v61 objects:v66 count:16];
    }
    while (v8);
  }

  int v17 = [v56 anyObject];
  int v18 = v17;
  if (v17 && ![v17 isDeleted])
  {
    char v21 = 0;
  }
  else
  {
    int v19 = [(PLPhotosHighlightGenerator *)self dataManager];
    uint64_t v20 = [v19 insertNewPhotosHighlight];

    [v20 setPromotionScore:0.3];
    char v21 = 1;
    int v18 = v20;
  }
  uint64_t v22 = [(PLPhotosHighlightGenerator *)self upsertedHighlights];
  [v22 addObject:v18];

  uint64_t v23 = v55;
  uint64_t v24 = (v21 & 1) != 0
     || [(PLPhotosHighlightGenerator *)self shouldForceVisibilityStateUpdateForHighlight:v18 highlightCluster:v55];
  BOOL v25 = [(PLPhotosHighlightGenerator *)self _updateHighlightProperties:v18 fromHighlightCluster:v55];
  uint64_t v26 = [(PLPhotosHighlightGenerator *)self highlightsWithDeletedAssets];
  char v54 = [v26 containsObject:v18];

  long long v27 = [v55 assets];
  long long v28 = v27;
  if ((v21 & 1) == 0)
  {
    uint64_t v29 = [v27 count];
    long long v30 = [v18 dayGroupAssets];
    if ([v30 count] == v29 && (objc_msgSend(v30, "isEqualToSet:", v28) & 1) != 0)
    {
      if (!v25)
      {
        BOOL v52 = v25;
        id v31 = v5;
        long long v32 = [v18 childDayGroupPhotosHighlights];
        long long v33 = v31;
        uint64_t v34 = [v31 count];
        if (v34 == [v32 count])
        {
          BOOL v35 = v33;
          char v36 = [v33 isEqualToSet:v32];

          BOOL v25 = v52;
          if (v36)
          {
            int v37 = 0;
            int v38 = 0;
            long long v28 = 0;
            goto LABEL_42;
          }
          goto LABEL_41;
        }

        BOOL v25 = v52;
      }

LABEL_41:
      [v18 setChildDayGroupPhotosHighlights:v5];
      int v37 = 0;
      long long v28 = 0;
      int v38 = 1;
      goto LABEL_42;
    }
    unsigned int v51 = v24;
    BOOL v53 = v25;
    long long v49 = (void *)[v28 mutableCopy];
    [v49 minusSet:v30];
    long long v50 = v30;
    __int16 v39 = (void *)[v30 mutableCopy];
    [v39 minusSet:v28];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v40 = v39;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v58 != v43) {
            objc_enumerationMutation(v40);
          }
          [(PLPhotosHighlightGenerator *)self resetDayGroupCurationForAsset:*(void *)(*((void *)&v57 + 1) + 8 * j)];
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v57 objects:v65 count:16];
      }
      while (v42);
    }

    long long v28 = v49;
    uint64_t v23 = v55;
    uint64_t v24 = v51;
    BOOL v25 = v53;
  }
  long long v45 = [v23 assets];
  [v18 setDayGroupAssets:v45];

  [v18 setChildDayGroupPhotosHighlights:v5];
  int v37 = 1;
  int v38 = 1;
  if (v21)
  {
LABEL_48:
    [(PLPhotosHighlightGenerator *)self updateCurationForHighlight:v18 withAssetsBelongingToCuration:v28];
    goto LABEL_49;
  }
LABEL_42:
  if ([v28 count]) {
    char v46 = 1;
  }
  else {
    char v46 = v54;
  }
  if ((v46 & 1) != 0
    || ([v18 missingKeyAssetForKindShared] & 1) != 0
    || [v18 missingKeyAssetForKindPrivate])
  {
    goto LABEL_48;
  }
LABEL_49:
  BOOL v47 = [(PLPhotosHighlightGenerator *)self setVisibilityStateForHighlight:v18 shouldForceUpdate:v24];
  if (((v25 | v38 | v37) & 1) != 0 || v47)
  {
    [(id)objc_opt_class() updateTitlesForHighlight:v18 dateRangeTitleGenerator:self->_dateRangeTitleGenerator options:0];
    [v18 bumpHighlightVersion];
  }

  return v18;
}

- (void)_insertDayPhotosHighlightCluster:(id)a3
{
  id v34 = a3;
  os_signpost_id_t v4 = [v34 moments];
  id v5 = [(PLPhotosHighlightGenerator *)self _highlightToReuseForMoments:v4];
  id v6 = v5;
  if (v5 && ![v5 isDeleted])
  {
    char v9 = 0;
  }
  else
  {
    uint64_t v7 = [(PLPhotosHighlightGenerator *)self dataManager];
    uint64_t v8 = [v7 insertNewPhotosHighlight];

    [v8 setPromotionScore:0.3];
    char v9 = 1;
    id v6 = v8;
  }
  uint64_t v10 = [(PLPhotosHighlightGenerator *)self upsertedHighlights];
  [v10 addObject:v6];

  int v31 = [v6 category];
  int v32 = [v34 category];
  BOOL v33 = (v9 & 1) != 0
     || [(PLPhotosHighlightGenerator *)self shouldForceVisibilityStateUpdateForHighlight:v6 highlightCluster:v34];
  BOOL v11 = [(PLPhotosHighlightGenerator *)self _updateHighlightProperties:v6 fromHighlightCluster:v34];
  uint64_t v12 = [(PLPhotosHighlightGenerator *)self highlightsWithDeletedAssets];
  char v30 = [v12 containsObject:v6];

  uint64_t v13 = [v34 assets];
  BOOL v14 = v13;
  if (v9) {
    goto LABEL_16;
  }
  uint64_t v15 = [v13 count];
  char v16 = [v6 assets];
  if ([v16 count] != v15 || !objc_msgSend(v16, "isEqualToSet:", v14))
  {
    BOOL v25 = (void *)[v14 mutableCopy];
    [v25 minusSet:v16];

    BOOL v14 = v25;
LABEL_16:
    uint64_t v20 = v14;
    BOOL v14 = [v34 assets];
    [v6 setAssets:v14];
    int v21 = 1;
LABEL_17:

    goto LABEL_18;
  }
  if (v11)
  {
LABEL_38:

    uint64_t v20 = 0;
    int v21 = 0;
    goto LABEL_17;
  }
  id v17 = v4;
  uint64_t v18 = [v17 count];
  int v19 = [v6 moments];
  if (v18 != [v19 count])
  {

    goto LABEL_38;
  }
  char v29 = [v19 isEqualToSet:v17];

  uint64_t v20 = 0;
  int v21 = 0;
  uint64_t v22 = 0;
  int v23 = 0;
  int v24 = 0;
  if ((v29 & 1) == 0)
  {
LABEL_18:
    [v6 setMoments:v4];
    int v23 = 1;
    uint64_t v22 = v20;
    int v24 = v21;
  }
  if (v32 == 1)
  {
    [(PLPhotosHighlightGenerator *)self updateRecentHighlightCurationForHighlight:v6];
  }
  else if (v31 == 1)
  {
    [(PLPhotosHighlightGenerator *)self resetPreviousRecentHighlightCurationForHighlight:v6];
    uint64_t v26 = [v6 assets];
    [(PLPhotosHighlightGenerator *)self updateCurationForHighlight:v6 withAssetsBelongingToCuration:v26];
  }
  else if ((v9 & 1) != 0 {
         || ([v22 count] ? (char v27 = 1) : (char v27 = v30),
  }
             (v27 & 1) != 0
          || ([v6 missingKeyAssetForKindShared] & 1) != 0
          || [v6 missingKeyAssetForKindPrivate]))
  {
    [(PLPhotosHighlightGenerator *)self updateCurationForHighlight:v6 withAssetsBelongingToCuration:v22];
  }
  BOOL v28 = [(PLPhotosHighlightGenerator *)self setVisibilityStateForHighlight:v6 shouldForceUpdate:v33];
  if (((v11 | v23 | v24) & 1) != 0 || v28)
  {
    [(id)objc_opt_class() updateTitlesForHighlight:v6 dateRangeTitleGenerator:self->_dateRangeTitleGenerator options:0];
    [v6 bumpHighlightVersion];
  }
}

- (id)_highlightToReuseForMoments:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 v39 = [MEMORY[0x1E4F1CA80] set];
  id v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v59 objects:v70 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v60 != v7) {
          objc_enumerationMutation(obj);
        }
        char v9 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        uint64_t v10 = [v9 highlight];
        BOOL v11 = v10;
        if (v10)
        {
          if (([v10 isDeleted] & 1) == 0)
          {
            uint64_t v12 = [(PLPhotosHighlightGenerator *)self upsertedHighlights];
            char v13 = [v12 containsObject:v11];

            if ((v13 & 1) == 0)
            {
              BOOL v14 = [v5 objectForKey:v11];
              uint64_t v15 = [v14 unsignedIntegerValue];

              char v16 = [v9 assets];
              uint64_t v17 = [v16 count];

              uint64_t v18 = [NSNumber numberWithUnsignedInteger:v17 + v15];
              [v5 setObject:v18 forKey:v11];

              [v39 addObject:v11];
            }
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v59 objects:v70 count:16];
    }
    while (v6);
  }

  uint64_t v53 = 0;
  char v54 = (id *)&v53;
  uint64_t v55 = 0x3032000000;
  id v56 = __Block_byref_object_copy__48618;
  long long v57 = __Block_byref_object_dispose__48619;
  id v58 = 0;
  uint64_t v47 = 0;
  long long v48 = &v47;
  uint64_t v49 = 0x3032000000;
  long long v50 = __Block_byref_object_copy__48618;
  unsigned int v51 = __Block_byref_object_dispose__48619;
  id v52 = 0;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __58__PLPhotosHighlightGenerator__highlightToReuseForMoments___block_invoke;
  v46[3] = &unk_1E586AB78;
  v46[4] = &v47;
  v46[5] = &v53;
  int v19 = (uint64_t (**)(void, void, void))MEMORY[0x19F38D650](v46);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v20 = v5;
  int v21 = 0;
  uint64_t v22 = [v20 countByEnumeratingWithState:&v42 objects:v69 count:16];
  if (v22)
  {
    uint64_t v41 = *(void *)v43;
    *(void *)&long long v23 = 138412802;
    long long v38 = v23;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v43 != v41) {
          objc_enumerationMutation(v20);
        }
        BOOL v25 = *(void **)(*((void *)&v42 + 1) + 8 * v24);
        uint64_t v26 = objc_msgSend(v20, "objectForKey:", v25, v38);
        char v27 = [v25 startDate];
        if (v21)
        {
          uint64_t v28 = ((uint64_t (**)(void, void *, void *))v19)[2](v19, v26, v27);
          if (!v28)
          {
            int v32 = PLMomentsGetLog();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              BOOL v33 = [v21 uuid];
              id v34 = [v25 uuid];
              *(_DWORD *)buf = v38;
              long long v64 = v27;
              __int16 v65 = 2112;
              uint64_t v66 = v33;
              __int16 v67 = 2112;
              uint64_t v68 = v34;
              _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "Picking between two highlights to reuse that start on the same date(%@) bestHighlight:(%@) currentHighlight:(%@)", buf, 0x20u);
            }
            goto LABEL_21;
          }
          if (v28 != -1) {
            goto LABEL_22;
          }
        }
        id v29 = v25;

        objc_storeStrong(v54 + 5, v27);
        char v30 = v48;
        id v31 = v26;
        int v32 = v30[5];
        v30[5] = (uint64_t)v31;
        int v21 = v29;
LABEL_21:

LABEL_22:
        ++v24;
      }
      while (v22 != v24);
      uint64_t v35 = [v20 countByEnumeratingWithState:&v42 objects:v69 count:16];
      uint64_t v22 = v35;
    }
    while (v35);
  }

  id v36 = v21;
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  return v36;
}

uint64_t __58__PLPhotosHighlightGenerator__highlightToReuseForMoments___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) compare:a2];
  if (!v6) {
    uint64_t v6 = [v5 compare:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }

  return v6;
}

- (void)generateHighlightsForUpsertedMoments:(id)a3 frequentLocationsDidChange:(BOOL)a4
{
  BOOL v111 = a4;
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PLMomentGenerationGetLog();
  if (![(PLPhotosHighlightGenerator *)self didCallBeginGeneration])
  {
    uint64_t v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_FAULT, "-[PLPhotosHighlightGenerator beginGenerationWithAssets:hiddenAssets:] need to be called prior to calling -[PLPhotosHighlightGenerator generateHighlightsForUpsertedMoments:frequentLocationsDidChange:]", buf, 2u);
    }
  }
  uint64_t v8 = v6;
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v10 = v8;
  BOOL v11 = v10;
  unint64_t v109 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "GenerateHighlights", "", buf, 2u);
  }
  os_signpost_id_t v106 = v9;

  uint64_t v107 = mach_absolute_time();
  uint64_t v12 = v11;
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  mach_timebase_info v133 = 0;
  mach_timebase_info(&v133);
  BOOL v14 = v12;
  uint64_t v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "HighlightGenerationSetup", "", buf, 2u);
  }

  uint64_t v16 = mach_absolute_time();
  long long v112 = [(PLPhotosHighlightGenerator *)self highlightClusterGenerator];
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id v17 = v5;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v129 objects:v144 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v130;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v130 != v20) {
          objc_enumerationMutation(v17);
        }
        [(PLHighlightHierarchy *)self->_entitiesToUpdate addMoment:*(void *)(*((void *)&v129 + 1) + 8 * i)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v129 objects:v144 count:16];
    }
    while (v19);
  }

  uint64_t v22 = mach_absolute_time();
  uint32_t numer = v133.numer;
  denouint64_t m = v133.denom;
  BOOL v25 = v15;
  uint64_t v26 = v25;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v26, OS_SIGNPOST_INTERVAL_END, v13, "HighlightGenerationSetup", "", buf, 2u);
  }
  long long v108 = v17;

  char v27 = v26;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v136 = "HighlightGenerationSetup";
    __int16 v137 = 2048;
    double v138 = (float)((float)((float)((float)(v22 - v16) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  unint64_t v28 = 0;
  long long v110 = v27;
  do
  {
    id v29 = v27;
    os_signpost_id_t v30 = os_signpost_id_generate(v29);
    mach_timebase_info v128 = 0;
    mach_timebase_info(&v128);
    id v31 = v29;
    int v32 = v31;
    unint64_t v33 = v30 - 1;
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "HighlightGenerationLoop", "", buf, 2u);
    }
    os_signpost_id_t spid = v30;

    uint64_t v114 = mach_absolute_time();
    if (v28)
    {
      id v34 = PLMomentsGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v136 = (const char *)v28;
        _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Running highlight generation loop number %lu", buf, 0xCu);
      }
    }
    if (v28) {
      BOOL v35 = 0;
    }
    else {
      BOOL v35 = v111;
    }
    id v36 = [(PLHighlightHierarchy *)self->_entitiesToUpdate moments];
    int v37 = [v112 highlightClustersIntersectingMoments:v36 includeAllTripHighlightClusters:v35];

    long long v38 = [MEMORY[0x1E4F1CA80] set];
    long long v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    id v39 = v37;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v124 objects:v143 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v125;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v125 != v42) {
            objc_enumerationMutation(v39);
          }
          long long v44 = [*(id *)(*((void *)&v124 + 1) + 8 * j) moments];
          [v38 unionSet:v44];
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v124 objects:v143 count:16];
      }
      while (v41);
    }

    long long v45 = [(PLHighlightHierarchy *)self->_entitiesToUpdate moments];
    [v38 minusSet:v45];

    if ([v38 count])
    {
      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      id v46 = v38;
      uint64_t v47 = [v46 countByEnumeratingWithState:&v120 objects:v142 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v121;
        do
        {
          for (uint64_t k = 0; k != v48; ++k)
          {
            if (*(void *)v121 != v49) {
              objc_enumerationMutation(v46);
            }
            [(PLHighlightHierarchy *)self->_entitiesToUpdate addMoment:*(void *)(*((void *)&v120 + 1) + 8 * k)];
          }
          uint64_t v48 = [v46 countByEnumeratingWithState:&v120 objects:v142 count:16];
        }
        while (v48);
      }

      id v51 = 0;
    }
    else
    {
      id v51 = v39;
    }
    char v27 = v110;
    uint64_t v52 = mach_absolute_time();
    uint32_t v53 = v128.numer;
    uint32_t v54 = v128.denom;
    uint64_t v55 = v32;
    id v56 = v55;
    if (v33 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v56, OS_SIGNPOST_INTERVAL_END, spid, "HighlightGenerationLoop", "", buf, 2u);
    }

    long long v57 = v56;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v136 = "HighlightGenerationLoop";
      __int16 v137 = 2048;
      double v138 = (float)((float)((float)((float)(v52 - v114) * (float)v53) / (float)v54) / 1000000.0);
      _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    ++v28;
  }
  while (!v51);
  if (v28 >= 5)
  {
    id v58 = PLMomentsGetLog();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v136 = (const char *)v28;
      _os_log_impl(&dword_19B3C7000, v58, OS_LOG_TYPE_ERROR, "[HighlightsGeneration] Ran highlight generation loop more than five times(%lu)", buf, 0xCu);
    }
  }
  long long v59 = v57;
  os_signpost_id_t v60 = os_signpost_id_generate(v59);
  mach_timebase_info v128 = 0;
  mach_timebase_info(&v128);
  long long v61 = v59;
  long long v62 = v61;
  if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v62, OS_SIGNPOST_INTERVAL_BEGIN, v60, "InsertHighlights", "", buf, 2u);
  }

  uint64_t v63 = mach_absolute_time();
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id v64 = v51;
  uint64_t v65 = [v64 countByEnumeratingWithState:&v116 objects:v141 count:16];
  if (v65)
  {
    uint64_t v66 = v65;
    uint64_t v67 = *(void *)v117;
    do
    {
      for (uint64_t m = 0; m != v66; ++m)
      {
        if (*(void *)v117 != v67) {
          objc_enumerationMutation(v64);
        }
        long long v69 = *(void **)(*((void *)&v116 + 1) + 8 * m);
        int v70 = [v69 kind];
        if (v70 == 3)
        {
          id v71 = [(PLPhotosHighlightGenerator *)self _insertDayGroupPhotosHighlightCluster:v69];
        }
        else if (!v70)
        {
          [(PLPhotosHighlightGenerator *)self _insertDayPhotosHighlightCluster:v69];
        }
      }
      uint64_t v66 = [v64 countByEnumeratingWithState:&v116 objects:v141 count:16];
    }
    while (v66);
  }

  uint64_t v72 = mach_absolute_time();
  uint32_t v73 = v128.numer;
  uint32_t v74 = v128.denom;
  long long v75 = v62;
  long long v76 = v75;
  if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
  {
    uint64_t v77 = [v64 count];
    *(_DWORD *)buf = 134217984;
    v136 = (const char *)v77;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v76, OS_SIGNPOST_INTERVAL_END, v60, "InsertHighlights", "[HighlightsGeneration] Inserting/Updating %lu Highlights into Database.", buf, 0xCu);
  }

  long long v78 = v76;
  if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[HighlightsGeneration] Inserting/Updating %lu Highlights into Database.", objc_msgSend(v64, "count"));
    double v79 = COERCE_DOUBLE((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315650;
    v136 = "InsertHighlights";
    __int16 v137 = 2112;
    double v138 = v79;
    __int16 v139 = 2048;
    double v140 = (float)((float)((float)((float)(v72 - v63) * (float)v73) / (float)v74) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v78, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
  }
  long long v80 = [MEMORY[0x1E4F1CA80] set];
  highlightsToDelete = self->_highlightsToDelete;
  self->_highlightsToDelete = v80;

  long long v82 = self->_highlightsToDelete;
  long long v83 = [(PLHighlightHierarchy *)self->_entitiesToUpdate dayHighlights];
  [(NSMutableSet *)v82 unionSet:v83];

  long long v84 = self->_highlightsToDelete;
  id v85 = [(PLHighlightHierarchy *)self->_entitiesToUpdate dayGroupHighlights];
  [(NSMutableSet *)v84 unionSet:v85];

  [(NSMutableSet *)self->_highlightsToDelete minusSet:self->_upsertedHighlights];
  v86 = v78;
  os_signpost_id_t v87 = os_signpost_id_generate(v86);
  mach_timebase_info v115 = 0;
  mach_timebase_info(&v115);
  long long v88 = v86;
  uint64_t v89 = v88;
  if (v87 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v89, OS_SIGNPOST_INTERVAL_BEGIN, v87, "InsertMonthYear", "", buf, 2u);
  }

  uint64_t v90 = mach_absolute_time();
  uint64_t v91 = [(NSMutableSet *)self->_upsertedHighlights allObjects];
  [(PLPhotosHighlightGenerator *)self generateHighlightListForUpdatedHighlights:v91 deletedHighlights:self->_highlightsToDelete];

  uint64_t v92 = mach_absolute_time();
  uint32_t v94 = v115.numer;
  uint32_t v93 = v115.denom;
  uint64_t v95 = v89;
  long long v96 = v95;
  if (v87 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v95))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v96, OS_SIGNPOST_INTERVAL_END, v87, "InsertMonthYear", "[HighlightsGeneration] Generate Month/Year pass completed.", buf, 2u);
  }

  long long v97 = v96;
  if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
  {
    float v98 = (float)((float)((float)(v92 - v90) * (float)v94) / (float)v93) / 1000000.0;
    double v99 = [NSString stringWithFormat:@"[HighlightsGeneration] Generate Month/Year pass completed."];
    *(_DWORD *)buf = 136315650;
    v136 = "InsertMonthYear";
    __int16 v137 = 2112;
    double v138 = v99;
    __int16 v139 = 2048;
    double v140 = v98;
    _os_log_impl(&dword_19B3C7000, v97, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
  }
  uint64_t v100 = mach_absolute_time();
  uint32_t v101 = info.numer;
  uint32_t v102 = info.denom;
  BOOL v103 = v97;
  id v104 = v103;
  if (v109 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v103))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v104, OS_SIGNPOST_INTERVAL_END, v106, "GenerateHighlights", "", buf, 2u);
  }

  long long v105 = v104;
  if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v136 = "GenerateHighlights";
    __int16 v137 = 2048;
    double v138 = (float)((float)((float)((float)(v100 - v107) * (float)v101) / (float)v102) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v105, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

- (PLPhotosHighlightClusterGenerator)highlightClusterGenerator
{
  v3 = [PLPhotosHighlightClusterGenerator alloc];
  id v4 = [(PLPhotosHighlightGenerator *)self dataManager];
  frequentLocationManager = self->_frequentLocationManager;
  uint64_t v6 = [(PLPhotosHighlightGenerator *)self recentHighlightsDateInterval];
  uint64_t v7 = [(PLPhotosHighlightClusterGenerator *)v3 initWithDataManager:v4 frequentLocationManager:frequentLocationManager recentHighlightDateInterval:v6 localCreationDateCreator:self->_localCreationDateCreator];

  return v7;
}

- (void)registerHighlightsWithDeletedMoments:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        os_signpost_id_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        int v10 = [v9 kind];
        if (v10 == 3)
        {
          [(PLHighlightHierarchy *)self->_entitiesToUpdate addDayGroupHighlight:v9];
        }
        else if (!v10)
        {
          [(PLHighlightHierarchy *)self->_entitiesToUpdate addDayHighlight:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)beginGenerationWithAssets:(id)a3 hiddenAssets:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PLMomentGenerationGetLog();
  if ([(PLPhotosHighlightGenerator *)self didCallBeginGeneration]
    && os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_FAULT, "-[PLPhotosHighlightGenerator finishGeneration] should have been called before calling -[PLPhotosHighlightGenerator beginGenerationWithAssets:hiddenAssets:]", buf, 2u);
  }
  [(PLPhotosHighlightGenerator *)self setDidCallBeginGeneration:1];
  [(PLPhotosHighlightGenerator *)self _resetProperties];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v15 = [v14 highlightBeingAssets];
        uint64_t v16 = [v14 dayGroupHighlightBeingAssets];
        if (v15) {
          [(PLHighlightHierarchy *)self->_entitiesToUpdate addDayHighlight:v15];
        }
        if (v16) {
          [(PLHighlightHierarchy *)self->_entitiesToUpdate addDayGroupHighlight:v16];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v11);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = v7;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        -[PLPhotosHighlightGenerator markHighlightNeedingNewKeyAssetsWithAsset:](self, "markHighlightNeedingNewKeyAssetsWithAsset:", v22, (void)v25);
        long long v23 = [v22 highlightBeingAssets];
        if (v23)
        {
          [v22 setHighlightBeingAssets:0];
          [v22 setHighlightBeingSummaryAssets:0];
          [v22 setHighlightBeingExtendedAssets:0];
          [v23 removeAssetData:v22];
          [(PLHighlightHierarchy *)self->_entitiesToUpdate addDayHighlight:v23];
          [(NSMutableSet *)self->_highlightsWithDeletedAssets addObject:v23];
        }
        uint64_t v24 = [v22 dayGroupHighlightBeingAssets];
        if (v24)
        {
          [v22 setDayGroupHighlightBeingAssets:0];
          [v22 setDayGroupHighlightBeingExtendedAssets:0];
          [v24 removeAssetData:v22];
          [(PLHighlightHierarchy *)self->_entitiesToUpdate addDayGroupHighlight:v24];
          [(NSMutableSet *)self->_highlightsWithDeletedAssets addObject:v24];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v19);
  }
}

- (void)_resetProperties
{
  recentHighlightsDateInterval = self->_recentHighlightsDateInterval;
  self->_recentHighlightsDateInterval = 0;

  id v4 = objc_alloc_init(PLHighlightHierarchy);
  entitiesToUpdate = self->_entitiesToUpdate;
  self->_entitiesToUpdate = v4;

  id v6 = [MEMORY[0x1E4F1CA80] set];
  highlightsNeedingNewKeyAsset = self->_highlightsNeedingNewKeyAsset;
  self->_highlightsNeedingNewKeyAsset = v6;

  uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
  highlightsWithDeletedAssets = self->_highlightsWithDeletedAssets;
  self->_highlightsWithDeletedAssets = v8;

  uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
  upsertedHighlights = self->_upsertedHighlights;
  self->_upsertedHighlights = v10;

  uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
  highlightsToDelete = self->_highlightsToDelete;
  self->_highlightsToDelete = v12;
}

- (PLPhotosHighlightGenerator)initWithDataManager:(id)a3 frequentLocationManager:(id)a4 localCreationDateCreator:(id)a5 dateRangeTitleGenerator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PLPhotosHighlightGenerator;
  long long v14 = [(PLPhotosHighlightGenerator *)&v16 init];
  if (PLPlatformHighlightsSupported())
  {
    if (v14)
    {
      objc_storeWeak((id *)&v14->_dataManager, v10);
      objc_storeStrong((id *)&v14->_frequentLocationManager, a4);
      objc_storeStrong((id *)&v14->_localCreationDateCreator, a5);
      objc_storeStrong((id *)&v14->_dateRangeTitleGenerator, a6);
      [(PLPhotosHighlightGenerator *)v14 _resetProperties];
    }
  }
  else
  {

    long long v14 = 0;
  }

  return v14;
}

+ (id)userDefaults
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobileslideshow"];
  return v2;
}

+ (void)setLastRecentHighlightUpdateDate:(id)a3
{
  id v4 = a3;
  id v5 = [a1 userDefaults];
  [v5 setObject:v4 forKey:@"lastRecentHighlightUpdateDate"];
}

+ (id)lastRecentHighlightUpdateDate
{
  v2 = [a1 userDefaults];
  v3 = [v2 objectForKey:@"lastRecentHighlightUpdateDate"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  id v6 = v5;

  return v6;
}

+ (void)setLastHighlightTitlesUpdateDay:(id)a3
{
  id v4 = a3;
  id v5 = [a1 userDefaults];
  [v5 setObject:v4 forKey:@"lastHighlightTitlesUpdateDate"];
}

+ (id)lastHighlightTitlesUpdateDay
{
  v2 = [a1 userDefaults];
  v3 = [v2 objectForKey:@"lastHighlightTitlesUpdateDate"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
  }
  id v6 = v5;

  return v6;
}

+ (void)_updateTitlesForHighlight:(id)a3 dateRangeTitleGenerator:(id)a4 options:(unint64_t)a5 filter:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  id v19 = a3;
  id v9 = a4;
  if (v6)
  {
    if (v6 == 2)
    {
      uint64_t v10 = [v19 titleShared];
    }
    else
    {
      if (v6 != 1)
      {
        id v12 = 0;
        id v11 = v19;
        goto LABEL_9;
      }
      uint64_t v10 = [v19 title];
    }
  }
  else
  {
    uint64_t v10 = [v19 titleMixed];
  }
  id v11 = v19;
  id v12 = (void *)v10;
LABEL_9:
  id v13 = +[PLPhotosHighlightTitleGenerator titleForHighlight:v11 filter:v6 dateRangeTitleGenerator:v9 options:a5];
  if (_os_feature_enabled_impl())
  {
    unsigned int v14 = [v19 type];
    if (v14 <= 4 && ((1 << v14) & 0x16) != 0)
    {
      uint64_t v15 = +[PLPhotosHighlightTitleGenerator titleForHighlight:v19 filter:v6 dateRangeTitleGenerator:v9 options:a5 | 0x10];
      if ([(__CFString *)v13 length] || [(__CFString *)v15 length])
      {
        if (v13) {
          objc_super v16 = v13;
        }
        else {
          objc_super v16 = &stru_1EEB2EB80;
        }
        if (v15) {
          id v17 = v15;
        }
        else {
          id v17 = &stru_1EEB2EB80;
        }
        uint64_t v18 = [NSString stringWithFormat:@"%@%@%@", v16, @"", v17];
      }
      else
      {
        uint64_t v18 = 0;
      }

      id v13 = (__CFString *)v18;
    }
  }
  if (([v12 isEqualToString:v13] & 1) == 0
    && ([v12 length] || -[__CFString length](v13, "length")))
  {
    if (v6)
    {
      if (v6 == 2)
      {
        [v19 setTitleShared:v13];
      }
      else if (v6 == 1)
      {
        [v19 setTitle:v13];
      }
    }
    else
    {
      [v19 setTitleMixed:v13];
    }
  }
}

+ (void)updateTitlesForHighlight:(id)a3 dateRangeTitleGenerator:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  [a1 _updateTitlesForHighlight:v9 dateRangeTitleGenerator:v8 options:a5 filter:1];
  [a1 _updateTitlesForHighlight:v9 dateRangeTitleGenerator:v8 options:a5 filter:2];
  [a1 _updateTitlesForHighlight:v9 dateRangeTitleGenerator:v8 options:a5 filter:0];
}

- (void)_updateDayGroupHighlight:(id)a3 withNewAssets:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA80] setWithSet:v7];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __79__PLPhotosHighlightGenerator_Curation___updateDayGroupHighlight_withNewAssets___block_invoke;
  v23[3] = &unk_1E586DC00;
  v23[4] = self;
  id v9 = [MEMORY[0x1E4F28F60] predicateWithBlock:v23];
  [v8 filterUsingPredicate:v9];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        -[PLPhotosHighlightGenerator markHighlightNeedingNewKeyAssetsWithAsset:](self, "markHighlightNeedingNewKeyAssetsWithAsset:", v15, (void)v19);
        char v16 = [v8 containsObject:v15];
        id v17 = v6;
        if ((v16 & 1) == 0)
        {
          uint64_t v18 = objc_msgSend(v15, "dayGroupHighlightBeingExtendedAssets", v6);

          if (!v18) {
            continue;
          }
          id v17 = 0;
        }
        [v15 setDayGroupHighlightBeingExtendedAssets:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v12);
  }
}

uint64_t __79__PLPhotosHighlightGenerator_Curation___updateDayGroupHighlight_withNewAssets___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [(id)objc_opt_class() assetEligibleForCuration:v2];

  return v3;
}

- (void)_updateDayHighlight:(id)a3 withNewAssets:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA80] setWithSet:v7];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __74__PLPhotosHighlightGenerator_Curation___updateDayHighlight_withNewAssets___block_invoke;
  v25[3] = &unk_1E586DC00;
  v25[4] = self;
  id v9 = [MEMORY[0x1E4F28F60] predicateWithBlock:v25];
  [v8 filterUsingPredicate:v9];

  int v10 = [v6 type];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    unsigned int v14 = v10 - 7;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v11);
        }
        id v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (v14 > 0xFFFFFFFD) {
          -[PLPhotosHighlightGenerator markHighlightNeedingNewKeyAssetsWithAsset:](self, "markHighlightNeedingNewKeyAssetsWithAsset:", v17, (void)v21);
        }
        else {
          [(PLPhotosHighlightGenerator *)self resetDayGroupCurationForAsset:v17];
        }
        if (objc_msgSend(v8, "containsObject:", v17, (void)v21))
        {
          [v17 setHighlightBeingSummaryAssets:v6];
          id v18 = v6;
LABEL_15:
          [v17 setHighlightBeingExtendedAssets:v18];
          continue;
        }
        long long v19 = [v17 highlightBeingSummaryAssets];

        if (v19) {
          [v17 setHighlightBeingSummaryAssets:0];
        }
        long long v20 = [v17 highlightBeingExtendedAssets];

        if (v20)
        {
          id v18 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v13);
  }
}

uint64_t __74__PLPhotosHighlightGenerator_Curation___updateDayHighlight_withNewAssets___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [(id)objc_opt_class() assetEligibleForCuration:v2];

  return v3;
}

- (void)markHighlightNeedingNewKeyAssetsWithAsset:(id)a3
{
  id v20 = a3;
  id v4 = [v20 highlightBeingKeyAssetPrivate];
  id v5 = [v20 dayGroupHighlightBeingKeyAssetPrivate];
  id v6 = [v20 monthHighlightBeingKeyAssetPrivate];
  id v7 = [v20 yearHighlightBeingKeyAssetPrivate];
  id v8 = [v20 highlightBeingKeyAssetShared];
  id v9 = [v20 dayGroupHighlightBeingKeyAssetShared];
  int v10 = [v20 monthHighlightBeingKeyAssetShared];
  id v11 = [v20 yearHighlightBeingKeyAssetShared];
  if (v4)
  {
    [v20 setHighlightBeingKeyAssetPrivate:0];
    uint64_t v12 = [(PLPhotosHighlightGenerator *)self highlightsNeedingNewKeyAsset];
    [v12 addObject:v4];
  }
  if (v5)
  {
    [v20 setDayGroupHighlightBeingKeyAssetPrivate:0];
    uint64_t v13 = [(PLPhotosHighlightGenerator *)self highlightsNeedingNewKeyAsset];
    [v13 addObject:v5];
  }
  if (v6)
  {
    [v20 setMonthHighlightBeingKeyAssetPrivate:0];
    unsigned int v14 = [(PLPhotosHighlightGenerator *)self highlightsNeedingNewKeyAsset];
    [v14 addObject:v6];
  }
  if (v7)
  {
    [v20 setYearHighlightBeingKeyAssetPrivate:0];
    uint64_t v15 = [(PLPhotosHighlightGenerator *)self highlightsNeedingNewKeyAsset];
    [v15 addObject:v7];
  }
  if (v8)
  {
    [v20 setHighlightBeingKeyAssetShared:0];
    char v16 = [(PLPhotosHighlightGenerator *)self highlightsNeedingNewKeyAsset];
    [v16 addObject:v8];
  }
  if (v9)
  {
    [v20 setDayGroupHighlightBeingKeyAssetShared:0];
    id v17 = [(PLPhotosHighlightGenerator *)self highlightsNeedingNewKeyAsset];
    [v17 addObject:v9];
  }
  if (v10)
  {
    [v20 setMonthHighlightBeingKeyAssetShared:0];
    id v18 = [(PLPhotosHighlightGenerator *)self highlightsNeedingNewKeyAsset];
    [v18 addObject:v10];
  }
  if (v11)
  {
    [v20 setYearHighlightBeingKeyAssetShared:0];
    long long v19 = [(PLPhotosHighlightGenerator *)self highlightsNeedingNewKeyAsset];
    [v19 addObject:v11];
  }
}

- (BOOL)_highlightTypeSupportsVisibilityStateDayOnly:(unsigned __int16)a3
{
  return (a3 < 8u) & (0xA9u >> a3);
}

- (BOOL)_highlightShouldNotBeVisible:(id)a3 sharingConsideration:(int64_t)a4
{
  id v5 = a3;
  [v5 promotionScore];
  if (v6 != 0.2)
  {
    int v8 = [v5 kind];
    if (v8 == 3)
    {
      switch(a4)
      {
        case 2:
          int v9 = [v5 dayGroupExtendedAssetsCount];
          goto LABEL_18;
        case 1:
          int v9 = [v5 dayGroupExtendedAssetsCountShared];
          goto LABEL_18;
        case 0:
          int v9 = [v5 dayGroupExtendedAssetsCountPrivate];
          goto LABEL_18;
      }
    }
    else if (!v8)
    {
      switch(a4)
      {
        case 2:
          int v9 = [v5 extendedCount];
          goto LABEL_18;
        case 1:
          int v9 = [v5 extendedCountShared];
          goto LABEL_18;
        case 0:
          int v9 = [v5 extendedCountPrivate];
LABEL_18:
          BOOL v7 = v9 == 0;
          goto LABEL_19;
      }
    }
    BOOL v7 = 0;
    goto LABEL_19;
  }
  BOOL v7 = 1;
LABEL_19:

  return v7;
}

- (BOOL)_setVisibilityStateForHighlight:(id)a3 shouldForceUpdate:(BOOL)a4 sharingConsideration:(int64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if ((unint64_t)a5 > 2) {
    int v9 = 0;
  }
  else {
    int v9 = off_1E58686A0[a5];
  }
  int v10 = v9;
  unsigned int v11 = [v8 type];
  uint64_t v12 = [v8 valueForKey:v10];
  int v13 = [v12 unsignedShortValue];

  int v14 = [v8 sharingComposition];
  if (a5 == 2 || v14 == 2 || !a5 && !v14 || (unsigned __int16 v15 = 0, a5 == 1) && v14 == 1)
  {
    if ([(PLPhotosHighlightGenerator *)self _highlightShouldNotBeVisible:v8 sharingConsideration:a5])
    {
      unsigned __int16 v15 = 0;
    }
    else
    {
      BOOL v19 = [v8 category] == 1 || v11 == 5;
      if (v19) {
        unsigned __int16 v15 = 1;
      }
      else {
        unsigned __int16 v15 = v13;
      }
      if (!v19 && v6)
      {
        if (v11 > 7) {
          goto LABEL_13;
        }
        if (((1 << v11) & 0x16) != 0)
        {
          if (_os_feature_enabled_impl()) {
            unsigned __int16 v15 = 1;
          }
          else {
            unsigned __int16 v15 = 2;
          }
        }
        else if (((1 << v11) & 0x89) != 0)
        {
          _os_feature_enabled_impl();
          unsigned __int16 v15 = 1;
        }
        else
        {
          unsigned __int16 v15 = 0;
          BOOL v16 = 0;
          if (v11 != 6) {
            goto LABEL_15;
          }
        }
      }
    }
  }
  if (v13 != v15)
  {
    id v17 = [NSNumber numberWithUnsignedShort:v15];
    [v8 setValue:v17 forKey:v10];

    BOOL v16 = 1;
    goto LABEL_15;
  }
LABEL_13:
  BOOL v16 = 0;
LABEL_15:

  return v16;
}

- (BOOL)setVisibilityStateForHighlight:(id)a3 shouldForceUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(PLPhotosHighlightGenerator *)self _setVisibilityStateForHighlight:v6 shouldForceUpdate:v4 sharingConsideration:0];
  BOOL v8 = [(PLPhotosHighlightGenerator *)self _setVisibilityStateForHighlight:v6 shouldForceUpdate:v4 sharingConsideration:1];
  LOBYTE(v4) = [(PLPhotosHighlightGenerator *)self _setVisibilityStateForHighlight:v6 shouldForceUpdate:v4 sharingConsideration:2];

  return v7 || v8 || v4;
}

- (BOOL)shouldForceVisibilityStateUpdateForHighlight:(id)a3 highlightCluster:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v10 = 1;
  if ([v6 enrichmentState])
  {
    int v8 = [v6 category];
    if (v8 == [v7 category])
    {
      uint64_t v9 = [v6 type];
      if (v9 == [v7 type]
        && ([v6 visibilityState]
         || ![(PLPhotosHighlightGenerator *)self _highlightTypeSupportsVisibilityStateDayOnly:v9]))
      {
        BOOL v10 = 0;
      }
    }
  }

  return v10;
}

- (void)resetDayGroupCurationForAsset:(id)a3
{
  id v6 = a3;
  [(PLPhotosHighlightGenerator *)self markHighlightNeedingNewKeyAssetsWithAsset:v6];
  BOOL v4 = [v6 dayGroupHighlightBeingAssets];

  if (v4) {
    [v6 setDayGroupHighlightBeingAssets:0];
  }
  id v5 = [v6 dayGroupHighlightBeingExtendedAssets];

  if (v5) {
    [v6 setDayGroupHighlightBeingExtendedAssets:0];
  }
}

- (void)updateCurationForHighlight:(id)a3 withAssetsBelongingToCuration:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 kind];
  if ((v8 - 1) < 2)
  {
    BOOL v10 = PLMomentsGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unsigned int v11 = [v6 uuid];
      int v23 = 138412290;
      long long v24 = v11;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Trying to update curation on a non-supported highlight kind: %@", (uint8_t *)&v23, 0xCu);
    }
    goto LABEL_8;
  }
  if (v8 == 3)
  {
    [(PLPhotosHighlightGenerator *)self _updateDayGroupHighlight:v6 withNewAssets:v7];
    uint64_t v9 = [v6 dayGroupExtendedAssets];
    goto LABEL_10;
  }
  if (v8)
  {
LABEL_8:
    uint64_t v12 = 0;
    goto LABEL_14;
  }
  [(PLPhotosHighlightGenerator *)self _updateDayHighlight:v6 withNewAssets:v7];
  uint64_t v9 = [v6 extendedAssets];
LABEL_10:
  int v13 = v9;
  if (v9)
  {
    id v14 = v9;
  }
  else
  {
    id v14 = [MEMORY[0x1E4F1CAD0] set];
  }
  uint64_t v12 = v14;

LABEL_14:
  if ([v12 count])
  {
    [v6 promotionScore];
    if (v15 < 0.3) {
      objc_msgSend(v6, "setPromotionScore:");
    }
    int v16 = [v6 sharingComposition];
    switch(v16)
    {
      case 0:
        int v17 = 1;
LABEL_23:
        id v18 = [v6 keyAssetForKindPrivate];
        if (([v6 missingKeyAssetForKindPrivate] & 1) != 0
          || ![v12 containsObject:v18])
        {
          goto LABEL_31;
        }
        int v19 = [(id)objc_opt_class() assetEligibleForCuration:v18];
        char v20 = v19;
        int v21 = v19 ^ 1;

        if ((v17 | v21)) {
          goto LABEL_29;
        }
LABEL_26:
        id v18 = [v6 keyAssetForKindShared];
        if (([v6 missingKeyAssetForKindShared] & 1) == 0
          && [v12 containsObject:v18])
        {
          char v20 = [(id)objc_opt_class() assetEligibleForCuration:v18];

LABEL_29:
          if (v20) {
            break;
          }
          goto LABEL_32;
        }
LABEL_31:

LABEL_32:
        long long v22 = [(PLPhotosHighlightGenerator *)self highlightsNeedingNewKeyAsset];
        [v22 addObject:v6];

        break;
      case 1:
        goto LABEL_26;
      case 2:
        int v17 = 0;
        goto LABEL_23;
    }
  }
  else
  {
    [v6 setPromotionScore:0.2];
  }
}

+ (id)_bestAssetInAssets:(id)a3 fallback:(BOOL)a4
{
  BOOL v4 = a4;
  v41[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
  v41[0] = v7;
  int v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v41[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  BOOL v10 = [v6 sortedArrayUsingDescriptors:v9];

  unint64_t v11 = [v6 count];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = 0;
    if (v11 >= 6) {
      uint64_t v16 = -1;
    }
    else {
      uint64_t v16 = 4;
    }
    uint64_t v17 = *(void *)v36;
    double v18 = 0.0;
LABEL_6:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v36 != v17) {
        objc_enumerationMutation(v12);
      }
      char v20 = *(void **)(*((void *)&v35 + 1) + 8 * v19);
      if ([a1 assetEligibleForCuration:v20])
      {
        [a1 curationScoreForAsset:v20];
        double v22 = v21;
        if (!v15 || v18 < v21)
        {
          id v23 = v20;

          double v18 = v22;
          id v15 = v23;
        }
        if (!--v16) {
          break;
        }
      }
      if (v14 == ++v19)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v14) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
  else
  {
    id v15 = 0;
  }

  if (!v15 && v4)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v24 = v12;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v32 != v27) {
            objc_enumerationMutation(v24);
          }
          long long v29 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if (objc_msgSend(v29, "visibilityStateIsEqualToState:", 0, (void)v31))
          {
            id v15 = v29;
            goto LABEL_30;
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }
    id v15 = 0;
LABEL_30:
  }
  return v15;
}

+ (BOOL)assetEligibleForCuration:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    BOOL v6 = 0;
    if ([v4 visibilityStateIsEqualToState:0])
    {
      [a1 curationScoreForAsset:v5];
      BOOL v6 = v7 >= 0.5;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (double)curationScoreForAsset:(id)a3
{
  id v3 = a3;
  [v3 curationScore];
  double v5 = v4;
  double v6 = 0.25;
  if ([v3 kindSubtype] != 10 && (objc_msgSend(v3, "isScreenRecording") & 1) == 0)
  {
    if (fabs(v5) <= 2.22044605e-16) {
      double v6 = 0.5;
    }
    else {
      double v6 = v5;
    }
  }

  return v6;
}

+ (id)_provisionalKeyAssetForMonthAndYearHighlight:(id)a3 sharingConsideration:(int64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v26 = [MEMORY[0x1E4F1CA80] set];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  double v6 = [v5 childPhotosHighlights];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v7) {
    goto LABEL_31;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v30;
  double v10 = 0.0;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v30 != v9) {
        objc_enumerationMutation(v6);
      }
      id v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
      if ((unint64_t)a4 > 2) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = off_1E58686A0[a4];
      }
      uint64_t v14 = v13;
      id v15 = [v12 valueForKey:v14];
      __int16 v16 = [v15 unsignedShortValue];

      int v17 = [v5 kind];
      if ((v17 - 1) < 2)
      {
        if ((v16 & 0xFFFE) != 2) {
          goto LABEL_19;
        }
        switch(a4)
        {
          case 2:
            char v20 = [MEMORY[0x1E4F28B00] currentHandler];
            [v20 handleFailureInMethod:a2 object:a1 file:@"PLPhotosHighlightGenerator+Curation.m" lineNumber:621 description:@"Invalid sharing consideration for provisional key asset."];

            break;
          case 1:
            uint64_t v19 = [v12 keyAssetForKindShared];
            goto LABEL_24;
          case 0:
            uint64_t v19 = [v12 keyAssetForKindPrivate];
LABEL_24:
            double v18 = (void *)v19;
            if (v19)
            {
              [v12 promotionScore];
              double v22 = v21;
              if (![v26 count] || v22 >= v10)
              {
                if (v22 > v10) {
                  [v26 removeAllObjects];
                }
                [v26 addObject:v18];
                double v10 = v22;
              }
            }
            goto LABEL_13;
        }
        double v18 = 0;
        goto LABEL_13;
      }
      if (!v17 || v17 == 3)
      {
        double v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:a2 object:a1 file:@"PLPhotosHighlightGenerator+Curation.m" lineNumber:604 description:@"Invalid kind for provisional key asset."];
LABEL_13:
      }
LABEL_19:

      ++v11;
    }
    while (v8 != v11);
    uint64_t v23 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
    uint64_t v8 = v23;
  }
  while (v23);
LABEL_31:

  if ((unint64_t)[v26 count] < 2) {
    [v26 anyObject];
  }
  else {
  id v24 = [a1 _bestAssetInAssets:v26 fallback:1];
  }

  return v24;
}

+ (id)_provisionalKeyAssetForDayGroupHighlight:(id)a3 sharingConsideration:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v23 = v7;
  uint64_t v9 = [v7 childDayGroupPhotosHighlights];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v10) {
    goto LABEL_21;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v25;
  double v13 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v25 != v12) {
        objc_enumerationMutation(v9);
      }
      if (a4 == 2)
      {
        char v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2 object:a1 file:@"PLPhotosHighlightGenerator+Curation.m" lineNumber:553 description:@"Invalid sharing consideration for provisional key asset."];

LABEL_18:
        int v17 = 0;
        goto LABEL_19;
      }
      id v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      if (a4 == 1)
      {
        uint64_t v16 = [*(id *)(*((void *)&v24 + 1) + 8 * i) keyAssetForKindShared];
      }
      else
      {
        if (a4) {
          goto LABEL_18;
        }
        uint64_t v16 = [*(id *)(*((void *)&v24 + 1) + 8 * i) keyAssetForKindPrivate];
      }
      int v17 = (void *)v16;
      if (v16)
      {
        [v15 promotionScore];
        double v19 = v18;
        if (![v8 count] || v19 >= v13)
        {
          if (v19 > v13) {
            [v8 removeAllObjects];
          }
          [v8 addObject:v17];
          double v13 = v19;
        }
      }
LABEL_19:
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  }
  while (v11);
LABEL_21:

  if ((unint64_t)[v8 count] < 2) {
    [v8 anyObject];
  }
  else {
  double v21 = [a1 _bestAssetInAssets:v8 fallback:1];
  }

  return v21;
}

+ (id)_provisionalKeyAssetForDayHighlight:(id)a3 sharingConsideration:(int64_t)a4
{
  id v7 = a3;
  int v8 = [v7 sharingComposition];
  if (a4 == 2 || v8 == 2)
  {
    switch(a4)
    {
      case 2:
        uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
        [v12 handleFailureInMethod:a2 object:a1 file:@"PLPhotosHighlightGenerator+Curation.m" lineNumber:527 description:@"Invalid sharing consideration for provisional key asset."];

        break;
      case 1:
LABEL_12:
        uint64_t v10 = [v7 extendedAssetsShared];
        goto LABEL_13;
      case 0:
LABEL_11:
        uint64_t v10 = [v7 extendedAssetsPrivate];
LABEL_13:
        uint64_t v11 = (void *)v10;
LABEL_16:
        uint64_t v9 = [a1 _bestAssetInAssets:v11 fallback:0];

        goto LABEL_17;
    }
    uint64_t v11 = 0;
    goto LABEL_16;
  }
  if (!a4 && !v8) {
    goto LABEL_11;
  }
  uint64_t v9 = 0;
  if (a4 == 1 && v8 == 1) {
    goto LABEL_12;
  }
LABEL_17:

  return v9;
}

+ (id)provisionalKeyAssetForHighlight:(id)a3 sharingConsideration:(int64_t)a4
{
  id v6 = a3;
  int v7 = [v6 kind];
  if ((v7 - 1) < 2)
  {
    uint64_t v8 = [a1 _provisionalKeyAssetForMonthAndYearHighlight:v6 sharingConsideration:a4];
    goto LABEL_7;
  }
  if (v7 == 3)
  {
    uint64_t v8 = [a1 _provisionalKeyAssetForDayGroupHighlight:v6 sharingConsideration:a4];
    goto LABEL_7;
  }
  if (!v7)
  {
    uint64_t v8 = [a1 _provisionalKeyAssetForDayHighlight:v6 sharingConsideration:a4];
LABEL_7:
    uint64_t v9 = (void *)v8;
    goto LABEL_9;
  }
  uint64_t v9 = 0;
LABEL_9:

  return v9;
}

+ (void)updateKeyAssetForHighlights:(id)a3
{
  v39[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38[0] = &unk_1EEBEEE68;
  v38[1] = &unk_1EEBEEE98;
  v39[0] = &unk_1EEBEEE80;
  v39[1] = &unk_1EEBEEEB0;
  v38[2] = &unk_1EEBEEEC8;
  v38[3] = &unk_1EEBEEEF8;
  v39[2] = &unk_1EEBEEEE0;
  v39[3] = &unk_1EEBEEF10;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:4];
  long long v25 = v4;
  id v6 = [v4 allObjects];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __68__PLPhotosHighlightGenerator_Curation__updateKeyAssetForHighlights___block_invoke;
  v33[3] = &unk_1E586BE78;
  id v24 = v5;
  id v34 = v24;
  int v7 = [v6 sortedArrayUsingComparator:v33];

  uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    uint64_t v27 = *(void *)v30;
    id v28 = a1;
    id v26 = v9;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (([v8 containsObject:v14] & 1) == 0 && (objc_msgSend(v14, "isDeleted") & 1) == 0)
        {
          id v15 = [v14 keyAssetForKindPrivate];
          uint64_t v16 = [v15 uniqueObjectID];

          int v17 = [v14 keyAssetForKindShared];
          double v18 = [v17 uniqueObjectID];

          uint64_t v19 = [(id)objc_opt_class() provisionalKeyAssetForHighlight:v14 sharingConsideration:0];
          uint64_t v20 = [(id)objc_opt_class() provisionalKeyAssetForHighlight:v14 sharingConsideration:1];
          [v14 setKeyAssetForKindPrivate:v19];
          [v14 setKeyAssetForKindShared:v20];
          if (v19 | v20)
          {
            [(id)objc_opt_class() _updateMixedSharingCompositionKeyAssetRelationshipForHighlight:v14];
            double v21 = [v14 parentPhotosHighlight];
            if ([a1 _shouldUpdateKeyAssetForParentHighlight:v21 withPrivateKeyAssetObjectID:v16 andSharedKeyAssetObjectID:v18])objc_msgSend(a1, "_updateParentHighlightNeedingNewKeyAsset:withProvisionalKeyAssetPrivate:andProvisionalKeyAssetShared:updatedHighlights:", v21, v19, v20, v8); {
            double v22 = [v14 parentDayGroupPhotosHighlight];
            }
            if ([a1 _shouldUpdateKeyAssetForParentHighlight:v22 withPrivateKeyAssetObjectID:v16 andSharedKeyAssetObjectID:v18])objc_msgSend(v28, "_updateParentHighlightNeedingNewKeyAsset:withProvisionalKeyAssetPrivate:andProvisionalKeyAssetShared:updatedHighlights:", v22, v19, v20, v8); {

            }
            a1 = v28;
            id v9 = v26;
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = [v14 uuid];
            *(_DWORD *)buf = 138412290;
            long long v36 = v23;
            _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "No provisonal key asset found for highlight: %@", buf, 0xCu);

            a1 = v28;
          }

          uint64_t v12 = v27;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v11);
  }
}

uint64_t __68__PLPhotosHighlightGenerator_Curation__updateKeyAssetForHighlights___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 kind];
  uint64_t v8 = [v6 kind];
  if (v7 == v8)
  {
    id v9 = [v5 uuid];
    uint64_t v10 = [v6 uuid];
    uint64_t v11 = [v9 compare:v10];
  }
  else
  {
    uint64_t v12 = v8;
    double v13 = *(void **)(a1 + 32);
    id v9 = [NSNumber numberWithUnsignedShort:v7];
    uint64_t v10 = [v13 objectForKeyedSubscript:v9];
    uint64_t v14 = *(void **)(a1 + 32);
    id v15 = [NSNumber numberWithUnsignedShort:v12];
    uint64_t v16 = [v14 objectForKeyedSubscript:v15];
    uint64_t v11 = [v10 compare:v16];
  }
  return v11;
}

+ (void)_updateParentHighlightNeedingNewKeyAsset:(id)a3 withProvisionalKeyAssetPrivate:(id)a4 andProvisionalKeyAssetShared:(id)a5 updatedHighlights:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    id v15 = 0;
    if (v12) {
      goto LABEL_3;
    }
LABEL_5:
    int v17 = 0;
    goto LABEL_6;
  }
  uint64_t v14 = [v10 keyAssetForKindPrivate];
  id v15 = [v14 uniqueObjectID];

  [v10 setKeyAssetForKindPrivate:v11];
  if (!v12) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v16 = [v10 keyAssetForKindShared];
  int v17 = [v16 uniqueObjectID];

  [v10 setKeyAssetForKindShared:v12];
LABEL_6:
  [(id)objc_opt_class() _updateMixedSharingCompositionKeyAssetRelationshipForHighlight:v10];
  if (([v10 missingKeyAssetForKindPrivate] & 1) == 0
    && ([v10 missingKeyAssetForKindShared] & 1) == 0)
  {
    [v13 addObject:v10];
  }
  double v18 = [v10 parentPhotosHighlight];
  if ([v18 isEqual:v10])
  {
    uint64_t v19 = PLMomentsGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [v10 objectID];
      int v21 = 138543362;
      double v22 = v20;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Ignoring call to update parent highlight (parent is set to self) for: %{public}@", (uint8_t *)&v21, 0xCu);
    }
  }
  else if ([a1 _shouldUpdateKeyAssetForParentHighlight:v18 withPrivateKeyAssetObjectID:v15 andSharedKeyAssetObjectID:v17])
  {
    [a1 _updateParentHighlightNeedingNewKeyAsset:v18 withProvisionalKeyAssetPrivate:v11 andProvisionalKeyAssetShared:v12 updatedHighlights:v13];
  }
}

+ (void)_updateMixedSharingCompositionKeyAssetRelationshipForHighlight:(id)a3
{
  id v17 = a3;
  uint64_t v4 = [v17 keyAssetForKindPrivate];
  if (v4
    && (id v5 = (void *)v4,
        [v17 keyAssetForKindShared],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = [v17 keyAssetForKindShared];
    id v9 = [v17 keyAssetForKindPrivate];
    id v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, 0);
    id v11 = [a1 _bestAssetInAssets:v10 fallback:1];

    if ([v11 hasLibraryScope]) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 1;
    }
    [v17 setMixedSharingCompositionKeyAssetRelationship:v12];
  }
  else
  {
    id v13 = [v17 keyAssetForKindShared];

    if (v13)
    {
      uint64_t v14 = v17;
      uint64_t v15 = 2;
    }
    else
    {
      uint64_t v16 = [v17 keyAssetForKindPrivate];

      uint64_t v14 = v17;
      uint64_t v15 = v16 != 0;
    }
    [v14 setMixedSharingCompositionKeyAssetRelationship:v15];
  }
}

+ (BOOL)_shouldUpdateKeyAssetForParentHighlight:(id)a3 withPrivateKeyAssetObjectID:(id)a4 andSharedKeyAssetObjectID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    if (v8)
    {
      uint64_t v10 = [v7 keyAssetForKindPrivate];
      id v11 = [(id)v10 uniqueObjectID];

      LOBYTE(v10) = [v11 isEqual:v8];
      if (v10) {
        goto LABEL_7;
      }
    }
  }
  if (v7
    && v9
    && ([v7 keyAssetForKindShared],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        [(id)v12 uniqueObjectID],
        id v13 = objc_claimAutoreleasedReturnValue(),
        (id)v12,
        LOBYTE(v12) = [v13 isEqual:v9],
        v13,
        (v12 & 1) != 0))
  {
LABEL_7:
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)resetPreviousRecentHighlightCurationForHighlight:(id)a3
{
  id v3 = a3;
  [v3 setKeyAssetForKindPrivate:0];
  [v3 setSummaryAssets:0];
  [v3 setExtendedAssets:0];
}

- (void)updateRecentHighlightCurationForHighlight:(id)a3
{
  id v4 = a3;
  id v5 = [v4 assets];
  if ([v5 count])
  {
    id v6 = [MEMORY[0x1E4F1CA80] setWithSet:v5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__PLPhotosHighlightGenerator_Recent__updateRecentHighlightCurationForHighlight___block_invoke;
    v8[3] = &unk_1E586DC00;
    v8[4] = self;
    id v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:v8];
    [v6 filterUsingPredicate:v7];

    [v4 setSummaryAssets:v6];
    [v4 setExtendedAssets:v6];
    [v4 setPromotionScore:0.3];
  }
}

uint64_t __80__PLPhotosHighlightGenerator_Recent__updateRecentHighlightCurationForHighlight___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [(id)objc_opt_class() assetEligibleForRecents:v2];

  return v3;
}

- (id)fetchAllOngoingTripDayGroupHighlights
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"self.type == %lu", 4);
  id v4 = [(PLPhotosHighlightGenerator *)self dataManager];
  uint64_t v8 = 0;
  id v5 = [v4 allPhotosHighlightsOfKind:3 withPredicate:v3 error:&v8];

  id v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];

  return v6;
}

- (id)fetchAllRecentHighlights
{
  v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLPhotosHighlightGenerator *)self recentHighlightsDateInterval];
  id v4 = [v3 startDate];

  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self.startDate >= %@", v4];
  id v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"self.category == %lu", 1);
  id v7 = (void *)MEMORY[0x1E4F28BA0];
  v15[0] = v6;
  v15[1] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  id v9 = [v7 orPredicateWithSubpredicates:v8];

  uint64_t v10 = [(PLPhotosHighlightGenerator *)self dataManager];
  uint64_t v14 = 0;
  id v11 = [v10 allPhotosHighlightsOfKind:0 withPredicate:v9 error:&v14];

  uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];

  return v12;
}

+ (BOOL)assetEligibleForRecents:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
LABEL_4:
    LOBYTE(v5) = 0;
    goto LABEL_6;
  }
  LOBYTE(v5) = 0;
  if ([v3 visibilityStateIsEqualToState:0])
  {
    if ([v4 kindSubtype] != 10)
    {
      int v5 = [v4 isScreenRecording] ^ 1;
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:

  return v5;
}

- (void)_consumeHighlightItemListChanges:(id)a3 forKind:(unsigned __int16)a4 rule:(id)a5 resultBlock:(id)a6
{
  unsigned int v70 = a4;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v72 = a5;
  uint64_t v66 = (void (**)(id, void *, void *))a6;
  id v71 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v87 objects:v101 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v88;
    uint64_t v68 = *(void *)v88;
    long long v69 = v10;
    id v67 = v11;
    do
    {
      uint64_t v15 = 0;
      uint64_t v74 = v13;
      do
      {
        if (*(void *)v88 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v87 + 1) + 8 * v15);
        if ([v16 isCandidateForReuse])
        {
          id v17 = [v16 parentHighlightItem];
          double v18 = PLMomentsGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            [v17 uuid];
            uint64_t v20 = v19 = v10;
            [v17 startDate];
            v22 = id v21 = v11;
            uint64_t v23 = [v17 endDate];
            id v24 = v16;
            uint64_t v25 = v15;
            id v26 = (void *)v23;
            *(_DWORD *)buf = 138413058;
            uint32_t v94 = v24;
            __int16 v95 = 2112;
            long long v96 = v20;
            __int16 v97 = 2112;
            float v98 = v22;
            __int16 v99 = 2112;
            uint64_t v100 = v23;
            _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, "[HighlightsGeneration] Need to delete: %@ [%@]-(%@-%@)", buf, 0x2Au);

            uint64_t v15 = v25;
            id v11 = v21;

            uint64_t v10 = v19;
            uint64_t v13 = v74;
          }

          [v10 addObject:v17];
          goto LABEL_10;
        }
        if (([v16 hasChanges] & 1) != 0 || objc_msgSend(v16, "isNewList"))
        {
          uint64_t v27 = [v16 sortedChildHighlightItems];
          uint64_t v28 = [v27 count];

          if (v28)
          {
            if ([v16 isNewList])
            {
              long long v29 = [(PLPhotosHighlightGenerator *)self dataManager];
              long long v30 = [v29 insertNewPhotosHighlight];

              [v30 setPromotionScore:0.3];
            }
            else
            {
              long long v30 = [v16 parentHighlightItem];
            }
            long long v31 = [(PLPhotosHighlightGenerator *)self dateRangeTitleGenerator];
            v85[0] = MEMORY[0x1E4F143A8];
            v85[1] = 3221225472;
            v85[2] = __104__PLPhotosHighlightGenerator_MonthsAndYears___consumeHighlightItemListChanges_forKind_rule_resultBlock___block_invoke;
            v85[3] = &unk_1E5872870;
            id v32 = v30;
            id v86 = v32;
            [v72 titlesForHighlightItemList:v16 dateRangeTitleGenerator:v31 resultBlock:v85];

            [v32 setKind:v70];
            long long v33 = [v16 startDate];
            [v32 setStartDate:v33];

            id v34 = [v16 endDate];
            [v32 setEndDate:v34];

            long long v35 = [v16 addedHighlightItems];
            if ([v35 count])
            {

              goto LABEL_22;
            }
            long long v36 = [v16 removedHighlightItems];
            uint64_t v37 = [v36 count];

            if (v37)
            {
LABEL_22:
              uint64_t v73 = v15;
              long long v83 = 0u;
              long long v84 = 0u;
              long long v81 = 0u;
              long long v82 = 0u;
              long long v75 = v16;
              long long v38 = [v16 sortedChildHighlightItems];
              uint64_t v39 = [v38 countByEnumeratingWithState:&v81 objects:v92 count:16];
              if (v39)
              {
                uint64_t v40 = v39;
                uint64_t v41 = *(void *)v82;
                do
                {
                  for (uint64_t i = 0; i != v40; ++i)
                  {
                    if (*(void *)v82 != v41) {
                      objc_enumerationMutation(v38);
                    }
                    long long v43 = *(void **)(*((void *)&v81 + 1) + 8 * i);
                    long long v44 = [v43 parentPhotosHighlight];
                    char v45 = [v44 isEqual:v32];

                    if ((v45 & 1) == 0)
                    {
                      id v46 = [v43 keyAssetForKindPrivate];
                      uint64_t v47 = [v46 monthHighlightBeingKeyAssetPrivate];

                      if (v47)
                      {
                        uint64_t v48 = [(PLPhotosHighlightGenerator *)self highlightsNeedingNewKeyAsset];
                        [v48 addObject:v47];
                      }
                      uint64_t v49 = [v43 keyAssetForKindShared];
                      long long v50 = [v49 monthHighlightBeingKeyAssetShared];

                      if (v50)
                      {
                        id v51 = [(PLPhotosHighlightGenerator *)self highlightsNeedingNewKeyAsset];
                        [v51 addObject:v50];
                      }
                      [v43 setParentPhotosHighlight:v32];
                    }
                  }
                  uint64_t v40 = [v38 countByEnumeratingWithState:&v81 objects:v92 count:16];
                }
                while (v40);
              }

              long long v79 = 0u;
              long long v80 = 0u;
              long long v77 = 0u;
              long long v78 = 0u;
              id obj = [v75 removedHighlightItems];
              uint64_t v52 = [obj countByEnumeratingWithState:&v77 objects:v91 count:16];
              if (v52)
              {
                uint64_t v53 = v52;
                uint64_t v54 = *(void *)v78;
                do
                {
                  for (uint64_t j = 0; j != v53; ++j)
                  {
                    if (*(void *)v78 != v54) {
                      objc_enumerationMutation(obj);
                    }
                    id v56 = *(void **)(*((void *)&v77 + 1) + 8 * j);
                    long long v57 = [v56 keyAssetForKindShared];
                    uint64_t v58 = [v32 keyAssetForKindShared];
                    if (v57 == (void *)v58)
                    {
                    }
                    else
                    {
                      long long v59 = (void *)v58;
                      os_signpost_id_t v60 = [v56 keyAssetForKindPrivate];
                      long long v61 = [v32 keyAssetForKindPrivate];

                      if (v60 != v61) {
                        goto LABEL_45;
                      }
                    }
                    long long v62 = [(PLPhotosHighlightGenerator *)self highlightsNeedingNewKeyAsset];
                    [v62 addObject:v32];

LABEL_45:
                    uint64_t v63 = [v56 parentPhotosHighlight];
                    int v64 = [v63 isEqual:v32];

                    if (v64) {
                      [v56 setParentPhotosHighlight:0];
                    }
                  }
                  uint64_t v53 = [obj countByEnumeratingWithState:&v77 objects:v91 count:16];
                }
                while (v53);
              }

              id v11 = v67;
              uint64_t v15 = v73;
              uint64_t v16 = v75;
            }
            if (([v16 isNewList] & 1) != 0
              || ([v32 missingKeyAssetForKindPrivate] & 1) != 0
              || [v32 missingKeyAssetForKindShared])
            {
              uint64_t v65 = [(PLPhotosHighlightGenerator *)self highlightsNeedingNewKeyAsset];
              [v65 addObject:v32];
            }
            [v32 bumpHighlightVersion];
            [v71 addObject:v32];

            uint64_t v14 = v68;
            uint64_t v10 = v69;
            uint64_t v13 = v74;
            goto LABEL_55;
          }
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            id v17 = [v16 parentHighlightItem];
            *(_DWORD *)buf = 138412546;
            uint32_t v94 = v16;
            __int16 v95 = 2112;
            long long v96 = v17;
            _os_log_fault_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Tring to generate a month/year with 0 child: %@ - %@", buf, 0x16u);
LABEL_10:
          }
        }
LABEL_55:
        ++v15;
      }
      while (v15 != v13);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v87 objects:v101 count:16];
    }
    while (v13);
  }

  v66[2](v66, v71, v10);
}

void __104__PLPhotosHighlightGenerator_MonthsAndYears___consumeHighlightItemListChanges_forKind_rule_resultBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setTitle:a2];
  [*(id *)(a1 + 32) setSubtitle:v6];
}

- (void)generateHighlightListForUpdatedHighlights:(id)a3 deletedHighlights:(id)a4
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v58 = a4;
  long long v57 = objc_alloc_init(PLMonthGroupingRule);
  long long v61 = [[PLHighlightItemClusterer alloc] initWithRule:v57];
  uint64_t v123 = 0;
  long long v124 = &v123;
  uint64_t v125 = 0x3032000000;
  long long v126 = __Block_byref_object_copy__102295;
  long long v127 = __Block_byref_object_dispose__102296;
  id v128 = 0;
  uint64_t v117 = 0;
  long long v118 = &v117;
  uint64_t v119 = 0x3032000000;
  long long v120 = __Block_byref_object_copy__102295;
  long long v121 = __Block_byref_object_dispose__102296;
  id v122 = 0;
  uint64_t v52 = v5;
  long long v59 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  id v6 = [(PLPhotosHighlightGenerator *)self dataManager];
  v116[0] = MEMORY[0x1E4F143A8];
  v116[1] = 3221225472;
  v116[2] = __106__PLPhotosHighlightGenerator_MonthsAndYears__generateHighlightListForUpdatedHighlights_deletedHighlights___block_invoke;
  v116[3] = &unk_1E58728C0;
  v116[4] = &v123;
  v116[5] = &v117;
  [(PLHighlightItemClusterer *)v61 restoreExistingHighlightItemListsFromUpdatedHighlightItems:v59 deletedHighlightItems:v58 usingModelReader:v6 progressBlock:0 restoreBlock:v116];

  id v7 = [(id)v118[5] allObjects];
  id v56 = [(PLHighlightItemClusterer *)v61 processHighlightItems:v7 withRestoredHighlightItemLists:v124[5] progressBlock:0];

  uint64_t v110 = 0;
  BOOL v111 = &v110;
  uint64_t v112 = 0x3032000000;
  id v113 = __Block_byref_object_copy__102295;
  uint64_t v114 = __Block_byref_object_dispose__102296;
  id v115 = 0;
  uint64_t v104 = 0;
  long long v105 = &v104;
  uint64_t v106 = 0x3032000000;
  uint64_t v107 = __Block_byref_object_copy__102295;
  long long v108 = __Block_byref_object_dispose__102296;
  id v109 = 0;
  v103[0] = MEMORY[0x1E4F143A8];
  v103[1] = 3221225472;
  v103[2] = __106__PLPhotosHighlightGenerator_MonthsAndYears__generateHighlightListForUpdatedHighlights_deletedHighlights___block_invoke_2;
  v103[3] = &unk_1E58728C0;
  v103[4] = &v110;
  v103[5] = &v104;
  [(PLPhotosHighlightGenerator *)self _consumeHighlightItemListChanges:v56 forKind:1 rule:v57 resultBlock:v103];
  uint64_t v66 = [MEMORY[0x1E4F1CA80] set];
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v8 = (id)v124[5];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v99 objects:v137 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v100;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v100 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = [*(id *)(*((void *)&v99 + 1) + 8 * i) parentHighlightItem];
        [v66 addObject:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v99 objects:v137 count:16];
    }
    while (v9);
  }

  [v66 addObjectsFromArray:v111[5]];
  uint64_t v13 = [v66 allObjects];
  os_signpost_id_t v60 = [(PLPhotosHighlightGenerator *)self updateElectedEventForUpdatedMonths:v13];

  if ([(id)v111[5] count] || objc_msgSend((id)v105[5], "count") || objc_msgSend(v60, "count"))
  {
    uint64_t v14 = objc_alloc_init(PLYearGroupingRule);
    uint64_t v15 = [[PLHighlightItemClusterer alloc] initWithRule:v14];
    uint64_t v55 = v14;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v134 = __Block_byref_object_copy__102295;
    v135 = __Block_byref_object_dispose__102296;
    id v136 = 0;
    uint64_t v93 = 0;
    uint32_t v94 = &v93;
    uint64_t v95 = 0x3032000000;
    long long v96 = __Block_byref_object_copy__102295;
    __int16 v97 = __Block_byref_object_dispose__102296;
    id v98 = 0;
    uint64_t v16 = [MEMORY[0x1E4F1CA80] setWithArray:v111[5]];
    [v16 addObjectsFromArray:v60];
    uint64_t v17 = v105[5];
    double v18 = [(PLPhotosHighlightGenerator *)self dataManager];
    v92[0] = MEMORY[0x1E4F143A8];
    v92[1] = 3221225472;
    v92[2] = __106__PLPhotosHighlightGenerator_MonthsAndYears__generateHighlightListForUpdatedHighlights_deletedHighlights___block_invoke_3;
    v92[3] = &unk_1E58728C0;
    v92[4] = buf;
    v92[5] = &v93;
    [(PLHighlightItemClusterer *)v15 restoreExistingHighlightItemListsFromUpdatedHighlightItems:v16 deletedHighlightItems:v17 usingModelReader:v18 progressBlock:0 restoreBlock:v92];
    id v51 = v16;
    uint64_t v54 = v15;

    uint64_t v86 = 0;
    long long v87 = &v86;
    uint64_t v88 = 0x3032000000;
    long long v89 = __Block_byref_object_copy__102295;
    long long v90 = __Block_byref_object_dispose__102296;
    id v91 = 0;
    uint64_t v19 = [(id)v94[5] allObjects];
    uint64_t v53 = [(PLHighlightItemClusterer *)v15 processHighlightItems:v19 withRestoredHighlightItemLists:*(void *)(*(void *)&buf[8] + 40) progressBlock:0];

    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __106__PLPhotosHighlightGenerator_MonthsAndYears__generateHighlightListForUpdatedHighlights_deletedHighlights___block_invoke_4;
    v85[3] = &unk_1E58728E8;
    void v85[4] = &v86;
    [(PLPhotosHighlightGenerator *)self _consumeHighlightItemListChanges:v53 forKind:2 rule:v55 resultBlock:v85];
    uint64_t v20 = [MEMORY[0x1E4F1CA80] set];
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v21 = *(id *)(*(void *)&buf[8] + 40);
    uint64_t v22 = [v21 countByEnumeratingWithState:&v81 objects:v132 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v82;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v82 != v23) {
            objc_enumerationMutation(v21);
          }
          uint64_t v25 = objc_msgSend(*(id *)(*((void *)&v81 + 1) + 8 * j), "parentHighlightItem", v51);
          [v20 addObject:v25];
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v81 objects:v132 count:16];
      }
      while (v22);
    }

    [v20 addObjectsFromArray:v87[5]];
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id obj = v20;
    uint64_t v26 = [obj countByEnumeratingWithState:&v77 objects:v131 count:16];
    if (v26)
    {
      uint64_t v63 = *(void *)v78;
      do
      {
        uint64_t v27 = 0;
        uint64_t v64 = v26;
        do
        {
          if (*(void *)v78 != v63) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = 0;
          uint64_t v65 = v27;
          long long v29 = *(void **)(*((void *)&v77 + 1) + 8 * v27);
          do
          {
            long long v30 = off_1E58686A0[v28];
            long long v73 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            long long v76 = 0u;
            long long v31 = [v29 childPhotosHighlights];
            uint64_t v32 = [v31 countByEnumeratingWithState:&v73 objects:v130 count:16];
            if (v32)
            {
              uint64_t v33 = *(void *)v74;
              while (2)
              {
                for (uint64_t k = 0; k != v32; ++k)
                {
                  if (*(void *)v74 != v33) {
                    objc_enumerationMutation(v31);
                  }
                  long long v35 = objc_msgSend(*(id *)(*((void *)&v73 + 1) + 8 * k), "valueForKey:", v30, v51);
                  BOOL v36 = [v35 unsignedShortValue] == 0;

                  if (!v36)
                  {
                    uint64_t v32 = 4;
                    goto LABEL_34;
                  }
                }
                uint64_t v32 = [v31 countByEnumeratingWithState:&v73 objects:v130 count:16];
                if (v32) {
                  continue;
                }
                break;
              }
            }
LABEL_34:

            uint64_t v37 = [v29 valueForKey:v30];
            BOOL v38 = [v37 unsignedShortValue] == v32;

            if (!v38)
            {
              uint64_t v39 = [NSNumber numberWithUnsignedShort:v32];
              [v29 setValue:v39 forKey:v30];

              [v29 bumpHighlightVersion];
              int v40 = [v29 sharingComposition];
              if (v40)
              {
                if (v40 == 1) {
                  goto LABEL_39;
                }
                if (v40 != 2) {
                  goto LABEL_43;
                }
                if (([v29 missingKeyAssetForKindPrivate] & 1) == 0)
                {
LABEL_39:
                  int v41 = objc_msgSend(v29, "missingKeyAssetForKindShared", v51);
LABEL_41:
                  if (!v41) {
                    goto LABEL_43;
                  }
                }
                uint64_t v42 = [(PLPhotosHighlightGenerator *)self highlightsNeedingNewKeyAsset];
                [v42 addObject:v29];

                goto LABEL_43;
              }
              int v41 = [v29 missingKeyAssetForKindPrivate];
              goto LABEL_41;
            }
LABEL_43:

            ++v28;
          }
          while (v28 != 3);
          uint64_t v27 = v65 + 1;
        }
        while (v65 + 1 != v64);
        uint64_t v26 = [obj countByEnumeratingWithState:&v77 objects:v131 count:16];
      }
      while (v26);
    }

    _Block_object_dispose(&v86, 8);
    _Block_object_dispose(&v93, 8);

    _Block_object_dispose(buf, 8);
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v68 = (id)v105[5];
  uint64_t v43 = [v68 countByEnumeratingWithState:&v69 objects:v129 count:16];
  if (v43)
  {
    uint64_t v44 = *(void *)v70;
    do
    {
      for (uint64_t m = 0; m != v43; ++m)
      {
        if (*(void *)v70 != v44) {
          objc_enumerationMutation(v68);
        }
        id v46 = *(void **)(*((void *)&v69 + 1) + 8 * m);
        uint64_t v47 = PLMomentsGetLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          uint64_t v48 = [v46 uuid];
          uint64_t v49 = [v46 startDate];
          long long v50 = [v46 endDate];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v48;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v49;
          *(_WORD *)&buf[22] = 2112;
          v134 = v50;
          _os_log_impl(&dword_19B3C7000, v47, OS_LOG_TYPE_INFO, "[HighlightsGeneration] Deleting month: [%@]-(%@-%@)", buf, 0x20u);
        }
        [v46 delete];
      }
      uint64_t v43 = [v68 countByEnumeratingWithState:&v69 objects:v129 count:16];
    }
    while (v43);
  }

  _Block_object_dispose(&v104, 8);
  _Block_object_dispose(&v110, 8);

  _Block_object_dispose(&v117, 8);
  _Block_object_dispose(&v123, 8);
}

void __106__PLPhotosHighlightGenerator_MonthsAndYears__generateHighlightListForUpdatedHighlights_deletedHighlights___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __106__PLPhotosHighlightGenerator_MonthsAndYears__generateHighlightListForUpdatedHighlights_deletedHighlights___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __106__PLPhotosHighlightGenerator_MonthsAndYears__generateHighlightListForUpdatedHighlights_deletedHighlights___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __106__PLPhotosHighlightGenerator_MonthsAndYears__generateHighlightListForUpdatedHighlights_deletedHighlights___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = PLMomentsGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = [v12 uuid];
          uint64_t v15 = [v12 startDate];
          uint64_t v16 = [v12 endDate];
          *(_DWORD *)buf = 138412802;
          uint64_t v23 = v14;
          __int16 v24 = 2112;
          uint64_t v25 = v15;
          __int16 v26 = 2112;
          uint64_t v27 = v16;
          _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "[HighlightsGeneration] Deleting year: [%@]-(%@-%@)", buf, 0x20u);
        }
        [v12 delete];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v9);
  }
}

- (id)updateElectedEventForUpdatedMonths:(id)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v48 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v42 = objc_alloc_init(PLMonthGroupingRule);
  uint64_t v49 = [[PLHighlightItemPromoter alloc] initWithRule:v42];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id obj = v3;
  uint64_t v45 = [obj countByEnumeratingWithState:&v84 objects:v91 count:16];
  if (v45)
  {
    uint64_t v44 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v85 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v51 = 0;
        uint64_t v52 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        do
        {
          context = (void *)MEMORY[0x19F38D3B0]();
          uint64_t v54 = off_1E58686A0[v51];
          uint64_t v53 = [MEMORY[0x1E4F1CA80] set];
          long long v82 = 0u;
          long long v83 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          id v4 = [v52 childPhotosHighlights];
          uint64_t v5 = [v4 countByEnumeratingWithState:&v80 objects:v90 count:16];
          if (!v5)
          {

LABEL_19:
            uint64_t v74 = 0;
            long long v75 = &v74;
            uint64_t v76 = 0x3032000000;
            long long v77 = __Block_byref_object_copy__102295;
            long long v78 = __Block_byref_object_dispose__102296;
            id v79 = 0;
            uint64_t v68 = 0;
            long long v69 = &v68;
            uint64_t v70 = 0x3032000000;
            long long v71 = __Block_byref_object_copy__102295;
            long long v72 = __Block_byref_object_dispose__102296;
            id v73 = 0;
            uint64_t v64 = 0;
            uint64_t v65 = &v64;
            uint64_t v66 = 0x2020000000;
            char v67 = 0;
            uint64_t v14 = [PLHighlightItemList alloc];
            uint64_t v15 = [v52 childPhotosHighlights];
            uint64_t v16 = [v15 allObjects];
            id v17 = [(PLHighlightItemList *)v14 initWithParentHighlightItem:v52 childHighlightItems:v16];

            v63[0] = MEMORY[0x1E4F143A8];
            v63[1] = 3221225472;
            v63[2] = __81__PLPhotosHighlightGenerator_MonthsAndYears__updateElectedEventForUpdatedMonths___block_invoke;
            v63[3] = &unk_1E5872898;
            v63[4] = &v74;
            v63[5] = &v68;
            v63[6] = &v64;
            [(PLHighlightItemPromoter *)v49 processHighlightItemsInHighlightItemList:v17 currentlyPromotedHighlightItems:v53 withSharingConsideration:v51 resultBlock:v63];
            int v18 = *((unsigned __int8 *)v65 + 24);
            long long v19 = [v52 valueForKey:v54];
            BOOL v20 = [v19 unsignedShortValue] == 2 * v18;

            if (!v20)
            {
              long long v21 = [NSNumber numberWithUnsignedShort:(2 * v18)];
              [v52 setValue:v21 forKey:v54];

              if (v18
                && (([v52 missingKeyAssetForKindPrivate] & 1) != 0
                 || [v52 missingKeyAssetForKindShared]))
              {
                uint64_t v22 = [(PLPhotosHighlightGenerator *)self highlightsNeedingNewKeyAsset];
                [v22 addObject:v52];
              }
              [v52 bumpHighlightVersion];
              [v48 addObject:v52];
            }
            long long v61 = 0u;
            long long v62 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            id v23 = (id)v75[5];
            uint64_t v24 = [v23 countByEnumeratingWithState:&v59 objects:v89 count:16];
            if (v24)
            {
              uint64_t v25 = *(void *)v60;
              do
              {
                for (uint64_t j = 0; j != v24; ++j)
                {
                  if (*(void *)v60 != v25) {
                    objc_enumerationMutation(v23);
                  }
                  id v27 = *(id *)(*((void *)&v59 + 1) + 8 * j);
                  int v28 = [v27 type];
                  if ((unsigned __int16)(v28 - 1) < 2u || v28 == 4) {
                    uint64_t v30 = 2;
                  }
                  else {
                    uint64_t v30 = 3;
                  }
                  long long v31 = [NSNumber numberWithInt:v30];
                  [v27 setValue:v31 forKey:v54];
                }
                uint64_t v24 = [v23 countByEnumeratingWithState:&v59 objects:v89 count:16];
              }
              while (v24);
            }

            long long v57 = 0u;
            long long v58 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            id v32 = (id)v69[5];
            uint64_t v33 = [v32 countByEnumeratingWithState:&v55 objects:v88 count:16];
            if (v33)
            {
              uint64_t v34 = *(void *)v56;
              do
              {
                for (uint64_t k = 0; k != v33; ++k)
                {
                  if (*(void *)v56 != v34) {
                    objc_enumerationMutation(v32);
                  }
                  id v36 = *(id *)(*((void *)&v55 + 1) + 8 * k);
                  int v37 = [v36 type];
                  BOOL v39 = v37 != 4 && (unsigned __int16)(v37 - 3) < 0xFFFEu;
                  int v40 = [NSNumber numberWithInt:v39];
                  [v36 setValue:v40 forKey:v54];
                }
                uint64_t v33 = [v32 countByEnumeratingWithState:&v55 objects:v88 count:16];
              }
              while (v33);
            }

            _Block_object_dispose(&v64, 8);
            _Block_object_dispose(&v68, 8);

            _Block_object_dispose(&v74, 8);
            goto LABEL_52;
          }
          int v6 = 0;
          int v7 = 0;
          uint64_t v8 = *(void *)v81;
          do
          {
            for (uint64_t m = 0; m != v5; ++m)
            {
              if (*(void *)v81 != v8) {
                objc_enumerationMutation(v4);
              }
              uint64_t v10 = *(void **)(*((void *)&v80 + 1) + 8 * m);
              BOOL v11 = [v10 enrichmentState] != 0;
              uint64_t v12 = [v10 valueForKey:v54];
              __int16 v13 = [v12 unsignedShortValue];

              if ((v13 & 0xFFFE) == 2) {
                [v53 addObject:v10];
              }
              v7 |= v11;
              v6 |= (v13 & 0xFFFE) == 2;
            }
            uint64_t v5 = [v4 countByEnumeratingWithState:&v80 objects:v90 count:16];
          }
          while (v5);

          if ((v7 & v6 & 1) == 0) {
            goto LABEL_19;
          }
LABEL_52:

          ++v51;
        }
        while (v51 != 3);
      }
      uint64_t v45 = [obj countByEnumeratingWithState:&v84 objects:v91 count:16];
    }
    while (v45);
  }

  return v48;
}

void __81__PLPhotosHighlightGenerator_MonthsAndYears__updateElectedEventForUpdatedMonths___block_invoke(void *a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void *)(a1[4] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v14 = v7;

  uint64_t v11 = *(void *)(a1[5] + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
  id v13 = v8;

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a4;
}

+ (void)updateTitleForHighlights:(id)a3 forKind:(unsigned __int16)a4 forceUpdateLocale:(BOOL)a5 dateRangeTitleGenerator:(id)a6
{
  BOOL v22 = a5;
  int v7 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v23 = a6;
  uint64_t v9 = off_1E585F2C0;
  if (v7 != 1) {
    uint64_t v9 = off_1E585FCF8;
  }
  id v10 = objc_alloc_init(*v9);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * v14);
        uint64_t v16 = (void *)MEMORY[0x19F38D3B0]();
        id v17 = [PLHighlightItemList alloc];
        int v18 = [v15 childPhotosHighlights];
        long long v19 = [v18 allObjects];
        BOOL v20 = [(PLHighlightItemList *)v17 initWithParentHighlightItem:v15 childHighlightItems:v19];

        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __121__PLPhotosHighlightGenerator_MonthsAndYears__updateTitleForHighlights_forKind_forceUpdateLocale_dateRangeTitleGenerator___block_invoke;
        v24[3] = &unk_1E5872870;
        v24[4] = v15;
        [v10 titlesForHighlightItemList:v20 dateRangeTitleGenerator:v23 forceUpdateLocale:v22 resultBlock:v24];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }
}

void __121__PLPhotosHighlightGenerator_MonthsAndYears__updateTitleForHighlights_forKind_forceUpdateLocale_dateRangeTitleGenerator___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setTitle:a2];
  [*(id *)(a1 + 32) setSubtitle:v6];
}

@end
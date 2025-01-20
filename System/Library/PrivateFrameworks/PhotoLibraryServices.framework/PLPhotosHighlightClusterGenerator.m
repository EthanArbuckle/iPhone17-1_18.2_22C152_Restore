@interface PLPhotosHighlightClusterGenerator
- (BOOL)_isRecent:(id)a3;
- (NSArray)allMomentsSorted;
- (NSDateInterval)recentHighlightsDateInterval;
- (PLFrequentLocationManager)frequentLocationManager;
- (PLLibraryClusterer)clusterer;
- (PLMomentGenerationDataManagement)dataManager;
- (PLPhotosHighlightClusterGenerator)initWithDataManager:(id)a3 frequentLocationManager:(id)a4 recentHighlightDateInterval:(id)a5 localCreationDateCreator:(id)a6;
- (id)_aggregationHighlightClustersForMoments:(id)a3;
- (id)_aggregationsInSortedMoments:(id)a3 unavailableMoments:(id)a4 intersectingMoments:(id)a5;
- (id)_ongoingTripsInRecentMoments:(id)a3;
- (id)_recentHighlightClusterWithRecentMoments:(id)a3;
- (id)_recentHighlightClusterWithRecentMoments:(id)a3 intersectingMoments:(id)a4;
- (id)_recentMoments;
- (id)_remainingHighlightClustersWithClusters:(id)a3 intersectingMoments:(id)a4 allowExternalSplits:(BOOL)a5;
- (id)_remainingMomentsFromMoments:(id)a3 includeAllTripHighlightClusters:(BOOL)a4;
- (id)_tripHighlightClustersForMoments:(id)a3 tripType:(unint64_t)a4;
- (id)_tripsInMoments:(id)a3;
- (id)highlightClustersIntersectingMoments:(id)a3 includeAllTripHighlightClusters:(BOOL)a4;
- (id)recentMomentsInMomentClusters:(id)a3;
@end

@implementation PLPhotosHighlightClusterGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterer, 0);
  objc_storeStrong((id *)&self->_recentHighlightsDateInterval, 0);
  objc_storeStrong((id *)&self->_frequentLocationManager, 0);
  objc_destroyWeak((id *)&self->_dataManager);
  objc_storeStrong((id *)&self->_allMomentsSorted, 0);
}

- (PLLibraryClusterer)clusterer
{
  return self->_clusterer;
}

- (NSDateInterval)recentHighlightsDateInterval
{
  return self->_recentHighlightsDateInterval;
}

- (PLFrequentLocationManager)frequentLocationManager
{
  return self->_frequentLocationManager;
}

- (PLMomentGenerationDataManagement)dataManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataManager);
  return (PLMomentGenerationDataManagement *)WeakRetained;
}

- (id)_remainingHighlightClustersWithClusters:(id)a3 intersectingMoments:(id)a4 allowExternalSplits:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F1CA48] array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v36;
    id v29 = v8;
    v30 = v9;
    uint64_t v27 = *(void *)v36;
    id v28 = v10;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "moments", v27, v28, v29, v30);
        v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
        int v17 = [v8 intersectsSet:v16];

        if (v17)
        {
          v18 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
          v19 = [[PLPhotosHighlightCluster alloc] initWithMoments:v18];
          if (v5)
          {
            BOOL v20 = v5;
            long long v33 = 0u;
            long long v34 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            id v21 = v15;
            uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v24 = *(void *)v32;
              while (2)
              {
                for (uint64_t j = 0; j != v23; ++j)
                {
                  if (*(void *)v32 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  if ((objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * j), "pl_originatorState") & 8) != 0)
                  {
                    [(PLPhotosHighlightCluster *)v19 setType:7];
                    goto LABEL_18;
                  }
                }
                uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
                if (v23) {
                  continue;
                }
                break;
              }
            }
LABEL_18:

            BOOL v5 = v20;
            id v8 = v29;
            v9 = v30;
            uint64_t v13 = v27;
            id v10 = v28;
          }
          [v9 addObject:v19];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v12);
  }

  return v9;
}

- (id)_aggregationHighlightClustersForMoments:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [(PLLibraryClusterer *)self->_clusterer momentClustersForMomentsSortedByDate:v4 allowLocationSplits:0 allowExternalSplits:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v12 = objc_alloc(MEMORY[0x1E4F1CA80]);
        uint64_t v13 = [v11 moments];
        v14 = (void *)[v12 initWithArray:v13];

        v15 = [[PLPhotosHighlightCluster alloc] initWithMoments:v14];
        [(PLPhotosHighlightCluster *)v15 setType:6];
        [v5 addObject:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
  v16 = [PLPhotosHighlightCluster alloc];
  int v17 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  v18 = [(PLPhotosHighlightCluster *)v16 initWithMoments:v17];

  [(PLPhotosHighlightCluster *)v18 setType:3];
  [(PLPhotosHighlightCluster *)v18 setKind:3];
  [v5 addObject:v18];

  return v5;
}

- (id)_tripHighlightClustersForMoments:(id)a3 tripType:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [(PLLibraryClusterer *)self->_clusterer momentClustersForMomentsSortedByDate:v5 allowLocationSplits:_os_feature_enabled_impl() ^ 1 allowExternalSplits:1];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v13 = objc_alloc(MEMORY[0x1E4F1CA80]);
        v14 = [v12 moments];
        v15 = (void *)[v13 initWithArray:v14];

        v16 = [[PLPhotosHighlightCluster alloc] initWithMoments:v15];
        [(PLPhotosHighlightCluster *)v16 setType:5];
        [v6 addObject:v16];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }
  int v17 = [PLPhotosHighlightCluster alloc];
  v18 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  v19 = [(PLPhotosHighlightCluster *)v17 initWithMoments:v18];

  unint64_t v20 = 0x400010002uLL >> (16 * a4);
  if (a4 >= 3) {
    LOBYTE(v20) = 0;
  }
  [(PLPhotosHighlightCluster *)v19 setType:v20 & 7];
  [(PLPhotosHighlightCluster *)v19 setKind:3];
  [v6 addObject:v19];

  return v6;
}

- (id)_aggregationsInSortedMoments:(id)a3 unavailableMoments:(id)a4 intersectingMoments:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v24 = a4;
  id v8 = a5;
  uint64_t v9 = [(PLLibraryClusterer *)self->_clusterer momentClustersForMomentsSortedByDate:a3 allowLocationSplits:0 allowExternalSplits:0];
  long long v25 = [MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1E4F1CAD0];
        int v17 = objc_msgSend(v15, "moments", v24);
        v18 = [v16 setWithArray:v17];
        int v19 = [v8 intersectsSet:v18];

        if (v19) {
          [v25 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  unint64_t v20 = objc_alloc_init(PLAggregationProcessor);
  long long v21 = [(PLAggregationProcessor *)v20 sortedNeighborMomentClustersOfMomentClusters:v25 forAllMomentClusters:v10];
  long long v22 = [(PLAggregationProcessor *)v20 processAggregationsWithSortedMomentClusters:v21 momentsContainedInOtherHighlights:v24 progressBlock:0];

  return v22;
}

- (id)_tripsInMoments:(id)a3
{
  frequentLocationManager = self->_frequentLocationManager;
  id v5 = a3;
  v6 = [(PLFrequentLocationManager *)frequentLocationManager momentGenerationDataManager];
  uint64_t v7 = [v6 lastLocationOfInterestVisit];

  id v8 = [v7 visitInterval];
  uint64_t v9 = [v8 endDate];

  id v10 = [(PLFrequentLocationManager *)self->_frequentLocationManager currentFrequentLocations];
  uint64_t v11 = +[PLTripProcessor processTripsWithItems:v5 frequentLocations:v10 lastHomeVisitDate:v9 progressBlock:0];

  uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_67303];
  uint64_t v13 = [v11 filteredArrayUsingPredicate:v12];

  return v13;
}

BOOL __53__PLPhotosHighlightClusterGenerator__tripsInMoments___block_invoke(uint64_t a1, void *a2)
{
  [a2 duration];
  return v2 <= 5184000.0;
}

- (id)_ongoingTripsInRecentMoments:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFrequentLocationManager *)self->_frequentLocationManager currentFrequentLocations];
  BOOL v6 = +[PLTripProcessor tripsEligibleForMoments:v4 frequentLocations:v5];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v8 = [(NSDateInterval *)self->_recentHighlightsDateInterval startDate];
    uint64_t v9 = [v8 dateByAddingTimeInterval:-5184000.0];
    id v10 = [(NSDateInterval *)self->_recentHighlightsDateInterval endDate];
    uint64_t v11 = (void *)[v7 initWithStartDate:v9 endDate:v10];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataManager);
    uint64_t v13 = [v11 startDate];
    v14 = [v11 endDate];
    v15 = [WeakRetained momentsBetweenDate:v13 andDate:v14 sorted:0 excludeExternal:1];

    v16 = [v4 setByAddingObjectsFromArray:v15];
    int v17 = [(PLPhotosHighlightClusterGenerator *)self _tripsInMoments:v16];
  }
  else
  {
    int v17 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v17;
}

- (id)_recentHighlightClusterWithRecentMoments:(id)a3 intersectingMoments:(id)a4
{
  id v6 = a3;
  if ([v6 intersectsSet:a4])
  {
    id v7 = [(PLPhotosHighlightClusterGenerator *)self _recentHighlightClusterWithRecentMoments:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_recentHighlightClusterWithRecentMoments:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [[PLPhotosHighlightCluster alloc] initWithMoments:v3];
    [(PLPhotosHighlightCluster *)v4 setCategory:1];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_recentMoments
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSDateInterval *)self->_recentHighlightsDateInterval startDate];
  id v4 = [v3 dateByAddingTimeInterval:-86400.0];

  id v5 = [(NSDateInterval *)self->_recentHighlightsDateInterval endDate];
  id v6 = [v5 dateByAddingTimeInterval:86400.0];

  id v7 = [(PLPhotosHighlightClusterGenerator *)self dataManager];
  id v8 = [v7 momentsBetweenDate:v4 andDate:v6 sorted:1 excludeExternal:1];

  if ([v8 count])
  {
    uint64_t v9 = [(PLLibraryClusterer *)self->_clusterer momentClustersForMomentsSortedByDate:v8 allowLocationSplits:0 allowExternalSplits:0];
    id v10 = [(PLPhotosHighlightClusterGenerator *)self recentMomentsInMomentClusters:v9];
  }
  else
  {
    uint64_t v11 = PLMomentsGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412546;
      v14 = v4;
      __int16 v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "No recent moments found for date interval: %@ - %@", (uint8_t *)&v13, 0x16u);
    }

    id v10 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v10;
}

- (id)recentMomentsInMomentClusters:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (-[PLPhotosHighlightClusterGenerator _isRecent:](self, "_isRecent:", v11, (void)v14))
        {
          uint64_t v12 = [v11 moments];
          [v5 addObjectsFromArray:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_isRecent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 startDate];
  id v6 = [v4 endDate];

  BOOL v7 = 0;
  if (v5 && v6)
  {
    if ([(NSDateInterval *)self->_recentHighlightsDateInterval containsDate:v5]) {
      BOOL v7 = [(NSDateInterval *)self->_recentHighlightsDateInterval containsDate:v6];
    }
    else {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)_remainingMomentsFromMoments:(id)a3 includeAllTripHighlightClusters:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![v6 count])
  {
    long long v23 = PLMomentsGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      long long v32 = "-[PLPhotosHighlightClusterGenerator _remainingMomentsFromMoments:includeAllTripHighlightClusters:]";
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "%s called without any moments, returning all moments.", buf, 0xCu);
    }

    goto LABEL_14;
  }
  if (v4)
  {
LABEL_14:
    long long v22 = [(PLPhotosHighlightClusterGenerator *)self allMomentsSorted];
    goto LABEL_15;
  }
  long long v25 = self;
  BOOL v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] distantPast];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      uint64_t v13 = 0;
      long long v14 = v7;
      long long v15 = v8;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v16 = *(void **)(*((void *)&v26 + 1) + 8 * v13);
        long long v17 = [v16 startDate];
        BOOL v7 = [v14 earlierDate:v17];

        v18 = [v16 endDate];
        uint64_t v8 = [v15 laterDate:v18];

        ++v13;
        long long v14 = v7;
        long long v15 = v8;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);
  }

  uint64_t v19 = [v7 dateByAddingTimeInterval:-2592000.0];

  unint64_t v20 = [v8 dateByAddingTimeInterval:2592000.0];

  long long v21 = [(PLPhotosHighlightClusterGenerator *)v25 dataManager];
  long long v22 = [v21 momentsBetweenDate:v19 andDate:v20 sorted:1 excludeExternal:0];

LABEL_15:
  return v22;
}

- (id)highlightClustersIntersectingMoments:(id)a3 includeAllTripHighlightClusters:(BOOL)a4
{
  BOOL v131 = a4;
  uint64_t v165 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v128 = v5;
  BOOL v7 = (void *)[v5 mutableCopy];
  v139 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v8 = PLMomentGenerationGetLog();
  id v9 = [(PLPhotosHighlightClusterGenerator *)self _recentMoments];
  v137 = (void *)[v9 mutableCopy];

  uint64_t v10 = v8;
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v12 = v10;
  uint64_t v13 = v12;
  unint64_t v134 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "OngoingTripHighlights", "", buf, 2u);
  }
  os_signpost_id_t spid = v11;
  v129 = v13;

  uint64_t v126 = mach_absolute_time();
  long long v14 = [(PLPhotosHighlightClusterGenerator *)self _ongoingTripsInRecentMoments:v137];
  long long v15 = PLMomentsGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v159 = v14;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "Recent ongoing trips: %@", buf, 0xCu);
  }

  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  obuint64_t j = v14;
  uint64_t v16 = [obj countByEnumeratingWithState:&v151 objects:v164 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v152;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v152 != v18) {
          objc_enumerationMutation(obj);
        }
        unint64_t v20 = *(void **)(*((void *)&v151 + 1) + 8 * i);
        long long v21 = [v20 items];
        long long v22 = [MEMORY[0x1E4F1CAD0] setWithArray:v21];
        if ([v7 intersectsSet:v22])
        {
          long long v23 = -[PLPhotosHighlightClusterGenerator _tripHighlightClustersForMoments:tripType:](self, "_tripHighlightClustersForMoments:tripType:", v21, [v20 type]);
          [v6 addObjectsFromArray:v23];

          [v137 minusSet:v22];
          [v7 minusSet:v22];
          [v139 unionSet:v22];
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v151 objects:v164 count:16];
    }
    while (v17);
  }

  uint64_t v24 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  long long v27 = v129;
  long long v28 = v27;
  if (v134 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v28, OS_SIGNPOST_INTERVAL_END, spid, "OngoingTripHighlights", "[HighlightsGeneration.OngoingTrips]", buf, 2u);
  }

  long long v29 = v28;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = [NSString stringWithFormat:@"[HighlightsGeneration.OngoingTrips]"];
    *(_DWORD *)buf = 136315650;
    v159 = "OngoingTripHighlights";
    __int16 v160 = 2112;
    v161 = v30;
    __int16 v162 = 2048;
    double v163 = (float)((float)((float)((float)(v24 - v126) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
  }
  if (![v7 count])
  {
    id v45 = v6;
    goto LABEL_85;
  }
  uint64_t v31 = v29;
  os_signpost_id_t v32 = os_signpost_id_generate(v31);
  mach_timebase_info v150 = 0;
  mach_timebase_info(&v150);
  uint64_t v33 = v31;
  long long v34 = v33;
  if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v32, "RecentHighlights", "", buf, 2u);
  }

  uint64_t v135 = mach_absolute_time();
  uint64_t v35 = [(PLPhotosHighlightClusterGenerator *)self _recentHighlightClusterWithRecentMoments:v137 intersectingMoments:v7];
  [v139 unionSet:v137];
  [v7 minusSet:v137];
  if (v35) {
    [v6 addObject:v35];
  }
  v127 = (void *)v35;
  uint64_t v36 = mach_absolute_time();
  uint32_t v37 = v150.numer;
  uint32_t v38 = v150.denom;
  v39 = v34;
  v40 = v39;
  if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v40, OS_SIGNPOST_INTERVAL_END, v32, "RecentHighlights", "[HighlightsGeneration.Recents]", buf, 2u);
  }

  uint64_t v41 = v40;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    v42 = [NSString stringWithFormat:@"[HighlightsGeneration.Recents]"];
    *(_DWORD *)buf = 136315650;
    v159 = "RecentHighlights";
    __int16 v160 = 2112;
    v161 = v42;
    __int16 v162 = 2048;
    double v163 = (float)((float)((float)((float)(v36 - v135) * (float)v37) / (float)v38) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
  }
  if ([v7 count] || v131)
  {
    os_signpost_id_t spida = (os_signpost_id_t)v29;
    v46 = (void *)MEMORY[0x1E4F1CA70];
    v47 = [(PLPhotosHighlightClusterGenerator *)self _remainingMomentsFromMoments:v128 includeAllTripHighlightClusters:v131];
    v48 = [v46 orderedSetWithArray:v47];

    v136 = v48;
    [v48 minusSet:v137];
    v123 = v41;
    v49 = v41;
    os_signpost_id_t v50 = os_signpost_id_generate(v49);
    mach_timebase_info v149 = 0;
    mach_timebase_info(&v149);
    v51 = v49;
    v52 = v51;
    unint64_t v120 = v50 - 1;
    if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v52, OS_SIGNPOST_INTERVAL_BEGIN, v50, "TripHighlights", "", buf, 2u);
    }
    os_signpost_id_t v113 = v50;
    v117 = v52;

    uint64_t v115 = mach_absolute_time();
    v53 = [v136 set];
    v54 = [(PLPhotosHighlightClusterGenerator *)self _tripsInMoments:v53];

    long long v147 = 0u;
    long long v148 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    id v130 = v54;
    uint64_t v55 = [v130 countByEnumeratingWithState:&v145 objects:v157 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v146;
      do
      {
        for (uint64_t j = 0; j != v56; ++j)
        {
          if (*(void *)v146 != v57) {
            objc_enumerationMutation(v130);
          }
          v59 = *(void **)(*((void *)&v145 + 1) + 8 * j);
          v60 = objc_msgSend(v59, "items", v113);
          v61 = [MEMORY[0x1E4F1CAD0] setWithArray:v60];
          if (v131 || [v7 intersectsSet:v61])
          {
            v62 = -[PLPhotosHighlightClusterGenerator _tripHighlightClustersForMoments:tripType:](self, "_tripHighlightClustersForMoments:tripType:", v60, [v59 type]);
            [v6 addObjectsFromArray:v62];
          }
          [v136 minusSet:v61];
          [v7 minusSet:v61];
          [v139 unionSet:v61];
        }
        uint64_t v56 = [v130 countByEnumeratingWithState:&v145 objects:v157 count:16];
      }
      while (v56);
    }

    uint64_t v63 = mach_absolute_time();
    uint32_t v64 = v149.numer;
    uint32_t v65 = v149.denom;
    v66 = v117;
    v67 = v66;
    if (v120 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v67, OS_SIGNPOST_INTERVAL_END, v113, "TripHighlights", "[HighlightsGeneration.Trips]", buf, 2u);
    }

    v68 = v67;
    long long v29 = spida;
    v44 = v127;
    uint64_t v41 = v123;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      float v69 = (float)((float)((float)(v63 - v115) * (float)v64) / (float)v65) / 1000000.0;
      v70 = [NSString stringWithFormat:@"[HighlightsGeneration.Trips]"];
      *(_DWORD *)buf = 136315650;
      v159 = "TripHighlights";
      __int16 v160 = 2112;
      v161 = v70;
      __int16 v162 = 2048;
      double v163 = v69;
      _os_log_impl(&dword_19B3C7000, v68, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
    }
    if (![v7 count])
    {
      id v110 = v6;
      goto LABEL_83;
    }
    if (+[PLAggregationProcessor isEnabled])
    {
      v132 = v68;
      v71 = v68;
      os_signpost_id_t v72 = os_signpost_id_generate(v71);
      mach_timebase_info v144 = 0;
      mach_timebase_info(&v144);
      v73 = v71;
      v74 = v73;
      unint64_t v121 = v72 - 1;
      if (v72 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v74, OS_SIGNPOST_INTERVAL_BEGIN, v72, "AggregationHighlights", "", buf, 2u);
      }
      os_signpost_id_t v114 = v72;
      v118 = v74;

      uint64_t v116 = mach_absolute_time();
      v75 = [(PLPhotosHighlightClusterGenerator *)self allMomentsSorted];
      v76 = [(PLPhotosHighlightClusterGenerator *)self _aggregationsInSortedMoments:v75 unavailableMoments:v139 intersectingMoments:v7];

      long long v142 = 0u;
      long long v143 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      id v77 = v76;
      uint64_t v78 = [v77 countByEnumeratingWithState:&v140 objects:v156 count:16];
      if (v78)
      {
        uint64_t v79 = v78;
        uint64_t v80 = *(void *)v141;
        do
        {
          for (uint64_t k = 0; k != v79; ++k)
          {
            if (*(void *)v141 != v80) {
              objc_enumerationMutation(v77);
            }
            v82 = objc_msgSend(*(id *)(*((void *)&v140 + 1) + 8 * k), "moments", v114);
            v83 = [(PLPhotosHighlightClusterGenerator *)self _aggregationHighlightClustersForMoments:v82];
            [v6 addObjectsFromArray:v83];

            v84 = [MEMORY[0x1E4F1CAD0] setWithArray:v82];
            [v136 minusSet:v84];
            [v7 minusSet:v84];
          }
          uint64_t v79 = [v77 countByEnumeratingWithState:&v140 objects:v156 count:16];
        }
        while (v79);
      }

      uint64_t v85 = mach_absolute_time();
      uint32_t v87 = v144.numer;
      uint32_t v86 = v144.denom;
      v88 = v118;
      v89 = v88;
      if (v121 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v89, OS_SIGNPOST_INTERVAL_END, v114, "AggregationHighlights", "[HighlightsGeneration.Aggregations]", buf, 2u);
      }

      v90 = v89;
      long long v29 = spida;
      v44 = v127;
      if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
      {
        v91 = [NSString stringWithFormat:@"[HighlightsGeneration.Aggregations]"];
        *(_DWORD *)buf = 136315650;
        v159 = "AggregationHighlights";
        __int16 v160 = 2112;
        v161 = v91;
        __int16 v162 = 2048;
        double v163 = (float)((float)((float)((float)(v85 - v116) * (float)v87) / (float)v86) / 1000000.0);
        _os_log_impl(&dword_19B3C7000, v90, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
      }
      v68 = v132;
      if (![v7 count])
      {
        id v112 = v6;

LABEL_81:
        uint64_t v41 = v123;
LABEL_83:

        goto LABEL_84;
      }
    }
    v92 = v68;
    os_signpost_id_t v93 = os_signpost_id_generate(v92);
    mach_timebase_info v144 = 0;
    mach_timebase_info(&v144);
    v94 = v92;
    v95 = v94;
    unint64_t v96 = v93 - 1;
    if (v93 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v94))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v95, OS_SIGNPOST_INTERVAL_BEGIN, v93, "DayHighlights", "", buf, 2u);
    }
    os_signpost_id_t v119 = v93;

    uint64_t v122 = mach_absolute_time();
    uint64_t v97 = [v136 array];
    uint64_t v98 = _os_feature_enabled_impl() ^ 1;
    uint64_t v99 = _os_feature_enabled_impl() ^ 1;
    v133 = (void *)v97;
    v100 = [(PLLibraryClusterer *)self->_clusterer momentClustersForMomentsSortedByDate:v97 allowLocationSplits:v98 allowExternalSplits:v99];
    v101 = [(PLPhotosHighlightClusterGenerator *)self _remainingHighlightClustersWithClusters:v100 intersectingMoments:v7 allowExternalSplits:v99];
    [v6 addObjectsFromArray:v101];
    uint64_t v102 = mach_absolute_time();
    uint32_t v104 = v144.numer;
    uint32_t v103 = v144.denom;
    v105 = v95;
    v106 = v105;
    if (v96 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v105))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v106, OS_SIGNPOST_INTERVAL_END, v119, "DayHighlights", "[HighlightsGeneration.Days]", buf, 2u);
    }

    v107 = v106;
    long long v29 = spida;
    v44 = v127;
    if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
    {
      v108 = [NSString stringWithFormat:@"[HighlightsGeneration.Days]"];
      *(_DWORD *)buf = 136315650;
      v159 = "DayHighlights";
      __int16 v160 = 2112;
      v161 = v108;
      __int16 v162 = 2048;
      double v163 = (float)((float)((float)((float)(v102 - v122) * (float)v104) / (float)v103) / 1000000.0);
      _os_log_impl(&dword_19B3C7000, v107, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
    }
    id v109 = v6;

    goto LABEL_81;
  }
  id v43 = v6;
  v44 = v127;
LABEL_84:

LABEL_85:
  return v6;
}

- (NSArray)allMomentsSorted
{
  allMomentsSorted = self->_allMomentsSorted;
  if (!allMomentsSorted)
  {
    BOOL v4 = [(PLPhotosHighlightClusterGenerator *)self dataManager];
    id v5 = [v4 allMomentsWithError:0];
    id v6 = self->_allMomentsSorted;
    self->_allMomentsSorted = v5;

    allMomentsSorted = self->_allMomentsSorted;
  }
  return allMomentsSorted;
}

- (PLPhotosHighlightClusterGenerator)initWithDataManager:(id)a3 frequentLocationManager:(id)a4 recentHighlightDateInterval:(id)a5 localCreationDateCreator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PLPhotosHighlightClusterGenerator;
  long long v14 = [(PLPhotosHighlightClusterGenerator *)&v19 init];
  long long v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_dataManager, v10);
    objc_storeStrong((id *)&v15->_frequentLocationManager, a4);
    objc_storeStrong((id *)&v15->_recentHighlightsDateInterval, a5);
    uint64_t v16 = [[PLLibraryClusterer alloc] initWithLocalCreationDateCreator:v13 frequentLocationManager:v15->_frequentLocationManager];
    clusterer = v15->_clusterer;
    v15->_clusterer = v16;
  }
  return v15;
}

@end
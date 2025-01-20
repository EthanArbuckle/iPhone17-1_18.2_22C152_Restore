@interface PLAssetCollectionGenerator
+ (id)_createMomentOrUpdateForAssetCluster:(id)a3 existingMomentDataForAssets:(id)a4 dataManager:(id)a5 usedMomentObjectIDs:(id)a6 debugDateFormatter:(id)a7;
+ (id)createMomentOrUpdateForAssetCluster:(id)a3 affectedMoment:(id)a4 dataManager:(id)a5;
- (BOOL)_updateMomentProcessedLocationAndReturnFrequentLocationsDidChange;
- (NSDateFormatter)debugDateFormatter;
- (NSMutableArray)momentsFromAssetClusters;
- (NSMutableSet)insertedOrUpdatedMoments;
- (NSMutableSet)usedMomentObjectIDs;
- (PLAssetCollectionGenerator)initWithDataManager:(id)a3 frequentLocationManager:(id)a4 localCreationDateCreator:(id)a5;
- (PLFrequentLocationManager)frequentLocationManager;
- (PLLocalCreationDateCreator)localCreationDateCreator;
- (PLMomentGenerationDataManagement)manager;
- (id)_createMomentOrUpdateForAssetCluster:(id)a3 existingMomentDataForAssets:(id)a4;
- (id)_processMomentsCollectionsYearsWithAssets:(id)a3 affectedMoments:(id)a4;
- (id)dataManager;
- (id)libraryClusterer:(id)a3 createMomentClustersForAssetClusters:(id)a4 existingMomentDataForAssets:(id)a5;
- (id)processMomentsWithAssets:(id)a3 affectedMoments:(id)a4;
- (void)_cleanUpMoment:(id)a3;
- (void)logRoutineInformation;
- (void)setDebugDateFormatter:(id)a3;
- (void)setFrequentLocationManager:(id)a3;
- (void)setInsertedOrUpdatedMoments:(id)a3;
- (void)setLocalCreationDateCreator:(id)a3;
- (void)setManager:(id)a3;
- (void)setMomentsFromAssetClusters:(id)a3;
- (void)setUsedMomentObjectIDs:(id)a3;
@end

@implementation PLAssetCollectionGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugDateFormatter, 0);
  objc_storeStrong((id *)&self->_momentsFromAssetClusters, 0);
  objc_storeStrong((id *)&self->_insertedOrUpdatedMoments, 0);
  objc_storeStrong((id *)&self->_usedMomentObjectIDs, 0);
  objc_storeStrong((id *)&self->_localCreationDateCreator, 0);
  objc_storeStrong((id *)&self->_frequentLocationManager, 0);
  objc_destroyWeak((id *)&self->_manager);
}

- (void)setDebugDateFormatter:(id)a3
{
}

- (void)setMomentsFromAssetClusters:(id)a3
{
}

- (NSMutableArray)momentsFromAssetClusters
{
  return self->_momentsFromAssetClusters;
}

- (void)setInsertedOrUpdatedMoments:(id)a3
{
}

- (NSMutableSet)insertedOrUpdatedMoments
{
  return self->_insertedOrUpdatedMoments;
}

- (void)setUsedMomentObjectIDs:(id)a3
{
}

- (NSMutableSet)usedMomentObjectIDs
{
  return self->_usedMomentObjectIDs;
}

- (void)setLocalCreationDateCreator:(id)a3
{
}

- (PLLocalCreationDateCreator)localCreationDateCreator
{
  return self->_localCreationDateCreator;
}

- (void)setFrequentLocationManager:(id)a3
{
}

- (PLFrequentLocationManager)frequentLocationManager
{
  return self->_frequentLocationManager;
}

- (void)setManager:(id)a3
{
}

- (PLMomentGenerationDataManagement)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (PLMomentGenerationDataManagement *)WeakRetained;
}

- (NSDateFormatter)debugDateFormatter
{
  debugDateFormatter = self->_debugDateFormatter;
  if (!debugDateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    [(NSDateFormatter *)v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SS"];
    v5 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
    [(NSDateFormatter *)v4 setTimeZone:v5];

    v6 = self->_debugDateFormatter;
    self->_debugDateFormatter = v4;

    debugDateFormatter = self->_debugDateFormatter;
  }
  return debugDateFormatter;
}

- (id)libraryClusterer:(id)a3 createMomentClustersForAssetClusters:(id)a4 existingMomentDataForAssets:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x19F38D3B0](v11);
        v17 = -[PLAssetCollectionGenerator _createMomentOrUpdateForAssetCluster:existingMomentDataForAssets:](self, "_createMomentOrUpdateForAssetCluster:existingMomentDataForAssets:", v15, v9, v24);
        if (v17)
        {
          [(PLAssetCollectionGenerator *)self insertedOrUpdatedMoments];
          v19 = v18 = v10;
          [v19 addObject:v17];

          v20 = [(PLAssetCollectionGenerator *)self usedMomentObjectIDs];
          v21 = [v17 uniqueObjectID];
          [v20 addObject:v21];

          v10 = v18;
          [v18 addObject:v17];
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      uint64_t v12 = v11;
    }
    while (v11);
  }

  v22 = [(PLAssetCollectionGenerator *)self momentsFromAssetClusters];
  [v22 addObject:v10];

  return v10;
}

- (void)logRoutineInformation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  [WeakRetained logRoutineInformation];
}

- (id)dataManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return WeakRetained;
}

- (void)_cleanUpMoment:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (([v3 isDeleted] & 1) == 0)
  {
    v4 = [v3 assets];
    int v5 = [v4 count];
    if (v5 >= 1)
    {
      if ([v3 cachedCount] == v5)
      {
LABEL_32:

        goto LABEL_33;
      }
      int v21 = v5;
      v23 = v3;
      [v3 recalculateSharedAssetContainerCachedValues];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v22 = v4;
      id v6 = v4;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        id v9 = 0;
        id v10 = 0;
        uint64_t v11 = 0;
        uint64_t v12 = 0;
        uint64_t v13 = *(void *)v25;
        while (1)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(v6);
            }
            uint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if (([v15 isDeleted] & 1) == 0)
            {
              if ([v15 isPhoto]) {
                uint64_t v11 = (v11 + 1);
              }
              else {
                uint64_t v12 = v12 + [v15 isVideo];
              }
              v16 = objc_msgSend(v15, "pl_date");
              v17 = v16;
              if (v9)
              {
                uint64_t v18 = [v9 earlierDate:v16];

                id v9 = (id)v18;
                if (v10) {
                  goto LABEL_15;
                }
LABEL_17:
                id v10 = v17;
              }
              else
              {
                id v9 = v16;
                if (!v10) {
                  goto LABEL_17;
                }
LABEL_15:
                uint64_t v19 = [v10 laterDate:v17];

                id v10 = (id)v19;
              }

              continue;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (!v8) {
            goto LABEL_23;
          }
        }
      }
      id v9 = 0;
      id v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
LABEL_23:

      id v3 = v23;
      [v23 setCachedPhotosCount:v11];
      [v23 setCachedVideosCount:v12];
      if (v9 && v10)
      {
        [v23 setStartDate:v9];
        [v23 setEndDate:v10];
        [v23 setRepresentativeDate:v9];
        int v5 = v21;
        v4 = v22;
      }
      else
      {
        v20 = PLMomentsGetLog();
        int v5 = v21;
        v4 = v22;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          long long v29 = v23;
          __int16 v30 = 2112;
          id v31 = v6;
          _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Moment %@ given a nil date for assets %@", buf, 0x16u);
        }
      }
    }
    if (!v5) {
      [v3 delete];
    }
    goto LABEL_32;
  }
LABEL_33:
}

- (id)_createMomentOrUpdateForAssetCluster:(id)a3 existingMomentDataForAssets:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  id v9 = [(PLAssetCollectionGenerator *)self manager];
  id v10 = [(PLAssetCollectionGenerator *)self usedMomentObjectIDs];
  uint64_t v11 = [(PLAssetCollectionGenerator *)self debugDateFormatter];
  uint64_t v12 = [v8 _createMomentOrUpdateForAssetCluster:v7 existingMomentDataForAssets:v6 dataManager:v9 usedMomentObjectIDs:v10 debugDateFormatter:v11];

  return v12;
}

- (BOOL)_updateMomentProcessedLocationAndReturnFrequentLocationsDidChange
{
  v2 = self;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = [(PLAssetCollectionGenerator *)self manager];
  id v39 = 0;
  uint64_t v4 = [v3 allMomentsWithError:&v39];
  id v5 = v39;

  id v6 = [(PLAssetCollectionGenerator *)v2 manager];
  id v31 = (void *)v4;
  uint64_t v7 = [(id)objc_opt_class() processingMomentsFromMoments:v4];

  long long v29 = (void *)v7;
  uint64_t v8 = [(PLFrequentLocationManager *)v2->_frequentLocationManager frequentLocationsDidChangeFromUpdateWithMoments:v7];
  if (v5)
  {
    id v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v5;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "[MomentsGeneration] Error fetching all moments. %@", buf, 0xCu);
    }

    BOOL v10 = 0;
  }
  else
  {
    BOOL v10 = v8;
  }
  uint64_t v11 = [(PLAssetCollectionGenerator *)v2 insertedOrUpdatedMoments];
  uint64_t v12 = (void *)[v11 mutableCopy];

  if (v10)
  {

    uint64_t v13 = [(PLAssetCollectionGenerator *)v2 manager];
    id v38 = 0;
    uint64_t v14 = [v13 momentsRequiringLocationProcessingWhenFrequentLocationsChangedWithError:&v38];
    id v15 = v38;

    if (v15)
    {
      v16 = PLBackendGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v15;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "[MomentsGeneration] Error fetching moments requiring location processing when frequent locations change. %@", buf, 0xCu);
      }
    }
    if ([v14 count]) {
      [v12 addObjectsFromArray:v14];
    }
    __int16 v30 = v15;
  }
  else
  {
    __int16 v30 = v5;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v12;
  uint64_t v17 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v33 = *(void *)v35;
    p_manager = (id *)&v2->_manager;
    do
    {
      uint64_t v20 = 0;
      do
      {
        BOOL v21 = v10;
        if (*(void *)v35 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v34 + 1) + 8 * v20);
        v23 = (void *)MEMORY[0x19F38D3B0]();
        id WeakRetained = objc_loadWeakRetained(p_manager);
        [(PLFrequentLocationManager *)v2->_frequentLocationManager currentFrequentLocations];
        long long v26 = v25 = v2;
        uint64_t v27 = v22;
        BOOL v10 = v21;
        +[PLMomentGenerationUtils processLocationIfNecessaryInMoment:v27 usingManager:WeakRetained frequentLocations:v26 frequentLocationsDidChange:v21];

        v2 = v25;
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v18);
  }

  return v10;
}

- (id)_processMomentsCollectionsYearsWithAssets:(id)a3 affectedMoments:(id)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v62 = a4;
  PLMomentGenerationGetLog();
  uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v9 = v7;
  BOOL v10 = v9;
  unint64_t v64 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "MomentCollectionYearClustering", "", buf, 2u);
  }
  os_signpost_id_t v58 = v8;

  uint64_t v59 = mach_absolute_time();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  mach_timebase_info v75 = 0;
  mach_timebase_info(&v75);
  uint64_t v13 = v11;
  uint64_t v14 = v13;
  unint64_t v15 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "MomentClustering", "", buf, 2u);
  }
  os_signpost_id_t spid = v12;

  uint64_t v60 = mach_absolute_time();
  v16 = [[PLLibraryClusterer alloc] initWithLocalCreationDateCreator:self->_localCreationDateCreator frequentLocationManager:self->_frequentLocationManager];
  [(PLLibraryClusterer *)v16 setDelegate:self];
  [(PLLibraryClusterer *)v16 processMomentsWithAssets:v6];
  uint64_t v17 = [(PLAssetCollectionGenerator *)self manager];
  char v18 = [v17 cameraIsActive];

  v65 = v6;
  BOOL v63 = (v18 & 1) == 0
     && [(PLAssetCollectionGenerator *)self _updateMomentProcessedLocationAndReturnFrequentLocationsDidChange];
  uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  v66 = self;
  uint64_t v20 = [(PLAssetCollectionGenerator *)self momentsFromAssetClusters];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v71 objects:v84 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v72 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v71 + 1) + 8 * i);
        long long v26 = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v27 = [(PLLibraryClusterer *)v16 locationBasedMomentClustersForMomentsSortedByDate:v25];
        [v19 addObjectsFromArray:v27];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v71 objects:v84 count:16];
    }
    while (v22);
  }

  uint64_t v28 = mach_absolute_time();
  uint32_t numer = v75.numer;
  uint32_t denom = v75.denom;
  id v31 = v14;
  v32 = v31;
  if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v32, OS_SIGNPOST_INTERVAL_END, spid, "MomentClustering", "processMoments done.", buf, 2u);
  }

  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    float v33 = (float)((float)((float)(v28 - v60) * (float)numer) / (float)denom) / 1000000.0;
    long long v34 = NSString;
    long long v35 = v32;
    long long v36 = [v34 stringWithFormat:@"processMoments done."];
    *(_DWORD *)buf = 136315650;
    v79 = "MomentClustering";
    __int16 v80 = 2112;
    uint64_t v81 = (uint64_t)v36;
    __int16 v82 = 2048;
    double v83 = v33;
    _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
  }
  v61 = v32;
  long long v37 = [(PLAssetCollectionGenerator *)v66 insertedOrUpdatedMoments];
  id v38 = (void *)[v37 mutableCopy];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v39 = v62;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v67 objects:v77 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v68;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v68 != v42) {
          objc_enumerationMutation(v39);
        }
        uint64_t v44 = *(void *)(*((void *)&v67 + 1) + 8 * j);
        if (([v37 containsObject:v44] & 1) == 0)
        {
          v45 = (void *)MEMORY[0x19F38D3B0]();
          [v38 addObject:v44];
          [(PLAssetCollectionGenerator *)v66 _cleanUpMoment:v44];
        }
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v67 objects:v77 count:16];
    }
    while (v41);
  }

  uint64_t v46 = mach_absolute_time();
  uint32_t v48 = info.numer;
  uint32_t v47 = info.denom;
  v49 = v61;
  v50 = v49;
  if (v64 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
  {
    uint64_t v51 = [v65 count];
    uint64_t v52 = [v38 count];
    *(_DWORD *)buf = 134218240;
    v79 = (const char *)v51;
    __int16 v80 = 2048;
    uint64_t v81 = v52;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v50, OS_SIGNPOST_INTERVAL_END, v58, "MomentCollectionYearClustering", "assets %lu, created moments %lu", buf, 0x16u);
  }

  v53 = v50;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    v54 = [NSString stringWithFormat:@"assets %lu, created moments %lu", objc_msgSend(v65, "count"), objc_msgSend(v38, "count")];
    *(_DWORD *)buf = 136315650;
    v79 = "MomentCollectionYearClustering";
    __int16 v80 = 2112;
    uint64_t v81 = (uint64_t)v54;
    __int16 v82 = 2048;
    double v83 = (float)((float)((float)((float)(v46 - v59) * (float)v48) / (float)v47) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
  }
  v55 = [[PLAssetCollectionGenerationResult alloc] initWithInsertedOrUpdatedMoments:v38 frequentLocationsDidChange:v63];

  return v55;
}

- (id)processMomentsWithAssets:(id)a3 affectedMoments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = self;
  objc_sync_enter(v8);
  id v9 = [MEMORY[0x1E4F1CA80] set];
  [(PLAssetCollectionGenerator *)v8 setUsedMomentObjectIDs:v9];

  BOOL v10 = [MEMORY[0x1E4F1CA80] set];
  [(PLAssetCollectionGenerator *)v8 setInsertedOrUpdatedMoments:v10];

  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  [(PLAssetCollectionGenerator *)v8 setMomentsFromAssetClusters:v11];

  os_signpost_id_t v12 = [(PLAssetCollectionGenerator *)v8 _processMomentsCollectionsYearsWithAssets:v6 affectedMoments:v7];
  objc_sync_exit(v8);

  return v12;
}

- (PLAssetCollectionGenerator)initWithDataManager:(id)a3 frequentLocationManager:(id)a4 localCreationDateCreator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PLAssetCollectionGenerator;
  uint64_t v11 = [(PLAssetCollectionGenerator *)&v14 init];
  os_signpost_id_t v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_manager, v8);
    objc_storeStrong((id *)&v12->_frequentLocationManager, a4);
    objc_storeStrong((id *)&v12->_localCreationDateCreator, a5);
  }

  return v12;
}

+ (id)createMomentOrUpdateForAssetCluster:(id)a3 affectedMoment:(id)a4 dataManager:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [[PLExistingMomentData alloc] initWithMoment:v9];

  if (v9) {
    [MEMORY[0x1E4F1CAD0] setWithObject:v11];
  }
  else {
  os_signpost_id_t v12 = [MEMORY[0x1E4F1CAD0] set];
  }
  uint64_t v13 = [a1 _createMomentOrUpdateForAssetCluster:v10 existingMomentDataForAssets:v12 dataManager:v8 usedMomentObjectIDs:0 debugDateFormatter:0];

  return v13;
}

+ (id)_createMomentOrUpdateForAssetCluster:(id)a3 existingMomentDataForAssets:(id)a4 dataManager:(id)a5 usedMomentObjectIDs:(id)a6 debugDateFormatter:(id)a7
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [v11 assets];
  uint64_t v17 = [v11 location];
  uint64_t v18 = [v16 count];
  if (!v18)
  {
    uint64_t v40 = v12;
    uint64_t v41 = 0;
    goto LABEL_82;
  }
  uint64_t v104 = v18;
  v105 = v17;
  v109 = v15;
  v118 = v14;
  id v19 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v20 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  v112 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v16, "count"));
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  v106 = v16;
  id obj = v16;
  uint64_t v21 = [obj countByEnumeratingWithState:&v128 objects:v146 count:16];
  v107 = v13;
  id v108 = v12;
  v110 = v11;
  v111 = v20;
  if (v21)
  {
    uint64_t v22 = v21;
    __int16 v23 = 0;
    uint64_t v117 = 0;
    uint64_t v24 = *(void *)v129;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v129 != v24) {
          objc_enumerationMutation(obj);
        }
        long long v26 = *(void **)(*((void *)&v128 + 1) + 8 * i);
        signed __int16 v27 = +[PLMomentGenerationUtils originatorStateForAsset:v26];
        if ([v26 isPhoto]) {
          LODWORD(v117) = v117 + 1;
        }
        else {
          HIDWORD(v117) += [v26 isVideo];
        }
        uint64_t v28 = [v26 inferredTimeZoneOffset];
        long long v29 = [v26 location];
        [v29 coordinate];
        double v31 = v30;
        double v33 = v32;

        v149.latitude = v31;
        v149.longitude = v33;
        if (CLLocationCoordinate2DIsValid(v149))
        {
          BOOL v34 = v31 != 0.0;
          if (v33 != 0.0) {
            BOOL v34 = 1;
          }
          if (v34 && (v31 != 40.0 || v33 != -100.0))
          {
            long long v36 = [NSNumber numberWithInt:v28];
            [v111 addObject:v36];
          }
        }
        long long v37 = [NSNumber numberWithInt:v28];
        [v19 addObject:v37];

        objc_msgSend(v26, "pl_coordinate");
        if (+[PLLocationUtils canUseCoordinate:](PLLocationUtils, "canUseCoordinate:"))
        {
          id v38 = NSNumber;
          [v26 gpsHorizontalAccuracy];
          id v39 = objc_msgSend(v38, "numberWithDouble:");
          [v112 addObject:v39];
        }
        v23 |= v27;
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v128 objects:v146 count:16];
    }
    while (v22);
    id v20 = v111;
    id v12 = v108;
  }
  else
  {
    __int16 v23 = 0;
    uint64_t v117 = 0;
  }

  [v112 sortUsingSelector:sel_compare_];
  unint64_t v42 = [v112 count];
  if (v42)
  {
    uint64_t v43 = [v112 objectAtIndexedSubscript:v42 >> 1];
    [v43 doubleValue];
    double v45 = v44;
  }
  else
  {
    double v45 = -1.0;
  }
  id v46 = v19;
  id v47 = v46;
  if ([v20 count])
  {
    id v47 = v20;
  }
  v103 = v46;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  id v48 = v47;
  uint64_t v49 = [v48 countByEnumeratingWithState:&v124 objects:v145 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    unint64_t v51 = 0;
    int v116 = 0;
    uint64_t v52 = *(void *)v125;
    do
    {
      for (uint64_t j = 0; j != v50; ++j)
      {
        if (*(void *)v125 != v52) {
          objc_enumerationMutation(v48);
        }
        v54 = *(void **)(*((void *)&v124 + 1) + 8 * j);
        int v55 = [v54 intValue];
        unint64_t v56 = [v48 countForObject:v54];
        if (v56 > v51) {
          goto LABEL_37;
        }
        if (v56 == v51)
        {
          if (v55 >= 0) {
            unsigned int v57 = v55;
          }
          else {
            unsigned int v57 = -v55;
          }
          unsigned int v58 = v116;
          if (v116 < 0) {
            unsigned int v58 = -v116;
          }
          if (v57 < v58)
          {
LABEL_37:
            unint64_t v51 = v56;
            int v116 = v55;
          }
        }
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v124 objects:v145 count:16];
    }
    while (v50);
  }
  else
  {
    int v116 = 0;
  }

  uint64_t v59 = [v11 startDate];
  v102 = [v11 endDate];
  v114 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v59 endDate:v102];
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id v60 = v12;
  uint64_t v61 = [v60 countByEnumeratingWithState:&v120 objects:v144 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    v101 = v59;
    v115 = 0;
    BOOL v63 = 0;
    uint64_t v64 = *(void *)v121;
    do
    {
      for (uint64_t k = 0; k != v62; ++k)
      {
        if (*(void *)v121 != v64) {
          objc_enumerationMutation(v60);
        }
        v66 = *(void **)(*((void *)&v120 + 1) + 8 * k);
        if (v118)
        {
          long long v67 = [*(id *)(*((void *)&v120 + 1) + 8 * k) objectID];
          char v68 = [v118 containsObject:v67];

          if (v68) {
            continue;
          }
        }
        long long v69 = [v66 dateInterval];
        long long v70 = [v114 intersectionWithDateInterval:v69];

        [v70 duration];
        double v72 = v71;
        [v63 duration];
        if (v63) {
          BOOL v74 = 1;
        }
        else {
          BOOL v74 = v70 == 0;
        }
        if (!v74 || v72 > v73)
        {
          id v76 = v66;

          id v77 = v70;
          v115 = v76;
          BOOL v63 = v77;
        }
      }
      uint64_t v62 = [v60 countByEnumeratingWithState:&v120 objects:v144 count:16];
    }
    while (v62);

    if (v115)
    {
      v78 = [v115 objectID];
      id v119 = 0;
      v79 = [v107 momentWithUniqueID:v78 error:&v119];
      id v80 = v119;
      uint64_t v59 = v101;
      if (v80)
      {
        uint64_t v81 = PLBackendGetLog();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v133 = v78;
          __int16 v134 = 2112;
          id v135 = v80;
          _os_log_impl(&dword_19B3C7000, v81, OS_LOG_TYPE_ERROR, "[MomentsGeneration] Error fetching moment with object ID %@. %@", buf, 0x16u);
        }
      }
      if (!v109)
      {
        id v82 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        [v82 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SS"];
        [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
        id v83 = v80;
        uint64_t v85 = v84 = v79;
        v109 = v82;
        [v82 setTimeZone:v85];

        v79 = v84;
        id v80 = v83;
      }
      v86 = PLBackendGetLog();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
      {
        v96 = [v79 uuid];
        v98 = [v79 startDate];
        v100 = [v109 stringFromDate:v98];
        v97 = [v79 endDate];
        v94 = [v109 stringFromDate:v97];
        v95 = [v110 startDate];
        v87 = [v109 stringFromDate:v95];
        [v79 endDate];
        v88 = v99 = v79;
        uint64_t v89 = [v109 stringFromDate:v88];
        *(_DWORD *)buf = 138413570;
        v133 = v78;
        __int16 v134 = 2112;
        id v135 = v96;
        __int16 v136 = 2112;
        v137 = v100;
        __int16 v138 = 2112;
        v139 = v94;
        __int16 v140 = 2112;
        v141 = v87;
        __int16 v142 = 2112;
        uint64_t v143 = v89;
        v90 = (void *)v89;
        _os_log_impl(&dword_19B3C7000, v86, OS_LOG_TYPE_DEBUG, "[MomentsGeneration] Found existing moment with OID %@, UID %@, old [%@ - %@], new [%@ - %@]", buf, 0x3Eu);

        v79 = v99;
      }

      id v13 = v107;
      uint64_t v40 = v108;
      if (v79) {
        goto LABEL_81;
      }
    }
    else
    {
      v115 = 0;
      id v13 = v107;
      uint64_t v40 = v108;
      uint64_t v59 = v101;
    }
  }
  else
  {

    v115 = 0;
    BOOL v63 = 0;
    id v13 = v107;
    uint64_t v40 = v108;
  }
  v79 = [v13 insertNewMoment];
LABEL_81:
  [v79 setStartDate:v59];
  [v79 setEndDate:v102];
  [v79 setTimeZoneOffset:v116];
  [v79 setRepresentativeDate:v59];
  [MEMORY[0x1E4F1CAD0] setWithArray:obj];
  v92 = v91 = v79;
  [v91 setAssets:v92];

  [v91 setCachedCount:v104];
  [v91 setCachedPhotosCount:v117];
  [v91 setCachedVideosCount:HIDWORD(v117)];
  [v91 setApproximateLocation:v105];
  [v91 setProcessedLocation:0];
  [v91 setGpsHorizontalAccuracy:v45];
  uint64_t v41 = v91;
  [v91 setOriginatorState:v23];

  uint64_t v17 = v105;
  id v14 = v118;
  id v15 = v109;
  id v11 = v110;
  v16 = v106;
LABEL_82:

  return v41;
}

@end
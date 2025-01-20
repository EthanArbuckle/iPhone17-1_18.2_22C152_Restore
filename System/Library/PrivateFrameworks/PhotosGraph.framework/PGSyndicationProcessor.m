@interface PGSyndicationProcessor
- (BOOL)processSavedSyndicatedAssetsWithError:(id *)a3 progressBlock:(id)a4;
- (BOOL)processSyndicatedAssetCurationWithError:(id *)a3 progressBlock:(id)a4;
- (BOOL)processSyndicatedAssetGuestInferenceWithError:(id *)a3 progressBlock:(id)a4;
- (BOOL)processSyndicatedAssetGuestInferenceWithError:(id *)a3 progressBlock:(id)a4 shareBackSuggester:(id)a5;
- (BOOL)processSyndicatedAssetRevGeoCodingWithError:(id *)a3 progressBlock:(id)a4;
- (PGSyndicationProcessor)initWithWorkingContext:(id)a3;
- (PGSyndicationProcessor)initWithWorkingContext:(id)a3 syndicationLibrary:(id)a4;
- (id)_bestAssetUUIDInAssetCluster:(id)a3;
- (id)duplicateAssetUUIDsForSuggesterResult:(id)a3 assetsInferredAsGuestAsset:(id)a4 syndicationLibrary:(id)a5 error:(id *)a6 progressBlock:(id)a7;
- (id)guestAssetSenderIdentifiersByMomentUUIDForMomentUUIDs:(id)a3 inPhotoLibrary:(id)a4;
- (id)similarStacker;
- (id)syndicationPhotoLibraryWithError:(id *)a3;
- (void)_persistCurationScores:(id)a3 inPhotoLibrary:(id)a4;
@end

@implementation PGSyndicationProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationSession, 0);
  objc_storeStrong((id *)&self->_syndicationLibrary, 0);
  objc_storeStrong((id *)&self->_similarStacker, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

- (BOOL)processSyndicatedAssetRevGeoCodingWithError:(id *)a3 progressBlock:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void (**)(void *, uint8_t *, double))_Block_copy(v6);
  double v8 = 0.0;
  if (v7)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v22[0] = 0;
      v7[2](v7, v22, 0.0);
      if (v22[0])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = 732;
          LOWORD(v27) = 2080;
          *(void *)((char *)&v27 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Syndication/PGSyndicationProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        BOOL v10 = 0;
        goto LABEL_23;
      }
      double v8 = Current;
    }
  }
  v11 = [(PGSyndicationProcessor *)self syndicationPhotoLibraryWithError:a3];
  if (v11)
  {
    *(void *)buf = 0;
    *(void *)&long long v27 = buf;
    *((void *)&v27 + 1) = 0x3032000000;
    v28 = __Block_byref_object_copy__16988;
    v29 = __Block_byref_object_dispose__16989;
    id v30 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    workingContext = self->_workingContext;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __84__PGSyndicationProcessor_processSyndicatedAssetRevGeoCodingWithError_progressBlock___block_invoke;
    v21[3] = &unk_1E68F0A78;
    v21[4] = buf;
    [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v21];
    v13 = [(PGManagerWorkingContext *)self->_workingContext loggingConnection];
    v14 = [PGRevGeocodeProcessor alloc];
    uint64_t v15 = *(void *)(v27 + 40);
    v16 = [(PGManagerWorkingContext *)self->_workingContext locationCache];
    v17 = [(PGRevGeocodeProcessor *)v14 initWithPhotoLibrary:v11 homeLocations:v15 loggingConnection:v13 locationCache:v16];

    v18 = +[PGRevGeocodeProcessor momentsRequiringRevGeocodingWithUUIDs:0 inPhotoLibrary:v11 defaultToAllAssets:1 loggingConnection:v13];
    BOOL v10 = [(PGRevGeocodeProcessor *)v17 revGeocodeMoments:v18 progressBlock:v6];
    if (v7)
    {
      if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
      {
        char v20 = 0;
        v7[2](v7, (uint8_t *)&v20, 1.0);
        if (v20)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v22 = 67109378;
            int v23 = 750;
            __int16 v24 = 2080;
            v25 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Synd"
                  "ication/PGSyndicationProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v22, 0x12u);
          }
          BOOL v10 = 0;
        }
      }
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (v7)
    {
      if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
      {
        v22[0] = 0;
        v7[2](v7, v22, 1.0);
        if (v22[0])
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = 736;
            LOWORD(v27) = 2080;
            *(void *)((char *)&v27 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Syndication/PGSyndicationProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    BOOL v10 = 0;
  }

LABEL_23:
  return v10;
}

void __84__PGSyndicationProcessor_processSyndicatedAssetRevGeoCodingWithError_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v9 = [a2 graph];
  v3 = [v9 meNodeCollection];
  v4 = [v3 homeNodes];
  v5 = [v4 addressNodes];
  uint64_t v6 = [v5 locations];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  double v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)similarStacker
{
  similarStacker = self->_similarStacker;
  if (!similarStacker)
  {
    v4 = (CLSSimilarStacker *)[objc_alloc(MEMORY[0x1E4F76DA0]) initWithSimilarityModelClass:objc_opt_class()];
    v5 = self->_similarStacker;
    self->_similarStacker = v4;

    similarStacker = self->_similarStacker;
  }
  return similarStacker;
}

- (id)_bestAssetUUIDInAssetCluster:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v22;
    double v8 = -1.79769313e308;
    double v9 = -1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v3);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v11 curationScore];
        if (v12 >= v9)
        {
          double v13 = v12;
          [v11 overallAestheticScore];
          double v15 = v14;
          if (v8 <= v14)
          {
            v16 = [v11 uuid];
            v17 = v16;
            if (!v6 || (v13 == v9 ? (BOOL v18 = v8 == v15) : (BOOL v18 = 0), !v18 || [v16 compare:v6] == -1))
            {
              id v19 = v17;

              uint64_t v6 = v19;
              double v9 = v13;
              double v8 = v15;
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)duplicateAssetUUIDsForSuggesterResult:(id)a3 assetsInferredAsGuestAsset:(id)a4 syndicationLibrary:(id)a5 error:(id *)a6 progressBlock:(id)a7
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v110 = a4;
  id v109 = a5;
  id v116 = a7;
  v119 = self;
  oslog = [(PGManagerWorkingContext *)self->_workingContext loggingConnection];
  v120 = [MEMORY[0x1E4F1CA80] set];
  double v12 = [MEMORY[0x1E4F1C9C8] distantFuture];
  double v13 = [MEMORY[0x1E4F1C9C8] distantPast];
  float v14 = [MEMORY[0x1E4F1CA80] set];
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  v112 = v11;
  double v15 = [v11 suggesterInputs];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v140 objects:v156 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v141;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v141 != v18) {
          objc_enumerationMutation(v15);
        }
        char v20 = *(void **)(*((void *)&v140 + 1) + 8 * i);
        long long v21 = [v20 asset];
        if (v21)
        {
          [v14 addObject:v21];
          long long v22 = [v20 creationDate];
          uint64_t v23 = [v12 earlierDate:v22];

          uint64_t v24 = [v13 laterDate:v22];

          double v13 = (void *)v24;
          double v12 = (void *)v23;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v140 objects:v156 count:16];
    }
    while (v17);
  }

  if ([v14 count])
  {
    uint64_t v25 = [v12 dateByAddingTimeInterval:-1.0];

    uint64_t v26 = [v13 dateByAddingTimeInterval:1.0];

    uint64_t v27 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"creationDate >= %@ && creationDate <= %@", v25, v26];
    uint64_t v95 = v26;
    v96 = (void *)v25;
    v108 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dateCreated >= %@ && dateCreated <= %@", v25, v26];
    v28 = [(PGManagerWorkingContext *)v119->_workingContext photoLibrary];
    v29 = [v28 librarySpecificFetchOptions];

    [v29 setIncludeGuestAssets:0];
    uint64_t v31 = *MEMORY[0x1E4F39538];
    v154[0] = *MEMORY[0x1E4F39550];
    uint64_t v30 = v154[0];
    v154[1] = v31;
    uint64_t v155 = *MEMORY[0x1E4F394E0];
    uint64_t v32 = v155;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v154 count:3];
    [v29 setFetchPropertySets:v33];

    [v29 setPredicate:v27];
    v106 = v29;
    v34 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v29];
    v107 = (void *)v27;
    v35 = [v110 filteredSetUsingPredicate:v27];
    uint64_t v36 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForGuestAsset"), 1);
    uint64_t v37 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %lu OR %K == %lu", @"mediaAnalysisAttributes.syndicationProcessingVersion", *MEMORY[0x1E4F39580], @"mediaAnalysisAttributes.syndicationProcessingVersion", *MEMORY[0x1E4F39588]);
    v38 = [v109 librarySpecificFetchOptions];
    [v38 setIncludeGuestAssets:1];
    v153[0] = v30;
    v153[1] = v31;
    v153[2] = v32;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v153 count:3];
    [v38 setFetchPropertySets:v39];

    v40 = (void *)MEMORY[0x1E4F28BA0];
    v152[0] = v108;
    v102 = (void *)v37;
    v103 = (void *)v36;
    v152[1] = v36;
    v152[2] = v37;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v152 count:3];
    v42 = [v40 andPredicateWithSubpredicates:v41];
    [v38 setInternalPredicate:v42];

    v101 = v38;
    v43 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v38];
    v44 = (void *)MEMORY[0x1E4F1CA48];
    v45 = [v14 allObjects];
    v46 = [v44 arrayWithArray:v45];

    v105 = v34;
    v47 = [v34 fetchedObjects];
    [v46 addObjectsFromArray:v47];

    v104 = v35;
    v48 = [v35 allObjects];
    [v46 addObjectsFromArray:v48];

    v100 = v43;
    v49 = [v43 fetchedObjects];
    [v46 addObjectsFromArray:v49];

    [(CLSCurationSession *)v119->_curationSession prepareAssets:v46];
    v50 = (void *)[objc_alloc(MEMORY[0x1E4F8A780]) initWithDistanceBlock:&__block_literal_global_335];
    [v50 setMaximumDistance:1.0];
    [v50 setMinimumNumberOfObjects:2];
    v98 = v50;
    v99 = v46;
    v51 = [v50 performWithDataset:v46 progressBlock:v116];
    v97 = v51;
    if ([v51 count])
    {
      v115 = [(PGSyndicationProcessor *)v119 similarStacker];
      long long v136 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      obuint64_t j = v51;
      uint64_t v114 = [obj countByEnumeratingWithState:&v136 objects:v151 count:16];
      if (v114)
      {
        uint64_t v113 = *(void *)v137;
        while (2)
        {
          uint64_t v52 = 0;
          do
          {
            if (*(void *)v137 != v113) {
              objc_enumerationMutation(obj);
            }
            uint64_t v117 = v52;
            v53 = *(void **)(*((void *)&v136 + 1) + 8 * v52);
            context = (void *)MEMORY[0x1D25FED50]();
            long long v132 = 0u;
            long long v133 = 0u;
            long long v134 = 0u;
            long long v135 = 0u;
            v54 = [v53 objects];
            uint64_t v55 = [v54 countByEnumeratingWithState:&v132 objects:v150 count:16];
            if (v55)
            {
              uint64_t v56 = v55;
              uint64_t v57 = *(void *)v133;
LABEL_19:
              uint64_t v58 = 0;
              while (1)
              {
                if (*(void *)v133 != v57) {
                  objc_enumerationMutation(v54);
                }
                v59 = *(void **)(*((void *)&v132 + 1) + 8 * v58);
                v60 = [v59 sceneAnalysisProperties];
                int v61 = [v60 sceneAnalysisVersion];

                v62 = [MEMORY[0x1E4F8A998] currentSceneVersion];
                int v63 = [v62 intValue];

                if (v63 > v61) {
                  break;
                }
                if (v56 == ++v58)
                {
                  uint64_t v56 = [v54 countByEnumeratingWithState:&v132 objects:v150 count:16];
                  if (v56) {
                    goto LABEL_19;
                  }
                  goto LABEL_25;
                }
              }
              v64 = (void *)MEMORY[0x1E4F28C58];
              v65 = NSString;
              v66 = [v59 uuid];
              v67 = [v65 stringWithFormat:@"Asset %@ has no scenes processed: could not dedupe guest asset for %@.", v66, v112];
              v68 = [v64 errorWithDescription:v67];

              if (!v68) {
                goto LABEL_27;
              }

              v92 = (void *)v95;
              if (a6) {
                *a6 = v68;
              }

              id v91 = 0;
              v89 = v120;
              double v12 = v96;
              goto LABEL_64;
            }
LABEL_25:

LABEL_27:
            v69 = [v53 objects];
            v70 = [v115 stackSimilarItems:v69 withSimilarity:2 timestampSupport:0 progressBlock:v116];

            long long v130 = 0u;
            long long v131 = 0u;
            long long v128 = 0u;
            long long v129 = 0u;
            id v122 = v70;
            uint64_t v71 = [v122 countByEnumeratingWithState:&v128 objects:v149 count:16];
            if (v71)
            {
              uint64_t v72 = v71;
              uint64_t v73 = *(void *)v129;
              do
              {
                uint64_t v74 = 0;
                uint64_t v121 = v72;
                do
                {
                  if (*(void *)v129 != v73) {
                    objc_enumerationMutation(v122);
                  }
                  v75 = *(void **)(*((void *)&v128 + 1) + 8 * v74);
                  unint64_t v76 = [v75 count];
                  if (v76 >= 2)
                  {
                    unint64_t v77 = v76;
                    v78 = [MEMORY[0x1E4F1CA48] array];
                    long long v124 = 0u;
                    long long v125 = 0u;
                    long long v126 = 0u;
                    long long v127 = 0u;
                    id v79 = v75;
                    uint64_t v80 = [v79 countByEnumeratingWithState:&v124 objects:v148 count:16];
                    if (v80)
                    {
                      uint64_t v81 = v80;
                      uint64_t v82 = *(void *)v125;
                      do
                      {
                        for (uint64_t j = 0; j != v81; ++j)
                        {
                          if (*(void *)v125 != v82) {
                            objc_enumerationMutation(v79);
                          }
                          v84 = *(void **)(*((void *)&v124 + 1) + 8 * j);
                          if ([v14 containsObject:v84])
                          {
                            v85 = [v84 uuid];
                            [v78 addObject:v85];
                          }
                        }
                        uint64_t v81 = [v79 countByEnumeratingWithState:&v124 objects:v148 count:16];
                      }
                      while (v81);
                    }

                    uint64_t v86 = [v78 count];
                    if (v86 == v77)
                    {
                      v87 = [(PGSyndicationProcessor *)v119 _bestAssetUUIDInAssetCluster:v79];
                      [v78 removeObject:v87];
                      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412546;
                        uint64_t v145 = (uint64_t)v78;
                        __int16 v146 = 2112;
                        v147 = v87;
                        _os_log_debug_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEBUG, "PGSyndicationProcessor: Cluster only contains input items %@, selected best item: %@", buf, 0x16u);
                      }
                    }
                    uint64_t v72 = v121;
                    if (v86)
                    {
                      [v120 addObjectsFromArray:v78];
                      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        uint64_t v145 = (uint64_t)v78;
                        _os_log_debug_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEBUG, "PGSyndicationProcessor: Found cluster of duplicates %@", buf, 0xCu);
                      }
                    }
                  }
                  ++v74;
                }
                while (v74 != v72);
                uint64_t v72 = [v122 countByEnumeratingWithState:&v128 objects:v149 count:16];
              }
              while (v72);
            }

            uint64_t v52 = v117 + 1;
          }
          while (v117 + 1 != v114);
          uint64_t v114 = [obj countByEnumeratingWithState:&v136 objects:v151 count:16];
          if (v114) {
            continue;
          }
          break;
        }
      }
    }
    v88 = oslog;
    v89 = v120;
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v90 = [v120 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v145 = v90;
      __int16 v146 = 2112;
      v147 = v112;
      _os_log_impl(&dword_1D1805000, v88, OS_LOG_TYPE_DEFAULT, "PGSyndicationProcessor: Found %lu duplicate(s) for : %@", buf, 0x16u);
    }

    id v91 = v120;
    v92 = (void *)v95;
    double v12 = v96;
LABEL_64:

    double v13 = v92;
  }
  else
  {
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v145 = (uint64_t)v112;
      _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEFAULT, "PGSyndicationProcessor: No duplicates to find since there are no assets for: %@", buf, 0xCu);
    }
    v89 = v120;
    id v91 = v120;
  }

  return v91;
}

void __130__PGSyndicationProcessor_duplicateAssetUUIDsForSuggesterResult_assetsInferredAsGuestAsset_syndicationLibrary_error_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 creationDate];
  uint64_t v6 = [v4 creationDate];

  [v5 timeIntervalSinceDate:v6];
}

- (id)guestAssetSenderIdentifiersByMomentUUIDForMomentUUIDs:(id)a3 inPhotoLibrary:(id)a4
{
  v53[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  oslog = [(PGManagerWorkingContext *)self->_workingContext loggingConnection];
  double v8 = [v7 librarySpecificFetchOptions];
  double v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"moment.uuid", v6];
  BOOL v10 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForGuestAsset"), 1);
  id v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %lu OR %K == %lu", @"mediaAnalysisAttributes.syndicationProcessingVersion", *MEMORY[0x1E4F39580], @"mediaAnalysisAttributes.syndicationProcessingVersion", *MEMORY[0x1E4F39588]);
  [v8 setIncludeGuestAssets:1];
  uint64_t v12 = *MEMORY[0x1E4F394E0];
  v53[0] = *MEMORY[0x1E4F39458];
  v53[1] = v12;
  double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
  [v8 setFetchPropertySets:v13];

  float v14 = (void *)MEMORY[0x1E4F28BA0];
  v52[0] = v9;
  v52[1] = v10;
  v52[2] = v11;
  double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:3];
  uint64_t v16 = [v14 andPredicateWithSubpredicates:v15];
  [v8 setInternalPredicate:v16];

  uint64_t v17 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v8];
  if ([v17 count])
  {
    v35 = v11;
    uint64_t v36 = v10;
    uint64_t v37 = v9;
    v38 = v8;
    id v39 = v7;
    id v40 = v6;
    v44 = [MEMORY[0x1E4F38EB8] senderIdentifierByAssetUUIDForAssets:v17];
    v43 = [MEMORY[0x1E4F391A0] fetchMomentUUIDByAssetUUIDForAssets:v17 options:0];
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v34 = v17;
    obuint64_t j = v17;
    uint64_t v19 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v46 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v24 = (void *)MEMORY[0x1D25FED50]();
          uint64_t v25 = [v23 mediaAnalysisProperties];
          int v26 = [v25 syndicationProcessingValue] & 0x6EF0;

          if (v26)
          {
            uint64_t v27 = [v23 uuid];
            v28 = [v43 objectForKeyedSubscript:v27];
            v29 = [v44 objectForKeyedSubscript:v27];
            if (!v29)
            {
              v29 = &stru_1F283BC78;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v50 = v27;
                _os_log_fault_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_FAULT, "No sender identifier for %@, see: rdar://74551611 ([Hubble] Some syndicated assets have the same syndication identifier but different uuids)", buf, 0xCu);
              }
            }
            uint64_t v30 = [v18 objectForKeyedSubscript:v28];
            uint64_t v31 = v30;
            if (v30)
            {
              [v30 addObject:v29];
            }
            else
            {
              uint64_t v32 = [MEMORY[0x1E4F1CA80] setWithObject:v29];
              [v18 setObject:v32 forKeyedSubscript:v28];
            }
          }
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v20);
    }

    id v7 = v39;
    id v6 = v40;
    double v9 = v37;
    double v8 = v38;
    id v11 = v35;
    BOOL v10 = v36;
    uint64_t v17 = v34;
  }
  else
  {
    id v18 = (id)MEMORY[0x1E4F1CC08];
  }

  return v18;
}

- (BOOL)processSyndicatedAssetGuestInferenceWithError:(id *)a3 progressBlock:(id)a4 shareBackSuggester:(id)a5
{
  v130[7] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v76 = a5;
  uint64_t v74 = v8;
  uint64_t v122 = 0;
  v123 = &v122;
  uint64_t v124 = 0x2020000000;
  char v125 = 0;
  uint64_t v118 = 0;
  v119 = (double *)&v118;
  uint64_t v120 = 0x2020000000;
  uint64_t v121 = 0;
  id v79 = _Block_copy(v8);
  if (v79
    && (double v9 = CFAbsoluteTimeGetCurrent(), v9 - v119[3] >= 0.01)
    && (v119[3] = v9,
        LOBYTE(v126) = 0,
        (*((void (**)(void *, int *, double))v79 + 2))(v79, &v126, 0.0),
        char v10 = *((unsigned char *)v123 + 24) | v126,
        (*((unsigned char *)v123 + 24) = v10) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      buf[0] = 0x12004000202;
      LOWORD(buf[1]) = 2080;
      *(void *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Syndication/PGSyndicationProcessor.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
    }
    BOOL v11 = 0;
  }
  else
  {
    oslog = [(PGManagerWorkingContext *)self->_workingContext loggingConnection];
    uint64_t v12 = [(PGSyndicationProcessor *)self syndicationPhotoLibraryWithError:a3];
    v75 = v12;
    if (v12)
    {
      uint64_t v71 = a3;
      uint64_t v72 = self;
      v78 = [v12 librarySpecificFetchOptions];
      uint64_t v13 = *MEMORY[0x1E4F39440];
      v130[0] = *MEMORY[0x1E4F39448];
      v130[1] = v13;
      uint64_t v14 = *MEMORY[0x1E4F39458];
      v130[2] = *MEMORY[0x1E4F394E0];
      v130[3] = v14;
      uint64_t v15 = *MEMORY[0x1E4F39538];
      v130[4] = *MEMORY[0x1E4F39550];
      v130[5] = v15;
      v130[6] = *MEMORY[0x1E4F394C8];
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:7];
      [v78 setFetchPropertySets:v16];

      uint64_t v17 = [MEMORY[0x1E4F8E7A8] internalPredicateToFilterSyndicatedAssetsEligibleForGuestInferenceProcessing];
      [v78 setInternalPredicate:v17];

      [v78 setIncludeGuestAssets:1];
      uint64_t v73 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v78];
      uint64_t v18 = [v73 count];
      BOOL v19 = os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v19)
        {
          LODWORD(buf[0]) = 134217984;
          *(void *)((char *)buf + 4) = v18;
          _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEFAULT, "PGSyndicationProcessor: %tu asset(s) eligible for guest processing", (uint8_t *)buf, 0xCu);
        }
        uint64_t v20 = oslog;
        os_signpost_id_t v21 = os_signpost_id_generate(v20);
        long long v22 = v20;
        uint64_t v23 = v22;
        os_signpost_id_t spid = v21;
        unint64_t v70 = v21 - 1;
        log = v22;
        if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          BOOL v24 = os_signpost_enabled(v22);
          uint64_t v23 = log;
          if (v24)
          {
            LOWORD(buf[0]) = 0;
            _os_signpost_emit_with_name_impl(&dword_1D1805000, log, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PGSyndicationProcessorAssetGuestInference", "", (uint8_t *)buf, 2u);
            uint64_t v23 = log;
          }
        }

        mach_timebase_info info = 0;
        mach_timebase_info(&info);
        uint64_t v25 = mach_absolute_time();
        v84 = [MEMORY[0x1E4F38EB8] senderIdentifierByAssetUUIDForAssets:v73];
        uint64_t v68 = v25;
        v85 = [MEMORY[0x1E4F391A0] fetchMomentUUIDByAssetUUIDForAssets:v73 options:0];
        id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v116 = 0u;
        long long v115 = 0u;
        long long v114 = 0u;
        long long v113 = 0u;
        obuint64_t j = v73;
        uint64_t v27 = [obj countByEnumeratingWithState:&v113 objects:v129 count:16];
        if (v27)
        {
          uint64_t v28 = *(void *)v114;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v114 != v28) {
                objc_enumerationMutation(obj);
              }
              uint64_t v30 = *(void **)(*((void *)&v113 + 1) + 8 * i);
              uint64_t v31 = [v30 uuid];
              uint64_t v32 = [v85 objectForKeyedSubscript:v31];
              v33 = [v84 objectForKeyedSubscript:v31];
              if (!v33)
              {
                v33 = &stru_1F283BC78;
                if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
                {
                  LODWORD(buf[0]) = 138412290;
                  *(void *)((char *)buf + 4) = v31;
                  _os_log_fault_impl(&dword_1D1805000, log, OS_LOG_TYPE_FAULT, "No sender identifier for %@, see: rdar://74551611 ([Hubble] Some syndicated assets have the same syndication identifier but different uuids)", (uint8_t *)buf, 0xCu);
                }
              }
              id v34 = [v26 objectForKeyedSubscript:v32];
              if (!v34)
              {
                id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                [v26 setObject:v34 forKeyedSubscript:v32];
              }
              v35 = [v34 objectForKeyedSubscript:v33];
              uint64_t v36 = v35;
              if (v35)
              {
                [v35 addObject:v30];
              }
              else
              {
                uint64_t v37 = [MEMORY[0x1E4F1CA48] arrayWithObject:v30];
                [v34 setObject:v37 forKeyedSubscript:v33];
              }
            }
            uint64_t v27 = [obj countByEnumeratingWithState:&v113 objects:v129 count:16];
          }
          while (v27);
        }

        v38 = [MEMORY[0x1E4F1CA80] set];
        id v39 = [MEMORY[0x1E4F1CA60] dictionary];
        id v40 = [v85 allValues];
        v41 = [(PGSyndicationProcessor *)v72 guestAssetSenderIdentifiersByMomentUUIDForMomentUUIDs:v40 inPhotoLibrary:v75];

        v42 = [(PGManagerWorkingContext *)v72->_workingContext serviceManager];
        workingContext = v72->_workingContext;
        v99[0] = MEMORY[0x1E4F143A8];
        v99[1] = 3221225472;
        v99[2] = __105__PGSyndicationProcessor_processSyndicatedAssetGuestInferenceWithError_progressBlock_shareBackSuggester___block_invoke;
        v99[3] = &unk_1E68E6828;
        id v100 = v76;
        v44 = log;
        v101 = v44;
        id v45 = v75;
        id v102 = v45;
        v103 = v72;
        os_log_t loga = v42;
        os_log_t v104 = loga;
        id v46 = v26;
        id v105 = v46;
        id v47 = v39;
        id v106 = v47;
        id v80 = v41;
        id v107 = v80;
        id v48 = v38;
        id v108 = v48;
        id v49 = v79;
        id v109 = v49;
        id v110 = &v118;
        v111 = &v122;
        uint64_t v112 = 0x3F847AE147AE147BLL;
        [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v99];
        if (*((unsigned char *)v123 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            buf[0] = 0x1B604000202;
            LOWORD(buf[1]) = 2080;
            *(void *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalys"
                                               "is/PhotosGraph/Framework/Syndication/PGSyndicationProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
          }
          BOOL v11 = 0;
        }
        else
        {
          v54 = v44;
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v55 = [v48 count];
            LODWORD(buf[0]) = 134217984;
            *(void *)((char *)buf + 4) = v55;
            _os_log_impl(&dword_1D1805000, v54, OS_LOG_TYPE_DEFAULT, "PGSyndicationProcessor: Promoting %tu asset(s) as guest", (uint8_t *)buf, 0xCu);
          }

          unint64_t v56 = [obj count];
          buf[0] = 0;
          buf[1] = buf;
          buf[2] = 0x2020000000;
          buf[3] = 0;
          if (v56)
          {
            double v57 = 1.0 / (double)v56;
            v88[0] = MEMORY[0x1E4F143A8];
            v88[1] = 3221225472;
            v88[2] = __105__PGSyndicationProcessor_processSyndicatedAssetGuestInferenceWithError_progressBlock_shareBackSuggester___block_invoke_311;
            v88[3] = &unk_1E68E6850;
            unint64_t v96 = v56;
            id v89 = obj;
            id v90 = v47;
            id v91 = v48;
            v93 = buf;
            double v97 = v57;
            id v92 = v49;
            v94 = &v118;
            uint64_t v98 = 0x3F847AE147AE147BLL;
            uint64_t v95 = &v122;
            id v87 = 0;
            char v58 = [v45 performChangesAndWait:v88 error:&v87];
            id v59 = v87;
            if ((v58 & 1) == 0)
            {
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
              {
                int v126 = 138412290;
                v127[0] = v59;
                _os_log_error_impl(&dword_1D1805000, v54, OS_LOG_TYPE_ERROR, "PGSyndicationProcessor: Error saving guest asset inference to database: %@", (uint8_t *)&v126, 0xCu);
              }
              if (v71) {
                *uint64_t v71 = v59;
              }
            }
          }
          uint64_t v60 = mach_absolute_time();
          uint32_t numer = info.numer;
          uint32_t denom = info.denom;
          int v63 = v54;
          v64 = v63;
          if (v70 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
          {
            LOWORD(v126) = 0;
            _os_signpost_emit_with_name_impl(&dword_1D1805000, v64, OS_SIGNPOST_INTERVAL_END, spid, "PGSyndicationProcessorAssetGuestInference", "", (uint8_t *)&v126, 2u);
          }

          if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
          {
            int v126 = 136315394;
            v127[0] = "PGSyndicationProcessorAssetGuestInference";
            LOWORD(v127[1]) = 2048;
            *(double *)((char *)&v127[1] + 2) = (float)((float)((float)((float)(v60 - v68) * (float)numer) / (float)denom)
                                                      / 1000000.0);
            _os_log_impl(&dword_1D1805000, v64, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v126, 0x16u);
          }
          if (v79
            && (double Current = CFAbsoluteTimeGetCurrent(), Current - v119[3] >= 0.01)
            && (v119[3] = Current,
                char v86 = 0,
                (*((void (**)(id, char *, double))v49 + 2))(v49, &v86, 1.0),
                char v66 = *((unsigned char *)v123 + 24) | v86,
                (*((unsigned char *)v123 + 24) = v66) != 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              int v126 = 67109378;
              LODWORD(v127[0]) = 497;
              WORD2(v127[0]) = 2080;
              *(void *)((char *)v127 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysi"
                                              "s/PhotosGraph/Framework/Syndication/PGSyndicationProcessor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v126, 0x12u);
            }
            BOOL v11 = 0;
          }
          else
          {
            BOOL v11 = 1;
          }
          _Block_object_dispose(buf, 8);
        }
      }
      else
      {
        if (v19)
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEFAULT, "PGSyndicationProcessor: No asset eligible for guest processing", (uint8_t *)buf, 2u);
        }
        if (v79
          && (double v52 = CFAbsoluteTimeGetCurrent(), v52 - v119[3] >= 0.01)
          && (v119[3] = v52,
              LOBYTE(v126) = 0,
              (*((void (**)(void *, int *, double))v79 + 2))(v79, &v126, 1.0),
              char v53 = *((unsigned char *)v123 + 24) | v126,
              (*((unsigned char *)v123 + 24) = v53) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            buf[0] = 0x13304000202;
            LOWORD(buf[1]) = 2080;
            *(void *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalys"
                                               "is/PhotosGraph/Framework/Syndication/PGSyndicationProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
          }
          BOOL v11 = 0;
        }
        else
        {
          BOOL v11 = 1;
        }
      }
    }
    else
    {
      if (v79)
      {
        double v50 = CFAbsoluteTimeGetCurrent();
        if (v50 - v119[3] >= 0.01)
        {
          v119[3] = v50;
          LOBYTE(v126) = 0;
          (*((void (**)(void *, int *, double))v79 + 2))(v79, &v126, 1.0);
          char v51 = *((unsigned char *)v123 + 24) | v126;
          *((unsigned char *)v123 + 24) = v51;
          if (v51)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              buf[0] = 0x12604000202;
              LOWORD(buf[1]) = 2080;
              *(void *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanal"
                                                 "ysis/PhotosGraph/Framework/Syndication/PGSyndicationProcessor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
            }
          }
        }
      }
      BOOL v11 = 0;
    }
  }
  _Block_object_dispose(&v118, 8);
  _Block_object_dispose(&v122, 8);

  return v11;
}

void __105__PGSyndicationProcessor_processSyndicatedAssetGuestInferenceWithError_progressBlock_shareBackSuggester___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 graph];
  id v5 = *(id *)(a1 + 32);
  if (!v5)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = [*(id *)(*(void *)(a1 + 56) + 8) photoLibrary];
    id v5 = +[PGShareBackSuggester shareBackSuggesterForSyndicationWithLoggingConnection:v6 syndicationPhotoLibrary:v7 systemPhotoLibrary:v8 graph:v4 serviceManager:*(void *)(a1 + 64)];
  }
  double v9 = 1.0 / (double)(unint64_t)[*(id *)(a1 + 72) count];
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  char v10 = *(void **)(a1 + 72);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __105__PGSyndicationProcessor_processSyndicatedAssetGuestInferenceWithError_progressBlock_shareBackSuggester___block_invoke_2;
  v16[3] = &unk_1E68E6800;
  id v17 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 80);
  id v19 = *(id *)(a1 + 88);
  id v11 = v4;
  id v20 = v11;
  id v12 = v5;
  id v21 = v12;
  id v13 = v3;
  uint64_t v14 = *(void *)(a1 + 56);
  id v22 = v13;
  uint64_t v23 = v14;
  id v24 = *(id *)(a1 + 96);
  id v25 = *(id *)(a1 + 48);
  id v26 = *(id *)(a1 + 104);
  uint64_t v15 = *(void *)(a1 + 128);
  long long v27 = *(_OWORD *)(a1 + 112);
  uint64_t v28 = v31;
  uint64_t v29 = v15;
  double v30 = v9;
  [v10 enumerateKeysAndObjectsUsingBlock:v16];

  _Block_object_dispose(v31, 8);
}

void __105__PGSyndicationProcessor_processSyndicatedAssetGuestInferenceWithError_progressBlock_shareBackSuggester___block_invoke_311(uint64_t a1)
{
  if (*(void *)(a1 + 88))
  {
    uint64_t v2 = 0;
    uint64_t v3 = *MEMORY[0x1E4F39588];
    while (1)
    {
      id v4 = (void *)MEMORY[0x1D25FED50]();
      id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v2];
      uint64_t v6 = [MEMORY[0x1E4F38ED0] changeRequestForAsset:v5];
      uint64_t v7 = *(void **)(a1 + 40);
      id v8 = [v5 uuid];
      double v9 = [v7 objectForKeyedSubscript:v8];

      if (v9)
      {
        objc_msgSend(v6, "setSyndicationProcessingValue:", objc_msgSend(v9, "unsignedShortValue"));
        uint64_t v10 = PHAssetSyndicationProcessingCurrentVersionForAsset();
        int v11 = [*(id *)(a1 + 48) containsObject:v5];
        int v12 = [v5 isGuestAsset];
        if (v11)
        {
          uint64_t v10 = v3;
          if ((v12 & 1) == 0)
          {
            [v6 promoteToGuestAsset];
            uint64_t v10 = v3;
          }
        }
        else if (v12)
        {
          [v6 resetGuestAssetPromotion];
        }
        [v6 setSyndicationProcessingVersion:v10];
        *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(double *)(a1 + 96)
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                + 24);
        if (*(void *)(a1 + 56))
        {
          double Current = CFAbsoluteTimeGetCurrent();
          uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
          if (Current - *(double *)(v14 + 24) >= *(double *)(a1 + 104))
          {
            *(double *)(v14 + 24) = Current;
            (*(void (**)(double))(*(void *)(a1 + 56) + 16))(*(double *)(*(void *)(*(void *)(a1 + 64)
                                                                                                 + 8)
                                                                                     + 24)
                                                                         * 0.25 + 0.75);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 80)
                                                                                              + 8)
                                                                                  + 24);
            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
              break;
            }
          }
        }
      }

      if ((unint64_t)++v2 >= *(void *)(a1 + 88)) {
        return;
      }
    }
  }
}

void __105__PGSyndicationProcessor_processSyndicatedAssetGuestInferenceWithError_progressBlock_shareBackSuggester___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __105__PGSyndicationProcessor_processSyndicatedAssetGuestInferenceWithError_progressBlock_shareBackSuggester___block_invoke_3;
  v14[3] = &unk_1E68E67D8;
  id v15 = *(id *)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  id v8 = v7;
  id v18 = v8;
  id v19 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 80);
  int v11 = *(void **)(a1 + 88);
  id v21 = v9;
  uint64_t v22 = v10;
  id v23 = v11;
  id v24 = *(id *)(a1 + 96);
  id v25 = *(id *)(a1 + 104);
  uint64_t v28 = *(void *)(a1 + 136);
  long long v26 = *(_OWORD *)(a1 + 112);
  uint64_t v27 = *(void *)(a1 + 128);
  [a3 enumerateKeysAndObjectsUsingBlock:v14];
  *(double *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = *(double *)(a1 + 144)
                                                               + *(double *)(*(void *)(*(void *)(a1 + 128) + 8)
                                                                           + 24);
  if (*(void *)(a1 + 104))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v13 = *(void *)(*(void *)(a1 + 112) + 8);
    if (Current - *(double *)(v13 + 24) >= *(double *)(a1 + 136))
    {
      *(double *)(v13 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 104) + 16))(*(double *)(*(void *)(*(void *)(a1 + 128) + 8)
                                                                                + 24)
                                                                    * 0.5 + 0.25);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8)
                                                                             + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24)) {
        *a4 = 1;
      }
    }
  }
}

void __105__PGSyndicationProcessor_processSyndicatedAssetGuestInferenceWithError_progressBlock_shareBackSuggester___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v64 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v86 objects:v95 count:16];
  uint64_t v10 = v7;
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v87 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        if ([v14 creationDateSource] == 3)
        {
          id v15 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D1805000, v15, OS_LOG_TYPE_ERROR, "PGSyndicationProcessor: Skipping syndicated asset due to invalid creationDateSource", buf, 2u);
          }
          id v16 = *(void **)(a1 + 40);
          id v17 = [v14 uuid];
          [v16 setObject:&unk_1F28D1158 forKeyedSubscript:v17];

          id v7 = v10;
          [v10 addObject:v14];
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v86 objects:v95 count:16];
    }
    while (v11);
  }

  if ([v7 count])
  {
    uint64_t v18 = [v8 arrayByExcludingObjectsInArray:v7];

    id v8 = (id)v18;
  }
  v65 = v8;
  id v19 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(a1 + 56)];
  if ([v19 containsObject:v64])
  {
    id v20 = +[PGGraphMomentNodeCollection momentNodeForUUID:*(void *)(a1 + 56) inGraph:*(void *)(a1 + 64)];
    id v21 = [PGShareBackSuggesterResult alloc];
    uint64_t v22 = [v20 temporarySet];
    uint64_t v23 = 128;
    uint64_t v24 = [(PGShareBackSuggesterResult *)v21 initWithInputs:v65 processingValue:128 momentNodes:v22];

    v67 = (void *)v24;
    if (v24)
    {
      id v25 = 0;
LABEL_29:
      uint64_t v37 = *(void **)(a1 + 88);
      uint64_t v38 = *(void *)(a1 + 96);
      id v80 = 0;
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __105__PGSyndicationProcessor_processSyndicatedAssetGuestInferenceWithError_progressBlock_shareBackSuggester___block_invoke_304;
      v76[3] = &unk_1E68F03F8;
      uint64_t v39 = *(void *)(a1 + 104);
      id v77 = *(id *)(a1 + 112);
      uint64_t v79 = *(void *)(a1 + 144);
      long long v78 = *(_OWORD *)(a1 + 120);
      id v40 = [v37 duplicateAssetUUIDsForSuggesterResult:v67 assetsInferredAsGuestAsset:v38 syndicationLibrary:v39 error:&v80 progressBlock:v76];
      obuint64_t j = v80;
      if (v40)
      {
        id v63 = v25;
        uint64_t v60 = v19;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v41 = v65;
        uint64_t v42 = [v41 countByEnumeratingWithState:&v72 objects:v91 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v73;
          do
          {
            for (uint64_t j = 0; j != v43; ++j)
            {
              if (*(void *)v73 != v44) {
                objc_enumerationMutation(v41);
              }
              id v46 = *(void **)(*((void *)&v72 + 1) + 8 * j);
              id v47 = [v46 uuid];
              if ([v40 containsObject:v47])
              {
                [*(id *)(a1 + 40) setObject:&unk_1F28D1170 forKeyedSubscript:v47];
              }
              else
              {
                [*(id *)(a1 + 96) addObject:v46];
                id v48 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v67, "processingValue"));
                [*(id *)(a1 + 40) setObject:v48 forKeyedSubscript:v47];
              }
            }
            uint64_t v43 = [v41 countByEnumeratingWithState:&v72 objects:v91 count:16];
          }
          while (v43);
        }

        id v19 = v60;
        id v25 = v63;
      }
      else
      {
        double v57 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v93 = obj;
          _os_log_impl(&dword_1D1805000, v57, OS_LOG_TYPE_DEFAULT, "Issue while running deduping, skipping processing for this batch: %@", buf, 0xCu);
        }
      }

LABEL_54:
      goto LABEL_55;
    }
  }
  else
  {
    uint64_t v23 = 0;
  }
  long long v26 = *(void **)(a1 + 72);
  uint64_t v27 = [*(id *)(a1 + 80) graph];
  id v85 = 0;
  uint64_t v28 = [v26 suggesterResultsForInputs:v65 inGraph:v27 error:&v85];
  id v25 = v85;

  if (v28)
  {
    uint64_t v29 = v19;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v30 = v28;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v81 objects:v94 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v82;
LABEL_21:
      uint64_t v34 = 0;
      while (1)
      {
        if (*(void *)v82 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v81 + 1) + 8 * v34);
        uint64_t v23 = [v35 processingValue];
        if ((v23 & 0x7EF0) != 0) {
          break;
        }
        if (v32 == ++v34)
        {
          uint64_t v32 = [v30 countByEnumeratingWithState:&v81 objects:v94 count:16];
          if (v32) {
            goto LABEL_21;
          }
          goto LABEL_27;
        }
      }
      id v36 = v35;

      id v19 = v29;
      v67 = v36;
      if (!v36) {
        goto LABEL_41;
      }
      goto LABEL_29;
    }
LABEL_27:

    id v19 = v29;
  }
LABEL_41:
  if (!v25)
  {
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    obuint64_t j = v65;
    uint64_t v49 = [obj countByEnumeratingWithState:&v68 objects:v90 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      int v61 = v19;
      uint64_t v51 = *(void *)v69;
      do
      {
        for (uint64_t k = 0; k != v50; ++k)
        {
          if (*(void *)v69 != v51) {
            objc_enumerationMutation(obj);
          }
          char v53 = *(void **)(*((void *)&v68 + 1) + 8 * k);
          v54 = [NSNumber numberWithUnsignedShort:v23];
          uint64_t v55 = *(void **)(a1 + 40);
          unint64_t v56 = [v53 uuid];
          [v55 setObject:v54 forKeyedSubscript:v56];
        }
        uint64_t v50 = [obj countByEnumeratingWithState:&v68 objects:v90 count:16];
      }
      while (v50);
      v67 = 0;
      id v25 = 0;
      id v19 = v61;
    }
    else
    {
      v67 = 0;
      id v25 = 0;
    }
    goto LABEL_54;
  }
  v67 = 0;
LABEL_55:
  if (*(void *)(a1 + 112))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v59 = *(void *)(*(void *)(a1 + 120) + 8);
    if (Current - *(double *)(v59 + 24) >= *(double *)(a1 + 144))
    {
      *(double *)(v59 + 24) = Current;
      buf[0] = 0;
      (*(void (**)(double))(*(void *)(a1 + 112) + 16))(*(double *)(*(void *)(*(void *)(a1 + 136) + 8)
                                                                                + 24)
                                                                    * 0.5 + 0.25);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) |= buf[0];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24)) {
        *a4 = 1;
      }
    }
  }
}

void __105__PGSyndicationProcessor_processSyndicatedAssetGuestInferenceWithError_progressBlock_shareBackSuggester___block_invoke_304(uint64_t a1, unsigned char *a2)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(0.25);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (BOOL)processSyndicatedAssetGuestInferenceWithError:(id *)a3 progressBlock:(id)a4
{
  return [(PGSyndicationProcessor *)self processSyndicatedAssetGuestInferenceWithError:a3 progressBlock:a4 shareBackSuggester:0];
}

- (BOOL)processSavedSyndicatedAssetsWithError:(id *)a3 progressBlock:(id)a4
{
  v108[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = _Block_copy(v6);
  uint64_t v98 = 0;
  v99 = &v98;
  uint64_t v100 = 0x2020000000;
  char v101 = 0;
  uint64_t v94 = 0;
  uint64_t v95 = (double *)&v94;
  uint64_t v96 = 0x2020000000;
  uint64_t v97 = 0;
  long long v74 = v6;
  if (v7
    && (double v8 = CFAbsoluteTimeGetCurrent(), v8 - v95[3] >= 0.01)
    && (v95[3] = v8,
        LOBYTE(v102) = 0,
        (*((void (**)(void *, int *, double))v7 + 2))(v7, &v102, 0.0),
        char v9 = *((unsigned char *)v99 + 24) | v102,
        (*((unsigned char *)v99 + 24) = v9) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      buf[0] = 0xB904000202;
      LOWORD(buf[1]) = 2080;
      *(void *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Syndication/PGSyndicationProcessor.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
    }
    BOOL v10 = 0;
  }
  else
  {
    uint64_t v11 = [(PGManagerWorkingContext *)self->_workingContext loggingConnection];
    long long v75 = [(PGSyndicationProcessor *)self syndicationPhotoLibraryWithError:a3];
    long long v73 = v11;
    if (v75)
    {
      v65 = a3;
      uint64_t v12 = v11;
      os_signpost_id_t v13 = os_signpost_id_generate(v12);
      uint64_t v14 = v12;
      id v15 = v14;
      os_signpost_id_t spid = v13;
      unint64_t v71 = v13 - 1;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        LOWORD(buf[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PGSyndicationSavedSyndicatedAssets", "", (uint8_t *)buf, 2u);
      }
      oslog = v15;

      mach_timebase_info info = 0;
      mach_timebase_info(&info);
      uint64_t v66 = mach_absolute_time();
      long long v72 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"additionalAttributes.syndicationIdentifier != nil"];
      id v16 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
      id v77 = [v16 librarySpecificFetchOptions];

      [v77 setInternalPredicate:v72];
      uint64_t v17 = *MEMORY[0x1E4F39458];
      v108[0] = *MEMORY[0x1E4F39458];
      uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:1];
      [v77 setFetchPropertySets:v18];

      [v77 setIncludeGuestAssets:0];
      id v19 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v77];
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v21 = v19;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v89 objects:v107 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v90;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v90 != v23) {
              objc_enumerationMutation(v21);
            }
            id v25 = [*(id *)(*((void *)&v89 + 1) + 8 * i) curationProperties];
            long long v26 = [v25 syndicationIdentifier];

            if ([v26 length]) {
              [v20 addObject:v26];
            }
          }
          uint64_t v22 = [v21 countByEnumeratingWithState:&v89 objects:v107 count:16];
        }
        while (v22);
      }

      if ([v20 count])
      {
        uint64_t v27 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"additionalAttributes.syndicationIdentifier IN %@", v20];
        long long v70 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForGuestAsset"), 1);
        long long v68 = [MEMORY[0x1E4F38EB8] filterPredicateToIncludeOnlyReceivedSyndicatedAssets];
        long long v69 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K >= %d", @"thumbnailIndex", *MEMORY[0x1E4F8ADE0]);
        uint64_t v28 = [v75 librarySpecificFetchOptions];
        uint64_t v106 = v17;
        uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];
        [v28 setFetchPropertySets:v29];

        id v30 = (void *)MEMORY[0x1E4F28BA0];
        v105[0] = v27;
        v105[1] = v70;
        v105[2] = v68;
        v105[3] = v69;
        uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:4];
        uint64_t v32 = [v30 andPredicateWithSubpredicates:v31];
        [v28 setInternalPredicate:v32];

        [v28 setIncludeGuestAssets:0];
        uint64_t v33 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v28];
        uint64_t v34 = [v33 count];
        BOOL v35 = os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT);
        if (v34)
        {
          if (v35)
          {
            LODWORD(buf[0]) = 134217984;
            *(void *)((char *)buf + 4) = v34;
            _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEFAULT, "PGSyndicationProcessor: Promoting %tu saved syndicated asset(s) as guest", (uint8_t *)buf, 0xCu);
          }
          unint64_t v36 = [v33 count];
          buf[0] = 0;
          buf[1] = buf;
          buf[2] = 0x2020000000;
          buf[3] = 0;
          if (v36)
          {
            uint64_t v37 = v27;
            double v38 = 1.0 / (double)v36;
            v80[0] = MEMORY[0x1E4F143A8];
            v80[1] = 3221225472;
            v80[2] = __78__PGSyndicationProcessor_processSavedSyndicatedAssetsWithError_progressBlock___block_invoke;
            v80[3] = &unk_1E68E67B0;
            unint64_t v86 = v36;
            id v81 = v33;
            long long v83 = buf;
            double v87 = v38;
            id v82 = v7;
            long long v84 = &v94;
            uint64_t v88 = 0x3F847AE147AE147BLL;
            id v85 = &v98;
            id v79 = 0;
            char v39 = [v75 performChangesAndWait:v80 error:&v79];
            id v40 = v79;
            if ((v39 & 1) == 0)
            {
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                int v102 = 138412290;
                v103[0] = v40;
                _os_log_error_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_ERROR, "PGSyndicationProcessor: Error saving guest asset to database: %@", (uint8_t *)&v102, 0xCu);
              }
              if (v65) {
                id *v65 = v40;
              }
            }

            uint64_t v27 = v37;
          }
          uint64_t v41 = mach_absolute_time();
          uint32_t numer = info.numer;
          uint32_t denom = info.denom;
          uint64_t v44 = oslog;
          id v45 = v44;
          if (v71 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
          {
            LOWORD(v102) = 0;
            _os_signpost_emit_with_name_impl(&dword_1D1805000, v45, OS_SIGNPOST_INTERVAL_END, spid, "PGSyndicationSavedSyndicatedAssets", "", (uint8_t *)&v102, 2u);
          }

          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            int v102 = 136315394;
            v103[0] = "PGSyndicationSavedSyndicatedAssets";
            LOWORD(v103[1]) = 2048;
            *(double *)((char *)&v103[1] + 2) = (float)((float)((float)((float)(v41 - v66) * (float)numer) / (float)denom)
                                                      / 1000000.0);
            _os_log_impl(&dword_1D1805000, v45, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v102, 0x16u);
          }
          if (v7
            && (double Current = CFAbsoluteTimeGetCurrent(), Current - v95[3] >= 0.01)
            && (v95[3] = Current,
                char v78 = 0,
                (*((void (**)(void *, char *, double))v7 + 2))(v7, &v78, 1.0),
                char v47 = *((unsigned char *)v99 + 24) | v78,
                (*((unsigned char *)v99 + 24) = v47) != 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              int v102 = 67109378;
              LODWORD(v103[0]) = 278;
              WORD2(v103[0]) = 2080;
              *(void *)((char *)v103 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysi"
                                              "s/PhotosGraph/Framework/Syndication/PGSyndicationProcessor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v102, 0x12u);
            }
            BOOL v10 = 0;
          }
          else
          {
            BOOL v10 = 1;
          }
          _Block_object_dispose(buf, 8);
        }
        else
        {
          if (v35)
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEFAULT, "PGSyndicationProcessor: No saved syndicated asset eligible for guest promoting", (uint8_t *)buf, 2u);
          }
          if (v7
            && (double v58 = CFAbsoluteTimeGetCurrent(), v58 - v95[3] >= 0.01)
            && (v95[3] = v58,
                LOBYTE(v102) = 0,
                (*((void (**)(void *, int *, double))v7 + 2))(v7, &v102, 1.0),
                char v59 = *((unsigned char *)v99 + 24) | v102,
                (*((unsigned char *)v99 + 24) = v59) != 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              buf[0] = 0xEF04000202;
              LOWORD(buf[1]) = 2080;
              *(void *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanal"
                                                 "ysis/PhotosGraph/Framework/Syndication/PGSyndicationProcessor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
            }
            BOOL v10 = 0;
          }
          else
          {
            uint64_t v60 = mach_absolute_time();
            uint32_t v62 = info.numer;
            uint32_t v61 = info.denom;
            id v63 = oslog;
            id v64 = v63;
            if (v71 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
            {
              LOWORD(buf[0]) = 0;
              _os_signpost_emit_with_name_impl(&dword_1D1805000, v64, OS_SIGNPOST_INTERVAL_END, spid, "PGSyndicationSavedSyndicatedAssets", "", (uint8_t *)buf, 2u);
            }

            BOOL v10 = 1;
            if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
            {
              LODWORD(buf[0]) = 136315394;
              *(void *)((char *)buf + 4) = "PGSyndicationSavedSyndicatedAssets";
              WORD2(buf[1]) = 2048;
              *(double *)((char *)&buf[1] + 6) = (float)((float)((float)((float)(v60 - v66) * (float)v62) / (float)v61)
                                                       / 1000000.0);
              _os_log_impl(&dword_1D1805000, v64, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)buf, 0x16u);
            }
          }
        }
      }
      else
      {
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEFAULT, "PGSyndicationProcessor: No saved asset with syndication identifiers", (uint8_t *)buf, 2u);
        }
        if (v7
          && (double v50 = CFAbsoluteTimeGetCurrent(), v50 - v95[3] >= 0.01)
          && (v95[3] = v50,
              LOBYTE(v102) = 0,
              (*((void (**)(void *, int *, double))v7 + 2))(v7, &v102, 1.0),
              char v51 = *((unsigned char *)v99 + 24) | v102,
              (*((unsigned char *)v99 + 24) = v51) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            buf[0] = 0xDA04000202;
            LOWORD(buf[1]) = 2080;
            *(void *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalys"
                                               "is/PhotosGraph/Framework/Syndication/PGSyndicationProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
          }
          BOOL v10 = 0;
        }
        else
        {
          uint64_t v53 = mach_absolute_time();
          uint32_t v55 = info.numer;
          uint32_t v54 = info.denom;
          unint64_t v56 = oslog;
          double v57 = v56;
          if (v71 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
          {
            LOWORD(buf[0]) = 0;
            _os_signpost_emit_with_name_impl(&dword_1D1805000, v57, OS_SIGNPOST_INTERVAL_END, spid, "PGSyndicationSavedSyndicatedAssets", "", (uint8_t *)buf, 2u);
          }

          BOOL v10 = 1;
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf[0]) = 136315394;
            *(void *)((char *)buf + 4) = "PGSyndicationSavedSyndicatedAssets";
            WORD2(buf[1]) = 2048;
            *(double *)((char *)&buf[1] + 6) = (float)((float)((float)((float)(v53 - v66) * (float)v55) / (float)v54)
                                                     / 1000000.0);
            _os_log_impl(&dword_1D1805000, v57, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)buf, 0x16u);
          }
        }
      }
    }
    else
    {
      if (v7)
      {
        double v48 = CFAbsoluteTimeGetCurrent();
        if (v48 - v95[3] >= 0.01)
        {
          v95[3] = v48;
          LOBYTE(v102) = 0;
          (*((void (**)(void *, int *, double))v7 + 2))(v7, &v102, 1.0);
          char v49 = *((unsigned char *)v99 + 24) | v102;
          *((unsigned char *)v99 + 24) = v49;
          if (v49)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              buf[0] = 0xBF04000202;
              LOWORD(buf[1]) = 2080;
              *(void *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanal"
                                                 "ysis/PhotosGraph/Framework/Syndication/PGSyndicationProcessor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
            }
          }
        }
      }
      BOOL v10 = 0;
    }
  }
  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v98, 8);

  return v10;
}

void __78__PGSyndicationProcessor_processSavedSyndicatedAssetsWithError_progressBlock___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 72))
  {
    uint64_t v2 = 0;
    uint64_t v3 = *MEMORY[0x1E4F39588];
    while (1)
    {
      id v4 = (void *)MEMORY[0x1D25FED50]();
      uint64_t v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v2];
      id v6 = [MEMORY[0x1E4F38ED0] changeRequestForAsset:v5];
      [v6 setSyndicationProcessingValue:4096];
      [v6 setSyndicationProcessingVersion:v3];
      [v6 promoteToGuestAsset];
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(a1 + 80)
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 24);
      if (*(void *)(a1 + 40))
      {
        double Current = CFAbsoluteTimeGetCurrent();
        uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
        if (Current - *(double *)(v8 + 24) >= *(double *)(a1 + 88))
        {
          *(double *)(v8 + 24) = Current;
          (*(void (**)(double))(*(void *)(a1 + 40) + 16))(*(double *)(*(void *)(*(void *)(a1 + 48)
                                                                                               + 8)
                                                                                   + 24));
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                + 24);
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
            break;
          }
        }
      }

      if ((unint64_t)++v2 >= *(void *)(a1 + 72)) {
        return;
      }
    }
  }
}

- (void)_persistCurationScores:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [(PGManagerWorkingContext *)self->_workingContext loggingConnection];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__PGSyndicationProcessor__persistCurationScores_inPhotoLibrary___block_invoke;
    v12[3] = &unk_1E68F0B18;
    id v13 = v6;
    id v11 = 0;
    char v9 = [v7 performChangesAndWait:v12 error:&v11];
    id v10 = v11;
    if ((v9 & 1) == 0 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v10;
      _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "PGSyndicationProcessor: Error saving curation scores to database: %@", buf, 0xCu);
    }
  }
}

uint64_t __64__PGSyndicationProcessor__persistCurationScores_inPhotoLibrary___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_17103];
}

void __64__PGSyndicationProcessor__persistCurationScores_inPhotoLibrary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4F38ED0];
  id v5 = a3;
  id v6 = a2;
  id v9 = [v4 changeRequestForAsset:v6];
  [v5 doubleValue];
  double v8 = v7;

  [v9 setCurationScore:v8];
  LODWORD(v4) = [v6 isGuestAsset];

  if (v4 && v8 <= *MEMORY[0x1E4F8E750]) {
    [v9 resetGuestAssetPromotion];
  }
}

- (BOOL)processSyndicatedAssetCurationWithError:(id *)a3 progressBlock:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v6);
  double v8 = 0.0;
  if (v7)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      LOBYTE(info.numer) = 0;
      v7[2](v7, &info, 0.0);
      if (LOBYTE(info.numer))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)id v63 = 87;
          *(_WORD *)&v63[4] = 2080;
          *(void *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Syndication/PGSyndicationProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        BOOL v10 = 0;
        goto LABEL_61;
      }
      double v8 = Current;
    }
  }
  id v11 = [(PGManagerWorkingContext *)self->_workingContext loggingConnection];
  uint64_t v12 = [(PGSyndicationProcessor *)self syndicationPhotoLibraryWithError:a3];
  id v13 = v12;
  if (!v12)
  {
    if (v7)
    {
      if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
      {
        LOBYTE(info.numer) = 0;
        v7[2](v7, &info, 1.0);
        if (LOBYTE(info.numer))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)id v63 = 93;
            *(_WORD *)&v63[4] = 2080;
            *(void *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Syndication/PGSyndicationProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    BOOL v10 = 0;
    goto LABEL_60;
  }
  uint64_t v14 = [v12 librarySpecificFetchOptions];
  id v15 = [MEMORY[0x1E4F8E7A8] internalPredicateToFilterSyndicatedAssetsEligibleForCurationProcessing];
  [v14 setInternalPredicate:v15];

  uint64_t v16 = +[PGCurationManager assetPropertySetsForCuration];
  [v14 setFetchPropertySets:v16];

  [v14 setIncludeGuestAssets:1];
  uint64_t v17 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v14];
  unint64_t v18 = [v17 count];
  BOOL v19 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v18)
  {
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_DEFAULT, "PGSyndicationProcessor: No asset eligible for curation processing", buf, 2u);
    }
    if (v7
      && CFAbsoluteTimeGetCurrent() - v8 >= 0.01
      && (LOBYTE(info.numer) = 0, v7[2](v7, &info, 1.0), LOBYTE(info.numer)))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)id v63 = 106;
        *(_WORD *)&v63[4] = 2080;
        *(void *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Syndication/PGSyndicationProcessor.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      BOOL v10 = 0;
    }
    else
    {
      BOOL v10 = 1;
    }
    goto LABEL_59;
  }
  if (v19)
  {
    *(_DWORD *)buf = 134217984;
    *(void *)id v63 = v18;
    _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_DEFAULT, "PGSyndicationProcessor: %tu asset(s) eligible for curation processing", buf, 0xCu);
  }
  char v51 = v14;
  double v52 = v11;
  id v53 = v6;
  id v20 = v11;
  os_signpost_id_t v21 = os_signpost_id_generate(v20);
  uint64_t v22 = v20;
  uint64_t v23 = v22;
  unint64_t v49 = v21 - 1;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PGSyndicationProcessorAssetCuration", "", buf, 2u);
  }
  os_signpost_id_t spid = v21;
  double v50 = v23;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v48 = mach_absolute_time();
  double v58 = (void *)[objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v13];
  double v24 = 1.0 / (double)v18;
  double v57 = [v17 fetchedObjects];
  unint64_t v25 = 0;
  double v26 = *MEMORY[0x1E4F8E750];
  double v27 = 0.0;
  uint32_t v55 = self;
  unint64_t v56 = v13;
  unint64_t v54 = v18;
  while (1)
  {
    context = (void *)MEMORY[0x1D25FED50]();
    unint64_t v28 = v25 + 200;
    uint64_t v29 = v25 + 200 <= v18 ? 200 : v18 - v25;
    id v30 = objc_msgSend(v57, "subarrayWithRange:", v25, v29);
    uint64_t v31 = [MEMORY[0x1E4F1CA60] dictionary];
    [MEMORY[0x1E4F38EB8] prefetchOnAssets:v30 options:13 curationContext:v58];
    if ([v30 count]) {
      break;
    }
LABEL_28:
    id v13 = v56;
    [(PGSyndicationProcessor *)v55 _persistCurationScores:v31 inPhotoLibrary:v56];

    unint64_t v25 = v28;
    unint64_t v18 = v54;
    if (v28 >= v54)
    {
      uint64_t v40 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      uint64_t v43 = v50;
      uint64_t v44 = v50;
      id v45 = v44;
      if (v49 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v45, OS_SIGNPOST_INTERVAL_END, spid, "PGSyndicationProcessorAssetCuration", "", buf, 2u);
      }

      uint64_t v14 = v51;
      id v11 = v52;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)id v63 = "PGSyndicationProcessorAssetCuration";
        *(_WORD *)&v63[8] = 2048;
        *(double *)&v63[10] = (float)((float)((float)((float)(v40 - v48) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v45, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      if (v7)
      {
        id v6 = v53;
        if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01 && (char v60 = 0, v7[2](v7, (mach_timebase_info *)&v60, 1.0), v60))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)id v63 = 154;
            *(_WORD *)&v63[4] = 2080;
            *(void *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Syndication/PGSyndicationProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          BOOL v10 = 0;
        }
        else
        {
          BOOL v10 = 1;
        }
      }
      else
      {
        BOOL v10 = 1;
        id v6 = v53;
      }
      goto LABEL_49;
    }
  }
  uint64_t v32 = 0;
  while (1)
  {
    uint64_t v33 = (void *)MEMORY[0x1D25FED50]();
    uint64_t v34 = [v30 objectAtIndexedSubscript:v32];
    BOOL v35 = [v34 curationModel];
    char v36 = [v35 isUtilityForSyndicationWithAsset:v34];
    double v37 = v26;
    if ((v36 & 1) == 0) {
      objc_msgSend(v34, "scoreInContext:", 0, v26);
    }
    double v38 = [NSNumber numberWithDouble:v37];
    [v31 setObject:v38 forKeyedSubscript:v34];

    double v27 = v24 + v27;
    if (!v7) {
      goto LABEL_27;
    }
    double v39 = CFAbsoluteTimeGetCurrent();
    if (v39 - v8 < 0.01) {
      goto LABEL_27;
    }
    char v60 = 0;
    v7[2](v7, (mach_timebase_info *)&v60, v27);
    if (v60) {
      break;
    }
    double v8 = v39;
LABEL_27:

    if (++v32 >= (unint64_t)[v30 count]) {
      goto LABEL_28;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)id v63 = 147;
    *(_WORD *)&v63[4] = 2080;
    *(void *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Syndication/PGSyndicationProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }

  BOOL v10 = 0;
  id v11 = v52;
  id v6 = v53;
  id v13 = v56;
  uint64_t v14 = v51;
  uint64_t v43 = v50;
LABEL_49:

LABEL_59:
LABEL_60:

LABEL_61:
  return v10;
}

- (id)syndicationPhotoLibraryWithError:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  syndicationLibrary = self->_syndicationLibrary;
  if (syndicationLibrary) {
    goto LABEL_12;
  }
  id v14 = 0;
  id v6 = [MEMORY[0x1E4F39228] openPhotoLibraryWithWellKnownIdentifier:3 error:&v14];
  id v7 = v14;
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    uint64_t v12 = self->_syndicationLibrary;
    self->_syndicationLibrary = v6;

    syndicationLibrary = self->_syndicationLibrary;
LABEL_12:
    id v11 = syndicationLibrary;
    goto LABEL_13;
  }
  id v9 = v7;
  BOOL v10 = [(PGManagerWorkingContext *)self->_workingContext loggingConnection];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v9;
    _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "PGSyndicationProcessor: Failed to open syndicated library: %@", buf, 0xCu);
  }

  if (a3) {
    *a3 = v9;
  }

  id v11 = 0;
LABEL_13:
  return v11;
}

- (PGSyndicationProcessor)initWithWorkingContext:(id)a3 syndicationLibrary:(id)a4
{
  id v7 = a4;
  BOOL v8 = [(PGSyndicationProcessor *)self initWithWorkingContext:a3];
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_syndicationLibrary, a4);
  }

  return v9;
}

- (PGSyndicationProcessor)initWithWorkingContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGSyndicationProcessor;
  id v6 = [(PGSyndicationProcessor *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workingContext, a3);
    BOOL v8 = (CLSCurationSession *)objc_alloc_init(MEMORY[0x1E4F8E778]);
    curationSession = v7->_curationSession;
    v7->_curationSession = v8;
  }
  return v7;
}

@end
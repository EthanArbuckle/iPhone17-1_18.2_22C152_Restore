@interface PGBehavioralScoreProcessor
+ (id)assetPropertySetsForUserBehavioralProcessing;
- (BOOL)needBehavioralScoreReprocessingUsingCurrentGoldAssetsUUIDs:(id)a3 previousGoldAssetUUIDs:(id)a4;
- (NSDictionary)algorithmData;
- (NSSet)previousGoldAssetUUIDs;
- (PGBehavioralScoreProcessor)initWithGraphManager:(id)a3 algorithm:(int64_t)a4;
- (PGGraph)graph;
- (float)behavioralScoreFromBaseScore:(float)a3 semanticScore:(float)a4;
- (float)semanticScoreFromBehavioralScore:(float)a3;
- (id)_behavioralProcessorForAlgorithm:(int64_t)a3 goldAssets:(id)a4 graph:(id)a5 persistedData:(id)a6;
- (id)_newBehavioralProcessorForAlgorithm:(int64_t)a3 goldAssets:(id)a4 graph:(id)a5;
- (id)_previousResults;
- (id)behavioralScoreByAssetUUIDForAssets:(id)a3 algorithmProcessor:(id)a4 personalHighAestheticsThreshold:(double)a5 personalGoodAestheticsThreshold:(double)a6;
- (id)goldAssetUUIDs;
- (id)peopleFeatures;
- (id)sceneFeatures;
- (int64_t)algorithm;
- (void)_persistNewGoldAssetsUUIDs:(id)a3 processorData:(id)a4;
- (void)_writeBehavioralScoresToPhotosDatabase:(id)a3 assets:(id)a4;
- (void)processBehavioralScoresWithProgressBlock:(id)a3;
- (void)setAlgorithm:(int64_t)a3;
- (void)setAlgorithmData:(id)a3;
- (void)setGraph:(id)a3;
- (void)setPreviousGoldAssetUUIDs:(id)a3;
@end

@implementation PGBehavioralScoreProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithmData, 0);
  objc_storeStrong((id *)&self->_previousGoldAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)setAlgorithmData:(id)a3
{
}

- (NSDictionary)algorithmData
{
  return self->_algorithmData;
}

- (void)setAlgorithm:(int64_t)a3
{
  self->_algorithm = a3;
}

- (int64_t)algorithm
{
  return self->_algorithm;
}

- (void)setPreviousGoldAssetUUIDs:(id)a3
{
}

- (NSSet)previousGoldAssetUUIDs
{
  return self->_previousGoldAssetUUIDs;
}

- (void)setGraph:(id)a3
{
}

- (PGGraph)graph
{
  return self->_graph;
}

- (float)semanticScoreFromBehavioralScore:(float)a3
{
  return fmodf(a3, 0.1) * 100.0;
}

- (float)behavioralScoreFromBaseScore:(float)a3 semanticScore:(float)a4
{
  return (float)(a4 * 0.01) + a3;
}

- (id)behavioralScoreByAssetUUIDForAssets:(id)a3 algorithmProcessor:(id)a4 personalHighAestheticsThreshold:(double)a5 personalGoodAestheticsThreshold:(double)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = [MEMORY[0x1E4F1CA60] dictionary];
  context = (void *)MEMORY[0x1D25FED50]();
  v13 = [v11 semanticScoreByAssetUUIDForAssets:v10];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v20 = [v19 uuid];
        [v19 clsAestheticScore];
        if (v21 >= a6)
        {
          double v22 = v21;
          v23 = [v13 objectForKeyedSubscript:v20];
          [v23 floatValue];
          float v25 = v24;

          LODWORD(v27) = 1036831949;
          if (v25 >= 0.2)
          {
            if (v22 < a5 || (LODWORD(v27) = 1063675494, v25 < 0.7))
            {
              BOOL v28 = v25 < 0.7 && v22 < a5;
              LODWORD(v27) = 0.5;
              if (!v28) {
                *(float *)&double v27 = 0.7;
              }
            }
          }
          v29 = NSNumber;
          *(float *)&double v26 = v25;
          [(PGBehavioralScoreProcessor *)self behavioralScoreFromBaseScore:v27 semanticScore:v26];
          v30 = objc_msgSend(v29, "numberWithFloat:");
          [v12 setObject:v30 forKeyedSubscript:v20];
        }
        else
        {
          [v12 setObject:&unk_1F28D5A98 forKeyedSubscript:v20];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v16);
  }

  return v12;
}

- (id)_behavioralProcessorForAlgorithm:(int64_t)a3 goldAssets:(id)a4 graph:(id)a5 persistedData:(id)a6
{
  if (a3 == 1)
  {
    id v8 = a6;
    id v9 = a4;
    id v10 = [[PGAssetFeatureBehavioralProcessor alloc] initWithGoldAssets:v9 persistedData:v8 loggingConnection:self->_loggingConnection];
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (id)_newBehavioralProcessorForAlgorithm:(int64_t)a3 goldAssets:(id)a4 graph:(id)a5
{
  if (a3 != 1) {
    return 0;
  }
  id v6 = a4;
  v7 = [[PGAssetFeatureBehavioralProcessor alloc] initWithGoldAssets:v6 loggingConnection:self->_loggingConnection];

  return v7;
}

- (BOOL)needBehavioralScoreReprocessingUsingCurrentGoldAssetsUUIDs:(id)a3 previousGoldAssetUUIDs:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    uint64_t v7 = [v6 count];
    if (v7 == [v5 count])
    {
      id v8 = [MEMORY[0x1E4F1CA80] setWithSet:v5];
      [v8 intersectSet:v6];
      double v9 = (double)(unint64_t)[v8 count];
      double v10 = v9 / (double)(unint64_t)[v5 count];
      id v11 = +[PGLogging sharedLogging];
      v12 = [v11 loggingConnection];

      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
      BOOL v14 = v10 < 0.9;
      if (v10 >= 0.9)
      {
        if (v13)
        {
          int v18 = 134217984;
          double v19 = v10;
          uint64_t v15 = "Behavioral Score  Processor: no need for behavioralScore reprocessing (%f gold assets are in common with"
                " previous iteration)";
          goto LABEL_10;
        }
      }
      else if (v13)
      {
        int v18 = 134217984;
        double v19 = v10;
        uint64_t v15 = "Behavioral Score  Processor: need behavioralScore reprocessing because only %f gold assets are in common w"
              "ith previous iteration";
LABEL_10:
        _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v18, 0xCu);
      }

      goto LABEL_12;
    }
  }
  uint64_t v16 = +[PGLogging sharedLogging];
  id v8 = [v16 loggingConnection];

  BOOL v14 = 1;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_INFO, "Behavioral Score Processor: need behavioral score reprocessing", (uint8_t *)&v18, 2u);
  }
LABEL_12:

  return v14;
}

- (void)_writeBehavioralScoresToPhotosDatabase:(id)a3 assets:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D25FED50]();
  photoLibrary = self->_photoLibrary;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__PGBehavioralScoreProcessor__writeBehavioralScoresToPhotosDatabase_assets___block_invoke;
  v16[3] = &unk_1E68EED30;
  id v10 = v7;
  id v17 = v10;
  id v11 = v6;
  id v18 = v11;
  id v15 = 0;
  [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v16 error:&v15];
  id v12 = v15;
  if (v12)
  {
    BOOL v13 = +[PGLogging sharedLogging];
    BOOL v14 = [v13 loggingConnection];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v12;
      _os_log_error_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "Behavioral Score Processor: Error saving behavioral scores to database: %@", buf, 0xCu);
    }
  }
}

void __76__PGBehavioralScoreProcessor__writeBehavioralScoresToPhotosDatabase_assets___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v8 = *(void **)(a1 + 40);
        double v9 = objc_msgSend(v7, "uuid", (void)v12);
        id v10 = [v8 objectForKeyedSubscript:v9];

        id v11 = [MEMORY[0x1E4F38ED0] changeRequestForAsset:v7];
        [v10 floatValue];
        objc_msgSend(v11, "setBehavioralScore:");
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

- (void)processBehavioralScoresWithProgressBlock:(id)a3
{
  v193[2] = *MEMORY[0x1E4F143B8];
  id v161 = a3;
  uint64_t v186 = 0;
  v187 = &v186;
  uint64_t v188 = 0x2020000000;
  char v189 = 0;
  uint64_t v182 = 0;
  v183 = (double *)&v182;
  uint64_t v184 = 0x2020000000;
  uint64_t v185 = 0;
  v167 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v161);
  if (!v167
    || (double v4 = CFAbsoluteTimeGetCurrent(), v4 - v183[3] < 0.01)
    || (v183[3] = v4,
        LOBYTE(info.numer) = 0,
        v167[2](v167, &info, 0.0),
        char v5 = *((unsigned char *)v187 + 24) | LOBYTE(info.numer),
        (*((unsigned char *)v187 + 24) = v5) == 0))
  {
    v163 = [(id)objc_opt_class() assetPropertySetsForUserBehavioralProcessing];
    v165 = self;
    id v6 = self->_loggingConnection;
    os_signpost_id_t v7 = os_signpost_id_generate((os_log_t)v6);
    id v8 = v6;
    double v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "BehavioralFetchGoldAssets", "", buf, 2u);
    }
    v162 = v9;

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v10 = mach_absolute_time();
    v166 = [(PHPhotoLibrary *)v165->_photoLibrary librarySpecificFetchOptions];
    [v166 setFetchLimit:500];
    [v166 addFetchPropertySets:v163];
    id v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"computedAttributes.interactionScore > %f", 0x3FC99999A0000000);
    [v166 setInternalPredicate:v11];

    long long v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"computedAttributes.interactionScore" ascending:0];
    v193[0] = v12;
    long long v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
    v193[1] = v13;
    long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v193 count:2];
    [v166 setInternalSortDescriptors:v14];

    long long v15 = [MEMORY[0x1E4F38EB8] fetchAssetsForBehavioralCurationWithOptions:v166];
    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    v160 = v15;
    uint64_t v17 = [v15 fetchedObjects];
    v164 = [v16 setWithArray:v17];

    id v18 = +[PGLogging sharedLogging];
    double v19 = [v18 loggingConnection];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = [v164 count];
      *(_DWORD *)buf = 134217984;
      *(void *)v192 = v20;
      _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "Behavioral Score Processor: fetched %lu gold assets", buf, 0xCu);
    }

    if (v167)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v183[3] >= 0.01)
      {
        v183[3] = Current;
        LOBYTE(v176.numer) = 0;
        v167[2](v167, &v176, 0.1);
        char v22 = *((unsigned char *)v187 + 24) | LOBYTE(v176.numer);
        *((unsigned char *)v187 + 24) = v22;
        if (v22)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
LABEL_164:

            goto LABEL_165;
          }
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v192 = 231;
          *(_WORD *)&v192[4] = 2080;
          *(void *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/UserBehavior/PGBehavioralScoreProcessor.m";
          v23 = MEMORY[0x1E4F14500];
LABEL_59:
          _os_log_impl(&dword_1D1805000, v23, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_164;
        }
      }
    }
    uint64_t v24 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    double v27 = v162;
    BOOL v28 = v27;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v28, OS_SIGNPOST_INTERVAL_END, v7, "BehavioralFetchGoldAssets", "", buf, 2u);
    }

    v29 = v28;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v192 = "BehavioralFetchGoldAssets";
      *(_WORD *)&v192[8] = 2048;
      *(double *)&v192[10] = (float)((float)((float)((float)(v24 - v10) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    if (![v164 count])
    {
      v61 = +[PGLogging sharedLogging];
      v62 = [v61 loggingConnection];

      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, v62, OS_LOG_TYPE_INFO, "Behavioral Score Processor: early abort due to no gold assets.", buf, 2u);
      }

      if (!v167) {
        goto LABEL_164;
      }
      double v63 = CFAbsoluteTimeGetCurrent();
      if (v63 - v183[3] < 0.01) {
        goto LABEL_164;
      }
      v183[3] = v63;
      LOBYTE(v176.numer) = 0;
      v167[2](v167, &v176, 1.0);
      char v64 = *((unsigned char *)v187 + 24) | LOBYTE(v176.numer);
      *((unsigned char *)v187 + 24) = v64;
      if (!v64 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_164;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v192 = 238;
      *(_WORD *)&v192[4] = 2080;
      *(void *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/UserBehavior/PGBehavioralScoreProcessor.m";
      v23 = MEMORY[0x1E4F14500];
      goto LABEL_59;
    }
    v30 = [MEMORY[0x1E4F1CA80] set];
    long long v179 = 0u;
    long long v180 = 0u;
    long long v177 = 0u;
    long long v178 = 0u;
    id v31 = v164;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v177 objects:v190 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v178;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v178 != v33) {
            objc_enumerationMutation(v31);
          }
          long long v35 = [*(id *)(*((void *)&v177 + 1) + 8 * i) uuid];
          [v30 addObject:v35];
        }
        uint64_t v32 = [v31 countByEnumeratingWithState:&v177 objects:v190 count:16];
      }
      while (v32);
    }

    if (v167)
    {
      double v36 = CFAbsoluteTimeGetCurrent();
      if (v36 - v183[3] >= 0.01)
      {
        v183[3] = v36;
        LOBYTE(v176.numer) = 0;
        v167[2](v167, &v176, 0.15);
        char v37 = *((unsigned char *)v187 + 24) | LOBYTE(v176.numer);
        *((unsigned char *)v187 + 24) = v37;
        if (v37)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v192 = 254;
            *(_WORD *)&v192[4] = 2080;
            *(void *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/UserBehavior/PGBehavioralScoreProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_163;
        }
      }
    }
    uint64_t v38 = v165->_loggingConnection;
    os_signpost_id_t v39 = os_signpost_id_generate(v38);
    v40 = v38;
    v41 = v40;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "BehavioralCheckIfNeedReprocessing", "", buf, 2u);
    }

    mach_timebase_info v176 = 0;
    mach_timebase_info(&v176);
    uint64_t v42 = mach_absolute_time();
    BOOL v43 = [(PGBehavioralScoreProcessor *)v165 needBehavioralScoreReprocessingUsingCurrentGoldAssetsUUIDs:v30 previousGoldAssetUUIDs:v165->_previousGoldAssetUUIDs];
    uint64_t v44 = mach_absolute_time();
    mach_timebase_info v45 = v176;
    v46 = v41;
    v47 = v46;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v47, OS_SIGNPOST_INTERVAL_END, v39, "BehavioralCheckIfNeedReprocessing", "", buf, 2u);
    }

    v48 = v47;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v192 = "BehavioralCheckIfNeedReprocessing";
      *(_WORD *)&v192[8] = 2048;
      *(double *)&v192[10] = (float)((float)((float)((float)(v44 - v42) * (float)v45.numer) / (float)v45.denom)
                                   / 1000000.0);
      _os_log_impl(&dword_1D1805000, v48, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v153 = v48;

    if (v43)
    {
      v49 = v165->_loggingConnection;
      os_signpost_id_t v50 = os_signpost_id_generate(v49);
      v51 = v49;
      v52 = v51;
      if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v52, OS_SIGNPOST_INTERVAL_BEGIN, v50, "BehavioralResetScoreOfAllLibrary", "", buf, 2u);
      }
      v156 = v52;

      mach_timebase_info v175 = 0;
      mach_timebase_info(&v175);
      uint64_t v158 = mach_absolute_time();
      v53 = [(PHPhotoLibrary *)v165->_photoLibrary librarySpecificFetchOptions];
      [v53 addFetchPropertySets:v163];
      v54 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"computedAttributes.behavioralScore > %f", 0);
      [v53 setInternalPredicate:v54];

      [v53 setCacheSizeForFetch:100];
      [v53 setChunkSizeForFetch:100];
      v55 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v53];
      v154 = v55;
      if (v167
        && (double v56 = CFAbsoluteTimeGetCurrent(), v56 - v183[3] >= 0.01)
        && (v183[3] = v56,
            char v174 = 0,
            v167[2](v167, (mach_timebase_info *)&v174, 0.2),
            char v57 = *((unsigned char *)v187 + 24) | v174,
            (*((unsigned char *)v187 + 24) = v57) != 0))
      {
        v58 = MEMORY[0x1E4F14500];
        id v59 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v192 = 280;
          *(_WORD *)&v192[4] = 2080;
          *(void *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/UserBehavior/PGBehavioralScoreProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }

        id v159 = 0;
        int v60 = 1;
      }
      else
      {
        uint64_t v65 = [v55 count];
        v66 = +[PGLogging sharedLogging];
        v67 = [v66 loggingConnection];

        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)v192 = v65;
          _os_log_impl(&dword_1D1805000, v67, OS_LOG_TYPE_INFO, "Behavioral Score Processor: start reset behavioral score of %lu assets", buf, 0xCu);
        }

        uint64_t v68 = [(PHPhotoLibrary *)v165->_photoLibrary assetsdClient];
        v69 = [(id)v68 libraryInternalClient];

        id v173 = 0;
        LOBYTE(v68) = [v69 invalidateBehavioralScoreOnAllAssetsWithError:&v173];
        id v151 = v173;
        if (v68)
        {
          v70 = +[PGLogging sharedLogging];
          v71 = [v70 loggingConnection];

          if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1805000, v71, OS_LOG_TYPE_INFO, "Behavioral Score Processor: successful reset behavioral score", buf, 2u);
          }

          uint64_t v72 = mach_absolute_time();
          uint32_t v73 = v175.numer;
          uint32_t v74 = v175.denom;
          v75 = v156;
          v76 = v75;
          if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D1805000, v76, OS_SIGNPOST_INTERVAL_END, v50, "BehavioralResetScoreOfAllLibrary", "", buf, 2u);
          }

          v77 = v76;
          if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)v192 = "BehavioralResetScoreOfAllLibrary";
            *(_WORD *)&v192[8] = 2048;
            *(double *)&v192[10] = (float)((float)((float)((float)(v72 - v158) * (float)v73) / (float)v74) / 1000000.0);
            _os_log_impl(&dword_1D1805000, v77, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
          }

          id v159 = [(PGBehavioralScoreProcessor *)v165 _newBehavioralProcessorForAlgorithm:v165->_algorithm goldAssets:v31 graph:v165->_graph];
          v168[0] = MEMORY[0x1E4F143A8];
          v168[1] = 3221225472;
          v168[2] = __71__PGBehavioralScoreProcessor_processBehavioralScoresWithProgressBlock___block_invoke;
          v168[3] = &unk_1E68F03F8;
          v169 = v167;
          v170 = &v182;
          v171 = &v186;
          uint64_t v172 = 0x3F847AE147AE147BLL;
          [v159 preprocessWithProgressBlock:v168];
          if (*((unsigned char *)v187 + 24))
          {
            v78 = MEMORY[0x1E4F14500];
            id v79 = MEMORY[0x1E4F14500];
            int v60 = 1;
            if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v192 = 305;
              *(_WORD *)&v192[4] = 2080;
              *(void *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/UserBehavior/PGBehavioralScoreProcessor.m";
              _os_log_impl(&dword_1D1805000, v78, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
          else
          {
            v78 = [v159 dataToPersist];
            [(PGBehavioralScoreProcessor *)v165 _persistNewGoldAssetsUUIDs:v30 processorData:v78];
            int v60 = 0;
          }
        }
        else
        {
          v80 = +[PGLogging sharedLogging];
          v81 = [v80 loggingConnection];

          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v192 = v151;
            _os_log_error_impl(&dword_1D1805000, v81, OS_LOG_TYPE_ERROR, "Behavioral Score Processor: aborting due to error resetting behavioral scores: %@", buf, 0xCu);
          }

          if (v167)
          {
            double v82 = CFAbsoluteTimeGetCurrent();
            if (v82 - v183[3] >= 0.01)
            {
              v183[3] = v82;
              char v174 = 0;
              v167[2](v167, (mach_timebase_info *)&v174, 1.0);
              char v83 = *((unsigned char *)v187 + 24) | v174;
              *((unsigned char *)v187 + 24) = v83;
              if (v83)
              {
                v84 = MEMORY[0x1E4F14500];
                id v85 = MEMORY[0x1E4F14500];
                if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v192 = 290;
                  *(_WORD *)&v192[4] = 2080;
                  *(void *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/UserBehavior/PGBehavioralScoreProcessor.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
              }
            }
          }
          id v159 = 0;
          int v60 = 1;
        }
      }
      if (v60) {
        goto LABEL_161;
      }
    }
    else
    {
      id v159 = [(PGBehavioralScoreProcessor *)v165 _behavioralProcessorForAlgorithm:v165->_algorithm goldAssets:v31 graph:v165->_graph persistedData:v165->_algorithmData];
    }
    if (!v159)
    {
      v98 = +[PGLogging sharedLogging];
      v99 = [v98 loggingConnection];

      if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, v99, OS_LOG_TYPE_INFO, "Behavioral Score Processor: no algorithm processor was picked. Exit.", buf, 2u);
      }

      if (v167)
      {
        double v100 = CFAbsoluteTimeGetCurrent();
        if (v100 - v183[3] >= 0.01)
        {
          v183[3] = v100;
          LOBYTE(v175.numer) = 0;
          v167[2](v167, &v175, 1.0);
          char v101 = *((unsigned char *)v187 + 24) | LOBYTE(v175.numer);
          *((unsigned char *)v187 + 24) = v101;
          if (v101)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v192 = 317;
              *(_WORD *)&v192[4] = 2080;
              *(void *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/UserBehavior/PGBehavioralScoreProcessor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }

      goto LABEL_162;
    }
    if (v167)
    {
      double v86 = CFAbsoluteTimeGetCurrent();
      if (v86 - v183[3] >= 0.01)
      {
        v183[3] = v86;
        LOBYTE(v175.numer) = 0;
        v167[2](v167, &v175, 0.4);
        char v87 = *((unsigned char *)v187 + 24) | LOBYTE(v175.numer);
        *((unsigned char *)v187 + 24) = v87;
        if (v87)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v192 = 321;
            *(_WORD *)&v192[4] = 2080;
            *(void *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/UserBehavior/PGBehavioralScoreProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_161;
        }
      }
    }
    v88 = v165->_loggingConnection;
    os_signpost_id_t v89 = os_signpost_id_generate(v88);
    v90 = v88;
    v91 = v90;
    unint64_t v148 = v89 - 1;
    os_signpost_id_t spid = v89;
    if (v89 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v90))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v91, OS_SIGNPOST_INTERVAL_BEGIN, v89, "BehavioralComputeAndSaveBehavioralScore", "", buf, 2u);
    }
    v150 = v91;

    mach_timebase_info v175 = 0;
    mach_timebase_info(&v175);
    uint64_t v147 = mach_absolute_time();
    v92 = [(PHPhotoLibrary *)v165->_photoLibrary librarySpecificFetchOptions];
    [v92 setWantsIncrementalChangeDetails:0];
    [v92 addFetchPropertySets:v163];
    [v92 setCacheSizeForFetch:100];
    [v92 setChunkSizeForFetch:100];
    v93 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"computedAttributes.behavioralScore < %f", 0x3FB99999A0000000);
    [v92 setInternalPredicate:v93];
    v152 = v92;

    v94 = [MEMORY[0x1E4F38EB8] fetchAssetsForBehavioralCurationWithOptions:v92];
    unint64_t v157 = [v94 count];
    if (v157)
    {
      if (!v167
        || (double v95 = CFAbsoluteTimeGetCurrent(), v95 - v183[3] < 0.01)
        || (v183[3] = v95,
            char v174 = 0,
            v167[2](v167, (mach_timebase_info *)&v174, 0.5),
            char v96 = *((unsigned char *)v187 + 24) | v174,
            (*((unsigned char *)v187 + 24) = v96) == 0))
      {
        v155 = v94;
        v102 = +[PGLogging sharedLogging];
        v103 = [v102 loggingConnection];

        if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)v192 = v157;
          _os_log_impl(&dword_1D1805000, v103, OS_LOG_TYPE_INFO, "Behavioral Score Processor: kick-off behavioralScore processing of %lu assets", buf, 0xCu);
        }

        v104 = [(PGGraph *)v165->_graph infoNode];
        [v104 personalHighAestheticsThreshold];
        double v106 = v105;
        if (v105 == -1.0)
        {
          [v104 topTierAestheticScore];
          double v106 = v107;
        }
        [v104 personalGoodAestheticsThreshold];
        double v109 = v108;
        v146 = v104;
        if (v108 == -1.0)
        {
          [MEMORY[0x1E4F8E778] legacyAestheticScoreThresholdToBeAestheticallyPrettyGood];
          double v109 = v110;
        }
        v111 = [MEMORY[0x1E4F1CA48] array];
        unint64_t v112 = 0;
        v113 = MEMORY[0x1E4F14500];
        while (1)
        {
          v114 = (void *)MEMORY[0x1D25FED50]();
          v115 = [v155 objectAtIndex:v112];
          [v111 addObject:v115];
          if ((unint64_t)[v111 count] < 0x7D0) {
            goto LABEL_128;
          }
          v116 = (void *)MEMORY[0x1D25FED50]();
          v117 = [(PGBehavioralScoreProcessor *)v165 behavioralScoreByAssetUUIDForAssets:v111 algorithmProcessor:v159 personalHighAestheticsThreshold:v106 personalGoodAestheticsThreshold:v109];
          v118 = (void *)[v111 copy];
          [(PGBehavioralScoreProcessor *)v165 _writeBehavioralScoresToPhotosDatabase:v117 assets:v118];

          [v111 removeAllObjects];
          v119 = +[PGLogging sharedLogging];
          v120 = [v119 loggingConnection];

          if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)v192 = v112 + 1;
            *(_WORD *)&v192[8] = 2048;
            *(void *)&v192[10] = v157;
            _os_log_impl(&dword_1D1805000, v120, OS_LOG_TYPE_INFO, "Behavioral Score Processor: behavioral score of %lu/%lu assets are saved", buf, 0x16u);
          }

          if (v167
            && (double v121 = CFAbsoluteTimeGetCurrent(), v121 - v183[3] >= 0.01)
            && (v183[3] = v121,
                char v174 = 0,
                v167[2](v167, (mach_timebase_info *)&v174, (double)v112 * (0.4 / (double)v157) + 0.5),
                char v122 = *((unsigned char *)v187 + 24) | v174,
                (*((unsigned char *)v187 + 24) = v122) != 0))
          {
            v123 = v113;
            if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v192 = 380;
              *(_WORD *)&v192[4] = 2080;
              *(void *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/UserBehavior/PGBehavioralScoreProcessor.m";
              _os_log_impl(&dword_1D1805000, v113, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            int v124 = 0;
          }
          else
          {
            int v124 = 1;
          }

          if (v124) {
LABEL_128:
          }
            LOBYTE(v124) = 1;

          if ((v124 & 1) == 0) {
            break;
          }
          if (v157 == ++v112)
          {
            if (v167
              && (double v125 = CFAbsoluteTimeGetCurrent(), v125 - v183[3] >= 0.01)
              && (v183[3] = v125,
                  char v174 = 0,
                  v167[2](v167, (mach_timebase_info *)&v174, 0.9),
                  char v126 = *((unsigned char *)v187 + 24) | v174,
                  (*((unsigned char *)v187 + 24) = v126) != 0))
            {
              v127 = MEMORY[0x1E4F14500];
              id v128 = MEMORY[0x1E4F14500];
              if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v192 = 386;
                *(_WORD *)&v192[4] = 2080;
                *(void *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/UserBehavior/PGBehavioralScoreProcessor.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
            }
            else
            {
              v133 = [(PGBehavioralScoreProcessor *)v165 behavioralScoreByAssetUUIDForAssets:v111 algorithmProcessor:v159 personalHighAestheticsThreshold:v106 personalGoodAestheticsThreshold:v109];
              [(PGBehavioralScoreProcessor *)v165 _writeBehavioralScoresToPhotosDatabase:v133 assets:v111];
              uint64_t v134 = mach_absolute_time();
              uint32_t v135 = v175.numer;
              uint32_t v136 = v175.denom;
              v137 = v150;
              v138 = v137;
              if (v148 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v137))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1D1805000, v138, OS_SIGNPOST_INTERVAL_END, spid, "BehavioralComputeAndSaveBehavioralScore", "", buf, 2u);
              }

              v139 = v138;
              if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                *(void *)v192 = "BehavioralComputeAndSaveBehavioralScore";
                *(_WORD *)&v192[8] = 2048;
                *(double *)&v192[10] = (float)((float)((float)((float)(v134 - v147) * (float)v135) / (float)v136)
                                             / 1000000.0);
                _os_log_impl(&dword_1D1805000, v139, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
              }

              v140 = +[PGLogging sharedLogging];
              v141 = [v140 loggingConnection];

              if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1805000, v141, OS_LOG_TYPE_INFO, "Behavioral Score Processor: ended behavioralScore processing", buf, 2u);
              }

              if (v167)
              {
                double v142 = CFAbsoluteTimeGetCurrent();
                if (v142 - v183[3] >= 0.01)
                {
                  v183[3] = v142;
                  char v174 = 0;
                  v167[2](v167, (mach_timebase_info *)&v174, 1.0);
                  char v143 = *((unsigned char *)v187 + 24) | v174;
                  *((unsigned char *)v187 + 24) = v143;
                  if (v143)
                  {
                    v144 = MEMORY[0x1E4F14500];
                    id v145 = MEMORY[0x1E4F14500];
                    if (os_log_type_enabled(v144, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)v192 = 395;
                      *(_WORD *)&v192[4] = 2080;
                      *(void *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/UserBehavior/PGBehavioralScoreProcessor.m";
                      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                    }
                  }
                }
              }
            }
            break;
          }
        }

        v94 = v155;
        goto LABEL_160;
      }
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_160:

LABEL_161:
LABEL_162:

LABEL_163:
        goto LABEL_164;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v192 = 345;
      *(_WORD *)&v192[4] = 2080;
      *(void *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/UserBehavior/PGBehavioralScoreProcessor.m";
      v97 = MEMORY[0x1E4F14500];
    }
    else
    {
      v129 = +[PGLogging sharedLogging];
      v130 = [v129 loggingConnection];

      if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, v130, OS_LOG_TYPE_INFO, "Behavioral Score Processor: no assets to process for behavioralScore", buf, 2u);
      }

      if (!v167) {
        goto LABEL_160;
      }
      double v131 = CFAbsoluteTimeGetCurrent();
      if (v131 - v183[3] < 0.01) {
        goto LABEL_160;
      }
      v183[3] = v131;
      char v174 = 0;
      v167[2](v167, (mach_timebase_info *)&v174, 1.0);
      char v132 = *((unsigned char *)v187 + 24) | v174;
      *((unsigned char *)v187 + 24) = v132;
      if (!v132 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_160;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v192 = 341;
      *(_WORD *)&v192[4] = 2080;
      *(void *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/UserBehavior/PGBehavioralScoreProcessor.m";
      v97 = MEMORY[0x1E4F14500];
    }
    _os_log_impl(&dword_1D1805000, v97, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_160;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v192 = 214;
    *(_WORD *)&v192[4] = 2080;
    *(void *)&v192[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/UserBehavior/PGBehavioralScoreProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_165:
  _Block_object_dispose(&v182, 8);
  _Block_object_dispose(&v186, 8);
}

void __71__PGBehavioralScoreProcessor_processBehavioralScoresWithProgressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.2 + 0.2);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (void)_persistNewGoldAssetsUUIDs:(id)a3 processorData:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PHPhotoLibrary *)self->_photoLibrary urlForApplicationDataFolderIdentifier:1];
  double v9 = [v8 URLByAppendingPathComponent:@"PGUserBehaviorPreviousResults.plist"];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    id v11 = [v6 allObjects];
    [v10 setObject:v11 forKeyedSubscript:@"goldAssetUUIDs"];

    long long v12 = [MEMORY[0x1E4F1C9C8] date];
    long long v13 = [v12 description];
    [v10 setObject:v13 forKeyedSubscript:@"date"];

    [v10 setObject:&unk_1F28D2BC8 forKeyedSubscript:@"version"];
    long long v14 = [NSNumber numberWithInteger:self->_algorithm];
    [v10 setObject:v14 forKeyedSubscript:@"algorithm"];

    if (v7) {
      [v10 setObject:v7 forKeyedSubscript:@"algorithmData"];
    }
    id v19 = 0;
    [v10 writeToURL:v9 error:&v19];
    id v15 = v19;
    uint64_t v16 = +[PGLogging sharedLogging];
    uint64_t v17 = [v16 loggingConnection];

    if (v15)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v21 = v9;
        __int16 v22 = 2112;
        id v23 = v15;
        _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "Behavioral Score Processor: An error occurred persisting the processor plist at  \"%@\": %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "Behavioral Score Processor: persisted new parameters", buf, 2u);
    }
  }
  else
  {
    id v18 = +[PGLogging sharedLogging];
    uint64_t v10 = [v18 loggingConnection];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "Behavioral Score Processor: Can't persist the processor data", buf, 2u);
    }
  }
}

- (id)sceneFeatures
{
  id v2 = [(PGBehavioralScoreProcessor *)self _previousResults];
  uint64_t v3 = v2;
  if (v2)
  {
    double v4 = [v2 objectForKeyedSubscript:@"algorithmData"];
    char v5 = [v4 objectForKeyedSubscript:PGAssetFeatureBehavioralProcessorSceneFeaturesKey];
  }
  else
  {
    char v5 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v5;
}

- (id)peopleFeatures
{
  id v2 = [(PGBehavioralScoreProcessor *)self _previousResults];
  uint64_t v3 = v2;
  if (v2)
  {
    double v4 = [v2 objectForKeyedSubscript:@"algorithmData"];
    char v5 = [v4 objectForKeyedSubscript:PGAssetFeatureBehavioralProcessorPeopleFeaturesKey];
  }
  else
  {
    char v5 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v5;
}

- (id)goldAssetUUIDs
{
  id v2 = [(PGBehavioralScoreProcessor *)self _previousResults];
  uint64_t v3 = v2;
  if (v2)
  {
    double v4 = [v2 objectForKeyedSubscript:@"goldAssetUUIDs"];
  }
  else
  {
    char v5 = +[PGLogging sharedLogging];
    id v6 = [v5 loggingConnection];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_INFO, "Behavioral Score Processor: No previous gold assets", v8, 2u);
    }

    double v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (id)_previousResults
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [(PHPhotoLibrary *)self->_photoLibrary urlForApplicationDataFolderIdentifier:1];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"PGUserBehaviorPreviousResults.plist"];
  if (v3)
  {
    id v11 = 0;
    double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v3 error:&v11];
    char v5 = v11;
    if (v5)
    {
      id v6 = +[PGLogging sharedLogging];
      id v7 = [v6 loggingConnection];

      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        long long v13 = v3;
        __int16 v14 = 2112;
        id v15 = v5;
        _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "Behavioral Score Processor: Behavioral Score Processor: no previous results found OR error reading behavioral plist\"%@\" : %@", buf, 0x16u);
      }

      id v8 = 0;
    }
    else
    {
      id v8 = v4;
    }
  }
  else
  {
    double v9 = +[PGLogging sharedLogging];
    char v5 = [v9 loggingConnection];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v5, OS_LOG_TYPE_INFO, "Behavioral Score Processor: No previous results found", buf, 2u);
    }
    id v8 = 0;
  }

  return v8;
}

- (PGBehavioralScoreProcessor)initWithGraphManager:(id)a3 algorithm:(int64_t)a4
{
  id v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PGBehavioralScoreProcessor;
  id v7 = [(PGBehavioralScoreProcessor *)&v28 init];
  if (v7)
  {
    uint64_t v8 = [v6 photoLibrary];
    photoLibrary = v7->_photoLibrary;
    v7->_photoLibrary = (PHPhotoLibrary *)v8;

    uint64_t v10 = [v6 loggingConnection];
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = (OS_os_log *)v10;

    v7->_algorithm = a4;
    long long v12 = [(PGBehavioralScoreProcessor *)v7 _previousResults];
    previousGoldAssetUUIDs = v7->_previousGoldAssetUUIDs;
    v7->_previousGoldAssetUUIDs = 0;

    if (v12)
    {
      __int16 v14 = [v12 objectForKeyedSubscript:@"version"];
      id v15 = v14;
      if (v14 && [v14 unsignedIntegerValue] == 10)
      {
        uint64_t v16 = [v12 objectForKeyedSubscript:@"algorithm"];
        uint64_t v17 = v16;
        if (v16 && (uint64_t v18 = [v16 unsignedIntegerValue]) != 0 && v18 == v7->_algorithm)
        {
          id v19 = [v12 objectForKeyedSubscript:@"goldAssetUUIDs"];
          if ([v19 count])
          {
            uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v19];
            uint64_t v21 = v7->_previousGoldAssetUUIDs;
            v7->_previousGoldAssetUUIDs = (NSSet *)v20;
          }
          uint64_t v22 = [v12 objectForKeyedSubscript:@"algorithmData"];
          algorithmData = v7->_algorithmData;
          v7->_algorithmData = (NSDictionary *)v22;
        }
        else
        {
          float v25 = +[PGLogging sharedLogging];
          id v19 = [v25 loggingConnection];

          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)double v27 = 0;
            _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "Behavioral Score Processor: Ignoring previous results due to algorithm mismatch", v27, 2u);
          }
        }
      }
      else
      {
        uint64_t v24 = +[PGLogging sharedLogging];
        uint64_t v17 = [v24 loggingConnection];

        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)double v27 = 0;
          _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "Behavioral Score Processor: Ignoring previous results due to version mismatch", v27, 2u);
        }
      }
    }
  }

  return v7;
}

+ (id)assetPropertySetsForUserBehavioralProcessing
{
  v5[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F39550];
  v5[0] = *MEMORY[0x1E4F39458];
  v5[1] = v2;
  v5[2] = *MEMORY[0x1E4F394E0];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  return v3;
}

@end
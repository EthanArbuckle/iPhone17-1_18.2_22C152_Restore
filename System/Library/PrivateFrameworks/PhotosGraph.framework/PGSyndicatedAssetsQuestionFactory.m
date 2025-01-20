@interface PGSyndicatedAssetsQuestionFactory
- (BOOL)_isHubbleFeatureFlagEnabled;
- (id)_allAssetsFetchResultWithOptions:(id)a3;
- (id)_syndicatedPhotoLibraryWithError:(id *)a3;
- (id)_validRandomAssetsFromFetchResult:(id)a3 limit:(unint64_t)a4;
- (id)_validRandomAssetsWithLimit:(unint64_t)a3 photoLibrary:(id)a4;
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
@end

@implementation PGSyndicatedAssetsQuestionFactory

- (id)_validRandomAssetsFromFetchResult:(id)a3 limit:(unint64_t)a4
{
  id v5 = a3;
  if (a4)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    if ([v5 count])
    {
      unint64_t v7 = 0;
      do
      {
        v8 = [NSNumber numberWithUnsignedInteger:v7];
        [v6 addObject:v8];

        ++v7;
      }
      while (v7 < [v5 count]);
    }
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    while ([v6 count] && objc_msgSend(v9, "count") < a4)
    {
      v10 = (void *)MEMORY[0x1D25FED50]();
      uint64_t v11 = arc4random_uniform([v6 count]);
      v12 = [v6 objectAtIndexedSubscript:v11];
      uint64_t v13 = [v12 unsignedIntegerValue];

      v14 = [v5 objectAtIndexedSubscript:v13];
      [v6 removeObjectAtIndex:v11];
      v15 = [v14 mediaAnalysisProperties];
      LOWORD(v13) = [v15 syndicationProcessingValue];

      if ((v13 & 0x1000) == 0 && (unint64_t)([v14 syndicationEligibility] + 1) <= 3) {
        [v9 addObject:v14];
      }
    }
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }

  return v9;
}

- (id)_syndicatedPhotoLibraryWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F39228] openPhotoLibraryWithWellKnownIdentifier:3 error:a3];
}

- (BOOL)_isHubbleFeatureFlagEnabled
{
  return 1;
}

- (id)_allAssetsFetchResultWithOptions:(id)a3
{
  return (id)[MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:a3];
}

- (id)_validRandomAssetsWithLimit:(unint64_t)a3 photoLibrary:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t v7 = [v6 librarySpecificFetchOptions];
  [v7 setChunkSizeForFetch:200];
  [v7 setCacheSizeForFetch:200];
  uint64_t v9 = *MEMORY[0x1E4F394E0];
  v34[0] = *MEMORY[0x1E4F39538];
  uint64_t v8 = v34[0];
  v34[1] = v9;
  uint64_t v35 = *MEMORY[0x1E4F39458];
  uint64_t v10 = v35;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
  [v7 setFetchPropertySets:v11];

  v12 = [MEMORY[0x1E4F8E7A8] internalPredicateToFilterGuestSyndicatedAssetsEligibleForQuestion];
  [v7 setInternalPredicate:v12];

  [v7 setIncludeGuestAssets:1];
  uint64_t v13 = [(PGSyndicatedAssetsQuestionFactory *)self _allAssetsFetchResultWithOptions:v7];
  v14 = [v6 librarySpecificFetchOptions];

  [v14 setChunkSizeForFetch:200];
  [v14 setCacheSizeForFetch:200];
  v33[0] = v8;
  v33[1] = v9;
  v33[2] = v10;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  [v14 setFetchPropertySets:v15];

  v16 = [MEMORY[0x1E4F8E7A8] internalPredicateToFilterSyndicatedAssetsEligibleForQuestion];
  [v14 setInternalPredicate:v16];

  v17 = [(PGSyndicatedAssetsQuestionFactory *)self _allAssetsFetchResultWithOptions:v14];
  unint64_t v18 = a3 >> 1;
  if (a3 >> 1 >= [v13 count]) {
    unint64_t v18 = [v13 count];
  }
  unint64_t v19 = a3 - v18;
  unint64_t v20 = [v17 count];
  if (v19 >= v20) {
    unint64_t v19 = v20;
  }
  unint64_t v21 = a3 - v19;
  unint64_t v22 = [v13 count];
  if (v21 >= v22) {
    unint64_t v23 = v22;
  }
  else {
    unint64_t v23 = v21;
  }
  v24 = [(PGSyndicatedAssetsQuestionFactory *)self _validRandomAssetsFromFetchResult:v13 limit:v23];
  v25 = [(PGSyndicatedAssetsQuestionFactory *)self _validRandomAssetsFromFetchResult:v17 limit:v19];
  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v25, "count") + objc_msgSend(v24, "count"));
  v27 = [v24 allObjects];
  [v26 addObjectsFromArray:v27];

  v28 = [v25 allObjects];
  [v26 addObjectsFromArray:v28];

  if (![v26 count])
  {
    v29 = +[PGLogging sharedLogging];
    v30 = [v29 loggingConnection];

    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_1D1805000, v30, OS_LOG_TYPE_DEFAULT, "PGSyndicatedAssetsQuestionFactory: no valid random samples.", v32, 2u);
    }
  }
  return v26;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v54 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(a4);
  if (v54)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v7 = 0.0;
    if (Current >= 0.01)
    {
      double v8 = Current;
      LOBYTE(info.numer) = 0;
      v54[2](v54, &info, 0.0);
      if (LOBYTE(info.numer))
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
LABEL_59:
          uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
          goto LABEL_78;
        }
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v63 = 37;
        *(_WORD *)&v63[4] = 2080;
        *(void *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Questions/Survey/SyndicatedAssets/PGSyndicatedAssetsQuestionFactory.m";
        uint64_t v9 = MEMORY[0x1E4F14500];
LABEL_58:
        _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_59;
      }
      double v7 = v8;
    }
    if (![(PGSyndicatedAssetsQuestionFactory *)self _isHubbleFeatureFlagEnabled])
    {
      if (CFAbsoluteTimeGetCurrent() - v7 < 0.01) {
        goto LABEL_59;
      }
      LOBYTE(info.numer) = 0;
      v54[2](v54, &info, 1.0);
      if (!LOBYTE(info.numer) || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_59;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v63 = 40;
      *(_WORD *)&v63[4] = 2080;
      *(void *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Questions/Survey/SyndicatedAssets/PGSyndicatedAssetsQuestionFactory.m";
      uint64_t v9 = MEMORY[0x1E4F14500];
      goto LABEL_58;
    }
    if (!a3)
    {
      if (CFAbsoluteTimeGetCurrent() - v7 < 0.01) {
        goto LABEL_59;
      }
      LOBYTE(info.numer) = 0;
      v54[2](v54, &info, 1.0);
      if (!LOBYTE(info.numer) || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_59;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v63 = 45;
      *(_WORD *)&v63[4] = 2080;
      *(void *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Questions/Survey/SyndicatedAssets/PGSyndicatedAssetsQuestionFactory.m";
      uint64_t v9 = MEMORY[0x1E4F14500];
      goto LABEL_58;
    }
  }
  else
  {
    BOOL v10 = [(PGSyndicatedAssetsQuestionFactory *)self _isHubbleFeatureFlagEnabled];
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
    if (!a3) {
      goto LABEL_78;
    }
    double v7 = 0.0;
    if (!v10) {
      goto LABEL_78;
    }
  }
  id v61 = 0;
  v12 = [(PGSyndicatedAssetsQuestionFactory *)self _syndicatedPhotoLibraryWithError:&v61];
  id v13 = v61;
  v14 = v13;
  if (!v12 || v13)
  {
    v38 = +[PGLogging sharedLogging];
    v39 = [v38 loggingConnection];

    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v63 = v14;
      _os_log_error_impl(&dword_1D1805000, v39, OS_LOG_TYPE_ERROR, "PGSyndicatedAssetsQuestionFactory: Failed to open syndicated library: %@", buf, 0xCu);
    }

    if (v54)
    {
      if (CFAbsoluteTimeGetCurrent() - v7 >= 0.01)
      {
        LOBYTE(info.numer) = 0;
        v54[2](v54, &info, 1.0);
        if (LOBYTE(info.numer))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v63 = 53;
            *(_WORD *)&v63[4] = 2080;
            *(void *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Questions/Survey/SyndicatedAssets/PGSyndicatedAssetsQuestionFactory.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v15 = MEMORY[0x1E4F14500];
    id v16 = MEMORY[0x1E4F14500];
    os_signpost_id_t v17 = os_signpost_id_generate(v15);
    unint64_t v18 = v15;
    unint64_t v53 = v17 - 1;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_BEGIN, v17, "SyndicatedAssetsQuestionGeneration", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v51 = mach_absolute_time();
    unint64_t v19 = [MEMORY[0x1E4F1CA80] set];
    [(PGSyndicatedAssetsQuestionFactory *)self _validRandomAssetsWithLimit:a3 photoLibrary:v12];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    unint64_t v20 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v20 countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      os_signpost_id_t v50 = v17;
      v52 = v12;
      uint64_t v23 = 0;
      double v24 = (double)a3;
      uint64_t v25 = *(void *)v57;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v57 != v25) {
            objc_enumerationMutation(v20);
          }
          v27 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          v28 = [v27 curationProperties];
          v29 = [v28 syndicationIdentifier];

          if (v29)
          {
            v30 = [[PGSyndicatedAssetsQuestion alloc] initWithAssetSyndicationIdentifier:v29];
            if ([(PGSurveyQuestionFactory *)self shouldAddQuestion:v30 toAlreadyGeneratedQuestions:v19])
            {
              [v19 addObject:v30];
            }
            else
            {
              ++v23;
            }
            uint64_t v33 = [v19 count];
            if (v54)
            {
              unint64_t v34 = v33;
              double v35 = CFAbsoluteTimeGetCurrent();
              if (v35 - v7 >= 0.01)
              {
                char v55 = 0;
                v54[2](v54, (mach_timebase_info *)&v55, (double)v34 / v24);
                if (v55)
                {
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v63 = 77;
                    *(_WORD *)&v63[4] = 2080;
                    *(void *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Questions/Survey/SyndicatedAssets/PGSyndicatedAssetsQuestionFactory.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }

                  uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
                  v14 = 0;
                  v12 = v52;
                  goto LABEL_76;
                }
                double v7 = v35;
              }
            }
          }
          else
          {
            v31 = +[PGLogging sharedLogging];
            v29 = [v31 loggingConnection];

            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              v32 = [v27 uuid];
              *(_DWORD *)buf = 138412290;
              *(void *)v63 = v32;
              _os_log_error_impl(&dword_1D1805000, v29, OS_LOG_TYPE_ERROR, "PGSyndicatedAssetsQuestionFactory: syndication identifier is nil for asset %@", buf, 0xCu);
            }
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v56 objects:v64 count:16];
        if (v22) {
          continue;
        }
        break;
      }

      if (!v23)
      {
        v14 = 0;
        v12 = v52;
        os_signpost_id_t v17 = v50;
        unint64_t v40 = v53;
        goto LABEL_62;
      }
      uint64_t v36 = +[PGLogging sharedLogging];
      v37 = [v36 loggingConnection];

      v14 = 0;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v63 = v23;
        _os_log_impl(&dword_1D1805000, v37, OS_LOG_TYPE_DEFAULT, "PGSyndicatedAssetsQuestionFactory: skipping %lu questions because other questions already exist for the same assets.", buf, 0xCu);
      }
      v12 = v52;
      os_signpost_id_t v17 = v50;
    }
    else
    {
      v37 = v20;
    }
    unint64_t v40 = v53;

LABEL_62:
    uint64_t v41 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    id v44 = MEMORY[0x1E4F14500];
    if (v40 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_END, v17, "SyndicatedAssetsQuestionGeneration", "", buf, 2u);
    }
    v45 = MEMORY[0x1E4F14500];

    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v63 = "SyndicatedAssetsQuestionGeneration";
      *(_WORD *)&v63[8] = 2048;
      *(double *)&v63[10] = (float)((float)((float)((float)(v41 - v51) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    if (v54 && CFAbsoluteTimeGetCurrent() - v7 >= 0.01 && (char v55 = 0, v54[2](v54, (mach_timebase_info *)&v55, 1.0), v55))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v63 = 86;
        *(_WORD *)&v63[4] = 2080;
        *(void *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Questions/Survey/SyndicatedAssets/PGSyndicatedAssetsQuestionFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v46 = +[PGLogging sharedLogging];
      v47 = [v46 loggingConnection];

      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v48 = [v19 count];
        *(_DWORD *)buf = 134217984;
        *(void *)v63 = v48;
        _os_log_impl(&dword_1D1805000, v47, OS_LOG_TYPE_DEFAULT, "PGSyndicatedAssetsQuestionFactory: returning %lu questions to be saved.", buf, 0xCu);
      }

      uint64_t v11 = [v19 allObjects];
    }
LABEL_76:
  }
LABEL_78:

  return v11;
}

- (int64_t)questionOptions
{
  return 0x20000;
}

- (unsigned)questionType
{
  return 18;
}

@end
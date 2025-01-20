@interface PGExternalAssetRelevanceQuestionFactory
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
@end

@implementation PGExternalAssetRelevanceQuestionFactory

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA80] set];
  v8 = [(PGSurveyQuestionFactory *)self workingContext];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __84__PGExternalAssetRelevanceQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  v16 = &unk_1E68F0568;
  id v19 = v6;
  unint64_t v20 = a3;
  v17 = self;
  id v18 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performSynchronousConcurrentGraphReadUsingBlock:&v13];

  v11 = objc_msgSend(v9, "allObjects", v13, v14, v15, v16, v17);

  return v11;
}

void __84__PGExternalAssetRelevanceQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void (**)(void *, unsigned char *, double))_Block_copy(*(const void **)(a1 + 48));
  if (!v4)
  {
    double v6 = 0.0;
    if (!*(void *)(a1 + 56)) {
      goto LABEL_48;
    }
    goto LABEL_10;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  double v6 = 0.0;
  if (Current >= 0.01)
  {
    double v7 = Current;
    char v75 = 0;
    v4[2](v4, &v75, 0.0);
    if (v75)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v82 = 37;
        __int16 v83 = 2080;
        v84 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/ExternalAssetRelevance/PGExternalAssetRelevanceQuestionFactory.m";
        v8 = MEMORY[0x1E4F14500];
LABEL_37:
        _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_48;
      }
      goto LABEL_48;
    }
    double v6 = v7;
  }
  if (*(void *)(a1 + 56))
  {
LABEL_10:
    id v58 = v3;
    uint64_t v64 = a1;
    id v9 = [*(id *)(a1 + 32) workingContext];
    id v10 = [v9 photoLibrary];

    v63 = v10;
    v11 = [v10 librarySpecificFetchOptions];
    v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"type == %d", 29);
    [v11 setPredicate:v12];

    v57 = v11;
    uint64_t v13 = [MEMORY[0x1E4F39250] fetchQuestionsWithOptions:v11 validQuestionsOnly:1];
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v71 objects:v80 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v72 != v18) {
            objc_enumerationMutation(v15);
          }
          unint64_t v20 = [*(id *)(*((void *)&v71 + 1) + 8 * i) entityIdentifier];
          [v14 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v71 objects:v80 count:16];
      }
      while (v17);
    }
    id v54 = v15;

    v21 = [v63 librarySpecificFetchOptions];
    v22 = +[PGCurationManager assetPropertySetsForCuration];
    [v21 setFetchPropertySets:v22];

    uint64_t v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (uuid IN %@)", v14];
    v24 = (void *)MEMORY[0x1E4F28BA0];
    v25 = [MEMORY[0x1E4F8E7E0] internalPredicateToIncludeProcessedExternalAssets];
    v79[0] = v25;
    v79[1] = v23;
    v55 = (void *)v23;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:2];
    v27 = [v24 andPredicateWithSubpredicates:v26];
    [v21 setInternalPredicate:v27];

    [v21 setFetchLimit:1000];
    v56 = v21;
    [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v21];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v62 = [obj countByEnumeratingWithState:&v67 objects:v78 count:16];
    if (v62)
    {
      uint64_t v61 = *(void *)v68;
      uint64_t v28 = v64;
      v60 = v4;
      while (2)
      {
        for (uint64_t j = 0; j != v62; ++j)
        {
          if (*(void *)v68 != v61) {
            objc_enumerationMutation(obj);
          }
          v30 = *(void **)(*((void *)&v67 + 1) + 8 * j);
          v31 = (void *)MEMORY[0x1D25FED50]();
          uint64_t v32 = [*(id *)(v28 + 40) count];
          if (v4)
          {
            unint64_t v33 = v32;
            unint64_t v34 = *(void *)(v28 + 56);
            double v35 = CFAbsoluteTimeGetCurrent();
            if (v35 - v6 >= 0.01)
            {
              char v75 = 0;
              v4[2](v4, &v75, (double)v33 / (double)v34 * 0.9);
              if (v75)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  int v82 = 68;
                  __int16 v83 = 2080;
                  v84 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewor"
                        "k/Questions/Survey/ExternalAssetRelevance/PGExternalAssetRelevanceQuestionFactory.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }

                v50 = v57;
                id v3 = v58;
                v52 = v55;
                v51 = v56;
                v53 = v54;
                goto LABEL_47;
              }
              double v6 = v35;
            }
          }
          context = v31;
          v36 = [v30 mediaAnalysisProperties];
          __int16 v37 = [v36 syndicationProcessingValue];

          [v63 librarySpecificFetchOptions];
          uint64_t v39 = v38 = v4;
          v77 = v30;
          v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
          v41 = +[PGShareBackSuggesterInput universalDateIntervalForSuggesterInputs:v40 withTimeIntervalPadding:7200.0];

          v76 = v30;
          v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
          v65 = (void *)v39;
          uint64_t v43 = v39;
          v4 = v38;
          v44 = +[PGShareBackSuggester momentUUIDsForExtendedUniversalDateInterval:v41 suggesterInputs:v42 momentFetchOptions:v43];

          if ([v44 count])
          {
            BOOL v45 = (v37 & 0x3CF1) != 0;
            v46 = [MEMORY[0x1E4F391A0] localIdentifiersWithUUIDs:v44];
            v47 = [PGExternalAssetRelevanceQuestion alloc];
            v48 = [v30 uuid];
            v49 = [(PGExternalAssetRelevanceQuestion *)v47 initWithAssetUUID:v48 momentLocalIdentifiers:v46 assetInferredAsRelevant:v45];

            if ([*(id *)(v64 + 32) shouldAddQuestion:v49 toAlreadyGeneratedQuestions:*(void *)(v64 + 40)])
            {
              [*(id *)(v64 + 40) addObject:v49];
              if ((unint64_t)[*(id *)(v64 + 40) count] >= *(void *)(v64 + 56))
              {

                v4 = v60;
                goto LABEL_42;
              }
            }

            v4 = v60;
          }

          uint64_t v28 = v64;
        }
        uint64_t v62 = [obj countByEnumeratingWithState:&v67 objects:v78 count:16];
        if (v62) {
          continue;
        }
        break;
      }
    }
LABEL_42:

    v50 = v57;
    id v3 = v58;
    v52 = v55;
    v51 = v56;
    v53 = v54;
    if (v4)
    {
      if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
      {
        char v75 = 0;
        v4[2](v4, &v75, 1.0);
        if (v75)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v82 = 95;
            __int16 v83 = 2080;
            v84 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Ques"
                  "tions/Survey/ExternalAssetRelevance/PGExternalAssetRelevanceQuestionFactory.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
LABEL_47:

    goto LABEL_48;
  }
  if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
  {
    char v75 = 0;
    v4[2](v4, &v75, 1.0);
    if (v75)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v82 = 40;
        __int16 v83 = 2080;
        v84 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/ExternalAssetRelevance/PGExternalAssetRelevanceQuestionFactory.m";
        v8 = MEMORY[0x1E4F14500];
        goto LABEL_37;
      }
    }
  }
LABEL_48:
}

- (unsigned)questionType
{
  return 29;
}

- (int64_t)questionOptions
{
  return 0x8000000;
}

@end
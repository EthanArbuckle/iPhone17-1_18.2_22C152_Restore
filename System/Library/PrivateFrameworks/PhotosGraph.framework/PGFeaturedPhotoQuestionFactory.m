@interface PGFeaturedPhotoQuestionFactory
- (PGFeaturedPhotoQuestionFactory)initWithWorkingContext:(id)a3 questionVersion:(signed __int16)a4;
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (id)randomAssetsUUIDsWithLimit:(unint64_t)a3;
- (int64_t)questionOptions;
- (unsigned)questionType;
@end

@implementation PGFeaturedPhotoQuestionFactory

- (void).cxx_destruct
{
}

- (id)randomAssetsUUIDsWithLimit:(unint64_t)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v4 = [(PGSurveyQuestionFactory *)self workingContext];
  v5 = [v4 photoLibrary];
  v6 = [v5 librarySpecificFetchOptions];

  v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind != %d AND (kindSubtype & %d) == 0 AND curationScore > %f", 1, 1, *MEMORY[0x1E4F8E750]);
  [v6 setInternalPredicate:v7];

  v19[0] = *MEMORY[0x1E4F394A8];
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v6 setFetchPropertySets:v8];

  [v6 setChunkSizeForFetch:8];
  [v6 setCacheSizeForFetch:8];
  v9 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v6];
  v10 = [v9 fetchedObjects];

  unint64_t v11 = [v10 count];
  v12 = [MEMORY[0x1E4F1CA80] set];
  unint64_t v13 = [v12 count];
  if (v11 >= a3) {
    unint64_t v14 = a3;
  }
  else {
    unint64_t v14 = v11;
  }
  while (v13 < v14)
  {
    v15 = (void *)MEMORY[0x1D25FED50]();
    v16 = [v10 objectAtIndexedSubscript:arc4random_uniform(v11)];
    v17 = [v16 uuid];
    [v12 addObject:v17];

    unint64_t v13 = [v12 count];
  }

  return v12;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v51 = a4;
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x2020000000;
  char v75 = 0;
  uint64_t v68 = 0;
  v69 = (double *)&v68;
  uint64_t v70 = 0x2020000000;
  uint64_t v71 = 0;
  v57 = (void (**)(void *, unsigned char *, double))_Block_copy(v51);
  if (v57)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v69[3] >= 0.01)
    {
      v69[3] = Current;
      char v67 = 0;
      v57[2](v57, &v67, 0.0);
      char v7 = *((unsigned char *)v73 + 24) | v67;
      *((unsigned char *)v73 + 24) = v7;
      if (v7)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
LABEL_31:
          v33 = (void *)MEMORY[0x1E4F1CBF0];
          goto LABEL_61;
        }
        *(_DWORD *)buf = 67109378;
        int v78 = 59;
        __int16 v79 = 2080;
        v80 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Featured/PGFeaturedPhotoQuestionFactory.m";
        v8 = MEMORY[0x1E4F14500];
LABEL_11:
        _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_31;
      }
    }
    if (!a3)
    {
      double v9 = CFAbsoluteTimeGetCurrent();
      if (v9 - v69[3] < 0.01) {
        goto LABEL_31;
      }
      v69[3] = v9;
      char v67 = 0;
      v57[2](v57, &v67, 1.0);
      char v10 = *((unsigned char *)v73 + 24) | v67;
      *((unsigned char *)v73 + 24) = v10;
      if (!v10 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_31;
      }
      *(_DWORD *)buf = 67109378;
      int v78 = 63;
      __int16 v79 = 2080;
      v80 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Featured/PGFeaturedPhotoQuestionFactory.m";
      v8 = MEMORY[0x1E4F14500];
      goto LABEL_11;
    }
  }
  else if (!a3)
  {
    goto LABEL_31;
  }
  unint64_t v55 = a3;
  unint64_t v11 = [MEMORY[0x1E4F1CA80] set];
  v12 = objc_alloc_init(PGSuggestionOptions);
  [(PGSuggestionOptions *)v12 setDefaultStartAndEndDatesIfNeeded];
  v52 = v12;
  v54 = [MEMORY[0x1E4F28E60] indexSetWithIndex:301];
  [v54 addIndex:303];
  [v54 addIndex:304];
  [v54 addIndex:305];
  [v54 addIndex:401];
  [v54 addIndex:501];
  [v54 addIndex:502];
  double v13 = (double)v55;
  unint64_t v56 = vcvtad_u64_f64((double)v55 * 0.75);
  -[PGSuggestionOptions setMaximumNumberOfSuggestions:](v12, "setMaximumNumberOfSuggestions:");
  unint64_t v14 = +[PGSuggestionSession suggestionTypesWithProfile:5];
  [(PGSuggestionOptions *)v52 setSuggestionTypeWhitelist:v14];

  [(PGSuggestionOptions *)v52 setSuggestionSubtypeWhitelist:v54];
  suggestionSession = self->_suggestionSession;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __75__PGFeaturedPhotoQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  v62[3] = &unk_1E68F03F8;
  v53 = v57;
  id v63 = v53;
  v64 = &v68;
  v65 = &v72;
  uint64_t v66 = 0x3F847AE147AE147BLL;
  v50 = [(PGSuggestionSession *)suggestionSession suggestionsWithOptions:v52 progress:v62];
  v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:");
  unint64_t v49 = v55 - v56;
  while (objc_msgSend(v11, "count", v49) < v56 && objc_msgSend(v16, "count"))
  {
    v17 = (void *)MEMORY[0x1D25FED50]();
    uint64_t v18 = arc4random_uniform([v16 count]);
    v19 = [v16 objectAtIndexedSubscript:v18];
    [v16 removeObjectAtIndex:v18];
    v20 = [v19 keyAssets];
    if (!v20
      || ([v19 keyAssets],
          v21 = objc_claimAutoreleasedReturnValue(),
          BOOL v22 = [v21 count] == 0,
          v21,
          v20,
          v22))
    {
      int v32 = 2;
    }
    else
    {
      v23 = [PGFeaturedPhotoQuestion alloc];
      v24 = [v19 keyAssets];
      v25 = [v24 firstObject];
      v26 = [v25 uuid];
      v27 = -[PGFeaturedPhotoQuestion initWithAssetUUID:suggestionType:suggestionSubtype:](v23, "initWithAssetUUID:suggestionType:suggestionSubtype:", v26, [v19 type], objc_msgSend(v19, "subtype"));

      if ([(PGSurveyQuestionFactory *)self shouldAddQuestion:v27 toAlreadyGeneratedQuestions:v11])
      {
        [v11 addObject:v27];
        uint64_t v28 = [v11 count];
        if (v57
          && (unint64_t v29 = v28, v30 = CFAbsoluteTimeGetCurrent(), v30 - v69[3] >= 0.01)
          && (v69[3] = v30,
              char v67 = 0,
              v53[2](v53, &v67, (double)v29 / v13),
              char v31 = *((unsigned char *)v73 + 24) | v67,
              (*((unsigned char *)v73 + 24) = v31) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v78 = 107;
            __int16 v79 = 2080;
            v80 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Ques"
                  "tions/Survey/Featured/PGFeaturedPhotoQuestionFactory.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          int v32 = 1;
        }
        else
        {
          int v32 = 0;
        }
      }
      else
      {
        int v32 = 2;
      }
    }
    if ((v32 | 2) != 2)
    {
      v33 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_60;
    }
  }
  [(PGFeaturedPhotoQuestionFactory *)self randomAssetsUUIDsWithLimit:v49];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = [v34 countByEnumeratingWithState:&v58 objects:v76 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v59;
LABEL_34:
    uint64_t v37 = 0;
    while (1)
    {
      if (*(void *)v59 != v36) {
        objc_enumerationMutation(v34);
      }
      uint64_t v38 = *(void *)(*((void *)&v58 + 1) + 8 * v37);
      v39 = (void *)MEMORY[0x1D25FED50]();
      v40 = [[PGFeaturedPhotoQuestion alloc] initWithAssetUUID:v38 suggestionType:0 suggestionSubtype:0];
      if ([(PGSurveyQuestionFactory *)self shouldAddQuestion:v40 toAlreadyGeneratedQuestions:v11])
      {
        [v11 addObject:v40];
        uint64_t v41 = [v11 count];
        if (!v57) {
          goto LABEL_45;
        }
        unint64_t v42 = v41;
        double v43 = CFAbsoluteTimeGetCurrent();
        if (v43 - v69[3] >= 0.01
          && (v69[3] = v43,
              char v67 = 0,
              v53[2](v53, &v67, (double)v42 / v13),
              char v44 = *((unsigned char *)v73 + 24) | v67,
              (*((unsigned char *)v73 + 24) = v44) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v78 = 121;
            __int16 v79 = 2080;
            v80 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Ques"
                  "tions/Survey/Featured/PGFeaturedPhotoQuestionFactory.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          int v45 = 1;
        }
        else
        {
LABEL_45:
          int v45 = 4 * ([v11 count] >= v55);
        }
      }
      else
      {
        int v45 = 5;
      }

      if (v45 != 5)
      {
        if (v45) {
          break;
        }
      }
      if (v35 == ++v37)
      {
        uint64_t v35 = [v34 countByEnumeratingWithState:&v58 objects:v76 count:16];
        if (v35) {
          goto LABEL_34;
        }
        goto LABEL_50;
      }
    }

    if (v45 != 4) {
      goto LABEL_57;
    }
  }
  else
  {
LABEL_50:
  }
  if (v57
    && (double v46 = CFAbsoluteTimeGetCurrent(), v46 - v69[3] >= 0.01)
    && (v69[3] = v46,
        char v67 = 0,
        v53[2](v53, &v67, 1.0),
        char v47 = *((unsigned char *)v73 + 24) | v67,
        (*((unsigned char *)v73 + 24) = v47) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v78 = 129;
      __int16 v79 = 2080;
      v80 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Featured/PGFeaturedPhotoQuestionFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
LABEL_57:
    v33 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v33 = [v11 allObjects];
  }

LABEL_60:
LABEL_61:
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);

  return v33;
}

void __75__PGFeaturedPhotoQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (int64_t)questionOptions
{
  return 0x2000;
}

- (unsigned)questionType
{
  return 14;
}

- (PGFeaturedPhotoQuestionFactory)initWithWorkingContext:(id)a3 questionVersion:(signed __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGFeaturedPhotoQuestionFactory;
  uint64_t v7 = [(PGSurveyQuestionFactory *)&v11 initWithWorkingContext:v6 questionVersion:v4];
  if (v7)
  {
    v8 = [[PGSuggestionSession alloc] initWithProfile:5 workingContext:v6];
    suggestionSession = v7->_suggestionSession;
    v7->_suggestionSession = v8;
  }
  return v7;
}

@end
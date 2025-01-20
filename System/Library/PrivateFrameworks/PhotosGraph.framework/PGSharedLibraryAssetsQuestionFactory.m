@interface PGSharedLibraryAssetsQuestionFactory
+ (BOOL)isSharedLibraryQuestionsEnabledForPhotoLibrary:(id)a3;
+ (id)_libraryScopeFromPhotoLibrary:(id)a3;
- (id)_assetsFetchResultFromMoment:(id)a3;
- (id)_eligibleMomentsFetchResult;
- (id)collidingQuestionTypes;
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
@end

@implementation PGSharedLibraryAssetsQuestionFactory

+ (id)_libraryScopeFromPhotoLibrary:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v3 = [a3 librarySpecificFetchOptions];
  v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v16[0] = v4;
  v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v16[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  [v3 setSortDescriptors:v6];

  v7 = [MEMORY[0x1E4F39110] fetchActiveLibraryScopeWithOptions:v3];
  if ([v7 count])
  {
    v8 = [v7 firstObject];
    if ((unint64_t)[v7 count] < 2) {
      goto LABEL_9;
    }
    v9 = +[PGLogging sharedLogging];
    v10 = [v9 loggingConnection];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v8 localIdentifier];
      int v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_DEFAULT, "[PGSharedLibraryAssetsQuestionFactory] more than 1 scope configured, using first one: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    v12 = +[PGLogging sharedLogging];
    v10 = [v12 loggingConnection];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "[PGSharedLibraryAssetsQuestionFactory] no active scope", (uint8_t *)&v14, 2u);
    }
    v8 = 0;
  }

LABEL_9:
  return v8;
}

+ (BOOL)isSharedLibraryQuestionsEnabledForPhotoLibrary:(id)a3
{
  v3 = [a1 _libraryScopeFromPhotoLibrary:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_assetsFetchResultFromMoment:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PGSurveyQuestionFactory *)self workingContext];
  v6 = [v5 photoLibrary];

  v7 = [v6 librarySpecificFetchOptions];
  v8 = (void *)MEMORY[0x1E4F28BA0];
  v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"kindSubtype", 10);
  v19[0] = v9;
  v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"kindSubtype", 103);
  v19[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v12 = [v8 andPredicateWithSubpredicates:v11];

  [v7 setInternalPredicate:v12];
  v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v18[0] = v13;
  int v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v18[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  [v7 setSortDescriptors:v15];

  [v7 setWantsIncrementalChangeDetails:0];
  v16 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v4 options:v7];

  return v16;
}

- (id)_eligibleMomentsFetchResult
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v2 = [(PGSurveyQuestionFactory *)self workingContext];
  v3 = [v2 photoLibrary];

  id v4 = [(id)objc_opt_class() _libraryScopeFromPhotoLibrary:v3];
  if (v4)
  {
    v5 = [v3 librarySpecificFetchOptions];
    v6 = [MEMORY[0x1E4F39130] fetchLibraryScopeRulesForLibraryScope:v4 options:v5];
    v7 = [MEMORY[0x1E4F1C9C8] distantPast];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v27 + 1) + 8 * i) dateRangeCondition];
          int v14 = v13;
          if (v13 && [v13 criteria] == 2)
          {
            uint64_t v16 = [v14 endDate];

            v7 = (void *)v16;
            goto LABEL_14;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v37 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    v17 = +[PGLogging sharedLogging];
    v18 = [v17 loggingConnection];

    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = [v4 localIdentifier];
      *(_DWORD *)buf = 138412546;
      v34 = v19;
      __int16 v35 = 2112;
      v36 = v7;
      _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_INFO, "[PGSharedLibraryAssetsQuestionFactory] using scope: %@, with %@ start date", buf, 0x16u);
    }
    v20 = [v3 librarySpecificFetchOptions];
    uint64_t v32 = *MEMORY[0x1E4F394A8];
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    [v20 setFetchPropertySets:v21];

    v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"startDate >= %@", v7];
    [v20 setInternalPredicate:v22];

    v23 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    v31[0] = v23;
    v24 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
    v31[1] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    [v20 setSortDescriptors:v25];

    [v20 setWantsIncrementalChangeDetails:0];
    v15 = [MEMORY[0x1E4F391A0] fetchMomentsWithOptions:v20];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  v5 = (char *)_Block_copy(v4);
  double v6 = 0.0;
  if (!v5 || (double v7 = CFAbsoluteTimeGetCurrent(), v7 < 0.01))
  {
LABEL_8:
    uint64_t v9 = [(PGSurveyQuestionFactory *)self workingContext];
    uint64_t v10 = [v9 photoLibrary];

    if ([(id)objc_opt_class() isSharedLibraryQuestionsEnabledForPhotoLibrary:v10])
    {
      if (a3)
      {
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v12 = [(PGSharedLibraryAssetsQuestionFactory *)self _eligibleMomentsFetchResult];
        uint64_t v13 = [v12 count];
        if (v13)
        {
          unint64_t v14 = v13;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v15 = v12;
          uint64_t v42 = [v15 countByEnumeratingWithState:&v56 objects:v62 count:16];
          if (v42)
          {
            double v16 = 1.0 / (double)v14;
            uint64_t v17 = *(void *)v57;
            v40 = v5 + 16;
            double v18 = 0.0;
            unint64_t v19 = 0x1E4F1C000uLL;
            v47 = v5;
            id v48 = v4;
            v45 = v12;
            v46 = v10;
            v44 = v15;
            uint64_t v41 = *(void *)v57;
            while (2)
            {
              uint64_t v20 = 0;
              do
              {
                if (*(void *)v57 != v17) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v21 = *(void *)(*((void *)&v56 + 1) + 8 * v20);
                if (v5)
                {
                  double Current = CFAbsoluteTimeGetCurrent();
                  if (Current - v6 >= 0.01)
                  {
                    char v60 = 0;
                    (*((void (**)(char *, char *, double))v5 + 2))(v5, &v60, v18);
                    if (v60)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 67109378;
                        int v64 = 72;
                        __int16 v65 = 2080;
                        v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Questions/Survey/SharedLibrary/PGSharedLibraryAssetsQuestionFactory.m";
                        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                      }

                      goto LABEL_61;
                    }
                    double v6 = Current;
                  }
                }
                uint64_t v43 = v20;
                context = (void *)MEMORY[0x1D25FED50]();
                v23 = [(PGSharedLibraryAssetsQuestionFactory *)self _assetsFetchResultFromMoment:v21];
                v24 = [v23 lastObject];
                v25 = [v24 uuid];

                v26 = [*(id *)(v19 + 2504) distantPast];
                long long v52 = 0u;
                long long v53 = 0u;
                long long v54 = 0u;
                long long v55 = 0u;
                id v27 = v23;
                uint64_t v28 = [v27 countByEnumeratingWithState:&v52 objects:v61 count:16];
                if (v28)
                {
                  uint64_t v29 = v28;
                  uint64_t v30 = *(void *)v53;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v29; ++i)
                    {
                      if (*(void *)v53 != v30) {
                        objc_enumerationMutation(v27);
                      }
                      uint64_t v32 = *(void **)(*((void *)&v52 + 1) + 8 * i);
                      objc_msgSend(v32, "creationDate", v40);
                      v33 = (PGSharedLibraryAssetsQuestion *)objc_claimAutoreleasedReturnValue();
                      v34 = [v32 uuid];
                      if (([v25 isEqualToString:v34] & 1) != 0
                        || ([(PGSharedLibraryAssetsQuestion *)v33 timeIntervalSinceDate:v26],
                            v35 >= 600.0))
                      {
                        v36 = [[PGSharedLibraryAssetsQuestion alloc] initWithAssetUUID:v34];
                        if ([(PGSurveyQuestionFactory *)self shouldAddQuestion:v36 toAlreadyGeneratedQuestions:v11])
                        {
                          [v11 addObject:v36];
                          if ([v11 count] >= a3)
                          {

                            v5 = v47;
                            id v4 = v48;
                            v12 = v45;
                            uint64_t v10 = v46;
                            id v15 = v44;
                            goto LABEL_49;
                          }
                        }

                        v26 = v33;
                      }
                      else
                      {
                        v36 = v34;
                        v34 = v33;
                      }
                    }
                    uint64_t v29 = [v27 countByEnumeratingWithState:&v52 objects:v61 count:16];
                    if (v29) {
                      continue;
                    }
                    break;
                  }
                }

                double v18 = v16 + v18;
                uint64_t v20 = v43 + 1;
                v5 = v47;
                id v4 = v48;
                v12 = v45;
                uint64_t v10 = v46;
                id v15 = v44;
                uint64_t v17 = v41;
                unint64_t v19 = 0x1E4F1C000;
              }
              while (v43 + 1 != v42);
              uint64_t v42 = [v44 countByEnumeratingWithState:&v56 objects:v62 count:16];
              if (v42) {
                continue;
              }
              break;
            }
          }
LABEL_49:

          if (!v5
            || CFAbsoluteTimeGetCurrent() - v6 < 0.01
            || (char v60 = 0, (*((void (**)(char *, char *, double))v5 + 2))(v5, &v60, 1.0), !v60))
          {
            id v8 = objc_msgSend(v11, "allObjects", v40);
LABEL_62:

            goto LABEL_63;
          }
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
LABEL_61:
            id v8 = (void *)MEMORY[0x1E4F1CBF0];
            goto LABEL_62;
          }
          *(_DWORD *)buf = 67109378;
          int v64 = 103;
          __int16 v65 = 2080;
          v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questi"
                "ons/Survey/SharedLibrary/PGSharedLibraryAssetsQuestionFactory.m";
          uint64_t v38 = MEMORY[0x1E4F14500];
        }
        else
        {
          if (!v5) {
            goto LABEL_61;
          }
          if (CFAbsoluteTimeGetCurrent() - v6 < 0.01) {
            goto LABEL_61;
          }
          char v60 = 0;
          (*((void (**)(char *, char *, double))v5 + 2))(v5, &v60, 1.0);
          if (!v60 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
            goto LABEL_61;
          }
          *(_DWORD *)buf = 67109378;
          int v64 = 64;
          __int16 v65 = 2080;
          v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questi"
                "ons/Survey/SharedLibrary/PGSharedLibraryAssetsQuestionFactory.m";
          uint64_t v38 = MEMORY[0x1E4F14500];
        }
        _os_log_impl(&dword_1D1805000, v38, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_61;
      }
      if (!v5
        || CFAbsoluteTimeGetCurrent() - v6 < 0.01
        || (char v60 = 0, (*((void (**)(char *, char *, double))v5 + 2))(v5, &v60, 1.0), !v60)
        || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_47:
        id v8 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_63:

        goto LABEL_64;
      }
      *(_DWORD *)buf = 67109378;
      int v64 = 54;
      __int16 v65 = 2080;
      v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/SharedLibrary/PGSharedLibraryAssetsQuestionFactory.m";
      v37 = MEMORY[0x1E4F14500];
    }
    else
    {
      if (!v5) {
        goto LABEL_47;
      }
      if (CFAbsoluteTimeGetCurrent() - v6 < 0.01) {
        goto LABEL_47;
      }
      char v60 = 0;
      (*((void (**)(char *, char *, double))v5 + 2))(v5, &v60, 1.0);
      if (!v60 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_47;
      }
      *(_DWORD *)buf = 67109378;
      int v64 = 49;
      __int16 v65 = 2080;
      v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/SharedLibrary/PGSharedLibraryAssetsQuestionFactory.m";
      v37 = MEMORY[0x1E4F14500];
    }
    _os_log_impl(&dword_1D1805000, v37, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_47;
  }
  char v60 = 0;
  (*((void (**)(char *, char *, double))v5 + 2))(v5, &v60, 0.0);
  if (!v60)
  {
    double v6 = v7;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v64 = 45;
    __int16 v65 = 2080;
    v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/Su"
          "rvey/SharedLibrary/PGSharedLibraryAssetsQuestionFactory.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v8 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_64:

  return v8;
}

- (int64_t)questionOptions
{
  return 0x80000;
}

- (id)collidingQuestionTypes
{
  return &unk_1F28D4608;
}

- (unsigned)questionType
{
  return 20;
}

@end
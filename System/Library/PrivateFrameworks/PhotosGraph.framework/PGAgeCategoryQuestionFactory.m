@interface PGAgeCategoryQuestionFactory
- (BOOL)_shouldAddNewAgeCategoryQuestionForPersonUUID:(id)a3;
- (id)_sortedAgeCategories;
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
@end

@implementation PGAgeCategoryQuestionFactory

- (BOOL)_shouldAddNewAgeCategoryQuestionForPersonUUID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(PGSurveyQuestionFactory *)self existingQuestionsForEntityIdentifier:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "state", (void)v11) == 2 || !objc_msgSend(v8, "state"))
        {
          BOOL v9 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      BOOL v9 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v9 = 1;
  }
LABEL_13:

  return v9;
}

- (id)_sortedAgeCategories
{
  return &unk_1F28D4620;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA80] set];
  v8 = [(PGSurveyQuestionFactory *)self workingContext];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __73__PGAgeCategoryQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  uint64_t v16 = &unk_1E68F0568;
  id v19 = v6;
  unint64_t v20 = a3;
  v17 = self;
  id v18 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performSynchronousConcurrentGraphReadUsingBlock:&v13];

  long long v11 = objc_msgSend(v9, "allObjects", v13, v14, v15, v16, v17);

  return v11;
}

void __73__PGAgeCategoryQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void (**)(void *, unsigned char *, double))_Block_copy(*(const void **)(a1 + 48));
  if (!v4)
  {
    double v6 = 0.0;
    if (!*(void *)(a1 + 56)) {
      goto LABEL_61;
    }
LABEL_10:
    id v47 = v3;
    id v9 = [v3 graph];
    v50 = [*(id *)(a1 + 32) _sortedAgeCategories];
    v46 = v9;
    id v10 = [v9 personNodesIncludingMe:1];
    long long v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"localIdentifier" ascending:0];
    v64 = v11;
    long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
    v45 = v10;
    uint64_t v13 = [v10 sortedArrayUsingDescriptors:v12];

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obj = v13;
    uint64_t v52 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
    if (!v52)
    {
LABEL_55:

      v42 = v46;
      id v3 = v47;
      v43 = v45;
      if (v4)
      {
        if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
        {
          char v61 = 0;
          v4[2](v4, &v61, 1.0);
          if (v61)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v66 = 116;
              *(_WORD *)&v66[4] = 2080;
              *(void *)&v66[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Questions/Survey/AgeCategory/PGAgeCategoryQuestionFactory.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
LABEL_60:

      goto LABEL_61;
    }
    uint64_t v15 = *(void *)v58;
    *(void *)&long long v14 = 138412290;
    long long v44 = v14;
    v48 = v4;
    uint64_t v49 = *(void *)v58;
LABEL_12:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v58 != v15) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v57 + 1) + 8 * v16);
      uint64_t v18 = objc_msgSend(*(id *)(a1 + 40), "count", v44);
      if (v4)
      {
        unint64_t v19 = v18;
        unint64_t v20 = *(void *)(a1 + 56);
        double Current = CFAbsoluteTimeGetCurrent();
        if (Current - v6 >= 0.01)
        {
          char v61 = 0;
          v4[2](v4, &v61, (double)v19 / (double)v20);
          if (v61)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v66 = 62;
              *(_WORD *)&v66[4] = 2080;
              *(void *)&v66[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Questions/Survey/AgeCategory/PGAgeCategoryQuestionFactory.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            v42 = v46;
            id v3 = v47;
            v43 = v45;
            goto LABEL_60;
          }
          double v6 = Current;
        }
      }
      v22 = [v17 localIdentifier];
      v23 = [MEMORY[0x1E4F391F0] uuidFromLocalIdentifier:v22];
      if (!v23) {
        break;
      }
      if (![*(id *)(a1 + 32) _shouldAddNewAgeCategoryQuestionForPersonUUID:v23]) {
        goto LABEL_29;
      }
      v24 = (void *)[v50 mutableCopy];
      uint64_t v25 = [v17 ageCategory];
      if (v25)
      {
        uint64_t v26 = v25;
        v27 = [[PGAgeCategoryQuestion alloc] initWithPersonUUID:v23 ageCategory:v25 localFactoryScore:1.0];
        if ([*(id *)(a1 + 32) shouldAddQuestion:v27 toAlreadyGeneratedQuestions:*(void *)(a1 + 40)])
        {
          [*(id *)(a1 + 40) addObject:v27];
          unint64_t v28 = [*(id *)(a1 + 40) count];
          unint64_t v29 = *(void *)(a1 + 56);

          BOOL v30 = v28 >= v29;
          uint64_t v15 = v49;
          if (v30) {
            goto LABEL_55;
          }
          goto LABEL_43;
        }
        v33 = [NSNumber numberWithUnsignedInteger:v26];
        [v24 removeObject:v33];
      }
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v34 = v24;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v53 objects:v62 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v54;
        while (2)
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v54 != v37) {
              objc_enumerationMutation(v34);
            }
            v39 = -[PGAgeCategoryQuestion initWithPersonUUID:ageCategory:localFactoryScore:]([PGAgeCategoryQuestion alloc], "initWithPersonUUID:ageCategory:localFactoryScore:", v23, [*(id *)(*((void *)&v53 + 1) + 8 * i) unsignedIntegerValue], 0.5);
            if ([*(id *)(a1 + 32) shouldAddQuestion:v39 toAlreadyGeneratedQuestions:*(void *)(a1 + 40)])
            {
              [*(id *)(a1 + 40) addObject:v39];

              goto LABEL_41;
            }
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v53 objects:v62 count:16];
          if (v36) {
            continue;
          }
          break;
        }
      }
LABEL_41:

      unint64_t v40 = [*(id *)(a1 + 40) count];
      unint64_t v41 = *(void *)(a1 + 56);

      BOOL v30 = v40 >= v41;
      uint64_t v4 = v48;
      uint64_t v15 = v49;
      if (v30)
      {

        goto LABEL_55;
      }
LABEL_42:

LABEL_43:
      if (++v16 == v52)
      {
        uint64_t v52 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
        if (v52) {
          goto LABEL_12;
        }
        goto LABEL_55;
      }
    }
    v31 = +[PGLogging sharedLogging];
    v32 = [v31 loggingConnection];

    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v44;
      *(void *)v66 = v22;
      _os_log_error_impl(&dword_1D1805000, v32, OS_LOG_TYPE_ERROR, "Person uuid found to be nil given local identifier %@", buf, 0xCu);
    }

LABEL_29:
    goto LABEL_42;
  }
  double v5 = CFAbsoluteTimeGetCurrent();
  double v6 = 0.0;
  if (v5 >= 0.01)
  {
    double v7 = v5;
    char v61 = 0;
    v4[2](v4, &v61, 0.0);
    if (v61)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v66 = 45;
        *(_WORD *)&v66[4] = 2080;
        *(void *)&v66[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Questions/Survey/AgeCategory/PGAgeCategoryQuestionFactory.m";
        v8 = MEMORY[0x1E4F14500];
LABEL_50:
        _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_61;
      }
      goto LABEL_61;
    }
    double v6 = v7;
  }
  if (*(void *)(a1 + 56)) {
    goto LABEL_10;
  }
  if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
  {
    char v61 = 0;
    v4[2](v4, &v61, 1.0);
    if (v61)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v66 = 49;
        *(_WORD *)&v66[4] = 2080;
        *(void *)&v66[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Questions/Survey/AgeCategory/PGAgeCategoryQuestionFactory.m";
        v8 = MEMORY[0x1E4F14500];
        goto LABEL_50;
      }
    }
  }
LABEL_61:
}

- (int64_t)questionOptions
{
  return 512;
}

- (unsigned)questionType
{
  return 10;
}

@end
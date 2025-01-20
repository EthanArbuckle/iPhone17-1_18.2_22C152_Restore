@interface PGMemoryQualityQuestionFactory
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
@end

@implementation PGMemoryQualityQuestionFactory

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(void *, unsigned char *, double))_Block_copy(a4);
  if (v6)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v8 = 0.0;
    if (Current >= 0.01)
    {
      double v9 = Current;
      char v66 = 0;
      v6[2](v6, &v66, 0.0);
      if (v66)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
LABEL_28:
          v21 = (void *)MEMORY[0x1E4F1CBF0];
          goto LABEL_60;
        }
        *(_DWORD *)buf = 67109378;
        int v71 = 38;
        __int16 v72 = 2080;
        v73 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/MemoryQuality/PGMemoryQualityQuestionFactory.m";
        v10 = MEMORY[0x1E4F14500];
LABEL_27:
        _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_28;
      }
      double v8 = v9;
    }
    if (!a3)
    {
      if (CFAbsoluteTimeGetCurrent() - v8 < 0.01) {
        goto LABEL_28;
      }
      char v66 = 0;
      v6[2](v6, &v66, 1.0);
      if (!v66 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 67109378;
      int v71 = 42;
      __int16 v72 = 2080;
      v73 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/MemoryQuality/PGMemoryQualityQuestionFactory.m";
      v10 = MEMORY[0x1E4F14500];
      goto LABEL_27;
    }
  }
  else
  {
    double v8 = 0.0;
    if (!a3) {
      goto LABEL_28;
    }
  }
  unint64_t v59 = a3;
  v11 = [MEMORY[0x1E4F1CA80] set];
  v12 = [(PGSurveyQuestionFactory *)self fetchExistingQuestions];
  v13 = [MEMORY[0x1E4F1CA48] array];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v63 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [*(id *)(*((void *)&v62 + 1) + 8 * i) entityIdentifier];
        [v13 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v62 objects:v69 count:16];
    }
    while (v16);
  }

  if (v6)
  {
    double v20 = CFAbsoluteTimeGetCurrent();
    if (v20 - v8 >= 0.01)
    {
      char v66 = 0;
      v6[2](v6, &v66, 0.25);
      if (v66)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v71 = 55;
          __int16 v72 = 2080;
          v73 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questi"
                "ons/Survey/MemoryQuality/PGMemoryQualityQuestionFactory.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v21 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_59;
      }
      double v8 = v20;
    }
  }
  v22 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v23 = [v22 dateByAddingTimeInterval:-31557600.0];

  v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (uuid IN %@)", v13];
  v68[0] = v24;
  v57 = (void *)v23;
  [MEMORY[0x1E4F28F60] predicateWithFormat:@"creationDate >= %@", v23];
  v25 = v60 = self;
  v68[1] = v25;
  v26 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"curatedAssets.@count >= %d", 13);
  v68[2] = v26;
  v27 = (void *)MEMORY[0x1E4F39160];
  [MEMORY[0x1E4F28B98] predicateWithFormat:@"userCreated == NO"];
  v28 = v58 = v6;
  v29 = [v27 fetchPredicateFromUserCreatedComparisonPredicate:v28];
  v68[3] = v29;
  uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:4];

  v6 = v58;
  v31 = [(PGSurveyQuestionFactory *)v60 workingContext];
  v32 = [v31 photoLibrary];
  v33 = [v32 librarySpecificFetchOptions];

  v56 = (void *)v30;
  v34 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v30];
  [v33 setInternalPredicate:v34];

  v35 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:1];
  v67[0] = v35;
  v36 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v67[1] = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
  [v33 setSortDescriptors:v37];

  v61 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v33];
  if (v58)
  {
    double v38 = CFAbsoluteTimeGetCurrent();
    unint64_t v39 = v59;
    if (v38 - v8 >= 0.01)
    {
      char v66 = 0;
      v58[2](v58, &v66, 0.5);
      if (v66)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v71 = 67;
          __int16 v72 = 2080;
          v73 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questi"
                "ons/Survey/MemoryQuality/PGMemoryQualityQuestionFactory.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v21 = (void *)MEMORY[0x1E4F1CBF0];
        v41 = v56;
        v40 = v57;
        goto LABEL_58;
      }
      double v8 = v38;
    }
  }
  else
  {
    unint64_t v39 = v59;
  }
  v55 = v33;
  unint64_t v42 = [v61 count];
  double v43 = (double)v39;
  unint64_t v44 = vcvtmd_u64_f64((double)v42 / (double)v39);
  if (v44 <= 1) {
    uint64_t v45 = 1;
  }
  else {
    uint64_t v45 = v44;
  }
  if (!v42)
  {
LABEL_51:
    v41 = v56;
    v40 = v57;
    v33 = v55;
    if (v6 && CFAbsoluteTimeGetCurrent() - v8 >= 0.01 && (char v66 = 0, v6[2](v6, &v66, 1.0), v66))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v71 = 86;
        __int16 v72 = 2080;
        v73 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/MemoryQuality/PGMemoryQualityQuestionFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v21 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v21 = [v11 allObjects];
    }
    goto LABEL_58;
  }
  unint64_t v46 = v42;
  unint64_t v47 = 0;
  while (1)
  {
    uint64_t v48 = [v11 count];
    if (v6)
    {
      unint64_t v49 = v48;
      double v50 = CFAbsoluteTimeGetCurrent();
      if (v50 - v8 >= 0.01) {
        break;
      }
    }
LABEL_47:
    v51 = [v61 objectAtIndexedSubscript:v47];
    v52 = [[PGMemoryQualityQuestion alloc] initWithMemory:v51 localFactoryScore:1.0];
    [v11 addObject:v52];
    unint64_t v53 = [v11 count];

    if (v53 >= v59)
    {
      v6 = v58;
      goto LABEL_51;
    }
    v47 += v45;
    v6 = v58;
    if (v47 >= v46) {
      goto LABEL_51;
    }
  }
  char v66 = 0;
  v6[2](v6, &v66, (double)v49 * 0.5 / v43 + 0.5);
  if (!v66)
  {
    double v8 = v50;
    goto LABEL_47;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v71 = 75;
    __int16 v72 = 2080;
    v73 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/Su"
          "rvey/MemoryQuality/PGMemoryQualityQuestionFactory.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v21 = (void *)MEMORY[0x1E4F1CBF0];
  v41 = v56;
  v40 = v57;
  v33 = v55;
LABEL_58:

LABEL_59:
LABEL_60:

  return v21;
}

- (int64_t)questionOptions
{
  return 1024;
}

- (unsigned)questionType
{
  return 11;
}

@end
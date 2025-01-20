@interface PGAlbumClassificationQuestionFactory
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
@end

@implementation PGAlbumClassificationQuestionFactory

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v29 = (void (**)(void *, unsigned char *, double))_Block_copy(a4);
  if (v29)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v7 = 0.0;
    if (Current >= 0.01)
    {
      double v8 = Current;
      char v34 = 0;
      v29[2](v29, &v34, 0.0);
      if (v34)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
LABEL_38:
          v26 = (void *)MEMORY[0x1E4F1CBF0];
          goto LABEL_39;
        }
        *(_DWORD *)buf = 67109378;
        int v37 = 33;
        __int16 v38 = 2080;
        v39 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/AlbumClassification/PGAlbumClassificationQuestionFactory.m";
        v9 = MEMORY[0x1E4F14500];
LABEL_37:
        _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_38;
      }
      double v7 = v8;
    }
    if (!a3)
    {
      if (CFAbsoluteTimeGetCurrent() - v7 < 0.01) {
        goto LABEL_38;
      }
      char v34 = 0;
      v29[2](v29, &v34, 1.0);
      if (!v34 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_38;
      }
      *(_DWORD *)buf = 67109378;
      int v37 = 36;
      __int16 v38 = 2080;
      v39 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/AlbumClassification/PGAlbumClassificationQuestionFactory.m";
      v9 = MEMORY[0x1E4F14500];
      goto LABEL_37;
    }
  }
  else
  {
    double v7 = 0.0;
    if (!a3) {
      goto LABEL_38;
    }
  }
  v10 = [MEMORY[0x1E4F1CA80] set];
  v11 = [(PGSurveyQuestionFactory *)self workingContext];
  v12 = [v11 photoLibrary];
  v13 = [v12 librarySpecificFetchOptions];

  v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"estimatedAssetCount > 0"];
  [v13 setPredicate:v14];

  [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:1 subtype:2 options:v13];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v20 = [PGAlbumClassificationQuestion alloc];
        v21 = [v19 uuid];
        v22 = [(PGAlbumClassificationQuestion *)v20 initWithAlbumUUID:v21 localFactoryScore:1.0];

        if ([(PGSurveyQuestionFactory *)self shouldAddQuestion:v22 toAlreadyGeneratedQuestions:v10])
        {
          [v10 addObject:v22];
          uint64_t v23 = [v10 count];
          if (v29)
          {
            unint64_t v24 = v23;
            double v25 = CFAbsoluteTimeGetCurrent();
            if (v25 - v7 >= 0.01)
            {
              char v34 = 0;
              v29[2](v29, &v34, (double)(v24 / a3));
              if (v34)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  int v37 = 50;
                  __int16 v38 = 2080;
                  v39 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewor"
                        "k/Questions/Survey/AlbumClassification/PGAlbumClassificationQuestionFactory.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }

                v26 = (void *)MEMORY[0x1E4F1CBF0];
                goto LABEL_32;
              }
              double v7 = v25;
            }
          }
          if ([v10 count] >= a3)
          {

            goto LABEL_25;
          }
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_25:

  if (v29 && CFAbsoluteTimeGetCurrent() - v7 >= 0.01 && (char v34 = 0, v29[2](v29, &v34, 1.0), v34))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v37 = 57;
      __int16 v38 = 2080;
      v39 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/AlbumClassification/PGAlbumClassificationQuestionFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v26 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v26 = [v10 allObjects];
  }
LABEL_32:

LABEL_39:
  return v26;
}

- (int64_t)questionOptions
{
  return 0x400000;
}

- (unsigned)questionType
{
  return 24;
}

@end
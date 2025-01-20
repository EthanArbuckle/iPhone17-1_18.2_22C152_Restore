@interface PGHolidayQuestionFactory
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
@end

@implementation PGHolidayQuestionFactory

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA80] set];
  v8 = [(PGSurveyQuestionFactory *)self workingContext];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __69__PGHolidayQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
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

void __69__PGHolidayQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void (**)(void *, unsigned char *, double))_Block_copy(*(const void **)(a1 + 48));
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v30 = 0;
  v31 = (double *)&v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  if (!v4)
  {
    if (!*(void *)(a1 + 56)) {
      goto LABEL_19;
    }
    goto LABEL_13;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - v31[3] >= 0.01)
  {
    v31[3] = Current;
    char v29 = 0;
    v4[2](v4, &v29, 0.0);
    char v6 = *((unsigned char *)v35 + 24) | v29;
    *((unsigned char *)v35 + 24) = v6;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v39 = 42;
        __int16 v40 = 2080;
        v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Holiday/PGHolidayQuestionFactory.m";
        v7 = MEMORY[0x1E4F14500];
LABEL_11:
        _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
  }
  if (*(void *)(a1 + 56))
  {
LABEL_13:
    id v10 = [v3 graph];
    id v11 = objc_alloc(MEMORY[0x1E4F8E768]);
    v12 = [*(id *)(a1 + 32) workingContext];
    uint64_t v13 = [v12 photoLibrary];
    uint64_t v14 = (void *)[v11 initWithPhotoLibrary:v13];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __69__PGHolidayQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_192;
    v21[3] = &unk_1E68E8D98;
    v21[4] = *(void *)(a1 + 32);
    id v15 = v14;
    id v22 = v15;
    id v16 = *(id *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 56);
    id v23 = v16;
    uint64_t v27 = v17;
    id v18 = v4;
    id v24 = v18;
    v25 = &v30;
    uint64_t v28 = 0x3F847AE147AE147BLL;
    v26 = &v34;
    [v10 enumerateCelebratedHolidayNodesUsingBlock:v21];
    if (v4)
    {
      double v19 = CFAbsoluteTimeGetCurrent();
      if (v19 - v31[3] >= 0.01)
      {
        v31[3] = v19;
        char v29 = 0;
        v18[2](v18, &v29, 1.0);
        char v20 = *((unsigned char *)v35 + 24) | v29;
        *((unsigned char *)v35 + 24) = v20;
        if (v20)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v39 = 89;
            __int16 v40 = 2080;
            v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Ques"
                  "tions/Survey/Holiday/PGHolidayQuestionFactory.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }

    goto LABEL_19;
  }
  double v8 = CFAbsoluteTimeGetCurrent();
  if (v8 - v31[3] >= 0.01)
  {
    v31[3] = v8;
    char v29 = 0;
    v4[2](v4, &v29, 0.0);
    char v9 = *((unsigned char *)v35 + 24) | v29;
    *((unsigned char *)v35 + 24) = v9;
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v39 = 46;
        __int16 v40 = 2080;
        v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Holiday/PGHolidayQuestionFactory.m";
        v7 = MEMORY[0x1E4F14500];
        goto LABEL_11;
      }
    }
  }
LABEL_19:
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
}

void __69__PGHolidayQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_192(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  char v6 = [v5 name];
  if (v6)
  {
    v7 = [v5 localizedName];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__PGHolidayQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_194;
    v14[3] = &unk_1E68E8D70;
    double v8 = *(void **)(a1 + 40);
    v14[4] = *(void *)(a1 + 32);
    id v15 = v8;
    id v16 = v6;
    char v9 = v7;
    uint64_t v17 = v9;
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 80);
    id v18 = v10;
    uint64_t v21 = v11;
    id v22 = a3;
    id v19 = *(id *)(a1 + 56);
    uint64_t v23 = *(void *)(a1 + 88);
    long long v20 = *(_OWORD *)(a1 + 64);
    [v5 enumerateCelebratingMomentNodesUsingBlock:v14];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
      *a3 = 1;
    }
  }
  else
  {
    v12 = +[PGLogging sharedLogging];
    char v9 = [v12 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [v5 UUID];
      *(_DWORD *)buf = 138412290;
      v25 = v13;
      _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "Holiday node with uuid %@ has nil name, not generating question for it", buf, 0xCu);
    }
  }
}

void __69__PGHolidayQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_194(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) representativeAssetsFromMomentNode:a2 curationContext:*(void *)(a1 + 40)];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = [PGHolidayQuestion alloc];
        v12 = [v10 uuid];
        uint64_t v13 = [(PGHolidayQuestion *)v11 initWithAssetUUID:v12 holidayName:*(void *)(a1 + 48) localizedHolidayName:*(void *)(a1 + 56) localFactoryScore:1.0];

        if ([*(id *)(a1 + 32) shouldAddQuestion:v13 toAlreadyGeneratedQuestions:*(void *)(a1 + 64)])
        {
          [*(id *)(a1 + 64) addObject:v13];
          if ((unint64_t)[*(id *)(a1 + 64) count] >= *(void *)(a1 + 96))
          {
            *a3 = 1;
            **(unsigned char **)(a1 + 104) = 1;
LABEL_16:

            goto LABEL_17;
          }
        }
        uint64_t v14 = [*(id *)(a1 + 64) count];
        if (*(void *)(a1 + 72))
        {
          unint64_t v15 = v14;
          unint64_t v16 = *(void *)(a1 + 96);
          double Current = CFAbsoluteTimeGetCurrent();
          uint64_t v18 = *(void *)(*(void *)(a1 + 80) + 8);
          if (Current - *(double *)(v18 + 24) >= *(double *)(a1 + 112))
          {
            *(double *)(v18 + 24) = Current;
            (*(void (**)(double))(*(void *)(a1 + 72) + 16))((double)v15 / (double)v16);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88)
                                                                                              + 8)
                                                                                  + 24);
            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
            {
              *a3 = 1;
              goto LABEL_16;
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_17:
}

- (int64_t)questionOptions
{
  return 64;
}

- (unsigned)questionType
{
  return 7;
}

@end
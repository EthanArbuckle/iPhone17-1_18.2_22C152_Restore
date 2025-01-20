@interface PGPublicEventQuestionFactory
- (BOOL)_shouldAddNewPublicEventQuestionForAssetUUID:(id)a3;
- (double)_publicEventLocalFactoryScoreForMomentNode:(id)a3;
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
@end

@implementation PGPublicEventQuestionFactory

- (BOOL)_shouldAddNewPublicEventQuestionForAssetUUID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(PGSurveyQuestionFactory *)self existingQuestionsForEntityIdentifier:a3];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "state", (void)v10) == 2)
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (double)_publicEventLocalFactoryScoreForMomentNode:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 publicEventNodes];
  unint64_t v5 = [v4 count];

  if (v5)
  {
    double v6 = 1.0 / (double)v5;
    if (v6 != 0.0) {
      goto LABEL_8;
    }
  }
  else
  {
    double v6 = 0.0;
  }
  v7 = +[PGLogging sharedLogging];
  BOOL v8 = [v7 loggingConnection];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    long long v10 = [v3 localIdentifier];
    int v11 = 138412290;
    long long v12 = v10;
    _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "Moment node %@ found to have no public event nodes which is unexpected.", (uint8_t *)&v11, 0xCu);
  }
LABEL_8:

  return v6;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA80] set];
  BOOL v8 = [(PGSurveyQuestionFactory *)self workingContext];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __73__PGPublicEventQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  v16 = &unk_1E68F0568;
  id v19 = v6;
  unint64_t v20 = a3;
  v17 = self;
  id v18 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performSynchronousConcurrentGraphReadUsingBlock:&v13];

  int v11 = objc_msgSend(v9, "allObjects", v13, v14, v15, v16, v17);

  return v11;
}

void __73__PGPublicEventQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void (**)(void *, unsigned char *, double))_Block_copy(*(const void **)(a1 + 48));
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
        int v39 = 44;
        __int16 v40 = 2080;
        v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/PublicEvent/PGPublicEventQuestionFactory.m";
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
    long long v12 = [*(id *)(a1 + 32) workingContext];
    uint64_t v13 = [v12 photoLibrary];
    uint64_t v14 = (void *)[v11 initWithPhotoLibrary:v13];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __73__PGPublicEventQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_192;
    v21[3] = &unk_1E68F0540;
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
    [v10 enumeratePublicEventNodesUsingBlock:v21];
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
            int v39 = 99;
            __int16 v40 = 2080;
            v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Ques"
                  "tions/Survey/PublicEvent/PGPublicEventQuestionFactory.m";
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
    v4[2](v4, &v29, 1.0);
    char v9 = *((unsigned char *)v35 + 24) | v29;
    *((unsigned char *)v35 + 24) = v9;
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v39 = 48;
        __int16 v40 = 2080;
        v41 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/PublicEvent/PGPublicEventQuestionFactory.m";
        v7 = MEMORY[0x1E4F14500];
        goto LABEL_11;
      }
    }
  }
LABEL_19:
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
}

void __73__PGPublicEventQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_192(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  char v6 = [v5 collection];
  v7 = [v6 momentNodes];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__PGPublicEventQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_2;
  v13[3] = &unk_1E68F0518;
  id v8 = v5;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v14 = v8;
  uint64_t v15 = v9;
  id v16 = v10;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 80);
  id v17 = v11;
  uint64_t v20 = v12;
  v21 = a3;
  id v18 = *(id *)(a1 + 56);
  uint64_t v22 = *(void *)(a1 + 88);
  long long v19 = *(_OWORD *)(a1 + 64);
  [v7 enumerateNodesUsingBlock:v13];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
    *a3 = 1;
  }
}

void __73__PGPublicEventQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) muid];
  v7 = [*(id *)(a1 + 32) name];
  if (v7)
  {
    [*(id *)(a1 + 40) _publicEventLocalFactoryScoreForMomentNode:v5];
    double v9 = v8;
    id v10 = [*(id *)(a1 + 32) businessNode];
    [v10 coordinates];
    double v12 = v11;
    double v14 = v13;
    uint64_t v15 = *(void **)(a1 + 40);
    [v10 radius];
    id v17 = objc_msgSend(v15, "assetFromMomentNode:closestToLocationCoordinate:radius:curationContext:", v5, *(void *)(a1 + 48), v12, v14, v16);
    id v18 = v17;
    if (v17)
    {
      long long v19 = *(void **)(a1 + 40);
      uint64_t v20 = [v17 uuid];
      LODWORD(v19) = [v19 _shouldAddNewPublicEventQuestionForAssetUUID:v20];

      if (v19)
      {
        v21 = [PGPublicEventQuestion alloc];
        uint64_t v22 = [v18 uuid];
        id v23 = [(PGPublicEventQuestion *)v21 initWithAssetUUID:v22 publicEventMUID:v6 publicEventName:v7 localFactoryScore:v9];

        if (![*(id *)(a1 + 40) shouldAddQuestion:v23 toAlreadyGeneratedQuestions:*(void *)(a1 + 56)]|| (objc_msgSend(*(id *)(a1 + 56), "addObject:", v23), (unint64_t)objc_msgSend(*(id *)(a1 + 56), "count") < *(void *)(a1 + 88)))
        {

          goto LABEL_7;
        }
        *a3 = 1;
        **(unsigned char **)(a1 + 96) = 1;
      }
LABEL_14:

      goto LABEL_15;
    }
LABEL_7:
    uint64_t v24 = [*(id *)(a1 + 56) count];
    if (*(void *)(a1 + 64))
    {
      unint64_t v25 = v24;
      unint64_t v26 = *(void *)(a1 + 88);
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v28 = *(void *)(*(void *)(a1 + 72) + 8);
      if (Current - *(double *)(v28 + 24) >= *(double *)(a1 + 104))
      {
        *(double *)(v28 + 24) = Current;
        LOBYTE(v30[0]) = 0;
        (*(void (**)(double))(*(void *)(a1 + 64) + 16))((double)v25 / (double)v26);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                              + 24);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
          *a3 = 1;
        }
      }
    }
    goto LABEL_14;
  }
  char v29 = +[PGLogging sharedLogging];
  id v10 = [v29 loggingConnection];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v30[0] = 67109120;
    v30[1] = v6;
    _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "Public event with muid %d has nil name, not generating question for it", (uint8_t *)v30, 8u);
  }
LABEL_15:
}

- (int64_t)questionOptions
{
  return 32;
}

- (unsigned)questionType
{
  return 6;
}

@end
@interface PGPetQuestionFactory
+ (id)petSceneLabels;
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (id)initialPetQuestion;
- (int64_t)questionOptions;
- (unsigned)questionType;
- (void)updateInitialQuestion:(id)a3;
@end

@implementation PGPetQuestionFactory

+ (id)petSceneLabels
{
  return &unk_1F28D3BA0;
}

- (void)updateInitialQuestion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PGSurveyQuestionFactory *)self workingContext];
  v6 = [v5 photoLibrary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__PGPetQuestionFactory_updateInitialQuestion___block_invoke;
  v12[3] = &unk_1E68F0B18;
  id v7 = v4;
  id v13 = v7;
  id v11 = 0;
  [v6 performChangesAndWait:v12 error:&v11];
  id v8 = v11;

  if (v8)
  {
    v9 = +[PGLogging sharedLogging];
    v10 = [v9 loggingConnection];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v8;
      _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "[Questions] Error performing library changes for pet inital question: %@", buf, 0xCu);
    }
  }
}

void __46__PGPetQuestionFactory_updateInitialQuestion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F39258] changeRequestForQuestion:*(void *)(a1 + 32)];
  [v2 setState:0];
  v1 = [MEMORY[0x1E4F1C9C8] date];
  [v2 setCreationDate:v1];
}

- (id)initialPetQuestion
{
  id v2 = [(PGSurveyQuestionFactory *)self workingContext];
  v3 = [v2 photoLibrary];
  id v4 = [v3 librarySpecificFetchOptions];

  [v4 setFetchLimit:1];
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"type = %d AND entityType = %d AND entityIdentifier = %@", 13, 4, @"PET_INITIAL_QUESTION_FAKE_ASSET"];
  [v4 setPredicate:v5];

  v6 = [MEMORY[0x1E4F39250] fetchQuestionsWithOptions:v4 validQuestionsOnly:0];
  id v7 = [v6 firstObject];

  return v7;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void (**)(void *, unsigned char *, double))_Block_copy(v6);
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v32 = 0;
  v33 = (double *)&v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  if (v7)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v33[3] >= 0.01)
    {
      v33[3] = Current;
      char v31 = 0;
      v7[2](v7, &v31, 0.0);
      char v9 = *((unsigned char *)v37 + 24) | v31;
      *((unsigned char *)v37 + 24) = v9;
      if (v9)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
LABEL_19:
          v21 = (void *)MEMORY[0x1E4F1CBF0];
          goto LABEL_22;
        }
        *(_DWORD *)buf = 67109378;
        int v41 = 48;
        __int16 v42 = 2080;
        v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Pet/PGPetQuestionFactory.m";
        v10 = MEMORY[0x1E4F14500];
LABEL_11:
        _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_19;
      }
    }
    if (!a3)
    {
      double v11 = CFAbsoluteTimeGetCurrent();
      if (v11 - v33[3] < 0.01) {
        goto LABEL_19;
      }
      v33[3] = v11;
      char v31 = 0;
      v7[2](v7, &v31, 1.0);
      char v12 = *((unsigned char *)v37 + 24) | v31;
      *((unsigned char *)v37 + 24) = v12;
      if (!v12 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 67109378;
      int v41 = 52;
      __int16 v42 = 2080;
      v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Pet/PGPetQuestionFactory.m";
      v10 = MEMORY[0x1E4F14500];
      goto LABEL_11;
    }
  }
  else if (!a3)
  {
    goto LABEL_19;
  }
  id v13 = [MEMORY[0x1E4F1CA80] set];
  v14 = [(PGSurveyQuestionFactory *)self workingContext];
  id v15 = [v14 photoLibrary];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __65__PGPetQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  v23[3] = &unk_1E68E6158;
  v23[4] = self;
  id v16 = v13;
  id v24 = v16;
  id v17 = v15;
  id v25 = v17;
  unint64_t v29 = a3;
  v18 = v7;
  id v26 = v18;
  v27 = &v32;
  uint64_t v30 = 0x3F847AE147AE147BLL;
  v28 = &v36;
  [v14 performSynchronousConcurrentGraphReadUsingBlock:v23];
  if (v7
    && (double v19 = CFAbsoluteTimeGetCurrent(), v19 - v33[3] >= 0.01)
    && (v33[3] = v19,
        char v31 = 0,
        v18[2](v18, &v31, 1.0),
        char v20 = *((unsigned char *)v37 + 24) | v31,
        (*((unsigned char *)v37 + 24) = v20) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v41 = 114;
      __int16 v42 = 2080;
      v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Pet/PGPetQuestionFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v21 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v21 = [v16 allObjects];
  }

LABEL_22:
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v21;
}

void __65__PGPetQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) initialPetQuestion];
  v5 = v4;
  if (v4)
  {
    if ([v4 state])
    {
      if ([v5 state] == 3 || objc_msgSend(v5, "state") == 1)
      {
        id v6 = [v5 creationDate];
        [v6 timeIntervalSinceNow];
        double v8 = v7;

        if (v8 < -15778800.0) {
          [*(id *)(a1 + 32) updateInitialQuestion:v5];
        }
      }
      else
      {
        v10 = [v3 graph];
        double v11 = +[PGGraphNodeCollection nodesInGraph:v10];

        uint64_t v30 = v11;
        char v12 = [v11 localIdentifiers];
        id v13 = [v12 allObjects];

        v14 = [*(id *)(a1 + 48) librarySpecificFetchOptions];
        id v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"faceCount" ascending:0];
        v31[0] = v15;
        id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
        [v14 setSortDescriptors:v16];

        [v14 setIncludedDetectionTypes:&unk_1F28D3B88];
        [v14 setPersonContext:1];
        unint64_t v29 = v14;
        id v17 = [MEMORY[0x1E4F391F0] fetchPersonsWithLocalIdentifiers:v13 options:v14];
        if ([v17 count])
        {
          uint64_t v18 = 0;
          while (1)
          {
            double v19 = (void *)MEMORY[0x1D25FED50]();
            char v20 = [v17 objectAtIndexedSubscript:v18];
            v21 = [PGPetQuestion alloc];
            v22 = [v20 uuid];
            v23 = [(PGPetQuestion *)v21 initWithPetUUID:v22 displayString:0 localFactoryScore:1.0];

            if ([*(id *)(a1 + 32) shouldAddQuestion:v23 toAlreadyGeneratedQuestions:*(void *)(a1 + 40)])
            {
              [*(id *)(a1 + 40) addObject:v23];
              uint64_t v24 = [*(id *)(a1 + 40) count];
              if (*(void *)(a1 + 56))
              {
                unint64_t v25 = v24;
                unint64_t v26 = *(void *)(a1 + 80);
                double Current = CFAbsoluteTimeGetCurrent();
                uint64_t v28 = *(void *)(*(void *)(a1 + 64) + 8);
                if (Current - *(double *)(v28 + 24) >= *(double *)(a1 + 88))
                {
                  *(double *)(v28 + 24) = Current;
                  (*(void (**)(double))(*(void *)(a1 + 56) + 16))((double)v25 / (double)v26);
                  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                                        + 24);
                  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
                    break;
                  }
                }
              }
              if ((unint64_t)[*(id *)(a1 + 40) count] >= *(void *)(a1 + 80)) {
                break;
              }
            }

            if (++v18 >= (unint64_t)[v17 count]) {
              goto LABEL_18;
            }
          }
        }
LABEL_18:
      }
    }
  }
  else
  {
    char v9 = [[PGPetQuestion alloc] initWithPetUUID:@"PET_INITIAL_QUESTION_FAKE_ASSET" displayString:@"🐶 🐱" localFactoryScore:1.0];
    [*(id *)(a1 + 40) addObject:v9];
  }
}

- (int64_t)questionOptions
{
  return 4096;
}

- (unsigned)questionType
{
  return 13;
}

@end
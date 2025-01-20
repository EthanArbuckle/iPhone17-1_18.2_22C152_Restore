@interface PGMemoryMusicEnergyQuestionFactory
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
@end

@implementation PGMemoryMusicEnergyQuestionFactory

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void (**)(void *, unsigned char *, double))_Block_copy(v6);
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v34 = 0;
  v35 = (double *)&v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  if (v7)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v35[3] >= 0.01)
    {
      v35[3] = Current;
      char v33 = 0;
      v7[2](v7, &v33, 0.0);
      char v9 = *((unsigned char *)v39 + 24) | v33;
      *((unsigned char *)v39 + 24) = v9;
      if (v9)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
LABEL_19:
          v20 = (void *)MEMORY[0x1E4F1CBF0];
          goto LABEL_22;
        }
        *(_DWORD *)buf = 67109378;
        int v43 = 43;
        __int16 v44 = 2080;
        v45 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Music/MusicEnergy/PGMemoryMusicEnergyQuestionFactory.m";
        v10 = MEMORY[0x1E4F14500];
LABEL_11:
        _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_19;
      }
    }
    if (!a3)
    {
      double v11 = CFAbsoluteTimeGetCurrent();
      if (v11 - v35[3] < 0.01) {
        goto LABEL_19;
      }
      v35[3] = v11;
      char v33 = 0;
      v7[2](v7, &v33, 1.0);
      char v12 = *((unsigned char *)v39 + 24) | v33;
      *((unsigned char *)v39 + 24) = v12;
      if (!v12 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 67109378;
      int v43 = 47;
      __int16 v44 = 2080;
      v45 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Music/MusicEnergy/PGMemoryMusicEnergyQuestionFactory.m";
      v10 = MEMORY[0x1E4F14500];
      goto LABEL_11;
    }
  }
  else if (!a3)
  {
    goto LABEL_19;
  }
  v13 = [MEMORY[0x1E4F1CA80] set];
  v14 = [(PGSurveyQuestionFactory *)self workingContext];
  v15 = [v14 photoLibrary];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __79__PGMemoryMusicEnergyQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  v25 = &unk_1E68E6288;
  v26 = self;
  id v16 = v13;
  id v27 = v16;
  unint64_t v31 = a3;
  v17 = v7;
  id v28 = v17;
  v29 = &v34;
  uint64_t v32 = 0x3F847AE147AE147BLL;
  v30 = &v38;
  +[PGMemoryMusicQuestionUtils enumerateMemoryMusicSuggestionsInPhotoLibrary:v15 block:&v22];

  if (v7
    && (double v18 = CFAbsoluteTimeGetCurrent(), v18 - v35[3] >= 0.01)
    && (v35[3] = v18,
        char v33 = 0,
        v17[2](v17, &v33, 1.0),
        char v19 = *((unsigned char *)v39 + 24) | v33,
        (*((unsigned char *)v39 + 24) = v19) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v43 = 71;
      __int16 v44 = 2080;
      v45 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Music/MusicEnergy/PGMemoryMusicEnergyQuestionFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v20 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v20 = objc_msgSend(v16, "allObjects", v22, v23, v24, v25, v26, v27);
  }

LABEL_22:
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  return v20;
}

void __79__PGMemoryMusicEnergyQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  char v9 = (void *)MEMORY[0x1D25FED50]();
  v10 = [[PGMemoryMusicEnergyQuestion alloc] initWithMemory:v7 song:v8 localFactoryScore:1.0];
  if ([*(id *)(a1 + 32) shouldAddQuestion:v10 toAlreadyGeneratedQuestions:*(void *)(a1 + 40)])
  {
    [*(id *)(a1 + 40) addObject:v10];
    if ((unint64_t)[*(id *)(a1 + 40) count] >= *(void *)(a1 + 72)) {
      *a4 = 1;
    }
  }
  uint64_t v11 = [*(id *)(a1 + 40) count];
  if (*(void *)(a1 + 48))
  {
    unint64_t v12 = v11;
    unint64_t v13 = *(void *)(a1 + 72);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    if (Current - *(double *)(v15 + 24) >= *(double *)(a1 + 80))
    {
      *(double *)(v15 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 48) + 16))((double)v12 / (double)v13);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
        *a4 = 1;
      }
    }
  }
}

- (int64_t)questionOptions
{
  return 0x8000;
}

- (unsigned)questionType
{
  return 16;
}

@end
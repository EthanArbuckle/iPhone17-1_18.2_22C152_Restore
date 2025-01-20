@interface PGMemoryMusicQualityQuestionFactory
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
@end

@implementation PGMemoryMusicQualityQuestionFactory

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void (**)(void *, unsigned char *, double))_Block_copy(v6);
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  uint64_t v37 = 0;
  v38 = (double *)&v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  if (v7)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v38[3] >= 0.01)
    {
      v38[3] = Current;
      char v36 = 0;
      v7[2](v7, &v36, 0.0);
      char v9 = *((unsigned char *)v42 + 24) | v36;
      *((unsigned char *)v42 + 24) = v9;
      if (v9)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
LABEL_17:
          v19 = (void *)MEMORY[0x1E4F1CBF0];
          goto LABEL_29;
        }
        *(_DWORD *)buf = 67109378;
        int v46 = 41;
        __int16 v47 = 2080;
        v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Music/MusicQuality/PGMemoryMusicQualityQuestionFactory.m";
        v10 = MEMORY[0x1E4F14500];
LABEL_11:
        _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_17;
      }
    }
    if (!a3)
    {
      double v11 = CFAbsoluteTimeGetCurrent();
      if (v11 - v38[3] < 0.01) {
        goto LABEL_17;
      }
      v38[3] = v11;
      char v36 = 0;
      v7[2](v7, &v36, 1.0);
      char v12 = *((unsigned char *)v42 + 24) | v36;
      *((unsigned char *)v42 + 24) = v12;
      if (!v12 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 67109378;
      int v46 = 45;
      __int16 v47 = 2080;
      v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Music/MusicQuality/PGMemoryMusicQualityQuestionFactory.m";
      v10 = MEMORY[0x1E4F14500];
      goto LABEL_11;
    }
  }
  else if (!a3)
  {
    goto LABEL_17;
  }
  v13 = [MEMORY[0x1E4F1CA80] set];
  v14 = [MEMORY[0x1E4F71F08] ignoreProgress];
  BOOL v15 = +[PGMusicCatalogMonitor checkMusicCatalogEligibilityWithProgressReporter:v14];

  v16 = PLStoryGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    int v46 = v15;
    _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_DEBUG, "[MusicQualityQuestion] isAppleMusicSubscriber = %d", buf, 8u);
  }

  if (v15)
  {
    v17 = [(PGSurveyQuestionFactory *)self workingContext];
    v18 = [v17 photoLibrary];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __80__PGMemoryMusicQualityQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
    v27 = &unk_1E68EEC08;
    BOOL v35 = v15;
    v28 = self;
    id v29 = v13;
    unint64_t v33 = a3;
    v30 = v7;
    v31 = &v37;
    uint64_t v34 = 0x3F847AE147AE147BLL;
    v32 = &v41;
    +[PGMemoryMusicQuestionUtils enumerateMemoryMusicSuggestionsInPhotoLibrary:v18 block:&v24];
  }
  else
  {
    v20 = PLStoryGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "[MusicQualityQuestion] Not an Apple Music subscriber so skipping Apple Music question generation ", buf, 2u);
    }
  }
  if (v7
    && (double v21 = CFAbsoluteTimeGetCurrent(), v21 - v38[3] >= 0.01)
    && (v38[3] = v21, v36 = 0, v7[2](v7, &v36, 1.0), char v22 = *((unsigned char *)v42 + 24) | v36, (*((unsigned char *)v42 + 24) = v22) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v46 = 81;
      __int16 v47 = 2080;
      v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Music/MusicQuality/PGMemoryMusicQualityQuestionFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v19 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v19 = objc_msgSend(v13, "allObjects", v24, v25, v26, v27, v28);
  }

LABEL_29:
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v19;
}

void __80__PGMemoryMusicQualityQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  char v9 = (void *)MEMORY[0x1D25FED50]();
  v10 = +[PGMemoryMusicQuestionUtils extractKeySongInfoForMemory:v7 isAppleMusicSubscriber:*(unsigned __int8 *)(a1 + 88)];
  double v11 = v10;
  if (!v10
    || ([v10 allKeys],
        char v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 count],
        v12,
        !v13))
  {
    PLStoryGetLog();
    v14 = (PGMemoryMusicQualityQuestion *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v14->super.super, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    v16 = [v7 uuid];
    int v24 = 138412290;
    uint64_t v25 = v16;
    _os_log_impl(&dword_1D1805000, &v14->super.super, OS_LOG_TYPE_INFO, "[MusicQualityQuestion] Skipping question for memory %@ since it's customized (song selected changed from system curated)", (uint8_t *)&v24, 0xCu);
LABEL_11:

    goto LABEL_12;
  }
  v14 = [[PGMemoryMusicQualityQuestion alloc] initWithMemory:v7 withSongInfo:v11 localFactoryScore:1.0];
  uint64_t v15 = [(PGMemoryMusicQualityQuestion *)v14 additionalInfo];
  if (!v15) {
    goto LABEL_12;
  }
  v16 = (void *)v15;
  v17 = [(PGMemoryMusicQualityQuestion *)v14 additionalInfo];
  if (![v17 count])
  {

    goto LABEL_11;
  }
  int v18 = [*(id *)(a1 + 32) shouldAddQuestion:v14 toAlreadyGeneratedQuestions:*(void *)(a1 + 40)];

  if (v18)
  {
    [*(id *)(a1 + 40) addObject:v14];
    if ((unint64_t)[*(id *)(a1 + 40) count] >= *(void *)(a1 + 72)) {
      *a4 = 1;
    }
  }
LABEL_12:

  uint64_t v19 = [*(id *)(a1 + 40) count];
  if (*(void *)(a1 + 48))
  {
    unint64_t v20 = v19;
    unint64_t v21 = *(void *)(a1 + 72);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
    if (Current - *(double *)(v23 + 24) >= *(double *)(a1 + 80))
    {
      *(double *)(v23 + 24) = Current;
      LOBYTE(v24) = 0;
      (*(void (**)(double))(*(void *)(a1 + 48) + 16))((double)v20 / (double)v21);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= v24;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
        *a4 = 1;
      }
    }
  }
}

- (int64_t)questionOptions
{
  return 0x4000;
}

- (unsigned)questionType
{
  return 15;
}

@end
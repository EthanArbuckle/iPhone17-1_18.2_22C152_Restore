@interface PGHighlightTitlingQuestionFactory
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
@end

@implementation PGHighlightTitlingQuestionFactory

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA80] set];
  v8 = [(PGSurveyQuestionFactory *)self workingContext];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __78__PGHighlightTitlingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
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

void __78__PGHighlightTitlingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void (**)(void *, unsigned char *, double))_Block_copy(*(const void **)(a1 + 48));
  if (v4)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v6 = 0.0;
    if (Current >= 0.01)
    {
      double v7 = Current;
      char v84 = 0;
      v4[2](v4, &v84, 0.0);
      if (v84)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
          goto LABEL_66;
        }
        *(_DWORD *)buf = 67109378;
        int v87 = 39;
        __int16 v88 = 2080;
        v89 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/HighlightTitling/PGHighlightTitlingQuestionFactory.m";
        v8 = MEMORY[0x1E4F14500];
        goto LABEL_54;
      }
      double v6 = v7;
    }
    if (!*(void *)(a1 + 56))
    {
      if (CFAbsoluteTimeGetCurrent() - v6 < 0.01) {
        goto LABEL_66;
      }
      char v84 = 0;
      v4[2](v4, &v84, 1.0);
      if (!v84 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_66;
      }
      *(_DWORD *)buf = 67109378;
      int v87 = 42;
      __int16 v88 = 2080;
      v89 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/HighlightTitling/PGHighlightTitlingQuestionFactory.m";
      v8 = MEMORY[0x1E4F14500];
LABEL_54:
      _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_66;
    }
  }
  else
  {
    double v6 = 0.0;
    if (!*(void *)(a1 + 56)) {
      goto LABEL_66;
    }
  }
  id v9 = [*(id *)(a1 + 32) workingContext];
  id v10 = [v9 photoLibrary];
  v11 = [v10 librarySpecificFetchOptions];

  v12 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000301 options:v11];
  if (![v12 count])
  {
    if (v4)
    {
      if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
      {
        char v84 = 0;
        v4[2](v4, &v84, 1.0);
        if (v84)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v87 = 51;
            __int16 v88 = 2080;
            v89 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Ques"
                  "tions/Survey/HighlightTitling/PGHighlightTitlingQuestionFactory.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    goto LABEL_65;
  }
  v68 = v11;
  id v69 = v3;
  uint64_t v13 = [v3 graph];
  uint64_t v14 = [*(id *)(a1 + 32) workingContext];
  v15 = [v14 photoLibrary];
  v16 = [PGHighlightTailorContext alloc];
  v17 = [v14 serviceManager];
  id v18 = [v14 loggingConnection];
  v79 = [(PGHighlightTailorContext *)v16 initWithPhotoLibrary:v15 graph:v13 serviceManager:v17 loggingConnection:v18];

  id v19 = [PGTitleGenerationContext alloc];
  v74 = v14;
  unint64_t v20 = [v14 serviceManager];
  v76 = [(PGTitleGenerationContext *)v19 initWithGraph:v13 serviceManager:v20];

  v67 = v15;
  v21 = [v15 librarySpecificFetchOptions];
  uint64_t v85 = *MEMORY[0x1E4F394A8];
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
  [v21 setFetchPropertySets:v22];

  v66 = v21;
  v78 = [MEMORY[0x1E4F38EB8] fetchKeyAssetByHighlightUUIDForHighlights:v12 options:v21];
  if (![v12 count])
  {
LABEL_56:
    if (v4)
    {
      if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
      {
        char v84 = 0;
        v4[2](v4, &v84, 1.0);
        if (v84)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v87 = 134;
            __int16 v88 = 2080;
            v89 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Ques"
                  "tions/Survey/HighlightTitling/PGHighlightTitlingQuestionFactory.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    goto LABEL_64;
  }
  unint64_t v23 = 0;
  v75 = v13;
  v71 = v4;
  v73 = v12;
  uint64_t v77 = a1;
  while (1)
  {
    v24 = (void *)MEMORY[0x1D25FED50]();
    v25 = [v12 objectAtIndexedSubscript:v23];
    uint64_t v26 = [*(id *)(a1 + 40) count];
    if (v4)
    {
      unint64_t v27 = v26;
      unint64_t v28 = *(void *)(a1 + 56);
      double v29 = CFAbsoluteTimeGetCurrent();
      if (v29 - v6 >= 0.01) {
        break;
      }
    }
LABEL_17:
    context = v24;
    id v30 = v25;
    v31 = [[PGHighlightTailorHighlightInfo alloc] initWithHighlight:v30 graph:v13 highlightTailorContext:v79];
    v32 = [(PGHighlightTailorHighlightInfo *)v31 highlightNode];
    v33 = [v32 uuid];
    v34 = [v78 objectForKeyedSubscript:v33];
    if (v34)
    {
      v82 = v33;
      v35 = [PGGraphMomentNodeCollection alloc];
      v36 = [(PGHighlightTailorHighlightInfo *)v31 momentNodes];
      v37 = [(MAElementCollection *)v35 initWithSet:v36 graph:v13];

      int v38 = [v32 sharingComposition];
      if (v38 == 2) {
        uint64_t v39 = 2;
      }
      else {
        uint64_t v39 = v38 == 1;
      }
      uint64_t v40 = +[PGHighlightEnrichmentUtilities filteredSummarizedFeaturesForHighlightWithInfo:v31 sharingFilter:v39];
      v41 = [PGDayHighlightTitleGenerator alloc];
      v42 = [v74 loggingConnection];
      v81 = (void *)v40;
      v43 = [(PGDayHighlightTitleGenerator *)v41 initWithSummarizedFeatures:v40 momentNodes:v37 titleGenerationContext:v76 loggingConnection:v42];

      v80 = v43;
      v44 = [(PGDayHighlightTitleGenerator *)v43 titleTuple];
      v45 = v44;
      if (v44)
      {
        v46 = [v44 title];
        v47 = [v46 stringValue];

        if (v47)
        {
          v48 = [PGHighlightTitleGenerator alloc];
          v49 = [(PGHighlightTailorHighlightInfo *)v31 highlightNode];
          v50 = [(PGHighlightTitleGenerator *)v48 initWithCollection:v49 curatedAssetCollection:0 keyAsset:v34 createVerboseTitle:0 titleGenerationContext:v76];

          v72 = v50;
          v51 = [(PGHighlightTitleGenerator *)v50 titleTuple];
          if (v51)
          {
            id v70 = v51;
            v52 = [v51 title];
            v53 = [v52 stringValue];

            if (v53)
            {
              v63 = v37;
              v54 = [MEMORY[0x1E4F8E828] titleWithoutFormattingForTitle:v47];

              uint64_t v55 = [MEMORY[0x1E4F8E828] titleWithoutFormattingForTitle:v53];

              uint64_t v56 = [v54 isEqualToString:v55];
              if (v56) {
                double v57 = 0.5;
              }
              else {
                double v57 = 1.0;
              }
              v64 = [PGHighlightTitlingQuestion alloc];
              v58 = [v34 uuid];
              v59 = v64;
              v65 = v54;
              v62 = (void *)v55;
              v60 = [(PGHighlightTitlingQuestion *)v59 initWithHighlightTitle:v54 legacyHighlightTitle:v55 keyAssetUUID:v58 localFactoryScore:v56 duplicatedTitles:v57];

              if ([*(id *)(v77 + 32) shouldAddQuestion:v60 toAlreadyGeneratedQuestions:*(void *)(v77 + 40)]&& (objc_msgSend(*(id *)(v77 + 40), "addObject:", v60), (unint64_t)objc_msgSend(*(id *)(v77 + 40), "count") >= *(void *)(v77 + 56)))
              {
                int v61 = 2;
              }
              else
              {
                int v61 = 0;
              }
              v4 = v71;
              v37 = v63;

              v47 = v65;
            }
            else
            {
              int v61 = 4;
              v4 = v71;
            }
            v51 = v70;
          }
          else
          {
            int v61 = 4;
            v4 = v71;
          }
        }
        else
        {
          int v61 = 4;
          v4 = v71;
        }
      }
      else
      {
        int v61 = 4;
      }

      v12 = v73;
      v33 = v82;
    }
    else
    {
      int v61 = 4;
    }

    if (v61 && v61 != 4)
    {
      uint64_t v13 = v75;
      goto LABEL_56;
    }
    ++v23;
    uint64_t v13 = v75;
    a1 = v77;
    if (v23 >= [v12 count]) {
      goto LABEL_56;
    }
  }
  char v84 = 0;
  v4[2](v4, &v84, (double)v27 / (double)v28 * 0.9);
  if (!v84)
  {
    double v6 = v29;
    goto LABEL_17;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v87 = 69;
    __int16 v88 = 2080;
    v89 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/Su"
          "rvey/HighlightTitling/PGHighlightTitlingQuestionFactory.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }

LABEL_64:

  v11 = v68;
  id v3 = v69;
LABEL_65:

LABEL_66:
}

- (unsigned)questionType
{
  return 28;
}

- (int64_t)questionOptions
{
  return 0x4000000;
}

@end
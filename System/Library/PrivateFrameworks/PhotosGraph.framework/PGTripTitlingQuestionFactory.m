@interface PGTripTitlingQuestionFactory
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
@end

@implementation PGTripTitlingQuestionFactory

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA80] set];
  v8 = [(PGSurveyQuestionFactory *)self workingContext];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __73__PGTripTitlingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
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

void __73__PGTripTitlingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void (**)(void *, unsigned char *, double))_Block_copy(*(const void **)(a1 + 48));
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  char v60 = 0;
  uint64_t v53 = 0;
  v54 = (double *)&v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  if (!v4)
  {
    if (!*(void *)(a1 + 56)) {
      goto LABEL_36;
    }
    goto LABEL_13;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - v54[3] >= 0.01)
  {
    v54[3] = Current;
    char v52 = 0;
    v4[2](v4, &v52, 0.0);
    char v6 = *((unsigned char *)v58 + 24) | v52;
    *((unsigned char *)v58 + 24) = v6;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v62 = 40;
        __int16 v63 = 2080;
        v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/TripTitling/PGTripTitlingQuestionFactory.m";
        v7 = MEMORY[0x1E4F14500];
LABEL_11:
        _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_36;
      }
      goto LABEL_36;
    }
  }
  if (*(void *)(a1 + 56))
  {
LABEL_13:
    id v10 = [v3 graph];
    v39 = +[PGGraphHighlightTypeNodeCollection concludedTripTypeNodesInGraph:v10];
    v11 = [v39 highlightGroupNodes];
    if (![v11 count])
    {
      if (v4)
      {
        double v33 = CFAbsoluteTimeGetCurrent();
        if (v33 - v54[3] >= 0.01)
        {
          v54[3] = v33;
          char v52 = 0;
          v4[2](v4, &v52, 1.0);
          char v34 = *((unsigned char *)v58 + 24) | v52;
          *((unsigned char *)v58 + 24) = v34;
          if (v34)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              int v62 = 51;
              __int16 v63 = 2080;
              v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Qu"
                    "estions/Survey/TripTitling/PGTripTitlingQuestionFactory.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
      goto LABEL_35;
    }
    v12 = [*(id *)(a1 + 32) workingContext];
    uint64_t v13 = [v12 photoLibrary];

    uint64_t v14 = (void *)MEMORY[0x1E4F38EE8];
    v15 = [v11 localIdentifiers];
    v16 = [v15 allObjects];
    v17 = [v13 librarySpecificFetchOptions];
    v38 = [v14 fetchAssetCollectionsWithLocalIdentifiers:v16 options:v17];

    id v18 = (void *)MEMORY[0x1E4F38EB8];
    id v19 = [v13 librarySpecificFetchOptions];
    v37 = [v18 fetchKeyAssetByHighlightUUIDForHighlights:v38 options:v19];

    unint64_t v20 = (void *)MEMORY[0x1E4F71E88];
    v21 = +[PGGraphHighlightGroupNodeCollection momentsOfHighlightGroup];
    v22 = [v20 adjacencyWithSources:v11 relation:v21 targetsClass:objc_opt_class()];

    if (v4)
    {
      double v23 = CFAbsoluteTimeGetCurrent();
      if (v23 - v54[3] >= 0.01)
      {
        v54[3] = v23;
        char v52 = 0;
        v4[2](v4, &v52, 0.1);
        char v24 = *((unsigned char *)v58 + 24) | v52;
        *((unsigned char *)v58 + 24) = v24;
        if (v24)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v62 = 59;
            __int16 v63 = 2080;
            v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Ques"
                  "tions/Survey/TripTitling/PGTripTitlingQuestionFactory.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_34;
        }
      }
    }
    v25 = [[PGGraphLocationHelper alloc] initWithGraph:v10];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __73__PGTripTitlingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_237;
    v40[3] = &unk_1E68ECED8;
    id v26 = *(id *)(a1 + 40);
    uint64_t v27 = *(void *)(a1 + 56);
    id v41 = v26;
    uint64_t v50 = v27;
    v28 = v4;
    id v47 = v28;
    v48 = &v53;
    uint64_t v51 = 0x3F847AE147AE147BLL;
    v49 = &v57;
    id v29 = v37;
    uint64_t v30 = *(void *)(a1 + 32);
    id v42 = v29;
    uint64_t v43 = v30;
    id v44 = v10;
    v31 = v25;
    v45 = v31;
    id v46 = v22;
    [v11 enumerateUUIDs:v40];
    if (*((unsigned char *)v58 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_33:

LABEL_34:
LABEL_35:

        goto LABEL_36;
      }
      *(_DWORD *)buf = 67109378;
      int v62 = 104;
      __int16 v63 = 2080;
      v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/TripTitling/PGTripTitlingQuestionFactory.m";
      v32 = MEMORY[0x1E4F14500];
    }
    else
    {
      if (!v4) {
        goto LABEL_33;
      }
      double v35 = CFAbsoluteTimeGetCurrent();
      if (v35 - v54[3] < 0.01) {
        goto LABEL_33;
      }
      v54[3] = v35;
      char v52 = 0;
      v28[2](v28, &v52, 1.0);
      char v36 = *((unsigned char *)v58 + 24) | v52;
      *((unsigned char *)v58 + 24) = v36;
      if (!v36 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_33;
      }
      *(_DWORD *)buf = 67109378;
      int v62 = 105;
      __int16 v63 = 2080;
      v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/TripTitling/PGTripTitlingQuestionFactory.m";
      v32 = MEMORY[0x1E4F14500];
    }
    _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_33;
  }
  double v8 = CFAbsoluteTimeGetCurrent();
  if (v8 - v54[3] >= 0.01)
  {
    v54[3] = v8;
    char v52 = 0;
    v4[2](v4, &v52, 1.0);
    char v9 = *((unsigned char *)v58 + 24) | v52;
    *((unsigned char *)v58 + 24) = v9;
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v62 = 43;
        __int16 v63 = 2080;
        v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/TripTitling/PGTripTitlingQuestionFactory.m";
        v7 = MEMORY[0x1E4F14500];
        goto LABEL_11;
      }
    }
  }
LABEL_36:
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
}

void __73__PGTripTitlingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_237(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [*(id *)(a1 + 32) count];
  if (!*(void *)(a1 + 80)) {
    goto LABEL_5;
  }
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 104);
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v12 = *(void *)(*(void *)(a1 + 88) + 8);
  if (Current - *(double *)(v12 + 24) < *(double *)(a1 + 112)) {
    goto LABEL_5;
  }
  *(double *)(v12 + 24) = Current;
  buf[0] = 0;
  (*(void (**)(double))(*(void *)(a1 + 80) + 16))((double)v9 / (double)v10 * 0.9);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
  {
    *a4 = 1;
  }
  else
  {
LABEL_5:
    uint64_t v13 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
    if (v13)
    {
      uint64_t v14 = [PGGraphHighlightGroupNodeCollection alloc];
      uint64_t v15 = *(void *)(a1 + 56);
      v16 = (void *)[objc_alloc(MEMORY[0x1E4F71E40]) initWithElementIdentifier:a2];
      v17 = [(MAElementCollection *)v14 initWithGraph:v15 elementIdentifiers:v16];

      uint64_t v18 = *(void *)(a1 + 64);
      id v39 = 0;
      id v19 = +[PGTripTitleGenerator titleForTripNodeAsCollection:v17 locationHelper:v18 error:&v39];
      id v20 = v39;
      if (v19)
      {
        v37 = a4;
        v21 = [PGLocationTripTitleUtility alloc];
        v22 = [*(id *)(a1 + 72) targetsForSources:v17];
        double v23 = [v22 set];
        char v24 = [(PGLocationTripTitleUtility *)v21 initWithMomentNodes:v23 filterMomentsAndCities:1 locationHelper:*(void *)(a1 + 64)];

        uint64_t v25 = [(PGLocationTripTitleUtility *)v24 title];
        if (v25)
        {
          id v26 = (void *)v25;
          id v38 = v20;
          uint64_t v27 = [MEMORY[0x1E4F8E828] titleWithoutFormattingForTitle:v19];

          v28 = [MEMORY[0x1E4F8E828] titleWithoutFormattingForTitle:v26];

          uint64_t v29 = [v27 isEqualToString:v28];
          if (v29) {
            double v30 = 0.5;
          }
          else {
            double v30 = 1.0;
          }
          v31 = [PGTripTitlingQuestion alloc];
          v32 = [v13 uuid];
          double v33 = [(PGTripTitlingQuestion *)v31 initWithTripTitle:v27 legacyTripTitle:v28 keyAssetUUID:v32 localFactoryScore:v29 duplicatedTitles:v30];

          if ([*(id *)(a1 + 48) shouldAddQuestion:v33 toAlreadyGeneratedQuestions:*(void *)(a1 + 32)])
          {
            [*(id *)(a1 + 32) addObject:v33];
            if ((unint64_t)[*(id *)(a1 + 32) count] >= *(void *)(a1 + 104)) {
              unsigned char *v37 = 1;
            }
          }

          id v19 = v27;
          id v20 = v38;
        }
        else
        {
          char v36 = [*(id *)(a1 + 48) workingContext];
          v28 = [v36 loggingConnection];

          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v41 = v7;
            _os_log_impl(&dword_1D1805000, v28, OS_LOG_TYPE_INFO, "[PGTripTitlingQuestionFactory] No legacy trip title generated from Trip Highlight UUID %@", buf, 0xCu);
          }
        }
      }
      else
      {
        double v35 = [*(id *)(a1 + 48) workingContext];
        id v19 = [v35 loggingConnection];

        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v41 = v7;
          __int16 v42 = 2112;
          id v43 = v20;
          _os_log_error_impl(&dword_1D1805000, v19, OS_LOG_TYPE_ERROR, "[PGTripTitlingQuestionFactory] No trip title generated from Trip Highlight UUID %@ with error %@", buf, 0x16u);
        }
      }
    }
    else
    {
      char v34 = [*(id *)(a1 + 48) workingContext];
      v17 = [v34 loggingConnection];

      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v7;
        _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "[PGTripTitlingQuestionFactory] No key asset for Trip Highlight UUID %@", buf, 0xCu);
      }
    }
  }
}

- (unsigned)questionType
{
  return 26;
}

- (int64_t)questionOptions
{
  return 0x1000000;
}

@end
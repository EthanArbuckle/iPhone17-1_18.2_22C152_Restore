@interface PGTripKeyAssetQuestionFactory
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
- (void)_enumerateTrips:(id)a3;
@end

@implementation PGTripKeyAssetQuestionFactory

- (void)_enumerateTrips:(id)a3
{
  v84[3] = *MEMORY[0x1E4F143B8];
  v58 = (void (**)(id, void *, void *, uint64_t, uint8_t *, unsigned char *))a3;
  v4 = [(PGSurveyQuestionFactory *)self workingContext];
  v5 = [v4 photoLibrary];

  v6 = [v5 librarySpecificFetchOptions];
  v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(type = %d OR type = %d) AND enrichmentState == %d", 1, 2, 4);
  [v6 setPredicate:v7];

  v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  v84[0] = v8;
  v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"endDate" ascending:1];
  v84[1] = v9;
  v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v84[2] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:3];
  [v6 setSortDescriptors:v11];

  v49 = v6;
  v12 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000304 options:v6];
  v51 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v13 = [v5 librarySpecificFetchOptions];
  uint64_t v83 = *MEMORY[0x1E4F394A8];
  uint64_t v14 = v83;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
  v57 = v13;
  [v13 setFetchPropertySets:v15];

  v50 = v5;
  v16 = [v5 librarySpecificFetchOptions];
  uint64_t v82 = v14;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
  v53 = v16;
  [v16 setFetchPropertySets:v17];

  char v75 = 0;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  obuint64_t j = v12;
  uint64_t v55 = [obj countByEnumeratingWithState:&v71 objects:v81 count:16];
  if (v55)
  {
    uint64_t v54 = *(void *)v72;
    unint64_t v18 = 0x1E4F38000uLL;
    while (2)
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        if (*(void *)v72 != v54) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        v21 = [*(id *)(v18 + 3768) fetchKeyCuratedAssetInAssetCollection:v20 referenceAsset:0 options:v57];
        v22 = [v21 firstObject];

        if (v22)
        {
          buf[0] = 0;
          v58[2](v58, v20, v22, 1, buf, &v75);
          if (v75)
          {

            goto LABEL_26;
          }
          v23 = (void *)MEMORY[0x1E4F28F60];
          v24 = [v20 objectID];
          v25 = [v23 predicateWithFormat:@"highlightBeingKeyAssetPrivate.parentDayGroupPhotosHighlight == %@", v24];
          [v53 setInternalPredicate:v25];

          unint64_t v26 = v18;
          v27 = [*(id *)(v18 + 3768) fetchAssetsWithOptions:v53];
          id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v67 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          id v29 = v27;
          uint64_t v30 = [v29 countByEnumeratingWithState:&v67 objects:v80 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v68;
            do
            {
              for (uint64_t j = 0; j != v31; ++j)
              {
                if (*(void *)v68 != v32) {
                  objc_enumerationMutation(v29);
                }
                v34 = *(void **)(*((void *)&v67 + 1) + 8 * j);
                if (([v34 isEqual:v22] & 1) == 0) {
                  [v28 addObject:v34];
                }
              }
              uint64_t v31 = [v29 countByEnumeratingWithState:&v67 objects:v80 count:16];
            }
            while (v31);
          }

          if ([v28 count]) {
            [v51 setObject:v28 forKey:v20];
          }

          unint64_t v18 = v26;
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v79 = v20;
          _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unexpected nil key asset for trip %@", buf, 0xCu);
        }
      }
      uint64_t v55 = [obj countByEnumeratingWithState:&v71 objects:v81 count:16];
      if (v55) {
        continue;
      }
      break;
    }
  }
LABEL_26:

  if (!v75)
  {
    long long v35 = 0uLL;
    while (1)
    {
      long long v65 = v35;
      long long v66 = v35;
      long long v63 = v35;
      long long v64 = v35;
      v36 = [v51 keyEnumerator];
      uint64_t v37 = [v36 countByEnumeratingWithState:&v63 objects:v77 count:16];
      if (!v37) {
        break;
      }
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v64;
      char v56 = 1;
      do
      {
        for (uint64_t k = 0; k != v38; ++k)
        {
          if (*(void *)v64 != v39) {
            objc_enumerationMutation(v36);
          }
          v41 = *(void **)(*((void *)&v63 + 1) + 8 * k);
          v42 = [v51 objectForKey:v41];
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          id v43 = v42;
          uint64_t v44 = [v43 countByEnumeratingWithState:&v59 objects:v76 count:16];
          if (v44)
          {
            uint64_t v45 = v44;
            uint64_t v46 = *(void *)v60;
            while (2)
            {
              for (uint64_t m = 0; m != v45; ++m)
              {
                if (*(void *)v60 != v46) {
                  objc_enumerationMutation(v43);
                }
                v48 = *(void **)(*((void *)&v59 + 1) + 8 * m);
                buf[0] = 0;
                v58[2](v58, v41, v48, 0, buf, &v75);
                if (v75)
                {

                  goto LABEL_49;
                }
                if (buf[0])
                {
                  char v56 = 0;
                  goto LABEL_44;
                }
              }
              uint64_t v45 = [v43 countByEnumeratingWithState:&v59 objects:v76 count:16];
              if (v45) {
                continue;
              }
              break;
            }
          }
LABEL_44:
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v63 objects:v77 count:16];
      }
      while (v38);

      long long v35 = 0uLL;
      if (v56) {
        goto LABEL_50;
      }
    }
LABEL_49:
  }
LABEL_50:
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void (**)(void *, unsigned char *, double))_Block_copy(v6);
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
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
          unint64_t v18 = (void *)MEMORY[0x1E4F1CBF0];
          goto LABEL_22;
        }
        *(_DWORD *)buf = 67109378;
        int v41 = 34;
        __int16 v42 = 2080;
        id v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/TripKeyAsset/PGTripKeyAssetQuestionFactory.m";
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
      int v41 = 38;
      __int16 v42 = 2080;
      id v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/TripKeyAsset/PGTripKeyAssetQuestionFactory.m";
      v10 = MEMORY[0x1E4F14500];
      goto LABEL_11;
    }
  }
  else if (!a3)
  {
    goto LABEL_19;
  }
  v13 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __74__PGTripKeyAssetQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  v23 = &unk_1E68E5060;
  v24 = self;
  id v14 = v13;
  id v25 = v14;
  unint64_t v29 = a3;
  v15 = v7;
  id v26 = v15;
  v27 = &v32;
  uint64_t v30 = 0x3F847AE147AE147BLL;
  id v28 = &v36;
  [(PGTripKeyAssetQuestionFactory *)self _enumerateTrips:&v20];
  if (v7
    && (double v16 = CFAbsoluteTimeGetCurrent(), v16 - v33[3] >= 0.01)
    && (v33[3] = v16,
        char v31 = 0,
        v15[2](v15, &v31, 1.0),
        char v17 = *((unsigned char *)v37 + 24) | v31,
        (*((unsigned char *)v37 + 24) = v17) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v41 = 68;
      __int16 v42 = 2080;
      id v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/TripKeyAsset/PGTripKeyAssetQuestionFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    unint64_t v18 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    unint64_t v18 = objc_msgSend(v14, "allObjects", v20, v21, v22, v23, v24, v25);
  }

LABEL_22:
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v18;
}

void __74__PGTripKeyAssetQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, int a4, unsigned char *a5, unsigned char *a6)
{
  id v11 = a2;
  id v12 = a3;
  v13 = (void *)MEMORY[0x1D25FED50]();
  id v14 = NSString;
  v15 = [v11 localizedTitle];
  double v16 = [v11 localizedSubtitle];
  char v17 = [v14 stringWithFormat:@"%@ (%@)", v15, v16];

  BOOL v18 = [v11 type] == 1;
  if (a4) {
    double v19 = 1.0;
  }
  else {
    double v19 = 0.5;
  }
  uint64_t v20 = [PGTripKeyAssetQuestion alloc];
  uint64_t v21 = [v12 uuid];
  v22 = [(PGTripKeyAssetQuestion *)v20 initWithKeyAssetUUID:v21 tripName:v17 isLongTrip:v18 localFactoryScore:v19];

  if ([*(id *)(a1 + 32) shouldAddQuestion:v22 toAlreadyGeneratedQuestions:*(void *)(a1 + 40)]&& (objc_msgSend(*(id *)(a1 + 40), "addObject:", v22), *a5 = 1, (unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(void *)(a1 + 72)))
  {
    *a6 = 1;
  }
  else
  {
    uint64_t v23 = [*(id *)(a1 + 40) count];
    if (*(void *)(a1 + 48))
    {
      unint64_t v24 = v23;
      unint64_t v25 = *(void *)(a1 + 72);
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
      if (Current - *(double *)(v27 + 24) >= *(double *)(a1 + 80))
      {
        *(double *)(v27 + 24) = Current;
        (*(void (**)(double))(*(void *)(a1 + 48) + 16))((double)v24 / (double)v25);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                              + 24);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          *a6 = 1;
        }
      }
    }
  }
}

- (int64_t)questionOptions
{
  return 2048;
}

- (unsigned)questionType
{
  return 12;
}

@end
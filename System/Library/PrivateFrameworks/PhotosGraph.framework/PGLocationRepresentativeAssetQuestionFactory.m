@interface PGLocationRepresentativeAssetQuestionFactory
- (id)_addQuestionsForAssetUUIDs:(id)a3 photoLibrary:(id)a4;
- (id)_fetchAssetsWithLibrary:(id)a3 internalPredicate:(id)a4;
- (id)_selectAssetsFromAssets:(id)a3 limit:(unint64_t)a4;
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
@end

@implementation PGLocationRepresentativeAssetQuestionFactory

- (id)_addQuestionsForAssetUUIDs:(id)a3 photoLibrary:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v23 = a4;
  v7 = [v23 librarySpecificFetchOptions];
  v26[0] = *MEMORY[0x1E4F39518];
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  [v7 setFetchPropertySets:v8];

  v24 = v6;
  v22 = v7;
  v9 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v6 options:v7];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v11 = [v9 count];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t i = 0; i != v12; ++i)
    {
      v14 = (void *)MEMORY[0x1D25FED50]();
      v15 = [v9 objectAtIndex:i];
      char v25 = 0;
      v16 = [v15 photosOneUpProperties];
      v17 = [v16 localizedGeoDescriptionIsHome:&v25];

      if (v17)
      {
        v18 = [PGLocationRepresentativeAssetQuestion alloc];
        v19 = [v15 uuid];
        v20 = [(PGLocationRepresentativeAssetQuestion *)v18 initWithAssetUUID:v19 locationName:v17];

        if ([(PGSurveyQuestionFactory *)self shouldAddQuestion:v20 toAlreadyGeneratedQuestions:v10])
        {
          [v10 addObject:v20];
        }
      }
    }
  }

  return v10;
}

- (id)_selectAssetsFromAssets:(id)a3 limit:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([v6 count] < a4)
  {
    unint64_t v8 = 0;
    unint64_t v30 = 0;
    unint64_t v32 = (a4 + 1) >> 1;
    unint64_t v33 = 0;
    uint64_t v9 = *MEMORY[0x1E4F8E908];
    id v31 = v7;
    do
    {
      if (v8 >= objc_msgSend(v5, "count", v30)) {
        break;
      }
      id v10 = [v5 objectAtIndexedSubscript:v8];
      uint64_t v11 = [v10 location];
      [v11 coordinate];
      double v13 = v12;
      double v15 = v14;

      v16 = [MEMORY[0x1E4F38F48] poiGeoHashWithGeoHashSize:v9 latitude:v13 longitude:v15];
      if (([v7 containsObject:v16] & 1) == 0)
      {
        v17 = v6;
        unint64_t v18 = a4;
        uint64_t v19 = v9;
        v20 = [v10 iconicScoreProperties];
        [v20 iconicScore];
        double v22 = v21;

        id v23 = [v10 curationModel];
        v24 = [v23 iconicScoreModel];
        [v24 minimumMeaningfulIconicScore];
        double v26 = v25;

        if (v22 < v26 || v33 >= v32)
        {
          id v6 = v17;
          if (v22 < v26 && v30 < v32)
          {
            v28 = [v10 localIdentifier];
            [v17 addObject:v28];

            ++v30;
            id v6 = v17;
          }
        }
        else
        {
          v27 = [v10 localIdentifier];
          id v6 = v17;
          [v17 addObject:v27];

          ++v33;
        }
        uint64_t v9 = v19;
        a4 = v18;
        id v7 = v31;
      }

      ++v8;
    }
    while ([v6 count] < a4);
  }

  return v6;
}

- (id)_fetchAssetsWithLibrary:(id)a3 internalPredicate:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a3 librarySpecificFetchOptions];
  unint64_t v8 = [MEMORY[0x1E4F8E7F8] requiredFetchPropertySets];
  [v7 setFetchPropertySets:v8];

  [v7 setFetchLimit:1000];
  uint64_t v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v20[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [v7 setSortDescriptors:v10];

  uint64_t v11 = [(PGSurveyQuestionFactory *)self existingQuestionsByEntityIdentifier];
  double v12 = [v11 allKeys];

  double v13 = (void *)MEMORY[0x1E4F28BA0];
  double v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (uuid IN %@)", v12];
  v19[0] = v14;
  v19[1] = v6;
  double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v16 = [v13 andPredicateWithSubpredicates:v15];
  [v7 setInternalPredicate:v16];

  v17 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v7];

  return v17;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(void *, unsigned char *, double))_Block_copy(a4);
  if (v6)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v8 = 0.0;
    if (Current >= 0.01)
    {
      double v9 = Current;
      char v25 = 0;
      v6[2](v6, &v25, 0.0);
      if (v25)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
LABEL_23:
          v20 = (void *)MEMORY[0x1E4F1CBF0];
          goto LABEL_34;
        }
        *(_DWORD *)buf = 67109378;
        int v27 = 33;
        __int16 v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/LocationRepresentativeAsset/PGLocationRepresentativeAssetQuestionFactory.m";
        id v10 = MEMORY[0x1E4F14500];
LABEL_22:
        _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_23;
      }
      double v8 = v9;
    }
    if (!a3)
    {
      if (CFAbsoluteTimeGetCurrent() - v8 < 0.01) {
        goto LABEL_23;
      }
      char v25 = 0;
      v6[2](v6, &v25, 1.0);
      if (!v25 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 67109378;
      int v27 = 36;
      __int16 v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/LocationRepresentativeAsset/PGLocationRepresentativeAssetQuestionFactory.m";
      id v10 = MEMORY[0x1E4F14500];
      goto LABEL_22;
    }
  }
  else
  {
    double v8 = 0.0;
    if (!a3) {
      goto LABEL_23;
    }
  }
  uint64_t v11 = [(PGSurveyQuestionFactory *)self workingContext];
  double v12 = [v11 photoLibrary];

  double v13 = [MEMORY[0x1E4F8A930] predicateForAssetWithLocation];
  double v14 = [(PGLocationRepresentativeAssetQuestionFactory *)self _fetchAssetsWithLibrary:v12 internalPredicate:v13];
  double v15 = [v14 fetchedObjects];

  v16 = [(PGSurveyQuestionFactory *)self curationSession];

  if (!v16)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F8E778]);
    [(PGSurveyQuestionFactory *)self setCurationSession:v17];
  }
  unint64_t v18 = [(PGSurveyQuestionFactory *)self curationSession];
  [v18 prepareAssets:v15];

  if (!v6) {
    goto LABEL_25;
  }
  double v19 = CFAbsoluteTimeGetCurrent();
  if (v19 - v8 < 0.01) {
    goto LABEL_25;
  }
  char v25 = 0;
  v6[2](v6, &v25, 0.7);
  if (!v25)
  {
    double v8 = v19;
LABEL_25:
    double v21 = [(PGLocationRepresentativeAssetQuestionFactory *)self _selectAssetsFromAssets:v15 limit:a3];
    double v22 = [v21 allObjects];
    id v23 = [(PGLocationRepresentativeAssetQuestionFactory *)self _addQuestionsForAssetUUIDs:v22 photoLibrary:v12];

    if (v6 && CFAbsoluteTimeGetCurrent() - v8 >= 0.01 && (char v25 = 0, v6[2](v6, &v25, 1.0), v25))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v27 = 53;
        __int16 v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/LocationRepresentativeAsset/PGLocationRepresentativeAssetQuestionFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v20 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v20 = [v23 allObjects];
    }

    goto LABEL_33;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v27 = 49;
    __int16 v28 = 2080;
    v29 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/Su"
          "rvey/LocationRepresentativeAsset/PGLocationRepresentativeAssetQuestionFactory.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v20 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_33:

LABEL_34:
  return v20;
}

- (int64_t)questionOptions
{
  return 0x2000000;
}

- (unsigned)questionType
{
  return 27;
}

@end
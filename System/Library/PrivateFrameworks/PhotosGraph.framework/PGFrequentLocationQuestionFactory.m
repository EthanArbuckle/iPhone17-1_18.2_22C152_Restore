@interface PGFrequentLocationQuestionFactory
- (BOOL)_addIfNeededFrequentLocationQuestionForAsset:(id)a3 withLocationTypeName:(id)a4 toQuestions:(id)a5;
- (BOOL)_distanceTooCloseBetweenCoordinate:(CLLocationCoordinate2D)a3 otherCoordinate:(CLLocationCoordinate2D)a4;
- (PHFetchResult)existingFrequentLocationQuestions;
- (id)_selectedAssetFromMomentNodes:(id)a3 closeToCoordinate:(CLLocationCoordinate2D)a4;
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
- (void)setExistingFrequentLocationQuestions:(id)a3;
@end

@implementation PGFrequentLocationQuestionFactory

- (void).cxx_destruct
{
}

- (void)setExistingFrequentLocationQuestions:(id)a3
{
}

- (id)_selectedAssetFromMomentNodes:(id)a3 closeToCoordinate:(CLLocationCoordinate2D)a4
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  v32[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [(PGSurveyQuestionFactory *)self workingContext];
  v9 = [v8 photoLibrary];

  v10 = [v9 librarySpecificFetchOptions];
  v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"locationData != nil"];
  [v10 setInternalPredicate:v11];

  v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v32[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  [v10 setSortDescriptors:v13];

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__52371;
  v30 = __Block_byref_object_dispose__52372;
  id v31 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0x7FEFFFFFFFFFFFFFLL;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __85__PGFrequentLocationQuestionFactory__selectedAssetFromMomentNodes_closeToCoordinate___block_invoke;
  v18[3] = &unk_1E68EB538;
  id v14 = v9;
  id v19 = v14;
  id v15 = v10;
  CLLocationDegrees v23 = latitude;
  CLLocationDegrees v24 = longitude;
  id v20 = v15;
  v21 = v25;
  v22 = &v26;
  [v7 enumerateNodesUsingBlock:v18];
  id v16 = (id)v27[5];

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v26, 8);

  return v16;
}

void __85__PGFrequentLocationQuestionFactory__selectedAssetFromMomentNodes_closeToCoordinate___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D25FED50]();
  v5 = (void *)MEMORY[0x1E4F38EB8];
  v6 = [v3 fetchAssetCollectionInPhotoLibrary:a1[4]];
  id v7 = [v5 fetchAssetsInAssetCollection:v6 options:a1[5]];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "locationCoordinate", 0, 0, (void)v20);
        uint64_t v18 = v14;
        uint64_t v19 = v15;
        CLLocationCoordinate2DGetDistanceFrom();
        double v17 = v16;
        if (v16 < *(double *)(*(void *)(a1[6] + 8) + 24))
        {
          objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v13);
          *(double *)(*(void *)(a1[6] + 8) + 24) = v17;
        }
      }
      uint64_t v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16, v18, v19);
    }
    while (v10);
  }
}

- (BOOL)_distanceTooCloseBetweenCoordinate:(CLLocationCoordinate2D)a3 otherCoordinate:(CLLocationCoordinate2D)a4
{
  CLLocationCoordinate2DGetDistanceFrom();
  return v4 < *MEMORY[0x1E4F8B7E0];
}

- (BOOL)_addIfNeededFrequentLocationQuestionForAsset:(id)a3 withLocationTypeName:(id)a4 toQuestions:(id)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v66 = a4;
  id v8 = a5;
  v62 = v7;
  v61 = [v7 location];
  [v61 coordinate];
  double v10 = v9;
  double v12 = v11;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  obuint64_t j = (PGFrequentLocationQuestion *)v8;
  uint64_t v13 = [(PGFrequentLocationQuestion *)obj countByEnumeratingWithState:&v71 objects:v76 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v72;
    uint64_t v16 = *MEMORY[0x1E4F8E990];
    uint64_t v17 = *MEMORY[0x1E4F8E978];
    uint64_t v18 = *MEMORY[0x1E4F8E980];
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v72 != v15) {
          objc_enumerationMutation(obj);
        }
        long long v20 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        long long v21 = [v20 additionalInfo];
        long long v22 = [v21 objectForKeyedSubscript:v16];
        int v23 = [v22 isEqualToString:v66];

        if (v23)
        {
          CLLocationDegrees v24 = [v20 additionalInfo];
          uint64_t v25 = [v24 objectForKeyedSubscript:v17];
          [v25 doubleValue];
          CLLocationDegrees v27 = v26;

          uint64_t v28 = [v20 additionalInfo];
          v29 = [v28 objectForKeyedSubscript:v18];
          [v29 doubleValue];
          CLLocationDegrees v31 = v30;

          CLLocationCoordinate2D v32 = CLLocationCoordinate2DMake(v27, v31);
          if (-[PGFrequentLocationQuestionFactory _distanceTooCloseBetweenCoordinate:otherCoordinate:](self, "_distanceTooCloseBetweenCoordinate:otherCoordinate:", v10, v12, v32.latitude, v32.longitude))
          {
            BOOL v59 = 0;
            v58 = obj;
            v33 = obj;
            v56 = v61;
            v54 = v62;
            goto LABEL_23;
          }
        }
      }
      uint64_t v14 = [(PGFrequentLocationQuestion *)obj countByEnumeratingWithState:&v71 objects:v76 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  [(PGFrequentLocationQuestionFactory *)self existingFrequentLocationQuestions];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v33 = (PGFrequentLocationQuestion *)(id)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = [(PGFrequentLocationQuestion *)v33 countByEnumeratingWithState:&v67 objects:v75 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v68;
    uint64_t v37 = *MEMORY[0x1E4F8E990];
    uint64_t v63 = *MEMORY[0x1E4F8E978];
    uint64_t v38 = *MEMORY[0x1E4F8E980];
    while (2)
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v68 != v36) {
          objc_enumerationMutation(v33);
        }
        v40 = *(void **)(*((void *)&v67 + 1) + 8 * j);
        v41 = [v40 additionalInfo];
        v42 = [v41 objectForKeyedSubscript:v37];
        int v43 = [v42 isEqualToString:v66];

        if (v43)
        {
          v44 = [v40 additionalInfo];
          v45 = [v44 objectForKeyedSubscript:v63];
          [v45 doubleValue];
          CLLocationDegrees v47 = v46;

          v48 = [v40 additionalInfo];
          v49 = [v48 objectForKeyedSubscript:v38];
          [v49 doubleValue];
          CLLocationDegrees v51 = v50;

          CLLocationCoordinate2D v52 = CLLocationCoordinate2DMake(v47, v51);
          if (-[PGFrequentLocationQuestionFactory _distanceTooCloseBetweenCoordinate:otherCoordinate:](self, "_distanceTooCloseBetweenCoordinate:otherCoordinate:", v10, v12, v52.latitude, v52.longitude))
          {
            BOOL v59 = 0;
            v57 = v33;
            v56 = v61;
            v54 = v62;
            v58 = obj;
            goto LABEL_22;
          }
        }
      }
      uint64_t v35 = [(PGFrequentLocationQuestion *)v33 countByEnumeratingWithState:&v67 objects:v75 count:16];
      if (v35) {
        continue;
      }
      break;
    }
  }

  v53 = [PGFrequentLocationQuestion alloc];
  v54 = v62;
  v55 = [v62 uuid];
  v56 = v61;
  v57 = [(PGFrequentLocationQuestion *)v53 initWithAssetUUID:v55 location:v61 locationTypeName:v66];

  v58 = obj;
  [(PGFrequentLocationQuestion *)obj addObject:v57];
  BOOL v59 = 1;
LABEL_22:

LABEL_23:
  return v59;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA80] set];
  id v8 = [(PGSurveyQuestionFactory *)self workingContext];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __78__PGFrequentLocationQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  uint64_t v16 = &unk_1E68F0568;
  id v19 = v6;
  unint64_t v20 = a3;
  id v17 = v7;
  uint64_t v18 = self;
  id v9 = v7;
  id v10 = v6;
  [v8 performSynchronousConcurrentGraphReadUsingBlock:&v13];

  double v11 = objc_msgSend(v9, "allObjects", v13, v14, v15, v16);

  return v11;
}

void __78__PGFrequentLocationQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = (void (**)(void *, unsigned char *, double))_Block_copy(*(const void **)(a1 + 48));
  uint64_t v31 = 0;
  CLLocationCoordinate2D v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = (double *)&v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  if (!v4)
  {
    if (!*(void *)(a1 + 56)) {
      goto LABEL_23;
    }
    goto LABEL_13;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - v28[3] >= 0.01)
  {
    v28[3] = Current;
    char v26 = 0;
    v4[2](v4, &v26, 0.0);
    char v6 = *((unsigned char *)v32 + 24) | v26;
    *((unsigned char *)v32 + 24) = v6;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v36 = 60;
        __int16 v37 = 2080;
        uint64_t v38 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/FrequentLocation/PGFrequentLocationQuestionFactory.m";
        id v7 = MEMORY[0x1E4F14500];
LABEL_11:
        _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_23;
      }
      goto LABEL_23;
    }
  }
  if (*(void *)(a1 + 56))
  {
LABEL_13:
    id v10 = [v3 graph];
    double v11 = +[PGGraphNodeCollection nodesInGraph:v10];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __78__PGFrequentLocationQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_231;
    v18[3] = &unk_1E68EB510;
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 56);
    id v19 = v12;
    uint64_t v24 = v13;
    uint64_t v14 = v4;
    uint64_t v25 = 0x3F847AE147AE147BLL;
    long long v22 = &v27;
    int v23 = &v31;
    uint64_t v20 = *(void *)(a1 + 40);
    id v21 = v14;
    [v11 enumerateIdentifiersAsCollectionsWithBlock:v18];
    if (*((unsigned char *)v32 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_22:

        goto LABEL_23;
      }
      *(_DWORD *)buf = 67109378;
      int v36 = 93;
      __int16 v37 = 2080;
      uint64_t v38 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/FrequentLocation/PGFrequentLocationQuestionFactory.m";
      uint64_t v15 = MEMORY[0x1E4F14500];
    }
    else
    {
      if (!v4) {
        goto LABEL_22;
      }
      double v16 = CFAbsoluteTimeGetCurrent();
      if (v16 - v28[3] < 0.01) {
        goto LABEL_22;
      }
      v28[3] = v16;
      char v26 = 0;
      v14[2](v14, &v26, 1.0);
      char v17 = *((unsigned char *)v32 + 24) | v26;
      *((unsigned char *)v32 + 24) = v17;
      if (!v17 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 67109378;
      int v36 = 95;
      __int16 v37 = 2080;
      uint64_t v38 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/FrequentLocation/PGFrequentLocationQuestionFactory.m";
      uint64_t v15 = MEMORY[0x1E4F14500];
    }
    _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_22;
  }
  double v8 = CFAbsoluteTimeGetCurrent();
  if (v8 - v28[3] >= 0.01)
  {
    v28[3] = v8;
    char v26 = 0;
    v4[2](v4, &v26, 1.0);
    char v9 = *((unsigned char *)v32 + 24) | v26;
    *((unsigned char *)v32 + 24) = v9;
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v36 = 64;
        __int16 v37 = 2080;
        uint64_t v38 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/FrequentLocation/PGFrequentLocationQuestionFactory.m";
        id v7 = MEMORY[0x1E4F14500];
        goto LABEL_11;
      }
    }
  }
LABEL_23:
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
}

void __78__PGFrequentLocationQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_231(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) count];
  if (*(void *)(a1 + 48)
    && (unint64_t v8 = v7,
        unint64_t v9 = *(void *)(a1 + 72),
        double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8),
        Current - *(double *)(v11 + 24) >= *(double *)(a1 + 80))
    && (*(double *)(v11 + 24) = Current,
        (*(void (**)(double))(*(void *)(a1 + 48) + 16))((double)v8 / (double)v9),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else
  {
    id v12 = [v6 addressNodes];
    uint64_t v13 = *(void **)(a1 + 40);
    uint64_t v14 = [v12 momentNodes];
    uint64_t v15 = [v12 anyNode];
    [v15 coordinate];
    double v16 = objc_msgSend(v13, "_selectedAssetFromMomentNodes:closeToCoordinate:", v14);

    if (!v16
      || ([v16 location], char v17 = objc_claimAutoreleasedReturnValue(), v17, !v17)
      || [*(id *)(a1 + 40) _addIfNeededFrequentLocationQuestionForAsset:v16 withLocationTypeName:@"FrequentLocation" toQuestions:*(void *)(a1 + 32)]&& (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= *(void *)(a1 + 72))
    {
      *a4 = 1;
    }
  }
}

- (PHFetchResult)existingFrequentLocationQuestions
{
  existingFrequentLocationQuestions = self->_existingFrequentLocationQuestions;
  if (!existingFrequentLocationQuestions)
  {
    double v4 = [(PGSurveyQuestionFactory *)self fetchExistingQuestions];
    v5 = self->_existingFrequentLocationQuestions;
    self->_existingFrequentLocationQuestions = v4;

    existingFrequentLocationQuestions = self->_existingFrequentLocationQuestions;
  }
  return existingFrequentLocationQuestions;
}

- (int64_t)questionOptions
{
  return 128;
}

- (unsigned)questionType
{
  return 8;
}

@end
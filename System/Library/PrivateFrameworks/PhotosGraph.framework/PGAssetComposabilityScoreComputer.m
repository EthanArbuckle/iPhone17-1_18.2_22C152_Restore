@interface PGAssetComposabilityScoreComputer
- (PGAssetComposabilityScoreComputer)initWithPhotoLibrary:(id)a3 options:(id)a4;
- (double)bestDistanceWithSimilarityModelVersion:(unint64_t)a3;
- (double)composabilityScoreWithAssetDistance:(double)a3 andDistance:(double)a4 andDistance:(double)a5 similarityModelVersion:(unint64_t)a6;
- (double)composabilityScoreWithAssetDistance:(double)a3 similarityModelVersion:(unint64_t)a4;
- (double)identicalSimilarityThresholdWithSimilarityModelVersion:(unint64_t)a3;
- (double)semanticalSimilarityThresholdWithSimilarityModelVersion:(unint64_t)a3;
- (id)composabilityScoresOfAssetsForLocalIdentifiers:(id)a3;
- (id)initForTesting;
@end

@implementation PGAssetComposabilityScoreComputer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_similarStacker, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (id)composabilityScoresOfAssetsForLocalIdentifiers:(id)a3
{
  v67[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_computeDiptychScores) {
    id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v46 = 0;
  }
  if (self->_computeTriptychScores) {
    id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v45 = 0;
  }
  v5 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  uint64_t v6 = *MEMORY[0x1E4F39550];
  v67[0] = *MEMORY[0x1E4F394A8];
  v67[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F394E0];
  v67[2] = *MEMORY[0x1E4F39538];
  v67[3] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:4];
  [v5 setFetchPropertySets:v8];

  v44 = v5;
  v9 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v4 options:v5];
  id v10 = objc_alloc_init(MEMORY[0x1E4F8E778]);
  v11 = [v9 fetchedObjects];
  v43 = v10;
  [v10 prepareAssets:v11];

  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v55 objects:v66 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v56 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        v19 = [v18 localIdentifier];
        [v12 setObject:v18 forKeyedSubscript:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v55 objects:v66 count:16];
    }
    while (v15);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v4;
  uint64_t v20 = [obj countByEnumeratingWithState:&v51 objects:v65 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v49 = 0;
    v50 = 0;
    v22 = 0;
    uint64_t v48 = *(void *)v52;
    double v23 = 1.79769313e308;
    do
    {
      uint64_t v24 = 0;
      double v25 = v23;
      v26 = v22;
      do
      {
        if (*(void *)v52 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v51 + 1) + 8 * v24);
        v28 = (void *)MEMORY[0x1D25FED50]();
        v29 = [v12 objectForKeyedSubscript:v27];
        v22 = v29;
        if (v49 + v24)
        {
          v30 = v12;
          uint64_t v31 = [v29 clsSimilarityModelVersion];
          [(CLSSimilarStacker *)self->_similarStacker distanceBetweenItem:v22 andItem:v26];
          double v23 = v32;
          if (self->_computeDiptychScores)
          {
            [(PGAssetComposabilityScoreComputer *)self composabilityScoreWithAssetDistance:v31 similarityModelVersion:v32];
            v33 = objc_msgSend(NSNumber, "numberWithDouble:");
            [v46 addObject:v33];
          }
          if (self->_computeTriptychScores && (unint64_t)(v49 + v24) >= 2)
          {
            [(CLSSimilarStacker *)self->_similarStacker distanceBetweenItem:v22 andItem:v50];
            [(PGAssetComposabilityScoreComputer *)self composabilityScoreWithAssetDistance:v31 andDistance:v25 andDistance:v23 similarityModelVersion:v34];
            v35 = objc_msgSend(NSNumber, "numberWithDouble:");
            [v45 addObject:v35];
          }
          id v36 = v26;

          v50 = v36;
          double v25 = v23;
          v12 = v30;
        }
        else
        {
          double v23 = v25;
        }

        ++v24;
        v26 = v22;
      }
      while (v21 != v24);
      v49 += v21;
      uint64_t v21 = [obj countByEnumeratingWithState:&v51 objects:v65 count:16];
    }
    while (v21);
  }
  else
  {
    v50 = 0;
  }

  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v38 = v37;
  if (self->_computeDiptychScores) {
    [v37 setObject:v46 forKeyedSubscript:*MEMORY[0x1E4F39398]];
  }
  if (self->_computeTriptychScores) {
    [v38 setObject:v45 forKeyedSubscript:*MEMORY[0x1E4F393A0]];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v39 = [v46 count];
    int v40 = [v45 count];
    int v41 = [obj count];
    *(_DWORD *)buf = 67109632;
    int v60 = v39;
    __int16 v61 = 1024;
    int v62 = v40;
    __int16 v63 = 1024;
    int v64 = v41;
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "composabilityScoresOfAssetsForLocalIdentifiers returning %d diptych scores and %d triptych scores for %d input assets", buf, 0x14u);
  }

  return v38;
}

- (double)composabilityScoreWithAssetDistance:(double)a3 andDistance:(double)a4 andDistance:(double)a5 similarityModelVersion:(unint64_t)a6
{
  -[PGAssetComposabilityScoreComputer composabilityScoreWithAssetDistance:similarityModelVersion:](self, "composabilityScoreWithAssetDistance:similarityModelVersion:", a3);
  double v11 = v10;
  [(PGAssetComposabilityScoreComputer *)self composabilityScoreWithAssetDistance:a6 similarityModelVersion:a4];
  double v13 = v12;
  [(PGAssetComposabilityScoreComputer *)self composabilityScoreWithAssetDistance:a6 similarityModelVersion:a5];
  return (v11 + v13 + v14) / 3.0;
}

- (double)composabilityScoreWithAssetDistance:(double)a3 similarityModelVersion:(unint64_t)a4
{
  -[PGAssetComposabilityScoreComputer identicalSimilarityThresholdWithSimilarityModelVersion:](self, "identicalSimilarityThresholdWithSimilarityModelVersion:");
  double v8 = v7;
  [(PGAssetComposabilityScoreComputer *)self semanticalSimilarityThresholdWithSimilarityModelVersion:a4];
  double v10 = (v9 - v8) * 0.1;
  double v11 = v8 + v10;
  BOOL v12 = v8 - v10 >= a3 || v11 <= a3;
  if (!v12) {
    return (a3 - v8 + v10) / (v10 + v10);
  }
  double v13 = v9 - v10;
  double v17 = 1.0;
  if (v11 > a3 || v13 < a3)
  {
    double v17 = 0.0;
    if (v13 < a3)
    {
      double v15 = v9 + v10;
      BOOL v12 = v15 <= a3;
      double v16 = (v15 - a3) / (v10 + v10);
      if (!v12) {
        return v16;
      }
    }
  }
  return v17;
}

- (double)bestDistanceWithSimilarityModelVersion:(unint64_t)a3
{
  -[PGAssetComposabilityScoreComputer identicalSimilarityThresholdWithSimilarityModelVersion:](self, "identicalSimilarityThresholdWithSimilarityModelVersion:");
  double v6 = v5;
  [(PGAssetComposabilityScoreComputer *)self semanticalSimilarityThresholdWithSimilarityModelVersion:a3];
  return (v6 + v7) * 0.5;
}

- (double)semanticalSimilarityThresholdWithSimilarityModelVersion:(unint64_t)a3
{
  [(CLSSimilarStacker *)self->_similarStacker distanceThresholdForSimilarity:2 withSimilarityModelVersion:a3];
  return result;
}

- (double)identicalSimilarityThresholdWithSimilarityModelVersion:(unint64_t)a3
{
  [(CLSSimilarStacker *)self->_similarStacker distanceThresholdForSimilarity:0 withSimilarityModelVersion:a3];
  return result;
}

- (id)initForTesting
{
  id result = [(PGAssetComposabilityScoreComputer *)self initWithPhotoLibrary:0 options:MEMORY[0x1E4F1CC08]];
  if (result) {
    *((_WORD *)result + 12) = 257;
  }
  return result;
}

- (PGAssetComposabilityScoreComputer)initWithPhotoLibrary:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PGAssetComposabilityScoreComputer;
  double v9 = [(PGAssetComposabilityScoreComputer *)&v26 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F76DA0]) initWithSimilarityModelClass:objc_opt_class()];
    similarStacker = v10->_similarStacker;
    v10->_similarStacker = (CLSSimilarStacker *)v11;

    double v13 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F39378]];
    v10->_computeDiptychScores = [v13 BOOLValue];

    double v14 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F39380]];
    v10->_computeTriptychScores = [v14 BOOLValue];

    uint64_t v15 = *MEMORY[0x1E4F39388];
    double v16 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F39388]];

    if (v16)
    {
      double v17 = [v8 objectForKeyedSubscript:v15];
      [v17 doubleValue];
      double v19 = v18;

      [(CLSSimilarStacker *)v10->_similarStacker overrideDistanceThreshold:0 forSimilarity:v19];
      [(CLSSimilarStacker *)v10->_similarStacker overrideDistanceThreshold:1 forSimilarity:v19];
    }
    uint64_t v20 = *MEMORY[0x1E4F39390];
    uint64_t v21 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F39390]];

    if (v21)
    {
      v22 = [v8 objectForKeyedSubscript:v20];
      [v22 doubleValue];
      double v24 = v23;

      [(CLSSimilarStacker *)v10->_similarStacker overrideDistanceThreshold:2 forSimilarity:v24];
      [(CLSSimilarStacker *)v10->_similarStacker overrideDistanceThreshold:3 forSimilarity:v24];
      [(CLSSimilarStacker *)v10->_similarStacker overrideDistanceThreshold:4 forSimilarity:v24];
    }
  }

  return v10;
}

@end
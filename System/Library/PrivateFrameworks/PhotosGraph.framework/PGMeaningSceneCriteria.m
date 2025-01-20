@interface PGMeaningSceneCriteria
+ (id)criteriaKey;
+ (id)criteriaWithDictionary:(id)a3;
- (BOOL)accumulateAssetCountsWithPositiveScenes;
- (BOOL)isValid;
- (BOOL)passesForAssets:(id)a3;
- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4;
- (NSArray)negativeScenes;
- (NSArray)positiveScenes;
- (NSString)description;
- (double)minimumRatioOfAssetsWithPositiveScenes;
- (unint64_t)minimumNumberOfAssetsWithNegativeScenes;
- (unint64_t)minimumNumberOfAssetsWithPositiveScenes;
- (unint64_t)minimumNumberOfNegativeScenes;
- (unint64_t)minimumNumberOfPositiveScenes;
- (void)setAccumulateAssetCountsWithPositiveScenes:(BOOL)a3;
- (void)setMinimumNumberOfAssetsWithNegativeScenes:(unint64_t)a3;
- (void)setMinimumNumberOfAssetsWithPositiveScenes:(unint64_t)a3;
- (void)setMinimumNumberOfNegativeScenes:(unint64_t)a3;
- (void)setMinimumNumberOfPositiveScenes:(unint64_t)a3;
- (void)setMinimumRatioOfAssetsWithPositiveScenes:(double)a3;
- (void)setNegativeScenes:(id)a3;
- (void)setPositiveScenes:(id)a3;
@end

@implementation PGMeaningSceneCriteria

+ (id)criteriaWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  uint64_t v6 = [v4 objectForKeyedSubscript:@"positiveScenes"];
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6) {
    v9 = (void *)v6;
  }
  else {
    v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v10 = v9;

  [v5 setPositiveScenes:v10];
  v11 = [v4 objectForKeyedSubscript:@"minimumNumberOfPositiveScenes"];
  unint64_t v12 = [v11 unsignedIntegerValue];

  if (v12 <= 1) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v12;
  }
  [v5 setMinimumNumberOfPositiveScenes:v13];
  v14 = [v4 objectForKeyedSubscript:@"minimumNumberOfNegativeScenes"];
  unint64_t v15 = [v14 unsignedIntegerValue];

  if (v15 <= 1) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = v15;
  }
  [v5 setMinimumNumberOfNegativeScenes:v16];
  v17 = [v4 objectForKeyedSubscript:@"minimumNumberOfAssetsWithPositiveScenes"];
  objc_msgSend(v5, "setMinimumNumberOfAssetsWithPositiveScenes:", objc_msgSend(v17, "unsignedIntegerValue"));

  v18 = [v4 objectForKeyedSubscript:@"accumulateAssetCountsWithPositiveScenes"];
  objc_msgSend(v5, "setAccumulateAssetCountsWithPositiveScenes:", objc_msgSend(v18, "BOOLValue"));

  v19 = [v4 objectForKeyedSubscript:@"minimumNumberOfAssetsWithNegativeScenes"];
  objc_msgSend(v5, "setMinimumNumberOfAssetsWithNegativeScenes:", objc_msgSend(v19, "unsignedIntegerValue"));

  v20 = [v4 objectForKeyedSubscript:@"minimumRatioOfAssetsWithPositiveScenes"];
  [v20 doubleValue];
  objc_msgSend(v5, "setMinimumRatioOfAssetsWithPositiveScenes:");

  v21 = [v4 objectForKeyedSubscript:@"negativeScenes"];

  if (v21) {
    v22 = v21;
  }
  else {
    v22 = v8;
  }
  id v23 = v22;

  [v5 setNegativeScenes:v23];
  return v5;
}

+ (id)criteriaKey
{
  return @"Scene";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeScenes, 0);
  objc_storeStrong((id *)&self->_positiveScenes, 0);
}

- (void)setMinimumRatioOfAssetsWithPositiveScenes:(double)a3
{
  self->_minimumRatioOfAssetsWithPositiveScenes = a3;
}

- (double)minimumRatioOfAssetsWithPositiveScenes
{
  return self->_minimumRatioOfAssetsWithPositiveScenes;
}

- (void)setMinimumNumberOfAssetsWithNegativeScenes:(unint64_t)a3
{
  self->_minimumNumberOfAssetsWithNegativeScenes = a3;
}

- (unint64_t)minimumNumberOfAssetsWithNegativeScenes
{
  return self->_minimumNumberOfAssetsWithNegativeScenes;
}

- (void)setAccumulateAssetCountsWithPositiveScenes:(BOOL)a3
{
  self->_accumulateAssetCountsWithPositiveScenes = a3;
}

- (BOOL)accumulateAssetCountsWithPositiveScenes
{
  return self->_accumulateAssetCountsWithPositiveScenes;
}

- (void)setMinimumNumberOfAssetsWithPositiveScenes:(unint64_t)a3
{
  self->_minimumNumberOfAssetsWithPositiveScenes = a3;
}

- (unint64_t)minimumNumberOfAssetsWithPositiveScenes
{
  return self->_minimumNumberOfAssetsWithPositiveScenes;
}

- (void)setMinimumNumberOfNegativeScenes:(unint64_t)a3
{
  self->_minimumNumberOfNegativeScenes = a3;
}

- (unint64_t)minimumNumberOfNegativeScenes
{
  return self->_minimumNumberOfNegativeScenes;
}

- (void)setMinimumNumberOfPositiveScenes:(unint64_t)a3
{
  self->_minimumNumberOfPositiveScenes = a3;
}

- (unint64_t)minimumNumberOfPositiveScenes
{
  return self->_minimumNumberOfPositiveScenes;
}

- (void)setNegativeScenes:(id)a3
{
}

- (NSArray)negativeScenes
{
  return self->_negativeScenes;
}

- (void)setPositiveScenes:(id)a3
{
}

- (NSArray)positiveScenes
{
  return self->_positiveScenes;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = [(PGMeaningSceneCriteria *)self positiveScenes];
  id v5 = [v4 componentsJoinedByString:@", "];

  uint64_t v6 = [(PGMeaningSceneCriteria *)self negativeScenes];
  v7 = [v6 componentsJoinedByString:@", "];

  [v3 appendFormat:@"positiveScenes: %@\n", v5];
  objc_msgSend(v3, "appendFormat:", @"minimumNumberOfPositiveScenes: %d\n", -[PGMeaningSceneCriteria minimumNumberOfPositiveScenes](self, "minimumNumberOfPositiveScenes"));
  objc_msgSend(v3, "appendFormat:", @"minimumNumberOfAssetsWithPositiveScenes: %d\n", -[PGMeaningSceneCriteria minimumNumberOfAssetsWithPositiveScenes](self, "minimumNumberOfAssetsWithPositiveScenes"));
  [(PGMeaningSceneCriteria *)self minimumRatioOfAssetsWithPositiveScenes];
  objc_msgSend(v3, "appendFormat:", @"minimumRatioOfAssetsWithPositiveScenes: %d\n", (int)v8);
  BOOL v9 = [(PGMeaningSceneCriteria *)self accumulateAssetCountsWithPositiveScenes];
  id v10 = @"NO";
  if (v9) {
    id v10 = @"YES";
  }
  [v3 appendFormat:@"accumulateAssetCountsWithPositiveScenes: %@\n", v10];
  [v3 appendFormat:@"negativeScenes: %@\n", v7];
  objc_msgSend(v3, "appendFormat:", @"minimumNumberOfNegativeScenes: %d\n", -[PGMeaningSceneCriteria minimumNumberOfNegativeScenes](self, "minimumNumberOfNegativeScenes"));
  objc_msgSend(v3, "appendFormat:", @"minimumNumberOfAssetsWithNegativeScenes: %d\n", -[PGMeaningSceneCriteria minimumNumberOfAssetsWithNegativeScenes](self, "minimumNumberOfAssetsWithNegativeScenes"));

  return (NSString *)v3;
}

- (BOOL)isValid
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F8CD60] sharedTaxonomy];
  id v4 = [(PGMeaningSceneCriteria *)self positiveScenes];
  id v5 = [(PGMeaningSceneCriteria *)self negativeScenes];
  uint64_t v6 = [v4 arrayByAddingObjectsFromArray:v5];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v22;
    char v12 = 1;
    *(void *)&long long v9 = 138412290;
    long long v20 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        unint64_t v15 = objc_msgSend(v14, "lowercaseString", v20, (void)v21);
        uint64_t v16 = [v3 nodeForName:v15];
        if (!v16)
        {
          v17 = +[PGLogging sharedLogging];
          v18 = [v17 loggingConnection];

          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v20;
            v26 = v14;
            _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_INFO, "[MEANING CRITERIA] Invalid scene name \"%@\"", buf, 0xCu);
          }

          char v12 = 0;
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v10);
  }
  else
  {
    char v12 = 1;
  }

  return v12 & 1;
}

- (BOOL)passesForAssets:(id)a3
{
  return 1;
}

- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PGMeaningSceneCriteria *)self positiveScenes];
  uint64_t v9 = [v8 count];

  uint64_t v10 = [(PGMeaningSceneCriteria *)self negativeScenes];
  uint64_t v11 = [v10 count];

  if (v9 | v11)
  {
    uint64_t v20 = 0;
    long long v21 = &v20;
    uint64_t v22 = 0x2020000000;
    BOOL v23 = v9 == 0;
    uint64_t v13 = [v6 numberOfAssets];
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v19[3] = 0;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v18[3] = 0;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__PGMeaningSceneCriteria_passesForMomentNode_momentNodeCache___block_invoke;
    v15[3] = &unk_1E68E6EF8;
    v15[4] = self;
    v15[5] = &v20;
    v15[6] = v19;
    v15[7] = v17;
    v15[10] = v13;
    v15[11] = v11;
    v15[8] = v18;
    v15[9] = v16;
    [v7 enumerateSceneEdgesAndNodesUsingBlock:v15];
    BOOL v12 = *((unsigned char *)v21 + 24) != 0;
    _Block_object_dispose(v16, 8);
    _Block_object_dispose(v17, 8);
    _Block_object_dispose(v18, 8);
    _Block_object_dispose(v19, 8);
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

void __62__PGMeaningSceneCriteria_passesForMomentNode_momentNodeCache___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v20 = a2;
  id v7 = [a3 sceneName];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v8 = [*(id *)(a1 + 32) positiveScenes];
    int v9 = [v8 containsObject:v7];

    if (v9)
    {
      if (([*(id *)(a1 + 32) accumulateAssetCountsWithPositiveScenes] & 1) != 0
        || (unint64_t v10 = [v20 numberOfHighConfidenceAssets],
            v10 >= [*(id *)(a1 + 32) minimumNumberOfAssetsWithPositiveScenes]))
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      }
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v20 numberOfHighConfidenceAssets];
      unint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      unint64_t v12 = *(void *)(a1 + 80);
      unint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      if (v13 >= [*(id *)(a1 + 32) minimumNumberOfPositiveScenes])
      {
        unint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        if (v14 >= [*(id *)(a1 + 32) minimumNumberOfAssetsWithPositiveScenes])
        {
          [*(id *)(a1 + 32) minimumRatioOfAssetsWithPositiveScenes];
          if ((double)v11 / (double)v12 >= v15) {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          }
        }
      }
    }
  }
  if (*(void *)(a1 + 88))
  {
    uint64_t v16 = [*(id *)(a1 + 32) negativeScenes];
    int v17 = [v16 containsObject:v7];

    if (v17)
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += [v20 numberOfHighConfidenceAssets];
      unint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      if (v18 >= [*(id *)(a1 + 32) minimumNumberOfNegativeScenes])
      {
        unint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        if (v19 >= [*(id *)(a1 + 32) minimumNumberOfAssetsWithNegativeScenes])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          *a4 = 1;
        }
      }
    }
  }
}

@end
@interface PPMostCommonFeatureValue
- (PPMostCommonFeatureValue)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)_dominantItem;
- (id)itemCounts;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation PPMostCommonFeatureValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominantItemCountFeatureValueKey, 0);
  objc_storeStrong((id *)&self->_dominantItemFeatureValueKey, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_itemCounts, 0);
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = (NSCountedSet *)objc_opt_new();
  itemCounts = self->_itemCounts;
  self->_itemCounts = v11;

  if ([v9 count] < 0)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PPNamedEntityUtils.m", 96, @"MLBatchProvider has a negative count: %td", objc_msgSend(v9, "count"));
  }
  if ([v9 count])
  {
    uint64_t v13 = 0;
    while (1)
    {
      v14 = [v9 featuresAtIndex:v13];
      v15 = [v14 featureValueForName:self->_featureName];

      if (!v15) {
        break;
      }
      [(NSCountedSet *)self->_itemCounts addObject:v15];

      if (++v13 >= (unint64_t)[v9 count]) {
        goto LABEL_7;
      }
    }
    v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      featureName = self->_featureName;
      *(_DWORD *)buf = 138412802;
      id v35 = v9;
      __int16 v36 = 2048;
      uint64_t v37 = v13;
      __int16 v38 = 2112;
      v39 = featureName;
      _os_log_fault_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_FAULT, "predictionsFromBatch:options:error: failed to get feature value from %@ at %tu for %@", buf, 0x20u);
    }
    v27 = 0;
  }
  else
  {
LABEL_7:
    v16 = [(PPMostCommonFeatureValue *)self _dominantItem];
    v17 = objc_msgSend(objc_alloc(NSNumber), "initWithLong:", -[NSCountedSet countForObject:](self->_itemCounts, "countForObject:", v16));
    v18 = (NSCountedSet *)objc_opt_new();
    v19 = self->_itemCounts;
    self->_itemCounts = v18;

    id v20 = objc_alloc(MEMORY[0x1E4F1E930]);
    dominantItemCountFeatureValueKey = self->_dominantItemCountFeatureValueKey;
    v32[0] = self->_dominantItemFeatureValueKey;
    v32[1] = dominantItemCountFeatureValueKey;
    v33[0] = v16;
    v33[1] = v17;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    v23 = (void *)[v20 initWithDictionary:v22 error:a5];

    if (v23)
    {
      id v24 = objc_alloc(MEMORY[0x1E4F1E910]);
      v25 = (void *)MEMORY[0x1CB79D060]();
      v31 = v23;
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
      v27 = (void *)[v24 initWithFeatureProviderArray:v26];
    }
    else
    {
      v27 = 0;
    }
  }
  return v27;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [v7 featureValueForName:self->_featureName];
  id v9 = v8;
  if (v8)
  {
    if ([v8 type] != 7)
    {
      [(NSCountedSet *)self->_itemCounts addObject:v9];
LABEL_13:
      uint64_t v13 = [(PPMostCommonFeatureValue *)self _dominantItem];
      v16 = objc_msgSend(objc_alloc(NSNumber), "initWithLong:", -[NSCountedSet countForObject:](self->_itemCounts, "countForObject:", v13));
      id v17 = objc_alloc(MEMORY[0x1E4F1E930]);
      dominantItemCountFeatureValueKey = self->_dominantItemCountFeatureValueKey;
      v22[0] = self->_dominantItemFeatureValueKey;
      v22[1] = dominantItemCountFeatureValueKey;
      v23[0] = v13;
      v23[1] = v16;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
      v14 = (void *)[v17 initWithDictionary:v19 error:a5];

      goto LABEL_14;
    }
    id v10 = [v9 sequenceValue];
    if ([v10 type] == 3)
    {
      itemCounts = self->_itemCounts;
      uint64_t v12 = [v10 stringValues];
    }
    else
    {
      if ([v10 type] != 1)
      {
LABEL_12:

        goto LABEL_13;
      }
      itemCounts = self->_itemCounts;
      uint64_t v12 = [v10 int64Values];
    }
    v15 = (void *)v12;
    [(NSCountedSet *)itemCounts addObjectsFromArray:v12];

    goto LABEL_12;
  }
  uint64_t v13 = pp_default_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    featureName = self->_featureName;
    *(_DWORD *)buf = 138412546;
    id v25 = v7;
    __int16 v26 = 2112;
    v27 = featureName;
    _os_log_fault_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_FAULT, "predictionFromFeatures:options:error: failed to get feature value from %@ for %@", buf, 0x16u);
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (PPMostCommonFeatureValue)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PPMostCommonFeatureValue;
  id v7 = [(PPMostCommonFeatureValue *)&v17 init];
  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    itemCounts = v7->_itemCounts;
    v7->_itemCounts = (NSCountedSet *)v8;

    uint64_t v10 = [v6 objectForKeyedSubscript:@"feature_name"];
    featureName = v7->_featureName;
    v7->_featureName = (NSString *)v10;

    uint64_t v12 = [v6 objectForKeyedSubscript:@"dominant_item_name"];
    dominantItemFeatureValueKey = v7->_dominantItemFeatureValueKey;
    v7->_dominantItemFeatureValueKey = (NSString *)v12;

    uint64_t v14 = [v6 objectForKeyedSubscript:@"dominant_item_count_name"];
    dominantItemCountFeatureValueKey = v7->_dominantItemCountFeatureValueKey;
    v7->_dominantItemCountFeatureValueKey = (NSString *)v14;
  }
  return v7;
}

- (id)itemCounts
{
  return self->_itemCounts;
}

- (id)_dominantItem
{
  if ([(NSCountedSet *)self->_itemCounts count])
  {
    v3 = [(NSCountedSet *)self->_itemCounts allObjects];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__PPMostCommonFeatureValue__dominantItem__block_invoke;
    v7[3] = &unk_1E65D4658;
    v7[4] = self;
    v4 = [v3 sortedArrayUsingComparator:v7];
    v5 = [v4 lastObject];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

uint64_t __41__PPMostCommonFeatureValue__dominantItem__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = a3;
  unint64_t v7 = [v5 countForObject:a2];
  unint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 8) countForObject:v6];

  uint64_t v9 = -1;
  if (v7 >= v8) {
    uint64_t v9 = 1;
  }
  if (v7 == v8) {
    return 0;
  }
  else {
    return v9;
  }
}

@end
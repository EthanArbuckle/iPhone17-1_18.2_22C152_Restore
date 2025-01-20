@interface PGMeaningActionCriteria
+ (PGMeaningActionCriteria)criteriaWithDictionary:(id)a3;
+ (double)actionHighRecallThresholdForAssetMediaAnalysisVersion:(unint64_t)a3 usingActionCriteriaByValidPersonActivityMeaningLabel:(id)a4 andValidPersonActivity:(id)a5;
+ (id)actionValueStringUsingActionCriteriaByValidPersonActivityMeaningLabel:(id)a3 withPersonActivityMeaningLabel:(id)a4;
+ (id)criteriaKey;
+ (id)descendingSortedMediaAnalysisVersionFromCriteriaDictionary:(id)a3 usingActionThresholdKey:(id)a4;
+ (id)parseThresholdFromCriteriaDictionary:(id)a3 usingActionThresholdKey:(id)a4;
- (BOOL)isValid;
- (BOOL)passesCriteriaWithTrait:(id)a3 withHighPrecisionThreshold:(double)a4;
- (BOOL)passesForAssets:(id)a3;
- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4;
- (NSArray)descendingSortedMediaAnalysisVersion;
- (NSDictionary)highPrecisionThresholdByMediaAnalysisVersion;
- (NSDictionary)highRecallThresholdByMediaAnalysisVersion;
- (NSString)actionName;
- (NSString)description;
- (double)actionThresholdForAssetMediaAnalysisVersion:(unint64_t)a3 withActionThresholdByMediaAnalysisVersion:(id)a4;
- (int64_t)actionValue;
- (void)setActionName:(id)a3;
- (void)setActionValue:(int64_t)a3;
- (void)setDescendingSortedMediaAnalysisVersion:(id)a3;
- (void)setHighPrecisionThresholdByMediaAnalysisVersion:(id)a3;
- (void)setHighRecallThresholdByMediaAnalysisVersion:(id)a3;
@end

@implementation PGMeaningActionCriteria

+ (double)actionHighRecallThresholdForAssetMediaAnalysisVersion:(unint64_t)a3 usingActionCriteriaByValidPersonActivityMeaningLabel:(id)a4 andValidPersonActivity:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    v9 = [v7 objectForKeyedSubscript:v8];
    v10 = [v9 highRecallThresholdByMediaAnalysisVersion];

    if (v10)
    {
      v11 = [v9 highRecallThresholdByMediaAnalysisVersion];
      [v9 actionThresholdForAssetMediaAnalysisVersion:a3 withActionThresholdByMediaAnalysisVersion:v11];
      double v13 = v12;
    }
    else
    {
      double v13 = 1.0;
    }
  }
  else
  {
    double v13 = 1.0;
  }

  return v13;
}

+ (id)actionValueStringUsingActionCriteriaByValidPersonActivityMeaningLabel:(id)a3 withPersonActivityMeaningLabel:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = [v5 objectForKeyedSubscript:v6];
    objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v8, "actionValue"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_1F283BC78;
  }

  return v9;
}

+ (id)descendingSortedMediaAnalysisVersionFromCriteriaDictionary:(id)a3 usingActionThresholdKey:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(a3, "objectForKeyedSubscript:", @"operatingPoints", a4);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v7 setNumberStyle:1];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = objc_msgSend(v4, "allKeys", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = [v7 numberFromString:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          [v6 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v10);
    }

    v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:0];
    v22 = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    uint64_t v16 = [v6 sortedArrayUsingDescriptors:v15];

    id v5 = (id)v16;
  }

  return v5;
}

+ (id)parseThresholdFromCriteriaDictionary:(id)a3 usingActionThresholdKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKeyedSubscript:@"operatingPoints"];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__PGMeaningActionCriteria_parseThresholdFromCriteriaDictionary_usingActionThresholdKey___block_invoke;
  v15[3] = &unk_1E68EBF78;
  id v16 = v6;
  id v9 = v8;
  id v17 = v9;
  id v18 = v5;
  id v10 = v5;
  id v11 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v15];
  double v12 = v18;
  id v13 = v9;

  return v13;
}

void __88__PGMeaningActionCriteria_parseThresholdFromCriteriaDictionary_usingActionThresholdKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [a3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v7 = v6;
  if (v6)
  {
    [v6 floatValue];
    if (v8 > 0.0 && v8 < 1.0) {
      [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v5];
    }
  }
  else
  {
    id v10 = +[PGLogging sharedLogging];
    id v11 = [v10 loggingConnection];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      double v12 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"actionName"];
      id v13 = [0 stringValue];
      int v14 = 138412802;
      v15 = v12;
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2112;
      long long v19 = v13;
      _os_log_error_impl(&dword_1D1805000, v11, OS_LOG_TYPE_ERROR, "[PGMeaningActionCriteria] Action %@ version %@ has invalid threshold %@", (uint8_t *)&v14, 0x20u);
    }
  }
}

+ (PGMeaningActionCriteria)criteriaWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  id v6 = [v4 objectForKeyedSubscript:@"actionValue"];
  objc_msgSend(v5, "setActionValue:", (int)objc_msgSend(v6, "intValue"));

  id v7 = [v4 objectForKeyedSubscript:@"actionName"];
  [v5 setActionName:v7];

  float v8 = [a1 parseThresholdFromCriteriaDictionary:v4 usingActionThresholdKey:@"confidenceHighPrecisionThreshold"];
  [v5 setHighPrecisionThresholdByMediaAnalysisVersion:v8];

  id v9 = [a1 parseThresholdFromCriteriaDictionary:v4 usingActionThresholdKey:@"confidenceHighRecallThreshold"];
  [v5 setHighRecallThresholdByMediaAnalysisVersion:v9];

  id v10 = [a1 descendingSortedMediaAnalysisVersionFromCriteriaDictionary:v4 usingActionThresholdKey:@"confidenceHighPrecisionThreshold"];

  [v5 setDescendingSortedMediaAnalysisVersion:v10];
  return (PGMeaningActionCriteria *)v5;
}

+ (id)criteriaKey
{
  return @"Action";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descendingSortedMediaAnalysisVersion, 0);
  objc_storeStrong((id *)&self->_highRecallThresholdByMediaAnalysisVersion, 0);
  objc_storeStrong((id *)&self->_highPrecisionThresholdByMediaAnalysisVersion, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
}

- (void)setDescendingSortedMediaAnalysisVersion:(id)a3
{
}

- (NSArray)descendingSortedMediaAnalysisVersion
{
  return self->_descendingSortedMediaAnalysisVersion;
}

- (void)setHighRecallThresholdByMediaAnalysisVersion:(id)a3
{
}

- (NSDictionary)highRecallThresholdByMediaAnalysisVersion
{
  return self->_highRecallThresholdByMediaAnalysisVersion;
}

- (void)setHighPrecisionThresholdByMediaAnalysisVersion:(id)a3
{
}

- (NSDictionary)highPrecisionThresholdByMediaAnalysisVersion
{
  return self->_highPrecisionThresholdByMediaAnalysisVersion;
}

- (void)setActionValue:(int64_t)a3
{
  self->_actionValue = a3;
}

- (int64_t)actionValue
{
  return self->_actionValue;
}

- (void)setActionName:(id)a3
{
}

- (NSString)actionName
{
  return self->_actionName;
}

- (double)actionThresholdForAssetMediaAnalysisVersion:(unint64_t)a3 withActionThresholdByMediaAnalysisVersion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(PGMeaningActionCriteria *)self descendingSortedMediaAnalysisVersion];
  float v8 = [v7 lastObject];

  double v9 = 1.0;
  if (v8 && [v8 unsignedIntValue] <= a3)
  {
    id v10 = v8;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = [(PGMeaningActionCriteria *)self descendingSortedMediaAnalysisVersion];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          __int16 v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v16 unsignedIntValue] <= a3)
          {
            id v17 = v16;

            id v10 = v17;
            goto LABEL_13;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    __int16 v18 = [v10 stringValue];
    long long v19 = [v6 objectForKeyedSubscript:v18];

    if (v19)
    {
      [v19 doubleValue];
      double v9 = v20;
    }
    else
    {
      double v9 = 1.0;
    }
  }
  return v9;
}

- (NSString)description
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = [(PGMeaningActionCriteria *)self actionName];
  [v3 appendFormat:@"%@: %@\n", @"actionName", v4];

  [v3 appendFormat:@"%@: %lu\n", @"actionValue", -[PGMeaningActionCriteria actionValue](self, "actionValue")];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = [(PGMeaningActionCriteria *)self highPrecisionThresholdByMediaAnalysisVersion];
  id v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v12 = [(PGMeaningActionCriteria *)self highPrecisionThresholdByMediaAnalysisVersion];
        uint64_t v13 = [v12 objectForKey:v11];
        [v3 appendFormat:@"High Precision Threshold for version %@: %@\n", v11, v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v8);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v14 = [(PGMeaningActionCriteria *)self highRecallThresholdByMediaAnalysisVersion];
  v15 = [v14 allKeys];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v24 + 1) + 8 * j);
        long long v21 = [(PGMeaningActionCriteria *)self highRecallThresholdByMediaAnalysisVersion];
        long long v22 = [v21 objectForKey:v20];
        [v3 appendFormat:@"High Recall Threshold for version %@: %@\n", v20, v22];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v17);
  }

  return (NSString *)v3;
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)passesCriteriaWithTrait:(id)a3 withHighPrecisionThreshold:(double)a4
{
  id v6 = a3;
  if ([v6 type] == 1 && self->_actionValue == (int)objc_msgSend(v6, "value"))
  {
    [v6 score];
    BOOL v8 = v7 >= a4;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)passesForAssets:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  id v16 = a3;
  if ([v16 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = v16;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v4);
          }
          BOOL v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v9 = [v8 clsFaceInformationSummary];
          id v10 = [v9 faceInformationByPersonLocalIdentifier];

          uint64_t v11 = [v8 mediaAnalysisProperties];
          uint64_t v12 = [v11 mediaAnalysisVersion];

          if (v12)
          {
            [(PGMeaningActionCriteria *)self actionThresholdForAssetMediaAnalysisVersion:v12 withActionThresholdByMediaAnalysisVersion:self->_highPrecisionThresholdByMediaAnalysisVersion];
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __43__PGMeaningActionCriteria_passesForAssets___block_invoke;
            v17[3] = &unk_1E68EBF50;
            v17[4] = self;
            v17[5] = &v22;
            v17[6] = v13;
            [v10 enumerateKeysAndObjectsUsingBlock:v17];
            if (*((unsigned char *)v23 + 24))
            {

              goto LABEL_13;
            }
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  BOOL v14 = *((unsigned char *)v23 + 24) != 0;
  _Block_object_dispose(&v22, 8);

  return v14;
}

void __43__PGMeaningActionCriteria_passesForAssets___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [a3 traits];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "passesCriteriaWithTrait:withHighPrecisionThreshold:", *(void *)(*((void *)&v11 + 1) + 8 * i), *(double *)(a1 + 48), (void)v11);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
        {
          *a4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4
{
  return 1;
}

@end
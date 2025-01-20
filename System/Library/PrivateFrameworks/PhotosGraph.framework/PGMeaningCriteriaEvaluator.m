@interface PGMeaningCriteriaEvaluator
+ (id)_allMeaningCriteriaClassArray;
+ (id)meaningCriteriaEvaluatorsForMeaningLabel:(id)a3 withDictionary:(id)a4 serviceManager:(id)a5;
- (BOOL)allCriteriaIsValid;
- (BOOL)allCriteriaPassForAssets:(id)a3;
- (BOOL)allCriteriaPassForMomentNode:(id)a3 momentNodeCache:(id)a4;
- (NSArray)allMeaningCriteriaArray;
- (NSString)meaningLabel;
- (PGMeaningActionCriteria)meaningActionCriteria;
- (PGMeaningCriteriaEvaluator)initWithDictionary:(id)a3 meaningCriteriaInfo:(id)a4 serviceManager:(id)a5;
- (PGMeaningCriteriaInfo)meaningCriteriaInfo;
- (PGMeaningSceneCriteria)meaningSceneCriteria;
- (id)description;
- (void)setAllMeaningCriteriaArray:(id)a3;
- (void)setMeaningActionCriteria:(id)a3;
- (void)setMeaningCriteriaInfo:(id)a3;
- (void)setMeaningSceneCriteria:(id)a3;
@end

@implementation PGMeaningCriteriaEvaluator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allMeaningCriteriaArray, 0);
  objc_storeStrong((id *)&self->_meaningActionCriteria, 0);
  objc_storeStrong((id *)&self->_meaningSceneCriteria, 0);
  objc_storeStrong((id *)&self->_meaningCriteriaInfo, 0);
  objc_storeStrong((id *)&self->_meaningLabel, 0);
}

- (void)setAllMeaningCriteriaArray:(id)a3
{
}

- (NSArray)allMeaningCriteriaArray
{
  return self->_allMeaningCriteriaArray;
}

- (void)setMeaningActionCriteria:(id)a3
{
}

- (PGMeaningActionCriteria)meaningActionCriteria
{
  return self->_meaningActionCriteria;
}

- (void)setMeaningSceneCriteria:(id)a3
{
}

- (PGMeaningSceneCriteria)meaningSceneCriteria
{
  return self->_meaningSceneCriteria;
}

- (void)setMeaningCriteriaInfo:(id)a3
{
}

- (PGMeaningCriteriaInfo)meaningCriteriaInfo
{
  return self->_meaningCriteriaInfo;
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(PGMeaningCriteriaEvaluator *)self meaningCriteriaInfo];
  v4 = (void *)MEMORY[0x1E4F28E78];
  v5 = [v3 meaningLabel];
  v6 = [v4 stringWithFormat:@"=== %@Criteria%d ===\n\n", v5, objc_msgSend(v3, "criteriaNumber")];

  [v3 version];
  objc_msgSend(v6, "appendFormat:", @"version: %f\n\n", v7);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v8 = self->_allMeaningCriteriaArray;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v14 = [(id)objc_opt_class() criteriaKey];
        [v6 appendFormat:@"*%@*\n", v14];

        v15 = [v13 description];
        [v6 appendFormat:@"%@\n", v15];
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v6;
}

- (BOOL)allCriteriaIsValid
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = self->_allMeaningCriteriaArray;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    uint64_t v7 = @"FAILED";
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "isValid", (void)v13))
        {
          BOOL v9 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
      if (v5) {
        continue;
      }
      break;
    }
    BOOL v9 = 1;
    uint64_t v7 = @"PASSED";
  }
  else
  {
    uint64_t v7 = @"PASSED";
    BOOL v9 = 1;
  }
LABEL_12:

  uint64_t v10 = +[PGLogging sharedLogging];
  uint64_t v11 = [v10 loggingConnection];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    long long v18 = v7;
    __int16 v19 = 2112;
    long long v20 = self;
    _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "[MEANING CRITERIA] PGMeaningCriteria %@ validation: \n%@", buf, 0x16u);
  }

  return v9;
}

- (BOOL)allCriteriaPassForAssets:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_allMeaningCriteriaArray;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "passesForAssets:", v4, (void)v12))
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)allCriteriaPassForMomentNode:(id)a3 momentNodeCache:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = self->_allMeaningCriteriaArray;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "passesForMomentNode:momentNodeCache:", v6, v7, (void)v15))
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (NSString)meaningLabel
{
  v2 = [(PGMeaningCriteriaEvaluator *)self meaningCriteriaInfo];
  v3 = [v2 meaningLabel];

  return (NSString *)v3;
}

- (PGMeaningCriteriaEvaluator)initWithDictionary:(id)a3 meaningCriteriaInfo:(id)a4 serviceManager:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v33 = a5;
  v39.receiver = self;
  v39.super_class = (Class)PGMeaningCriteriaEvaluator;
  uint64_t v10 = [(PGMeaningCriteriaEvaluator *)&v39 init];
  uint64_t v11 = v10;
  if (v10)
  {
    id v31 = v9;
    objc_storeStrong((id *)&v10->_meaningCriteriaInfo, a4);
    long long v12 = [MEMORY[0x1E4F1CA48] array];
    v32 = v11;
    [(id)objc_opt_class() _allMeaningCriteriaClassArray];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (!v13) {
      goto LABEL_19;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v36;
    while (1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(obj);
        }
        long long v17 = *(void **)(*((void *)&v35 + 1) + 8 * v16);
        long long v18 = objc_msgSend(v17, "criteriaKey", v31);
        __int16 v19 = [v8 objectForKeyedSubscript:v18];
        if (v19)
        {
          uint64_t v20 = [v17 criteriaWithDictionary:v19];
          [(NSArray *)v12 addObject:v20];
          v21 = +[PGMeaningSceneCriteria criteriaKey];
          int v22 = [v18 isEqualToString:v21];

          if (v22)
          {
            p_meaningSceneCriteria = (id *)&v32->_meaningSceneCriteria;
            goto LABEL_12;
          }
          v24 = +[PGMeaningActionCriteria criteriaKey];
          int v25 = [v18 isEqualToString:v24];

          if (v25)
          {
            p_meaningSceneCriteria = (id *)&v32->_meaningActionCriteria;
LABEL_12:
            objc_storeStrong(p_meaningSceneCriteria, v20);
          }
          else
          {
            v26 = +[PGMeaningDurationCriteria criteriaKey];
            int v27 = [v18 isEqualToString:v26];

            if (v27) {
              [v20 setServiceManager:v33];
            }
          }
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      uint64_t v14 = v28;
      if (!v28)
      {
LABEL_19:
        uint64_t v11 = v32;
        allMeaningCriteriaArray = v32->_allMeaningCriteriaArray;
        v32->_allMeaningCriteriaArray = v12;

        id v9 = v31;
        break;
      }
    }
  }

  return v11;
}

+ (id)_allMeaningCriteriaClassArray
{
  v4[11] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v4[10] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:11];
  return v2;
}

+ (id)meaningCriteriaEvaluatorsForMeaningLabel:(id)a3 withDictionary:(id)a4 serviceManager:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v7 = a4;
  id v26 = a5;
  id v8 = [v7 objectForKeyedSubscript:@"version"];
  [v8 doubleValue];
  double v10 = v9;

  uint64_t v11 = [v7 objectForKeyedSubscript:@"criteria"];
  int v12 = [v11 count];
  uint64_t v13 = +[PGLogging sharedLogging];
  uint64_t v14 = [v13 loggingConnection];

  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v34 = v12;
    __int16 v35 = 2112;
    id v36 = v27;
    _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, "[MEANING CRITERIA] Creating %d criteria evaluators for meaning \"%@\"", buf, 0x12u);
  }

  uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v11;
  uint64_t v16 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    uint64_t v19 = 1;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        int v22 = objc_alloc_init(PGMeaningCriteriaInfo);
        [(PGMeaningCriteriaInfo *)v22 setMeaningLabel:v27];
        [(PGMeaningCriteriaInfo *)v22 setCriteriaNumber:v19 + i];
        [(PGMeaningCriteriaInfo *)v22 setVersion:v10];
        v23 = [[PGMeaningCriteriaEvaluator alloc] initWithDictionary:v21 meaningCriteriaInfo:v22 serviceManager:v26];
        [v15 addObject:v23];
      }
      v19 += i;
      uint64_t v17 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v17);
  }

  return v15;
}

@end
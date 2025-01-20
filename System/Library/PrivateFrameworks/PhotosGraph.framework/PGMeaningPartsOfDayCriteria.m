@interface PGMeaningPartsOfDayCriteria
+ (id)_partsOfDayAsNumbersFromStrings:(id)a3;
+ (id)_partsOfDayNumbersByString;
+ (id)criteriaKey;
+ (id)criteriaWithDictionary:(id)a3;
- (BOOL)_passesPartsOfDayWithMomentNodePartsOfDay:(unint64_t)a3 positivePartsOfDay:(id)a4 negativePartsOfDay:(id)a5;
- (BOOL)isValid;
- (BOOL)passesForAssets:(id)a3;
- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4;
- (NSArray)negativePartsOfDay;
- (NSArray)negativePartsOfDayStrings;
- (NSArray)negativeSignificantPartsOfDay;
- (NSArray)negativeSignificantPartsOfDayStrings;
- (NSArray)positivePartsOfDay;
- (NSArray)positivePartsOfDayStrings;
- (NSArray)positiveSignificantPartsOfDay;
- (NSArray)positiveSignificantPartsOfDayStrings;
- (NSString)description;
- (void)setNegativePartsOfDay:(id)a3;
- (void)setNegativePartsOfDayStrings:(id)a3;
- (void)setNegativeSignificantPartsOfDay:(id)a3;
- (void)setNegativeSignificantPartsOfDayStrings:(id)a3;
- (void)setPositivePartsOfDay:(id)a3;
- (void)setPositivePartsOfDayStrings:(id)a3;
- (void)setPositiveSignificantPartsOfDay:(id)a3;
- (void)setPositiveSignificantPartsOfDayStrings:(id)a3;
@end

@implementation PGMeaningPartsOfDayCriteria

+ (id)_partsOfDayNumbersByString
{
  return &unk_1F28D5A18;
}

+ (id)_partsOfDayAsNumbersFromStrings:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [a1 _partsOfDayNumbersByString];
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(v5, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
          if (v12) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

+ (id)criteriaWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  v6 = [v4 objectForKeyedSubscript:@"positiveSignificantPartsOfDay"];
  [v5 setPositiveSignificantPartsOfDayStrings:v6];
  id v7 = [a1 _partsOfDayAsNumbersFromStrings:v6];
  [v5 setPositiveSignificantPartsOfDay:v7];

  uint64_t v8 = [v4 objectForKeyedSubscript:@"negativeSignificantPartsOfDay"];
  [v5 setNegativeSignificantPartsOfDayStrings:v8];
  uint64_t v9 = [a1 _partsOfDayAsNumbersFromStrings:v8];
  [v5 setNegativeSignificantPartsOfDay:v9];

  uint64_t v10 = [v4 objectForKeyedSubscript:@"positivePartsOfDay"];
  [v5 setPositivePartsOfDayStrings:v10];
  v11 = [a1 _partsOfDayAsNumbersFromStrings:v10];
  [v5 setPositivePartsOfDay:v11];

  v12 = [v4 objectForKeyedSubscript:@"negativePartsOfDay"];

  [v5 setNegativePartsOfDayStrings:v12];
  v13 = [a1 _partsOfDayAsNumbersFromStrings:v12];
  [v5 setNegativePartsOfDay:v13];

  return v5;
}

+ (id)criteriaKey
{
  return @"PartsOfDay";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativePartsOfDayStrings, 0);
  objc_storeStrong((id *)&self->_negativePartsOfDay, 0);
  objc_storeStrong((id *)&self->_positivePartsOfDayStrings, 0);
  objc_storeStrong((id *)&self->_positivePartsOfDay, 0);
  objc_storeStrong((id *)&self->_negativeSignificantPartsOfDayStrings, 0);
  objc_storeStrong((id *)&self->_negativeSignificantPartsOfDay, 0);
  objc_storeStrong((id *)&self->_positiveSignificantPartsOfDayStrings, 0);
  objc_storeStrong((id *)&self->_positiveSignificantPartsOfDay, 0);
}

- (void)setNegativePartsOfDayStrings:(id)a3
{
}

- (NSArray)negativePartsOfDayStrings
{
  return self->_negativePartsOfDayStrings;
}

- (void)setNegativePartsOfDay:(id)a3
{
}

- (NSArray)negativePartsOfDay
{
  return self->_negativePartsOfDay;
}

- (void)setPositivePartsOfDayStrings:(id)a3
{
}

- (NSArray)positivePartsOfDayStrings
{
  return self->_positivePartsOfDayStrings;
}

- (void)setPositivePartsOfDay:(id)a3
{
}

- (NSArray)positivePartsOfDay
{
  return self->_positivePartsOfDay;
}

- (void)setNegativeSignificantPartsOfDayStrings:(id)a3
{
}

- (NSArray)negativeSignificantPartsOfDayStrings
{
  return self->_negativeSignificantPartsOfDayStrings;
}

- (void)setNegativeSignificantPartsOfDay:(id)a3
{
}

- (NSArray)negativeSignificantPartsOfDay
{
  return self->_negativeSignificantPartsOfDay;
}

- (void)setPositiveSignificantPartsOfDayStrings:(id)a3
{
}

- (NSArray)positiveSignificantPartsOfDayStrings
{
  return self->_positiveSignificantPartsOfDayStrings;
}

- (void)setPositiveSignificantPartsOfDay:(id)a3
{
}

- (NSArray)positiveSignificantPartsOfDay
{
  return self->_positiveSignificantPartsOfDay;
}

- (BOOL)_passesPartsOfDayWithMomentNodePartsOfDay:(unint64_t)a3 positivePartsOfDay:(id)a4 negativePartsOfDay:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if ([v7 count] || objc_msgSend(v8, "count"))
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
LABEL_5:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        if (([*(id *)(*((void *)&v24 + 1) + 8 * v13) unsignedIntegerValue] & a3) != 0) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
          if (v11) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = v8;
      uint64_t v15 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (!v15)
      {
        BOOL v14 = 1;
        goto LABEL_22;
      }
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
LABEL_14:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v9);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v18), "unsignedIntegerValue", (void)v20) & a3) != 0) {
          break;
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
          BOOL v14 = 1;
          if (v16) {
            goto LABEL_14;
          }
          goto LABEL_22;
        }
      }
    }
LABEL_11:
    BOOL v14 = 0;
LABEL_22:
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = [(PGMeaningPartsOfDayCriteria *)self positiveSignificantPartsOfDayStrings];
  id v5 = [v4 componentsJoinedByString:@", "];

  v6 = [(PGMeaningPartsOfDayCriteria *)self negativeSignificantPartsOfDayStrings];
  id v7 = [v6 componentsJoinedByString:@", "];

  [v3 appendFormat:@"positiveSignificantPartsOfDay: %@\n", v5];
  [v3 appendFormat:@"negativeSignificantPartsOfDay: %@\n", v7];
  id v8 = [(PGMeaningPartsOfDayCriteria *)self positivePartsOfDayStrings];
  id v9 = [v8 componentsJoinedByString:@", "];

  uint64_t v10 = [(PGMeaningPartsOfDayCriteria *)self negativePartsOfDayStrings];
  uint64_t v11 = [v10 componentsJoinedByString:@", "];

  [v3 appendFormat:@"positivePartsOfDay: %@\n", v9];
  [v3 appendFormat:@"negativePartsOfDay: %@\n", v11];

  return (NSString *)v3;
}

- (BOOL)isValid
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v3 = [(id)objc_opt_class() _partsOfDayNumbersByString];
  id v4 = [(PGMeaningPartsOfDayCriteria *)self positiveSignificantPartsOfDayStrings];
  uint64_t v30 = self;
  id v5 = [(PGMeaningPartsOfDayCriteria *)self negativeSignificantPartsOfDayStrings];
  v6 = [v4 arrayByAddingObjectsFromArray:v5];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v36;
    char v11 = 1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        BOOL v14 = [v3 objectForKeyedSubscript:v13];

        if (!v14)
        {
          uint64_t v15 = +[PGLogging sharedLogging];
          uint64_t v16 = [v15 loggingConnection];

          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v41 = v13;
            _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "[MEANING CRITERIA] Invalid significant part of day \"%@\"", buf, 0xCu);
          }

          char v11 = 0;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v9);
  }
  else
  {
    char v11 = 1;
  }

  uint64_t v17 = [(PGMeaningPartsOfDayCriteria *)v30 positivePartsOfDayStrings];
  uint64_t v18 = [(PGMeaningPartsOfDayCriteria *)v30 negativePartsOfDayStrings];
  uint64_t v19 = [v17 arrayByAddingObjectsFromArray:v18];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v20 = v19;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v31 + 1) + 8 * j);
        long long v26 = [v3 objectForKeyedSubscript:v25];

        if (!v26)
        {
          long long v27 = +[PGLogging sharedLogging];
          v28 = [v27 loggingConnection];

          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v41 = v25;
            _os_log_impl(&dword_1D1805000, v28, OS_LOG_TYPE_INFO, "[MEANING CRITERIA] Invalid part of day \"%@\"", buf, 0xCu);
          }

          char v11 = 0;
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v22);
  }

  return v11 & 1;
}

- (BOOL)passesForAssets:(id)a3
{
  return 1;
}

- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 significantPartsOfDay];
  id v7 = [(PGMeaningPartsOfDayCriteria *)self positiveSignificantPartsOfDay];
  uint64_t v8 = [(PGMeaningPartsOfDayCriteria *)self negativeSignificantPartsOfDay];
  LODWORD(v6) = [(PGMeaningPartsOfDayCriteria *)self _passesPartsOfDayWithMomentNodePartsOfDay:v6 positivePartsOfDay:v7 negativePartsOfDay:v8];

  if (v6)
  {
    uint64_t v9 = [v5 partsOfDay];
    uint64_t v10 = [(PGMeaningPartsOfDayCriteria *)self positivePartsOfDay];
    char v11 = [(PGMeaningPartsOfDayCriteria *)self negativePartsOfDay];
    BOOL v12 = [(PGMeaningPartsOfDayCriteria *)self _passesPartsOfDayWithMomentNodePartsOfDay:v9 positivePartsOfDay:v10 negativePartsOfDay:v11];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

@end
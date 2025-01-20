@interface PGMeaningROICriteria
+ (id)criteriaKey;
+ (id)criteriaWithDictionary:(id)a3;
- (BOOL)isValid;
- (BOOL)passesForAssets:(id)a3;
- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4;
- (NSArray)negativeROIs;
- (NSArray)positiveROIs;
- (NSString)description;
- (unint64_t)minimumNumberOfROIs;
- (void)setMinimumNumberOfROIs:(unint64_t)a3;
- (void)setNegativeROIs:(id)a3;
- (void)setPositiveROIs:(id)a3;
@end

@implementation PGMeaningROICriteria

+ (id)criteriaWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  uint64_t v6 = [v4 objectForKeyedSubscript:@"positiveROIs"];
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6) {
    v9 = (void *)v6;
  }
  else {
    v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v10 = v9;

  [v5 setPositiveROIs:v10];
  v11 = [v4 objectForKeyedSubscript:@"minimumNumberOfROIs"];
  unint64_t v12 = [v11 unsignedIntegerValue];

  if (v12 <= 1) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v12;
  }
  [v5 setMinimumNumberOfROIs:v13];
  v14 = [v4 objectForKeyedSubscript:@"negativeROIs"];

  if (v14) {
    v15 = v14;
  }
  else {
    v15 = v8;
  }
  id v16 = v15;

  [v5 setNegativeROIs:v16];
  return v5;
}

+ (id)criteriaKey
{
  return @"ROI";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeROIs, 0);
  objc_storeStrong((id *)&self->_positiveROIs, 0);
}

- (void)setMinimumNumberOfROIs:(unint64_t)a3
{
  self->_minimumNumberOfROIs = a3;
}

- (unint64_t)minimumNumberOfROIs
{
  return self->_minimumNumberOfROIs;
}

- (void)setNegativeROIs:(id)a3
{
}

- (NSArray)negativeROIs
{
  return self->_negativeROIs;
}

- (void)setPositiveROIs:(id)a3
{
}

- (NSArray)positiveROIs
{
  return self->_positiveROIs;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = [(PGMeaningROICriteria *)self positiveROIs];
  id v5 = [v4 componentsJoinedByString:@", "];

  uint64_t v6 = [(PGMeaningROICriteria *)self negativeROIs];
  v7 = [v6 componentsJoinedByString:@", "];

  [v3 appendFormat:@"\t\tpositiveROIs: %@\n", v5];
  [v3 appendFormat:@"\t\tnegativeROIs: %@\n", v7];
  objc_msgSend(v3, "appendFormat:", @"\t\tminimumNumberOfROIs: %d\n", -[PGMeaningROICriteria minimumNumberOfROIs](self, "minimumNumberOfROIs"));

  return (NSString *)v3;
}

- (BOOL)isValid
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(PGMeaningROICriteria *)self positiveROIs];
  id v4 = [(PGMeaningROICriteria *)self negativeROIs];
  id v5 = [v3 arrayByAddingObjectsFromArray:v4];

  uint64_t v6 = +[PGGraphROINode validROILabels];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v20;
    char v12 = 1;
    *(void *)&long long v9 = 138412290;
    long long v18 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v14, v18, (void)v19) & 1) == 0)
        {
          v15 = +[PGLogging sharedLogging];
          id v16 = [v15 loggingConnection];

          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v18;
            uint64_t v24 = v14;
            _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "[MEANING CRITERIA] Invalid roi \"%@\"", buf, 0xCu);
          }

          char v12 = 0;
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
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
  uint64_t v8 = [(PGMeaningROICriteria *)self positiveROIs];
  uint64_t v9 = [v8 count];

  uint64_t v10 = [(PGMeaningROICriteria *)self negativeROIs];
  uint64_t v11 = [v10 count];

  if (v9 | v11)
  {
    uint64_t v17 = 0;
    long long v18 = &v17;
    uint64_t v19 = 0x2020000000;
    BOOL v20 = v9 == 0;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = 0;
    uint64_t v13 = [v7 roiNodes];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__PGMeaningROICriteria_passesForMomentNode_momentNodeCache___block_invoke;
    v15[3] = &unk_1E68EC858;
    v15[4] = self;
    v15[5] = &v17;
    v15[6] = v16;
    v15[7] = v11;
    [v13 enumerateObjectsUsingBlock:v15];
    BOOL v12 = *((unsigned char *)v18 + 24) != 0;

    _Block_object_dispose(v16, 8);
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

void __60__PGMeaningROICriteria_passesForMomentNode_momentNodeCache___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = [a2 label];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v5 = [*(id *)(a1 + 32) positiveROIs];
    int v6 = [v5 containsObject:v10];

    if (v6)
    {
      unint64_t v7 = ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      if (v7 >= [*(id *)(a1 + 32) minimumNumberOfROIs]) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }
  }
  if (*(void *)(a1 + 56))
  {
    uint64_t v8 = [*(id *)(a1 + 32) negativeROIs];
    int v9 = [v8 containsObject:v10];

    if (v9)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *a3 = 1;
    }
  }
}

@end
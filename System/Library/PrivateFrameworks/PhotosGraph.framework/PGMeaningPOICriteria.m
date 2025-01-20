@interface PGMeaningPOICriteria
+ (id)criteriaKey;
+ (id)criteriaWithDictionary:(id)a3;
- (BOOL)_parkIsLargerThanMaximumDiameterWithAreaNodes:(id)a3;
- (BOOL)isValid;
- (BOOL)mustBeSpecial;
- (BOOL)passesForAssets:(id)a3;
- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4;
- (NSArray)negativePOIs;
- (NSArray)positivePOIs;
- (NSString)description;
- (double)maximumParkDiameter;
- (unint64_t)minimumNumberOfPOIs;
- (void)setMaximumParkDiameter:(double)a3;
- (void)setMinimumNumberOfPOIs:(unint64_t)a3;
- (void)setMustBeSpecial:(BOOL)a3;
- (void)setNegativePOIs:(id)a3;
- (void)setPositivePOIs:(id)a3;
@end

@implementation PGMeaningPOICriteria

+ (id)criteriaWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  uint64_t v6 = [v4 objectForKeyedSubscript:@"positivePOIs"];
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6) {
    v9 = (void *)v6;
  }
  else {
    v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v10 = v9;

  [v5 setPositivePOIs:v10];
  v11 = [v4 objectForKeyedSubscript:@"minimumNumberOfPOIs"];
  unint64_t v12 = [v11 unsignedIntegerValue];

  if (v12 <= 1) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v12;
  }
  [v5 setMinimumNumberOfPOIs:v13];
  v14 = [v4 objectForKeyedSubscript:@"mustBeSpecial"];
  objc_msgSend(v5, "setMustBeSpecial:", objc_msgSend(v14, "BOOLValue"));

  uint64_t v15 = [v4 objectForKeyedSubscript:@"negativePOIs"];
  v16 = (void *)v15;
  if (v15) {
    v17 = (void *)v15;
  }
  else {
    v17 = v8;
  }
  id v18 = v17;

  [v5 setNegativePOIs:v18];
  v19 = [v4 objectForKeyedSubscript:@"maximumParkDiameter"];

  [v19 doubleValue];
  objc_msgSend(v5, "setMaximumParkDiameter:");

  return v5;
}

+ (id)criteriaKey
{
  return @"POI";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativePOIs, 0);
  objc_storeStrong((id *)&self->_positivePOIs, 0);
}

- (void)setMaximumParkDiameter:(double)a3
{
  self->_maximumParkDiameter = a3;
}

- (double)maximumParkDiameter
{
  return self->_maximumParkDiameter;
}

- (void)setMustBeSpecial:(BOOL)a3
{
  self->_mustBeSpecial = a3;
}

- (BOOL)mustBeSpecial
{
  return self->_mustBeSpecial;
}

- (void)setMinimumNumberOfPOIs:(unint64_t)a3
{
  self->_minimumNumberOfPOIs = a3;
}

- (unint64_t)minimumNumberOfPOIs
{
  return self->_minimumNumberOfPOIs;
}

- (void)setNegativePOIs:(id)a3
{
}

- (NSArray)negativePOIs
{
  return self->_negativePOIs;
}

- (void)setPositivePOIs:(id)a3
{
}

- (NSArray)positivePOIs
{
  return self->_positivePOIs;
}

- (BOOL)_parkIsLargerThanMaximumDiameterWithAreaNodes:(id)a3
{
  id v4 = a3;
  [(PGMeaningPOICriteria *)self maximumParkDiameter];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PGMeaningPOICriteria__parkIsLargerThanMaximumDiameterWithAreaNodes___block_invoke;
  v7[3] = &unk_1E68E4F40;
  v7[4] = &v8;
  v7[5] = v5;
  [v4 enumerateObjectsUsingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

uint64_t __70__PGMeaningPOICriteria__parkIsLargerThanMaximumDiameterWithAreaNodes___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 diameterIsLargerThanDiameter:*(double *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = [(PGMeaningPOICriteria *)self positivePOIs];
  uint64_t v5 = [v4 componentsJoinedByString:@", "];

  uint64_t v6 = [(PGMeaningPOICriteria *)self negativePOIs];
  v7 = [v6 componentsJoinedByString:@", "];

  [v3 appendFormat:@"positivePOIs: %@\n", v5];
  [v3 appendFormat:@"negativePOIs: %@\n", v7];
  objc_msgSend(v3, "appendFormat:", @"minimumNumberOfPOIs: %d\n", -[PGMeaningPOICriteria minimumNumberOfPOIs](self, "minimumNumberOfPOIs"));
  objc_msgSend(v3, "appendFormat:", @"minimumNumberOfPOIs: %d\n", -[PGMeaningPOICriteria minimumNumberOfPOIs](self, "minimumNumberOfPOIs"));
  BOOL v8 = [(PGMeaningPOICriteria *)self mustBeSpecial];
  v9 = @"NO";
  if (v8) {
    v9 = @"YES";
  }
  [v3 appendFormat:@"mustBeSpecial: %@\n", v9];
  [(PGMeaningPOICriteria *)self maximumParkDiameter];
  objc_msgSend(v3, "appendFormat:", @"maximumParkDiameter: %d\n", (int)v10);

  return (NSString *)v3;
}

- (BOOL)isValid
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(PGMeaningPOICriteria *)self positivePOIs];
  id v4 = [(PGMeaningPOICriteria *)self negativePOIs];
  uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];

  uint64_t v6 = +[PGGraphPOINode validPOILabels];
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
          uint64_t v15 = +[PGLogging sharedLogging];
          v16 = [v15 loggingConnection];

          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v18;
            uint64_t v24 = v14;
            _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "[MEANING CRITERIA] Invalid poi \"%@\"", buf, 0xCu);
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
  uint64_t v8 = [(PGMeaningPOICriteria *)self positivePOIs];
  uint64_t v9 = [v8 count];

  uint64_t v10 = [(PGMeaningPOICriteria *)self negativePOIs];
  uint64_t v11 = [v10 count];

  if (v9 | v11)
  {
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000;
    BOOL v26 = v9 == 0;
    if ([(PGMeaningPOICriteria *)self mustBeSpecial]) {
      [v7 specialPOINodes];
    }
    else {
    uint64_t v13 = [v7 poiNodes];
    }
    uint64_t v14 = [v7 preciseAreaNodes];
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v22[3] = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__PGMeaningPOICriteria_passesForMomentNode_momentNodeCache___block_invoke;
    v17[3] = &unk_1E68E4F18;
    long long v19 = &v23;
    v17[4] = self;
    id v15 = v14;
    id v18 = v15;
    long long v20 = v22;
    uint64_t v21 = v11;
    [v13 enumerateObjectsUsingBlock:v17];
    BOOL v12 = *((unsigned char *)v24 + 24) != 0;

    _Block_object_dispose(v22, 8);
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

void __60__PGMeaningPOICriteria_passesForMomentNode_momentNodeCache___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 label];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || (uint64_t v13 = v5,
        [*(id *)(a1 + 32) positivePOIs],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 containsObject:v13],
        v6,
        uint64_t v5 = v13,
        !v7))
  {
    if (*(void *)(a1 + 64))
    {
      uint64_t v14 = v5;
      uint64_t v11 = [*(id *)(a1 + 32) negativePOIs];
      int v12 = [v11 containsObject:v14];

      uint64_t v5 = v14;
      if (v12)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        *a3 = 1;
      }
    }
  }
  else if (![v13 isEqualToString:@"Park"] {
         || (char v8 = [*(id *)(a1 + 32) _parkIsLargerThanMaximumDiameterWithAreaNodes:*(void *)(a1 + 40)],
  }
             uint64_t v5 = v13,
             (v8 & 1) == 0))
  {
    unint64_t v9 = ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    unint64_t v10 = [*(id *)(a1 + 32) minimumNumberOfPOIs];
    uint64_t v5 = v13;
    if (v9 >= v10) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
}

@end
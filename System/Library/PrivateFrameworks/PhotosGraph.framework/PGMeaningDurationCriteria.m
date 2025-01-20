@interface PGMeaningDurationCriteria
+ (id)criteriaKey;
+ (id)criteriaWithDictionary:(id)a3;
- (BOOL)includeRoutineVisitsInDuration;
- (BOOL)isValid;
- (BOOL)passesForAssets:(id)a3;
- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4;
- (NSString)description;
- (unint64_t)minimumDuration;
- (void)setIncludeRoutineVisitsInDuration:(BOOL)a3;
- (void)setMinimumDuration:(unint64_t)a3;
- (void)setServiceManager:(id)a3;
@end

@implementation PGMeaningDurationCriteria

+ (id)criteriaWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  v6 = [v4 objectForKeyedSubscript:@"minimumDuration"];
  objc_msgSend(v5, "setMinimumDuration:", objc_msgSend(v6, "unsignedIntegerValue"));

  v7 = [v4 objectForKeyedSubscript:@"includeRoutineVisitsInDuration"];

  objc_msgSend(v5, "setIncludeRoutineVisitsInDuration:", objc_msgSend(v7, "BOOLValue"));
  return v5;
}

+ (id)criteriaKey
{
  return @"Duration";
}

- (void).cxx_destruct
{
}

- (void)setIncludeRoutineVisitsInDuration:(BOOL)a3
{
  self->_includeRoutineVisitsInDuration = a3;
}

- (BOOL)includeRoutineVisitsInDuration
{
  return self->_includeRoutineVisitsInDuration;
}

- (void)setMinimumDuration:(unint64_t)a3
{
  self->_minimumDuration = a3;
}

- (unint64_t)minimumDuration
{
  return self->_minimumDuration;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  objc_msgSend(v3, "appendFormat:", @"minimumDuration: %d\n", -[PGMeaningDurationCriteria minimumDuration](self, "minimumDuration"));
  BOOL v4 = [(PGMeaningDurationCriteria *)self includeRoutineVisitsInDuration];
  id v5 = @"NO";
  if (v4) {
    id v5 = @"YES";
  }
  [v3 appendFormat:@"includeRoutineVisitsInDuration: %@\n", v5];
  return (NSString *)v3;
}

- (void)setServiceManager:(id)a3
{
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)passesForAssets:(id)a3
{
  return 1;
}

- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PGMeaningDurationCriteria *)self minimumDuration])
  {
    if ([(PGMeaningDurationCriteria *)self includeRoutineVisitsInDuration])
    {
      v8 = [v6 universalStartDate];
      v9 = [v6 universalEndDate];
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v9];
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x3032000000;
      v36 = __Block_byref_object_copy__13104;
      v37 = __Block_byref_object_dispose__13105;
      id v11 = v8;
      id v38 = v11;
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x3032000000;
      v30 = __Block_byref_object_copy__13104;
      v31 = __Block_byref_object_dispose__13105;
      id v12 = v9;
      id v32 = v12;
      v13 = [v7 preciseAddressNodes];
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __65__PGMeaningDurationCriteria_passesForMomentNode_momentNodeCache___block_invoke;
      v22 = &unk_1E68E5F88;
      v23 = self;
      id v14 = v10;
      id v24 = v14;
      v25 = &v33;
      v26 = &v27;
      [v13 enumerateObjectsUsingBlock:&v19];
      objc_msgSend((id)v28[5], "timeIntervalSinceDate:", v34[5], v19, v20, v21, v22, v23);
      BOOL v16 = v15 >= (double)[(PGMeaningDurationCriteria *)self minimumDuration];

      _Block_object_dispose(&v27, 8);
      _Block_object_dispose(&v33, 8);
    }
    else
    {
      id v11 = [v6 universalEndDate];
      id v12 = [v6 universalStartDate];
      [v11 timeIntervalSinceDate:v12];
      BOOL v16 = v17 >= (double)[(PGMeaningDurationCriteria *)self minimumDuration];
    }
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

void __65__PGMeaningDurationCriteria_passesForMomentNode_momentNodeCache___block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [a2 location];
  if (v3)
  {
    BOOL v4 = [*(id *)(a1[4] + 8) fetchLocationOfInterestVisitsAtLocation:v3 inDateInterval:a1[5]];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = [*(id *)(*((void *)&v18 + 1) + 8 * v8) visitInterval];
          v10 = [v9 startDate];
          id v11 = [v9 endDate];
          uint64_t v12 = [*(id *)(*(void *)(a1[6] + 8) + 40) earlierDate:v10];
          uint64_t v13 = *(void *)(a1[6] + 8);
          id v14 = *(void **)(v13 + 40);
          *(void *)(v13 + 40) = v12;

          uint64_t v15 = [*(id *)(*(void *)(a1[7] + 8) + 40) laterDate:v11];
          uint64_t v16 = *(void *)(a1[7] + 8);
          double v17 = *(void **)(v16 + 40);
          *(void *)(v16 + 40) = v15;

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
    }
  }
}

@end
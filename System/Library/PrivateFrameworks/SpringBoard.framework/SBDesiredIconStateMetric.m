@interface SBDesiredIconStateMetric
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
- (SBDesiredIconStateMetric)init;
@end

@implementation SBDesiredIconStateMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3 == 35)
  {
    v6 = [a4 eventPayload];
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA7560]];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v7);
          }
          unsigned int v14 = [*(id *)(*((void *)&v22 + 1) + 8 * i) hasPrefix:@"com.apple."];
          v10 += v14;
          v11 += v14 ^ 1;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v9);
      BOOL v15 = v10 != 0;
      BOOL v16 = v11 != 0;
    }
    else
    {
      BOOL v15 = 0;
      BOOL v16 = 0;
    }
    loadEventTracker = self->_loadEventTracker;
    v18 = [NSNumber numberWithInt:v15];
    v26[0] = v18;
    v19 = [NSNumber numberWithInt:v16];
    v26[1] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    [(PETScalarEventTracker *)loadEventTracker trackEventWithPropertyValues:v20];
  }
  return a3 == 35;
}

- (SBDesiredIconStateMetric)init
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)SBDesiredIconStateMetric;
  v2 = [(SBDesiredIconStateMetric *)&v16 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F93720];
    uint64_t v4 = MEMORY[0x1E4F1CC38];
    uint64_t v5 = MEMORY[0x1E4F1CC28];
    v20[0] = MEMORY[0x1E4F1CC38];
    v20[1] = MEMORY[0x1E4F1CC28];
    v21[0] = @"Y";
    v21[1] = @"N";
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    v7 = [v3 propertyWithName:@"HasAppleApps" enumMapping:v6];

    uint64_t v8 = (void *)MEMORY[0x1E4F93720];
    v18[0] = v4;
    v18[1] = v5;
    v19[0] = @"Y";
    v19[1] = @"N";
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    uint64_t v10 = [v8 propertyWithName:@"HasNonAppleApps" enumMapping:v9];

    id v11 = objc_alloc(MEMORY[0x1E4F93738]);
    v17[0] = v7;
    v17[1] = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    uint64_t v13 = [v11 initWithFeatureId:@"SpringBoard" event:@"IconModelWithDesiredIconStateLoaded" registerProperties:v12];
    loadEventTracker = v2->_loadEventTracker;
    v2->_loadEventTracker = (PETScalarEventTracker *)v13;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end
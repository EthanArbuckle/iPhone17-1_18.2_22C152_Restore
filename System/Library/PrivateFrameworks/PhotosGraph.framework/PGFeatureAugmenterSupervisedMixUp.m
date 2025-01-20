@interface PGFeatureAugmenterSupervisedMixUp
+ (id)name;
- (id)labeledFloatVectorsWithLabeledFloatVectors:(id)a3 error:(id *)a4;
@end

@implementation PGFeatureAugmenterSupervisedMixUp

+ (id)name
{
  return @"SupervisedMixUp";
}

- (id)labeledFloatVectorsWithLabeledFloatVectors:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  if ([v32 count])
  {
    v29 = self;
    v30 = a4;
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v32, "count"));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v6 = v32;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v39 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          id v11 = objc_alloc(MEMORY[0x1E4F71EF8]);
          v12 = [v10 floatVector];
          v13 = [v12 data];
          v14 = (void *)[v11 initWithData:v13];

          v15 = [v10 label];
          [v14 appendVector:v15];

          [v33 addObject:v14];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v7);
    }

    v31 = [(PGFeatureAugmenterMixUp *)self floatVectorsWithFloatVectors:v33 error:v30];
    v16 = [v6 objectAtIndexedSubscript:0];
    v17 = [v16 floatVector];
    uint64_t v18 = [v17 count];

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v31, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v20 = v31;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v35 != v22) {
            objc_enumerationMutation(v20);
          }
          v24 = *(void **)(*((void *)&v34 + 1) + 8 * j);
          v25 = objc_msgSend(v24, "sliceFromStart:toEnd:", 0, v18, v29);
          v26 = objc_msgSend(v24, "sliceFromStart:toEnd:", v18, objc_msgSend(v24, "count"));
          v27 = [[PGLabeledFloatVector alloc] initWithFloatVector:v25 label:v26];
          [v19 addObject:v27];
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v21);
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

@end
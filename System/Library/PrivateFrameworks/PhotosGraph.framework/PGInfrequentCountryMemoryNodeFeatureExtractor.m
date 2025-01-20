@interface PGInfrequentCountryMemoryNodeFeatureExtractor
+ (id)_labelsForVersion:(int64_t)a3;
+ (id)inferredUserLanguageCodesFromGraph:(id)a3;
- (PGInfrequentCountryMemoryNodeFeatureExtractor)initWithError:(id *)a3;
- (PGInfrequentCountryMemoryNodeFeatureExtractor)initWithFrequentCountryLabels:(id)a3 version:(int64_t)a4 graph:(id)a5 error:(id *)a6;
- (PGInfrequentCountryMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 graph:(id)a4 error:(id *)a5;
@end

@implementation PGInfrequentCountryMemoryNodeFeatureExtractor

- (PGInfrequentCountryMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 graph:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (v8)
  {
    v9 = +[PGGraphNodeCollection nodesInGraph:v8];
    v10 = [v9 addressNodes];
    v11 = [v10 countryNodes];
    v12 = [v11 names];

    if ([v12 count]) {
      id v13 = v12;
    }
    else {
      id v13 = (id)MEMORY[0x1E4F1CBF0];
    }
    v14 = +[PGInfrequentCountryFeatureExtractor inferredUserLanguageCodesFromGraph:v8];
    if ([v14 count])
    {
      uint64_t v15 = [v13 arrayByAddingObjectsFromArray:v14];

      id v13 = (id)v15;
    }
  }
  else
  {
    id v13 = (id)MEMORY[0x1E4F1CBF0];
  }
  v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v13];
  v17 = [(PGInfrequentCountryMemoryNodeFeatureExtractor *)self initWithFrequentCountryLabels:v16 version:a3 graph:v8 error:a5];

  return v17;
}

- (PGInfrequentCountryMemoryNodeFeatureExtractor)initWithFrequentCountryLabels:(id)a3 version:(int64_t)a4 graph:(id)a5 error:(id *)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [(id)objc_opt_class() _labelsForVersion:a4];
  v10 = (void *)MEMORY[0x1E4F71F18];
  v11 = +[PGGraphLocationCountryNode filter];
  v12 = [v11 relation];
  v21[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  v14 = [v10 chain:v13];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __99__PGInfrequentCountryMemoryNodeFeatureExtractor_initWithFrequentCountryLabels_version_graph_error___block_invoke;
  v19[3] = &unk_1E68E5CA0;
  id v20 = v8;
  v18.receiver = self;
  v18.super_class = (Class)PGInfrequentCountryMemoryNodeFeatureExtractor;
  id v15 = v8;
  v16 = [(PGGraphMemoryNodeFeatureExtractor *)&v18 initWithName:@"Country" featureNames:v9 relation:v14 labelForTargetBlock:v19];

  return v16;
}

id __99__PGInfrequentCountryMemoryNodeFeatureExtractor_initWithFrequentCountryLabels_version_graph_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = [v3 name];
  if ([v4 containsObject:v5])
  {
    v6 = [v3 name];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PGInfrequentCountryMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  return [(PGInfrequentCountryMemoryNodeFeatureExtractor *)self initWithVersion:1 graph:0 error:a3];
}

+ (id)_labelsForVersion:(int64_t)a3
{
  if (a3 == 1) {
    return &unk_1F28D3B28;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

+ (id)inferredUserLanguageCodesFromGraph:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = [v3 inferredUserLocales];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) languageCode];
        v11 = [v10 uppercaseString];
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

@end
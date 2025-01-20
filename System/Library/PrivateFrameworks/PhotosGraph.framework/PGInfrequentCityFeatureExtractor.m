@interface PGInfrequentCityFeatureExtractor
- (PGInfrequentCityFeatureExtractor)initWithError:(id *)a3;
- (PGInfrequentCityFeatureExtractor)initWithFrequentCityLabels:(id)a3 version:(int64_t)a4 graph:(id)a5 cityManager:(id)a6 error:(id *)a7;
- (PGInfrequentCityFeatureExtractor)initWithFrequentCityLabels:(id)a3 version:(int64_t)a4 graph:(id)a5 error:(id *)a6;
- (PGInfrequentCityFeatureExtractor)initWithVersion:(int64_t)a3 graph:(id)a4 error:(id *)a5;
- (id)labelsForVersion:(int64_t)a3;
@end

@implementation PGInfrequentCityFeatureExtractor

- (id)labelsForVersion:(int64_t)a3
{
  if (a3 == 1) {
    return &unk_1F28D4920;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (PGInfrequentCityFeatureExtractor)initWithVersion:(int64_t)a3 graph:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  v10 = [MEMORY[0x1E4F4BE38] sharedManager];
  if (v8)
  {
    v11 = +[PGGraphNodeCollection nodesInGraph:v8];
    v12 = [v11 addressNodes];
    v13 = [v12 cityNodes];

    if ([v13 count])
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __64__PGInfrequentCityFeatureExtractor_initWithVersion_graph_error___block_invoke;
      v22 = &unk_1E68EE6F8;
      id v23 = v10;
      id v15 = v14;
      id v24 = v15;
      [v13 enumerateNodesUsingBlock:&v19];
      id v16 = v15;

      id v9 = v16;
    }
  }
  v17 = -[PGInfrequentCityFeatureExtractor initWithFrequentCityLabels:version:graph:cityManager:error:](self, "initWithFrequentCityLabels:version:graph:cityManager:error:", v9, a3, v8, v10, a5, v19, v20, v21, v22);

  return v17;
}

void __64__PGInfrequentCityFeatureExtractor_initWithVersion_graph_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 collection];
  v5 = [v4 countryNodes];
  v6 = [v5 anyNode];
  id v9 = [v6 name];

  v7 = [v3 name];

  id v8 = +[PGCityFeatureExtractor unlocalizedCityNameFromCityName:v7 countryCode:v9 fromCityManager:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) addObject:v8];
}

- (PGInfrequentCityFeatureExtractor)initWithFrequentCityLabels:(id)a3 version:(int64_t)a4 graph:(id)a5 cityManager:(id)a6 error:(id *)a7
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  v12 = [(PGInfrequentCityFeatureExtractor *)self labelsForVersion:a4];
  v13 = (void *)MEMORY[0x1E4F71F18];
  id v14 = +[PGGraphMomentNode addressOfMoment];
  v26[0] = v14;
  id v15 = +[PGGraphAddressNode cityOfAddress];
  v26[1] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v17 = [v13 chain:v16];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __95__PGInfrequentCityFeatureExtractor_initWithFrequentCityLabels_version_graph_cityManager_error___block_invoke;
  v23[3] = &unk_1E68EE6D0;
  id v24 = v11;
  id v25 = v10;
  v22.receiver = self;
  v22.super_class = (Class)PGInfrequentCityFeatureExtractor;
  id v18 = v10;
  id v19 = v11;
  uint64_t v20 = [(MARelationCollectionFeatureExtractor *)&v22 initWithName:@"City" featureNames:v12 relation:v17 labelForTargetBlock:v23];

  return v20;
}

id __95__PGInfrequentCityFeatureExtractor_initWithFrequentCityLabels_version_graph_cityManager_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 collection];
  v5 = [v4 countryNodes];
  v6 = [v5 anyNode];
  v7 = [v6 name];

  id v8 = [v3 name];

  id v9 = +[PGCityFeatureExtractor unlocalizedCityNameFromCityName:v8 countryCode:v7 fromCityManager:*(void *)(a1 + 32)];

  if ([*(id *)(a1 + 40) containsObject:v9]) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  return v11;
}

- (PGInfrequentCityFeatureExtractor)initWithFrequentCityLabels:(id)a3 version:(int64_t)a4 graph:(id)a5 error:(id *)a6
{
  id v10 = (void *)MEMORY[0x1E4F4BE38];
  id v11 = a5;
  id v12 = a3;
  v13 = [v10 sharedManager];
  id v14 = [(PGInfrequentCityFeatureExtractor *)self initWithFrequentCityLabels:v12 version:a4 graph:v11 cityManager:v13 error:a6];

  return v14;
}

- (PGInfrequentCityFeatureExtractor)initWithError:(id *)a3
{
  return [(PGInfrequentCityFeatureExtractor *)self initWithVersion:1 graph:0 error:a3];
}

@end
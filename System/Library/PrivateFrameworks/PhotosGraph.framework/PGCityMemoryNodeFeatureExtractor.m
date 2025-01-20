@interface PGCityMemoryNodeFeatureExtractor
- (PGCityMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4;
- (id)labelsForVersion:(int64_t)a3;
@end

@implementation PGCityMemoryNodeFeatureExtractor

- (id)labelsForVersion:(int64_t)a3
{
  if (a3 == 1) {
    return &unk_1F28D4110;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (PGCityMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v6 = objc_msgSend(MEMORY[0x1E4F4BE38], "sharedManager", a3, a4);
  v7 = [(PGCityMemoryNodeFeatureExtractor *)self labelsForVersion:a3];
  v8 = (void *)MEMORY[0x1E4F71F18];
  v9 = +[PGGraphLocationCityNode filter];
  v10 = [v9 relation];
  v19[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v12 = [v8 chain:v11];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__PGCityMemoryNodeFeatureExtractor_initWithVersion_error___block_invoke;
  v17[3] = &unk_1E68E9D98;
  id v18 = v6;
  v16.receiver = self;
  v16.super_class = (Class)PGCityMemoryNodeFeatureExtractor;
  id v13 = v6;
  v14 = [(PGGraphMemoryNodeFeatureExtractor *)&v16 initWithName:@"City" featureNames:v7 relation:v12 labelForTargetBlock:v17];

  return v14;
}

id __58__PGCityMemoryNodeFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 collection];
  v5 = [v4 countryNodes];
  v6 = [v5 anyNode];
  v7 = [v6 name];

  v8 = [v3 name];

  v9 = +[PGCityFeatureExtractor unlocalizedCityNameFromCityName:v8 countryCode:v7 fromCityManager:*(void *)(a1 + 32)];

  return v9;
}

@end
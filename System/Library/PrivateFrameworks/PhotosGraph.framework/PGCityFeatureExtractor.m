@interface PGCityFeatureExtractor
+ (id)unlocalizedCityNameFromCityName:(id)a3 countryCode:(id)a4 fromCityManager:(id)a5;
- (PGCityFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4;
- (id)labelsForVersion:(int64_t)a3;
@end

@implementation PGCityFeatureExtractor

- (id)labelsForVersion:(int64_t)a3
{
  if (a3 == 1) {
    return &unk_1F28D40F8;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (PGCityFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v6 = objc_msgSend(MEMORY[0x1E4F4BE38], "sharedManager", a3, a4);
  v7 = [(PGCityFeatureExtractor *)self labelsForVersion:a3];
  v8 = (void *)MEMORY[0x1E4F71F18];
  v9 = +[PGGraphMomentNode addressOfMoment];
  v19[0] = v9;
  v10 = +[PGGraphAddressNode cityOfAddress];
  v19[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v12 = [v8 chain:v11];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __48__PGCityFeatureExtractor_initWithVersion_error___block_invoke;
  v17[3] = &unk_1E68E9D98;
  id v18 = v6;
  v16.receiver = self;
  v16.super_class = (Class)PGCityFeatureExtractor;
  id v13 = v6;
  v14 = [(MARelationCollectionFeatureExtractor *)&v16 initWithName:@"City" featureNames:v7 relation:v12 labelForTargetBlock:v17];

  return v14;
}

id __48__PGCityFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
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

+ (id)unlocalizedCityNameFromCityName:(id)a3 countryCode:(id)a4 fromCityManager:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 length] && objc_msgSend(v8, "length"))
  {
    v10 = [v9 citiesMatchingName:v7];
    v11 = [v10 firstObject];

    if (v11
      && ([v11 unlocalizedName],
          v12 = objc_claimAutoreleasedReturnValue(),
          uint64_t v13 = [v12 length],
          v12,
          v13))
    {
      v14 = NSString;
      v15 = [v11 unlocalizedName];
      objc_super v16 = [v14 stringWithFormat:@"%@_%@", v15, v8];
    }
    else
    {
      objc_super v16 = &stru_1F283BC78;
    }
  }
  else
  {
    objc_super v16 = &stru_1F283BC78;
  }

  return v16;
}

@end
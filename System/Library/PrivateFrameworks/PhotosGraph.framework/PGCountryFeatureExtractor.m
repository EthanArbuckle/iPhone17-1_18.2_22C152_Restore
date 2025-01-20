@interface PGCountryFeatureExtractor
+ (id)_labelsForVersion:(int64_t)a3;
- (PGCountryFeatureExtractor)initWithError:(id *)a3;
- (PGCountryFeatureExtractor)initWithVersion:(int64_t)a3 graph:(id)a4 error:(id *)a5;
@end

@implementation PGCountryFeatureExtractor

- (PGCountryFeatureExtractor)initWithVersion:(int64_t)a3 graph:(id)a4 error:(id *)a5
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v6 = [(id)objc_opt_class() _labelsForVersion:a3];
  v7 = (void *)MEMORY[0x1E4F71F18];
  v8 = +[PGGraphMomentNode addressOfMoment];
  v15[0] = v8;
  v9 = +[PGGraphAddressNode countryOfAddress];
  v15[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v11 = [v7 chain:v10];

  v14.receiver = self;
  v14.super_class = (Class)PGCountryFeatureExtractor;
  v12 = [(PGGraphFeatureExtractor *)&v14 initWithName:@"Country" featureNames:v6 relation:v11 labelForTargetBlock:&__block_literal_global_43833];

  return v12;
}

uint64_t __57__PGCountryFeatureExtractor_initWithVersion_graph_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (PGCountryFeatureExtractor)initWithError:(id *)a3
{
  return [(PGCountryFeatureExtractor *)self initWithVersion:1 graph:0 error:a3];
}

+ (id)_labelsForVersion:(int64_t)a3
{
  if (a3 == 1) {
    return &unk_1F28D44D0;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

@end
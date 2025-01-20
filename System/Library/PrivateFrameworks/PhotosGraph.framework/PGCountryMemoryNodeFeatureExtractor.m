@interface PGCountryMemoryNodeFeatureExtractor
+ (id)_labelsForVersion:(int64_t)a3;
- (PGCountryMemoryNodeFeatureExtractor)initWithError:(id *)a3;
- (PGCountryMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 graph:(id)a4 error:(id *)a5;
@end

@implementation PGCountryMemoryNodeFeatureExtractor

- (PGCountryMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 graph:(id)a4 error:(id *)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v6 = [(id)objc_opt_class() _labelsForVersion:a3];
  v7 = (void *)MEMORY[0x1E4F71F18];
  v8 = +[PGGraphLocationCountryNode filter];
  v9 = [v8 relation];
  v15[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v11 = [v7 chain:v10];

  v14.receiver = self;
  v14.super_class = (Class)PGCountryMemoryNodeFeatureExtractor;
  v12 = [(PGGraphMemoryNodeFeatureExtractor *)&v14 initWithName:@"Country" featureNames:v6 relation:v11 labelForTargetBlock:&__block_literal_global_81];

  return v12;
}

uint64_t __67__PGCountryMemoryNodeFeatureExtractor_initWithVersion_graph_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (PGCountryMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  return [(PGCountryMemoryNodeFeatureExtractor *)self initWithVersion:1 graph:0 error:a3];
}

+ (id)_labelsForVersion:(int64_t)a3
{
  if (a3 == 1) {
    return &unk_1F28D44E8;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

@end
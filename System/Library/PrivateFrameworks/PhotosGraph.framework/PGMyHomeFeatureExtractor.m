@interface PGMyHomeFeatureExtractor
- (PGMyHomeFeatureExtractor)initWithError:(id *)a3;
@end

@implementation PGMyHomeFeatureExtractor

- (PGMyHomeFeatureExtractor)initWithError:(id *)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v17[0] = @"Home";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v5 = (void *)MEMORY[0x1E4F71F18];
  v6 = +[PGGraphMomentNode addressOfMoment];
  v16[0] = v6;
  v7 = +[PGGraphAddressNode homeOfAddress];
  v16[1] = v7;
  v8 = +[PGGraphHomeWorkNode ownerOfHomeWork];
  v16[2] = v8;
  v9 = +[PGGraphMeNode filter];
  v10 = [v9 relation];
  v16[3] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  v12 = [v5 chain:v11];

  v15.receiver = self;
  v15.super_class = (Class)PGMyHomeFeatureExtractor;
  v13 = [(PGGraphFeatureExtractor *)&v15 initWithName:@"MyHome" featureNames:v4 relation:v12 labelForTargetBlock:&__block_literal_global_36261];

  return v13;
}

__CFString *__42__PGMyHomeFeatureExtractor_initWithError___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isMeNode]) {
    v2 = @"Home";
  }
  else {
    v2 = 0;
  }
  return v2;
}

@end
@interface PGInvariantCoworkerFeatureExtractor
- (PGInvariantCoworkerFeatureExtractor)initWithError:(id *)a3;
@end

@implementation PGInvariantCoworkerFeatureExtractor

- (PGInvariantCoworkerFeatureExtractor)initWithError:(id *)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F76B80];
  uint64_t v4 = v17[0];
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v6 = (void *)MEMORY[0x1E4F71F18];
  v7 = +[PGGraphMomentNode personInMoment];
  v16[0] = v7;
  v8 = +[PGGraphPersonNode coworkerOfPerson];
  v16[1] = v8;
  v9 = +[PGGraphMeNode filter];
  v10 = [v9 relation];
  v16[2] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
  v12 = [v6 chain:v11];

  v15.receiver = self;
  v15.super_class = (Class)PGInvariantCoworkerFeatureExtractor;
  v13 = [(PGGraphFeatureExtractor *)&v15 initWithName:v4 featureNames:v5 relation:v12 labelForTargetBlock:&__block_literal_global_22839];

  return v13;
}

id __53__PGInvariantCoworkerFeatureExtractor_initWithError___block_invoke()
{
  return (id)*MEMORY[0x1E4F76B80];
}

@end
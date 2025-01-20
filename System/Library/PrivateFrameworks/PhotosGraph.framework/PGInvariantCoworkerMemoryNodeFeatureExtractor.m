@interface PGInvariantCoworkerMemoryNodeFeatureExtractor
- (PGInvariantCoworkerMemoryNodeFeatureExtractor)initWithError:(id *)a3;
@end

@implementation PGInvariantCoworkerMemoryNodeFeatureExtractor

- (PGInvariantCoworkerMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v18[0] = *MEMORY[0x1E4F76B80];
  uint64_t v4 = v18[0];
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v6 = (void *)MEMORY[0x1E4F71F18];
  v7 = +[PGGraphPersonNode filterExcludingMe];
  v8 = [v7 relation];
  v17[0] = v8;
  v9 = +[PGGraphPersonNode coworkerOfPerson];
  v17[1] = v9;
  v10 = +[PGGraphMeNode filter];
  v11 = [v10 relation];
  v17[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  v13 = [v6 chain:v12];

  v16.receiver = self;
  v16.super_class = (Class)PGInvariantCoworkerMemoryNodeFeatureExtractor;
  v14 = [(PGGraphMemoryNodeFeatureExtractor *)&v16 initWithName:v4 featureNames:v5 relation:v13 labelForTargetBlock:&__block_literal_global_7_22847];

  return v14;
}

id __63__PGInvariantCoworkerMemoryNodeFeatureExtractor_initWithError___block_invoke()
{
  return (id)*MEMORY[0x1E4F76B80];
}

@end
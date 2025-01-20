@interface PGInvariantBrotherMemoryNodeFeatureExtractor
- (PGInvariantBrotherMemoryNodeFeatureExtractor)initWithError:(id *)a3;
@end

@implementation PGInvariantBrotherMemoryNodeFeatureExtractor

- (PGInvariantBrotherMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v18[0] = @"BROTHER";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v5 = (void *)MEMORY[0x1E4F71F18];
  v6 = +[PGGraphPersonNode filterExcludingMe];
  v7 = [v6 relation];
  v17[0] = v7;
  v8 = +[PGGraphPersonNode brotherOfPerson];
  v9 = [v8 inverse];
  v17[1] = v9;
  v10 = +[PGGraphMeNode filter];
  v11 = [v10 relation];
  v17[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  v13 = [v5 chain:v12];

  v16.receiver = self;
  v16.super_class = (Class)PGInvariantBrotherMemoryNodeFeatureExtractor;
  v14 = [(PGGraphMemoryNodeFeatureExtractor *)&v16 initWithName:@"BROTHER" featureNames:v4 relation:v13 labelForTargetBlock:&__block_literal_global_7_38888];

  return v14;
}

__CFString *__62__PGInvariantBrotherMemoryNodeFeatureExtractor_initWithError___block_invoke()
{
  v0 = @"BROTHER";
  return @"BROTHER";
}

@end
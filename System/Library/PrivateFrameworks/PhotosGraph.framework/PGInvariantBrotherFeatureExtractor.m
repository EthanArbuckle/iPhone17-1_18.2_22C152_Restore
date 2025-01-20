@interface PGInvariantBrotherFeatureExtractor
- (PGInvariantBrotherFeatureExtractor)initWithError:(id *)a3;
@end

@implementation PGInvariantBrotherFeatureExtractor

- (PGInvariantBrotherFeatureExtractor)initWithError:(id *)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v17[0] = @"BROTHER";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v5 = (void *)MEMORY[0x1E4F71F18];
  v6 = +[PGGraphMomentNode personInMoment];
  v16[0] = v6;
  v7 = +[PGGraphPersonNode brotherOfPerson];
  v8 = [v7 inverse];
  v16[1] = v8;
  v9 = +[PGGraphMeNode filter];
  v10 = [v9 relation];
  v16[2] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
  v12 = [v5 chain:v11];

  v15.receiver = self;
  v15.super_class = (Class)PGInvariantBrotherFeatureExtractor;
  v13 = [(PGGraphFeatureExtractor *)&v15 initWithName:@"BROTHER" featureNames:v4 relation:v12 labelForTargetBlock:&__block_literal_global_38880];

  return v13;
}

__CFString *__52__PGInvariantBrotherFeatureExtractor_initWithError___block_invoke()
{
  v0 = @"BROTHER";
  return @"BROTHER";
}

@end
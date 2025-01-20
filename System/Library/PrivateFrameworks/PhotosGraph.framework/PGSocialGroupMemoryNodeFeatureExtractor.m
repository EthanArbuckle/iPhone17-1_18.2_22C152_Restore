@interface PGSocialGroupMemoryNodeFeatureExtractor
- (PGSocialGroupMemoryNodeFeatureExtractor)initWithError:(id *)a3;
@end

@implementation PGSocialGroupMemoryNodeFeatureExtractor

- (PGSocialGroupMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v14[0] = @"SocialGroup";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v5 = (void *)MEMORY[0x1E4F71F18];
  v6 = +[PGGraphSocialGroupNode filter];
  v7 = [v6 relation];
  v13 = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v9 = [v5 chain:v8];

  v12.receiver = self;
  v12.super_class = (Class)PGSocialGroupMemoryNodeFeatureExtractor;
  v10 = [(PGGraphMemoryNodeFeatureExtractor *)&v12 initWithName:@"CHILD" featureNames:v4 relation:v9 labelForTargetBlock:&__block_literal_global_232];

  return v10;
}

__CFString *__57__PGSocialGroupMemoryNodeFeatureExtractor_initWithError___block_invoke()
{
  v0 = @"SocialGroup";
  return @"SocialGroup";
}

@end
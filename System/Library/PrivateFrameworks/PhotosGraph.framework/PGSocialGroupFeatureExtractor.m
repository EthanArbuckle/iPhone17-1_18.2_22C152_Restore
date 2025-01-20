@interface PGSocialGroupFeatureExtractor
- (PGSocialGroupFeatureExtractor)initWithError:(id *)a3;
@end

@implementation PGSocialGroupFeatureExtractor

- (PGSocialGroupFeatureExtractor)initWithError:(id *)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v13[0] = @"SocialGroup";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v5 = (void *)MEMORY[0x1E4F71F18];
  v6 = +[PGGraphMomentNode socialGroupInMoment];
  v12 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  v8 = [v5 chain:v7];

  v11.receiver = self;
  v11.super_class = (Class)PGSocialGroupFeatureExtractor;
  v9 = [(PGGraphFeatureExtractor *)&v11 initWithName:@"CHILD" featureNames:v4 relation:v8 labelForTargetBlock:&__block_literal_global_16827];

  return v9;
}

__CFString *__47__PGSocialGroupFeatureExtractor_initWithError___block_invoke()
{
  v0 = @"SocialGroup";
  return @"SocialGroup";
}

@end
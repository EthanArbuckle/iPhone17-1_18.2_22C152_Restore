@interface PGMoodSourceSceneDistribution
+ (BOOL)shouldUseSceneIdentifier:(id)a3;
- (double)weight;
@end

@implementation PGMoodSourceSceneDistribution

- (double)weight
{
  v4.receiver = self;
  v4.super_class = (Class)PGMoodSourceSceneDistribution;
  [(PGMoodSourceScene *)&v4 weight];
  return (v2 + v2) / 3.0;
}

+ (BOOL)shouldUseSceneIdentifier:(id)a3
{
  return [a3 isDistributed];
}

@end
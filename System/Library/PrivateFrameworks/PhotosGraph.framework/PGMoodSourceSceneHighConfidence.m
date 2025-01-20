@interface PGMoodSourceSceneHighConfidence
+ (BOOL)shouldUseSceneIdentifier:(id)a3;
- (double)weight;
@end

@implementation PGMoodSourceSceneHighConfidence

- (double)weight
{
  v4.receiver = self;
  v4.super_class = (Class)PGMoodSourceSceneHighConfidence;
  [(PGMoodSourceScene *)&v4 weight];
  return v2 / 3.0;
}

+ (BOOL)shouldUseSceneIdentifier:(id)a3
{
  return [a3 isHighConfidence];
}

@end
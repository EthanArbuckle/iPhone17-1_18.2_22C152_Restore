@interface NTPBScoreProfileDebug(FCAdditions)
- (id)contentTriggerScores;
- (id)featureWeightsByID;
- (id)nicheContentScores;
- (id)scoringAssetsIdentifier;
- (id)tagWeightsByID;
- (void)setContentTriggerScores:()FCAdditions;
- (void)setFeatureWeightsByID:()FCAdditions;
- (void)setNicheContentScores:()FCAdditions;
- (void)setScoringAssetsIdentifier:()FCAdditions;
- (void)setTagWeightsByID:()FCAdditions;
@end

@implementation NTPBScoreProfileDebug(FCAdditions)

- (id)nicheContentScores
{
  return objc_getAssociatedObject(a1, (const void *)nicheContentScoresKey);
}

- (void)setNicheContentScores:()FCAdditions
{
}

- (id)contentTriggerScores
{
  return objc_getAssociatedObject(a1, (const void *)contentTriggerScoresKey);
}

- (void)setContentTriggerScores:()FCAdditions
{
}

- (id)tagWeightsByID
{
  return objc_getAssociatedObject(a1, (const void *)tagWeightsByIDKey);
}

- (void)setTagWeightsByID:()FCAdditions
{
}

- (id)featureWeightsByID
{
  return objc_getAssociatedObject(a1, (const void *)featureWeightsByIDKey);
}

- (void)setFeatureWeightsByID:()FCAdditions
{
}

- (id)scoringAssetsIdentifier
{
  return objc_getAssociatedObject(a1, (const void *)scoringAssetsIdentifierKey);
}

- (void)setScoringAssetsIdentifier:()FCAdditions
{
}

@end
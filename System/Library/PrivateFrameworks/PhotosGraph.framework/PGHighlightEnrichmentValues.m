@interface PGHighlightEnrichmentValues
- (BOOL)clearCurations;
- (BOOL)hasChanges;
- (BOOL)smartDescriptionMixedUpdated;
- (BOOL)smartDescriptionPrivateUpdated;
- (BOOL)smartDescriptionSharedUpdated;
- (BOOL)verboseSmartDescriptionMixedUpdated;
- (BOOL)verboseSmartDescriptionPrivateUpdated;
- (BOOL)verboseSmartDescriptionSharedUpdated;
- (NSArray)extendedCuration;
- (NSArray)summaryCuration;
- (NSDictionary)momentProcessedLocationByMomentUUID;
- (NSDictionary)momentTitleByMomentUUID;
- (NSMapTable)visibilityScoreByAsset;
- (NSNumber)mixedSharingCompositionKeyAssetRelationshipValue;
- (NSString)smartDescriptionMixed;
- (NSString)smartDescriptionPrivate;
- (NSString)smartDescriptionShared;
- (NSString)verboseSmartDescriptionMixed;
- (NSString)verboseSmartDescriptionPrivate;
- (NSString)verboseSmartDescriptionShared;
- (PGHighlightEnrichmentValues)initWithHighlight:(id)a3;
- (PGHighlightModel)highlight;
- (PHAsset)keyAssetPrivate;
- (PHAsset)keyAssetShared;
- (double)promotionScore;
- (id)description;
- (unint64_t)mood;
- (unsigned)enrichmentState;
- (void)setClearCurations:(BOOL)a3;
- (void)setEnrichmentState:(unsigned __int16)a3;
- (void)setExtendedCuration:(id)a3;
- (void)setKeyAssetPrivate:(id)a3;
- (void)setKeyAssetShared:(id)a3;
- (void)setMixedSharingCompositionKeyAssetRelationshipValue:(id)a3;
- (void)setMomentProcessedLocationByMomentUUID:(id)a3;
- (void)setMomentTitleByMomentUUID:(id)a3;
- (void)setMood:(unint64_t)a3;
- (void)setPromotionScore:(double)a3;
- (void)setSmartDescriptionMixed:(id)a3;
- (void)setSmartDescriptionPrivate:(id)a3;
- (void)setSmartDescriptionShared:(id)a3;
- (void)setSummaryCuration:(id)a3;
- (void)setVerboseSmartDescriptionMixed:(id)a3;
- (void)setVerboseSmartDescriptionPrivate:(id)a3;
- (void)setVerboseSmartDescriptionShared:(id)a3;
- (void)setVisibilityScoreByAsset:(id)a3;
@end

@implementation PGHighlightEnrichmentValues

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityScoreByAsset, 0);
  objc_storeStrong((id *)&self->_momentProcessedLocationByMomentUUID, 0);
  objc_storeStrong((id *)&self->_momentTitleByMomentUUID, 0);
  objc_storeStrong((id *)&self->_summaryCuration, 0);
  objc_storeStrong((id *)&self->_extendedCuration, 0);
  objc_storeStrong((id *)&self->_mixedSharingCompositionKeyAssetRelationshipValue, 0);
  objc_storeStrong((id *)&self->_keyAssetShared, 0);
  objc_storeStrong((id *)&self->_keyAssetPrivate, 0);
  objc_storeStrong((id *)&self->_verboseSmartDescriptionMixed, 0);
  objc_storeStrong((id *)&self->_smartDescriptionMixed, 0);
  objc_storeStrong((id *)&self->_verboseSmartDescriptionShared, 0);
  objc_storeStrong((id *)&self->_smartDescriptionShared, 0);
  objc_storeStrong((id *)&self->_verboseSmartDescriptionPrivate, 0);
  objc_storeStrong((id *)&self->_smartDescriptionPrivate, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
}

- (void)setEnrichmentState:(unsigned __int16)a3
{
  self->_enrichmentState = a3;
}

- (unsigned)enrichmentState
{
  return self->_enrichmentState;
}

- (void)setVisibilityScoreByAsset:(id)a3
{
}

- (NSMapTable)visibilityScoreByAsset
{
  return self->_visibilityScoreByAsset;
}

- (void)setMood:(unint64_t)a3
{
  self->_mood = a3;
}

- (unint64_t)mood
{
  return self->_mood;
}

- (void)setMomentProcessedLocationByMomentUUID:(id)a3
{
}

- (NSDictionary)momentProcessedLocationByMomentUUID
{
  return self->_momentProcessedLocationByMomentUUID;
}

- (void)setMomentTitleByMomentUUID:(id)a3
{
}

- (NSDictionary)momentTitleByMomentUUID
{
  return self->_momentTitleByMomentUUID;
}

- (void)setSummaryCuration:(id)a3
{
}

- (NSArray)summaryCuration
{
  return self->_summaryCuration;
}

- (void)setExtendedCuration:(id)a3
{
}

- (NSArray)extendedCuration
{
  return self->_extendedCuration;
}

- (void)setMixedSharingCompositionKeyAssetRelationshipValue:(id)a3
{
}

- (NSNumber)mixedSharingCompositionKeyAssetRelationshipValue
{
  return self->_mixedSharingCompositionKeyAssetRelationshipValue;
}

- (void)setKeyAssetShared:(id)a3
{
}

- (PHAsset)keyAssetShared
{
  return self->_keyAssetShared;
}

- (void)setKeyAssetPrivate:(id)a3
{
}

- (PHAsset)keyAssetPrivate
{
  return self->_keyAssetPrivate;
}

- (void)setPromotionScore:(double)a3
{
  self->_promotionScore = a3;
}

- (double)promotionScore
{
  return self->_promotionScore;
}

- (void)setClearCurations:(BOOL)a3
{
  self->_clearCurations = a3;
}

- (BOOL)clearCurations
{
  return self->_clearCurations;
}

- (PGHighlightModel)highlight
{
  return self->_highlight;
}

- (void)setVerboseSmartDescriptionMixed:(id)a3
{
  id v6 = a3;
  if ([v6 length]) {
    v4 = (NSString *)[v6 copy];
  }
  else {
    v4 = (NSString *)@"\t";
  }
  verboseSmartDescriptionMixed = self->_verboseSmartDescriptionMixed;
  self->_verboseSmartDescriptionMixed = v4;
}

- (void)setSmartDescriptionMixed:(id)a3
{
  id v6 = a3;
  if ([v6 length]) {
    v4 = (NSString *)[v6 copy];
  }
  else {
    v4 = (NSString *)@"\t";
  }
  smartDescriptionMixed = self->_smartDescriptionMixed;
  self->_smartDescriptionMixed = v4;
}

- (void)setVerboseSmartDescriptionShared:(id)a3
{
  id v6 = a3;
  if ([v6 length]) {
    v4 = (NSString *)[v6 copy];
  }
  else {
    v4 = (NSString *)@"\t";
  }
  verboseSmartDescriptionShared = self->_verboseSmartDescriptionShared;
  self->_verboseSmartDescriptionShared = v4;
}

- (void)setSmartDescriptionShared:(id)a3
{
  id v6 = a3;
  if ([v6 length]) {
    v4 = (NSString *)[v6 copy];
  }
  else {
    v4 = (NSString *)@"\t";
  }
  smartDescriptionShared = self->_smartDescriptionShared;
  self->_smartDescriptionShared = v4;
}

- (void)setVerboseSmartDescriptionPrivate:(id)a3
{
  id v6 = a3;
  if ([v6 length]) {
    v4 = (NSString *)[v6 copy];
  }
  else {
    v4 = (NSString *)@"\t";
  }
  verboseSmartDescriptionPrivate = self->_verboseSmartDescriptionPrivate;
  self->_verboseSmartDescriptionPrivate = v4;
}

- (void)setSmartDescriptionPrivate:(id)a3
{
  id v6 = a3;
  if ([v6 length]) {
    v4 = (NSString *)[v6 copy];
  }
  else {
    v4 = (NSString *)@"\t";
  }
  smartDescriptionPrivate = self->_smartDescriptionPrivate;
  self->_smartDescriptionPrivate = v4;
}

- (NSString)verboseSmartDescriptionMixed
{
  if ((__CFString *)self->_verboseSmartDescriptionMixed == @"\t") {
    return (NSString *)0;
  }
  else {
    return self->_verboseSmartDescriptionMixed;
  }
}

- (NSString)smartDescriptionMixed
{
  if ((__CFString *)self->_smartDescriptionMixed == @"\t") {
    return (NSString *)0;
  }
  else {
    return self->_smartDescriptionMixed;
  }
}

- (NSString)verboseSmartDescriptionShared
{
  if ((__CFString *)self->_verboseSmartDescriptionShared == @"\t") {
    return (NSString *)0;
  }
  else {
    return self->_verboseSmartDescriptionShared;
  }
}

- (NSString)smartDescriptionShared
{
  if ((__CFString *)self->_smartDescriptionShared == @"\t") {
    return (NSString *)0;
  }
  else {
    return self->_smartDescriptionShared;
  }
}

- (NSString)verboseSmartDescriptionPrivate
{
  if ((__CFString *)self->_verboseSmartDescriptionPrivate == @"\t") {
    return (NSString *)0;
  }
  else {
    return self->_verboseSmartDescriptionPrivate;
  }
}

- (NSString)smartDescriptionPrivate
{
  if ((__CFString *)self->_smartDescriptionPrivate == @"\t") {
    return (NSString *)0;
  }
  else {
    return self->_smartDescriptionPrivate;
  }
}

- (BOOL)verboseSmartDescriptionMixedUpdated
{
  return self->_verboseSmartDescriptionMixed != 0;
}

- (BOOL)smartDescriptionMixedUpdated
{
  return self->_smartDescriptionMixed != 0;
}

- (BOOL)verboseSmartDescriptionSharedUpdated
{
  return self->_verboseSmartDescriptionShared != 0;
}

- (BOOL)smartDescriptionSharedUpdated
{
  return self->_smartDescriptionShared != 0;
}

- (BOOL)verboseSmartDescriptionPrivateUpdated
{
  return self->_verboseSmartDescriptionPrivate != 0;
}

- (BOOL)smartDescriptionPrivateUpdated
{
  return self->_smartDescriptionPrivate != 0;
}

- (BOOL)hasChanges
{
  return self->_clearCurations
      || self->_promotionScore != -1.0
      || self->_smartDescriptionPrivate
      || self->_verboseSmartDescriptionPrivate
      || self->_smartDescriptionShared
      || self->_verboseSmartDescriptionShared
      || self->_smartDescriptionMixed
      || self->_verboseSmartDescriptionMixed
      || self->_keyAssetPrivate
      || self->_keyAssetShared
      || self->_mixedSharingCompositionKeyAssetRelationshipValue
      || self->_extendedCuration
      || self->_summaryCuration
      || self->_momentTitleByMomentUUID
      || self->_momentProcessedLocationByMomentUUID
      || self->_mood != -1
      || self->_visibilityScoreByAsset
      || (__int16)self->_enrichmentState != -1;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)PGHighlightEnrichmentValues;
  v4 = [(PGHighlightEnrichmentValues *)&v9 description];
  if ([(PGHighlightEnrichmentValues *)self hasChanges]) {
    v5 = @"Yes";
  }
  else {
    v5 = @"No";
  }
  id v6 = PHShortDescriptionForPhotosHighlightEnrichmentState();
  v7 = [v3 stringWithFormat:@"%@ - hasChanges: %@, enrichmentState: %@", v4, v5, v6];

  return v7;
}

- (PGHighlightEnrichmentValues)initWithHighlight:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGHighlightEnrichmentValues;
  id v6 = [(PGHighlightEnrichmentValues *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_highlight, a3);
    v7->_mood = -1;
    v7->_promotionScore = -1.0;
    v7->_enrichmentState = -1;
  }

  return v7;
}

@end
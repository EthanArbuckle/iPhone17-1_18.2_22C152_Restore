@interface PHSuggestion(PhotosUICore)
+ (uint64_t)px_keyAssetFilteringPredicate;
- (uint64_t)px_isFeaturedPhoto;
@end

@implementation PHSuggestion(PhotosUICore)

- (uint64_t)px_isFeaturedPhoto
{
  v2 = [MEMORY[0x1E4F39310] allFeaturedStateEnabledSuggestionTypesForWidget];
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(a1, "type"));
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

+ (uint64_t)px_keyAssetFilteringPredicate
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(additionalAttributes.importedBy != %d) AND (kindSubtype != %d)", 7, 10);
}

@end
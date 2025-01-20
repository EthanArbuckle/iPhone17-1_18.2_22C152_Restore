@interface WKTextManipulationItem
@end

@implementation WKTextManipulationItem

uint64_t __96___WKTextManipulationItem_SafariSharedExtras__safari_textManipulationItemWithTranslationResult___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E4F467B8], "safari_tokenWithTranslationAlignmentRepresentation:", a2);
}

id __79___WKTextManipulationItem_SafariSharedExtras__safari_updateTranslationRequest___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(a2, "safari_translationRangeRepresentation");
  v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v5 = [v4 BOOLForKey:*MEMORY[0x1E4F988E0]];

  if (v5)
  {
    v6 = [v3 metaInfo];
    v7 = (void *)[v6 mutableCopy];

    v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isSubframe"));
    [v7 setObject:v8 forKeyedSubscript:@"isInSubframe"];

    v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isCrossSiteSubframe"));
    [v7 setObject:v9 forKeyedSubscript:@"isInCrossSiteSubframe"];

    [v3 setMetaInfo:v7];
  }
  return v3;
}

uint64_t __105___WKTextManipulationItem_SafariSharedExtras__safari_isEqualToManipulationItem_includingContentEquality___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = objc_msgSend(a2, "safari_isEqualToManipulationToken:includingContentEquality:", a3, *(unsigned __int8 *)(a1 + 40));
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a5 = 1;
  }
  return result;
}

id __84___WKTextManipulationItem_SafariSharedExtras___safari_descriptionPreservingPrivacy___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    objc_msgSend(a2, "safari_privacyPreservingDescription");
  }
  else {
  v2 = objc_msgSend(a2, "safari_debugDescription");
  }
  return v2;
}

uint64_t __78___WKTextManipulationItem_SafariSharedExtras__safari_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_dictionaryRepresentation");
}

@end
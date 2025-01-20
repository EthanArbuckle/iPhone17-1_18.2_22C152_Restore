@interface PHSuggestion(PGSuggestion)
- (id)features;
- (id)keyAssets;
- (id)representativeAssets;
- (id)suggestedPersonLocalIdentifiers;
- (uint64_t)containsUnverifiedPersons;
- (uint64_t)notificationQuality;
- (uint64_t)relevanceDurationInDays;
@end

@implementation PHSuggestion(PGSuggestion)

- (uint64_t)relevanceDurationInDays
{
  return 0;
}

- (uint64_t)notificationQuality
{
  return 0;
}

- (uint64_t)containsUnverifiedPersons
{
  v1 = [a1 featuresProperties];
  v2 = [v1 objectForKeyedSubscript:@"containsUnverifiedPersons"];

  uint64_t v3 = [v2 BOOLValue];
  return v3;
}

- (id)suggestedPersonLocalIdentifiers
{
  v1 = [a1 featuresProperties];
  v2 = [v1 objectForKeyedSubscript:@"suggestedPersonLocalIdentifiers"];

  return v2;
}

- (id)features
{
  v1 = [a1 featuresProperties];
  v2 = [v1 objectForKeyedSubscript:@"features"];

  uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithArray:v2];

  return v3;
}

- (id)representativeAssets
{
  v2 = objc_getAssociatedObject(a1, "PHSuggestionPGSuggestionRepresentativeAssets");
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:a1 options:0];
    v2 = [v3 fetchedObjects];
    objc_setAssociatedObject(a1, "PHSuggestionPGSuggestionRepresentativeAssets", v2, (void *)1);
  }

  return v2;
}

- (id)keyAssets
{
  v2 = objc_getAssociatedObject(a1, "PHSuggestionPGSuggestionKeyAssets");
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F38EB8] fetchKeyAssetsInAssetCollection:a1 options:0];
    v2 = [v3 fetchedObjects];
    objc_setAssociatedObject(a1, "PHSuggestionPGSuggestionKeyAssets", v2, (void *)1);
  }

  return v2;
}

@end
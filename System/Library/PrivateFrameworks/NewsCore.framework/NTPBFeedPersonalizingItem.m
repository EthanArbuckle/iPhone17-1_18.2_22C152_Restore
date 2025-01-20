@interface NTPBFeedPersonalizingItem
@end

@implementation NTPBFeedPersonalizingItem

void __73__NTPBFeedPersonalizingItem_FCAdditions__enumerateTopicCohortsWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 tagID];
  v4 = [v3 cohorts];

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

void __81__NTPBFeedPersonalizingItem_FCAdditions__enumerateTopicConversionStatsWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 tagID];
  v4 = [v3 conversionStats];

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

@end
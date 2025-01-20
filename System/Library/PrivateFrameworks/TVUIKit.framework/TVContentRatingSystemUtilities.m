@interface TVContentRatingSystemUtilities
@end

@implementation TVContentRatingSystemUtilities

void __64___TVContentRatingSystemUtilities__ratingSystemLookUpDictionary__block_invoke()
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  for (uint64_t i = 0; i != 2480; i += 16)
  {
    v1 = [NSNumber numberWithInteger:*(__CFString **)((char *)&__RatingSystems + i + 8)];
    [v4 setObject:v1 forKey:*(__CFString **)((char *)&__RatingSystems + i)];
  }
  uint64_t v2 = [v4 copy];
  v3 = (void *)_ratingSystemLookUpDictionary___ratingSystemLookUpDictionary;
  _ratingSystemLookUpDictionary___ratingSystemLookUpDictionary = v2;
}

void __70___TVContentRatingSystemUtilities__ratingSystemStringLookUpDictionary__block_invoke()
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  for (uint64_t i = 0; i != 2480; i += 16)
  {
    uint64_t v1 = *(uint64_t *)((char *)&__RatingSystems + i);
    uint64_t v2 = [NSNumber numberWithInteger:*(__CFString **)((char *)&__RatingSystems + i + 8)];
    [v5 setObject:v1 forKey:v2];
  }
  uint64_t v3 = [v5 copy];
  id v4 = (void *)_ratingSystemStringLookUpDictionary___ratingSystemStringLookUpDictionary;
  _ratingSystemStringLookUpDictionary___ratingSystemStringLookUpDictionary = v3;
}

@end
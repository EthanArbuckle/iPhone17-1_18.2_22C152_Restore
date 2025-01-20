@interface VUIContentRatingSystemUtilities
+ (BOOL)_isRatingSystemForMovies:(int64_t)a3;
+ (BOOL)_isRatingSystemForMusic:(int64_t)a3;
+ (BOOL)_isRatingSystemForTV:(int64_t)a3;
+ (id)_cleanedRatingSystem:(id)a3;
+ (id)_ratingSystemLookUpDictionary;
+ (id)_ratingSystemStringLookUpDictionary;
+ (id)stringForRatingSystem:(int64_t)a3;
+ (int64_t)ratingSystemForString:(id)a3;
+ (int64_t)ratingSystemKindForRatingSystem:(int64_t)a3;
@end

@implementation VUIContentRatingSystemUtilities

+ (int64_t)ratingSystemForString:(id)a3
{
  id v4 = a3;
  v5 = [a1 _ratingSystemLookUpDictionary];
  v6 = [a1 _cleanedRatingSystem:v4];
  v7 = [v5 objectForKey:v6];

  if (!v7)
  {
    v8 = [v4 stringByAppendingString:@"s"];
    v7 = [v5 objectForKey:v8];
  }
  int64_t v9 = [v7 unsignedIntegerValue];

  return v9;
}

+ (id)stringForRatingSystem:(int64_t)a3
{
  id v4 = [a1 _ratingSystemStringLookUpDictionary];
  v5 = [NSNumber numberWithInteger:a3];
  v6 = [v4 objectForKey:v5];

  return v6;
}

+ (int64_t)ratingSystemKindForRatingSystem:(int64_t)a3
{
  if (objc_msgSend(a1, "_isRatingSystemForMovies:")) {
    return 1;
  }
  if ([a1 _isRatingSystemForTV:a3]) {
    return 2;
  }
  if ([a1 _isRatingSystemForMusic:a3]) {
    return 3;
  }
  return 0;
}

+ (BOOL)_isRatingSystemForMovies:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 0x8C;
}

+ (BOOL)_isRatingSystemForMusic:(int64_t)a3
{
  return a3 == 1;
}

+ (BOOL)_isRatingSystemForTV:(int64_t)a3
{
  return (unint64_t)(a3 - 142) < 0xC;
}

+ (id)_ratingSystemLookUpDictionary
{
  if (_ratingSystemLookUpDictionary___once != -1) {
    dispatch_once(&_ratingSystemLookUpDictionary___once, &__block_literal_global_1);
  }
  v2 = (void *)_ratingSystemLookUpDictionary___ratingSystemLookUpDictionary;
  return v2;
}

void __64__VUIContentRatingSystemUtilities__ratingSystemLookUpDictionary__block_invoke()
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  for (uint64_t i = 0; i != 2496; i += 16)
  {
    v1 = [NSNumber numberWithInteger:*(__CFString **)((char *)&__RatingSystems + i + 8)];
    [v4 setObject:v1 forKey:*(__CFString **)((char *)&__RatingSystems + i)];
  }
  uint64_t v2 = [v4 copy];
  v3 = (void *)_ratingSystemLookUpDictionary___ratingSystemLookUpDictionary;
  _ratingSystemLookUpDictionary___ratingSystemLookUpDictionary = v2;
}

+ (id)_ratingSystemStringLookUpDictionary
{
  if (_ratingSystemStringLookUpDictionary___once != -1) {
    dispatch_once(&_ratingSystemStringLookUpDictionary___once, &__block_literal_global_4);
  }
  uint64_t v2 = (void *)_ratingSystemStringLookUpDictionary___ratingSystemStringLookUpDictionary;
  return v2;
}

void __70__VUIContentRatingSystemUtilities__ratingSystemStringLookUpDictionary__block_invoke()
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  for (uint64_t i = 0; i != 2496; i += 16)
  {
    uint64_t v1 = *(uint64_t *)((char *)&__RatingSystems + i);
    uint64_t v2 = [NSNumber numberWithInteger:*(__CFString **)((char *)&__RatingSystems + i + 8)];
    [v5 setObject:v1 forKey:v2];
  }
  uint64_t v3 = [v5 copy];
  id v4 = (void *)_ratingSystemStringLookUpDictionary___ratingSystemStringLookUpDictionary;
  _ratingSystemStringLookUpDictionary___ratingSystemStringLookUpDictionary = v3;
}

+ (id)_cleanedRatingSystem:(id)a3
{
  uint64_t v3 = [a3 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F3DEFD80];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  id v5 = [v4 lowercaseString];

  return v5;
}

@end
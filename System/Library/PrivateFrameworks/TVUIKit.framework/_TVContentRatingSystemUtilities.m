@interface _TVContentRatingSystemUtilities
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

@implementation _TVContentRatingSystemUtilities

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
  return (unint64_t)(a3 - 142) < 0xB;
}

+ (id)_ratingSystemLookUpDictionary
{
  if (_ratingSystemLookUpDictionary___once != -1) {
    dispatch_once(&_ratingSystemLookUpDictionary___once, &__block_literal_global_3);
  }
  v2 = (void *)_ratingSystemLookUpDictionary___ratingSystemLookUpDictionary;
  return v2;
}

+ (id)_ratingSystemStringLookUpDictionary
{
  if (_ratingSystemStringLookUpDictionary___once != -1) {
    dispatch_once(&_ratingSystemStringLookUpDictionary___once, &__block_literal_global_4_0);
  }
  v2 = (void *)_ratingSystemStringLookUpDictionary___ratingSystemStringLookUpDictionary;
  return v2;
}

+ (id)_cleanedRatingSystem:(id)a3
{
  v3 = [a3 stringByReplacingOccurrencesOfString:@" " withString:&stru_26F2B1FA0];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  v5 = [v4 lowercaseString];

  return v5;
}

@end
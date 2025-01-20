@interface MTLibraryLegacyUtil
+ (BOOL)hasBeenPlayedForPlayState:(int64_t)a3;
+ (int64_t)legacyPlayCountForPlayState:(int64_t)a3 playCount:(int64_t)a4;
+ (int64_t)playStateFromHasBeenPlayed:(BOOL)a3 andPlayCount:(int64_t)a4;
@end

@implementation MTLibraryLegacyUtil

+ (int64_t)playStateFromHasBeenPlayed:(BOOL)a3 andPlayCount:(int64_t)a4
{
  int64_t v4 = 1;
  if (!a3) {
    int64_t v4 = 2;
  }
  if (a4 <= 0) {
    return v4;
  }
  else {
    return 0;
  }
}

+ (BOOL)hasBeenPlayedForPlayState:(int64_t)a3
{
  return a3 != 2;
}

+ (int64_t)legacyPlayCountForPlayState:(int64_t)a3 playCount:(int64_t)a4
{
  if ((unint64_t)a4 <= 1) {
    int64_t v4 = 1;
  }
  else {
    int64_t v4 = a4;
  }
  if (a3) {
    return 0;
  }
  else {
    return v4;
  }
}

@end
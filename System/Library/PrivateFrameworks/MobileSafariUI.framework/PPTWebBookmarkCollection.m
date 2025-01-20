@interface PPTWebBookmarkCollection
+ (BOOL)isLockedSync;
+ (BOOL)lockSync;
@end

@implementation PPTWebBookmarkCollection

+ (BOOL)isLockedSync
{
  return 1;
}

+ (BOOL)lockSync
{
  return 1;
}

@end
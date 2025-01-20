@interface NSString(SZAdditions)
- (id)SZ_stringByDeletingTrailingSlashes;
@end

@implementation NSString(SZAdditions)

- (id)SZ_stringByDeletingTrailingSlashes
{
  v1 = [a1 stringByAppendingPathComponent:@"XX_REMOVEME_XX"];
  v2 = [v1 stringByDeletingLastPathComponent];

  return v2;
}

@end
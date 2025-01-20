@interface NSString
- (NSString)SZ_stringByDeletingTrailingSlashes;
@end

@implementation NSString

- (NSString)SZ_stringByDeletingTrailingSlashes
{
  v2 = [(NSString *)self stringByAppendingPathComponent:@"XX_REMOVEME_XX"];
  v3 = [v2 stringByDeletingLastPathComponent];

  return (NSString *)v3;
}

@end
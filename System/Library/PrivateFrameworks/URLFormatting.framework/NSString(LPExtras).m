@interface NSString(LPExtras)
- (id)_lp_userVisibleHost;
@end

@implementation NSString(LPExtras)

- (id)_lp_userVisibleHost
{
  encodeHostName(a1);
  v1 = (NSString *)objc_claimAutoreleasedReturnValue();
  v2 = decodeHostName(v1);

  return v2;
}

@end
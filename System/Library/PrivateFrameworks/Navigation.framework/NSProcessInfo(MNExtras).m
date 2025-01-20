@interface NSProcessInfo(MNExtras)
- (uint64_t)_navigation_isNavd;
@end

@implementation NSProcessInfo(MNExtras)

- (uint64_t)_navigation_isNavd
{
  v1 = [a1 processName];
  uint64_t v2 = [v1 isEqualToString:@"navd"];

  return v2;
}

@end
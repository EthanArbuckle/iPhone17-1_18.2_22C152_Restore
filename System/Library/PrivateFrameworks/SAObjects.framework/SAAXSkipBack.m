@interface SAAXSkipBack
+ (id)skipBack;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAAXSkipBack

- (id)groupIdentifier
{
  return @"com.apple.ace.accessibility";
}

- (id)encodedClassName
{
  return @"SkipBack";
}

+ (id)skipBack
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
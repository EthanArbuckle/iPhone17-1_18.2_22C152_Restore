@interface SAAXSkipAhead
+ (id)skipAhead;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAAXSkipAhead

- (id)groupIdentifier
{
  return @"com.apple.ace.accessibility";
}

- (id)encodedClassName
{
  return @"SkipAhead";
}

+ (id)skipAhead
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
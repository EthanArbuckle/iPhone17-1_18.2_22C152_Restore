@interface SAHLGetActiveWorkoutApplicationIdentifier
+ (id)getActiveWorkoutApplicationIdentifier;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAHLGetActiveWorkoutApplicationIdentifier

- (id)groupIdentifier
{
  return @"com.apple.ace.health";
}

- (id)encodedClassName
{
  return @"GetActiveWorkoutApplicationIdentifier";
}

+ (id)getActiveWorkoutApplicationIdentifier
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
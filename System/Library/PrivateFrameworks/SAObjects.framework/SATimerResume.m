@interface SATimerResume
+ (id)resume;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SATimerResume

- (id)groupIdentifier
{
  return @"com.apple.ace.timer";
}

- (id)encodedClassName
{
  return @"Resume";
}

+ (id)resume
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
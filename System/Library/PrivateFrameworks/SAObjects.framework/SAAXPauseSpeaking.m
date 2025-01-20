@interface SAAXPauseSpeaking
+ (id)pauseSpeaking;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAAXPauseSpeaking

- (id)groupIdentifier
{
  return @"com.apple.ace.accessibility";
}

- (id)encodedClassName
{
  return @"PauseSpeaking";
}

+ (id)pauseSpeaking
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
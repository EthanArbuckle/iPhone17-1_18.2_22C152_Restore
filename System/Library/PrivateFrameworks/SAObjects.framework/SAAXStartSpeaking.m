@interface SAAXStartSpeaking
+ (id)startSpeaking;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAAXStartSpeaking

- (id)groupIdentifier
{
  return @"com.apple.ace.accessibility";
}

- (id)encodedClassName
{
  return @"StartSpeaking";
}

+ (id)startSpeaking
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
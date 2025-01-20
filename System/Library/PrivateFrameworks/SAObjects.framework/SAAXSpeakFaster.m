@interface SAAXSpeakFaster
+ (id)speakFaster;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAAXSpeakFaster

- (id)groupIdentifier
{
  return @"com.apple.ace.accessibility";
}

- (id)encodedClassName
{
  return @"SpeakFaster";
}

+ (id)speakFaster
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
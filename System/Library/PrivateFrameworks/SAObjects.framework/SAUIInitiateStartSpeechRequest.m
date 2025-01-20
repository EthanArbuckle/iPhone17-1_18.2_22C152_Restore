@interface SAUIInitiateStartSpeechRequest
+ (id)initiateStartSpeechRequest;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAUIInitiateStartSpeechRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"InitiateStartSpeechRequest";
}

+ (id)initiateStartSpeechRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
@interface SASSpeechRecognitionComplete
+ (id)speechRecognitionComplete;
- (BOOL)requiresResponse;
- (NSString)sessionId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSessionId:(id)a3;
@end

@implementation SASSpeechRecognitionComplete

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"SpeechRecognitionComplete";
}

+ (id)speechRecognitionComplete
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)sessionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sessionId"];
}

- (void)setSessionId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
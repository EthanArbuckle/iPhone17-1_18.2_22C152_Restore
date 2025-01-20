@interface SATTSSpeechSynthesisStreamingEnd
+ (id)speechSynthesisStreamingEnd;
- (BOOL)requiresResponse;
- (NSString)errorMessage;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)count;
- (int64_t)errorCode;
- (void)setCount:(int64_t)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorMessage:(id)a3;
@end

@implementation SATTSSpeechSynthesisStreamingEnd

- (id)groupIdentifier
{
  return @"com.apple.ace.tts";
}

- (id)encodedClassName
{
  return @"SpeechSynthesisStreamingEnd";
}

+ (id)speechSynthesisStreamingEnd
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)count
{
  return AceObjectIntegerForProperty(self, @"count");
}

- (void)setCount:(int64_t)a3
{
}

- (int64_t)errorCode
{
  return AceObjectIntegerForProperty(self, @"errorCode");
}

- (void)setErrorCode:(int64_t)a3
{
}

- (NSString)errorMessage
{
  return (NSString *)[(AceObject *)self propertyForKey:@"errorMessage"];
}

- (void)setErrorMessage:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
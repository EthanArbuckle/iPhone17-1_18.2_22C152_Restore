@interface SATTSSpeechSynthesisFailure
+ (id)speechSynthesisFailure;
- (BOOL)requiresResponse;
- (NSString)reason;
- (NSString)reasonDescription;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)errorCode;
- (void)setErrorCode:(int64_t)a3;
- (void)setReason:(id)a3;
- (void)setReasonDescription:(id)a3;
@end

@implementation SATTSSpeechSynthesisFailure

- (id)groupIdentifier
{
  return @"com.apple.ace.tts";
}

- (id)encodedClassName
{
  return @"SpeechSynthesisFailure";
}

+ (id)speechSynthesisFailure
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)errorCode
{
  return AceObjectIntegerForProperty(self, @"errorCode");
}

- (void)setErrorCode:(int64_t)a3
{
}

- (NSString)reason
{
  return (NSString *)[(AceObject *)self propertyForKey:@"reason"];
}

- (void)setReason:(id)a3
{
}

- (NSString)reasonDescription
{
  return (NSString *)[(AceObject *)self propertyForKey:@"reasonDescription"];
}

- (void)setReasonDescription:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
@interface SASSpeechFailure
+ (id)speechFailure;
- (BOOL)requiresResponse;
- (NSString)reasonDescription;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int)reason;
- (int64_t)errorCode;
- (void)setErrorCode:(int64_t)a3;
- (void)setReason:(int)a3;
- (void)setReasonDescription:(id)a3;
@end

@implementation SASSpeechFailure

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"SpeechFailure";
}

+ (id)speechFailure
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

- (int)reason
{
  id v2 = [(AceObject *)self propertyForKey:@"reason"];
  int v3 = SASSpeechFailureReasonForString(v2);

  return v3;
}

- (void)setReason:(int)a3
{
  stringForSASSpeechFailureReason(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  AceObjectSetCopyingObjectForProperty(self, @"reason", v4);
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
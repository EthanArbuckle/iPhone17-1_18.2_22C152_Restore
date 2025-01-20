@interface SASAbortSpeechRequest
+ (id)abortSpeechRequest;
- (BOOL)requiresResponse;
- (NSString)reason;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setReason:(id)a3;
@end

@implementation SASAbortSpeechRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"AbortSpeechRequest";
}

+ (id)abortSpeechRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)reason
{
  return (NSString *)[(AceObject *)self propertyForKey:@"reason"];
}

- (void)setReason:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
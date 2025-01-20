@interface SASSpeechPartialResult
+ (id)speechPartialResult;
- (BOOL)requiresResponse;
- (NSArray)tokens;
- (NSString)language;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLanguage:(id)a3;
- (void)setTokens:(id)a3;
@end

@implementation SASSpeechPartialResult

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"SpeechPartialResult";
}

+ (id)speechPartialResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)language
{
  return (NSString *)[(AceObject *)self propertyForKey:@"language"];
}

- (void)setLanguage:(id)a3
{
}

- (NSArray)tokens
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"tokens", v3);
}

- (void)setTokens:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
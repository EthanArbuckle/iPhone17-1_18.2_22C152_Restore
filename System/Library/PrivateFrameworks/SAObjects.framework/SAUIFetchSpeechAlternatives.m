@interface SAUIFetchSpeechAlternatives
+ (id)fetchSpeechAlternatives;
- (BOOL)requiresResponse;
- (NSString)requestId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRequestId:(id)a3;
@end

@implementation SAUIFetchSpeechAlternatives

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"FetchSpeechAlternatives";
}

+ (id)fetchSpeechAlternatives
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)requestId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"requestId"];
}

- (void)setRequestId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
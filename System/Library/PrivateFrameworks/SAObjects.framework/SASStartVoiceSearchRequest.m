@interface SASStartVoiceSearchRequest
+ (id)startVoiceSearchRequest;
- (BOOL)requiresResponse;
- (NSArray)searchTypes;
- (NSDictionary)headers;
- (NSDictionary)queryParameters;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHeaders:(id)a3;
- (void)setQueryParameters:(id)a3;
- (void)setSearchTypes:(id)a3;
@end

@implementation SASStartVoiceSearchRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"StartVoiceSearchRequest";
}

+ (id)startVoiceSearchRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDictionary)headers
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"headers"];
}

- (void)setHeaders:(id)a3
{
}

- (NSDictionary)queryParameters
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"queryParameters"];
}

- (void)setQueryParameters:(id)a3
{
}

- (NSArray)searchTypes
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"searchTypes"];
}

- (void)setSearchTypes:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
@interface SASVoiceSearchResult
+ (id)voiceSearchResult;
- (NSData)result;
- (NSDictionary)headers;
- (NSNumber)statusCode;
- (NSString)searchType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHeaders:(id)a3;
- (void)setResult:(id)a3;
- (void)setSearchType:(id)a3;
- (void)setStatusCode:(id)a3;
@end

@implementation SASVoiceSearchResult

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"VoiceSearchResult";
}

+ (id)voiceSearchResult
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

- (NSData)result
{
  return (NSData *)[(AceObject *)self propertyForKey:@"result"];
}

- (void)setResult:(id)a3
{
}

- (NSString)searchType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"searchType"];
}

- (void)setSearchType:(id)a3
{
}

- (NSNumber)statusCode
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"statusCode"];
}

- (void)setStatusCode:(id)a3
{
}

@end
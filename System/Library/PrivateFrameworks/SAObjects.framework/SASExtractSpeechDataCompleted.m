@interface SASExtractSpeechDataCompleted
+ (id)extractSpeechDataCompleted;
- (BOOL)requiresResponse;
- (NSData)speechData;
- (NSString)speechDataUrl;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSpeechData:(id)a3;
- (void)setSpeechDataUrl:(id)a3;
@end

@implementation SASExtractSpeechDataCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"ExtractSpeechDataCompleted";
}

+ (id)extractSpeechDataCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)speechData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"speechData"];
}

- (void)setSpeechData:(id)a3
{
}

- (NSString)speechDataUrl
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speechDataUrl"];
}

- (void)setSpeechDataUrl:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
@interface SAMicroblogGetTwitterCredential
+ (id)getTwitterCredential;
- (BOOL)requiresResponse;
- (NSString)consumerKey;
- (NSString)consumerSecret;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setConsumerKey:(id)a3;
- (void)setConsumerSecret:(id)a3;
@end

@implementation SAMicroblogGetTwitterCredential

- (id)groupIdentifier
{
  return @"com.apple.ace.microblog";
}

- (id)encodedClassName
{
  return @"GetTwitterCredential";
}

+ (id)getTwitterCredential
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)consumerKey
{
  return (NSString *)[(AceObject *)self propertyForKey:@"consumerKey"];
}

- (void)setConsumerKey:(id)a3
{
}

- (NSString)consumerSecret
{
  return (NSString *)[(AceObject *)self propertyForKey:@"consumerSecret"];
}

- (void)setConsumerSecret:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
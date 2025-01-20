@interface SAParsecContext
+ (id)parsecContext;
- (NSData)httpBody;
- (NSDictionary)httpHeaders;
- (NSString)httpMethod;
- (NSString)httpUrl;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHttpBody:(id)a3;
- (void)setHttpHeaders:(id)a3;
- (void)setHttpMethod:(id)a3;
- (void)setHttpUrl:(id)a3;
@end

@implementation SAParsecContext

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ParsecContext";
}

+ (id)parsecContext
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)httpBody
{
  return (NSData *)[(AceObject *)self propertyForKey:@"httpBody"];
}

- (void)setHttpBody:(id)a3
{
}

- (NSDictionary)httpHeaders
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"httpHeaders"];
}

- (void)setHttpHeaders:(id)a3
{
}

- (NSString)httpMethod
{
  return (NSString *)[(AceObject *)self propertyForKey:@"httpMethod"];
}

- (void)setHttpMethod:(id)a3
{
}

- (NSString)httpUrl
{
  return (NSString *)[(AceObject *)self propertyForKey:@"httpUrl"];
}

- (void)setHttpUrl:(id)a3
{
}

@end
@interface SAEndpointService
+ (id)endpointService;
- (NSString)serverUrl;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setServerUrl:(id)a3;
@end

@implementation SAEndpointService

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"EndpointService";
}

+ (id)endpointService
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)serverUrl
{
  return (NSString *)[(AceObject *)self propertyForKey:@"serverUrl"];
}

- (void)setServerUrl:(id)a3
{
}

@end
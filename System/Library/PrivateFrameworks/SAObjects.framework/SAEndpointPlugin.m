@interface SAEndpointPlugin
+ (id)endpointPlugin;
- (NSString)pluginPath;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPluginPath:(id)a3;
@end

@implementation SAEndpointPlugin

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"EndpointPlugin";
}

+ (id)endpointPlugin
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)pluginPath
{
  return (NSString *)[(AceObject *)self propertyForKey:@"pluginPath"];
}

- (void)setPluginPath:(id)a3
{
}

@end
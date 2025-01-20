@interface SAUIPluginSnippet
- (NSData)modelData;
- (NSString)bundleName;
- (NSString)responseViewId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBundleName:(id)a3;
- (void)setModelData:(id)a3;
- (void)setResponseViewId:(id)a3;
@end

@implementation SAUIPluginSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"PluginSnippet";
}

- (NSString)bundleName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"bundleName"];
}

- (void)setBundleName:(id)a3
{
}

- (NSData)modelData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"modelData"];
}

- (void)setModelData:(id)a3
{
}

- (NSString)responseViewId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"responseViewId"];
}

- (void)setResponseViewId:(id)a3
{
}

@end
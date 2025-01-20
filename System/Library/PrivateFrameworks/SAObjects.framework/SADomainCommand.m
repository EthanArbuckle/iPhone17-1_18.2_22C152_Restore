@interface SADomainCommand
+ (id)domainCommand;
- (BOOL)requiresResponse;
- (NSNumber)timeout;
- (NSURL)targetAppId;
- (NSURL)targetPluginId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTargetAppId:(id)a3;
- (void)setTargetPluginId:(id)a3;
- (void)setTimeout:(id)a3;
@end

@implementation SADomainCommand

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DomainCommand";
}

+ (id)domainCommand
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)targetAppId
{
  return (NSURL *)AceObjectURLForProperty(self, @"targetAppId");
}

- (void)setTargetAppId:(id)a3
{
}

- (NSURL)targetPluginId
{
  return (NSURL *)AceObjectURLForProperty(self, @"targetPluginId");
}

- (void)setTargetPluginId:(id)a3
{
}

- (NSNumber)timeout
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"timeout"];
}

- (void)setTimeout:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
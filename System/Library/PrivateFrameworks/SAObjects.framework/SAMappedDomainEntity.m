@interface SAMappedDomainEntity
- (NSData)usoGraphPayload;
- (NSString)appBundleId;
- (NSString)identifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppBundleId:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setUsoGraphPayload:(id)a3;
@end

@implementation SAMappedDomainEntity

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"MappedDomainEntity";
}

- (NSString)appBundleId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appBundleId"];
}

- (void)setAppBundleId:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"identifier"];
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)usoGraphPayload
{
  return (NSData *)[(AceObject *)self propertyForKey:@"usoGraphPayload"];
}

- (void)setUsoGraphPayload:(id)a3
{
}

@end
@interface SASource
+ (id)source;
- (NSNumber)remote;
- (NSString)accountIdentifier;
- (NSString)accountName;
- (NSString)domainIdentifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountName:(id)a3;
- (void)setDomainIdentifier:(id)a3;
- (void)setRemote:(id)a3;
@end

@implementation SASource

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"Source";
}

+ (id)source
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)accountIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"accountIdentifier"];
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)accountName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"accountName"];
}

- (void)setAccountName:(id)a3
{
}

- (NSString)domainIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"domainIdentifier"];
}

- (void)setDomainIdentifier:(id)a3
{
}

- (NSNumber)remote
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"remote"];
}

- (void)setRemote:(id)a3
{
}

@end
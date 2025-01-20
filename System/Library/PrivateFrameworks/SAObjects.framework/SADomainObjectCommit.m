@interface SADomainObjectCommit
+ (id)domainObjectCommit;
- (BOOL)requiresResponse;
- (SADomainObject)identifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIdentifier:(id)a3;
@end

@implementation SADomainObjectCommit

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DomainObjectCommit";
}

+ (id)domainObjectCommit
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SADomainObject)identifier
{
  return (SADomainObject *)AceObjectAceObjectForProperty(self, @"identifier");
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
@interface SADomainObjectCancel
+ (id)domainObjectCancel;
- (BOOL)requiresResponse;
- (SADomainObject)identifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIdentifier:(id)a3;
@end

@implementation SADomainObjectCancel

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DomainObjectCancel";
}

+ (id)domainObjectCancel
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
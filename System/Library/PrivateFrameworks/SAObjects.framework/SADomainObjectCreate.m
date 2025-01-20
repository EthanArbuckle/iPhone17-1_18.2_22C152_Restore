@interface SADomainObjectCreate
+ (id)domainObjectCreate;
- (BOOL)requiresResponse;
- (SADomainObject)object;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setObject:(id)a3;
@end

@implementation SADomainObjectCreate

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DomainObjectCreate";
}

+ (id)domainObjectCreate
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SADomainObject)object
{
  return (SADomainObject *)AceObjectAceObjectForProperty(self, @"object");
}

- (void)setObject:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
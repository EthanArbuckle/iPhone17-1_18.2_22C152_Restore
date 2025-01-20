@interface SADomainObjectPunchOut
+ (id)domainObjectPunchOut;
- (BOOL)requiresResponse;
- (SADomainObject)domainItem;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDomainItem:(id)a3;
@end

@implementation SADomainObjectPunchOut

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DomainObjectPunchOut";
}

+ (id)domainObjectPunchOut
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SADomainObject)domainItem
{
  return (SADomainObject *)AceObjectAceObjectForProperty(self, @"domainItem");
}

- (void)setDomainItem:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
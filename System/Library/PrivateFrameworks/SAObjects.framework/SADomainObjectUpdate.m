@interface SADomainObjectUpdate
+ (id)domainObjectUpdate;
- (BOOL)requiresResponse;
- (SADomainObject)addFields;
- (SADomainObject)identifier;
- (SADomainObject)removeFields;
- (SADomainObject)setFields;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAddFields:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRemoveFields:(id)a3;
- (void)setSetFields:(id)a3;
@end

@implementation SADomainObjectUpdate

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DomainObjectUpdate";
}

+ (id)domainObjectUpdate
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SADomainObject)addFields
{
  return (SADomainObject *)AceObjectAceObjectForProperty(self, @"addFields");
}

- (void)setAddFields:(id)a3
{
}

- (SADomainObject)identifier
{
  return (SADomainObject *)AceObjectAceObjectForProperty(self, @"identifier");
}

- (void)setIdentifier:(id)a3
{
}

- (SADomainObject)removeFields
{
  return (SADomainObject *)AceObjectAceObjectForProperty(self, @"removeFields");
}

- (void)setRemoveFields:(id)a3
{
}

- (SADomainObject)setFields
{
  return (SADomainObject *)AceObjectAceObjectForProperty(self, @"setFields");
}

- (void)setSetFields:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
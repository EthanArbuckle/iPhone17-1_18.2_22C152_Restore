@interface SADomainObjectRetrieve
+ (id)domainObjectRetrieve;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)identifiers;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIdentifiers:(id)a3;
@end

@implementation SADomainObjectRetrieve

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DomainObjectRetrieve";
}

+ (id)domainObjectRetrieve
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)identifiers
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"identifiers", v3);
}

- (void)setIdentifiers:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
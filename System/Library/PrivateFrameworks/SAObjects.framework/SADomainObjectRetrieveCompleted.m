@interface SADomainObjectRetrieveCompleted
+ (id)domainObjectRetrieveCompleted;
- (BOOL)requiresResponse;
- (NSArray)objects;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setObjects:(id)a3;
@end

@implementation SADomainObjectRetrieveCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DomainObjectRetrieveCompleted";
}

+ (id)domainObjectRetrieveCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)objects
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"objects", v3);
}

- (void)setObjects:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
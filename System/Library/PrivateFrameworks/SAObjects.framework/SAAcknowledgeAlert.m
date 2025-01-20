@interface SAAcknowledgeAlert
+ (id)acknowledgeAlert;
- (BOOL)requiresResponse;
- (SADomainObject)object;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setObject:(id)a3;
@end

@implementation SAAcknowledgeAlert

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"AcknowledgeAlert";
}

+ (id)acknowledgeAlert
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
  return 0;
}

@end
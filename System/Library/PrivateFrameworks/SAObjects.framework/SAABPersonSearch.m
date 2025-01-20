@interface SAABPersonSearch
+ (id)personSearch;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSDate)birthday;
- (NSNumber)me;
- (NSString)company;
- (NSString)name;
- (NSString)relationship;
- (NSString)scope;
- (NSURL)accountIdentifier;
- (SAEmail)email;
- (SALocation)address;
- (SAPhone)phone;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAccountIdentifier:(id)a3;
- (void)setAddress:(id)a3;
- (void)setBirthday:(id)a3;
- (void)setCompany:(id)a3;
- (void)setEmail:(id)a3;
- (void)setMe:(id)a3;
- (void)setName:(id)a3;
- (void)setPhone:(id)a3;
- (void)setRelationship:(id)a3;
- (void)setScope:(id)a3;
@end

@implementation SAABPersonSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.contact";
}

- (id)encodedClassName
{
  return @"PersonSearch";
}

+ (id)personSearch
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)accountIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"accountIdentifier");
}

- (void)setAccountIdentifier:(id)a3
{
}

- (SALocation)address
{
  return (SALocation *)AceObjectAceObjectForProperty(self, @"address");
}

- (void)setAddress:(id)a3
{
}

- (NSDate)birthday
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"birthday"];
}

- (void)setBirthday:(id)a3
{
}

- (NSString)company
{
  return (NSString *)[(AceObject *)self propertyForKey:@"company"];
}

- (void)setCompany:(id)a3
{
}

- (SAEmail)email
{
  return (SAEmail *)AceObjectAceObjectForProperty(self, @"email");
}

- (void)setEmail:(id)a3
{
}

- (NSNumber)me
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"me"];
}

- (void)setMe:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

- (SAPhone)phone
{
  return (SAPhone *)AceObjectAceObjectForProperty(self, @"phone");
}

- (void)setPhone:(id)a3
{
}

- (NSString)relationship
{
  return (NSString *)[(AceObject *)self propertyForKey:@"relationship"];
}

- (void)setRelationship:(id)a3
{
}

- (NSString)scope
{
  return (NSString *)[(AceObject *)self propertyForKey:@"scope"];
}

- (void)setScope:(id)a3
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
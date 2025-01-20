@interface SAReminderListSearch
+ (id)listSearch;
- (BOOL)requiresResponse;
- (NSString)accountName;
- (NSString)name;
- (SAReminderTrigger)trigger;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAccountName:(id)a3;
- (void)setName:(id)a3;
- (void)setTrigger:(id)a3;
@end

@implementation SAReminderListSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.reminder";
}

- (id)encodedClassName
{
  return @"ListSearch";
}

+ (id)listSearch
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)accountName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"accountName"];
}

- (void)setAccountName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

- (SAReminderTrigger)trigger
{
  return (SAReminderTrigger *)AceObjectAceObjectForProperty(self, @"trigger");
}

- (void)setTrigger:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
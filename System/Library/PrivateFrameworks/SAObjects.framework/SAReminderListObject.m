@interface SAReminderListObject
+ (id)listObject;
- (NSArray)reminders;
- (NSArray)remindersToCreate;
- (NSNumber)totalNumOfReminders;
- (NSString)accountName;
- (NSString)name;
- (SAReminderRecurrence)recurrence;
- (SAReminderTrigger)reminderTrigger;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAccountName:(id)a3;
- (void)setName:(id)a3;
- (void)setRecurrence:(id)a3;
- (void)setReminderTrigger:(id)a3;
- (void)setReminders:(id)a3;
- (void)setRemindersToCreate:(id)a3;
- (void)setTotalNumOfReminders:(id)a3;
@end

@implementation SAReminderListObject

- (id)groupIdentifier
{
  return @"com.apple.ace.reminder";
}

- (id)encodedClassName
{
  return @"ListObject";
}

+ (id)listObject
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

- (SAReminderRecurrence)recurrence
{
  return (SAReminderRecurrence *)AceObjectAceObjectForProperty(self, @"recurrence");
}

- (void)setRecurrence:(id)a3
{
}

- (SAReminderTrigger)reminderTrigger
{
  return (SAReminderTrigger *)AceObjectAceObjectForProperty(self, @"reminderTrigger");
}

- (void)setReminderTrigger:(id)a3
{
}

- (NSArray)reminders
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"reminders", v3);
}

- (void)setReminders:(id)a3
{
}

- (NSArray)remindersToCreate
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"remindersToCreate", v3);
}

- (void)setRemindersToCreate:(id)a3
{
}

- (NSNumber)totalNumOfReminders
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"totalNumOfReminders"];
}

- (void)setTotalNumOfReminders:(id)a3
{
}

@end
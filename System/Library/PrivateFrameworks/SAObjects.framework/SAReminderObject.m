@interface SAReminderObject
+ (id)object;
- (BOOL)completed;
- (BOOL)important;
- (NSArray)lists;
- (NSDate)dueDate;
- (NSString)alternateSubject;
- (NSString)dueDateTimeZoneId;
- (NSString)subject;
- (SAReminderListObject)toList;
- (SAReminderPayload)payload;
- (SAReminderRecurrence)recurrence;
- (SAReminderTrigger)trigger;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlternateSubject:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setDueDate:(id)a3;
- (void)setDueDateTimeZoneId:(id)a3;
- (void)setImportant:(BOOL)a3;
- (void)setLists:(id)a3;
- (void)setPayload:(id)a3;
- (void)setRecurrence:(id)a3;
- (void)setSubject:(id)a3;
- (void)setToList:(id)a3;
- (void)setTrigger:(id)a3;
@end

@implementation SAReminderObject

- (id)groupIdentifier
{
  return @"com.apple.ace.reminder";
}

- (id)encodedClassName
{
  return @"Object";
}

+ (id)object
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)alternateSubject
{
  return (NSString *)[(AceObject *)self propertyForKey:@"alternateSubject"];
}

- (void)setAlternateSubject:(id)a3
{
}

- (BOOL)completed
{
  return AceObjectBoolForProperty(self, @"completed");
}

- (void)setCompleted:(BOOL)a3
{
}

- (NSDate)dueDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"dueDate"];
}

- (void)setDueDate:(id)a3
{
}

- (NSString)dueDateTimeZoneId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"dueDateTimeZoneId"];
}

- (void)setDueDateTimeZoneId:(id)a3
{
}

- (BOOL)important
{
  return AceObjectBoolForProperty(self, @"important");
}

- (void)setImportant:(BOOL)a3
{
}

- (NSArray)lists
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"lists", v3);
}

- (void)setLists:(id)a3
{
}

- (SAReminderPayload)payload
{
  return (SAReminderPayload *)AceObjectAceObjectForProperty(self, @"payload");
}

- (void)setPayload:(id)a3
{
}

- (SAReminderRecurrence)recurrence
{
  return (SAReminderRecurrence *)AceObjectAceObjectForProperty(self, @"recurrence");
}

- (void)setRecurrence:(id)a3
{
}

- (NSString)subject
{
  return (NSString *)[(AceObject *)self propertyForKey:@"subject"];
}

- (void)setSubject:(id)a3
{
}

- (SAReminderListObject)toList
{
  return (SAReminderListObject *)AceObjectAceObjectForProperty(self, @"toList");
}

- (void)setToList:(id)a3
{
}

- (SAReminderTrigger)trigger
{
  return (SAReminderTrigger *)AceObjectAceObjectForProperty(self, @"trigger");
}

- (void)setTrigger:(id)a3
{
}

@end
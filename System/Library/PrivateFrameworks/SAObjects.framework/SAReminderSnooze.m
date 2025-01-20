@interface SAReminderSnooze
+ (id)snooze;
- (BOOL)requiresResponse;
- (NSArray)reminderIdentifierList;
- (SAReminderDateTimeTriggerOffset)offset;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setOffset:(id)a3;
- (void)setReminderIdentifierList:(id)a3;
@end

@implementation SAReminderSnooze

- (id)groupIdentifier
{
  return @"com.apple.ace.reminder";
}

- (id)encodedClassName
{
  return @"Snooze";
}

+ (id)snooze
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAReminderDateTimeTriggerOffset)offset
{
  return (SAReminderDateTimeTriggerOffset *)AceObjectAceObjectForProperty(self, @"offset");
}

- (void)setOffset:(id)a3
{
}

- (NSArray)reminderIdentifierList
{
  return (NSArray *)AceObjectURLArrayForProperty(self, @"reminderIdentifierList");
}

- (void)setReminderIdentifierList:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
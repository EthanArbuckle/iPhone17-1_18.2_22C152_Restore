@interface SAReminderSnippet
+ (id)snippet;
- (NSArray)reminderLists;
- (NSArray)reminders;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setReminderLists:(id)a3;
- (void)setReminders:(id)a3;
@end

@implementation SAReminderSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.reminder";
}

- (id)encodedClassName
{
  return @"Snippet";
}

+ (id)snippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)reminderLists
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"reminderLists", v3);
}

- (void)setReminderLists:(id)a3
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

@end
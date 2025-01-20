@interface WFLinkReminderEntityDescriptions
+ (id)countDescription;
+ (id)pluralTypeDescription;
+ (id)typeDescription;
@end

@implementation WFLinkReminderEntityDescriptions

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Reminders");
}

+ (id)pluralTypeDescription
{
  return WFLocalizedStringResourceWithKey(@"Reminders (plural)", @"Reminders");
}

+ (id)typeDescription
{
  return WFLocalizedStringResourceWithKey(@"Reminder", @"Reminder");
}

@end
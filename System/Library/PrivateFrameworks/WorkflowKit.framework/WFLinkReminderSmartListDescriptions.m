@interface WFLinkReminderSmartListDescriptions
+ (id)countDescription;
+ (id)pluralTypeDescription;
+ (id)typeDescription;
@end

@implementation WFLinkReminderSmartListDescriptions

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Smart Lists");
}

+ (id)pluralTypeDescription
{
  return WFLocalizedStringResourceWithKey(@"Smart Lists (plural)", @"Reminders");
}

+ (id)typeDescription
{
  return WFLocalizedStringResourceWithKey(@"Smart List", @"Smart List");
}

@end
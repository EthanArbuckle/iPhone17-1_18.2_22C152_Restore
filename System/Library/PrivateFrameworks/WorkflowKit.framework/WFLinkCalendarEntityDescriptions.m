@interface WFLinkCalendarEntityDescriptions
+ (id)countDescription;
+ (id)pluralTypeDescription;
+ (id)typeDescription;
@end

@implementation WFLinkCalendarEntityDescriptions

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Calendars");
}

+ (id)pluralTypeDescription
{
  return WFLocalizedStringResourceWithKey(@"Calendars (plural)", @"Calendars");
}

+ (id)typeDescription
{
  return WFLocalizedStringResourceWithKey(@"Calendar", @"Calendar");
}

@end
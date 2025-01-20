@interface WFLinkTabEntityDescriptions
+ (id)countDescription;
+ (id)pluralTypeDescription;
+ (id)typeDescription;
@end

@implementation WFLinkTabEntityDescriptions

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Tabs");
}

+ (id)pluralTypeDescription
{
  return WFLocalizedStringResourceWithKey(@"Tabs (plural)", @"Tabs");
}

+ (id)typeDescription
{
  return WFLocalizedStringResourceWithKey(@"Tab", @"Tab");
}

@end
@interface WFLinkTagEntityDescriptions
+ (id)countDescription;
+ (id)pluralTypeDescription;
+ (id)typeDescription;
@end

@implementation WFLinkTagEntityDescriptions

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Tags");
}

+ (id)pluralTypeDescription
{
  return WFLocalizedStringResourceWithKey(@"Tags (plural)", @"Tags");
}

+ (id)typeDescription
{
  return WFLocalizedStringResourceWithKey(@"Tag", @"Tag");
}

@end
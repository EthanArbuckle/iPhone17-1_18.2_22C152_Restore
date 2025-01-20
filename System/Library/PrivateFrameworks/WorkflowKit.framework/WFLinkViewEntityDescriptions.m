@interface WFLinkViewEntityDescriptions
+ (id)countDescription;
+ (id)pluralTypeDescription;
+ (id)typeDescription;
@end

@implementation WFLinkViewEntityDescriptions

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Views");
}

+ (id)pluralTypeDescription
{
  return WFLocalizedStringResourceWithKey(@"Views (plural)", @"Views");
}

+ (id)typeDescription
{
  return WFLocalizedStringResourceWithKey(@"View", @"View");
}

@end
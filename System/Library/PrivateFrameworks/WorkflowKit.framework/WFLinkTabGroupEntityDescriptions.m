@interface WFLinkTabGroupEntityDescriptions
+ (id)countDescription;
+ (id)pluralTypeDescription;
+ (id)typeDescription;
@end

@implementation WFLinkTabGroupEntityDescriptions

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Tab Groups");
}

+ (id)pluralTypeDescription
{
  return WFLocalizedStringResourceWithKey(@"Tab Groups (plural)", @"Tab Groups");
}

+ (id)typeDescription
{
  return WFLocalizedStringResourceWithKey(@"Tab Group", @"Tab Group");
}

@end
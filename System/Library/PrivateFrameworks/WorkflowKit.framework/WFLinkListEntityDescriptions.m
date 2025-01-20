@interface WFLinkListEntityDescriptions
+ (id)countDescription;
+ (id)pluralTypeDescription;
+ (id)typeDescription;
@end

@implementation WFLinkListEntityDescriptions

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Lists");
}

+ (id)pluralTypeDescription
{
  return WFLocalizedStringResourceWithKey(@"Lists (plural)", @"Lists");
}

+ (id)typeDescription
{
  return WFLocalizedStringResourceWithKey(@"List", @"List");
}

@end
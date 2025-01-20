@interface WFLinkFileEntityDescriptions
+ (id)countDescription;
+ (id)pluralTypeDescription;
+ (id)typeDescription;
@end

@implementation WFLinkFileEntityDescriptions

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Files");
}

+ (id)pluralTypeDescription
{
  return WFLocalizedStringResourceWithKey(@"Files (plural)", @"Files");
}

+ (id)typeDescription
{
  return WFLocalizedStringResourceWithKey(@"Link File", @"File");
}

@end
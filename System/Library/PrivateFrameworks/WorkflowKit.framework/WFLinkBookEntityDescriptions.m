@interface WFLinkBookEntityDescriptions
+ (id)countDescription;
+ (id)pluralTypeDescription;
+ (id)typeDescription;
@end

@implementation WFLinkBookEntityDescriptions

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Books");
}

+ (id)pluralTypeDescription
{
  return WFLocalizedStringResourceWithKey(@"Books (plural)", @"Books");
}

+ (id)typeDescription
{
  return WFLocalizedStringResourceWithKey(@"Book", @"Book");
}

@end
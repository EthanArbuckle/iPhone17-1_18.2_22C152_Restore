@interface WFLinkMessageEntityDescriptions
+ (id)countDescription;
+ (id)pluralTypeDescription;
+ (id)typeDescription;
@end

@implementation WFLinkMessageEntityDescriptions

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Messages");
}

+ (id)pluralTypeDescription
{
  return WFLocalizedStringResourceWithKey(@"Messages (plural)", @"Messages");
}

+ (id)typeDescription
{
  return WFLocalizedStringResourceWithKey(@"Link Message", @"Message");
}

@end
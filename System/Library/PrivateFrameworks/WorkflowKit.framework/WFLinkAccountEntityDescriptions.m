@interface WFLinkAccountEntityDescriptions
+ (id)countDescription;
+ (id)pluralTypeDescription;
+ (id)typeDescription;
@end

@implementation WFLinkAccountEntityDescriptions

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Accounts");
}

+ (id)pluralTypeDescription
{
  return WFLocalizedStringResourceWithKey(@"Accounts (plural)", @"Accounts");
}

+ (id)typeDescription
{
  return WFLocalizedStringResourceWithKey(@"Account", @"Account");
}

@end
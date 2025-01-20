@interface WFLinkMailboxEntityDescriptions
+ (id)countDescription;
+ (id)pluralTypeDescription;
+ (id)typeDescription;
@end

@implementation WFLinkMailboxEntityDescriptions

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Mailboxes");
}

+ (id)pluralTypeDescription
{
  return WFLocalizedStringResourceWithKey(@"Mailboxes (plural)", @"Mailboxes");
}

+ (id)typeDescription
{
  return WFLocalizedStringResourceWithKey(@"Mailbox", @"Mailbox");
}

@end
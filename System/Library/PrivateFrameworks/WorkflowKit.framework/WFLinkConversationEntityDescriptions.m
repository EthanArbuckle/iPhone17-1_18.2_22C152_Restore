@interface WFLinkConversationEntityDescriptions
+ (id)countDescription;
+ (id)pluralTypeDescription;
+ (id)typeDescription;
@end

@implementation WFLinkConversationEntityDescriptions

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Conversations");
}

+ (id)pluralTypeDescription
{
  return WFLocalizedStringResourceWithKey(@"Conversations (plural)", @"Conversations");
}

+ (id)typeDescription
{
  return WFLocalizedStringResourceWithKey(@"Conversation", @"Conversation");
}

@end
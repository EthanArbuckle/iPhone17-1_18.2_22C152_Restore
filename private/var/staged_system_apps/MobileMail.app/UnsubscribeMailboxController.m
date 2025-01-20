@interface UnsubscribeMailboxController
- (BOOL)shouldBeDisplayed;
- (id)criterion;
- (id)iconImageName;
- (id)mailboxTitle;
- (id)shortcutIconName;
- (id)unscopedCountPredicate;
@end

@implementation UnsubscribeMailboxController

- (id)unscopedCountPredicate
{
  return +[EMMessageListItemPredicates predicateForUnsubscribableMessages];
}

- (id)criterion
{
  return +[MFMessageCriterion messageCriterionForUnsubscribeTypeNotMatching:0];
}

- (BOOL)shouldBeDisplayed
{
  return 1;
}

- (id)mailboxTitle
{
  return (id)_EFLocalizedString();
}

- (id)iconImageName
{
  return MFImageGlyphFavoriteUnsubscribeMailbox;
}

- (id)shortcutIconName
{
  return 0;
}

@end
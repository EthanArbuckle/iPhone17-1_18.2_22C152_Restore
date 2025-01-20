@interface SendLaterMailboxController
- (BOOL)alwaysActiveCountQuery;
- (BOOL)shouldBeDisplayed;
- (id)criterion;
- (id)iconImageName;
- (id)mailboxTitle;
- (id)shortcutIconName;
- (id)unscopedCountPredicate;
@end

@implementation SendLaterMailboxController

- (id)unscopedCountPredicate
{
  return +[EMMessageListItemPredicates predicateForSendLaterMessages];
}

- (id)criterion
{
  return +[MFMessageCriterion sendLaterMessageCriterion];
}

- (BOOL)alwaysActiveCountQuery
{
  return 1;
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
  return MFImageGlyphFavoriteSendLaterMailbox;
}

- (id)shortcutIconName
{
  return 0;
}

@end
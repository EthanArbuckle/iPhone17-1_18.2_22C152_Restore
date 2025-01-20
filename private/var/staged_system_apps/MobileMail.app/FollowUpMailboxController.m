@interface FollowUpMailboxController
- (BOOL)shouldBeDisplayed;
- (id)criterion;
- (id)iconImageName;
- (id)mailboxTitle;
- (id)shortcutIconName;
- (id)unscopedCountPredicate;
@end

@implementation FollowUpMailboxController

- (id)criterion
{
  return +[MFMessageCriterion followUpMessageCriterion];
}

- (id)unscopedCountPredicate
{
  return +[EMMessageListItemPredicates predicateForMessagesWithUnfiredFollowUp];
}

- (BOOL)shouldBeDisplayed
{
  return 1;
}

- (id)mailboxTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"FOLLOW_UP_MAILBOX" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)iconImageName
{
  return MFImageGlyphFavoriteFollowUpMailbox;
}

- (id)shortcutIconName
{
  return 0;
}

@end
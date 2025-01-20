@interface ReadLaterMailboxController
- (BOOL)alwaysActiveCountQuery;
- (BOOL)shouldBeDisplayed;
- (id)criterion;
- (id)iconImageName;
- (id)mailboxTitle;
- (id)shortcutIconName;
- (id)unscopedCountPredicate;
@end

@implementation ReadLaterMailboxController

- (id)unscopedCountPredicate
{
  return +[EMMessageListItemPredicates predicateForUnfiredReadLaterMessages];
}

- (id)criterion
{
  return 0;
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
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"READ_LATER_MAILBOX" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)iconImageName
{
  return MFImageGlyphFavoriteReadLaterMailbox;
}

- (id)shortcutIconName
{
  return 0;
}

@end